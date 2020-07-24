<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20200724075948 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE users ADD user_picture_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE users ADD CONSTRAINT FK_1483A5E949227B53 FOREIGN KEY (user_picture_id) REFERENCES media (id)');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_1483A5E949227B53 ON users (user_picture_id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE users DROP FOREIGN KEY FK_1483A5E949227B53');
        $this->addSql('DROP INDEX UNIQ_1483A5E949227B53 ON users');
        $this->addSql('ALTER TABLE users DROP user_picture_id');
    }
}
