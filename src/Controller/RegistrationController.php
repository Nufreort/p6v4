<?php

namespace App\Controller;

use App\Entity\Users;
use App\Entity\UsersPictures;
use App\Form\RegistrationFormType;
use App\Form\UserProfilValidatorType;
use App\Repository\UsersPicturesRepository;
use App\Repository\UsersRepository;
use App\Security\EmailVerifier;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mime\Address;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Symfony\Component\Security\Core\User\UserInterface;
use SymfonyCasts\Bundle\VerifyEmail\Exception\VerifyEmailExceptionInterface;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Session\Session;

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
    public function register(Request $request, UserPasswordEncoderInterface $passwordEncoder, UsersPicturesRepository $usersPicturesRepository): Response
    {
        $user = new Users();
        $form = $this->createForm(RegistrationFormType::class, $user);
        $form->handleRequest($request);



        if ($form->isSubmitted() && $form->isValid()) {
            // usersPicutres
              $picture = $form->get('usersPictures')->getData();

              if($picture)
              {
              $fichier = md5(uniqid()).'.'.$picture->guessExtension();

              $picture->move(
                $this->getParameter('usersPictures'),
                $fichier
              );
            }

              $img = new UsersPictures();
              if(isset($fichier)){
                $img->setName($fichier);
              }
              else {
                $img->setName('naruto.png');
              }
              $user->setUsersPictures($img);

            // encode the plain password
            $user->setPassword(
                $passwordEncoder->encodePassword(
                    $user,
                    $form->get('plainPassword')->getData()
                )
            );
            $userValidator = random_int(0 , 9999);

            $user->setValidator($userValidator);
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($user);
            $entityManager->flush();

            // generate a signed url and email it to the user
            $this->emailVerifier->sendEmailConfirmation('app_verify_email', $user,
                (new TemplatedEmail())
                    ->from(new Address('contact@logiciellearing.ldx-ba.com', 'SnowTricks'))
                    ->to($user->getEmail())
                    ->subject('Confirmer votre e-mail')
                    ->htmlTemplate('registration/confirmation_email.html.twig')
                    ->context([
                      'codeValidator' => $userValidator
                    ])
            );
            // do anything else you need here, like send an email
            $this->addFlash('warning', 'Veuillez valider votre adresse e-mail pour vous connecter.');
            return $this->redirectToRoute('app_userProfilValidator');
        }

        return $this->render('registration/register.html.twig', [
            'registrationForm' => $form->createView(),
        ]);
    }

    /**
     * @Route("/verify/email", name="app_verify_email")
     */
    public function verifyUserEmail(Request $request, UsersRepository $usersRepository, UserInterface $user): Response
    {
        // validate email confirmation link, sets User::isVerified=true and persists
        try {
            $this->emailVerifier->handleEmailConfirmation($request, $this->getUser());
        } catch (VerifyEmailExceptionInterface $exception) {
        $this->addFlash('verify_email_error', 'Veuillez valider le lien de confirmation que vous avez reçu par e-mail ou bien créer un compte pour vous connecter.'/* $exception->getReason()*/);

            return $this->redirectToRoute('app_login');
        }

        // @TODO Change the redirect on success and handle or remove the flash message in your templates
        $this->handleEmailConfirmation();
        $this->addFlash('success', 'Votre adresse e-mail a bient été vérifiée !');
        return $this->redirectToRoute('tricks_index');
    }

    /**
     * @Route("/profilValidator", name="app_userProfilValidator")
     */
    public function userProfilValitor(Request $request, UsersPicturesRepository $usersPicturesRepository, UsersRepository $usersRepository): Response
    {

            $users = $usersRepository->findALl();

            $form = $this->createForm(UserProfilValidatorType::class, $users);

              if ($form->isSubmitted() && $form->isValid()) {

                $user = $users->findBy(
                  ['email' => $form->get('email')],
                  ['password' => $form->get('password')],
                  ['validator' => $form->get('codeValidator')]
                );
                dd($user);
                  return $this->redirectToRoute('tricks_index');
              }

            return $this->render('registration/userProfilValidator.html.twig',[
                'userProfilValidator' => $form->createView()
            ]);
    }

    /**
     * @Route("/profil", name="app_userProfil")
     */
    public function userProfil(Request $request, UsersPicturesRepository $usersPicturesRepository, UsersRepository $usersRepository): Response
    {
            $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');
            $user = $this->getUser();

            return $this->render('registration/userProfil.html.twig');
    }

    /**
     * @Route("/user/{id}/delete", name="app_userProfilDelete")
     */
    public function userProfilDelete(Request $request, Users $users, UsersRepository $usersRepository, EntityManagerInterface $em): Response
    {
            $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');

            $userId = $users->getId();
            $user = $usersRepository->findOneBy(['id' => $userId]);

            $session = new Session();
            $session->invalidate();

            $em->remove($user);
            $em->flush();

              //$this->addFlash('infos','Votre profil a bien été supprimée !');

              return $this->redirectToRoute('tricks_index');
    }
}
