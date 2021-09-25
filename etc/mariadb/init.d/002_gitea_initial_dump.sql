-- MariaDB dump 10.19  Distrib 10.6.4-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: gitea
-- ------------------------------------------------------
-- Server version	10.6.4-MariaDB-1:10.6.4+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

USE gitea;

--
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `repo_id` bigint(20) DEFAULT NULL,
  `mode` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_access_s` (`user_id`,`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access`
--

LOCK TABLES `access` WRITE;
/*!40000 ALTER TABLE `access` DISABLE KEYS */;
/*!40000 ALTER TABLE `access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `access_token`
--

DROP TABLE IF EXISTS `access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `token_hash` varchar(255) DEFAULT NULL,
  `token_salt` varchar(255) DEFAULT NULL,
  `token_last_eight` varchar(255) DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_access_token_token_hash` (`token_hash`),
  KEY `IDX_access_token_created_unix` (`created_unix`),
  KEY `IDX_access_token_updated_unix` (`updated_unix`),
  KEY `IDX_access_token_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_token`
--

LOCK TABLES `access_token` WRITE;
/*!40000 ALTER TABLE `access_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `action`
--

DROP TABLE IF EXISTS `action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `op_type` int(11) DEFAULT NULL,
  `act_user_id` bigint(20) DEFAULT NULL,
  `repo_id` bigint(20) DEFAULT NULL,
  `comment_id` bigint(20) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `ref_name` varchar(255) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `content` text DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_action_act_user_id` (`act_user_id`),
  KEY `IDX_action_repo_id` (`repo_id`),
  KEY `IDX_action_comment_id` (`comment_id`),
  KEY `IDX_action_is_deleted` (`is_deleted`),
  KEY `IDX_action_is_private` (`is_private`),
  KEY `IDX_action_created_unix` (`created_unix`),
  KEY `IDX_action_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action`
--

LOCK TABLES `action` WRITE;
/*!40000 ALTER TABLE `action` DISABLE KEYS */;
/*!40000 ALTER TABLE `action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(40) DEFAULT NULL,
  `issue_id` bigint(20) DEFAULT NULL,
  `release_id` bigint(20) DEFAULT NULL,
  `uploader_id` bigint(20) DEFAULT 0,
  `comment_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `download_count` bigint(20) DEFAULT 0,
  `size` bigint(20) DEFAULT 0,
  `created_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_attachment_uuid` (`uuid`),
  KEY `IDX_attachment_issue_id` (`issue_id`),
  KEY `IDX_attachment_release_id` (`release_id`),
  KEY `IDX_attachment_uploader_id` (`uploader_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collaboration`
--

DROP TABLE IF EXISTS `collaboration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collaboration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `mode` int(11) NOT NULL DEFAULT 2,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_collaboration_s` (`repo_id`,`user_id`),
  KEY `IDX_collaboration_repo_id` (`repo_id`),
  KEY `IDX_collaboration_user_id` (`user_id`),
  KEY `IDX_collaboration_created_unix` (`created_unix`),
  KEY `IDX_collaboration_updated_unix` (`updated_unix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collaboration`
--

LOCK TABLES `collaboration` WRITE;
/*!40000 ALTER TABLE `collaboration` DISABLE KEYS */;
/*!40000 ALTER TABLE `collaboration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `poster_id` bigint(20) DEFAULT NULL,
  `original_author` varchar(255) DEFAULT NULL,
  `original_author_id` bigint(20) DEFAULT NULL,
  `issue_id` bigint(20) DEFAULT NULL,
  `label_id` bigint(20) DEFAULT NULL,
  `old_project_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `old_milestone_id` bigint(20) DEFAULT NULL,
  `milestone_id` bigint(20) DEFAULT NULL,
  `time_id` bigint(20) DEFAULT NULL,
  `assignee_id` bigint(20) DEFAULT NULL,
  `removed_assignee` tinyint(1) DEFAULT NULL,
  `assignee_team_id` bigint(20) NOT NULL DEFAULT 0,
  `resolve_doer_id` bigint(20) DEFAULT NULL,
  `old_title` varchar(255) DEFAULT NULL,
  `new_title` varchar(255) DEFAULT NULL,
  `old_ref` varchar(255) DEFAULT NULL,
  `new_ref` varchar(255) DEFAULT NULL,
  `dependent_issue_id` bigint(20) DEFAULT NULL,
  `commit_id` bigint(20) DEFAULT NULL,
  `line` bigint(20) DEFAULT NULL,
  `tree_path` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `patch` text DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  `commit_sha` varchar(40) DEFAULT NULL,
  `review_id` bigint(20) DEFAULT NULL,
  `invalidated` tinyint(1) DEFAULT NULL,
  `ref_repo_id` bigint(20) DEFAULT NULL,
  `ref_issue_id` bigint(20) DEFAULT NULL,
  `ref_comment_id` bigint(20) DEFAULT NULL,
  `ref_action` smallint(6) DEFAULT NULL,
  `ref_is_pull` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_comment_type` (`type`),
  KEY `IDX_comment_poster_id` (`poster_id`),
  KEY `IDX_comment_created_unix` (`created_unix`),
  KEY `IDX_comment_ref_repo_id` (`ref_repo_id`),
  KEY `IDX_comment_ref_comment_id` (`ref_comment_id`),
  KEY `IDX_comment_issue_id` (`issue_id`),
  KEY `IDX_comment_updated_unix` (`updated_unix`),
  KEY `IDX_comment_review_id` (`review_id`),
  KEY `IDX_comment_ref_issue_id` (`ref_issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commit_status`
--

DROP TABLE IF EXISTS `commit_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commit_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `index` bigint(20) DEFAULT NULL,
  `repo_id` bigint(20) DEFAULT NULL,
  `state` varchar(7) NOT NULL,
  `sha` varchar(64) NOT NULL,
  `target_url` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `context_hash` char(40) DEFAULT NULL,
  `context` text DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_commit_status_repo_sha_index` (`index`,`repo_id`,`sha`),
  KEY `IDX_commit_status_index` (`index`),
  KEY `IDX_commit_status_repo_id` (`repo_id`),
  KEY `IDX_commit_status_sha` (`sha`),
  KEY `IDX_commit_status_context_hash` (`context_hash`),
  KEY `IDX_commit_status_created_unix` (`created_unix`),
  KEY `IDX_commit_status_updated_unix` (`updated_unix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commit_status`
--

LOCK TABLES `commit_status` WRITE;
/*!40000 ALTER TABLE `commit_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `commit_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deleted_branch`
--

DROP TABLE IF EXISTS `deleted_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deleted_branch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `commit` varchar(255) NOT NULL,
  `deleted_by_id` bigint(20) DEFAULT NULL,
  `deleted_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_deleted_branch_s` (`repo_id`,`name`,`commit`),
  KEY `IDX_deleted_branch_repo_id` (`repo_id`),
  KEY `IDX_deleted_branch_deleted_by_id` (`deleted_by_id`),
  KEY `IDX_deleted_branch_deleted_unix` (`deleted_unix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deleted_branch`
--

LOCK TABLES `deleted_branch` WRITE;
/*!40000 ALTER TABLE `deleted_branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `deleted_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deploy_key`
--

DROP TABLE IF EXISTS `deploy_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deploy_key` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key_id` bigint(20) DEFAULT NULL,
  `repo_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `fingerprint` varchar(255) DEFAULT NULL,
  `mode` int(11) NOT NULL DEFAULT 1,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_deploy_key_s` (`key_id`,`repo_id`),
  KEY `IDX_deploy_key_key_id` (`key_id`),
  KEY `IDX_deploy_key_repo_id` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deploy_key`
--

LOCK TABLES `deploy_key` WRITE;
/*!40000 ALTER TABLE `deploy_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `deploy_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_address`
--

DROP TABLE IF EXISTS `email_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `lower_email` varchar(255) NOT NULL,
  `is_activated` tinyint(1) DEFAULT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_email_address_email` (`email`),
  UNIQUE KEY `UQE_email_address_lower_email` (`lower_email`),
  KEY `IDX_email_address_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_address`
--

LOCK TABLES `email_address` WRITE;
/*!40000 ALTER TABLE `email_address` DISABLE KEYS */;
INSERT INTO `email_address` VALUES (1,1,'sysadmin@noreply.sgdevlab.com','sysadmin@noreply.sgdevlab.com',1,1);
/*!40000 ALTER TABLE `email_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_hash`
--

DROP TABLE IF EXISTS `email_hash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_hash` (
  `hash` varchar(32) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`),
  UNIQUE KEY `UQE_email_hash_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_hash`
--

LOCK TABLES `email_hash` WRITE;
/*!40000 ALTER TABLE `email_hash` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_hash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_login_user`
--

DROP TABLE IF EXISTS `external_login_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_login_user` (
  `external_id` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `login_source_id` bigint(20) NOT NULL,
  `raw_data` text DEFAULT NULL,
  `provider` varchar(25) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `access_token` text DEFAULT NULL,
  `access_token_secret` text DEFAULT NULL,
  `refresh_token` text DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`external_id`,`login_source_id`),
  KEY `IDX_external_login_user_user_id` (`user_id`),
  KEY `IDX_external_login_user_provider` (`provider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_login_user`
--

LOCK TABLES `external_login_user` WRITE;
/*!40000 ALTER TABLE `external_login_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_login_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `follow_id` bigint(20) DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_follow_follow` (`user_id`,`follow_id`),
  KEY `IDX_follow_created_unix` (`created_unix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gpg_key`
--

DROP TABLE IF EXISTS `gpg_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpg_key` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner_id` bigint(20) NOT NULL,
  `key_id` char(16) NOT NULL,
  `primary_key_id` char(16) DEFAULT NULL,
  `content` text NOT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `expired_unix` bigint(20) DEFAULT NULL,
  `added_unix` bigint(20) DEFAULT NULL,
  `emails` text DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `can_sign` tinyint(1) DEFAULT NULL,
  `can_encrypt_comms` tinyint(1) DEFAULT NULL,
  `can_encrypt_storage` tinyint(1) DEFAULT NULL,
  `can_certify` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_gpg_key_owner_id` (`owner_id`),
  KEY `IDX_gpg_key_key_id` (`key_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gpg_key`
--

LOCK TABLES `gpg_key` WRITE;
/*!40000 ALTER TABLE `gpg_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `gpg_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gpg_key_import`
--

DROP TABLE IF EXISTS `gpg_key_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpg_key_import` (
  `key_id` char(16) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`key_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gpg_key_import`
--

LOCK TABLES `gpg_key_import` WRITE;
/*!40000 ALTER TABLE `gpg_key_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `gpg_key_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hook_task`
--

DROP TABLE IF EXISTS `hook_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hook_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `hook_id` bigint(20) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `payload_content` text DEFAULT NULL,
  `event_type` varchar(255) DEFAULT NULL,
  `is_delivered` tinyint(1) DEFAULT NULL,
  `delivered` bigint(20) DEFAULT NULL,
  `is_succeed` tinyint(1) DEFAULT NULL,
  `request_content` text DEFAULT NULL,
  `response_content` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_hook_task_repo_id` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hook_task`
--

LOCK TABLES `hook_task` WRITE;
/*!40000 ALTER TABLE `hook_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `hook_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue`
--

DROP TABLE IF EXISTS `issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `index` bigint(20) DEFAULT NULL,
  `poster_id` bigint(20) DEFAULT NULL,
  `original_author` varchar(255) DEFAULT NULL,
  `original_author_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `milestone_id` bigint(20) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `is_closed` tinyint(1) DEFAULT NULL,
  `is_pull` tinyint(1) DEFAULT NULL,
  `num_comments` int(11) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `deadline_unix` bigint(20) DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  `closed_unix` bigint(20) DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_issue_repo_index` (`repo_id`,`index`),
  KEY `IDX_issue_deadline_unix` (`deadline_unix`),
  KEY `IDX_issue_closed_unix` (`closed_unix`),
  KEY `IDX_issue_repo_id` (`repo_id`),
  KEY `IDX_issue_milestone_id` (`milestone_id`),
  KEY `IDX_issue_is_pull` (`is_pull`),
  KEY `IDX_issue_updated_unix` (`updated_unix`),
  KEY `IDX_issue_poster_id` (`poster_id`),
  KEY `IDX_issue_original_author_id` (`original_author_id`),
  KEY `IDX_issue_is_closed` (`is_closed`),
  KEY `IDX_issue_created_unix` (`created_unix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue`
--

LOCK TABLES `issue` WRITE;
/*!40000 ALTER TABLE `issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_assignees`
--

DROP TABLE IF EXISTS `issue_assignees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_assignees` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assignee_id` bigint(20) DEFAULT NULL,
  `issue_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_issue_assignees_assignee_id` (`assignee_id`),
  KEY `IDX_issue_assignees_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_assignees`
--

LOCK TABLES `issue_assignees` WRITE;
/*!40000 ALTER TABLE `issue_assignees` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_assignees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_dependency`
--

DROP TABLE IF EXISTS `issue_dependency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_dependency` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `issue_id` bigint(20) NOT NULL,
  `dependency_id` bigint(20) NOT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_issue_dependency_issue_dependency` (`issue_id`,`dependency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_dependency`
--

LOCK TABLES `issue_dependency` WRITE;
/*!40000 ALTER TABLE `issue_dependency` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_dependency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_index`
--

DROP TABLE IF EXISTS `issue_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_index` (
  `group_id` bigint(20) NOT NULL,
  `max_index` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `UQE_issue_index_group_id` (`group_id`),
  KEY `IDX_issue_index_max_index` (`max_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_index`
--

LOCK TABLES `issue_index` WRITE;
/*!40000 ALTER TABLE `issue_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_label`
--

DROP TABLE IF EXISTS `issue_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_label` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `issue_id` bigint(20) DEFAULT NULL,
  `label_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_issue_label_s` (`issue_id`,`label_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_label`
--

LOCK TABLES `issue_label` WRITE;
/*!40000 ALTER TABLE `issue_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_user`
--

DROP TABLE IF EXISTS `issue_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `issue_id` bigint(20) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `is_mentioned` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_issue_user_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_user`
--

LOCK TABLES `issue_user` WRITE;
/*!40000 ALTER TABLE `issue_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_watch`
--

DROP TABLE IF EXISTS `issue_watch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_watch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `issue_id` bigint(20) NOT NULL,
  `is_watching` tinyint(1) NOT NULL,
  `created_unix` bigint(20) NOT NULL,
  `updated_unix` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_issue_watch_watch` (`user_id`,`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_watch`
--

LOCK TABLES `issue_watch` WRITE;
/*!40000 ALTER TABLE `issue_watch` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_watch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `label`
--

DROP TABLE IF EXISTS `label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  `num_issues` int(11) DEFAULT NULL,
  `num_closed_issues` int(11) DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_label_repo_id` (`repo_id`),
  KEY `IDX_label_org_id` (`org_id`),
  KEY `IDX_label_created_unix` (`created_unix`),
  KEY `IDX_label_updated_unix` (`updated_unix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `label`
--

LOCK TABLES `label` WRITE;
/*!40000 ALTER TABLE `label` DISABLE KEYS */;
/*!40000 ALTER TABLE `label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_stat`
--

DROP TABLE IF EXISTS `language_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language_stat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) NOT NULL,
  `commit_id` varchar(255) DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT NULL,
  `language` varchar(50) NOT NULL,
  `size` bigint(20) NOT NULL DEFAULT 0,
  `created_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_language_stat_s` (`repo_id`,`language`),
  KEY `IDX_language_stat_repo_id` (`repo_id`),
  KEY `IDX_language_stat_language` (`language`),
  KEY `IDX_language_stat_created_unix` (`created_unix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_stat`
--

LOCK TABLES `language_stat` WRITE;
/*!40000 ALTER TABLE `language_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `language_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lfs_lock`
--

DROP TABLE IF EXISTS `lfs_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lfs_lock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) NOT NULL,
  `owner_id` bigint(20) NOT NULL,
  `path` text DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_lfs_lock_repo_id` (`repo_id`),
  KEY `IDX_lfs_lock_owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lfs_lock`
--

LOCK TABLES `lfs_lock` WRITE;
/*!40000 ALTER TABLE `lfs_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `lfs_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lfs_meta_object`
--

DROP TABLE IF EXISTS `lfs_meta_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lfs_meta_object` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `oid` varchar(255) NOT NULL,
  `size` bigint(20) NOT NULL,
  `repository_id` bigint(20) NOT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_lfs_meta_object_s` (`oid`,`repository_id`),
  KEY `IDX_lfs_meta_object_oid` (`oid`),
  KEY `IDX_lfs_meta_object_repository_id` (`repository_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lfs_meta_object`
--

LOCK TABLES `lfs_meta_object` WRITE;
/*!40000 ALTER TABLE `lfs_meta_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `lfs_meta_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_source`
--

DROP TABLE IF EXISTS `login_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_source` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_actived` tinyint(1) NOT NULL DEFAULT 0,
  `is_sync_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `cfg` text DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_login_source_name` (`name`),
  KEY `IDX_login_source_created_unix` (`created_unix`),
  KEY `IDX_login_source_updated_unix` (`updated_unix`),
  KEY `IDX_login_source_is_actived` (`is_actived`),
  KEY `IDX_login_source_is_sync_enabled` (`is_sync_enabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_source`
--

LOCK TABLES `login_source` WRITE;
/*!40000 ALTER TABLE `login_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestone`
--

DROP TABLE IF EXISTS `milestone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestone` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `is_closed` tinyint(1) DEFAULT NULL,
  `num_issues` int(11) DEFAULT NULL,
  `num_closed_issues` int(11) DEFAULT NULL,
  `completeness` int(11) DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  `deadline_unix` bigint(20) DEFAULT NULL,
  `closed_date_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_milestone_repo_id` (`repo_id`),
  KEY `IDX_milestone_created_unix` (`created_unix`),
  KEY `IDX_milestone_updated_unix` (`updated_unix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestone`
--

LOCK TABLES `milestone` WRITE;
/*!40000 ALTER TABLE `milestone` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mirror`
--

DROP TABLE IF EXISTS `mirror`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mirror` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `interval` bigint(20) DEFAULT NULL,
  `enable_prune` tinyint(1) NOT NULL DEFAULT 1,
  `updated_unix` bigint(20) DEFAULT NULL,
  `next_update_unix` bigint(20) DEFAULT NULL,
  `lfs_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `lfs_endpoint` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_mirror_repo_id` (`repo_id`),
  KEY `IDX_mirror_updated_unix` (`updated_unix`),
  KEY `IDX_mirror_next_update_unix` (`next_update_unix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mirror`
--

LOCK TABLES `mirror` WRITE;
/*!40000 ALTER TABLE `mirror` DISABLE KEYS */;
/*!40000 ALTER TABLE `mirror` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_notice_created_unix` (`created_unix`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,2,'Cron: Check all repository statistics has finished',1632551426),(2,2,'Cron: Update migration poster IDs has finished',1632551426),(3,2,'Cron: Clean-up deleted branches has finished',1632551426),(4,2,'Cron: Delete old repository archives has finished',1632551426);
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `repo_id` bigint(20) NOT NULL,
  `status` smallint(6) NOT NULL,
  `source` smallint(6) NOT NULL,
  `issue_id` bigint(20) NOT NULL,
  `commit_id` varchar(255) DEFAULT NULL,
  `comment_id` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) NOT NULL,
  `created_unix` bigint(20) NOT NULL,
  `updated_unix` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_notification_updated_unix` (`updated_unix`),
  KEY `IDX_notification_user_id` (`user_id`),
  KEY `IDX_notification_status` (`status`),
  KEY `IDX_notification_source` (`source`),
  KEY `IDX_notification_issue_id` (`issue_id`),
  KEY `IDX_notification_commit_id` (`commit_id`),
  KEY `IDX_notification_updated_by` (`updated_by`),
  KEY `IDX_notification_repo_id` (`repo_id`),
  KEY `IDX_notification_created_unix` (`created_unix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_application`
--

DROP TABLE IF EXISTS `oauth2_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `redirect_uris` text DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_oauth2_application_client_id` (`client_id`),
  KEY `IDX_oauth2_application_created_unix` (`created_unix`),
  KEY `IDX_oauth2_application_updated_unix` (`updated_unix`),
  KEY `IDX_oauth2_application_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_application`
--

LOCK TABLES `oauth2_application` WRITE;
/*!40000 ALTER TABLE `oauth2_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_authorization_code`
--

DROP TABLE IF EXISTS `oauth2_authorization_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_authorization_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `grant_id` bigint(20) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `code_challenge` varchar(255) DEFAULT NULL,
  `code_challenge_method` varchar(255) DEFAULT NULL,
  `redirect_uri` varchar(255) DEFAULT NULL,
  `valid_until` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_oauth2_authorization_code_code` (`code`),
  KEY `IDX_oauth2_authorization_code_valid_until` (`valid_until`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_authorization_code`
--

LOCK TABLES `oauth2_authorization_code` WRITE;
/*!40000 ALTER TABLE `oauth2_authorization_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_authorization_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_grant`
--

DROP TABLE IF EXISTS `oauth2_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_grant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `application_id` bigint(20) DEFAULT NULL,
  `counter` bigint(20) NOT NULL DEFAULT 1,
  `scope` text DEFAULT NULL,
  `nonce` text DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_oauth2_grant_user_application` (`user_id`,`application_id`),
  KEY `IDX_oauth2_grant_user_id` (`user_id`),
  KEY `IDX_oauth2_grant_application_id` (`application_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_grant`
--

LOCK TABLES `oauth2_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_session`
--

DROP TABLE IF EXISTS `oauth2_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_session` (
  `id` varchar(100) NOT NULL,
  `data` text DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  `expires_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_oauth2_session_expires_unix` (`expires_unix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_session`
--

LOCK TABLES `oauth2_session` WRITE;
/*!40000 ALTER TABLE `oauth2_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_user`
--

DROP TABLE IF EXISTS `org_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_org_user_s` (`uid`,`org_id`),
  KEY `IDX_org_user_uid` (`uid`),
  KEY `IDX_org_user_org_id` (`org_id`),
  KEY `IDX_org_user_is_public` (`is_public`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_user`
--

LOCK TABLES `org_user` WRITE;
/*!40000 ALTER TABLE `org_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `repo_id` bigint(20) DEFAULT NULL,
  `creator_id` bigint(20) NOT NULL,
  `is_closed` tinyint(1) DEFAULT NULL,
  `board_type` int(10) unsigned DEFAULT NULL,
  `type` int(10) unsigned DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  `closed_date_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_project_updated_unix` (`updated_unix`),
  KEY `IDX_project_title` (`title`),
  KEY `IDX_project_repo_id` (`repo_id`),
  KEY `IDX_project_is_closed` (`is_closed`),
  KEY `IDX_project_created_unix` (`created_unix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_board`
--

DROP TABLE IF EXISTS `project_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_board` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `project_id` bigint(20) NOT NULL,
  `creator_id` bigint(20) NOT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_project_board_project_id` (`project_id`),
  KEY `IDX_project_board_created_unix` (`created_unix`),
  KEY `IDX_project_board_updated_unix` (`updated_unix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_board`
--

LOCK TABLES `project_board` WRITE;
/*!40000 ALTER TABLE `project_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_issue`
--

DROP TABLE IF EXISTS `project_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_issue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `issue_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `project_board_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_project_issue_issue_id` (`issue_id`),
  KEY `IDX_project_issue_project_id` (`project_id`),
  KEY `IDX_project_issue_project_board_id` (`project_board_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_issue`
--

LOCK TABLES `project_issue` WRITE;
/*!40000 ALTER TABLE `project_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `protected_branch`
--

DROP TABLE IF EXISTS `protected_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protected_branch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `can_push` tinyint(1) NOT NULL DEFAULT 0,
  `enable_whitelist` tinyint(1) DEFAULT NULL,
  `whitelist_user_i_ds` text DEFAULT NULL,
  `whitelist_team_i_ds` text DEFAULT NULL,
  `enable_merge_whitelist` tinyint(1) NOT NULL DEFAULT 0,
  `whitelist_deploy_keys` tinyint(1) NOT NULL DEFAULT 0,
  `merge_whitelist_user_i_ds` text DEFAULT NULL,
  `merge_whitelist_team_i_ds` text DEFAULT NULL,
  `enable_status_check` tinyint(1) NOT NULL DEFAULT 0,
  `status_check_contexts` text DEFAULT NULL,
  `enable_approvals_whitelist` tinyint(1) NOT NULL DEFAULT 0,
  `approvals_whitelist_user_i_ds` text DEFAULT NULL,
  `approvals_whitelist_team_i_ds` text DEFAULT NULL,
  `required_approvals` bigint(20) NOT NULL DEFAULT 0,
  `block_on_rejected_reviews` tinyint(1) NOT NULL DEFAULT 0,
  `block_on_official_review_requests` tinyint(1) NOT NULL DEFAULT 0,
  `block_on_outdated_branch` tinyint(1) NOT NULL DEFAULT 0,
  `dismiss_stale_approvals` tinyint(1) NOT NULL DEFAULT 0,
  `require_signed_commits` tinyint(1) NOT NULL DEFAULT 0,
  `protected_file_patterns` text DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_protected_branch_s` (`repo_id`,`branch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protected_branch`
--

LOCK TABLES `protected_branch` WRITE;
/*!40000 ALTER TABLE `protected_branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `protected_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `protected_tag`
--

DROP TABLE IF EXISTS `protected_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protected_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `name_pattern` varchar(255) DEFAULT NULL,
  `allowlist_user_i_ds` text DEFAULT NULL,
  `allowlist_team_i_ds` text DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protected_tag`
--

LOCK TABLES `protected_tag` WRITE;
/*!40000 ALTER TABLE `protected_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `protected_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_key`
--

DROP TABLE IF EXISTS `public_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_key` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `mode` int(11) NOT NULL DEFAULT 2,
  `type` int(11) NOT NULL DEFAULT 1,
  `login_source_id` bigint(20) NOT NULL DEFAULT 0,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_public_key_owner_id` (`owner_id`),
  KEY `IDX_public_key_fingerprint` (`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_key`
--

LOCK TABLES `public_key` WRITE;
/*!40000 ALTER TABLE `public_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `public_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pull_request`
--

DROP TABLE IF EXISTS `pull_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pull_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `conflicted_files` text DEFAULT NULL,
  `commits_ahead` int(11) DEFAULT NULL,
  `commits_behind` int(11) DEFAULT NULL,
  `changed_protected_files` text DEFAULT NULL,
  `issue_id` bigint(20) DEFAULT NULL,
  `index` bigint(20) DEFAULT NULL,
  `head_repo_id` bigint(20) DEFAULT NULL,
  `base_repo_id` bigint(20) DEFAULT NULL,
  `head_branch` varchar(255) DEFAULT NULL,
  `base_branch` varchar(255) DEFAULT NULL,
  `merge_base` varchar(40) DEFAULT NULL,
  `has_merged` tinyint(1) DEFAULT NULL,
  `merged_commit_id` varchar(40) DEFAULT NULL,
  `merger_id` bigint(20) DEFAULT NULL,
  `merged_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_pull_request_has_merged` (`has_merged`),
  KEY `IDX_pull_request_merger_id` (`merger_id`),
  KEY `IDX_pull_request_merged_unix` (`merged_unix`),
  KEY `IDX_pull_request_issue_id` (`issue_id`),
  KEY `IDX_pull_request_head_repo_id` (`head_repo_id`),
  KEY `IDX_pull_request_base_repo_id` (`base_repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pull_request`
--

LOCK TABLES `pull_request` WRITE;
/*!40000 ALTER TABLE `pull_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `pull_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `push_mirror`
--

DROP TABLE IF EXISTS `push_mirror`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `push_mirror` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `remote_name` varchar(255) DEFAULT NULL,
  `interval` bigint(20) DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `last_update` bigint(20) DEFAULT NULL,
  `last_error` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_push_mirror_repo_id` (`repo_id`),
  KEY `IDX_push_mirror_last_update` (`last_update`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_mirror`
--

LOCK TABLES `push_mirror` WRITE;
/*!40000 ALTER TABLE `push_mirror` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_mirror` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reaction`
--

DROP TABLE IF EXISTS `reaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `issue_id` bigint(20) NOT NULL,
  `comment_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `original_author_id` bigint(20) NOT NULL DEFAULT 0,
  `original_author` varchar(255) DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_reaction_s` (`type`,`issue_id`,`comment_id`,`user_id`,`original_author_id`,`original_author`),
  KEY `IDX_reaction_created_unix` (`created_unix`),
  KEY `IDX_reaction_type` (`type`),
  KEY `IDX_reaction_issue_id` (`issue_id`),
  KEY `IDX_reaction_comment_id` (`comment_id`),
  KEY `IDX_reaction_user_id` (`user_id`),
  KEY `IDX_reaction_original_author_id` (`original_author_id`),
  KEY `IDX_reaction_original_author` (`original_author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reaction`
--

LOCK TABLES `reaction` WRITE;
/*!40000 ALTER TABLE `reaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `reaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `release`
--

DROP TABLE IF EXISTS `release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `release` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `publisher_id` bigint(20) DEFAULT NULL,
  `tag_name` varchar(255) DEFAULT NULL,
  `original_author` varchar(255) DEFAULT NULL,
  `original_author_id` bigint(20) DEFAULT NULL,
  `lower_tag_name` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `sha1` varchar(40) DEFAULT NULL,
  `num_commits` bigint(20) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_draft` tinyint(1) NOT NULL DEFAULT 0,
  `is_prerelease` tinyint(1) NOT NULL DEFAULT 0,
  `is_tag` tinyint(1) NOT NULL DEFAULT 0,
  `created_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_release_n` (`repo_id`,`tag_name`),
  KEY `IDX_release_original_author_id` (`original_author_id`),
  KEY `IDX_release_created_unix` (`created_unix`),
  KEY `IDX_release_repo_id` (`repo_id`),
  KEY `IDX_release_publisher_id` (`publisher_id`),
  KEY `IDX_release_tag_name` (`tag_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `release`
--

LOCK TABLES `release` WRITE;
/*!40000 ALTER TABLE `release` DISABLE KEYS */;
/*!40000 ALTER TABLE `release` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repo_archiver`
--

DROP TABLE IF EXISTS `repo_archiver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repo_archiver` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `commit_id` varchar(40) DEFAULT NULL,
  `created_unix` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_repo_archiver_s` (`repo_id`,`type`,`commit_id`),
  KEY `IDX_repo_archiver_repo_id` (`repo_id`),
  KEY `IDX_repo_archiver_created_unix` (`created_unix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repo_archiver`
--

LOCK TABLES `repo_archiver` WRITE;
/*!40000 ALTER TABLE `repo_archiver` DISABLE KEYS */;
/*!40000 ALTER TABLE `repo_archiver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repo_indexer_status`
--

DROP TABLE IF EXISTS `repo_indexer_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repo_indexer_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `commit_sha` varchar(40) DEFAULT NULL,
  `indexer_type` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `IDX_repo_indexer_status_s` (`repo_id`,`indexer_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repo_indexer_status`
--

LOCK TABLES `repo_indexer_status` WRITE;
/*!40000 ALTER TABLE `repo_indexer_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `repo_indexer_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repo_redirect`
--

DROP TABLE IF EXISTS `repo_redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repo_redirect` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner_id` bigint(20) DEFAULT NULL,
  `lower_name` varchar(255) NOT NULL,
  `redirect_repo_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_repo_redirect_s` (`owner_id`,`lower_name`),
  KEY `IDX_repo_redirect_lower_name` (`lower_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repo_redirect`
--

LOCK TABLES `repo_redirect` WRITE;
/*!40000 ALTER TABLE `repo_redirect` DISABLE KEYS */;
/*!40000 ALTER TABLE `repo_redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repo_topic`
--

DROP TABLE IF EXISTS `repo_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repo_topic` (
  `repo_id` bigint(20) NOT NULL,
  `topic_id` bigint(20) NOT NULL,
  PRIMARY KEY (`repo_id`,`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repo_topic`
--

LOCK TABLES `repo_topic` WRITE;
/*!40000 ALTER TABLE `repo_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `repo_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repo_transfer`
--

DROP TABLE IF EXISTS `repo_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repo_transfer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `doer_id` bigint(20) DEFAULT NULL,
  `recipient_id` bigint(20) DEFAULT NULL,
  `repo_id` bigint(20) DEFAULT NULL,
  `team_i_ds` text DEFAULT NULL,
  `created_unix` bigint(20) NOT NULL,
  `updated_unix` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_repo_transfer_created_unix` (`created_unix`),
  KEY `IDX_repo_transfer_updated_unix` (`updated_unix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repo_transfer`
--

LOCK TABLES `repo_transfer` WRITE;
/*!40000 ALTER TABLE `repo_transfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `repo_transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repo_unit`
--

DROP TABLE IF EXISTS `repo_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repo_unit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `config` text DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_repo_unit_s` (`repo_id`,`type`),
  KEY `IDX_repo_unit_created_unix` (`created_unix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repo_unit`
--

LOCK TABLES `repo_unit` WRITE;
/*!40000 ALTER TABLE `repo_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `repo_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository`
--

DROP TABLE IF EXISTS `repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner_id` bigint(20) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `lower_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `website` varchar(2048) DEFAULT NULL,
  `original_service_type` int(11) DEFAULT NULL,
  `original_url` varchar(2048) DEFAULT NULL,
  `default_branch` varchar(255) DEFAULT NULL,
  `num_watches` int(11) DEFAULT NULL,
  `num_stars` int(11) DEFAULT NULL,
  `num_forks` int(11) DEFAULT NULL,
  `num_issues` int(11) DEFAULT NULL,
  `num_closed_issues` int(11) DEFAULT NULL,
  `num_pulls` int(11) DEFAULT NULL,
  `num_closed_pulls` int(11) DEFAULT NULL,
  `num_milestones` int(11) NOT NULL DEFAULT 0,
  `num_closed_milestones` int(11) NOT NULL DEFAULT 0,
  `num_projects` int(11) NOT NULL DEFAULT 0,
  `num_closed_projects` int(11) NOT NULL DEFAULT 0,
  `is_private` tinyint(1) DEFAULT NULL,
  `is_empty` tinyint(1) DEFAULT NULL,
  `is_archived` tinyint(1) DEFAULT NULL,
  `is_mirror` tinyint(1) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `is_fork` tinyint(1) NOT NULL DEFAULT 0,
  `fork_id` bigint(20) DEFAULT NULL,
  `is_template` tinyint(1) NOT NULL DEFAULT 0,
  `template_id` bigint(20) DEFAULT NULL,
  `size` bigint(20) NOT NULL DEFAULT 0,
  `is_fsck_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `close_issues_via_commit_in_any_branch` tinyint(1) NOT NULL DEFAULT 0,
  `topics` text DEFAULT NULL,
  `trust_model` int(11) DEFAULT NULL,
  `avatar` varchar(64) DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_repository_s` (`owner_id`,`lower_name`),
  KEY `IDX_repository_owner_id` (`owner_id`),
  KEY `IDX_repository_is_archived` (`is_archived`),
  KEY `IDX_repository_lower_name` (`lower_name`),
  KEY `IDX_repository_is_fork` (`is_fork`),
  KEY `IDX_repository_fork_id` (`fork_id`),
  KEY `IDX_repository_updated_unix` (`updated_unix`),
  KEY `IDX_repository_template_id` (`template_id`),
  KEY `IDX_repository_created_unix` (`created_unix`),
  KEY `IDX_repository_name` (`name`),
  KEY `IDX_repository_original_service_type` (`original_service_type`),
  KEY `IDX_repository_is_empty` (`is_empty`),
  KEY `IDX_repository_is_template` (`is_template`),
  KEY `IDX_repository_is_private` (`is_private`),
  KEY `IDX_repository_is_mirror` (`is_mirror`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository`
--

LOCK TABLES `repository` WRITE;
/*!40000 ALTER TABLE `repository` DISABLE KEYS */;
/*!40000 ALTER TABLE `repository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `reviewer_id` bigint(20) DEFAULT NULL,
  `reviewer_team_id` bigint(20) NOT NULL DEFAULT 0,
  `original_author` varchar(255) DEFAULT NULL,
  `original_author_id` bigint(20) DEFAULT NULL,
  `issue_id` bigint(20) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `official` tinyint(1) NOT NULL DEFAULT 0,
  `commit_id` varchar(40) DEFAULT NULL,
  `stale` tinyint(1) NOT NULL DEFAULT 0,
  `dismissed` tinyint(1) NOT NULL DEFAULT 0,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_review_issue_id` (`issue_id`),
  KEY `IDX_review_created_unix` (`created_unix`),
  KEY `IDX_review_updated_unix` (`updated_unix`),
  KEY `IDX_review_reviewer_id` (`reviewer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `key` char(16) NOT NULL,
  `data` blob DEFAULT NULL,
  `expiry` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `star`
--

DROP TABLE IF EXISTS `star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `star` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `repo_id` bigint(20) DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_star_s` (`uid`,`repo_id`),
  KEY `IDX_star_created_unix` (`created_unix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `star`
--

LOCK TABLES `star` WRITE;
/*!40000 ALTER TABLE `star` DISABLE KEYS */;
/*!40000 ALTER TABLE `star` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stopwatch`
--

DROP TABLE IF EXISTS `stopwatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stopwatch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `issue_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_stopwatch_issue_id` (`issue_id`),
  KEY `IDX_stopwatch_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stopwatch`
--

LOCK TABLES `stopwatch` WRITE;
/*!40000 ALTER TABLE `stopwatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `stopwatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `doer_id` bigint(20) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  `repo_id` bigint(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `start_time` bigint(20) DEFAULT NULL,
  `end_time` bigint(20) DEFAULT NULL,
  `payload_content` text DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_task_doer_id` (`doer_id`),
  KEY `IDX_task_owner_id` (`owner_id`),
  KEY `IDX_task_repo_id` (`repo_id`),
  KEY `IDX_task_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) DEFAULT NULL,
  `lower_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `authorize` int(11) DEFAULT NULL,
  `num_repos` int(11) DEFAULT NULL,
  `num_members` int(11) DEFAULT NULL,
  `includes_all_repositories` tinyint(1) NOT NULL DEFAULT 0,
  `can_create_org_repo` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `IDX_team_org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_repo`
--

DROP TABLE IF EXISTS `team_repo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_repo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) DEFAULT NULL,
  `team_id` bigint(20) DEFAULT NULL,
  `repo_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_team_repo_s` (`team_id`,`repo_id`),
  KEY `IDX_team_repo_org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_repo`
--

LOCK TABLES `team_repo` WRITE;
/*!40000 ALTER TABLE `team_repo` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_repo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_unit`
--

DROP TABLE IF EXISTS `team_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_unit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) DEFAULT NULL,
  `team_id` bigint(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_team_unit_s` (`team_id`,`type`),
  KEY `IDX_team_unit_org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_unit`
--

LOCK TABLES `team_unit` WRITE;
/*!40000 ALTER TABLE `team_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_user`
--

DROP TABLE IF EXISTS `team_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) DEFAULT NULL,
  `team_id` bigint(20) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_team_user_s` (`team_id`,`uid`),
  KEY `IDX_team_user_org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_user`
--

LOCK TABLES `team_user` WRITE;
/*!40000 ALTER TABLE `team_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `repo_count` int(11) DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_topic_name` (`name`),
  KEY `IDX_topic_created_unix` (`created_unix`),
  KEY `IDX_topic_updated_unix` (`updated_unix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracked_time`
--

DROP TABLE IF EXISTS `tracked_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracked_time` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `issue_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `time` bigint(20) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `IDX_tracked_time_issue_id` (`issue_id`),
  KEY `IDX_tracked_time_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracked_time`
--

LOCK TABLES `tracked_time` WRITE;
/*!40000 ALTER TABLE `tracked_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `tracked_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `two_factor`
--

DROP TABLE IF EXISTS `two_factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `two_factor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `scratch_salt` varchar(255) DEFAULT NULL,
  `scratch_hash` varchar(255) DEFAULT NULL,
  `last_used_passcode` varchar(10) DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_two_factor_uid` (`uid`),
  KEY `IDX_two_factor_created_unix` (`created_unix`),
  KEY `IDX_two_factor_updated_unix` (`updated_unix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `two_factor`
--

LOCK TABLES `two_factor` WRITE;
/*!40000 ALTER TABLE `two_factor` DISABLE KEYS */;
/*!40000 ALTER TABLE `two_factor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u2f_registration`
--

DROP TABLE IF EXISTS `u2f_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u2f_registration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `raw` blob DEFAULT NULL,
  `counter` bigint(20) DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_u2f_registration_updated_unix` (`updated_unix`),
  KEY `IDX_u2f_registration_user_id` (`user_id`),
  KEY `IDX_u2f_registration_created_unix` (`created_unix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u2f_registration`
--

LOCK TABLES `u2f_registration` WRITE;
/*!40000 ALTER TABLE `u2f_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `u2f_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload`
--

DROP TABLE IF EXISTS `upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upload` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(40) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_upload_uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload`
--

LOCK TABLES `upload` WRITE;
/*!40000 ALTER TABLE `upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lower_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `keep_email_private` tinyint(1) DEFAULT NULL,
  `email_notifications_preference` varchar(20) NOT NULL DEFAULT 'enabled',
  `passwd` varchar(255) NOT NULL,
  `passwd_hash_algo` varchar(255) NOT NULL DEFAULT 'argon2',
  `must_change_password` tinyint(1) NOT NULL DEFAULT 0,
  `login_type` int(11) DEFAULT NULL,
  `login_source` bigint(20) NOT NULL DEFAULT 0,
  `login_name` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `rands` varchar(10) DEFAULT NULL,
  `salt` varchar(10) DEFAULT NULL,
  `language` varchar(5) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  `last_login_unix` bigint(20) DEFAULT NULL,
  `last_repo_visibility` tinyint(1) DEFAULT NULL,
  `max_repo_creation` int(11) NOT NULL DEFAULT -1,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `is_restricted` tinyint(1) NOT NULL DEFAULT 0,
  `allow_git_hook` tinyint(1) DEFAULT NULL,
  `allow_import_local` tinyint(1) DEFAULT NULL,
  `allow_create_organization` tinyint(1) DEFAULT 1,
  `prohibit_login` tinyint(1) NOT NULL DEFAULT 0,
  `avatar` varchar(2048) NOT NULL,
  `avatar_email` varchar(255) NOT NULL,
  `use_custom_avatar` tinyint(1) DEFAULT NULL,
  `num_followers` int(11) DEFAULT NULL,
  `num_following` int(11) NOT NULL DEFAULT 0,
  `num_stars` int(11) DEFAULT NULL,
  `num_repos` int(11) DEFAULT NULL,
  `num_teams` int(11) DEFAULT NULL,
  `num_members` int(11) DEFAULT NULL,
  `visibility` int(11) NOT NULL DEFAULT 0,
  `repo_admin_change_team_access` tinyint(1) NOT NULL DEFAULT 0,
  `diff_view_style` varchar(255) NOT NULL DEFAULT '',
  `theme` varchar(255) NOT NULL DEFAULT '',
  `keep_activity_private` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_user_lower_name` (`lower_name`),
  UNIQUE KEY `UQE_user_name` (`name`),
  KEY `IDX_user_created_unix` (`created_unix`),
  KEY `IDX_user_updated_unix` (`updated_unix`),
  KEY `IDX_user_last_login_unix` (`last_login_unix`),
  KEY `IDX_user_is_active` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'sysadmin','sysadmin','','sysadmin@noreply.sgdevlab.com',0,'enabled','894a41821eb99a6a8ed312df1a7ebf80c1695de809eb4bfdb873d82091ae7920d0cdcc5865901330f7892a57788c91b70244','pbkdf2',0,0,0,'',0,'','','P11avihh7K','6jvO5HWMcX','','',1632551421,1632551426,0,0,-1,1,1,0,0,0,1,0,'8647d779008fd4db97e9eac8d172d605','sysadmin@noreply.sgdevlab.com',0,0,0,0,0,0,0,0,0,'','gitea',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_open_id`
--

DROP TABLE IF EXISTS `user_open_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_open_id` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `show` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_user_open_id_uri` (`uri`),
  KEY `IDX_user_open_id_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_open_id`
--

LOCK TABLES `user_open_id` WRITE;
/*!40000 ALTER TABLE `user_open_id` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_open_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_redirect`
--

DROP TABLE IF EXISTS `user_redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_redirect` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lower_name` varchar(255) NOT NULL,
  `redirect_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_user_redirect_s` (`lower_name`),
  KEY `IDX_user_redirect_lower_name` (`lower_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_redirect`
--

LOCK TABLES `user_redirect` WRITE;
/*!40000 ALTER TABLE `user_redirect` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES (1,189);
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watch`
--

DROP TABLE IF EXISTS `watch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `repo_id` bigint(20) DEFAULT NULL,
  `mode` smallint(6) NOT NULL DEFAULT 1,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_watch_watch` (`user_id`,`repo_id`),
  KEY `IDX_watch_created_unix` (`created_unix`),
  KEY `IDX_watch_updated_unix` (`updated_unix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watch`
--

LOCK TABLES `watch` WRITE;
/*!40000 ALTER TABLE `watch` DISABLE KEYS */;
/*!40000 ALTER TABLE `watch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webhook`
--

DROP TABLE IF EXISTS `webhook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webhook` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repo_id` bigint(20) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `is_system_webhook` tinyint(1) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `http_method` varchar(255) DEFAULT NULL,
  `content_type` int(11) DEFAULT NULL,
  `secret` text DEFAULT NULL,
  `events` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `meta` text DEFAULT NULL,
  `last_status` int(11) DEFAULT NULL,
  `created_unix` bigint(20) DEFAULT NULL,
  `updated_unix` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_webhook_repo_id` (`repo_id`),
  KEY `IDX_webhook_org_id` (`org_id`),
  KEY `IDX_webhook_is_active` (`is_active`),
  KEY `IDX_webhook_created_unix` (`created_unix`),
  KEY `IDX_webhook_updated_unix` (`updated_unix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhook`
--

LOCK TABLES `webhook` WRITE;
/*!40000 ALTER TABLE `webhook` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhook` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-25  6:32:18
