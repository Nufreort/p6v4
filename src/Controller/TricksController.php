<?php

namespace App\Controller;

use App\Entity\Tricks;
use App\Entity\Comments;
use App\Entity\Media;
use App\Form\TricksType;
use App\Form\CommentsType;
use App\Repository\TricksRepository;
use App\Repository\CommentsRepository;
use App\Repository\UsersRepository;
use App\Repository\MediaRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\JsonResponse;


class TricksController extends AbstractController
{
    /**
     * @Route("/", name="tricks_index", methods={"GET"})
     */
    public function index(TricksRepository $tricksRepository): Response
    {
        return $this->render('tricks/index.html.twig', [
            'tricks' => $tricksRepository->findAll(),
        ]);
    }

    /**
     * @Route("/new", name="tricks_new", methods={"GET","POST"})
     */
    public function new(Request $request, MediaRepository $mediaRepository): Response
    {
        $user = $this->getUser();

        $trick = new Tricks();
        $trick->setTrickAuthor($user);
        $form = $this->createForm(TricksType::class, $trick);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $media = $form->get('media')->getData();

            foreach($media as $medium)
                {
                $fichier = md5(uniqid()).'.'.$medium->guessExtension();

                $medium->move(
                    $this->getParameter('media_directory'),
                    $fichier
                  );

                $med = new Media();
                $med->setName($fichier);
                $med->setUsers($user);
                $med->setTricks($trick);
                $trick->addMedium($med);
              }

            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($trick);
            $entityManager->flush();

            return $this->redirectToRoute('tricks_index');
        }

        return $this->render('tricks/new.html.twig', [
            'trick' => $trick,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="tricks_show", methods={"GET","POST"})
     */
    public function show(Request $request, Tricks $trick, CommentsRepository $commentsRepository, UsersRepository $usersRepository): Response
    {
        $user = $this->getUser();

        $comment = new Comments();
        $comment->setCommentAuthor($user);
        $comment->setTrickId($trick);

        $form = $this->createForm(CommentsType::class, $comment);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($comment);
            $entityManager->flush();


            return $this->redirectToRoute('tricks_show', [
              'id' => $trick->getId()
            ]);
        }

        $comments = $commentsRepository->findBy(
          ['trickId' => $trick]
        );

        $authors = $usersRepository->findall();
        //dd($comments);
        return $this->render('tricks/show.html.twig', [
            'comments' => $comments,
            'authors' => $authors,
            'trick' => $trick,
            'form' => $form->createView()
        ]);

    }

    /**
     * @Route("/{id}/edit", name="tricks_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Tricks $trick): Response
    {
        $user = $this->getUser();

        $form = $this->createForm(TricksType::class, $trick);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
          $media = $form->get('media')->getData();

          foreach($media as $medium)
              {
              $fichier = md5(uniqid()).'.'.$medium->guessExtension();

              $medium->move(
                  $this->getParameter('media_directory'),
                  $fichier
                );

              $med = new Media();
              $med->setName($fichier);
              $med->setUsers($user);
              $med->setTricks($trick);
              $trick->addMedium($med);
            }


            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('tricks_index');
        }

        return $this->render('tricks/edit.html.twig', [
            'trick' => $trick,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="tricks_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Tricks $trick): Response
    {
        if ($this->isCsrfTokenValid('delete'.$trick->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($trick);
            $entityManager->flush();
        }

        return $this->redirectToRoute('tricks_index');
    }

    /**
    * @Route("/delete/media/{id}", name="tricks_delete_media", methods={"GET","DELETE"})
    */
    public function deleteImage(Media $medium, Request $request){
        $data = json_decode($request->getContent(), true);

        // On vérifie si le token est valide
        if($this->isCsrfTokenValid('delete'.$medium->getId(), $data['_token'])){
            // On récupère le nom de l'image
            $name = $medium->getName();
            // On supprime le fichier
            unlink($this->getParameter('media_directory').'/'.$name);

            // On supprime l'entrée de la base
            $em = $this->getDoctrine()->getManager();
            $em->remove($medium);
            $em->flush();

            // On répond en json
            return new JsonResponse(['success' => 1]);
        }else{
            return new JsonResponse(['error' => 'Token Invalide'], 400);
        }
    }
}
