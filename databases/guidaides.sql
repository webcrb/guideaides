-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mer 10 Février 2016 à 12:59
-- Version du serveur: 5.5.41
-- Version de PHP: 5.4.4-14+deb7u7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `guidaides`
--

-- --------------------------------------------------------

--
-- Structure de la table `wp_commentmeta`
--

CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `wp_comments`
--

CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Monsieur WordPress', '', 'https://wordpress.org/', '', '2016-02-08 15:56:16', '2016-02-08 14:56:16', 'Bonjour, ceci est un commentaire.\nPour supprimer un commentaire, connectez-vous et affichez les commentaires de cet article. Vous pourrez alors les modifier ou les supprimer.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_fc_action`
--

CREATE TABLE IF NOT EXISTS `wp_fc_action` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `review_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actor_id` int(11) NOT NULL,
  `next_assign_actors` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `step_id` int(11) NOT NULL,
  `comments` mediumtext COLLATE utf8mb4_unicode_ci,
  `due_date` date DEFAULT NULL,
  `action_history_id` int(11) NOT NULL,
  `update_datetime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `wp_fc_action_history`
--

CREATE TABLE IF NOT EXISTS `wp_fc_action_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `action_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  `step_id` int(11) NOT NULL,
  `assign_actor_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `due_date` date DEFAULT NULL,
  `reminder_date` date DEFAULT NULL,
  `reminder_date_after` date DEFAULT NULL,
  `create_datetime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `wp_fc_emails`
--

CREATE TABLE IF NOT EXISTS `wp_fc_emails` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `subject` mediumtext COLLATE utf8mb4_unicode_ci,
  `message` mediumtext COLLATE utf8mb4_unicode_ci,
  `from_user` int(11) DEFAULT NULL,
  `to_user` int(11) DEFAULT NULL,
  `action` int(2) DEFAULT '1',
  `history_id` int(11) DEFAULT NULL,
  `send_date` date DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `wp_fc_workflows`
--

CREATE TABLE IF NOT EXISTS `wp_fc_workflows` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `wf_info` longtext COLLATE utf8mb4_unicode_ci,
  `version` int(3) NOT NULL DEFAULT '1',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_auto_submit` int(2) NOT NULL DEFAULT '0',
  `auto_submit_info` mediumtext COLLATE utf8mb4_unicode_ci,
  `is_valid` int(2) NOT NULL DEFAULT '0',
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `wf_additional_info` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `wp_fc_workflows`
--

INSERT INTO `wp_fc_workflows` (`ID`, `name`, `description`, `wf_info`, `version`, `parent_id`, `start_date`, `end_date`, `is_auto_submit`, `auto_submit_info`, `is_valid`, `create_datetime`, `update_datetime`, `wf_additional_info`) VALUES
(1, 'aides', 'workflow', '{"steps":{"step0":{"fc_addid":"step0","fc_label":"assignment","fc_dbid":"2","fc_process":"assignment","fc_position":["406px","618px"]},"step1":{"fc_addid":"step1","fc_label":"review","fc_dbid":"1","fc_process":"review","fc_position":["230px","264px"]},"step2":{"fc_addid":"step2","fc_label":"publish","fc_dbid":"3","fc_process":"publish","fc_position":["82px","655px"]}},"conns":{"0":{"sourceId":"step1","targetId":"step2","connset":{"connector":"StateMachine","paintStyle":{"lineWidth":3,"strokeStyle":"blue"}}},"1":{"sourceId":"step2","targetId":"step1","connset":{"connector":"StateMachine","paintStyle":{"lineWidth":3,"strokeStyle":"red"}}},"2":{"sourceId":"step1","targetId":"step0","connset":{"connector":"StateMachine","paintStyle":{"lineWidth":3,"strokeStyle":"red"}}},"3":{"sourceId":"step2","targetId":"step0","connset":{"connector":"StateMachine","paintStyle":{"lineWidth":3,"strokeStyle":"red"}}},"4":{"sourceId":"step0","targetId":"step1","connset":{"connector":"StateMachine","paintStyle":{"lineWidth":3,"strokeStyle":"blue"}}}},"first_step":["step1"]}', 1, 0, '2016-02-08', '0000-00-00', 0, NULL, 1, '2016-02-08 17:08:11', '2016-02-09 10:57:53', 'a:2:{s:16:"wf_for_new_posts";i:1;s:20:"wf_for_revised_posts";i:1;}');

-- --------------------------------------------------------

--
-- Structure de la table `wp_fc_workflow_steps`
--

