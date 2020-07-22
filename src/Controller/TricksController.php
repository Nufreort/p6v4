<?php

namespace App\Controller;

use App\Entity\Tricks;
use App\Entity\Comments;
use App\Form\TricksType;
use App\Form\CommentsType;
use App\Repository\TricksRepository;
use App\Repository\CommentsRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;


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
    public function new(Request $request): Response
    {
        $user = $this->getUser();

        $trick = new Tricks();
        $trick->setTrickAuthor($user);
        $form = $this->createForm(TricksType::class, $trick);
        $form->handleRequest($request);



        if ($form->isSubmitted() && $form->isValid()) {
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
    public function show(Request $request, Tricks $trick, CommentsRepository $commentsRepository): Response
    {
        $user = $this->getUser();

        $comment = new Comments();
        $comment->setCommentAuthor($user);
        $comment->setTrickId($trick);
        //dd($comment);
        //$comment-> $this->addComment();

        $form = $this->createForm(CommentsType::class, $comment);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($comment);
            $entityManager->flush();

            return $this->redirectToRoute('tricks_index');
        }

        $comments = $commentsRepository->findBy(
          ['trickId' => $trick]
        );

        return $this->render('tricks/show.html.twig', [
            'comments' => $comments,
            'trick' => $trick,
            'form' => $form->createView()
        ]);

    }

    /**
     * @Route("/{id}/edit", name="tricks_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Tricks $trick): Response
    {
        $form = $this->createForm(TricksType::class, $trick);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
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
}
