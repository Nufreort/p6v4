<?php

namespace App\Controller;

use App\Entity\Users;
use App\Form\RegistrationFormType;
use App\Security\EmailVerifier;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mime\Address;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use SymfonyCasts\Bundle\VerifyEmail\Exception\VerifyEmailExceptionInterface;

class RegistrationController extends AbstractController
{
    private $emailVerifier;

    public function __construct(EmailVerifier $emailVerifier)
    {
        $this->emailVerifier = $emailVerifier;
    }

    /**
     * @Route("/register", name="app_register")
     */
    public function register(Request $request, UserPasswordEncoderInterface $passwordEncoder): Response
    {
        $user = new Users();
        $form = $this->createForm(RegistrationFormType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            //  $userPicture = new Media();
            // $user->setUserPicture('userPicture');
            // encode the plain password

            // encode the plain password
            $user->setPassword(
                $passwordEncoder->encodePassword(
                    $user,
                    $form->get('plainPassword')->getData()
                )
            );

            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($user);
            $entityManager->flush();

            // generate a signed url and email it to the user
            $this->emailVerifier->sendEmailConfirmation('app_verify_email', $user,
                (new TemplatedEmail())
                    ->from(new Address('contact@logiciellearing.ldx-ba.com', 'SnowTricks'))
                    ->to($user->getEmail())
                    ->subject('Please Confirm your Email')
                    ->htmlTemplate('registration/confirmation_email.html.twig')
            );
            // do anything else you need here, like send an email
            $this->addFlash('warning', 'Veuillez valider votre adresse e-mail pour vous connecter.');
            return $this->redirectToRoute('app_login');
        }

        return $this->render('registration/register.html.twig', [
            'registrationForm' => $form->createView(),
        ]);
    }

    /**
     * @Route("/verify/email", name="app_verify_email")
     */
    public function verifyUserEmail(Request $request): Response
    {
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');

        // validate email confirmation link, sets User::isVerified=true and persists
        try {
            $this->emailVerifier->handleEmailConfirmation($request, $this->getUser());
        } catch (VerifyEmailExceptionInterface $exception) {
        $this->addFlash('verify_email_error', 'Veuillez valider le lien de confirmation que vous avez reçu par e-mail ou bien créer un compte pour vous connecter.'/* $exception->getReason()*/);

            return $this->redirectToRoute('app_register');
        }

        // @TODO Change the redirect on success and handle or remove the flash message in your templates
        $this->addFlash('success', 'Votre adresse e-mail a bient été vérifiée !');

        return $this->redirectToRoute('app_login');
    }

    /**
     * @Route("/profil", name="app_userProfil")
     */
    public function profilUpdate(): Response
    {
            return $this->render('registration/userProfil.html.twig');
        /*    $form = $this->createForm(RegistrationFormType::class, $user);
            $form->handleRequest($request);
            if($form->isSubmitted() && $form->isValid()){
                $em->flush();
                $this->addFlash('infos','Votre profil a bien été modifiée !');
                return $this->redirectToRoute('app_index');
              }
            return $this->render('registration/userProfil.html.twig', [
              'user' => $user,
              'form' => $form->CreateView()
              ]);*/
    }

    /**
     * @Route("/user/{id}/delete", name="app_userProfilDelete")
     */
    public function userProfilDelete(Request $request, User $users, EntityManagerInterface $em): Response
    {
            if($this->isCsrfTokenValid('userProfilDeleting_' . $users->getId(), $request->request->get('csrf_token'))){
              $em->remove($users);
              $em->flush();

              $session = new Session();
              $session->invalidate();

              //$this->addFlash('infos','Votre profil a bien été supprimée !');

              return $this->redirectToRoute('app_logout');
            }

            return $this->redirectToRoute('app_index');
    }
}