CREATE TABLE IF NOT EXISTS `wp_fc_workflow_steps` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `step_info` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `process_info` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `workflow_id` (`workflow_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=4 ;

--
-- Contenu de la table `wp_fc_workflow_steps`
--

INSERT INTO `wp_fc_workflow_steps` (`ID`, `step_info`, `process_info`, `workflow_id`, `create_datetime`, `update_datetime`) VALUES
(1, '{"process":"review","step_name":"review","assignee":{"editor":"Editor"},"status":"publish","failure_status":"draft"}', '{"assign_subject":"","assign_content":"","reminder_subject":"","reminder_content":""}', 1, '2016-02-08 17:08:11', '2016-02-09 10:57:36'),
(2, '{"process":"assignment","step_name":"assignment","assignee":{"author":"Author","editor":"Éditeur"},"status":"pending","failure_status":"draft"}', '{"assign_subject":"","assign_content":"","reminder_subject":"","reminder_content":""}', 1, '2016-02-08 17:08:11', '2016-02-09 10:57:50'),
(3, '{"process":"publish","step_name":"publish","assignee":{"administrator":"Administrator","editor":"Éditeur"},"status":"publish","failure_status":"draft"}', '{"assign_subject":"","assign_content":"","reminder_subject":"","reminder_content":""}', 1, '2016-02-08 17:08:11', '2016-02-09 10:57:28');

-- --------------------------------------------------------

--
-- Structure de la table `wp_links`
--

CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `wp_nf_objectmeta`
--

CREATE TABLE IF NOT EXISTS `wp_nf_objectmeta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `meta_value` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=76 ;

--
-- Contenu de la table `wp_nf_objectmeta`
--

INSERT INTO `wp_nf_objectmeta` (`id`, `object_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'date_updated', '2016-02-08'),
(2, 1, 'form_title', 'Contact Form'),
(3, 1, 'show_title', '0'),
(4, 1, 'save_subs', '1'),
(5, 1, 'logged_in', '0'),
(6, 1, 'append_page', ''),
(7, 1, 'ajax', '0'),
(8, 1, 'clear_complete', '1'),
(9, 1, 'hide_complete', '1'),
(10, 1, 'success_msg', 'Your form has been successfully submitted.'),
(11, 1, 'email_from', ''),
(12, 1, 'email_type', 'html'),
(13, 1, 'user_email_msg', 'Thank you so much for contacting us. We will get back to you shortly.'),
(14, 1, 'user_email_fields', '0'),
(15, 1, 'admin_email_msg', ''),
(16, 1, 'admin_email_fields', '1'),
(17, 1, 'admin_attach_csv', '0'),
(18, 1, 'email_from_name', ''),
(19, 2, 'date_updated', '2014-09-09'),
(20, 2, 'active', '1'),
(21, 2, 'name', 'Email User'),
(22, 2, 'type', 'email'),
(23, 2, 'email_format', 'html'),
(24, 2, 'attach_csv', '1'),
(25, 2, 'from_name', ''),
(26, 2, 'from_address', ''),
(27, 2, 'reply_to', ''),
(28, 2, 'to', 'field_2'),
(29, 2, 'cc', ''),
(30, 2, 'bcc', ''),
(31, 2, 'email_subject', 'Thank you for contacting us!'),
(32, 2, 'email_message', 'Thank you so much for contacting us. We will get back to you shortly.'),
(33, 2, 'redirect_url', ''),
(34, 2, 'success_message_loc', 'ninja_forms_display_before_fields'),
(35, 2, 'success_msg', ''),
(36, 3, 'date_updated', '2014-09-09'),
(37, 3, 'active', '1'),
(38, 3, 'name', 'Success Message'),
(39, 3, 'type', 'success_message'),
(40, 3, 'email_format', 'html'),
(41, 3, 'attach_csv', '0'),
(42, 3, 'from_name', ''),
(43, 3, 'from_address', ''),
(44, 3, 'reply_to', ''),
(45, 3, 'to', ''),
(46, 3, 'cc', ''),
(47, 3, 'bcc', ''),
(48, 3, 'email_subject', ''),
(49, 3, 'email_message', ''),
(50, 3, 'redirect_url', ''),
(51, 3, 'success_message_loc', 'ninja_forms_display_after_fields'),
(52, 3, 'success_msg', 'Your form has been successfully submitted.'),
(53, 3, 'text_message_number', ''),
(54, 3, 'text_message_carrier', '0'),
(55, 3, 'text_message_message', ''),
(56, 4, 'date_updated', '2014-09-09'),
(57, 4, 'active', '1'),
(58, 4, 'name', 'Email Admin'),
(59, 4, 'type', 'email'),
(60, 4, 'email_format', 'html'),
(61, 4, 'attach_csv', '1'),
(62, 4, 'from_name', ''),
(63, 4, 'from_address', ''),
(64, 4, 'reply_to', 'field_2'),
(65, 4, 'to', ''),
(66, 4, 'cc', ''),
(67, 4, 'bcc', ''),
(68, 4, 'email_subject', 'Ninja Form Submission'),
(69, 4, 'email_message', '[ninja_forms_all_fields]'),
(70, 4, 'redirect_url', ''),
(71, 4, 'success_message_loc', 'ninja_forms_display_before_fields'),
(72, 4, 'success_msg', ''),
(73, 4, 'text_message_number', ''),
(74, 4, 'text_message_carrier', '0'),
(75, 4, 'text_message_message', '');

-- --------------------------------------------------------

--
-- Structure de la table `wp_nf_objects`
--

CREATE TABLE IF NOT EXISTS `wp_nf_objects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `wp_nf_objects`
--

INSERT INTO `wp_nf_objects` (`id`, `type`) VALUES
(1, 'form'),
(2, 'notification'),
(3, 'notification'),
(4, 'notification');

-- --------------------------------------------------------

--
-- Structure de la table `wp_nf_relationships`
--

CREATE TABLE IF NOT EXISTS `wp_nf_relationships` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `child_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `child_type` varchar(255) NOT NULL,
  `parent_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `wp_nf_relationships`
--

INSERT INTO `wp_nf_relationships` (`id`, `child_id`, `parent_id`, `child_type`, `parent_type`) VALUES
(1, 2, 1, 'notification', 'form'),
(2, 3, 1, 'notification', 'form'),
(3, 4, 1, 'notification', 'form');

-- --------------------------------------------------------

--
-- Structure de la table `wp_ninja_forms_fav_fields`
--

CREATE TABLE IF NOT EXISTS `wp_ninja_forms_fav_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `row_type` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `data` longtext NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=93 ;

--
-- Contenu de la table `wp_ninja_forms_fav_fields`
--

INSERT INTO `wp_ninja_forms_fav_fields` (`id`, `row_type`, `type`, `order`, `data`, `name`) VALUES
(2, 0, '_list', 0, 'a:10:{s:5:"label";s:14:"State Dropdown";s:9:"label_pos";s:4:"left";s:9:"list_type";s:8:"dropdown";s:10:"multi_size";s:1:"5";s:15:"list_show_value";s:1:"1";s:4:"list";a:1:{s:7:"options";a:51:{i:0;a:3:{s:5:"label";s:7:"Alabama";s:5:"value";s:2:"AL";s:8:"selected";s:1:"0";}i:1;a:3:{s:5:"label";s:6:"Alaska";s:5:"value";s:2:"AK";s:8:"selected";s:1:"0";}i:2;a:3:{s:5:"label";s:7:"Arizona";s:5:"value";s:2:"AZ";s:8:"selected";s:1:"0";}i:3;a:3:{s:5:"label";s:8:"Arkansas";s:5:"value";s:2:"AR";s:8:"selected";s:1:"0";}i:4;a:3:{s:5:"label";s:10:"California";s:5:"value";s:2:"CA";s:8:"selected";s:1:"0";}i:5;a:3:{s:5:"label";s:8:"Colorado";s:5:"value";s:2:"CO";s:8:"selected";s:1:"0";}i:6;a:3:{s:5:"label";s:11:"Connecticut";s:5:"value";s:2:"CT";s:8:"selected";s:1:"0";}i:7;a:3:{s:5:"label";s:8:"Delaware";s:5:"value";s:2:"DE";s:8:"selected";s:1:"0";}i:8;a:3:{s:5:"label";s:20:"District of Columbia";s:5:"value";s:2:"DC";s:8:"selected";s:1:"0";}i:9;a:3:{s:5:"label";s:7:"Florida";s:5:"value";s:2:"FL";s:8:"selected";s:1:"0";}i:10;a:3:{s:5:"label";s:7:"Georgia";s:5:"value";s:2:"GA";s:8:"selected";s:1:"0";}i:11;a:3:{s:5:"label";s:6:"Hawaii";s:5:"value";s:2:"HI";s:8:"selected";s:1:"0";}i:12;a:3:{s:5:"label";s:5:"Idaho";s:5:"value";s:2:"ID";s:8:"selected";s:1:"0";}i:13;a:3:{s:5:"label";s:8:"Illinois";s:5:"value";s:2:"IL";s:8:"selected";s:1:"0";}i:14;a:3:{s:5:"label";s:7:"Indiana";s:5:"value";s:2:"IN";s:8:"selected";s:1:"0";}i:15;a:3:{s:5:"label";s:4:"Iowa";s:5:"value";s:2:"IA";s:8:"selected";s:1:"0";}i:16;a:3:{s:5:"label";s:6:"Kansas";s:5:"value";s:2:"KS";s:8:"selected";s:1:"0";}i:17;a:3:{s:5:"label";s:8:"Kentucky";s:5:"value";s:2:"KY";s:8:"selected";s:1:"0";}i:18;a:3:{s:5:"label";s:9:"Louisiana";s:5:"value";s:2:"LA";s:8:"selected";s:1:"0";}i:19;a:3:{s:5:"label";s:5:"Maine";s:5:"value";s:2:"ME";s:8:"selected";s:1:"0";}i:20;a:3:{s:5:"label";s:8:"Maryland";s:5:"value";s:2:"MD";s:8:"selected";s:1:"0";}i:21;a:3:{s:5:"label";s:13:"Massachusetts";s:5:"value";s:2:"MA";s:8:"selected";s:1:"0";}i:22;a:3:{s:5:"label";s:8:"Michigan";s:5:"value";s:2:"MI";s:8:"selected";s:1:"0";}i:23;a:3:{s:5:"label";s:9:"Minnesota";s:5:"value";s:2:"MN";s:8:"selected";s:1:"0";}i:24;a:3:{s:5:"label";s:11:"Mississippi";s:5:"value";s:2:"MS";s:8:"selected";s:1:"0";}i:25;a:3:{s:5:"label";s:8:"Missouri";s:5:"value";s:2:"MO";s:8:"selected";s:1:"0";}i:26;a:3:{s:5:"label";s:7:"Montana";s:5:"value";s:2:"MT";s:8:"selected";s:1:"0";}i:27;a:3:{s:5:"label";s:8:"Nebraska";s:5:"value";s:2:"NE";s:8:"selected";s:1:"0";}i:28;a:3:{s:5:"label";s:6:"Nevada";s:5:"value";s:2:"NV";s:8:"selected";s:1:"0";}i:29;a:3:{s:5:"label"3s:13:"New Hampshire";s:5:"value";s:2:"NH";s:8:"selected";s:1:"0";}i:30;a:3:{s:5:"label";s:10:"New Jersey";s:5:"value";s:2:"NJ";s:8:"selected";s:1:"0";}i:31;a:3:{s:5:"label";s:10:"New Mexico";s:5:"value";s:2:"NM";s:8:"selected";s:1:"0";}i:32;a:3:{s:5:"label";s:8:"New York";s:5:"value";s:2:"NY";s:8:"selected";s:1:"0";}i:33;a:3:{s:5:"label";s:14:"North Carolina";s:5:"value";s:2:"NC";s:8:"selected";s:1:"0";}i:34;a:3:{s:5:"label";s:12:"North Dakota";s:5:"value";s:2:"ND";s:8:"selected";s:1:"0";}i:35;a:3:{s:5:"label";s:4:"Ohio";s:5:"value";s:2:"OH";s:8:"selected";s:1:"0";}i:36;a:3:{s:5:"label";s:8:"Oklahoma";s:5:"value";s:2:"OK";s:8:"selected";s:1:"0";}i:37;a:3:{s:5:"label";s:6:"Oregon";s:5:"value";s:2:"OR";s:8:"selected";s:1:"0";}i:38;a:3:{s:5:"label";s:12:"Pennsylvania";s:5:"value";s:2:"PA";s:8:"selected";s:1:"0";}i:39;a:3:{s:5:"label";s:12:"Rhode Island";s:5:"value";s:2:"RI";s:8:"selected";s:1:"0";}i:40;a:3:{s:5:"label";s:14:"South Carolina";s:5:"value";s:2:"SC";s:8:"selected";s:1:"0";}i:41;a:3:{s:5:"label";s:12:"South Dakota";s:5:"value";s:2:"SD";s:8:"selected";s:1:"0";}i:42;a:3:{s:5:"label";s:9:"Tennessee";s:5:"value";s:2:"TN";s:8:"selected";s:1:"0";}i:43;a:3:{s:5:"label";s:5:"Texas";s:5:"value";s:2:"TX";s:8:"selected";s:1:"0";}i:44;a:3:{s:5:"label";s:4:"Utah";s:5:"value";s:2:"UT";s:8:"selected";s:1:"0";}i:45;a:3:{s:5:"label";s:7:"Vermont";s:5:"value";s:2:"VT";s:8:"selected";s:1:"0";}i:46;a:3:{s:5:"label";s:8:"Virginia";s:5:"value";s:2:"VA";s:8:"selected";s:1:"0";}i:47;a:3:{s:5:"label";s:10:"Washington";s:5:"value";s:2:"WA";s:8:"selected";s:1:"0";}i:48;a:3:{s:5:"label";s:13:"West Virginia";s:5:"value";s:2:"WV";s:8:"selected";s:1:"0";}i:49;a:3:{s:5:"label";s:9:"Wisconsin";s:5:"value";s:2:"WI";s:8:"selected";s:1:"0";}i:50;a:3:{s:5:"label";s:7:"Wyoming";s:5:"value";s:2:"WY";s:8:"selected";s:1:"0";}}}s:3:"req";s:1:"0";s:5:"class";s:0:"";s:9:"show_help";s:1:"0";s:9:"help_text";s:0:"";}', 'State Dropdown'),
(3, 0, '_spam', 0, 'a:6:{s:9:"label_pos";s:4:"left";s:5:"label";s:18:"Anti-Spam Question";s:6:"answer";s:16:"Anti-Spam Answer";s:5:"class";s:0:"";s:9:"show_help";s:1:"0";s:9:"help_text";s:0:"";}', 'Anti-Spam'),
(4, 0, '_submit', 0, 'a:4:{s:5:"label";s:6:"Submit";s:5:"class";s:0:"";s:9:"show_help";s:1:"0";s:9:"help_text";s:0:"";}', 'Submit'),
(5, 0, '_tax', 0, 'a:11:{s:5:"label";s:3:"Tax";s:9:"label_pos";s:5:"above";s:13:"default_value";s:0:"";s:19:"payment_field_group";s:1:"1";s:11:"payment_tax";s:1:"1";s:5:"class";s:0:"";s:9:"show_help";s:1:"0";s:9:"help_text";s:0:"";s:11:"conditional";s:0:"";s:11:"calc_option";s:1:"0";s:4:"calc";s:0:"";}', 'Tax'),
(6, 0, '_text', 0, 'a:19:{s:5:"label";s:10:"First Name";s:9:"label_pos";s:5:"above";s:13:"default_value";s:0:"";s:4:"mask";s:0:"";s:10:"datepicker";s:1:"0";s:5:"email";s:1:"0";s:10:"send_email";s:1:"0";s:10:"from_email";s:1:"0";s:10:"first_name";s:1:"1";s:9:"last_name";s:1:"0";s:9:"from_name";s:1:"0";s:21:"user_info_field_group";s:1:"1";s:3:"req";s:1:"0";s:5:"class";s:0:"";s:9:"show_help";s:1:"0";s:9:"help_text";s:0:"";s:17:"calc_auto_include";s:1:"0";s:11:"calc_option";s:1:"0";s:11:"conditional";s:0:"";}', 'First Name'),
(7, 0, '_text', 0, 'a:19:{s:5:"label";s:9:"Last Name";s:9:"label_pos";s:5:"above";s:13:"default_value";s:0:"";s:4:"mask";s:0:"";s:10:"datepicker";s:1:"0";s:5:"email";s:1:"0";s:10:"send_email";s:1:"0";s:10:"from_email";s:1:"0";s:10:"first_name";s:1:"0";s:9:"last_name";s:1:"1";s:9:"from_name";s:1:"0";s:21:"user_info_field_group";s:1:"1";s:3:"req";s:1:"0";s:5:"class";s:0:"";s:9:"show_help";s:1:"0";s:9:"help_text";s:0:"";s:17:"calc_auto_include";s:1:"0";s:11:"calc_option";s:1:"0";s:11:"conditional";s:0:"";}', 'Last Name'),
(8, 0, '_text', 0, 'a:23:{s:5:"label";s:9:"Address 1";s:9:"label_pos";s:5:"above";s:13:"default_value";s:0:"";s:4:"mask";s:0:"";s:10:"datepicker";s:1:"0";s:5:"email";s:1:"0";s:10:"send_email";s:1:"0";s:10:"from_email";s:1:"0";s:10:"first_name";s:1:"0";s:9:"last_name";s:1:"0";s:9:"from_name";s:1:"0";s:14:"user_address_1";s:1:"1";s:14:"user_address_2";s:1:"0";s:9:"user_city";s:1:"0";s:8:"user_zip";s:1:"0";s:21:"user_info_field_group";s:1:"1";s:3:"req";s:1:"0";s:5:"class";s:0:"";s:9:"show_help";s:1:"0";s:9:"help_text";s:0:"";s:17:"calc_auto_include";s:1:"0";s:11:"calc_option";s:1:"0";s:11:"conditional";s:0:"";}', 'Address 1'),
(9, 0, '_text', 0, 'a:23:{s:5:"label";s:9:"Address 2";s:9:"label_pos";s:5:"above";s:13:"default_value";s:0:"";s:4:"mask";s:0:"";s:10:"datepicker";s:1:"0";s:5:"email";s:1:"0";s:10:"send_email";s:1:"0";s:10:"from_email";s:1:"0";s:10:"first_name";s:1:"0";s:9:"last_name";s:1:"0";s:9:"from_name";s:1:"0";s:14:"user_address_1";s:1:"0";s:14:"user_address_2";s:1:"1";s:9:"user_city";s:1:"0";s:8:"user_zip";s:1:"0";s:21:"user_info_field_group";s:1:"1";s:3:"req";s:1:"0";s:5:"class";s:0:"";s:9:"show_help";s:1:"0";s:9:"help_text";s:0:"";s:17:"calc_auto_include";s:1:"0";s:11:"calc_option";s:1:"0";s:11:"conditional";s:0:"";}', 'Address 2'),
(10, 0, '_text', 0, 'a:23:{s:5:"label";s:4:"City";s:9:"label_pos";s:5:"above";s:13:"default_value";s:0:"";s:4:"mask";s:0:"";s:10:"datepicker";s:1:"0";s:5:"email";s:1:"0";s:10:"send_email";s:1:"0";s:10:"from_email";s:1:"0";s:10:"first_name";s:1:"0";s:9:"last_name";s:1:"0";s:9:"from_name";s:1:"0";s:14:"user_address_1";s:1:"0";s:14:"user_address_2";s:1:"0";s:9:"user_city";s:1:"1";s:8:"user_zip";s:1:"0";s:21:"user_info_field_group";s:1:"1";s:3:"req";s:1:"0";s:5:"class";s:0:"";s:9:"show_help";s:1:"0";s:9:"help_text";s:0:"";s:17:"calc_auto_include";s:1:"0";s:11:"calc_option";s:1:"0";s:11:"conditional";s:0:"";}', 'City'),
(11, 0, '_list', 0, 'a:16:{s:5:"label";s:5:"State";s:9:"label_pos";s:5:"above";s:10:"multi_size";s:1:"5";s:15:"list_show_value";s:1:"1";s:4:"list";a:1:{s:7:"options";a:51:{i:0;a:4:{s:5:"label";s:7:"Alabama";s:5:"value";s:2:"AL";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:1;a:4:{s:5:"label";s:6:"Alaska";s:5:"value";s:2:"AK";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:2;a:4:{s:5:"label";s:7:"Arizona";s:5:"value";s:2:"AZ";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:3;a:4:{s:5:"label";s:8:"Arkansas";s:5:"value";s:2:"AR";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:4;a:4:{s:5:"label";s:10:"California";s:5:"value";s:2:"CA";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:5;a:4:{s:5:"label";s:8:"Colorado";s:5:"value";s:2:"CO";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:6;a:4:{s:5:"label";s:11:"Connecticut";s:5:"value";s:2:"CT";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:7;a:4:{s:5:"label";s:8:"Delaware";s:5:"value";s:2:"DE";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:8;a:4:{s:5:"label";s:20:"District of Columbia";s:5:"value";s:2:"DC";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:9;a:4:{s:5:"label";s:7:"Florida";s:5:"value";s:2:"FL";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:10;a:4:{s:5:"label";s:7:"Georgia";s:5:"value";s:2:"GA";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:11;a:4:{s:5:"label";s:6:"Hawaii";s:5:"value";s:2:"HI";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:12;a:4:{s:5:"label";s:5:"Idaho";s:5:"value";s:2:"ID";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:13;a:4:{s:5:"label";s:8:"Illinois";s:5:"value";s:2:"IL";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:14;a:4:{s:5:"label";s:7:"Indiana";s:5:"value";s:2:"IN";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:15;a:4:{s:5:"label";s:4:"Iowa";s:5:"value";s:2:"IA";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:16;a:4:{s:5:"label";s:6:"Kansas";s:5:"value";s:2:"KS";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:17;a:4:{s:5:"label";s:8:"Kentucky";s:5:"value";s:2:"KY";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:18;a:4:{s:5:"label";s:9:"Louisiana";s:5:"value";s:2:"LA";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:19;a:4:{s:5:"label";s:5:"Maine";s:5:"value";s:2:"ME";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:20;a:4:{s:5:"label";s:8:"Maryland";s:5:"value";s:2:"MD";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:21;a:4:{s:5:"label";s:13:"Massachusetts";s:5:"value";s:2:"MA";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:22;a:4:{s:5:"label";s:8:"Michigan";s:5:"value";s:2:"MI";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:23;a:4:{s:5:"label";s:9:"Minnesota";s:5:"value";s:2:"MN";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:24;a:4:{s:5:"label";s:11:"Mississippi";s:5:"value";s:2:"MS";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:25;a:4:{s:5:"label";s:8:"Missouri";s:5:"value";s:2:"MO";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:26;a:4:{s:5:"label";s:7:"Montana";s:5:"value";s:2:"MT";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:27;a:4:{s:5:"label";s:8:"Nebraska";s:5:"value";s:2:"NE";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:28;a:4:{s:5:"label";s:6:"Nevada";s:5:"value";s:2:"NV";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:29;a:4:{s:5:"label";s:13:"New Hampshire";s:5:"value";s:2:"NH";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:30;a:4:{s:5:"label";s:10:"New Jersey";s:5:"value";s:2:"NJ";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:31;a:4:{s:5:"label";s:10:"New Mexico";s:5:"value";s:2:"NM";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:32;a:4:{s:5:"label";s:8:"New York";s:5:"value";s:2:"NY";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:33;a:4:{s:5:"label";s:14:"North Carolina";s:5:"value";s:2:"NC";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:34;a:4:{s:5:"label";s:12:"North Dakota";s:5:"value";s:2:"ND";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:35;a:4:{s:5:"label";s:4:"Ohio";s:5:"value";s:2:"OH";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:36;a:4:{s:5:"label";s:8:"Oklahoma";s:5:"value";s:2:"OK";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:37;a:4:{s:5:"label";s:6:"Oregon";s:5:"value";s:2:"OR";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:38;a:4:{s:5:"label";s:12:"Pennsylvania";s:5:"value";s:2:"PA";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:39;a:4:{s:5:"label";s:12:"Rhode Island";s:5:"value";s:2:"RI";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:40;a:4:{s:5:"label";s:14:"South Carolina";s:5:"value";s:2:"SC";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:41;a:4:{s:5:"label";s:12:"South Dakota";s:5:"value";s:2:"SD";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:42;a:4:{s:5:"label";s:9:"Tennessee";s:5:"value";s:2:"TN";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:43;a:4:{s:5:"label";s:5:"Texas";s:5:"value";s:2:"TX";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:44;a:4:{s:5:"label";s:4:"Utah";s:5:"value";s:2:"UT";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:45;a:4:{s:5:"label";s:7:"Vermont";s:5:"value";s:2:"VT";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:46;a:4:{s:5:"label";s:8:"Virginia";s:5:"value";s:2:"VA";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:47;a:4:{s:5:"label";s:10:"Washington";s:5:"value";s:2:"WA";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:48;a:4:{s:5:"label";s:13:"West Virginia";s:5:"value";s:2:"WV";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:49;a:4:{s:5:"label";s:9:"Wisconsin";s:5:"value";s:2:"WI";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}i:50;a:4:{s:5:"label";s:7:"Wyoming";s:5:"value";s:2:"WY";s:4:"calc";s:0:"";s:8:"selected";s:1:"0";}}}s:9:"list_type";s:8:"dropdown";s:10:"user_state";s:1:"1";s:21:"user_info_field_group";s:1:"1";s:13:"populate_term";s:0:"";s:3:"req";s:1:"0";s:5:"class";s:0:"";s:9:"show_help";s:1:"0";s:9:"help_text";s:0:"";s:17:"calc_auto_include";s:1:"0";s:11:"calc_option";s:1:"0";s:11:"conditional";s:0:"";}', 'State'),
(12, 0, '_text', 0, 'a:23:{s:5:"label";s:15:"Zip / Post Code";s:9:"label_pos";s:5:"above";s:13:"default_value";s:0:"";s:4:"mask";s:0:"";s:10:"datepicker";s:1:"0";s:5:"email";s:1:"0";s:10:"send_email";s:1:"0";s:10:"from_email";s:1:"0";s:10:"first_name";s:1:"0";s:9:"last_name";s:1:"0";s:9:"from_name";s:1:"0";s:14:"user_address_1";s:1:"0";s:14:"user_address_2";s:1:"0";s:9:"user_city";s:1:"0";s:8:"user_zip";s:1:"1";s:21:"user_info_field_group";s:1:"1";s:3:"req";s:1:"0";s:5:"class";s:0:"";s:9:"show_help";s:1:"0";s:9:"help_text";s:0:"";s:17:"calc_auto_include";s:1:"0";s:11:"calc_option";s:1:"0";s:11:"conditional";s:0:"";}', 'Zip / Post Code'),
(13, 0, '_country', 0, 'a:10:{s:5:"label";s:7:"Country";s:9:"label_pos";s:5:"above";s:13:"default_value";s:2:"US";s:21:"user_info_field_group";s:1:"1";s:5:"class";s:0:"";s:9:"show_help";s:1:"0";s:9:"help_text";s:0:"";s:17:"calc_auto_include";s:1:"0";s:11:"calc_option";s:1:"0";s:11:"conditional";s:0:"";}', 'Country'),
(14, 0, '_text', 0, 'a:25:{s:5:"label";s:5:"Email";s:9:"label_pos";s:5:"above";s:13:"default_value";s:0:"";s:4:"mask";s:0:"";s:10:"datepicker";s:1:"0";s:5:"email";s:1:"1";s:10:"send_email";s:1:"0";s:10:"from_email";s:1:"0";s:10:"first_name";s:1:"0";s:9:"last_name";s:1:"0";s:9:"from_name";s:1:"0";s:14:"user_address_1";s:1:"0";s:14:"user_address_2";s:1:"0";s:9:"user_city";s:1:"0";s:8:"user_zip";s:1:"0";s:10:"user_phone";s:1:"0";s:10:"user_email";s:1:"1";s:21:"user_info_field_group";s:1:"1";s:3:"req";s:1:"0";s:5:"class";s:0:"";s:9:"show_help";s:1:"0";s:9:"help_text";s:0:"";s:17:"calc_auto_include";s:1:"0";s:11:"calc_option";s:1:"0";s:11:"conditional";s:0:"";}', 'Email'),
(15, 0, '_text', 0, 'a:25:{s:5:"label";s:5:"Phone";s:9:"label_pos";s:5:"above";s:13:"default_value";s:0:"";s:4:"mask";s:14:"(999) 999-9999";s:10:"datepicker";s:1:"0";s:5:"email";s:1:"0";s:10:"send_email";s:1:"0";s:10:"from_email";s:1:"0";s:10:"first_name";s:1:"0";s:9:"last_name";s:1:"0";s:9:"from_name";s:1:"0";s:14:"user_address_1";s:1:"0";s:14:"user_address_2";s:1:"0";s:9:"user_city";s:1:"0";s:8:"user_zip";s:1:"0";s:10:"user_phone";s:1:"1";s:10:"user_email";s:1:"0";s:21:"user_info_field_group";s:1:"1";s:3:"req";s:1:"0";s:5:"class";s:0:"";s:9:"show_help";s:1:"0";s:9:"help_text";s:0:"";s:17:"calc_auto_include";s:1:"0";s:11:"calc_option";s:1:"0";s:11:"conditional";s:0:"";}', 'Phone'),
(16, 0, '_calc', 0, 'a:20:{s:9:"calc_name";s:9:"sub_total";s:13:"default_value";s:0:"";s:17:"calc_display_type";s:4:"text";s:5:"label";s:9:"Sub Total";s:9:"label_pos";s:5:"above";s:26:"calc_display_text_disabled";s:1:"1";s:17:"calc_display_html";s:26:"<p>[ninja_forms_calc]</p>\n";s:5:"class";s:0:"";s:9:"show_help";s:1:"0";s:9:"help_text";s:0:"";s:11:"calc_method";s:4:"auto";s:4:"calc";s:0:"";s:7:"calc_eq";s:0:"";s:19:"payment_field_group";s:1:"1";s:13:"payment_total";s:1:"0";s:17:"payment_sub_total";s:1:"1";s:11:"calc_places";s:1:"2";s:17:"calc_auto_include";s:1:"0";s:11:"calc_option";s:1:"0";s:11:"conditional";s:0:"";}', 'Sub Total'),
(17, 0, '_calc', 0, 'a:20:{s:9:"calc_name";s:5:"total";s:13:"default_value";s:0:"";s:17:"calc_display_type";s:4:"text";s:5:"label";s:5:"Total";s:9:"label_pos";s:5:"above";s:26:"calc_display_text_disabled";s:1:"1";s:17:"calc_display_html";s:26:"<p>[ninja_forms_calc]</p>\n";s:5:"class";s:0:"";s:9:"show_help";s:1:"0";s:9:"help_text";s:0:"";s:11:"calc_method";s:4:"auto";s:4:"calc";a:5:{i:0;a:2:{s:2:"op";s:3:"add";s:5:"field";s:2:"70";}i:1;a:2:{s:2:"op";s:3:"add";s:5:"field";s:2:"69";}i:2;a:2:{s:2:"op";s:3:"add";s:5:"field";s:2:"15";}i:3;a:2:{s:2:"op";s:3:"add";s:5:"field";s:2:"61";}i:4;a:2:{s:2:"op";s:3:"add";s:5:"field";s:2:"70";}}s:7:"calc_eq";s:5:"5 + 5";s:19:"payment_field_group";s:1:"1";s:13:"payment_total";s:1:"1";s:17:"payment_sub_total";s:1:"0";s:11:"calc_places";s:1:"2";s:17:"calc_auto_include";s:1:"0";s:11:"calc_option";s:1:"0";s:11:"conditional";s:0:"";}', 'Total'),
(92, 0, '_credit_card', 0, 'a:6:{s:5:"label";s:11:"Credit Card";s:19:"payment_field_group";s:1:"1";s:3:"req";s:1:"0";s:9:"show_help";s:1:"0";s:9:"help_text";s:0:"";s:11:"conditional";s:0:"";}', 'Credit Card');

-- --------------------------------------------------------

--
-- Structure de la table `wp_ninja_forms_fields`
--

CREATE TABLE IF NOT EXISTS `wp_ninja_forms_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `data` longtext NOT NULL,
  `fav_id` int(11) DEFAULT NULL,
  `def_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `wp_ninja_forms_fields`
--

INSERT INTO `wp_ninja_forms_fields` (`id`, `form_id`, `type`, `order`, `data`, `fav_id`, `def_id`) VALUES
(1, 1, '_text', 0, 'a:24:{s:5:"label";s:4:"Name";s:9:"label_pos";s:5:"above";s:13:"default_value";s:0:"";s:4:"mask";s:0:"";s:10:"datepicker";s:1:"0";s:5:"email";s:1:"0";s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:9:"from_name";s:1:"0";s:14:"user_address_1";s:0:"";s:14:"user_address_2";s:0:"";s:9:"user_city";s:0:"";s:8:"user_zip";s:0:"";s:10:"user_phone";s:0:"";s:10:"user_email";s:0:"";s:21:"user_info_field_group";s:0:"";s:3:"req";s:1:"1";s:5:"class";s:0:"";s:9:"show_help";s:1:"0";s:9:"help_text";s:0:"";s:9:"show_desc";s:1:"0";s:8:"desc_pos";s:4:"none";s:9:"desc_text";s:0:"";s:17:"calc_auto_include";s:1:"0";}', 0, 0),
(2, 1, '_text', 1, 'a:28:{s:5:"label";s:5:"Email";s:9:"label_pos";s:5:"above";s:13:"default_value";s:0:"";s:4:"mask";s:0:"";s:10:"datepicker";s:1:"0";s:5:"email";s:1:"1";s:10:"first_name";s:1:"0";s:9:"last_name";s:1:"0";s:9:"from_name";s:1:"0";s:14:"user_address_1";s:1:"0";s:14:"user_address_2";s:1:"0";s:9:"user_city";s:1:"0";s:8:"user_zip";s:1:"0";s:10:"user_phone";s:1:"0";s:10:"user_email";s:1:"1";s:21:"user_info_field_group";s:1:"1";s:3:"req";s:1:"1";s:5:"class";s:0:"";s:9:"show_help";s:1:"0";s:9:"help_text";s:0:"";s:17:"calc_auto_include";s:1:"0";s:11:"calc_option";s:1:"0";s:11:"conditional";s:0:"";s:26:"user_info_field_group_name";s:0:"";s:28:"user_info_field_group_custom";s:0:"";s:9:"show_desc";s:1:"0";s:8:"desc_pos";s:4:"none";s:9:"desc_text";s:0:"";}', 0, 14),
(3, 1, '_textarea', 2, 'a:14:{s:5:"label";s:7:"Message";s:9:"label_pos";s:5:"above";s:13:"default_value";s:0:"";s:12:"textarea_rte";s:1:"0";s:14:"textarea_media";s:1:"0";s:18:"disable_rte_mobile";s:1:"0";s:3:"req";s:1:"1";s:5:"class";s:0:"";s:9:"show_help";s:1:"0";s:9:"help_text";s:0:"";s:9:"show_desc";s:1:"0";s:8:"desc_pos";s:4:"none";s:9:"desc_text";s:0:"";s:17:"calc_auto_include";s:1:"0";}', 0, 0),
(4, 1, '_spam', 3, 'a:10:{s:5:"label";s:25:"What is thirteen minus 6?";s:9:"label_pos";s:4:"left";s:11:"spam_answer";s:1:"7";s:3:"req";s:1:"1";s:5:"class";s:0:"";s:9:"show_help";s:1:"0";s:9:"help_text";s:0:"";s:9:"show_desc";s:1:"0";s:8:"desc_pos";s:4:"none";s:9:"desc_text";s:0:"";}', 0, 0),
(5, 1, '_submit', 4, 'a:7:{s:5:"label";s:4:"Send";s:5:"class";s:0:"";s:9:"show_help";s:1:"0";s:9:"help_text";s:0:"";s:9:"show_desc";s:1:"0";s:8:"desc_pos";s:4:"none";s:9:"desc_text";s:0:"";}', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_options`
--

CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=426 ;

--
-- Contenu de la table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(3, 'siteurl', 'http://localhost/guidaides/site/web/wp', 'yes'),
(4, 'home', 'http://localhost/guidaides/site/web/wp', 'yes'),
(5, 'blogname', 'Guides des aides', 'yes'),
(6, 'blogdescription', 'Conseil Régional de Bretagne', 'yes'),
(7, 'users_can_register', '0', 'yes'),
(8, 'admin_email', 'webcrb@gmail.com', 'yes'),
(9, 'start_of_week', '1', 'yes'),
(10, 'use_balanceTags', '0', 'yes'),
(11, 'use_smilies', '1', 'yes'),
(12, 'require_name_email', '1', 'yes'),
(13, 'comments_notify', '1', 'yes'),
(14, 'posts_per_rss', '10', 'yes'),
(15, 'rss_use_excerpt', '0', 'yes'),
(16, 'mailserver_url', 'mail.example.com', 'yes'),
(17, 'mailserver_login', 'login@example.com', 'yes'),
(18, 'mailserver_pass', 'password', 'yes'),
(19, 'mailserver_port', '110', 'yes'),
(20, 'default_category', '1', 'yes'),
(21, 'default_comment_status', 'open', 'yes'),
(22, 'default_ping_status', 'open', 'yes'),
(23, 'default_pingback_flag', '0', 'yes'),
(24, 'posts_per_page', '10', 'yes'),
(25, 'date_format', 'j F Y', 'yes'),
(26, 'time_format', 'G \\h i \\m\\i\\n', 'yes'),
(27, 'links_updated_date_format', 'j F Y G \\h i \\m\\i\\n', 'yes'),
(28, 'comment_moderation', '0', 'yes'),
(29, 'moderation_notify', '1', 'yes'),
(30, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(31, 'hack_file', '0', 'yes'),
(32, 'blog_charset', 'UTF-8', 'yes'),
(33, 'moderation_keys', '', 'no'),
(34, 'active_plugins', 'a:7:{i:0;s:30:"advanced-custom-fields/acf.php";i:1;s:19:"members/members.php";i:2;s:27:"ninja-forms/ninja-forms.php";i:3;s:46:"really-simple-csv-importer/rs-csv-importer.php";i:4;s:13:"soil/soil.php";i:5;s:14:"types/wpcf.php";i:6;s:24:"wordpress-seo/wp-seo.php";}', 'yes'),
(35, 'category_base', '', 'yes'),
(36, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(37, 'comment_max_links', '2', 'yes'),
(38, 'gmt_offset', '1', 'yes'),
(39, 'default_email_category', '1', 'yes'),
(40, 'recently_edited', '', 'no'),
(41, 'template', 'twentyfifteen', 'yes'),
(42, 'stylesheet', 'twentyfifteen', 'yes'),
(43, 'comment_whitelist', '1', 'yes'),
(44, 'blacklist_keys', '', 'no'),
(45, 'comment_registration', '0', 'yes'),
(46, 'html_type', 'text/html', 'yes'),
(47, 'use_trackback', '0', 'yes'),
(48, 'default_role', 'contributor', 'yes'),
(49, 'db_version', '35700', 'yes'),
(50, 'uploads_use_yearmonth_folders', '1', 'yes'),
(51, 'upload_path', '', 'yes'),
(52, 'blog_public', '1', 'yes'),
(53, 'default_link_category', '2', 'yes'),
(54, 'show_on_front', 'posts', 'yes'),
(55, 'tag_base', '', 'yes'),
(56, 'show_avatars', '1', 'yes'),
(57, 'avatar_rating', 'G', 'yes'),
(58, 'upload_url_path', '', 'yes'),
(59, 'thumbnail_size_w', '150', 'yes'),
(60, 'thumbnail_size_h', '150', 'yes'),
(61, 'thumbnail_crop', '1', 'yes'),
(62, 'medium_size_w', '300', 'yes'),
(63, 'medium_size_h', '300', 'yes'),
(64, 'avatar_default', 'mystery', 'yes'),
(65, 'large_size_w', '1024', 'yes'),
(66, 'large_size_h', '1024', 'yes'),
(67, 'image_default_link_type', 'none', 'yes'),
(68, 'image_default_size', '', 'yes'),
(69, 'image_default_align', '', 'yes'),
(70, 'close_comments_for_old_posts', '0', 'yes'),
(71, 'close_comments_days_old', '14', 'yes'),
(72, 'thread_comments', '1', 'yes'),
(73, 'thread_comments_depth', '5', 'yes'),
(74, 'page_comments', '0', 'yes'),
(75, 'comments_per_page', '50', 'yes'),
(76, 'default_comments_page', 'newest', 'yes'),
(77, 'comment_order', 'asc', 'yes'),
(78, 'sticky_posts', 'a:0:{}', 'yes'),
(79, 'widget_categories', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_text', 'a:0:{}', 'yes'),
(81, 'widget_rss', 'a:0:{}', 'yes'),
(82, 'uninstall_plugins', 'a:1:{s:26:"oasis-workflow/oasiswf.php";a:2:{i:0;s:16:"FCInitialization";i:1;s:17:"oasiswf_uninstall";}}', 'no'),
(83, 'timezone_string', '', 'yes'),
(84, 'page_for_posts', '0', 'yes'),
(85, 'page_on_front', '0', 'yes'),
(86, 'default_post_format', '0', 'yes'),
(87, 'link_manager_enabled', '0', 'yes'),
(88, 'finished_splitting_shared_terms', '1', 'yes'),
(89, 'site_icon', '0', 'yes'),
(90, 'medium_large_size_w', '768', 'yes'),
(91, 'medium_large_size_h', '0', 'yes'),
(92, 'initial_db_version', '35700', 'yes'),
(93, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:79:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:10:"list_roles";b:1;s:12:"create_roles";b:1;s:12:"delete_roles";b:1;s:10:"edit_roles";b:1;s:16:"restrict_content";b:1;s:15:"wpseo_bulk_edit";b:1;s:26:"wpcf_custom_post_type_view";b:1;s:26:"wpcf_custom_post_type_edit";b:1;s:33:"wpcf_custom_post_type_edit_others";b:1;s:25:"wpcf_custom_taxonomy_view";b:1;s:25:"wpcf_custom_taxonomy_edit";b:1;s:32:"wpcf_custom_taxonomy_edit_others";b:1;s:22:"wpcf_custom_field_view";b:1;s:22:"wpcf_custom_field_edit";b:1;s:29:"wpcf_custom_field_edit_others";b:1;s:25:"wpcf_user_meta_field_view";b:1;s:25:"wpcf_user_meta_field_edit";b:1;s:32:"wpcf_user_meta_field_edit_others";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:39:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:15:"wpseo_bulk_edit";b:1;s:9:"add_users";b:1;s:12:"create_users";b:1;s:10:"edit_roles";b:1;s:10:"edit_users";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:12:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;s:17:"edit_others_posts";b:1;s:17:"edit_others_pages";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:7:{s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:12:"delete_posts";b:1;s:4:"read";b:1;s:20:"edit_published_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(94, 'WPLANG', 'fr_FR', 'yes'),
(95, 'widget_search', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_recent-posts', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_recent-comments', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'widget_archives', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(100, 'sidebars_widgets', 'a:3:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:1:{i:0;s:6:"meta-2";}s:13:"array_version";i:3;}', 'yes'),
(102, 'bedrock_autoloader', 'a:2:{s:7:"plugins";a:0:{}s:5:"count";i:0;}', 'yes'),
(103, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(104, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(105, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(106, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(107, 'cron', 'a:8:{i:1455116177;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1455116272;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1455116693;a:1:{s:24:"ninja_forms_daily_action";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1455117009;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1455120583;a:1:{s:29:"wp_session_garbage_collection";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1455191131;a:1:{s:26:"importer_scheduled_cleanup";a:1:{s:32:"4334b88fe3501b2f0e4f630eb24f7ca5";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:26;}}}}i:1455191342;a:1:{s:26:"importer_scheduled_cleanup";a:1:{s:32:"4fde22776ee75e22ac8342be3aa0c974";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:27;}}}}s:7:"version";i:2;}', 'yes'),
(109, 'nonce_key', 'm&Z,VupEq,K!A_tAblphin3TV?8H@UR@Gz*VDH[A< ha*9YN(SV)f:kV7I^aQ6|l', 'yes'),
(110, 'nonce_salt', '=1:pVy%iZJ^e2M[hTA_*f0y|x1O:;NA_Y_Df3Xj_yDOzuw3aC29],Gg.cQ~+OJ%5', 'yes'),
(116, 'auth_key', 'w+6PsU+.jLxe1H}gB~%Hhhq*[| ,~:*~#G<+0j=GwlEx7nObXM~/T)5Z5fx9j!c^', 'yes'),
(117, 'auth_salt', '-f#~+Kt[G1T-.%x`G: )*c!`;*&7U1Qmlv.jFU&zTV5R(~mj{Nu7F?>U=,9#oyp^', 'yes'),
(118, 'logged_in_key', 'AMz4~3I@,z*|E$gDD:=%6yQu$LZ,W:^bW%mi=)gEujxj6dc&@<H*#4>5jakxMg{;', 'yes'),
(119, 'logged_in_salt', 'WEnUX18Pc}rGZCcN,xZ< W4`DJ5N2:vVH[5kO`Hc sr:KL/IIHD,R`>cJm-Q`W*F', 'yes'),
(120, '_site_transient_timeout_browser_2f4695c5cc6685ac05e383fb7004c5b1', '1455548272', 'yes'),
(121, '_site_transient_browser_2f4695c5cc6685ac05e383fb7004c5b1', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"48.0.2564.97";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(131, 'can_compress_scripts', '1', 'yes'),
(136, '_transient_timeout_plugin_slugs', '1455190768', 'no'),
(137, '_transient_plugin_slugs', 'a:7:{i:0;s:30:"advanced-custom-fields/acf.php";i:1;s:19:"members/members.php";i:2;s:27:"ninja-forms/ninja-forms.php";i:3;s:46:"really-simple-csv-importer/rs-csv-importer.php";i:4;s:13:"soil/soil.php";i:5;s:14:"types/wpcf.php";i:6;s:24:"wordpress-seo/wp-seo.php";}', 'no'),
(143, 'recently_activated', 'a:1:{s:26:"oasis-workflow/oasiswf.php";i:1455012881;}', 'yes'),
(144, 'nf_convert_notifications_complete', '1', 'yes'),
(145, 'nf_convert_subs_step', 'complete', 'yes'),
(146, 'nf_upgrade_notice', 'closed', 'yes'),
(147, 'nf_update_email_settings_complete', '1', 'yes'),
(148, 'nf_email_fav_updated', '1', 'yes'),
(149, 'nf_convert_forms_complete', '1', 'yes'),
(150, 'nf_database_migrations', '1', 'yes'),
(151, 'ninja_forms_settings', 'a:18:{s:11:"date_format";s:5:"d/m/Y";s:15:"currency_symbol";s:1:"$";s:14:"recaptcha_lang";s:2:"en";s:13:"req_div_label";s:80:"Fields marked with an <span class="ninja-forms-req-symbol">*</span> are required";s:16:"req_field_symbol";s:18:"<strong>*</strong>";s:15:"req_error_label";s:48:"Please ensure all required fields are completed.";s:15:"req_field_error";s:24:"This is a required field";s:10:"spam_error";s:47:"Please answer the anti-spam question correctly.";s:14:"honeypot_error";s:34:"Please leave the spam field blank.";s:18:"timed_submit_error";s:31:"Please wait to submit the form.";s:16:"javascript_error";s:54:"You cannot submit the form without Javascript enabled.";s:13:"invalid_email";s:35:"Please enter a valid email address.";s:13:"process_label";s:10:"Processing";s:17:"password_mismatch";s:36:"The passwords provided do not match.";s:10:"preview_id";i:4;s:7:"version";s:6:"2.9.33";s:19:"fix_form_email_from";i:1;s:18:"fix_field_reply_to";i:1;}', 'yes'),
(152, '_transient_timeout_nf_form_', '1455030294', 'no'),
(153, '_transient_nf_form_', 'O:7:"NF_Form":5:{s:7:"form_id";N;s:8:"settings";a:0:{}s:6:"fields";a:0:{}s:10:"field_keys";a:0:{}s:6:"errors";a:0:{}}', 'no'),
(158, 'WPCF_VERSION', '1.8.11', 'no'),
(159, 'wpseo', 'a:21:{s:14:"blocking_files";a:0:{}s:26:"ignore_blog_public_warning";b:0;s:31:"ignore_meta_description_warning";b:0;s:20:"ignore_page_comments";b:0;s:16:"ignore_permalink";b:0;s:15:"ms_defaults_set";b:0;s:23:"theme_description_found";s:0:"";s:21:"theme_has_description";b:0;s:7:"version";s:5:"3.0.7";s:11:"alexaverify";s:0:"";s:12:"company_logo";s:0:"";s:12:"company_name";s:0:"";s:17:"company_or_person";s:0:"";s:20:"disableadvanced_meta";b:1;s:19:"onpage_indexability";b:1;s:12:"googleverify";s:0:"";s:8:"msverify";s:0:"";s:11:"person_name";s:0:"";s:12:"website_name";s:0:"";s:22:"alternate_website_name";s:0:"";s:12:"yandexverify";s:0:"";}', 'yes'),
(160, 'wpseo_permalinks', 'a:13:{s:15:"cleanpermalinks";b:0;s:24:"cleanpermalink-extravars";s:0:"";s:29:"cleanpermalink-googlecampaign";b:0;s:31:"cleanpermalink-googlesitesearch";b:0;s:15:"cleanreplytocom";b:0;s:10:"cleanslugs";b:1;s:14:"hide-feedlinks";b:0;s:12:"hide-rsdlink";b:0;s:14:"hide-shortlink";b:0;s:16:"hide-wlwmanifest";b:0;s:18:"redirectattachment";b:0;s:17:"stripcategorybase";b:0;s:13:"trailingslash";b:0;}', 'yes'),
(161, 'wpseo_titles', 'a:54:{s:10:"title_test";i:0;s:17:"forcerewritetitle";b:0;s:9:"separator";s:7:"sc-dash";s:5:"noodp";b:0;s:6:"noydir";b:0;s:15:"usemetakeywords";b:0;s:16:"title-home-wpseo";s:42:"%%sitename%% %%page%% %%sep%% %%sitedesc%%";s:18:"title-author-wpseo";s:41:"%%name%%, Auteur à %%sitename%% %%page%%";s:19:"title-archive-wpseo";s:38:"%%date%% %%page%% %%sep%% %%sitename%%";s:18:"title-search-wpseo";s:65:"Vous avez cherché %%searchphrase%% %%page%% %%sep%% %%sitename%%";s:15:"title-404-wpseo";s:44:"La page est introuvable %%sep%% %%sitename%%";s:19:"metadesc-home-wpseo";s:0:"";s:21:"metadesc-author-wpseo";s:0:"";s:22:"metadesc-archive-wpseo";s:0:"";s:18:"metakey-home-wpseo";s:0:"";s:20:"metakey-author-wpseo";s:0:"";s:22:"noindex-subpages-wpseo";b:0;s:20:"noindex-author-wpseo";b:0;s:21:"noindex-archive-wpseo";b:1;s:14:"disable-author";b:0;s:12:"disable-date";b:0;s:10:"title-post";s:39:"%%title%% %%page%% %%sep%% %%sitename%%";s:13:"metadesc-post";s:0:"";s:12:"metakey-post";s:0:"";s:12:"noindex-post";b:0;s:13:"showdate-post";b:0;s:16:"hideeditbox-post";b:0;s:10:"title-page";s:39:"%%title%% %%page%% %%sep%% %%sitename%%";s:13:"metadesc-page";s:0:"";s:12:"metakey-page";s:0:"";s:12:"noindex-page";b:0;s:13:"showdate-page";b:0;s:16:"hideeditbox-page";b:0;s:16:"title-attachment";s:39:"%%title%% %%page%% %%sep%% %%sitename%%";s:19:"metadesc-attachment";s:0:"";s:18:"metakey-attachment";s:0:"";s:18:"noindex-attachment";b:0;s:19:"showdate-attachment";b:0;s:22:"hideeditbox-attachment";b:0;s:18:"title-tax-category";s:53:"%%term_title%% Archives %%page%% %%sep%% %%sitename%%";s:21:"metadesc-tax-category";s:0:"";s:20:"metakey-tax-category";s:0:"";s:24:"hideeditbox-tax-category";b:0;s:20:"noindex-tax-category";b:0;s:18:"title-tax-post_tag";s:53:"%%term_title%% Archives %%page%% %%sep%% %%sitename%%";s:21:"metadesc-tax-post_tag";s:0:"";s:20:"metakey-tax-post_tag";s:0:"";s:24:"hideeditbox-tax-post_tag";b:0;s:20:"noindex-tax-post_tag";b:0;s:21:"title-tax-post_format";s:53:"%%term_title%% Archives %%page%% %%sep%% %%sitename%%";s:24:"metadesc-tax-post_format";s:0:"";s:23:"metakey-tax-post_format";s:0:"";s:27:"hideeditbox-tax-post_format";b:0;s:23:"noindex-tax-post_format";b:1;}', 'yes'),
(162, 'wpseo_social', 'a:21:{s:9:"fb_admins";a:0:{}s:12:"fbconnectkey";s:32:"f4e6da55b208c72e18c512813a091cc5";s:13:"facebook_site";s:0:"";s:13:"instagram_url";s:0:"";s:12:"linkedin_url";s:0:"";s:11:"myspace_url";s:0:"";s:16:"og_default_image";s:0:"";s:18:"og_frontpage_title";s:0:"";s:17:"og_frontpage_desc";s:0:"";s:18:"og_frontpage_image";s:0:"";s:9:"opengraph";b:1;s:10:"googleplus";b:0;s:13:"pinterest_url";s:0:"";s:15:"pinterestverify";s:0:"";s:14:"plus-publisher";s:0:"";s:7:"twitter";b:1;s:12:"twitter_site";s:0:"";s:17:"twitter_card_type";s:7:"summary";s:11:"youtube_url";s:0:"";s:15:"google_plus_url";s:0:"";s:10:"fbadminapp";s:0:"";}', 'yes'),
(163, 'wpseo_rss', 'a:2:{s:9:"rssbefore";s:0:"";s:8:"rssafter";s:64:"Cet article %%POSTLINK%% est apparu en premier sur %%BLOGLINK%%.";}', 'yes'),
(164, 'wpseo_internallinks', 'a:10:{s:20:"breadcrumbs-404crumb";s:28:"Erreur 404: Page introuvable";s:23:"breadcrumbs-blog-remove";b:0;s:20:"breadcrumbs-boldlast";b:0;s:25:"breadcrumbs-archiveprefix";s:13:"Archives pour";s:18:"breadcrumbs-enable";b:0;s:16:"breadcrumbs-home";s:7:"Accueil";s:18:"breadcrumbs-prefix";s:0:"";s:24:"breadcrumbs-searchprefix";s:18:"Vous avez cherché";s:15:"breadcrumbs-sep";s:7:"&raquo;";s:23:"post_types-post-maintax";i:0;}', 'yes'),
(165, 'wpseo_xml', 'a:16:{s:22:"disable_author_sitemap";b:1;s:22:"disable_author_noposts";b:1;s:16:"enablexmlsitemap";b:1;s:16:"entries-per-page";i:1000;s:14:"excluded-posts";s:0:"";s:38:"user_role-administrator-not_in_sitemap";b:0;s:31:"user_role-editor-not_in_sitemap";b:0;s:31:"user_role-author-not_in_sitemap";b:0;s:36:"user_role-contributor-not_in_sitemap";b:0;s:35:"user_role-subscriber-not_in_sitemap";b:0;s:30:"post_types-post-not_in_sitemap";b:0;s:30:"post_types-page-not_in_sitemap";b:0;s:36:"post_types-attachment-not_in_sitemap";b:1;s:34:"taxonomies-category-not_in_sitemap";b:0;s:34:"taxonomies-post_tag-not_in_sitemap";b:0;s:37:"taxonomies-post_format-not_in_sitemap";b:0;}', 'yes'),
(167, 'wpcf-version', '1.8.11', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(168, 'wp_installer_settings', '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', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(169, 'wpcf-messages', 'a:1:{i:1;a:0:{}}', 'yes'),
(170, 'widget_ninja_forms_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(174, 'wpcf_users_options', '1', 'yes'),
(175, 'acf_version', '4.4.5', 'yes'),
(176, 'nf_admin_notice', 'a:2:{s:16:"one_week_support";a:2:{s:5:"start";s:9:"2/15/2016";s:3:"int";i:7;}s:15:"two_week_review";a:2:{s:5:"start";s:9:"2/22/2016";s:3:"int";i:14;}}', 'yes'),
(177, 'wpseo_dismiss_recalculate', '1', 'yes'),
(178, 'installer_repositories_with_theme', 'a:1:{i:0;s:7:"toolset";}', 'yes'),
(185, 'wpcf-custom-types', 'a:2:{s:4:"aide";a:26:{s:8:"_builtin";b:0;s:18:"_toolset_edit_last";i:1455097925;s:15:"_wpcf_author_id";i:1;s:14:"wpcf-post-type";s:4:"aide";s:6:"labels";a:12:{s:4:"name";s:5:"Aides";s:13:"singular_name";s:4:"Aide";s:7:"add_new";s:20:"Ajouter une nouvelle";s:12:"add_new_item";s:23:"Ajouter une nouvelle %s";s:9:"edit_item";s:11:"Modifier %s";s:8:"new_item";s:11:"Nouvelle %s";s:9:"view_item";s:13:"Visualiser %s";s:12:"search_items";s:18:"Rechercher dans %s";s:9:"not_found";s:18:"Aucune %s trouvée";s:18:"not_found_in_trash";s:36:"Aucune %s trouvée dans la corbeille";s:17:"parent_item_colon";s:12:"Texte parent";s:9:"all_items";s:19:"Tous les éléments";}s:4:"slug";s:4:"aide";s:11:"description";s:0:"";s:4:"icon";s:9:"clipboard";s:6:"public";s:6:"public";s:13:"menu_position";s:1:"4";s:9:"menu_icon";s:0:"";s:16:"dashboard_glance";s:1:"1";s:10:"taxonomies";a:3:{s:8:"post_tag";s:1:"1";s:6:"profil";s:1:"1";s:10:"thematique";s:1:"1";}s:8:"supports";a:4:{s:5:"title";s:1:"1";s:9:"revisions";s:1:"1";s:6:"author";s:1:"1";s:7:"excerpt";s:1:"1";}s:7:"rewrite";a:6:{s:7:"enabled";s:1:"1";s:6:"custom";s:6:"normal";s:4:"slug";s:0:"";s:10:"with_front";s:1:"1";s:5:"feeds";s:1:"1";s:5:"pages";s:1:"1";}s:11:"has_archive";s:1:"1";s:16:"has_archive_slug";s:0:"";s:12:"show_in_menu";s:1:"1";s:17:"show_in_menu_page";s:0:"";s:7:"show_ui";s:1:"1";s:18:"publicly_queryable";s:1:"1";s:10:"can_export";s:1:"1";s:17:"show_in_nav_menus";s:1:"1";s:17:"query_var_enabled";s:1:"1";s:9:"query_var";s:0:"";s:16:"permalink_epmask";s:12:"EP_PERMALINK";}s:3:"aap";a:26:{s:8:"_builtin";b:0;s:18:"_toolset_edit_last";i:1455102829;s:15:"_wpcf_author_id";i:1;s:10:"__types_id";s:6:"aide-1";s:14:"wpcf-post-type";s:3:"aap";s:6:"labels";a:12:{s:4:"name";s:16:"Appels à projet";s:13:"singular_name";s:15:"Appel à projet";s:7:"add_new";s:18:"Ajouter un nouveau";s:12:"add_new_item";s:21:"Ajouter un nouveau %s";s:9:"edit_item";s:11:"Modifier %s";s:8:"new_item";s:10:"Nouveau %s";s:9:"view_item";s:13:"Visualiser %s";s:12:"search_items";s:18:"Rechercher dans %s";s:9:"not_found";s:16:"Aucun %s trouvé";s:18:"not_found_in_trash";s:34:"Aucun %s trouvé dans la corbeille";s:17:"parent_item_colon";s:12:"Texte parent";s:9:"all_items";s:19:"Tous les éléments";}s:4:"slug";s:3:"aap";s:11:"description";s:0:"";s:4:"icon";s:4:"edit";s:6:"public";s:6:"public";s:13:"menu_position";s:1:"4";s:9:"menu_icon";s:0:"";s:8:"supports";a:2:{s:5:"title";s:1:"1";s:6:"editor";s:1:"1";}s:7:"rewrite";a:6:{s:7:"enabled";s:1:"1";s:6:"custom";s:6:"normal";s:4:"slug";s:0:"";s:10:"with_front";s:1:"1";s:5:"feeds";s:1:"1";s:5:"pages";s:1:"1";}s:11:"has_archive";s:1:"1";s:16:"has_archive_slug";s:0:"";s:12:"show_in_menu";s:1:"1";s:17:"show_in_menu_page";s:0:"";s:7:"show_ui";s:1:"1";s:18:"publicly_queryable";s:1:"1";s:10:"can_export";s:1:"1";s:17:"show_in_nav_menus";s:1:"1";s:17:"query_var_enabled";s:1:"1";s:9:"query_var";s:0:"";s:16:"permalink_epmask";s:12:"EP_PERMALINK";s:10:"taxonomies";a:2:{s:6:"profil";i:1;s:10:"thematique";i:1;}}}', 'yes'),
(187, 'wpcf_post_relationship', 'a:0:{}', 'yes'),
(189, 'wpcf-custom-taxonomies', 'a:3:{s:6:"profil";a:17:{s:8:"wpcf-tax";s:6:"profil";s:6:"labels";a:15:{s:4:"name";s:14:"Profils cibles";s:13:"singular_name";s:12:"Profil cible";s:12:"search_items";s:9:"Search %s";s:13:"popular_items";s:10:"Popular %s";s:9:"all_items";s:6:"All %s";s:11:"parent_item";s:9:"Parent %s";s:17:"parent_item_colon";s:10:"Parent %s:";s:9:"edit_item";s:7:"Edit %s";s:11:"update_item";s:9:"Update %s";s:12:"add_new_item";s:10:"Add New %s";s:13:"new_item_name";s:11:"New %s Name";s:26:"separate_items_with_commas";s:23:"Separate %s with commas";s:19:"add_or_remove_items";s:16:"Add or remove %s";s:21:"choose_from_most_used";s:28:"Choose from the most used %s";s:9:"menu_name";s:2:"%s";}s:4:"slug";s:6:"profil";s:11:"description";s:0:"";s:6:"public";s:6:"public";s:8:"supports";a:2:{s:4:"aide";i:1;s:3:"aap";s:1:"1";}s:12:"hierarchical";s:12:"hierarchical";s:7:"rewrite";a:4:{s:7:"enabled";s:1:"1";s:4:"slug";s:0:"";s:10:"with_front";s:1:"1";s:12:"hierarchical";s:1:"1";}s:7:"show_ui";s:1:"1";s:17:"show_in_nav_menus";s:1:"1";s:13:"show_tagcloud";s:1:"1";s:17:"query_var_enabled";s:1:"1";s:9:"query_var";s:0:"";s:21:"update_count_callback";s:0:"";s:11:"meta_box_cb";a:1:{s:8:"callback";s:0:"";}s:18:"_toolset_edit_last";i:1455037226;s:15:"_wpcf_author_id";i:1;}s:10:"thematique";a:17:{s:8:"wpcf-tax";s:10:"thematique";s:6:"labels";a:15:{s:4:"name";s:12:"Thématiques";s:13:"singular_name";s:11:"Thématique";s:12:"search_items";s:9:"Search %s";s:13:"popular_items";s:10:"Popular %s";s:9:"all_items";s:6:"All %s";s:11:"parent_item";s:9:"Parent %s";s:17:"parent_item_colon";s:10:"Parent %s:";s:9:"edit_item";s:7:"Edit %s";s:11:"update_item";s:9:"Update %s";s:12:"add_new_item";s:10:"Add New %s";s:13:"new_item_name";s:11:"New %s Name";s:26:"separate_items_with_commas";s:23:"Separate %s with commas";s:19:"add_or_remove_items";s:16:"Add or remove %s";s:21:"choose_from_most_used";s:28:"Choose from the most used %s";s:9:"menu_name";s:2:"%s";}s:4:"slug";s:10:"thematique";s:11:"description";s:0:"";s:6:"public";s:6:"public";s:8:"supports";a:2:{s:3:"aap";s:1:"1";s:4:"aide";i:1;}s:12:"hierarchical";s:12:"hierarchical";s:7:"rewrite";a:4:{s:7:"enabled";s:1:"1";s:4:"slug";s:0:"";s:10:"with_front";s:1:"1";s:12:"hierarchical";s:1:"1";}s:7:"show_ui";s:1:"1";s:17:"show_in_nav_menus";s:1:"1";s:13:"show_tagcloud";s:1:"1";s:17:"query_var_enabled";s:1:"1";s:9:"query_var";s:0:"";s:21:"update_count_callback";s:0:"";s:11:"meta_box_cb";a:1:{s:8:"callback";s:0:"";}s:18:"_toolset_edit_last";i:1455017428;s:15:"_wpcf_author_id";i:1;}s:21:"particulier-education";a:15:{s:8:"wpcf-tax";s:21:"particulier-education";s:6:"labels";a:15:{s:4:"name";s:23:"particulier / education";s:13:"singular_name";s:23:"particulier / education";s:12:"search_items";s:9:"Search %s";s:13:"popular_items";s:10:"Popular %s";s:9:"all_items";s:6:"All %s";s:11:"parent_item";s:9:"Parent %s";s:17:"parent_item_colon";s:10:"Parent %s:";s:9:"edit_item";s:7:"Edit %s";s:11:"update_item";s:9:"Update %s";s:12:"add_new_item";s:10:"Add New %s";s:13:"new_item_name";s:11:"New %s Name";s:26:"separate_items_with_commas";s:23:"Separate %s with commas";s:19:"add_or_remove_items";s:16:"Add or remove %s";s:21:"choose_from_most_used";s:28:"Choose from the most used %s";s:9:"menu_name";s:2:"%s";}s:4:"slug";s:21:"particulier-education";s:11:"description";s:0:"";s:6:"public";s:6:"public";s:8:"supports";a:0:{}s:12:"hierarchical";s:4:"flat";s:7:"rewrite";a:4:{s:7:"enabled";s:1:"1";s:4:"slug";s:0:"";s:10:"with_front";s:1:"1";s:12:"hierarchical";s:1:"1";}s:7:"show_ui";s:1:"1";s:17:"query_var_enabled";s:1:"1";s:9:"query_var";s:0:"";s:21:"update_count_callback";s:0:"";s:11:"meta_box_cb";a:1:{s:8:"callback";s:0:"";}s:18:"_toolset_edit_last";i:1455036197;s:15:"_wpcf_author_id";i:1;}}', 'yes'),
(214, 'members_settings', 'a:10:{s:12:"role_manager";b:1;s:20:"explicit_denied_caps";b:1;s:11:"multi_roles";b:1;s:19:"content_permissions";b:1;s:25:"content_permissions_error";s:60:"Vous n’avez pas l’autorisation d’afficher ce contenu..";s:18:"private_feed_error";s:48:"Vous devez être connecté pour voir ce contenu.";s:17:"login_form_widget";b:0;s:12:"users_widget";b:0;s:12:"private_blog";b:0;s:12:"private_feed";b:0;}', 'yes'),
(221, '_site_transient_timeout_browser_6777022040190ec8fbcd24843cf4a4ea', '1455552249', 'yes'),
(222, '_site_transient_browser_6777022040190ec8fbcd24843cf4a4ea', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:7:"Firefox";s:7:"version";s:4:"46.0";s:10:"update_url";s:23:"http://www.firefox.com/";s:7:"img_src";s:50:"http://s.wordpress.org/images/browsers/firefox.png";s:11:"img_src_ssl";s:49:"https://wordpress.org/images/browsers/firefox.png";s:15:"current_version";s:2:"16";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(225, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1454958417', 'yes'),
(226, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'a:100:{s:6:"widget";a:3:{s:4:"name";s:6:"widget";s:4:"slug";s:6:"widget";s:5:"count";s:4:"5703";}s:4:"post";a:3:{s:4:"name";s:4:"Post";s:4:"slug";s:4:"post";s:5:"count";s:4:"3563";}s:6:"plugin";a:3:{s:4:"name";s:6:"plugin";s:4:"slug";s:6:"plugin";s:5:"count";s:4:"3517";}s:5:"admin";a:3:{s:4:"name";s:5:"admin";s:4:"slug";s:5:"admin";s:5:"count";s:4:"3018";}s:5:"posts";a:3:{s:4:"name";s:5:"posts";s:4:"slug";s:5:"posts";s:5:"count";s:4:"2749";}s:9:"shortcode";a:3:{s:4:"name";s:9:"shortcode";s:4:"slug";s:9:"shortcode";s:5:"count";s:4:"2246";}s:7:"sidebar";a:3:{s:4:"name";s:7:"sidebar";s:4:"slug";s:7:"sidebar";s:5:"count";s:4:"2172";}s:6:"google";a:3:{s:4:"name";s:6:"google";s:4:"slug";s:6:"google";s:5:"count";s:4:"2019";}s:7:"twitter";a:3:{s:4:"name";s:7:"twitter";s:4:"slug";s:7:"twitter";s:5:"count";s:4:"1970";}s:4:"page";a:3:{s:4:"name";s:4:"page";s:4:"slug";s:4:"page";s:5:"count";s:4:"1955";}s:6:"images";a:3:{s:4:"name";s:6:"images";s:4:"slug";s:6:"images";s:5:"count";s:4:"1952";}s:8:"comments";a:3:{s:4:"name";s:8:"comments";s:4:"slug";s:8:"comments";s:5:"count";s:4:"1904";}s:5:"image";a:3:{s:4:"name";s:5:"image";s:4:"slug";s:5:"image";s:5:"count";s:4:"1805";}s:8:"facebook";a:3:{s:4:"name";s:8:"Facebook";s:4:"slug";s:8:"facebook";s:5:"count";s:4:"1608";}s:3:"seo";a:3:{s:4:"name";s:3:"seo";s:4:"slug";s:3:"seo";s:5:"count";s:4:"1521";}s:9:"wordpress";a:3:{s:4:"name";s:9:"wordpress";s:4:"slug";s:9:"wordpress";s:5:"count";s:4:"1504";}s:11:"woocommerce";a:3:{s:4:"name";s:11:"woocommerce";s:4:"slug";s:11:"woocommerce";s:5:"count";s:4:"1477";}s:6:"social";a:3:{s:4:"name";s:6:"social";s:4:"slug";s:6:"social";s:5:"count";s:4:"1318";}s:5:"links";a:3:{s:4:"name";s:5:"links";s:4:"slug";s:5:"links";s:5:"count";s:4:"1267";}s:7:"gallery";a:3:{s:4:"name";s:7:"gallery";s:4:"slug";s:7:"gallery";s:5:"count";s:4:"1256";}s:5:"email";a:3:{s:4:"name";s:5:"email";s:4:"slug";s:5:"email";s:5:"count";s:4:"1158";}s:7:"widgets";a:3:{s:4:"name";s:7:"widgets";s:4:"slug";s:7:"widgets";s:5:"count";s:4:"1075";}s:5:"pages";a:3:{s:4:"name";s:5:"pages";s:4:"slug";s:5:"pages";s:5:"count";s:4:"1053";}s:6:"jquery";a:3:{s:4:"name";s:6:"jquery";s:4:"slug";s:6:"jquery";s:5:"count";s:3:"984";}s:5:"media";a:3:{s:4:"name";s:5:"media";s:4:"slug";s:5:"media";s:5:"count";s:3:"948";}s:3:"rss";a:3:{s:4:"name";s:3:"rss";s:4:"slug";s:3:"rss";s:5:"count";s:3:"904";}s:9:"ecommerce";a:3:{s:4:"name";s:9:"ecommerce";s:4:"slug";s:9:"ecommerce";s:5:"count";s:3:"900";}s:4:"ajax";a:3:{s:4:"name";s:4:"AJAX";s:4:"slug";s:4:"ajax";s:5:"count";s:3:"888";}s:5:"video";a:3:{s:4:"name";s:5:"video";s:4:"slug";s:5:"video";s:5:"count";s:3:"881";}s:7:"content";a:3:{s:4:"name";s:7:"content";s:4:"slug";s:7:"content";s:5:"count";s:3:"872";}s:5:"login";a:3:{s:4:"name";s:5:"login";s:4:"slug";s:5:"login";s:5:"count";s:3:"864";}s:10:"javascript";a:3:{s:4:"name";s:10:"javascript";s:4:"slug";s:10:"javascript";s:5:"count";s:3:"814";}s:10:"buddypress";a:3:{s:4:"name";s:10:"buddypress";s:4:"slug";s:10:"buddypress";s:5:"count";s:3:"767";}s:10:"responsive";a:3:{s:4:"name";s:10:"responsive";s:4:"slug";s:10:"responsive";s:5:"count";s:3:"766";}s:8:"security";a:3:{s:4:"name";s:8:"security";s:4:"slug";s:8:"security";s:5:"count";s:3:"752";}s:5:"photo";a:3:{s:4:"name";s:5:"photo";s:4:"slug";s:5:"photo";s:5:"count";s:3:"735";}s:4:"feed";a:3:{s:4:"name";s:4:"feed";s:4:"slug";s:4:"feed";s:5:"count";s:3:"730";}s:4:"spam";a:3:{s:4:"name";s:4:"spam";s:4:"slug";s:4:"spam";s:5:"count";s:3:"729";}s:7:"youtube";a:3:{s:4:"name";s:7:"youtube";s:4:"slug";s:7:"youtube";s:5:"count";s:3:"726";}s:4:"link";a:3:{s:4:"name";s:4:"link";s:4:"slug";s:4:"link";s:5:"count";s:3:"721";}s:5:"share";a:3:{s:4:"name";s:5:"Share";s:4:"slug";s:5:"share";s:5:"count";s:3:"710";}s:10:"e-commerce";a:3:{s:4:"name";s:10:"e-commerce";s:4:"slug";s:10:"e-commerce";s:5:"count";s:3:"709";}s:6:"photos";a:3:{s:4:"name";s:6:"photos";s:4:"slug";s:6:"photos";s:5:"count";s:3:"680";}s:8:"category";a:3:{s:4:"name";s:8:"category";s:4:"slug";s:8:"category";s:5:"count";s:3:"678";}s:9:"analytics";a:3:{s:4:"name";s:9:"analytics";s:4:"slug";s:9:"analytics";s:5:"count";s:3:"662";}s:5:"embed";a:3:{s:4:"name";s:5:"embed";s:4:"slug";s:5:"embed";s:5:"count";s:3:"657";}s:4:"form";a:3:{s:4:"name";s:4:"form";s:4:"slug";s:4:"form";s:5:"count";s:3:"656";}s:3:"css";a:3:{s:4:"name";s:3:"CSS";s:4:"slug";s:3:"css";s:5:"count";s:3:"645";}s:6:"search";a:3:{s:4:"name";s:6:"search";s:4:"slug";s:6:"search";s:5:"count";s:3:"640";}s:9:"slideshow";a:3:{s:4:"name";s:9:"slideshow";s:4:"slug";s:9:"slideshow";s:5:"count";s:3:"631";}s:6:"custom";a:3:{s:4:"name";s:6:"custom";s:4:"slug";s:6:"custom";s:5:"count";s:3:"617";}s:6:"slider";a:3:{s:4:"name";s:6:"slider";s:4:"slug";s:6:"slider";s:5:"count";s:3:"610";}s:5:"stats";a:3:{s:4:"name";s:5:"stats";s:4:"slug";s:5:"stats";s:5:"count";s:3:"599";}s:6:"button";a:3:{s:4:"name";s:6:"button";s:4:"slug";s:6:"button";s:5:"count";s:3:"593";}s:7:"comment";a:3:{s:4:"name";s:7:"comment";s:4:"slug";s:7:"comment";s:5:"count";s:3:"591";}s:5:"theme";a:3:{s:4:"name";s:5:"theme";s:4:"slug";s:5:"theme";s:5:"count";s:3:"583";}s:4:"menu";a:3:{s:4:"name";s:4:"menu";s:4:"slug";s:4:"menu";s:5:"count";s:3:"577";}s:4:"tags";a:3:{s:4:"name";s:4:"tags";s:4:"slug";s:4:"tags";s:5:"count";s:3:"576";}s:9:"dashboard";a:3:{s:4:"name";s:9:"dashboard";s:4:"slug";s:9:"dashboard";s:5:"count";s:3:"570";}s:10:"categories";a:3:{s:4:"name";s:10:"categories";s:4:"slug";s:10:"categories";s:5:"count";s:3:"560";}s:10:"statistics";a:3:{s:4:"name";s:10:"statistics";s:4:"slug";s:10:"statistics";s:5:"count";s:3:"549";}s:6:"mobile";a:3:{s:4:"name";s:6:"mobile";s:4:"slug";s:6:"mobile";s:5:"count";s:3:"541";}s:3:"ads";a:3:{s:4:"name";s:3:"ads";s:4:"slug";s:3:"ads";s:5:"count";s:3:"541";}s:6:"editor";a:3:{s:4:"name";s:6:"editor";s:4:"slug";s:6:"editor";s:5:"count";s:3:"526";}s:4:"user";a:3:{s:4:"name";s:4:"user";s:4:"slug";s:4:"user";s:5:"count";s:3:"526";}s:5:"users";a:3:{s:4:"name";s:5:"users";s:4:"slug";s:5:"users";s:5:"count";s:3:"515";}s:7:"picture";a:3:{s:4:"name";s:7:"picture";s:4:"slug";s:7:"picture";s:5:"count";s:3:"507";}s:4:"list";a:3:{s:4:"name";s:4:"list";s:4:"slug";s:4:"list";s:5:"count";s:3:"503";}s:7:"plugins";a:3:{s:4:"name";s:7:"plugins";s:4:"slug";s:7:"plugins";s:5:"count";s:3:"502";}s:9:"affiliate";a:3:{s:4:"name";s:9:"affiliate";s:4:"slug";s:9:"affiliate";s:5:"count";s:3:"500";}s:6:"simple";a:3:{s:4:"name";s:6:"simple";s:4:"slug";s:6:"simple";s:5:"count";s:3:"483";}s:9:"multisite";a:3:{s:4:"name";s:9:"multisite";s:4:"slug";s:9:"multisite";s:5:"count";s:3:"483";}s:12:"contact-form";a:3:{s:4:"name";s:12:"contact form";s:4:"slug";s:12:"contact-form";s:5:"count";s:3:"477";}s:12:"social-media";a:3:{s:4:"name";s:12:"social media";s:4:"slug";s:12:"social-media";s:5:"count";s:3:"468";}s:8:"pictures";a:3:{s:4:"name";s:8:"pictures";s:4:"slug";s:8:"pictures";s:5:"count";s:3:"458";}s:7:"contact";a:3:{s:4:"name";s:7:"contact";s:4:"slug";s:7:"contact";s:5:"count";s:3:"457";}s:10:"navigation";a:3:{s:4:"name";s:10:"navigation";s:4:"slug";s:10:"navigation";s:5:"count";s:3:"432";}s:3:"url";a:3:{s:4:"name";s:3:"url";s:4:"slug";s:3:"url";s:5:"count";s:3:"432";}s:4:"html";a:3:{s:4:"name";s:4:"html";s:4:"slug";s:4:"html";s:5:"count";s:3:"426";}s:4:"shop";a:3:{s:4:"name";s:4:"shop";s:4:"slug";s:4:"shop";s:5:"count";s:3:"426";}s:5:"flash";a:3:{s:4:"name";s:5:"flash";s:4:"slug";s:5:"flash";s:5:"count";s:3:"425";}s:3:"api";a:3:{s:4:"name";s:3:"api";s:4:"slug";s:3:"api";s:5:"count";s:3:"418";}s:10:"newsletter";a:3:{s:4:"name";s:10:"newsletter";s:4:"slug";s:10:"newsletter";s:5:"count";s:3:"413";}s:9:"marketing";a:3:{s:4:"name";s:9:"marketing";s:4:"slug";s:9:"marketing";s:5:"count";s:3:"411";}s:4:"meta";a:3:{s:4:"name";s:4:"meta";s:4:"slug";s:4:"meta";s:5:"count";s:3:"409";}s:8:"calendar";a:3:{s:4:"name";s:8:"calendar";s:4:"slug";s:8:"calendar";s:5:"count";s:3:"406";}s:6:"events";a:3:{s:4:"name";s:6:"events";s:4:"slug";s:6:"events";s:5:"count";s:3:"401";}s:3:"tag";a:3:{s:4:"name";s:3:"tag";s:4:"slug";s:3:"tag";s:5:"count";s:3:"400";}s:4:"news";a:3:{s:4:"name";s:4:"News";s:4:"slug";s:4:"news";s:5:"count";s:3:"398";}s:8:"tracking";a:3:{s:4:"name";s:8:"tracking";s:4:"slug";s:8:"tracking";s:5:"count";s:3:"393";}s:10:"shortcodes";a:3:{s:4:"name";s:10:"shortcodes";s:4:"slug";s:10:"shortcodes";s:5:"count";s:3:"391";}s:11:"advertising";a:3:{s:4:"name";s:11:"advertising";s:4:"slug";s:11:"advertising";s:5:"count";s:3:"389";}s:9:"thumbnail";a:3:{s:4:"name";s:9:"thumbnail";s:4:"slug";s:9:"thumbnail";s:5:"count";s:3:"388";}s:4:"text";a:3:{s:4:"name";s:4:"text";s:4:"slug";s:4:"text";s:5:"count";s:3:"384";}s:6:"upload";a:3:{s:4:"name";s:6:"upload";s:4:"slug";s:6:"upload";s:5:"count";s:3:"381";}s:4:"code";a:3:{s:4:"name";s:4:"code";s:4:"slug";s:4:"code";s:5:"count";s:3:"381";}s:9:"automatic";a:3:{s:4:"name";s:9:"automatic";s:4:"slug";s:9:"automatic";s:5:"count";s:3:"378";}s:8:"lightbox";a:3:{s:4:"name";s:8:"lightbox";s:4:"slug";s:8:"lightbox";s:5:"count";s:3:"376";}s:6:"paypal";a:3:{s:4:"name";s:6:"paypal";s:4:"slug";s:6:"paypal";s:5:"count";s:3:"375";}s:7:"sharing";a:3:{s:4:"name";s:7:"sharing";s:4:"slug";s:7:"sharing";s:5:"count";s:3:"374";}}', 'yes'),
(229, 'oasiswf_info', 'a:2:{s:7:"version";s:3:"1.9";s:10:"db_version";s:3:"1.9";}', 'yes'),
(230, 'oasiswf_process', 'a:3:{s:10:"assignment";s:81:"http://localhost/guidaides/site/web/app/plugins/oasis-workflow/img/assignment.gif";s:6:"review";s:77:"http://localhost/guidaides/site/web/app/plugins/oasis-workflow/img/review.gif";s:7:"publish";s:78:"http://localhost/guidaides/site/web/app/plugins/oasis-workflow/img/publish.gif";}', 'yes'),
(231, 'oasiswf_path', 'a:2:{s:7:"success";a:2:{i:0;s:7:"Success";i:1;s:4:"blue";}s:7:"failure";a:2:{i:0;s:7:"Failure";i:1;s:3:"red";}}', 'yes'),
(232, 'oasiswf_status', 'a:3:{s:10:"assignment";s:11:"In Progress";s:6:"review";s:9:"In Review";s:7:"publish";s:16:"Ready to Publish";}', 'yes'),
(233, 'oasiswf_placeholders', 'a:3:{s:12:"%first_name%";s:10:"first name";s:11:"%last_name%";s:9:"last name";s:12:"%post_title%";s:10:"post title";}', 'yes'),
(234, 'oasiswf_show_upgrade_notice', 'yes', 'yes'),
(235, 'oasiswf_skip_workflow_roles', 'a:2:{i:0;s:13:"administrator";i:1;s:6:"editor";}', 'yes'),
(236, 'oasiswf_show_wfsettings_on_post_types', 'a:2:{i:0;s:4:"aide";i:1;s:3:"aap";}', 'yes'),
(237, 'oasiswf_email_settings', 'a:5:{s:9:"from_name";s:0:"";s:18:"from_email_address";s:0:"";s:17:"assignment_emails";s:0:"";s:15:"reminder_emails";s:0:"";s:19:"post_publish_emails";s:0:"";}', 'yes'),
(239, 'oasiswf_default_due_days', '5', 'yes'),
(240, 'oasiswf_activate_workflow', 'active', 'yes'),
(241, 'oasiswf_hide_workflow_graphic', 'yes', 'yes'),
(243, 'oasiswf_custom_workflow_terminology', 'a:7:{s:20:"submitToWorkflowText";s:9:"Soumettre";s:11:"signOffText";s:9:"Approuver";s:16:"assignActorsText";s:27:"Personne(s) désignée(s) :";s:11:"dueDateText";s:11:"Date butoir";s:15:"publishDateText";s:19:"Date de publication";s:17:"abortWorkflowText";s:19:"Annuler le workflow";s:19:"workflowHistoryText";s:16:"Workflow History";}', 'yes'),
(247, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:65:"https://downloads.wordpress.org/release/fr_FR/wordpress-4.4.2.zip";s:6:"locale";s:5:"fr_FR";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:65:"https://downloads.wordpress.org/release/fr_FR/wordpress-4.4.2.zip";s:10:"no_content";b:0;s:11:"new_bundled";b:0;s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.4.2";s:7:"version";s:5:"4.4.2";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.4";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1455095588;s:15:"version_checked";s:5:"4.4.2";s:12:"translations";a:0:{}}', 'yes'),
(248, '_site_transient_update_plugins', 'O:8:"stdClass":4:{s:12:"last_checked";i:1455104362;s:8:"response";a:0:{}s:12:"translations";a:0:{}s:9:"no_update";a:5:{s:30:"advanced-custom-fields/acf.php";O:8:"stdClass":6:{s:2:"id";s:5:"21367";s:4:"slug";s:22:"advanced-custom-fields";s:6:"plugin";s:30:"advanced-custom-fields/acf.php";s:11:"new_version";s:5:"4.4.5";s:3:"url";s:53:"https://wordpress.org/plugins/advanced-custom-fields/";s:7:"package";s:71:"https://downloads.wordpress.org/plugin/advanced-custom-fields.4.4.5.zip";}s:19:"members/members.php";O:8:"stdClass":6:{s:2:"id";s:5:"10325";s:4:"slug";s:7:"members";s:6:"plugin";s:19:"members/members.php";s:11:"new_version";s:5:"1.1.1";s:3:"url";s:38:"https://wordpress.org/plugins/members/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/members.1.1.1.zip";}s:27:"ninja-forms/ninja-forms.php";O:8:"stdClass":6:{s:2:"id";s:5:"27901";s:4:"slug";s:11:"ninja-forms";s:6:"plugin";s:27:"ninja-forms/ninja-forms.php";s:11:"new_version";s:6:"2.9.33";s:3:"url";s:42:"https://wordpress.org/plugins/ninja-forms/";s:7:"package";s:61:"https://downloads.wordpress.org/plugin/ninja-forms.2.9.33.zip";}s:14:"types/wpcf.php";O:8:"stdClass":6:{s:2:"id";s:5:"24557";s:4:"slug";s:5:"types";s:6:"plugin";s:14:"types/wpcf.php";s:11:"new_version";s:6:"1.8.11";s:3:"url";s:36:"https://wordpress.org/plugins/types/";s:7:"package";s:55:"https://downloads.wordpress.org/plugin/types.1.8.11.zip";}s:24:"wordpress-seo/wp-seo.php";O:8:"stdClass":6:{s:2:"id";s:4:"5899";s:4:"slug";s:13:"wordpress-seo";s:6:"plugin";s:24:"wordpress-seo/wp-seo.php";s:11:"new_version";s:5:"3.0.7";s:3:"url";s:44:"https://wordpress.org/plugins/wordpress-seo/";s:7:"package";s:62:"https://downloads.wordpress.org/plugin/wordpress-seo.3.0.7.zip";}}}', 'yes'),
(249, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1455095704;s:7:"checked";a:7:{s:4:"sage";s:5:"8.4.1";s:12:"twentyeleven";s:3:"2.3";s:13:"twentyfifteen";s:3:"1.4";s:14:"twentyfourteen";s:3:"1.6";s:9:"twentyten";s:3:"2.1";s:14:"twentythirteen";s:3:"1.7";s:12:"twentytwelve";s:3:"1.9";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'yes'),
(263, '_transient_timeout_feed_b9388c83948825c1edaef0d856b7b109', '1455054421', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(264, '_transient_feed_b9388c83948825c1edaef0d856b7b109', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n	\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:117:"\n		\n		\n		\n		\n		\n		\n				\n\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:34:"WordPress Plugins » View: Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:45:"https://wordpress.org/plugins/browse/popular/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:34:"WordPress Plugins » View: Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 09 Feb 2016 09:15:16 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:25:"http://bbpress.org/?v=1.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:30:{i:0;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:25:"Google Analytics by Yoast";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:71:"https://wordpress.org/plugins/google-analytics-for-wordpress/#post-2316";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 14 Sep 2007 12:15:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2316@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:124:"Track your WordPress site easily with the latest tracking codes and lots added data for search result pages and error pages.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"All in One SEO Pack";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"https://wordpress.org/plugins/all-in-one-seo-pack/#post-753";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 30 Mar 2007 20:08:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"753@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:126:"All in One SEO Pack is a WordPress SEO plugin to automatically optimize your WordPress blog for Search Engines such as Google.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Anonymous";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"Google XML Sitemaps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"https://wordpress.org/plugins/google-sitemap-generator/#post-132";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:31:32 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"132@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:105:"This plugin will generate a special XML sitemap which will help search engines to better index your blog.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Arne Brachhold";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"WooCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/woocommerce/#post-29860";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Sep 2011 08:13:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"29860@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:97:"WooCommerce is a powerful, extendable eCommerce plugin that helps you sell anything. Beautifully.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"WooThemes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"Regenerate Thumbnails";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"https://wordpress.org/plugins/regenerate-thumbnails/#post-6743";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 23 Aug 2008 14:38:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"6743@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:76:"Allows you to regenerate your thumbnails after changing the thumbnail sizes.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:25:"Alex Mills (Viper007Bond)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"W3 Total Cache";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/plugins/w3-total-cache/#post-12073";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 29 Jul 2009 18:46:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"12073@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:132:"Easy Web Performance Optimization (WPO) using caching: browser, page, object, database, minify and content delivery network support.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Frederick Townes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"Duplicate Post";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/duplicate-post/#post-2646";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 05 Dec 2007 17:40:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2646@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:22:"Clone posts and pages.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Lopo";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"WP-PageNavi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/wp-pagenavi/#post-363";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 23:17:57 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"363@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:49:"Adds a more advanced paging navigation interface.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Lester Chan";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WordPress Importer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/wordpress-importer/#post-18101";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 May 2010 17:42:45 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"18101@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:101:"Import posts, pages, comments, custom fields, categories, tags and more from a WordPress export file.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Brian Colinger";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"Contact Form 7";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/contact-form-7/#post-2141";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 02 Aug 2007 12:45:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2141@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:54:"Just another contact form plugin. Simple but flexible.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Takayuki Miyoshi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"WP Super Cache";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/wp-super-cache/#post-2572";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Nov 2007 11:40:04 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2572@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:73:"A very fast caching engine for WordPress that produces static html files.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Donncha O Caoimh";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"TinyMCE Advanced";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:57:"https://wordpress.org/plugins/tinymce-advanced/#post-2082";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 27 Jun 2007 15:00:26 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2082@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:71:"Enables the advanced features of TinyMCE, the WordPress WYSIWYG editor.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Andrew Ozz";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"Hello Dolly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"https://wordpress.org/plugins/hello-dolly/#post-5790";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 29 May 2008 22:11:34 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"5790@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:150:"This is not just a plugin, it symbolizes the hope and enthusiasm of an entire generation summed up in two words sung most famously by Louis Armstrong.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"Akismet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:46:"https://wordpress.org/plugins/akismet/#post-15";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:11:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"15@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:98:"Akismet checks your comments against the Akismet Web service to see if they look like spam or not.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"Wordfence Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/wordfence/#post-29832";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 04 Sep 2011 03:13:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"29832@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:138:"The Wordfence WordPress security plugin provides free enterprise-class WordPress security, protecting your website from hacks and malware.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Wordfence";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:15;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"NextGEN Gallery";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/plugins/nextgen-gallery/#post-1169";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Apr 2007 20:08:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"1169@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:121:"The most popular WordPress gallery plugin and one of the most popular plugins of all time with over 13 million downloads.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Alex Rabe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:16;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Jetpack by WordPress.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:49:"https://wordpress.org/plugins/jetpack/#post-23862";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 Jan 2011 02:21:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"23862@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:27:"Your WordPress, Simplified.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Tim Moore";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:17;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"Really Simple CAPTCHA";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"https://wordpress.org/plugins/really-simple-captcha/#post-9542";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 09 Mar 2009 02:17:35 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"9542@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:138:"Really Simple CAPTCHA is a CAPTCHA module intended to be called from other plugins. It is originally created for my Contact Form 7 plugin.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Takayuki Miyoshi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:18;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:9:"Yoast SEO";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:54:"https://wordpress.org/plugins/wordpress-seo/#post-8321";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 01 Jan 2009 20:34:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"8321@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:114:"Improve your WordPress SEO: Write better content and have a fully optimized WordPress site using Yoast SEO plugin.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:19;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:22:"Advanced Custom Fields";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"https://wordpress.org/plugins/advanced-custom-fields/#post-25254";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 17 Mar 2011 04:07:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"25254@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:68:"Customise WordPress with powerful, professional and intuitive fields";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"elliotcondon";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:20;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"Disable Comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:58:"https://wordpress.org/plugins/disable-comments/#post-26907";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 27 May 2011 04:42:58 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"26907@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:134:"Allows administrators to globally disable comments on their site. Comments can be disabled according to post type. Multisite friendly.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Samir Shah";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:21;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WP Multibyte Patch";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/wp-multibyte-patch/#post-28395";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Jul 2011 12:22:53 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"28395@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:71:"Multibyte functionality enhancement for the WordPress Japanese package.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"plugin-master";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:22;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"Page Builder by SiteOrigin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"https://wordpress.org/plugins/siteorigin-panels/#post-51888";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 11 Apr 2013 10:36:42 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"51888@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:111:"Build responsive page layouts using the widgets you know and love using this simple drag and drop page builder.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Greg Priday";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:23;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:27:"Black Studio TinyMCE Widget";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://wordpress.org/plugins/black-studio-tinymce-widget/#post-31973";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 10 Nov 2011 15:06:14 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"31973@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:39:"The visual editor widget for Wordpress.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Marco Chiesi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:24;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:46:"iThemes Security (formerly Better WP Security)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/better-wp-security/#post-21738";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 22 Oct 2010 22:06:05 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"21738@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:150:"Protect your WordPress site by hiding vital areas of your site, protecting access to important files, preventing brute-force login attempts, detecting";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Chris Wiegman";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:25;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"Google Analytics Dashboard for WP";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:75:"https://wordpress.org/plugins/google-analytics-dashboard-for-wp/#post-50539";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 10 Mar 2013 17:07:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"50539@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:127:"Displays Google Analytics reports in your WordPress Dashboard. Inserts the latest Google Analytics tracking code in your pages.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Alin Marcu";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:26;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:34:"UpdraftPlus Backup and Restoration";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/updraftplus/#post-38058";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 21 May 2012 15:14:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"38058@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:148:"Backup and restoration made easy. Complete backups; manual or scheduled (backup to S3, Dropbox, Google Drive, Rackspace, FTP, SFTP, email + others).";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"David Anderson";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:27;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Clef Two-Factor Authentication";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:48:"https://wordpress.org/plugins/wpclef/#post-47509";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 27 Dec 2012 01:25:57 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"47509@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:138:"Modern two-factor that people love to use: strong authentication without passwords or tokens; single sign on/off; magical user experience.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Dave Ross";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:28;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:10:"Duplicator";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"https://wordpress.org/plugins/duplicator/#post-26607";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 16 May 2011 12:15:41 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"26607@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:88:"Duplicate, clone, backup, move and transfer an entire site from one location to another.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Cory Lamle";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:29;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:11:"Meta Slider";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/plugins/ml-slider/#post-49521";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Feb 2013 16:56:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"49521@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:145:"Easy to use WordPress slider plugin. Create SEO optimised responsive slideshows with Nivo Slider, Flex Slider, Coin Slider and Responsive Slides.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Matcha Labs";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:46:"https://wordpress.org/plugins/rss/view/popular";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:12:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Tue, 09 Feb 2016 09:46:59 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:25:"strict-transport-security";s:11:"max-age=360";s:7:"expires";s:29:"Tue, 09 Feb 2016 09:50:16 GMT";s:13:"cache-control";s:0:"";s:6:"pragma";s:0:"";s:13:"last-modified";s:31:"Tue, 09 Feb 2016 09:15:16 +0000";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 250";}s:5:"build";s:14:"20160208143941";}', 'no'),
(265, '_transient_timeout_feed_mod_b9388c83948825c1edaef0d856b7b109', '1455054421', 'no'),
(266, '_transient_feed_mod_b9388c83948825c1edaef0d856b7b109', '1455011221', 'no'),
(269, '_site_transient_timeout_browser_b2b3dba9c11a5bff2b6abe2b38145363', '1455616063', 'yes'),
(270, '_site_transient_browser_b2b3dba9c11a5bff2b6abe2b38145363', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"48.0.2564.103";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(275, 'oasiswf_reminder_days', '', 'yes'),
(276, 'oasiswf_reminder_days_after', '', 'yes'),
(310, '_transient_timeout_nf_form_1', '1455122015', 'no'),
(311, '_transient_nf_form_1', 'O:7:"NF_Form":5:{s:7:"form_id";i:1;s:8:"settings";a:18:{s:12:"date_updated";s:10:"2016-02-08";s:10:"form_title";s:12:"Contact Form";s:10:"show_title";s:1:"0";s:9:"save_subs";s:1:"1";s:9:"logged_in";s:1:"0";s:11:"append_page";s:0:"";s:4:"ajax";s:1:"0";s:14:"clear_complete";s:1:"1";s:13:"hide_complete";s:1:"1";s:11:"success_msg";s:42:"Your form has been successfully submitted.";s:10:"email_from";s:0:"";s:10:"email_type";s:4:"html";s:14:"user_email_msg";s:69:"Thank you so much for contacting us. We will get back to you shortly.";s:17:"user_email_fields";s:1:"0";s:15:"admin_email_msg";s:0:"";s:18:"admin_email_fields";s:1:"1";s:16:"admin_attach_csv";s:1:"0";s:15:"email_from_name";s:0:"";}s:6:"fields";a:5:{i:1;a:7:{s:2:"id";s:1:"1";s:7:"form_id";s:1:"1";s:4:"type";s:5:"_text";s:5:"order";s:1:"0";s:4:"data";a:24:{s:5:"label";s:4:"Name";s:9:"label_pos";s:5:"above";s:13:"default_value";s:0:"";s:4:"mask";s:0:"";s:10:"datepicker";s:1:"0";s:5:"email";s:1:"0";s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:9:"from_name";s:1:"0";s:14:"user_address_1";s:0:"";s:14:"user_address_2";s:0:"";s:9:"user_city";s:0:"";s:8:"user_zip";s:0:"";s:10:"user_phone";s:0:"";s:10:"user_email";s:0:"";s:21:"user_info_field_group";s:0:"";s:3:"req";s:1:"1";s:5:"class";s:0:"";s:9:"show_help";s:1:"0";s:9:"help_text";s:0:"";s:9:"show_desc";s:1:"0";s:8:"desc_pos";s:4:"none";s:9:"desc_text";s:0:"";s:17:"calc_auto_include";s:1:"0";}s:6:"fav_id";s:1:"0";s:6:"def_id";s:1:"0";}i:2;a:7:{s:2:"id";s:1:"2";s:7:"form_id";s:1:"1";s:4:"type";s:5:"_text";s:5:"order";s:1:"1";s:4:"data";a:28:{s:5:"label";s:5:"Email";s:9:"label_pos";s:5:"above";s:13:"default_value";s:0:"";s:4:"mask";s:0:"";s:10:"datepicker";s:1:"0";s:5:"email";s:1:"1";s:10:"first_name";s:1:"0";s:9:"last_name";s:1:"0";s:9:"from_name";s:1:"0";s:14:"user_address_1";s:1:"0";s:14:"user_address_2";s:1:"0";s:9:"user_city";s:1:"0";s:8:"user_zip";s:1:"0";s:10:"user_phone";s:1:"0";s:10:"user_email";s:1:"1";s:21:"user_info_field_group";s:1:"1";s:3:"req";s:1:"1";s:5:"class";s:0:"";s:9:"show_help";s:1:"0";s:9:"help_text";s:0:"";s:17:"calc_auto_include";s:1:"0";s:11:"calc_option";s:1:"0";s:11:"conditional";s:0:"";s:26:"user_info_field_group_name";s:0:"";s:28:"user_info_field_group_custom";s:0:"";s:9:"show_desc";s:1:"0";s:8:"desc_pos";s:4:"none";s:9:"desc_text";s:0:"";}s:6:"fav_id";s:1:"0";s:6:"def_id";s:2:"14";}i:3;a:7:{s:2:"id";s:1:"3";s:7:"form_id";s:1:"1";s:4:"type";s:9:"_textarea";s:5:"order";s:1:"2";s:4:"data";a:14:{s:5:"label";s:7:"Message";s:9:"label_pos";s:5:"above";s:13:"default_value";s:0:"";s:12:"textarea_rte";s:1:"0";s:14:"textarea_media";s:1:"0";s:18:"disable_rte_mobile";s:1:"0";s:3:"req";s:1:"1";s:5:"class";s:0:"";s:9:"show_help";s:1:"0";s:9:"help_text";s:0:"";s:9:"show_desc";s:1:"0";s:8:"desc_pos";s:4:"none";s:9:"desc_text";s:0:"";s:17:"calc_auto_include";s:1:"0";}s:6:"fav_id";s:1:"0";s:6:"def_id";s:1:"0";}i:4;a:7:{s:2:"id";s:1:"4";s:7:"form_id";s:1:"1";s:4:"type";s:5:"_spam";s:5:"order";s:1:"3";s:4:"data";a:10:{s:5:"label";s:25:"What is thirteen minus 6?";s:9:"label_pos";s:4:"left";s:11:"spam_answer";s:1:"7";s:3:"req";s:1:"1";s:5:"class";s:0:"";s:9:"show_help";s:1:"0";s:9:"help_text";s:0:"";s:9:"show_desc";s:1:"0";s:8:"desc_pos";s:4:"none";s:9:"desc_text";s:0:"";}s:6:"fav_id";s:1:"0";s:6:"def_id";s:1:"0";}i:5;a:7:{s:2:"id";s:1:"5";s:7:"form_id";s:1:"1";s:4:"type";s:7:"_submit";s:5:"order";s:1:"4";s:4:"data";a:7:{s:5:"label";s:4:"Send";s:5:"class";s:0:"";s:9:"show_help";s:1:"0";s:9:"help_text";s:0:"";s:9:"show_desc";s:1:"0";s:8:"desc_pos";s:4:"none";s:9:"desc_text";s:0:"";}s:6:"fav_id";s:1:"0";s:6:"def_id";s:1:"0";}}s:10:"field_keys";a:0:{}s:6:"errors";a:0:{}}', 'no'),
(337, 'profil_children', 'a:0:{}', 'yes'),
(358, '_transient_timeout_dash_bd94b8f41e74bae2f4dc72e9bd8379af', '1455139164', 'no'),
(359, '_transient_dash_bd94b8f41e74bae2f4dc72e9bd8379af', '<div class="rss-widget"><p><strong>Erreur RSS&nbsp;:</strong> WP HTTP Error: 110: Connection timed out</p></div><div class="rss-widget"><p><strong>Erreur RSS&nbsp;:</strong> WP HTTP Error: 110: Connection timed out</p></div>', 'no'),
(378, 'wpseo_taxonomy_meta', 'a:0:{}', 'yes'),
(389, 'thematique_children', 'a:0:{}', 'yes'),
(415, '_site_transient_timeout_theme_roots', '1455106114', 'yes'),
(416, '_site_transient_theme_roots', 'a:7:{s:4:"sage";s:7:"/themes";s:12:"twentyeleven";s:45:"/var/www/guide-aides/web/wp/wp-content/themes";s:13:"twentyfifteen";s:45:"/var/www/guide-aides/web/wp/wp-content/themes";s:14:"twentyfourteen";s:45:"/var/www/guide-aides/web/wp/wp-content/themes";s:9:"twentyten";s:45:"/var/www/guide-aides/web/wp/wp-content/themes";s:14:"twentythirteen";s:45:"/var/www/guide-aides/web/wp/wp-content/themes";s:12:"twentytwelve";s:45:"/var/www/guide-aides/web/wp/wp-content/themes";}', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(424, 'rewrite_rules', 'a:189:{s:19:"sitemap_index\\.xml$";s:19:"index.php?sitemap=1";s:31:"([^/]+?)-sitemap([0-9]+)?\\.xml$";s:51:"index.php?sitemap=$matches[1]&sitemap_n=$matches[2]";s:24:"([a-z]+)?-?sitemap\\.xsl$";s:25:"index.php?xsl=$matches[1]";s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:7:"aide/?$";s:24:"index.php?post_type=aide";s:37:"aide/feed/(feed|rdf|rss|rss2|atom)/?$";s:41:"index.php?post_type=aide&feed=$matches[1]";s:32:"aide/(feed|rdf|rss|rss2|atom)/?$";s:41:"index.php?post_type=aide&feed=$matches[1]";s:24:"aide/page/([0-9]{1,})/?$";s:42:"index.php?post_type=aide&paged=$matches[1]";s:6:"aap/?$";s:23:"index.php?post_type=aap";s:36:"aap/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?post_type=aap&feed=$matches[1]";s:31:"aap/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?post_type=aap&feed=$matches[1]";s:23:"aap/page/([0-9]{1,})/?$";s:41:"index.php?post_type=aap&paged=$matches[1]";s:42:"wp-types-group/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:52:"wp-types-group/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:72:"wp-types-group/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:67:"wp-types-group/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:67:"wp-types-group/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:48:"wp-types-group/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:31:"wp-types-group/([^/]+)/embed/?$";s:47:"index.php?wp-types-group=$matches[1]&embed=true";s:35:"wp-types-group/([^/]+)/trackback/?$";s:41:"index.php?wp-types-group=$matches[1]&tb=1";s:43:"wp-types-group/([^/]+)/page/?([0-9]{1,})/?$";s:54:"index.php?wp-types-group=$matches[1]&paged=$matches[2]";s:50:"wp-types-group/([^/]+)/comment-page-([0-9]{1,})/?$";s:54:"index.php?wp-types-group=$matches[1]&cpage=$matches[2]";s:39:"wp-types-group/([^/]+)(?:/([0-9]+))?/?$";s:53:"index.php?wp-types-group=$matches[1]&page=$matches[2]";s:31:"wp-types-group/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:41:"wp-types-group/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:61:"wp-types-group/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:56:"wp-types-group/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:56:"wp-types-group/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:37:"wp-types-group/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:47:"wp-types-user-group/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:57:"wp-types-user-group/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:77:"wp-types-user-group/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"wp-types-user-group/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"wp-types-user-group/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:53:"wp-types-user-group/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:36:"wp-types-user-group/([^/]+)/embed/?$";s:52:"index.php?wp-types-user-group=$matches[1]&embed=true";s:40:"wp-types-user-group/([^/]+)/trackback/?$";s:46:"index.php?wp-types-user-group=$matches[1]&tb=1";s:48:"wp-types-user-group/([^/]+)/page/?([0-9]{1,})/?$";s:59:"index.php?wp-types-user-group=$matches[1]&paged=$matches[2]";s:55:"wp-types-user-group/([^/]+)/comment-page-([0-9]{1,})/?$";s:59:"index.php?wp-types-user-group=$matches[1]&cpage=$matches[2]";s:44:"wp-types-user-group/([^/]+)(?:/([0-9]+))?/?$";s:58:"index.php?wp-types-user-group=$matches[1]&page=$matches[2]";s:36:"wp-types-user-group/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:46:"wp-types-user-group/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:66:"wp-types-user-group/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:61:"wp-types-user-group/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:61:"wp-types-user-group/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:42:"wp-types-user-group/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:34:"nf_sub/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:44:"nf_sub/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:64:"nf_sub/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"nf_sub/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"nf_sub/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:40:"nf_sub/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:23:"nf_sub/([^/]+)/embed/?$";s:39:"index.php?nf_sub=$matches[1]&embed=true";s:27:"nf_sub/([^/]+)/trackback/?$";s:33:"index.php?nf_sub=$matches[1]&tb=1";s:35:"nf_sub/([^/]+)/page/?([0-9]{1,})/?$";s:46:"index.php?nf_sub=$matches[1]&paged=$matches[2]";s:42:"nf_sub/([^/]+)/comment-page-([0-9]{1,})/?$";s:46:"index.php?nf_sub=$matches[1]&cpage=$matches[2]";s:31:"nf_sub/([^/]+)(?:/([0-9]+))?/?$";s:45:"index.php?nf_sub=$matches[1]&page=$matches[2]";s:23:"nf_sub/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:33:"nf_sub/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:53:"nf_sub/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:48:"nf_sub/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:48:"nf_sub/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:29:"nf_sub/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:45:"profil/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:45:"index.php?profil=$matches[1]&feed=$matches[2]";s:40:"profil/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:45:"index.php?profil=$matches[1]&feed=$matches[2]";s:33:"profil/(.+?)/page/?([0-9]{1,})/?$";s:46:"index.php?profil=$matches[1]&paged=$matches[2]";s:15:"profil/(.+?)/?$";s:28:"index.php?profil=$matches[1]";s:49:"thematique/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?thematique=$matches[1]&feed=$matches[2]";s:44:"thematique/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?thematique=$matches[1]&feed=$matches[2]";s:37:"thematique/(.+?)/page/?([0-9]{1,})/?$";s:50:"index.php?thematique=$matches[1]&paged=$matches[2]";s:19:"thematique/(.+?)/?$";s:32:"index.php?thematique=$matches[1]";s:62:"particulier-education/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:60:"index.php?particulier-education=$matches[1]&feed=$matches[2]";s:57:"particulier-education/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:60:"index.php?particulier-education=$matches[1]&feed=$matches[2]";s:50:"particulier-education/([^/]+)/page/?([0-9]{1,})/?$";s:61:"index.php?particulier-education=$matches[1]&paged=$matches[2]";s:32:"particulier-education/([^/]+)/?$";s:43:"index.php?particulier-education=$matches[1]";s:32:"aide/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:42:"aide/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:62:"aide/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:57:"aide/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:57:"aide/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:38:"aide/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:21:"aide/([^/]+)/embed/?$";s:37:"index.php?aide=$matches[1]&embed=true";s:25:"aide/([^/]+)/trackback/?$";s:31:"index.php?aide=$matches[1]&tb=1";s:45:"aide/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?aide=$matches[1]&feed=$matches[2]";s:40:"aide/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?aide=$matches[1]&feed=$matches[2]";s:33:"aide/([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?aide=$matches[1]&paged=$matches[2]";s:40:"aide/([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?aide=$matches[1]&cpage=$matches[2]";s:29:"aide/([^/]+)(?:/([0-9]+))?/?$";s:43:"index.php?aide=$matches[1]&page=$matches[2]";s:21:"aide/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:31:"aide/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:51:"aide/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:46:"aide/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:46:"aide/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:27:"aide/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:31:"aap/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:41:"aap/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:61:"aap/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:56:"aap/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:56:"aap/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:37:"aap/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:20:"aap/([^/]+)/embed/?$";s:36:"index.php?aap=$matches[1]&embed=true";s:24:"aap/([^/]+)/trackback/?$";s:30:"index.php?aap=$matches[1]&tb=1";s:44:"aap/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?aap=$matches[1]&feed=$matches[2]";s:39:"aap/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?aap=$matches[1]&feed=$matches[2]";s:32:"aap/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?aap=$matches[1]&paged=$matches[2]";s:39:"aap/([^/]+)/comment-page-([0-9]{1,})/?$";s:43:"index.php?aap=$matches[1]&cpage=$matches[2]";s:28:"aap/([^/]+)(?:/([0-9]+))?/?$";s:42:"index.php?aap=$matches[1]&page=$matches[2]";s:20:"aap/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:30:"aap/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:50:"aap/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:45:"aap/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:45:"aap/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:26:"aap/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:58:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:68:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:88:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:83:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:64:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:53:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$";s:91:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$";s:85:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1";s:77:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]";s:65:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]";s:72:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$";s:98:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]";s:61:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$";s:97:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]";s:47:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:57:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:77:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:72:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:53:"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]";s:51:"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]";s:38:"([0-9]{4})/comment-page-([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&cpage=$matches[2]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";}', 'yes');

-- --------------------------------------------------------

--
-- Structure de la table `wp_postmeta`
--

CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=170 ;

--
-- Contenu de la table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 6, '_edit_last', '1'),
(4, 6, 'position', 'acf_after_title'),
(5, 6, 'layout', 'no_box'),
(6, 6, 'hide_on_screen', 'a:8:{i:0;s:11:"the_content";i:1;s:10:"discussion";i:2;s:8:"comments";i:3;s:4:"slug";i:4;s:6:"format";i:5;s:14:"featured_image";i:6;s:10:"categories";i:7;s:15:"send-trackbacks";}'),
(7, 6, '_edit_lock', '1455104975:1'),
(8, 6, 'field_56b8b6548f6f6', 'a:8:{s:3:"key";s:19:"field_56b8b6548f6f6";s:5:"label";s:9:"Objectifs";s:4:"name";s:0:"";s:4:"type";s:3:"tab";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:0;}'),
(9, 6, 'field_56b8b5d78f6f3', 'a:11:{s:3:"key";s:19:"field_56b8b5d78f6f3";s:5:"label";s:9:"Objectifs";s:4:"name";s:9:"objectifs";s:4:"type";s:7:"wysiwyg";s:12:"instructions";s:0:"";s:8:"required";s:1:"1";s:13:"default_value";s:0:"";s:7:"toolbar";s:5:"basic";s:12:"media_upload";s:2:"no";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:1;}'),
(10, 6, 'field_56b8b6968f6f7', 'a:8:{s:3:"key";s:19:"field_56b8b6968f6f7";s:5:"label";s:9:"Critères";s:4:"name";s:0:"";s:4:"type";s:3:"tab";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:2;}'),
(11, 6, 'field_56b8b6088f6f4', 'a:11:{s:3:"key";s:19:"field_56b8b6088f6f4";s:5:"label";s:25:"Critères d''éligibilité";s:4:"name";s:8:"criteres";s:4:"type";s:7:"wysiwyg";s:12:"instructions";s:0:"";s:8:"required";s:1:"1";s:13:"default_value";s:0:"";s:7:"toolbar";s:5:"basic";s:12:"media_upload";s:2:"no";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:3;}'),
(12, 6, 'field_56b8b6a48f6f8', 'a:8:{s:3:"key";s:19:"field_56b8b6a48f6f8";s:5:"label";s:10:"Démarches";s:4:"name";s:0:"";s:4:"type";s:3:"tab";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:4;}'),
(13, 6, 'field_56b8b62d8f6f5', 'a:11:{s:3:"key";s:19:"field_56b8b62d8f6f5";s:5:"label";s:10:"Démarches";s:4:"name";s:9:"demarches";s:4:"type";s:7:"wysiwyg";s:12:"instructions";s:0:"";s:8:"required";s:1:"1";s:13:"default_value";s:0:"";s:7:"toolbar";s:5:"basic";s:12:"media_upload";s:2:"no";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:5;}'),
(14, 6, 'field_56b8b7b98f700', 'a:14:{s:3:"key";s:19:"field_56b8b7b98f700";s:5:"label";s:19:"Procédure en ligne";s:4:"name";s:6:"online";s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:11:"placeholder";s:7:"http://";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:6;}'),
(15, 6, 'field_56b8b6b18f6f9', 'a:8:{s:3:"key";s:19:"field_56b8b6b18f6f9";s:5:"label";s:8:"Contacts";s:4:"name";s:0:"";s:4:"type";s:3:"tab";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:7;}'),
(16, 6, 'field_56b8b6f58f6fc', 'a:11:{s:3:"key";s:19:"field_56b8b6f58f6fc";s:5:"label";s:12:"Informations";s:4:"name";s:12:"informations";s:4:"type";s:7:"wysiwyg";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:7:"toolbar";s:5:"basic";s:12:"media_upload";s:2:"no";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:8;}'),
(17, 6, 'field_56b8b6e88f6fb', 'a:8:{s:3:"key";s:19:"field_56b8b6e88f6fb";s:5:"label";s:9:"Documents";s:4:"name";s:0:"";s:4:"type";s:3:"tab";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:12;}'),
(18, 6, 'field_56b8b7088f6fd', 'a:14:{s:3:"key";s:19:"field_56b8b7088f6fd";s:5:"label";s:11:"Téléphone";s:4:"name";s:5:"phone";s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:2:"10";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:9;}'),
(19, 6, 'field_56b8b7668f6fe', 'a:12:{s:3:"key";s:19:"field_56b8b7668f6fe";s:5:"label";s:5:"Email";s:4:"name";s:5:"email";s:4:"type";s:5:"email";s:12:"instructions";s:0:"";s:8:"required";s:1:"1";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:10;}'),
(20, 6, 'field_56b8b7798f6ff', 'a:14:{s:3:"key";s:19:"field_56b8b7798f6ff";s:5:"label";s:4:"Lien";s:4:"name";s:4:"lien";s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:11:"placeholder";s:7:"http://";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:11;}'),
(23, 6, 'field_56b8b91689569', 'a:10:{s:3:"key";s:19:"field_56b8b91689569";s:5:"label";s:20:"Texte de référence";s:4:"name";s:9:"reference";s:4:"type";s:4:"file";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:11:"save_format";s:6:"object";s:7:"library";s:3:"all";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:13;}'),
(25, 9, '_edit_lock', '1454947907:1'),
(26, 10, '_edit_lock', '1455098358:4'),
(27, 10, '_edit_last', '2'),
(29, 11, '_edit_lock', '1454948435:2'),
(30, 10, 'objectifs', 't'),
(31, 10, '_objectifs', 'field_56b8b5d78f6f3'),
(32, 10, 'criteres', 't'),
(33, 10, '_criteres', 'field_56b8b6088f6f4'),
(34, 10, 'demarches', 't'),
(35, 10, '_demarches', 'field_56b8b62d8f6f5'),
(36, 10, 'online', ''),
(37, 10, '_online', 'field_56b8b7b98f700'),
(38, 10, 'informations', 't'),
(39, 10, '_informations', 'field_56b8b6f58f6fc'),
(40, 10, 'phone', ''),
(41, 10, '_phone', 'field_56b8b7088f6fd'),
(42, 10, 'email', 'test@gmail.com'),
(43, 10, '_email', 'field_56b8b7668f6fe'),
(44, 10, 'lien', ''),
(45, 10, '_lien', 'field_56b8b7798f6ff'),
(46, 10, 'reference', ''),
(47, 10, '_reference', 'field_56b8b91689569'),
(48, 14, '_edit_lock', '1455098525:3'),
(49, 14, '_edit_last', '2'),
(50, 15, '_edit_lock', '1455012890:2'),
(51, 4, '_edit_lock', '1455012850:1'),
(52, 15, '_edit_last', '2'),
(53, 16, '_edit_lock', '1455098729:1'),
(54, 16, '_edit_last', '2'),
(55, 16, 'objectifs', 't'),
(56, 16, '_objectifs', 'field_56b8b5d78f6f3'),
(57, 16, 'criteres', 't'),
(58, 16, '_criteres', 'field_56b8b6088f6f4'),
(59, 16, 'demarches', 't'),
(60, 16, '_demarches', 'field_56b8b62d8f6f5'),
(61, 16, 'online', ''),
(62, 16, '_online', 'field_56b8b7b98f700'),
(63, 16, 'informations', 't'),
(64, 16, '_informations', 'field_56b8b6f58f6fc'),
(65, 16, 'phone', ''),
(66, 16, '_phone', 'field_56b8b7088f6fd'),
(67, 16, 'email', 'test@domain.com'),
(68, 16, '_email', 'field_56b8b7668f6fe'),
(69, 16, 'lien', ''),
(70, 16, '_lien', 'field_56b8b7798f6ff'),
(71, 16, 'reference', ''),
(72, 16, '_reference', 'field_56b8b91689569'),
(73, 17, '_edit_lock', '1455105045:1'),
(74, 17, '_edit_last', '1'),
(75, 17, 'field_56ba177bb6155', 'a:13:{s:3:"key";s:19:"field_56ba177bb6155";s:5:"label";s:6:"Profil";s:4:"name";s:6:"profil";s:4:"type";s:8:"taxonomy";s:12:"instructions";s:0:"";s:8:"required";s:1:"1";s:8:"taxonomy";s:6:"profil";s:10:"field_type";s:8:"checkbox";s:10:"allow_null";s:1:"0";s:15:"load_save_terms";s:1:"1";s:13:"return_format";s:6:"object";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:2:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:0;}'),
(76, 17, 'field_56ba17a4b6156', 'a:13:{s:3:"key";s:19:"field_56ba17a4b6156";s:5:"label";s:11:"Thématique";s:4:"name";s:11:"thematiques";s:4:"type";s:8:"taxonomy";s:12:"instructions";s:0:"";s:8:"required";s:1:"1";s:8:"taxonomy";s:10:"thematique";s:10:"field_type";s:8:"checkbox";s:10:"allow_null";s:1:"0";s:15:"load_save_terms";s:1:"1";s:13:"return_format";s:6:"object";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:1;}'),
(79, 17, 'position', 'acf_after_title'),
(80, 17, 'layout', 'no_box'),
(81, 17, 'hide_on_screen', ''),
(87, 2, '_edit_lock', '1455098188:4'),
(88, 20, '_edit_lock', '1455098584:2'),
(89, 22, '_edit_lock', '1455103414:2'),
(90, 22, '_edit_last', '2'),
(91, 23, 'objectifs', 'xxxx'),
(92, 23, '_objectifs', 'field_56b8b5d78f6f3'),
(93, 23, 'criteres', 'xxx'),
(94, 23, '_criteres', 'field_56b8b6088f6f4'),
(95, 23, 'demarches', 'xxxx'),
(96, 23, '_demarches', 'field_56b8b62d8f6f5'),
(97, 23, 'online', ''),
(98, 23, '_online', 'field_56b8b7b98f700'),
(99, 23, 'informations', 'wwww'),
(100, 23, '_informations', 'field_56b8b6f58f6fc'),
(101, 23, 'phone', ''),
(102, 23, '_phone', 'field_56b8b7088f6fd'),
(103, 23, 'email', 'test@bretagne.bzh'),
(104, 23, '_email', 'field_56b8b7668f6fe'),
(105, 23, 'lien', ''),
(106, 23, '_lien', 'field_56b8b7798f6ff'),
(107, 23, 'reference', ''),
(108, 23, '_reference', 'field_56b8b91689569'),
(109, 23, 'profil', 'a:1:{i:0;s:1:"2";}'),
(110, 23, '_profil', 'field_56ba177bb6155'),
(111, 23, 'thematiques', 'a:1:{i:0;s:1:"9";}'),
(112, 23, '_thematiques', 'field_56ba17a4b6156'),
(113, 22, 'objectifs', 'xxxx lllllll'),
(114, 22, '_objectifs', 'field_56b8b5d78f6f3'),
(115, 22, 'criteres', 'xxx'),
(116, 22, '_criteres', 'field_56b8b6088f6f4'),
(117, 22, 'demarches', 'xxxx'),
(118, 22, '_demarches', 'field_56b8b62d8f6f5'),
(119, 22, 'online', ''),
(120, 22, '_online', 'field_56b8b7b98f700'),
(121, 22, 'informations', 'wwww'),
(122, 22, '_informations', 'field_56b8b6f58f6fc'),
(123, 22, 'phone', ''),
(124, 22, '_phone', 'field_56b8b7088f6fd'),
(125, 22, 'email', 'test@bretagne.bzh'),
(126, 22, '_email', 'field_56b8b7668f6fe'),
(127, 22, 'lien', ''),
(128, 22, '_lien', 'field_56b8b7798f6ff'),
(129, 22, 'reference', ''),
(130, 22, '_reference', 'field_56b8b91689569'),
(131, 22, 'profil', 'a:1:{i:0;s:1:"2";}'),
(132, 22, '_profil', 'field_56ba177bb6155'),
(133, 22, 'thematiques', 'a:1:{i:0;s:1:"9";}'),
(134, 22, '_thematiques', 'field_56ba17a4b6156'),
(135, 24, 'objectifs', 'xxxx lllllll'),
(136, 24, '_objectifs', 'field_56b8b5d78f6f3'),
(137, 24, 'criteres', 'xxx'),
(138, 24, '_criteres', 'field_56b8b6088f6f4'),
(139, 24, 'demarches', 'xxxx'),
(140, 24, '_demarches', 'field_56b8b62d8f6f5'),
(141, 24, 'online', ''),
(142, 24, '_online', 'field_56b8b7b98f700'),
(143, 24, 'informations', 'wwww'),
(144, 24, '_informations', 'field_56b8b6f58f6fc'),
(145, 24, 'phone', ''),
(146, 24, '_phone', 'field_56b8b7088f6fd'),
(147, 24, 'email', 'test@bretagne.bzh'),
(148, 24, '_email', 'field_56b8b7668f6fe'),
(149, 24, 'lien', ''),
(150, 24, '_lien', 'field_56b8b7798f6ff'),
(151, 24, 'reference', ''),
(152, 24, '_reference', 'field_56b8b91689569'),
(153, 24, 'profil', 'a:1:{i:0;s:1:"2";}'),
(154, 24, '_profil', 'field_56ba177bb6155'),
(155, 24, 'thematiques', 'a:1:{i:0;s:1:"9";}'),
(156, 24, '_thematiques', 'field_56ba17a4b6156'),
(161, 15, '_wp_trash_meta_status', 'publish'),
(162, 15, '_wp_trash_meta_time', '1455105003'),
(163, 22, '_wp_trash_meta_status', 'publish'),
(164, 22, '_wp_trash_meta_time', '1455105046'),
(165, 32, '_edit_lock', '1455104943:1'),
(167, 6, 'rule', 'a:5:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:4:"aide";s:8:"order_no";i:0;s:8:"group_no";i:0;}'),
(168, 29, '_edit_lock', '1455105020:1'),
(169, 17, 'rule', 'a:5:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:4:"aide";s:8:"order_no";i:0;s:8:"group_no";i:0;}');

-- --------------------------------------------------------

--
-- Structure de la table `wp_posts`
--

CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=67 ;

--
-- Contenu de la table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2016-02-08 15:56:16', '2016-02-08 14:56:16', 'Bienvenue dans WordPress. Ceci est votre premier article. Modifiez-le ou supprimez-le, puis lancez-vous&nbsp;!', 'Bonjour tout le monde&nbsp;!', '', 'publish', 'open', 'open', '', 'bonjour-tout-le-monde', '', '', '2016-02-08 15:56:16', '2016-02-08 14:56:16', '', 0, 'http://localhost/guidaides/site/web/?p=1', 0, 'post', '', 1),
(2, 1, '2016-02-08 15:56:16', '2016-02-08 14:56:16', 'Voici un exemple de page. Elle est différente d''un article de blog, en cela qu''elle restera à la même place, et s''affichera dans le menu de navigation de votre site (en fonction de votre thème). La plupart des gens commencent par écrire une page « À Propos » qui les présente aux visiteurs potentiels du site. Vous pourriez y écrire quelque chose de ce tenant :\n\n<blockquote>Bonjour ! Je suis un mécanicien qui aspire à devenir un acteur, et voici mon blog. J''habite à Bordeaux, j''ai un super chien baptisé Russell, et j''aime la vodka-ananas (ainsi que regarder la pluie tomber).</blockquote>\n\n...ou bien quelque chose comme ça :\n\n<blockquote>La société 123 Machin Truc a été créée en 1971, et n''a cessé de proposer au public des machins-trucs de qualité depuis lors. Située à Saint-Remy-en-Bouzemont-Saint-Genest-et-Isson, 123 Machin Truc emploie 2 000 personnes, et fabrique toutes sortes de bidules super pour la communauté bouzemontoise.</blockquote>\n\nÉtant donné que vous êtes un nouvel utilisateur de WordPress, vous devriez vous rendre sur votre <a href="http://localhost/guidaides/site/web/wp/wp-admin/">tableau de bord</a> pour effacer la présente page, et créer de nouvelles pages avec votre propre contenu. Amusez-vous bien !', 'Page d&rsquo;exemple', '', 'publish', 'closed', 'open', '', 'page-d-exemple', '', '', '2016-02-08 15:56:16', '2016-02-08 14:56:16', '', 0, 'http://localhost/guidaides/site/web/?page_id=2', 0, 'page', '', 0),
(3, 1, '2016-02-08 15:57:52', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'open', 'open', '', '', '', '', '2016-02-08 15:57:52', '0000-00-00 00:00:00', '', 0, 'http://localhost/guidaides/site/web/?p=3', 0, 'post', '', 0),
(4, 1, '2016-02-08 16:04:54', '0000-00-00 00:00:00', 'This is a preview of how this form will appear on your website', 'ninja_forms_preview_page', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-02-08 16:04:54', '0000-00-00 00:00:00', '', 0, 'http://localhost/guidaides/site/web/?page_id=4', 0, 'page', '', 0),
(5, 1, '2016-02-08 16:10:09', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2016-02-08 16:10:09', '0000-00-00 00:00:00', '', 0, 'http://localhost/guidaides/site/web/?post_type=acf&p=5', 0, 'acf', '', 0),
(6, 1, '2016-02-08 16:29:03', '2016-02-08 15:29:03', '', 'Aides', '', 'publish', 'closed', 'closed', '', 'acf_aides', '', '', '2016-02-10 12:51:48', '2016-02-10 11:51:48', '', 0, 'http://localhost/guidaides/site/web/?post_type=acf&#038;p=6', 2, 'acf', '', 0),
(7, 1, '2016-02-08 16:47:39', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2016-02-08 16:47:39', '0000-00-00 00:00:00', '', 0, 'http://localhost/guidaides/site/web/?post_type=aide&p=7', 0, 'aide', '', 0),
(8, 1, '2016-02-08 16:51:56', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2016-02-08 16:51:56', '0000-00-00 00:00:00', '', 0, 'http://localhost/guidaides/site/web/?post_type=aide&p=8', 0, 'aide', '', 0),
(9, 1, '2016-02-08 17:11:30', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2016-02-08 17:11:30', '0000-00-00 00:00:00', '', 0, 'http://localhost/guidaides/site/web/?post_type=aide&p=9', 0, 'aide', '', 0),
(10, 2, '2016-02-09 10:50:52', '0000-00-00 00:00:00', '', 'exemple', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-02-09 10:50:52', '2016-02-09 09:50:52', '', 0, 'http://localhost/guidaides/site/web/?post_type=aide&#038;p=10', 0, 'aide', '', 0),
(11, 2, '2016-02-08 17:15:38', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2016-02-08 17:15:38', '0000-00-00 00:00:00', '', 0, 'http://localhost/guidaides/site/web/?post_type=aide&p=11', 0, 'aide', '', 0),
(12, 3, '2016-02-09 10:47:43', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'open', 'open', '', '', '', '', '2016-02-09 10:47:43', '0000-00-00 00:00:00', '', 0, 'http://localhost/guidaides/site/web/?p=12', 0, 'post', '', 0),
(13, 2, '2016-02-09 10:48:50', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'open', 'open', '', '', '', '', '2016-02-09 10:48:50', '0000-00-00 00:00:00', '', 0, 'http://localhost/guidaides/site/web/?p=13', 0, 'post', '', 0),
(14, 2, '2016-02-09 10:58:15', '0000-00-00 00:00:00', '', 'exemple 2', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-02-09 10:58:15', '2016-02-09 09:58:15', '', 0, 'http://localhost/guidaides/site/web/?post_type=aide&#038;p=14', 0, 'aide', '', 0),
(15, 2, '2016-02-10 12:49:36', '2016-02-10 11:49:36', '', '', '', 'trash', 'closed', 'closed', '', '15', '', '', '2016-02-10 12:50:03', '2016-02-10 11:50:03', '', 0, 'http://localhost/guidaides/site/web/?post_type=aide&#038;p=15', 0, 'aide', '', 0),
(16, 2, '2016-02-09 11:55:54', '0000-00-00 00:00:00', '', 'exemple 3', '', 'pending', 'closed', 'closed', '', '', '', '', '2016-02-09 11:55:54', '2016-02-09 10:55:54', '', 0, 'http://localhost/guidaides/site/web/?post_type=aide&#038;p=16', 0, 'aide', '', 0),
(17, 1, '2016-02-09 17:47:31', '2016-02-09 16:47:31', '', 'Taxonomies', '', 'publish', 'closed', 'closed', '', 'acf_taxonomies', '', '', '2016-02-10 12:53:04', '2016-02-10 11:53:04', '', 0, 'http://localhost/guidaides/site/web/?post_type=acf&#038;p=17', 1, 'acf', '', 0),
(18, 4, '2016-02-10 10:19:03', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'open', 'open', '', '', '', '', '2016-02-10 10:19:03', '0000-00-00 00:00:00', '', 0, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/?p=18', 0, 'post', '', 0),
(19, 4, '2016-02-10 10:19:06', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'open', 'open', '', '', '', '', '2016-02-10 10:19:06', '0000-00-00 00:00:00', '', 0, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/?p=19', 0, 'post', '', 0),
(20, 2, '2016-02-10 11:02:47', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2016-02-10 11:02:47', '0000-00-00 00:00:00', '', 0, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/?post_type=aide&p=20', 0, 'aide', '', 0),
(21, 5, '2016-02-10 11:39:25', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'open', 'open', '', '', '', '', '2016-02-10 11:39:25', '0000-00-00 00:00:00', '', 0, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/?p=21', 0, 'post', '', 0),
(22, 2, '2016-02-10 11:58:56', '2016-02-10 10:58:56', '', 'chèque sport', ';vnskjfhkjfhezkjfhzekj', 'trash', 'closed', 'closed', '', 'cheque-sport', '', '', '2016-02-10 12:50:46', '2016-02-10 11:50:46', '', 0, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/?post_type=aide&#038;p=22', 0, 'aide', '', 0),
(23, 2, '2016-02-10 11:55:12', '2016-02-10 10:55:12', '', 'chèque sport', ';vnskjfhkjfhezkjfhzekj', 'inherit', 'closed', 'closed', '', '22-revision-v1', '', '', '2016-02-10 11:55:12', '2016-02-10 10:55:12', '', 22, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/2016/02/10/22-revision-v1/', 0, 'revision', '', 0),
(24, 2, '2016-02-10 12:04:06', '2016-02-10 11:04:06', '', 'chèque sport', ';vnskjfhkjfhezkjfhzekj', 'inherit', 'closed', 'closed', '', '22-revision-v1', '', '', '2016-02-10 12:04:06', '2016-02-10 11:04:06', '', 22, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/2016/02/10/22-revision-v1/', 0, 'revision', '', 0),
(25, 1, '2016-02-10 12:14:18', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2016-02-10 12:14:18', '0000-00-00 00:00:00', '', 0, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/?post_type=aap&p=25', 0, 'aap', '', 0),
(28, 4, '2016-02-10 12:49:36', '2016-02-10 11:49:36', '', 'Aide au fonctionnement pour les radios associatives', '', 'publish', 'closed', 'closed', '', 'aide-au-fonctionnement-pour-les-radios-associatives', '', '', '2016-02-10 12:51:08', '2016-02-10 11:51:08', '', 0, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/?post_type=aide&#038;p=28', 0, 'aide', '', 0),
(29, 4, '2016-02-10 12:49:36', '2016-02-10 11:49:36', '', 'Aide au transport sportif', '', 'publish', 'closed', 'closed', '', 'aide-au-transport-sportif', '', '', '2016-02-10 12:51:08', '2016-02-10 11:51:08', '', 0, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/?post_type=aide&#038;p=29', 0, 'aide', '', 0),
(30, 4, '2016-02-10 12:49:36', '2016-02-10 11:49:36', '', 'Aide à l''organisation de manifestations sportives', '', 'publish', 'closed', 'closed', '', 'aide-a-lorganisation-de-manifestations-sportives', '', '', '2016-02-10 12:51:08', '2016-02-10 11:51:08', '', 0, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/?post_type=aide&#038;p=30', 0, 'aide', '', 0),
(31, 4, '2016-02-10 12:49:36', '2016-02-10 11:49:36', '', 'Aide au développement des emplois associatifs', '', 'publish', 'closed', 'closed', '', 'aide-au-developpement-des-emplois-associatifs', '', '', '2016-02-10 12:51:08', '2016-02-10 11:51:08', '', 0, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/?post_type=aide&#038;p=31', 0, 'aide', '', 0),
(32, 4, '2016-02-10 12:49:36', '2016-02-10 11:49:36', '', 'Les aides aux apprentis', '', 'publish', 'closed', 'closed', '', 'les-aides-aux-apprentis', '', '', '2016-02-10 12:51:08', '2016-02-10 11:51:08', '', 0, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/?post_type=aide&#038;p=32', 0, 'aide', '', 0),
(33, 4, '2016-02-10 12:49:36', '2016-02-10 11:49:36', '', 'Goncourt des lycéens ? concours de critique littéraire', '', 'publish', 'closed', 'closed', '', 'goncourt-des-lyceens-concours-de-critique-litteraire', '', '', '2016-02-10 12:51:08', '2016-02-10 11:51:08', '', 0, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/?post_type=aide&#038;p=33', 0, 'aide', '', 0),
(34, 4, '2016-02-10 12:49:36', '2016-02-10 11:49:36', '', 'Volontaire à l''international en entreprise (V.I.E.)', '', 'publish', 'closed', 'closed', '', 'volontaire-a-linternational-en-entreprise-v-i-e', '', '', '2016-02-10 12:51:08', '2016-02-10 11:51:08', '', 0, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/?post_type=aide&#038;p=34', 0, 'aide', '', 0),
(35, 4, '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 'Aide aux librairies indépendantes de Bretagne', '', 'publish', 'closed', 'closed', '', 'aide-aux-librairies-independantes-de-bretagne', '', '', '2016-02-10 12:51:09', '2016-02-10 11:51:09', '', 0, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/?post_type=aide&#038;p=35', 0, 'aide', '', 0),
(36, 4, '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 'Patrimoine - Soutenir les actions de conservation - valorisation du patrimoine naviguant', '', 'publish', 'closed', 'closed', '', 'patrimoine-soutenir-les-actions-de-conservation-valorisation-du-patrimoine-naviguant', '', '', '2016-02-10 12:51:09', '2016-02-10 11:51:09', '', 0, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/?post_type=aide&#038;p=36', 0, 'aide', '', 0),
(37, 4, '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 'Fonds Régional d''Acquisition pour les Musées (FRAM)', '', 'publish', 'closed', 'closed', '', 'fonds-regional-dacquisition-pour-les-musees-fram', '', '', '2016-02-10 12:51:08', '2016-02-10 11:51:08', '', 0, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/?post_type=aide&#038;p=37', 0, 'aide', '', 0),
(38, 4, '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 'Patrimoine - Soutenir les actions de sensibilisation aux patrimoines', '', 'publish', 'closed', 'closed', '', 'patrimoine-soutenir-les-actions-de-sensibilisation-aux-patrimoines', '', '', '2016-02-10 12:51:08', '2016-02-10 11:51:08', '', 0, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/?post_type=aide&#038;p=38', 0, 'aide', '', 0),
(39, 4, '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 'Patrimoine - Bénéficier de la "Prime Skoaz ouzh skoaz"', '', 'publish', 'closed', 'closed', '', 'patrimoine-beneficier-de-la-prime-skoaz-ouzh-skoaz', '', '', '2016-02-10 12:51:08', '2016-02-10 11:51:08', '', 0, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/?post_type=aide&#038;p=39', 0, 'aide', '', 0),
(40, 4, '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 'Patrimoine - Soutenir les actions de conservation du patrimoine remarquable', '', 'publish', 'closed', 'closed', '', 'patrimoine-soutenir-les-actions-de-conservation-du-patrimoine-remarquable', '', '', '2016-02-10 12:51:08', '2016-02-10 11:51:08', '', 0, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/?post_type=aide&#038;p=40', 0, 'aide', '', 0),
(41, 4, '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 'Patrimoine - Soutenir les actions de valorisation du patrimoine des Musées de France', '', 'publish', 'closed', 'closed', '', 'patrimoine-soutenir-les-actions-de-valorisation-du-patrimoine-des-musees-de-france', '', '', '2016-02-10 12:51:08', '2016-02-10 11:51:08', '', 0, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/?post_type=aide&#038;p=41', 0, 'aide', '', 0),
(42, 4, '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 'Patrimoine - Soutenir les actions de valorisation et d?interprétation du patrimoine en Cités labellisées', '', 'publish', 'closed', 'closed', '', 'patrimoine-soutenir-les-actions-de-valorisation-et-dinterpretation-du-patrimoine-en-cites-labellisees', '', '', '2016-02-10 12:51:08', '2016-02-10 11:51:08', '', 0, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/?post_type=aide&#038;p=42', 0, 'aide', '', 0),
(43, 4, '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 'Patrimoine - Soutenir et encourager les projets de développement patrimoniaux des territoires', '', 'publish', 'closed', 'closed', '', 'patrimoine-soutenir-et-encourager-les-projets-de-developpement-patrimoniaux-des-territoires', '', '', '2016-02-10 12:51:08', '2016-02-10 11:51:08', '', 0, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/?post_type=aide&#038;p=43', 0, 'aide', '', 0),
(44, 4, '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 'Aide à l?expression audiovisuelle en langues de Bretagne', '', 'publish', 'closed', 'closed', '', 'aide-a-lexpression-audiovisuelle-en-langues-de-bretagne', '', '', '2016-02-10 12:51:08', '2016-02-10 11:51:08', '', 0, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/?post_type=aide&#038;p=44', 0, 'aide', '', 0),
(45, 4, '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 'Aide aux jeunes en service civique sur le territoire de Bretagne', '', 'publish', 'closed', 'closed', '', 'aide-aux-jeunes-en-service-civique-sur-le-territoire-de-bretagne', '', '', '2016-02-10 12:51:08', '2016-02-10 11:51:08', '', 0, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/?post_type=aide&#038;p=45', 0, 'aide', '', 0),
(46, 4, '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 'Aide à la modernisation, à la construction et à l''équipement des cinémas indépendants', '', 'publish', 'closed', 'closed', '', 'aide-a-la-modernisation-a-la-construction-et-a-lequipement-des-cinemas-independants', '', '', '2016-02-10 12:51:08', '2016-02-10 11:51:08', '', 0, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/?post_type=aide&#038;p=46', 0, 'aide', '', 0),
(47, 1, '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 'Aide à la modernisation, à la construction et à l''équipement des cinémas indépendants', '', 'inherit', 'closed', 'closed', '', '46-revision-v1', '', '', '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 46, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/2016/02/10/46-revision-v1/', 0, 'revision', '', 0),
(48, 1, '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 'Fonds Régional d''Acquisition pour les Musées (FRAM)', '', 'inherit', 'closed', 'closed', '', '37-revision-v1', '', '', '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 37, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/2016/02/10/37-revision-v1/', 0, 'revision', '', 0),
(49, 1, '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 'Patrimoine - Soutenir les actions de sensibilisation aux patrimoines', '', 'inherit', 'closed', 'closed', '', '38-revision-v1', '', '', '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 38, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/2016/02/10/38-revision-v1/', 0, 'revision', '', 0),
(50, 1, '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 'Patrimoine - Bénéficier de la "Prime Skoaz ouzh skoaz"', '', 'inherit', 'closed', 'closed', '', '39-revision-v1', '', '', '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 39, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/2016/02/10/39-revision-v1/', 0, 'revision', '', 0),
(51, 1, '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 'Patrimoine - Soutenir les actions de conservation du patrimoine remarquable', '', 'inherit', 'closed', 'closed', '', '40-revision-v1', '', '', '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 40, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/2016/02/10/40-revision-v1/', 0, 'revision', '', 0),
(52, 1, '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 'Patrimoine - Soutenir les actions de valorisation du patrimoine des Musées de France', '', 'inherit', 'closed', 'closed', '', '41-revision-v1', '', '', '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 41, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/2016/02/10/41-revision-v1/', 0, 'revision', '', 0),
(53, 1, '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 'Patrimoine - Soutenir les actions de valorisation et d?interprétation du patrimoine en Cités labellisées', '', 'inherit', 'closed', 'closed', '', '42-revision-v1', '', '', '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 42, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/2016/02/10/42-revision-v1/', 0, 'revision', '', 0),
(54, 1, '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 'Patrimoine - Soutenir et encourager les projets de développement patrimoniaux des territoires', '', 'inherit', 'closed', 'closed', '', '43-revision-v1', '', '', '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 43, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/2016/02/10/43-revision-v1/', 0, 'revision', '', 0),
(55, 1, '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 'Aide à l?expression audiovisuelle en langues de Bretagne', '', 'inherit', 'closed', 'closed', '', '44-revision-v1', '', '', '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 44, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/2016/02/10/44-revision-v1/', 0, 'revision', '', 0),
(56, 1, '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 'Aide aux jeunes en service civique sur le territoire de Bretagne', '', 'inherit', 'closed', 'closed', '', '45-revision-v1', '', '', '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 45, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/2016/02/10/45-revision-v1/', 0, 'revision', '', 0),
(57, 1, '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 'Patrimoine - Soutenir les actions de conservation - valorisation du patrimoine naviguant', '', 'inherit', 'closed', 'closed', '', '36-revision-v1', '', '', '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 36, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/2016/02/10/36-revision-v1/', 0, 'revision', '', 0),
(58, 1, '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 'Aide aux librairies indépendantes de Bretagne', '', 'inherit', 'closed', 'closed', '', '35-revision-v1', '', '', '2016-02-10 12:49:35', '2016-02-10 11:49:35', '', 35, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/2016/02/10/35-revision-v1/', 0, 'revision', '', 0),
(59, 1, '2016-02-10 12:49:36', '2016-02-10 11:49:36', '', 'Aide au fonctionnement pour les radios associatives', '', 'inherit', 'closed', 'closed', '', '28-revision-v1', '', '', '2016-02-10 12:49:36', '2016-02-10 11:49:36', '', 28, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/2016/02/10/28-revision-v1/', 0, 'revision', '', 0),
(60, 1, '2016-02-10 12:49:36', '2016-02-10 11:49:36', '', 'Aide au transport sportif', '', 'inherit', 'closed', 'closed', '', '29-revision-v1', '', '', '2016-02-10 12:49:36', '2016-02-10 11:49:36', '', 29, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/2016/02/10/29-revision-v1/', 0, 'revision', '', 0),
(61, 1, '2016-02-10 12:49:36', '2016-02-10 11:49:36', '', 'Aide à l''organisation de manifestations sportives', '', 'inherit', 'closed', 'closed', '', '30-revision-v1', '', '', '2016-02-10 12:49:36', '2016-02-10 11:49:36', '', 30, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/2016/02/10/30-revision-v1/', 0, 'revision', '', 0),
(62, 1, '2016-02-10 12:49:36', '2016-02-10 11:49:36', '', 'Aide au développement des emplois associatifs', '', 'inherit', 'closed', 'closed', '', '31-revision-v1', '', '', '2016-02-10 12:49:36', '2016-02-10 11:49:36', '', 31, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/2016/02/10/31-revision-v1/', 0, 'revision', '', 0),
(63, 1, '2016-02-10 12:49:36', '2016-02-10 11:49:36', '', 'Les aides aux apprentis', '', 'inherit', 'closed', 'closed', '', '32-revision-v1', '', '', '2016-02-10 12:49:36', '2016-02-10 11:49:36', '', 32, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/2016/02/10/32-revision-v1/', 0, 'revision', '', 0),
(64, 1, '2016-02-10 12:49:36', '2016-02-10 11:49:36', '', 'Goncourt des lycéens ? concours de critique littéraire', '', 'inherit', 'closed', 'closed', '', '33-revision-v1', '', '', '2016-02-10 12:49:36', '2016-02-10 11:49:36', '', 33, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/2016/02/10/33-revision-v1/', 0, 'revision', '', 0),
(65, 1, '2016-02-10 12:49:36', '2016-02-10 11:49:36', '', 'Volontaire à l''international en entreprise (V.I.E.)', '', 'inherit', 'closed', 'closed', '', '34-revision-v1', '', '', '2016-02-10 12:49:36', '2016-02-10 11:49:36', '', 34, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/2016/02/10/34-revision-v1/', 0, 'revision', '', 0),
(66, 1, '2016-02-10 12:49:36', '2016-02-10 11:49:36', '', '', '', 'inherit', 'closed', 'closed', '', '15-revision-v1', '', '', '2016-02-10 12:49:36', '2016-02-10 11:49:36', '', 15, 'http://lamp-dirci.cr-bretagne.fr/guide-aides/web/2016/02/10/15-revision-v1/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_termmeta`
--

CREATE TABLE IF NOT EXISTS `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `wp_terms`
--

CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=82 ;

--
-- Contenu de la table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Non classé', 'non-classe', 0),
(2, 'Particulier', 'particulier', 0),
(3, 'apprenti', 'apprenti', 0),
(4, 'lycéen', 'lyceen', 0),
(5, 'étudiant / chercheur', 'etudiant-chercheur', 0),
(6, 'demandeur d''emploi', 'demandeur-demploi', 0),
(7, 'salarié', 'salarie', 0),
(8, 'Éducation / Formation', 'education-formation', 0),
(9, 'Culture &amp; patrimoine', 'culture-patrimoine', 0),
(10, 'Citoyenneté &amp; international', 'citoyennete-international', 0),
(11, 'Transports', 'transport', 0),
(22, 'Association', 'association', 0),
(23, 'chèque', 'cheque', 0),
(24, 'sport', 'sport', 0),
(25, 'jeune', 'jeune', 0),
(26, 'radio', 'radio', 0),
(27, 'culture', 'culture', 0),
(28, 'association', 'association', 0),
(29, 'transport', 'transport', 0),
(30, 'sportif de haut niveau', 'sportif-de-haut-niveau', 0),
(31, 'compétition sportive', 'competition-sportive', 0),
(32, 'événement sportif', 'evenement-sportif', 0),
(33, 'club', 'club', 0),
(34, 'collectivité', 'collectivite', 0),
(35, 'entreprise', 'entreprise', 0),
(36, 'embauche', 'embauche', 0),
(37, 'emploi', 'emploi', 0),
(38, 'emploi associatif', 'emploi-associatif', 0),
(39, 'aide aux employeurs', 'aide-aux-employeurs', 0),
(40, 'apprentissage', 'apprentissage', 0),
(41, 'apprentis', 'apprentis', 0),
(42, 'formation en apprentissage', 'formation-en-apprentissage', 0),
(43, 'goncourt', 'goncourt', 0),
(44, 'littérature', 'litterature', 0),
(45, 'lycéen', 'lyceen', 0),
(46, 'lycée', 'lycee', 0),
(47, 'vie', 'vie', 0),
(48, 'volontariat', 'volontariat', 0),
(49, 'international', 'international', 0),
(50, 'étranger', 'etranger', 0),
(51, 'librairie', 'librairie', 0),
(52, 'édition', 'edition', 0),
(53, 'bateaux du patrimoine', 'bateaux-du-patrimoine', 0),
(54, 'patrimoine culturel', 'patrimoine-culturel', 0),
(55, 'bateaux', 'bateaux', 0),
(56, 'patrimoine naviguant', 'patrimoine-naviguant', 0),
(57, 'musée', 'musee', 0),
(58, 'collection', 'collection', 0),
(59, 'achat d''oeuvres', 'achat-%c2%9coeuvres', 0),
(60, 'fram', 'fram', 0),
(61, 'éducation au patrimoine', 'education-au-patrimoine', 0),
(62, 'sensibilisation au patrimoine', 'sensibilisation-au-patrimoine', 0),
(63, 'solidarité', 'solidarite', 0),
(64, 'participatif', 'participatif', 0),
(65, 'conservation', 'conservation', 0),
(66, 'culturel', 'culturel', 0),
(67, 'valorisation du patrimoine', 'valorisation-du-patrimoine', 0),
(68, 'travaux', 'travaux', 0),
(69, 'patrimoine bâti', 'patrimoine-bati', 0),
(70, 'patrimoine rural', 'patrimoine-rural', 0),
(71, 'ville d''art et d''histoire', 'ville-dart-et-dhistoire', 0),
(72, 'restauration du patrimoine culturel', 'restauration-du-patrimoine-culturel', 0),
(73, 'études', 'etudes', 0),
(74, 'breton', 'breton', 0),
(75, 'gallo', 'gallo', 0),
(76, 'langues de bretagne', 'langues-de-bretagne', 0),
(77, 'audiovisuel', 'audiovisuel', 0),
(78, 'service civique', 'service-civique', 0),
(79, 'citoyenneté', 'citoyennete', 0),
(80, 'aide aux jeunes', 'aide-aux-jeunes', 0),
(81, 'cinémas', 'cinemas', 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_term_relationships`
--

CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(15, 2, 0),
(22, 2, 0),
(22, 9, 0),
(22, 23, 0),
(22, 24, 0),
(22, 25, 0),
(23, 2, 0),
(23, 9, 0),
(24, 2, 0),
(24, 9, 0),
(28, 2, 0),
(28, 26, 0),
(28, 27, 0),
(28, 28, 0),
(29, 2, 0),
(29, 24, 0),
(29, 29, 0),
(29, 30, 0),
(30, 2, 0),
(30, 28, 0),
(30, 31, 0),
(30, 32, 0),
(30, 33, 0),
(30, 34, 0),
(30, 35, 0),
(31, 2, 0),
(31, 28, 0),
(31, 36, 0),
(31, 37, 0),
(31, 38, 0),
(31, 39, 0),
(32, 2, 0),
(32, 40, 0),
(32, 41, 0),
(32, 42, 0),
(33, 2, 0),
(33, 27, 0),
(33, 43, 0),
(33, 44, 0),
(33, 45, 0),
(33, 46, 0),
(34, 2, 0),
(34, 35, 0),
(34, 39, 0),
(34, 47, 0),
(34, 48, 0),
(34, 49, 0),
(34, 50, 0),
(35, 2, 0),
(35, 27, 0),
(35, 28, 0),
(35, 35, 0),
(35, 51, 0),
(35, 52, 0),
(36, 2, 0),
(36, 53, 0),
(36, 54, 0),
(36, 55, 0),
(36, 56, 0),
(37, 2, 0),
(37, 57, 0),
(37, 58, 0),
(37, 59, 0),
(37, 60, 0),
(38, 2, 0),
(38, 54, 0),
(38, 61, 0),
(38, 62, 0),
(39, 2, 0),
(39, 54, 0),
(39, 63, 0),
(39, 64, 0),
(40, 2, 0),
(40, 54, 0),
(40, 65, 0),
(40, 66, 0),
(41, 2, 0),
(41, 27, 0),
(41, 57, 0),
(41, 67, 0),
(42, 2, 0),
(42, 54, 0),
(42, 68, 0),
(42, 69, 0),
(42, 70, 0),
(42, 71, 0),
(43, 2, 0),
(43, 68, 0),
(43, 72, 0),
(44, 2, 0),
(44, 28, 0),
(44, 35, 0),
(44, 68, 0),
(44, 73, 0),
(44, 74, 0),
(44, 75, 0),
(44, 76, 0),
(44, 77, 0),
(45, 2, 0),
(45, 78, 0),
(45, 79, 0),
(45, 80, 0),
(46, 2, 0),
(46, 27, 0),
(46, 68, 0),
(46, 81, 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=82 ;

--
-- Contenu de la table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'profil', '', 0, 19),
(3, 3, 'particulier-education', '', 0, 0),
(4, 4, 'particulier-education', '', 0, 0),
(5, 5, 'particulier-education', '', 0, 0),
(6, 6, 'particulier-education', '', 0, 0),
(7, 7, 'particulier-education', '', 0, 0),
(8, 8, 'thematique', '', 0, 0),
(9, 9, 'thematique', '', 0, 0),
(10, 10, 'thematique', '', 0, 0),
(11, 11, 'thematique', '', 0, 0),
(22, 22, 'profil', '', 0, 0),
(23, 23, 'post_tag', '', 0, 0),
(24, 24, 'post_tag', '', 0, 1),
(25, 25, 'post_tag', '', 0, 0),
(26, 26, 'post_tag', '', 0, 1),
(27, 27, 'post_tag', '', 0, 5),
(28, 28, 'post_tag', '', 0, 5),
(29, 29, 'post_tag', '', 0, 1),
(30, 30, 'post_tag', '', 0, 1),
(31, 31, 'post_tag', '', 0, 1),
(32, 32, 'post_tag', '', 0, 1),
(33, 33, 'post_tag', '', 0, 1),
(34, 34, 'post_tag', '', 0, 1),
(35, 35, 'post_tag', '', 0, 4),
(36, 36, 'post_tag', '', 0, 1),
(37, 37, 'post_tag', '', 0, 1),
(38, 38, 'post_tag', '', 0, 1),
(39, 39, 'post_tag', '', 0, 2),
(40, 40, 'post_tag', '', 0, 1),
(41, 41, 'post_tag', '', 0, 1),
(42, 42, 'post_tag', '', 0, 1),
(43, 43, 'post_tag', '', 0, 1),
(44, 44, 'post_tag', '', 0, 1),
(45, 45, 'post_tag', '', 0, 1),
(46, 46, 'post_tag', '', 0, 1),
(47, 47, 'post_tag', '', 0, 1),
(48, 48, 'post_tag', '', 0, 1),
(49, 49, 'post_tag', '', 0, 1),
(50, 50, 'post_tag', '', 0, 1),
(51, 51, 'post_tag', '', 0, 1),
(52, 52, 'post_tag', '', 0, 1),
(53, 53, 'post_tag', '', 0, 1),
(54, 54, 'post_tag', '', 0, 5),
(55, 55, 'post_tag', '', 0, 1),
(56, 56, 'post_tag', '', 0, 1),
(57, 57, 'post_tag', '', 0, 2),
(58, 58, 'post_tag', '', 0, 1),
(59, 59, 'post_tag', '', 0, 1),
(60, 60, 'post_tag', '', 0, 1),
(61, 61, 'post_tag', '', 0, 1),
(62, 62, 'post_tag', '', 0, 1),
(63, 63, 'post_tag', '', 0, 1),
(64, 64, 'post_tag', '', 0, 1),
(65, 65, 'post_tag', '', 0, 1),
(66, 66, 'post_tag', '', 0, 1),
(67, 67, 'post_tag', '', 0, 1),
(68, 68, 'post_tag', '', 0, 4),
(69, 69, 'post_tag', '', 0, 1),
(70, 70, 'post_tag', '', 0, 1),
(71, 71, 'post_tag', '', 0, 1),
(72, 72, 'post_tag', '', 0, 1),
(73, 73, 'post_tag', '', 0, 1),
(74, 74, 'post_tag', '', 0, 1),
(75, 75, 'post_tag', '', 0, 1),
(76, 76, 'post_tag', '', 0, 1),
(77, 77, 'post_tag', '', 0, 1),
(78, 78, 'post_tag', '', 0, 1),
(79, 79, 'post_tag', '', 0, 1),
(80, 80, 'post_tag', '', 0, 1),
(81, 81, 'post_tag', '', 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `wp_usermeta`
--

CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=108 ;

--
-- Contenu de la table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'webcrb'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'wp_capabilities', 'a:13:{s:13:"administrator";b:1;s:26:"wpcf_custom_post_type_view";b:1;s:26:"wpcf_custom_post_type_edit";b:1;s:33:"wpcf_custom_post_type_edit_others";b:1;s:25:"wpcf_custom_taxonomy_view";b:1;s:25:"wpcf_custom_taxonomy_edit";b:1;s:32:"wpcf_custom_taxonomy_edit_others";b:1;s:22:"wpcf_custom_field_view";b:1;s:22:"wpcf_custom_field_edit";b:1;s:29:"wpcf_custom_field_edit_others";b:1;s:25:"wpcf_user_meta_field_view";b:1;s:25:"wpcf_user_meta_field_edit";b:1;s:32:"wpcf_user_meta_field_edit_others";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', 'owf_install_free'),
(13, 1, 'show_welcome_panel', '0'),
(14, 1, 'session_tokens', 'a:4:{s:64:"6d13ba5d6d83467f9891664ca6c29fd72c6cd875227ceb8ad127d20009669fc6";a:4:{s:10:"expiration";i:1455116271;s:2:"ip";s:3:"::1";s:2:"ua";s:108:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.97 Safari/537.36";s:5:"login";i:1454943471;}s:64:"8a69285a019054f039ab5316597188ac2a5bf89bdc117c4e7b4a597f7210a4d1";a:4:{s:10:"expiration";i:1455184015;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:72:"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0";s:5:"login";i:1455011215;}s:64:"32bfe950e955e8144394c9f36b3a3323f8dc32cf94ddd1d9f5aad50b4d523b0a";a:4:{s:10:"expiration";i:1455208425;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:72:"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0";s:5:"login";i:1455035625;}s:64:"ef3eaea0b2dcca95a7b831fefe4d2349a899ae908d7bba947d267055bd5b31bb";a:4:{s:10:"expiration";i:1455268404;s:2:"ip";s:13:"172.16.13.111";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.103 Safari/537.36";s:5:"login";i:1455095604;}}'),
(15, 1, 'wp_dashboard_quick_press_last_post_id', '3'),
(16, 1, 'wpseo_ignore_tour', '1'),
(17, 1, 'wpseo_seen_tagline_notice', 'seen'),
(18, 1, 'wpseo_seen_about_version', '3.0.7'),
(19, 1, 'wp_types-modal', '0'),
(20, 1, 'closedpostboxes_aide', 'a:2:{i:0;s:14:"wpcf-marketing";i:1;s:10:"wpseo_meta";}'),
(21, 1, 'metaboxhidden_aide', 'a:5:{i:0;s:14:"wpcf-marketing";i:1;s:13:"thematiquediv";i:2;s:10:"wpseo_meta";i:3;s:7:"slugdiv";i:4;s:10:"members-cp";}'),
(22, 1, 'meta-box-order_aide', 'a:4:{s:15:"acf_after_title";s:12:"acf_17,acf_6";s:4:"side";s:65:"submitdiv,wpcf-marketing,tagsdiv-post_tag,profildiv,thematiquediv";s:6:"normal";s:40:"wpseo_meta,slugdiv,postexcerpt,authordiv";s:8:"advanced";s:10:"members-cp";}'),
(23, 1, 'screen_layout_aide', '2'),
(24, 1, 'wp_user-settings', 'editor_expand=on&posts_list_mode=list'),
(25, 1, 'wp_user-settings-time', '1455105069'),
(26, 2, 'nickname', 'test'),
(27, 2, 'first_name', ''),
(28, 2, 'last_name', ''),
(29, 2, 'description', ''),
(30, 2, 'rich_editing', 'true'),
(31, 2, 'comment_shortcuts', 'false'),
(32, 2, 'admin_color', 'fresh'),
(33, 2, 'use_ssl', '0'),
(34, 2, 'show_admin_bar_front', 'true'),
(35, 2, 'wp_capabilities', 'a:1:{s:11:"contributor";b:1;}'),
(36, 2, 'wp_user_level', '1'),
(37, 2, 'dismissed_wp_pointers', ''),
(39, 2, 'wp_user-settings', 'libraryContent=browse'),
(40, 2, 'wp_user-settings-time', '1454948133'),
(41, 3, 'nickname', 'editeur'),
(42, 3, 'first_name', ''),
(43, 3, 'last_name', ''),
(44, 3, 'description', ''),
(45, 3, 'rich_editing', 'true'),
(46, 3, 'comment_shortcuts', 'false'),
(47, 3, 'admin_color', 'fresh'),
(48, 3, 'use_ssl', '0'),
(49, 3, 'show_admin_bar_front', 'true'),
(50, 3, 'wp_capabilities', 'a:1:{s:6:"editor";b:1;}'),
(51, 3, 'wp_user_level', '7'),
(52, 3, 'dismissed_wp_pointers', ''),
(53, 2, 'closedpostboxes_aide', 'a:2:{i:0;s:14:"wpcf-marketing";i:1;s:10:"wpseo_meta";}'),
(54, 2, 'metaboxhidden_aide', 'a:1:{i:0;s:7:"slugdiv";}'),
(55, 3, '_yoast_wpseo_profile_updated', '1455011238'),
(56, 3, 'wpseo_title', ''),
(57, 3, 'wpseo_metadesc', ''),
(58, 3, 'wpseo_metakey', ''),
(59, 3, 'wpseo_excludeauthorsitemap', ''),
(60, 3, 'googleplus', ''),
(61, 3, 'twitter', ''),
(62, 3, 'facebook', ''),
(63, 3, 'session_tokens', 'a:2:{s:64:"55756e93dd77c82a76cd955270f44198e017ecaf470b8324b25c8af438efeb8e";a:4:{s:10:"expiration";i:1455121304;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:72:"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0";s:5:"login";i:1454948504;}s:64:"483ac255bb689a70ddf6d54c82edbccb1fb49b92bc1560842312a92e980d0ddf";a:4:{s:10:"expiration";i:1455271450;s:2:"ip";s:13:"172.16.21.241";s:2:"ua";s:72:"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0";s:5:"login";i:1455098650;}}'),
(64, 3, 'wp_dashboard_quick_press_last_post_id', '12'),
(66, 2, 'wp_dashboard_quick_press_last_post_id', '13'),
(67, 2, 'closedpostboxes_dashboard', 'a:3:{i:0;s:18:"dashboard_activity";i:1;s:24:"wpseo-dashboard-overview";i:2;s:17:"dashboard_primary";}'),
(68, 2, 'metaboxhidden_dashboard', 'a:0:{}'),
(70, 1, 'closedpostboxes_dashboard', 'a:1:{i:0;s:17:"dashboard_primary";}'),
(71, 1, 'metaboxhidden_dashboard', 'a:0:{}'),
(72, 2, 'session_tokens', 'a:3:{s:64:"c59dd7814f9fa5040175e4002fd11e4bf3d60b575e447ad01aefb80f2dcb284c";a:4:{s:10:"expiration";i:1455188036;s:2:"ip";s:3:"::1";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.103 Safari/537.36";s:5:"login";i:1455015236;}s:64:"d9bf460d5e85d79c1f36555c7be4d86551ef68bea2a33adde0f7b7edf2c6cfa7";a:4:{s:10:"expiration";i:1455188241;s:2:"ip";s:3:"::1";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.103 Safari/537.36";s:5:"login";i:1455015441;}s:64:"c445ad38e71643bd1f3b496396d49babe21d932238fc9aa162d91e375dc8a262";a:4:{s:10:"expiration";i:1455274121;s:2:"ip";s:13:"172.16.21.210";s:2:"ua";s:72:"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0";s:5:"login";i:1455101321;}}'),
(73, 4, 'nickname', 'Sebastien'),
(74, 4, 'first_name', 'Sébastien'),
(75, 4, 'last_name', 'Bayette'),
(76, 4, 'description', ''),
(77, 4, 'rich_editing', 'true'),
(78, 4, 'comment_shortcuts', 'false'),
(79, 4, 'admin_color', 'fresh'),
(80, 4, 'use_ssl', '0'),
(81, 4, 'show_admin_bar_front', 'true'),
(82, 4, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(83, 4, 'wp_user_level', '10'),
(84, 4, 'dismissed_wp_pointers', ''),
(85, 4, 'default_password_nag', ''),
(86, 4, 'session_tokens', 'a:2:{s:64:"8d15c972b5613a9ba7995bb103a1dd1225e2c5bf33ea69d3e313e5a7e137b4b1";a:4:{s:10:"expiration";i:1455268735;s:2:"ip";s:13:"172.16.21.241";s:2:"ua";s:72:"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0";s:5:"login";i:1455095935;}s:64:"fbb624ded1ff09a1c318710894744331ef69d584f454aa200a5f358b4abb175c";a:4:{s:10:"expiration";i:1456305537;s:2:"ip";s:13:"172.16.21.241";s:2:"ua";s:72:"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0";s:5:"login";i:1455095937;}}'),
(87, 4, 'wp_dashboard_quick_press_last_post_id', '19'),
(88, 4, 'wpseo_ignore_tour', '1'),
(89, 4, 'closedpostboxes_aide', 'a:0:{}'),
(90, 4, 'metaboxhidden_aide', 'a:6:{i:0;s:14:"wpcf-marketing";i:1;s:9:"profildiv";i:2;s:13:"thematiquediv";i:3;s:10:"wpseo_meta";i:4;s:7:"slugdiv";i:5;s:10:"members-cp";}'),
(91, 5, 'nickname', 'Elsa'),
(92, 5, 'first_name', 'Elsa'),
(93, 5, 'last_name', 'Gueguen'),
(94, 5, 'description', ''),
(95, 5, 'rich_editing', 'true'),
(96, 5, 'comment_shortcuts', 'false'),
(97, 5, 'admin_color', 'fresh'),
(98, 5, 'use_ssl', '0'),
(99, 5, 'show_admin_bar_front', 'true'),
(100, 5, 'wp_capabilities', 'a:1:{s:6:"editor";b:1;}'),
(101, 5, 'wp_user_level', '7'),
(102, 5, 'dismissed_wp_pointers', ''),
(103, 5, 'default_password_nag', ''),
(104, 5, 'session_tokens', 'a:2:{s:64:"e175c331fd1031ae353c85af95ca02ddd97c1fbeaae96310339a051de6885744";a:4:{s:10:"expiration";i:1455273560;s:2:"ip";s:13:"172.16.23.209";s:2:"ua";s:70:"Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)";s:5:"login";i:1455100760;}s:64:"d064380e4b3f67436e6dd03245ff8c63ba7286cffcaba4a7f742c29bc0f6d98b";a:4:{s:10:"expiration";i:1455274083;s:2:"ip";s:13:"172.16.21.210";s:2:"ua";s:72:"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0";s:5:"login";i:1455101283;}}'),
(105, 5, 'wp_dashboard_quick_press_last_post_id', '21'),
(106, 1, 'manageedit-aidecolumnshidden', 'a:4:{i:0;s:11:"wpseo-score";i:1;s:11:"wpseo-title";i:2;s:14:"wpseo-metadesc";i:3;s:13:"wpseo-focuskw";}'),
(107, 1, 'edit_aide_per_page', '20');

-- --------------------------------------------------------

--
-- Structure de la table `wp_users`
--

CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=6 ;

--
-- Contenu de la table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'webcrb', '$P$BZ.pB/KeVJtbwl0D.rNujN8eeFVIHG.', 'webcrb', 'webcrb@gmail.com', '', '2016-02-08 14:56:16', '', 0, 'webcrb'),
(2, 'test', '$P$Bl2xw2eR1Rb6mW3x2.RxQjlOtWLrP91', 'test', 'test@domain.com', '', '2016-02-08 16:01:53', '1454947314:$P$BWXlXP4QMxuTIjzCsSmF/LCwt9J6L7.', 0, 'test'),
(3, 'editeur', '$P$B8JPO2mX0EebmIF./DTVidxL8tWAah0', 'editeur', 'editeur@bretagne.bzh', '', '2016-02-08 16:17:05', '', 0, 'editeur'),
(4, 'Sebastien', '$P$B3rDJCmryod1g7NymUWx30CIrTEuWk0', 'sebastien', 'sebastien.bayette@bretagne.bzh', '', '2016-02-10 09:16:51', '', 0, 'Sébastien Bayette'),
(5, 'Elsa', '$P$Bv8xOHlhGYqyViRzh8b1nosMG7Hgk10', 'elsa', 'elsa.gueguen@bretagne.bzh', '', '2016-02-10 10:11:17', '', 0, 'Elsa Gueguen');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
