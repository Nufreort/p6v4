<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20200721162148 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE comments ADD comment_author_id INT NOT NULL, ADD trick_id_id INT NOT NULL');
        $this->addSql('ALTER TABLE comments ADD CONSTRAINT FK_5F9E962A1F0B124D FOREIGN KEY (comment_author_id) REFERENCES users (id)');
        $this->addSql('ALTER TABLE comments ADD CONSTRAINT FK_5F9E962AB46B9EE8 FOREIGN KEY (trick_id_id) REFERENCES tricks (id)');
        $this->addSql('CREATE INDEX IDX_5F9E962A1F0B124D ON comments (comment_author_id)');
        $this->addSql('CREATE INDEX IDX_5F9E962AB46B9EE8 ON comments (trick_id_id)');
        $this->addSql('ALTER TABLE tricks ADD trick_author_id INT NOT NULL');
        $this->addSql('ALTER TABLE tricks ADD CONSTRAINT FK_E1D902C1ADCE8E82 FOREIGN KEY (trick_author_id) REFERENCES users (id)');
        $this->addSql('CREATE INDEX IDX_E1D902C1ADCE8E82 ON tricks (trick_author_id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE comments DROP FOREIGN KEY FK_5F9E962A1F0B124D');
        $this->addSql('ALTER TABLE comments DROP FOREIGN KEY FK_5F9E962AB46B9EE8');
        $this->addSql('DROP INDEX IDX_5F9E962A1F0B124D ON comments');
        $this->addSql('DROP INDEX IDX_5F9E962AB46B9EE8 ON comments');
        $this->addSql('ALTER TABLE comments DROP comment_author_id, DROP trick_id_id');
        $this->addSql('ALTER TABLE tricks DROP FOREIGN KEY FK_E1D902C1ADCE8E82');
        $this->addSql('DROP INDEX IDX_E1D902C1ADCE8E82 ON tricks');
        $this->addSql('ALTER TABLE tricks DROP trick_author_id');
    }
}
