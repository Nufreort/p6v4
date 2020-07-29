<?php

namespace App\Form;

use App\Entity\Tricks;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class TricksType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name', null, [
                'label' => 'Nom de la figure :'
            ])
            ->add('description', null, [
                'label' => 'Description de la figure :'
              ])
            ->add('trickGroup', ChoiceType::class, [
              'label' => 'Choisir le type de la figure :',
              'choices' => [
                'Les rides' => 'Les rides',
                'Les grabs' => 'Les grabs',
                'Les rotations' => 'Les rotations',
                'Les flips' => 'Les flips',
                'Les rotations désaxéees' => 'Les rotations désaxéees',
                'Les slides' => 'Les slides',
                'Les ones foots tricks' => 'Les ones foots tricks',
                'Les Old Schools' => 'Les Old Schools',
                'Les sauts' => 'Les sauts',
                'Les barres de slide' => 'Les barres de slide',
              ]
            ])
            ->add('media', FileType::class,[
                'label' => 'Ajouter une ou plusieurs image(s) :',
                'multiple' => true,
                'mapped' => false,
                'required' => false
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Tricks::class,
        ]);
    }
}
