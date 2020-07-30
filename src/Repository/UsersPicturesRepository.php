<?php

namespace App\Repository;

use App\Entity\UsersPictures;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method UsersPictures|null find($id, $lockMode = null, $lockVersion = null)
 * @method UsersPictures|null findOneBy(array $criteria, array $orderBy = null)
 * @method UsersPictures[]    findAll()
 * @method UsersPictures[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class UsersPicturesRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, UsersPictures::class);
    }

    // /**
    //  * @return UsersPictures[] Returns an array of UsersPictures objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('u')
            ->andWhere('u.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('u.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?UsersPictures
    {
        return $this->createQueryBuilder('u')
            ->andWhere('u.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
