-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 06, 2015 at 03:34 PM
-- Server version: 5.6.21
-- PHP Version: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `youth-affair`
--

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE IF NOT EXISTS `actions` (
  `aid` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Primary Key: Unique actions ID.',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT 'The object that that action acts on (node, user, comment, system or custom types.)',
  `callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'The callback function that executes when the action runs.',
  `parameters` longblob NOT NULL COMMENT 'Parameters to be passed to the callback function.',
  `label` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Label of the action.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores action information.';

-- --------------------------------------------------------

--
-- Table structure for table `authmap`
--

CREATE TABLE IF NOT EXISTS `authmap` (
`aid` int(10) unsigned NOT NULL COMMENT 'Primary Key: Unique authmap ID.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'User’s users.uid.',
  `authname` varchar(128) NOT NULL DEFAULT '' COMMENT 'Unique authentication name.',
  `module` varchar(128) NOT NULL DEFAULT '' COMMENT 'Module which is controlling the authentication.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores distributed authentication mapping.';

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE IF NOT EXISTS `batch` (
  `bid` int(10) unsigned NOT NULL COMMENT 'Primary Key: Unique batch ID.',
  `token` varchar(64) NOT NULL COMMENT 'A string token generated against the current user’s session id and the batch id, used to ensure that only the user who submitted the batch can effectively access it.',
  `timestamp` int(11) NOT NULL COMMENT 'A Unix timestamp indicating when this batch was submitted for processing. Stale batches are purged at cron time.',
  `batch` longblob COMMENT 'A serialized array containing the processing data for the batch.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores details about batches (processes that run in...';

-- --------------------------------------------------------

--
-- Table structure for table `block`
--

CREATE TABLE IF NOT EXISTS `block` (
`bid` int(11) NOT NULL COMMENT 'Primary Key: Unique block ID.',
  `module` varchar(64) NOT NULL DEFAULT '' COMMENT 'The module from which the block originates; for example, ’user’ for the Who’s Online block, and ’block’ for any custom blocks.',
  `delta` varchar(32) NOT NULL DEFAULT '0' COMMENT 'Unique ID for block within a module.',
  `theme` varchar(64) NOT NULL DEFAULT '' COMMENT 'The theme under which the block settings apply.',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Block enabled status. (1 = enabled, 0 = disabled)',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Block weight within region.',
  `region` varchar(64) NOT NULL DEFAULT '' COMMENT 'Theme region within which the block is set.',
  `custom` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Flag to indicate how users may control visibility of the block. (0 = Users cannot control, 1 = On by default, but can be hidden, 2 = Hidden by default, but can be shown)',
  `visibility` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Flag to indicate how to show blocks on pages. (0 = Show on all pages except listed pages, 1 = Show only on listed pages, 2 = Use custom PHP code to determine visibility)',
  `pages` text NOT NULL COMMENT 'Contents of the "Pages" block; contains either a list of paths on which to include/exclude the block or PHP code, depending on "visibility" setting.',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT 'Custom title for the block. (Empty string will use block default title, <none> will remove the title, text will cause block to use specified title.)',
  `cache` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Binary flag to indicate block cache mode. (-2: Custom cache, -1: Do not cache, 1: Cache per role, 2: Cache per user, 4: Cache per page, 8: Block cache global) See DRUPAL_CACHE_* constants in ../includes/common.inc for more detailed information.',
  `i18n_mode` int(11) NOT NULL DEFAULT '0' COMMENT 'Block multilingual mode.',
  `css_class` varchar(255) NOT NULL DEFAULT '' COMMENT 'String containing the classes for the block.'
) ENGINE=MyISAM AUTO_INCREMENT=975 DEFAULT CHARSET=utf8 COMMENT='Stores block settings, such as region and visibility...';

-- --------------------------------------------------------

--
-- Table structure for table `blocked_ips`
--

CREATE TABLE IF NOT EXISTS `blocked_ips` (
`iid` int(10) unsigned NOT NULL COMMENT 'Primary Key: unique ID for IP addresses.',
  `ip` varchar(40) NOT NULL DEFAULT '' COMMENT 'IP address'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores blocked IP addresses.';

-- --------------------------------------------------------

--
-- Table structure for table `block_custom`
--

CREATE TABLE IF NOT EXISTS `block_custom` (
`bid` int(10) unsigned NOT NULL COMMENT 'The block’s block.bid.',
  `body` longtext COMMENT 'Block contents.',
  `info` varchar(128) NOT NULL DEFAULT '' COMMENT 'Block description.',
  `format` varchar(255) DEFAULT NULL COMMENT 'The filter_format.format of the block body.'
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Stores contents of custom-made blocks.';

-- --------------------------------------------------------

--
-- Table structure for table `block_node_type`
--

CREATE TABLE IF NOT EXISTS `block_node_type` (
  `module` varchar(64) NOT NULL COMMENT 'The block’s origin module, from block.module.',
  `delta` varchar(32) NOT NULL COMMENT 'The block’s unique delta within module, from block.delta.',
  `type` varchar(32) NOT NULL COMMENT 'The machine-readable name of this type from node_type.type.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Sets up display criteria for blocks based on content types';

-- --------------------------------------------------------

--
-- Table structure for table `block_role`
--

CREATE TABLE IF NOT EXISTS `block_role` (
  `module` varchar(64) NOT NULL COMMENT 'The block’s origin module, from block.module.',
  `delta` varchar(32) NOT NULL COMMENT 'The block’s unique delta within module, from block.delta.',
  `rid` int(10) unsigned NOT NULL COMMENT 'The user’s role ID from users_roles.rid.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Sets up access permissions for blocks based on user roles';

-- --------------------------------------------------------

--
-- Table structure for table `box`
--

CREATE TABLE IF NOT EXISTS `box` (
  `delta` varchar(32) NOT NULL COMMENT 'The block’s block.delta.',
  `plugin_key` varchar(64) NOT NULL COMMENT 'The plugin responsible for this block.',
  `title` varchar(64) NOT NULL COMMENT 'Block title.',
  `description` varchar(255) DEFAULT '' COMMENT 'Block description.',
  `options` longtext COMMENT 'Block content configuration.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores contents of custom-made blocks.';

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE IF NOT EXISTS `cache` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Generic cache table for caching things not separated out...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_admin_menu`
--

CREATE TABLE IF NOT EXISTS `cache_admin_menu` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Cache table for Administration menu to store client-side...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_block`
--

CREATE TABLE IF NOT EXISTS `cache_block` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Cache table for the Block module to store already built...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_bootstrap`
--

CREATE TABLE IF NOT EXISTS `cache_bootstrap` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Cache table for data required to bootstrap Drupal, may be...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_field`
--

CREATE TABLE IF NOT EXISTS `cache_field` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Generic cache table for caching things not separated out...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_filter`
--

CREATE TABLE IF NOT EXISTS `cache_filter` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Cache table for the Filter module to store already...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_form`
--

CREATE TABLE IF NOT EXISTS `cache_form` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Cache table for the form system to store recently built...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_image`
--

CREATE TABLE IF NOT EXISTS `cache_image` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Cache table used to store information about image...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_libraries`
--

CREATE TABLE IF NOT EXISTS `cache_libraries` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Cache table to store library information.';

-- --------------------------------------------------------

--
-- Table structure for table `cache_menu`
--

CREATE TABLE IF NOT EXISTS `cache_menu` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Cache table for the menu system to store router...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_page`
--

CREATE TABLE IF NOT EXISTS `cache_page` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Cache table used to store compressed pages for anonymous...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_panels`
--

CREATE TABLE IF NOT EXISTS `cache_panels` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Generic cache table for caching things not separated out...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_path`
--

CREATE TABLE IF NOT EXISTS `cache_path` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Cache table for path alias lookup.';

-- --------------------------------------------------------

--
-- Table structure for table `cache_token`
--

CREATE TABLE IF NOT EXISTS `cache_token` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Cache table for token information.';

-- --------------------------------------------------------

--
-- Table structure for table `cache_update`
--

CREATE TABLE IF NOT EXISTS `cache_update` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Cache table for the Update module to store information...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_variable`
--

CREATE TABLE IF NOT EXISTS `cache_variable` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Cache table for variables.';

-- --------------------------------------------------------

--
-- Table structure for table `cache_views`
--

CREATE TABLE IF NOT EXISTS `cache_views` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Generic cache table for caching things not separated out...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_views_data`
--

CREATE TABLE IF NOT EXISTS `cache_views_data` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '1' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Cache table for views to store pre-rendered queries,...';

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
`cid` int(11) NOT NULL COMMENT 'Primary Key: Unique comment ID.',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT 'The comment.cid to which this comment is a reply. If set to 0, this comment is not a reply to an existing comment.',
  `nid` int(11) NOT NULL DEFAULT '0' COMMENT 'The node.nid to which this comment is a reply.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid who authored the comment. If set to 0, this comment was created by an anonymous user.',
  `subject` varchar(64) NOT NULL DEFAULT '' COMMENT 'The comment title.',
  `hostname` varchar(128) NOT NULL DEFAULT '' COMMENT 'The author’s host name.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'The time that the comment was created, as a Unix timestamp.',
  `changed` int(11) NOT NULL DEFAULT '0' COMMENT 'The time that the comment was last edited, as a Unix timestamp.',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'The published status of a comment. (0 = Not Published, 1 = Published)',
  `thread` varchar(255) NOT NULL COMMENT 'The vancode representation of the comment’s place in a thread.',
  `name` varchar(60) DEFAULT NULL COMMENT 'The comment author’s name. Uses users.name if the user is logged in, otherwise uses the value typed into the comment form.',
  `mail` varchar(64) DEFAULT NULL COMMENT 'The comment author’s e-mail address from the comment form, if user is anonymous, and the ’Anonymous users may/must leave their contact information’ setting is turned on.',
  `homepage` varchar(255) DEFAULT NULL COMMENT 'The comment author’s home page address from the comment form, if user is anonymous, and the ’Anonymous users may/must leave their contact information’ setting is turned on.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'The languages.language of this comment.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores comments and associated data.';

-- --------------------------------------------------------

--
-- Table structure for table `conditional_fields`
--

CREATE TABLE IF NOT EXISTS `conditional_fields` (
`id` int(11) NOT NULL COMMENT 'The primary identifier for a dependency.',
  `dependee` int(11) NOT NULL COMMENT 'The id of the dependee field instance.',
  `dependent` int(11) NOT NULL COMMENT 'The id of the dependent field instance.',
  `options` longblob NOT NULL COMMENT 'Serialized data containing the options for the dependency.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores dependencies between fields.';

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
`cid` int(10) unsigned NOT NULL COMMENT 'Primary Key: Unique category ID.',
  `category` varchar(255) NOT NULL DEFAULT '' COMMENT 'Category name.',
  `recipients` longtext NOT NULL COMMENT 'Comma-separated list of recipient e-mail addresses.',
  `reply` longtext NOT NULL COMMENT 'Text of the auto-reply message.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The category’s weight.',
  `selected` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Flag to indicate whether or not category is selected by default. (1 = Yes, 0 = No)'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Contact form category settings.';

-- --------------------------------------------------------

--
-- Table structure for table `context`
--

CREATE TABLE IF NOT EXISTS `context` (
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The primary identifier for a context.',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT 'Description for this context.',
  `tag` varchar(255) NOT NULL DEFAULT '' COMMENT 'Tag for this context.',
  `conditions` text COMMENT 'Serialized storage of all context condition settings.',
  `reactions` text COMMENT 'Serialized storage of all context reaction settings.',
  `condition_mode` int(11) DEFAULT '0' COMMENT 'Condition mode for this context.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Storage for normal (user-defined) contexts.';

-- --------------------------------------------------------

--
-- Table structure for table `ctools_access_ruleset`
--

CREATE TABLE IF NOT EXISTS `ctools_access_ruleset` (
`rsid` int(11) NOT NULL COMMENT 'A database primary key to ensure uniqueness',
  `name` varchar(255) DEFAULT NULL COMMENT 'Unique ID for this ruleset. Used to identify it programmatically.',
  `admin_title` varchar(255) DEFAULT NULL COMMENT 'Administrative title for this ruleset.',
  `admin_description` longtext COMMENT 'Administrative description for this ruleset.',
  `requiredcontexts` longtext COMMENT 'Any required contexts for this ruleset.',
  `contexts` longtext COMMENT 'Any embedded contexts for this ruleset.',
  `relationships` longtext COMMENT 'Any relationships for this ruleset.',
  `access` longtext COMMENT 'The actual group of access plugins for this ruleset.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains exportable customized access rulesets.';

-- --------------------------------------------------------

--
-- Table structure for table `ctools_css_cache`
--

CREATE TABLE IF NOT EXISTS `ctools_css_cache` (
  `cid` varchar(128) NOT NULL COMMENT 'The CSS ID this cache object belongs to.',
  `filename` varchar(255) DEFAULT NULL COMMENT 'The filename this CSS is stored in.',
  `css` longtext COMMENT 'CSS being stored.',
  `filter` tinyint(4) DEFAULT NULL COMMENT 'Whether or not this CSS needs to be filtered.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='A special cache used to store CSS that must be non-volatile.';

-- --------------------------------------------------------

--
-- Table structure for table `ctools_custom_content`
--

CREATE TABLE IF NOT EXISTS `ctools_custom_content` (
`cid` int(11) NOT NULL COMMENT 'A database primary key to ensure uniqueness',
  `name` varchar(255) DEFAULT NULL COMMENT 'Unique ID for this content. Used to identify it programmatically.',
  `admin_title` varchar(255) DEFAULT NULL COMMENT 'Administrative title for this content.',
  `admin_description` longtext COMMENT 'Administrative description for this content.',
  `category` varchar(255) DEFAULT NULL COMMENT 'Administrative category for this content.',
  `settings` longtext COMMENT 'Serialized settings for the actual content to be used'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains exportable customized content for this site.';

-- --------------------------------------------------------

--
-- Table structure for table `ctools_object_cache`
--

CREATE TABLE IF NOT EXISTS `ctools_object_cache` (
  `sid` varchar(64) NOT NULL COMMENT 'The session ID this cache object belongs to.',
  `name` varchar(128) NOT NULL COMMENT 'The name of the object this cache is attached to.',
  `obj` varchar(32) NOT NULL COMMENT 'The type of the object this cache is attached to; this essentially represents the owner so that several sub-systems can use this cache.',
  `updated` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The time this cache was created or updated.',
  `data` longblob COMMENT 'Serialized data being stored.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='A special cache used to store objects that are being...';

-- --------------------------------------------------------

--
-- Table structure for table `date_formats`
--

CREATE TABLE IF NOT EXISTS `date_formats` (
`dfid` int(10) unsigned NOT NULL COMMENT 'The date format identifier.',
  `format` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The date format string.',
  `type` varchar(64) NOT NULL COMMENT 'The date format type, e.g. medium.',
  `locked` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Whether or not this format can be modified.'
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='Stores configured date formats.';

-- --------------------------------------------------------

--
-- Table structure for table `date_format_locale`
--

CREATE TABLE IF NOT EXISTS `date_format_locale` (
  `format` varchar(100) NOT NULL COMMENT 'The date format string.',
  `type` varchar(64) NOT NULL COMMENT 'The date format type, e.g. medium.',
  `language` varchar(12) NOT NULL COMMENT 'A languages.language for this format to be used with.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores configured date formats for each locale.';

-- --------------------------------------------------------

--
-- Table structure for table `date_format_type`
--

CREATE TABLE IF NOT EXISTS `date_format_type` (
  `type` varchar(64) NOT NULL COMMENT 'The date format type, e.g. medium.',
  `title` varchar(255) NOT NULL COMMENT 'The human readable name of the format type.',
  `locked` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Whether or not this is a system provided format.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores configured date format types.';

-- --------------------------------------------------------

--
-- Table structure for table `delta`
--

CREATE TABLE IF NOT EXISTS `delta` (
  `machine_name` varchar(32) NOT NULL COMMENT 'The system name of this theme settings template.',
  `name` varchar(128) NOT NULL COMMENT 'The friendly name of this theme settings template.',
  `description` mediumtext NOT NULL COMMENT 'A brief description of this theme settings template.',
  `theme` varchar(128) NOT NULL COMMENT 'The theme for which this theme settings template is relevant.',
  `mode` varchar(32) NOT NULL COMMENT 'The mode that this template operrates in.',
  `parent` varchar(32) NOT NULL COMMENT 'The system name of the parent of this theme settings template.',
  `settings` longblob COMMENT 'Serialized data which is a copy of the theme settings array stored in the system table based on these overrides'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores theme-settings templates that allow overriding the...';

-- --------------------------------------------------------

--
-- Table structure for table `entityform`
--

CREATE TABLE IF NOT EXISTS `entityform` (
`entityform_id` int(10) unsigned NOT NULL COMMENT 'Primary Key: Identifier for a entityform.',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT 'The entityform_type.type of this entityform.',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language of the entityform.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the entityform was created.',
  `changed` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the entityform was most recently saved.',
  `data` longblob COMMENT 'A serialized array of additional data.',
  `uid` int(10) unsigned DEFAULT NULL COMMENT 'The users.uid of the associated user.',
  `draft` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Wheter this form submission is a draft.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='The base table for entityform entities.';

-- --------------------------------------------------------

--
-- Table structure for table `entityform_type`
--

CREATE TABLE IF NOT EXISTS `entityform_type` (
`id` int(11) NOT NULL COMMENT 'Primary Key: Unique entityform type identifier.',
  `type` varchar(255) NOT NULL COMMENT 'The machine-readable name of this entityform type.',
  `label` varchar(255) NOT NULL DEFAULT '' COMMENT 'The human-readable name of this entityform type.',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The weight of this entityform type in relation to others.',
  `data` longtext COMMENT 'A serialized array of additional data related to this entityform type.',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'The exportable status of the entity.',
  `module` varchar(255) DEFAULT NULL COMMENT 'The name of the providing module if the entity has been defined in code.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores information about defined entityform types.';

-- --------------------------------------------------------

--
-- Table structure for table `field_collection_item`
--

CREATE TABLE IF NOT EXISTS `field_collection_item` (
`item_id` int(11) NOT NULL COMMENT 'Primary Key: Unique field collection item ID.',
  `revision_id` int(11) NOT NULL COMMENT 'Default revision ID.',
  `field_name` varchar(32) NOT NULL COMMENT 'The name of the field on the host entity embedding this entity.',
  `archived` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the field collection item is archived.'
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='Stores information about field collection items.';

-- --------------------------------------------------------

--
-- Table structure for table `field_collection_item_revision`
--

CREATE TABLE IF NOT EXISTS `field_collection_item_revision` (
`revision_id` int(11) NOT NULL COMMENT 'Primary Key: Unique revision ID.',
  `item_id` int(11) NOT NULL COMMENT 'Field collection item ID.'
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='Stores revision information about field collection items.';

-- --------------------------------------------------------

--
-- Table structure for table `field_config`
--

CREATE TABLE IF NOT EXISTS `field_config` (
`id` int(11) NOT NULL COMMENT 'The primary identifier for a field',
  `field_name` varchar(32) NOT NULL COMMENT 'The name of this field. Non-deleted field names are unique, but multiple deleted fields can have the same name.',
  `type` varchar(128) NOT NULL COMMENT 'The type of this field.',
  `module` varchar(128) NOT NULL DEFAULT '' COMMENT 'The module that implements the field type.',
  `active` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the module that implements the field type is enabled.',
  `storage_type` varchar(128) NOT NULL COMMENT 'The storage backend for the field.',
  `storage_module` varchar(128) NOT NULL DEFAULT '' COMMENT 'The module that implements the storage backend.',
  `storage_active` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the module that implements the storage backend is enabled.',
  `locked` tinyint(4) NOT NULL DEFAULT '0' COMMENT '@TODO',
  `data` longblob NOT NULL COMMENT 'Serialized data containing the field properties that do not warrant a dedicated column.',
  `cardinality` tinyint(4) NOT NULL DEFAULT '0',
  `translatable` tinyint(4) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `field_config_instance`
--

CREATE TABLE IF NOT EXISTS `field_config_instance` (
`id` int(11) NOT NULL COMMENT 'The primary identifier for a field instance',
  `field_id` int(11) NOT NULL COMMENT 'The identifier of the field attached by this instance',
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `entity_type` varchar(32) NOT NULL DEFAULT '',
  `bundle` varchar(128) NOT NULL DEFAULT '',
  `data` longblob NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=243 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `field_data_body`
--

CREATE TABLE IF NOT EXISTS `field_data_body` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `body_value` longtext,
  `body_summary` longtext,
  `body_format` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 2 (body)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_comment_body`
--

CREATE TABLE IF NOT EXISTS `field_data_comment_body` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `comment_body_value` longtext,
  `comment_body_format` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 1 (comment_body)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_age`
--

CREATE TABLE IF NOT EXISTS `field_data_field_age` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_age_value` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 18 (field_age)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_album`
--

CREATE TABLE IF NOT EXISTS `field_data_field_album` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_album_tid` int(10) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 6 (field_album)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_attached`
--

CREATE TABLE IF NOT EXISTS `field_data_field_attached` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_attached_fid` int(10) unsigned DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_attached_display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'Flag to control whether this file should be displayed when viewing content.',
  `field_attached_description` text COMMENT 'A description of the file.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 8 (field_attached)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_banner`
--

CREATE TABLE IF NOT EXISTS `field_data_field_banner` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_banner_tid` int(10) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 32 (field_banner)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_beneficiary`
--

CREATE TABLE IF NOT EXISTS `field_data_field_beneficiary` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_beneficiary_tid` int(10) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 37 (field_beneficiary)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_country`
--

CREATE TABLE IF NOT EXISTS `field_data_field_country` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_country_tid` int(10) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 20 (field_country)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_current_minister`
--

CREATE TABLE IF NOT EXISTS `field_data_field_current_minister` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_current_minister_value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 70 (field_current_minister)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_date`
--

CREATE TABLE IF NOT EXISTS `field_data_field_date` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_date_value` datetime DEFAULT NULL,
  `field_date_value2` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 7 (field_date)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_designation`
--

CREATE TABLE IF NOT EXISTS `field_data_field_designation` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_designation_tid` int(10) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 27 (field_designation)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_document_type`
--

CREATE TABLE IF NOT EXISTS `field_data_field_document_type` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_document_type_tid` int(10) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 28 (field_document_type)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_email_feedback`
--

CREATE TABLE IF NOT EXISTS `field_data_field_email_feedback` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_email_feedback_email` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 34 (field_email_feedback)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_extention`
--

CREATE TABLE IF NOT EXISTS `field_data_field_extention` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_extention_value` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 50 (field_extention)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_fax`
--

CREATE TABLE IF NOT EXISTS `field_data_field_fax` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_fax_value` varchar(255) DEFAULT NULL,
  `field_fax_format` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 51 (field_fax)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_form_category`
--

CREATE TABLE IF NOT EXISTS `field_data_field_form_category` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_form_category_tid` int(10) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 39 (field_form_category)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_group_field`
--

CREATE TABLE IF NOT EXISTS `field_data_field_group_field` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_group_field_value` int(11) DEFAULT NULL COMMENT 'The field collection item id.',
  `field_group_field_revision_id` int(11) DEFAULT NULL COMMENT 'The field collection item revision id.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 71 (field_group_field)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_image`
--

CREATE TABLE IF NOT EXISTS `field_data_field_image` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_image_fid` int(10) unsigned DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_image_alt` varchar(512) DEFAULT NULL COMMENT 'Alternative image text, for the image’s ’alt’ attribute.',
  `field_image_title` varchar(1024) DEFAULT NULL COMMENT 'Image title text, for the image’s ’title’ attribute.',
  `field_image_width` int(10) unsigned DEFAULT NULL COMMENT 'The width of the image in pixels.',
  `field_image_height` int(10) unsigned DEFAULT NULL COMMENT 'The height of the image in pixels.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 4 (field_image)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_knowledge_category`
--

CREATE TABLE IF NOT EXISTS `field_data_field_knowledge_category` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_knowledge_category_tid` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 68 (field_knowledge_category)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_location`
--

CREATE TABLE IF NOT EXISTS `field_data_field_location` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_location_value` varchar(255) DEFAULT NULL,
  `field_location_format` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 12 (field_location)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_minister`
--

CREATE TABLE IF NOT EXISTS `field_data_field_minister` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_minister_target_id` int(10) unsigned NOT NULL COMMENT 'The id of the target entity.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 65 (field_minister)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_mobile_number`
--

CREATE TABLE IF NOT EXISTS `field_data_field_mobile_number` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_mobile_number_value` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 15 (field_mobile_number)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_name`
--

CREATE TABLE IF NOT EXISTS `field_data_field_name` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_name_value` varchar(20) DEFAULT NULL,
  `field_name_format` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 14 (field_name)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_number`
--

CREATE TABLE IF NOT EXISTS `field_data_field_number` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_number_value` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 30 (field_number)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_owned_by`
--

CREATE TABLE IF NOT EXISTS `field_data_field_owned_by` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_owned_by_value` varchar(255) DEFAULT NULL,
  `field_owned_by_format` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 41 (field_owned_by)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_phone_no`
--

CREATE TABLE IF NOT EXISTS `field_data_field_phone_no` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_phone_no_value` varchar(255) DEFAULT NULL,
  `field_phone_no_format` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 49 (field_phone_no)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_pin_code`
--

CREATE TABLE IF NOT EXISTS `field_data_field_pin_code` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_pin_code_value` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 19 (field_pin_code)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_proactive_description`
--

CREATE TABLE IF NOT EXISTS `field_data_field_proactive_description` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_proactive_description_value` longtext,
  `field_proactive_description_format` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 26 (field_proactive_description)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_proactive_set`
--

CREATE TABLE IF NOT EXISTS `field_data_field_proactive_set` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_proactive_set_value` int(11) DEFAULT NULL COMMENT 'The field collection item id.',
  `field_proactive_set_revision_id` int(11) DEFAULT NULL COMMENT 'The field collection item revision id.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 24 (field_proactive_set)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_proactive_title`
--

CREATE TABLE IF NOT EXISTS `field_data_field_proactive_title` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_proactive_title_value` varchar(300) DEFAULT NULL,
  `field_proactive_title_format` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 25 (field_proactive_title)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_qa_category`
--

CREATE TABLE IF NOT EXISTS `field_data_field_qa_category` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_qa_category_tid` int(10) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 38 (field_qa_category)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_room_no`
--

CREATE TABLE IF NOT EXISTS `field_data_field_room_no` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_room_no_value` varchar(255) DEFAULT NULL,
  `field_room_no_format` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 48 (field_room_no)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_rule_notifications`
--

CREATE TABLE IF NOT EXISTS `field_data_field_rule_notifications` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_rule_notifications_tid` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 66 (field_rule_notifications)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_start_date`
--

CREATE TABLE IF NOT EXISTS `field_data_field_start_date` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_start_date_value` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 17 (field_start_date)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_state_district`
--

CREATE TABLE IF NOT EXISTS `field_data_field_state_district` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_state_district_tid` int(10) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 21 (field_state_district)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_tags`
--

CREATE TABLE IF NOT EXISTS `field_data_field_tags` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_tags_tid` int(10) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 3 (field_tags)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_upload_attachement`
--

CREATE TABLE IF NOT EXISTS `field_data_field_upload_attachement` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_upload_attachement_fid` int(10) unsigned DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_upload_attachement_display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'Flag to control whether this file should be displayed when viewing content.',
  `field_upload_attachement_description` text COMMENT 'A description of the file.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 44 (field_upload_attachement)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_url`
--

CREATE TABLE IF NOT EXISTS `field_data_field_url` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_url_url` varchar(2048) DEFAULT NULL,
  `field_url_title` varchar(255) DEFAULT NULL,
  `field_url_attributes` mediumtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 9 (field_url)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_video`
--

CREATE TABLE IF NOT EXISTS `field_data_field_video` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_video_video_url` varchar(512) DEFAULT '',
  `field_video_thumbnail_path` varchar(512) DEFAULT '',
  `field_video_video_data` longblob,
  `field_video_embed_code` varchar(1024) DEFAULT '',
  `field_video_description` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 29 (field_video)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_taxonomy_forums`
--

CREATE TABLE IF NOT EXISTS `field_data_taxonomy_forums` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `taxonomy_forums_tid` int(10) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Data storage for field 33 (taxonomy_forums)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_body`
--

CREATE TABLE IF NOT EXISTS `field_revision_body` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `body_value` longtext,
  `body_summary` longtext,
  `body_format` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 2 (body)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_comment_body`
--

CREATE TABLE IF NOT EXISTS `field_revision_comment_body` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `comment_body_value` longtext,
  `comment_body_format` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 1 (comment_body)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_age`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_age` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_age_value` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 18 (field_age)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_album`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_album` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_album_tid` int(10) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 6 (field_album)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_attached`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_attached` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_attached_fid` int(10) unsigned DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_attached_display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'Flag to control whether this file should be displayed when viewing content.',
  `field_attached_description` text COMMENT 'A description of the file.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 8 (field_attached)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_banner`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_banner` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_banner_tid` int(10) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 32 (field_banner)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_beneficiary`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_beneficiary` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_beneficiary_tid` int(10) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 37 (field_beneficiary)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_country`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_country` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_country_tid` int(10) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 20 (field_country)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_current_minister`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_current_minister` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_current_minister_value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 70 (field_current...';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_date`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_date` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_date_value` datetime DEFAULT NULL,
  `field_date_value2` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 7 (field_date)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_designation`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_designation` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_designation_tid` int(10) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 27 (field_designation)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_document_type`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_document_type` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_document_type_tid` int(10) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 28 (field_document_type)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_email_feedback`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_email_feedback` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_email_feedback_email` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 34 (field_email_feedback)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_extention`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_extention` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_extention_value` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 50 (field_extention)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_fax`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_fax` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_fax_value` varchar(255) DEFAULT NULL,
  `field_fax_format` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 51 (field_fax)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_form_category`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_form_category` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_form_category_tid` int(10) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 39 (field_form_category)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_group_field`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_group_field` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_group_field_value` int(11) DEFAULT NULL COMMENT 'The field collection item id.',
  `field_group_field_revision_id` int(11) DEFAULT NULL COMMENT 'The field collection item revision id.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 71 (field_group_field)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_image`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_image` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_image_fid` int(10) unsigned DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_image_alt` varchar(512) DEFAULT NULL COMMENT 'Alternative image text, for the image’s ’alt’ attribute.',
  `field_image_title` varchar(1024) DEFAULT NULL COMMENT 'Image title text, for the image’s ’title’ attribute.',
  `field_image_width` int(10) unsigned DEFAULT NULL COMMENT 'The width of the image in pixels.',
  `field_image_height` int(10) unsigned DEFAULT NULL COMMENT 'The height of the image in pixels.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 4 (field_image)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_knowledge_category`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_knowledge_category` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_knowledge_category_tid` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 68 (field_knowledge...';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_location`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_location` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_location_value` varchar(255) DEFAULT NULL,
  `field_location_format` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 12 (field_location)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_minister`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_minister` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_minister_target_id` int(10) unsigned NOT NULL COMMENT 'The id of the target entity.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 65 (field_minister)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_mobile_number`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_mobile_number` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_mobile_number_value` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 15 (field_mobile_number)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_name`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_name` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_name_value` varchar(20) DEFAULT NULL,
  `field_name_format` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 14 (field_name)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_number`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_number` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_number_value` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 30 (field_number)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_owned_by`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_owned_by` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_owned_by_value` varchar(255) DEFAULT NULL,
  `field_owned_by_format` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 41 (field_owned_by)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_phone_no`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_phone_no` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_phone_no_value` varchar(255) DEFAULT NULL,
  `field_phone_no_format` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 49 (field_phone_no)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_pin_code`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_pin_code` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_pin_code_value` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 19 (field_pin_code)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_proactive_description`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_proactive_description` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_proactive_description_value` longtext,
  `field_proactive_description_format` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 26 (field_proactive...';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_proactive_set`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_proactive_set` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_proactive_set_value` int(11) DEFAULT NULL COMMENT 'The field collection item id.',
  `field_proactive_set_revision_id` int(11) DEFAULT NULL COMMENT 'The field collection item revision id.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 24 (field_proactive_set)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_proactive_title`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_proactive_title` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_proactive_title_value` varchar(300) DEFAULT NULL,
  `field_proactive_title_format` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 25 (field_proactive...';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_qa_category`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_qa_category` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_qa_category_tid` int(10) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 38 (field_qa_category)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_room_no`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_room_no` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_room_no_value` varchar(255) DEFAULT NULL,
  `field_room_no_format` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 48 (field_room_no)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_rule_notifications`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_rule_notifications` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_rule_notifications_tid` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 66 (field_rule...';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_start_date`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_start_date` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_start_date_value` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 17 (field_start_date)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_state_district`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_state_district` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_state_district_tid` int(10) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 21 (field_state_district)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_tags`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_tags` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_tags_tid` int(10) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 3 (field_tags)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_upload_attachement`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_upload_attachement` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_upload_attachement_fid` int(10) unsigned DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_upload_attachement_display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'Flag to control whether this file should be displayed when viewing content.',
  `field_upload_attachement_description` text COMMENT 'A description of the file.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 44 (field_upload...';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_url`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_url` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_url_url` varchar(2048) DEFAULT NULL,
  `field_url_title` varchar(255) DEFAULT NULL,
  `field_url_attributes` mediumtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 9 (field_url)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_video`
--

CREATE TABLE IF NOT EXISTS `field_revision_field_video` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_video_video_url` varchar(512) DEFAULT '',
  `field_video_thumbnail_path` varchar(512) DEFAULT '',
  `field_video_video_data` longblob,
  `field_video_embed_code` varchar(1024) DEFAULT '',
  `field_video_description` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 29 (field_video)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_taxonomy_forums`
--

CREATE TABLE IF NOT EXISTS `field_revision_taxonomy_forums` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `taxonomy_forums_tid` int(10) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 33 (taxonomy_forums)';

-- --------------------------------------------------------

--
-- Table structure for table `file_managed`
--

CREATE TABLE IF NOT EXISTS `file_managed` (
`fid` int(10) unsigned NOT NULL COMMENT 'File ID.',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The users.uid of the user who is associated with the file.',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of the file with no path components. This may differ from the basename of the URI if the file is renamed to avoid overwriting an existing file.',
  `uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'The URI to access the file (either local or remote).',
  `filemime` varchar(255) NOT NULL DEFAULT '' COMMENT 'The file’s MIME type.',
  `filesize` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'The size of the file in bytes.',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A field indicating the status of the file. Two status are defined in core: temporary (0) and permanent (1). Temporary files older than DRUPAL_MAXIMUM_TEMP_FILE_AGE will be removed during a cron run.',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'UNIX timestamp for when the file was added.'
) ENGINE=MyISAM AUTO_INCREMENT=416 DEFAULT CHARSET=utf8 COMMENT='Stores information for uploaded files.';

-- --------------------------------------------------------

--
-- Table structure for table `file_usage`
--

CREATE TABLE IF NOT EXISTS `file_usage` (
  `fid` int(10) unsigned NOT NULL COMMENT 'File ID.',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the module that is using the file.',
  `type` varchar(64) NOT NULL DEFAULT '' COMMENT 'The name of the object type in which the file is used.',
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The primary key of the object using the file.',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The number of times this file is used by this object.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Track where a file is used.';

-- --------------------------------------------------------

--
-- Table structure for table `filter`
--

CREATE TABLE IF NOT EXISTS `filter` (
  `format` varchar(255) NOT NULL COMMENT 'Foreign key: The filter_format.format to which this filter is assigned.',
  `module` varchar(64) NOT NULL DEFAULT '' COMMENT 'The origin module of the filter.',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT 'Name of the filter being referenced.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Weight of filter within format.',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'Filter enabled status. (1 = enabled, 0 = disabled)',
  `settings` longblob COMMENT 'A serialized array of name value pairs that store the filter settings for the specific format.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Table that maps filters (HTML corrector) to text formats ...';

-- --------------------------------------------------------

--
-- Table structure for table `filter_format`
--

CREATE TABLE IF NOT EXISTS `filter_format` (
  `format` varchar(255) NOT NULL COMMENT 'Primary Key: Unique machine name of the format.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of the text format (Filtered HTML).',
  `cache` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Flag to indicate whether format is cacheable. (1 = cacheable, 0 = not cacheable)',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'The status of the text format. (1 = enabled, 0 = disabled)',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Weight of text format to use when listing.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores text formats: custom groupings of filters, such as...';

-- --------------------------------------------------------

--
-- Table structure for table `flexslider_optionset`
--

CREATE TABLE IF NOT EXISTS `flexslider_optionset` (
  `name` varchar(255) NOT NULL COMMENT 'The machine-readable option set name.',
  `title` varchar(255) NOT NULL COMMENT 'The human-readable title for this option set.',
  `theme` varchar(255) NOT NULL DEFAULT 'classic' COMMENT 'The flexslider theme.',
  `imagestyle_normal` varchar(255) NOT NULL DEFAULT 'flexslider_full' COMMENT 'The image style for normal images.',
  `imagestyle_thumbnail` varchar(255) NOT NULL DEFAULT 'flexslider_thumbnail' COMMENT 'The image style for thumbnail images.',
  `options` longblob COMMENT 'The options array.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Store option sets for flexslider instances.';

-- --------------------------------------------------------

--
-- Table structure for table `flood`
--

CREATE TABLE IF NOT EXISTS `flood` (
`fid` int(11) NOT NULL COMMENT 'Unique flood event ID.',
  `event` varchar(64) NOT NULL DEFAULT '' COMMENT 'Name of event (e.g. contact).',
  `identifier` varchar(128) NOT NULL DEFAULT '' COMMENT 'Identifier of the visitor, such as an IP address or hostname.',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp of the event.',
  `expiration` int(11) NOT NULL DEFAULT '0' COMMENT 'Expiration timestamp. Expired events are purged on cron run.'
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=utf8 COMMENT='Flood controls the threshold of events, such as the...';

-- --------------------------------------------------------

--
-- Table structure for table `forum`
--

CREATE TABLE IF NOT EXISTS `forum` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid of the node.',
  `vid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Primary Key: The node.vid of the node.',
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The taxonomy_term_data.tid of the forum term assigned to the node.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores the relationship of nodes to forum terms.';

-- --------------------------------------------------------

--
-- Table structure for table `forum_index`
--

CREATE TABLE IF NOT EXISTS `forum_index` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid this record tracks.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title of this node, always treated as non-markup plain text.',
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The term ID.',
  `sticky` tinyint(4) DEFAULT '0' COMMENT 'Boolean indicating whether the node is sticky.',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was created.',
  `last_comment_timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp of the last comment that was posted within this node, from comment.timestamp.',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The total number of comments on this node.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Maintains denormalized information about node/term...';

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE IF NOT EXISTS `history` (
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid that read the node nid.',
  `nid` int(11) NOT NULL DEFAULT '0' COMMENT 'The node.nid that was read.',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp at which the read occurred.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='A record of which users have read which nodes.';

-- --------------------------------------------------------

--
-- Table structure for table `i18n_block_language`
--

CREATE TABLE IF NOT EXISTS `i18n_block_language` (
  `module` varchar(64) NOT NULL COMMENT 'The block’s origin module, from block.module.',
  `delta` varchar(32) NOT NULL COMMENT 'The block’s unique delta within module, from block.delta.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'Language code, e.g. ’de’ or ’en-US’.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Sets block visibility based on language';

-- --------------------------------------------------------

--
-- Table structure for table `i18n_path`
--

CREATE TABLE IF NOT EXISTS `i18n_path` (
`tpid` int(10) unsigned NOT NULL COMMENT 'The primary identifier for a path in the translation set.',
  `tsid` int(10) unsigned NOT NULL COMMENT 'The primary identifier for a translation set.',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT 'The Drupal path this alias is for; e.g. node/12.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'The language for which this path is a translation.',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'A unique path alias identifier if the path has an alias.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Path translation';

-- --------------------------------------------------------

--
-- Table structure for table `i18n_string`
--

CREATE TABLE IF NOT EXISTS `i18n_string` (
  `lid` int(11) NOT NULL DEFAULT '0' COMMENT 'Source string ID. References locales_source.lid.',
  `textgroup` varchar(50) NOT NULL DEFAULT 'default' COMMENT 'A module defined group of translations, see hook_locale().',
  `context` varchar(255) NOT NULL DEFAULT '' COMMENT 'Full string ID for quick search: type:objectid:property.',
  `objectid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Object ID.',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT 'Object type for this string.',
  `property` varchar(255) NOT NULL DEFAULT '' COMMENT 'Object property for this string.',
  `objectindex` int(11) NOT NULL DEFAULT '0' COMMENT 'Integer value of Object ID.',
  `format` varchar(255) DEFAULT NULL COMMENT 'The filter_format.format of the string.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Metadata for source strings.';

-- --------------------------------------------------------

--
-- Table structure for table `i18n_translation_set`
--

CREATE TABLE IF NOT EXISTS `i18n_translation_set` (
`tsid` int(10) unsigned NOT NULL COMMENT 'The primary identifier for a translation set.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title of this translation set, always treated as non-markup plain text.',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT 'Object type or entity type.',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'Optional bundle for entity translation sets.',
  `master_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The master object/entity id (the others will be synchronized with this one).',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT 'Status of this translation set. TBD.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the set was created.',
  `changed` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the set was most recently saved.'
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='Translation set.';

-- --------------------------------------------------------

--
-- Table structure for table `icon_bundle`
--

CREATE TABLE IF NOT EXISTS `icon_bundle` (
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT 'The name of the icon bundle.',
  `bundle` longblob COMMENT 'The array data belonging to the icon bundle.',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'The enabled status. (1 = enabled, 0 = disabled) of the icon bundle.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores the contents of icon bundles.';

-- --------------------------------------------------------

--
-- Table structure for table `image_effects`
--

CREATE TABLE IF NOT EXISTS `image_effects` (
`ieid` int(10) unsigned NOT NULL COMMENT 'The primary identifier for an image effect.',
  `isid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The image_styles.isid for an image style.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of the effect in the style.',
  `name` varchar(255) NOT NULL COMMENT 'The unique name of the effect to be executed.',
  `data` longblob NOT NULL COMMENT 'The configuration data for the effect.'
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Stores configuration options for image effects.';

-- --------------------------------------------------------

--
-- Table structure for table `image_styles`
--

CREATE TABLE IF NOT EXISTS `image_styles` (
`isid` int(10) unsigned NOT NULL COMMENT 'The primary identifier for an image style.',
  `name` varchar(255) NOT NULL COMMENT 'The style machine name.',
  `label` varchar(255) NOT NULL DEFAULT '' COMMENT 'The style administrative name.'
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Stores configuration options for image styles.';

-- --------------------------------------------------------

--
-- Table structure for table `ips_allow_list`
--

CREATE TABLE IF NOT EXISTS `ips_allow_list` (
`id` int(10) unsigned NOT NULL COMMENT 'Unique identifier for the Validate-String.',
  `user_role` int(11) DEFAULT NULL COMMENT 'Role Id.',
  `ip_list` text COMMENT 'IP List.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Open Admin for perticular IP.';

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'Language code, e.g. ’de’ or ’en-US’.',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT 'Language name in English.',
  `native` varchar(64) NOT NULL DEFAULT '' COMMENT 'Native language name.',
  `direction` int(11) NOT NULL DEFAULT '0' COMMENT 'Direction of language (Left-to-Right = 0, Right-to-Left = 1).',
  `enabled` int(11) NOT NULL DEFAULT '0' COMMENT 'Enabled flag (1 = Enabled, 0 = Disabled).',
  `plurals` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of plural indexes in this language.',
  `formula` varchar(255) NOT NULL DEFAULT '' COMMENT 'Plural formula in PHP code to evaluate to get plural indexes.',
  `domain` varchar(128) NOT NULL DEFAULT '' COMMENT 'Domain to use for this language.',
  `prefix` varchar(128) NOT NULL DEFAULT '' COMMENT 'Path prefix to use for this language.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Weight, used in lists of languages.',
  `javascript` varchar(64) NOT NULL DEFAULT '' COMMENT 'Location of JavaScript translation file.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='List of all available languages in the system.';

-- --------------------------------------------------------

--
-- Table structure for table `locales_source`
--

CREATE TABLE IF NOT EXISTS `locales_source` (
`lid` int(11) NOT NULL COMMENT 'Unique identifier of this string.',
  `location` longtext COMMENT 'Drupal path in case of online discovered translations or file path in case of imported strings.',
  `textgroup` varchar(255) NOT NULL DEFAULT 'default' COMMENT 'A module defined group of translations, see hook_locale().',
  `source` blob NOT NULL COMMENT 'The original string in English.',
  `context` varchar(255) NOT NULL DEFAULT '' COMMENT 'The context this string applies to.',
  `version` varchar(20) NOT NULL DEFAULT 'none' COMMENT 'Version of Drupal, where the string was last used (for locales optimization).'
) ENGINE=MyISAM AUTO_INCREMENT=20918 DEFAULT CHARSET=utf8 COMMENT='List of English source strings.';

-- --------------------------------------------------------

--
-- Table structure for table `locales_target`
--

CREATE TABLE IF NOT EXISTS `locales_target` (
  `lid` int(11) NOT NULL DEFAULT '0' COMMENT 'Source string ID. References locales_source.lid.',
  `translation` blob NOT NULL COMMENT 'Translation string value in this language.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'Language code. References languages.language.',
  `plid` int(11) NOT NULL DEFAULT '0' COMMENT 'Parent lid (lid of the previous string in the plural chain) in case of plural strings. References locales_source.lid.',
  `plural` int(11) NOT NULL DEFAULT '0' COMMENT 'Plural index number in case of plural strings.',
  `i18n_status` int(11) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this translation needs to be updated.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores translated versions of strings.';

-- --------------------------------------------------------

--
-- Table structure for table `menu_custom`
--

CREATE TABLE IF NOT EXISTS `menu_custom` (
  `menu_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique key for menu. This is used as a block delta so length is 32.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'Menu title; displayed at top of block.',
  `description` text COMMENT 'Menu description.',
  `language` varchar(12) NOT NULL DEFAULT 'und',
  `i18n_mode` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds definitions for top-level custom menus (for example...';

-- --------------------------------------------------------

--
-- Table structure for table `menu_links`
--

CREATE TABLE IF NOT EXISTS `menu_links` (
  `menu_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'The menu name. All links with the same menu name (such as ’navigation’) are part of the same menu.',
`mlid` int(10) unsigned NOT NULL COMMENT 'The menu link ID (mlid) is the integer primary key.',
  `plid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The parent link ID (plid) is the mlid of the link above in the hierarchy, or zero if the link is at the top level in its menu.',
  `link_path` varchar(255) NOT NULL DEFAULT '' COMMENT 'The Drupal path or external path this link points to.',
  `router_path` varchar(255) NOT NULL DEFAULT '' COMMENT 'For links corresponding to a Drupal path (external = 0), this connects the link to a menu_router.path for joins.',
  `link_title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The text displayed for the link, which may be modified by a title callback stored in menu_router.',
  `options` blob COMMENT 'A serialized array of options to be passed to the url() or l() function, such as a query string or HTML attributes.',
  `module` varchar(255) NOT NULL DEFAULT 'system' COMMENT 'The name of the module that generated this link.',
  `hidden` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag for whether the link should be rendered in menus. (1 = a disabled menu item that may be shown on admin screens, -1 = a menu callback, 0 = a normal, visible link)',
  `external` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate if the link points to a full URL starting with a protocol, like http:// (1 = external, 0 = internal).',
  `has_children` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Flag indicating whether any links have this link as a parent (1 = children exist, 0 = no children).',
  `expanded` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Flag for whether this link should be rendered as expanded in menus - expanded links always have their child links displayed, instead of only when the link is in the active trail (1 = expanded, 0 = not expanded)',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Link weight among links in the same menu at the same depth.',
  `depth` smallint(6) NOT NULL DEFAULT '0' COMMENT 'The depth relative to the top level. A link with plid == 0 will have depth == 1.',
  `customized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate that the user has manually created or edited the link (1 = customized, 0 = not customized).',
  `p1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The first mlid in the materialized path. If N = depth, then pN must equal the mlid. If depth > 1 then p(N-1) must equal the plid. All pX where X > depth must equal zero. The columns p1 .. p9 are also called the parents.',
  `p2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The second mlid in the materialized path. See p1.',
  `p3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The third mlid in the materialized path. See p1.',
  `p4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The fourth mlid in the materialized path. See p1.',
  `p5` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The fifth mlid in the materialized path. See p1.',
  `p6` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The sixth mlid in the materialized path. See p1.',
  `p7` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The seventh mlid in the materialized path. See p1.',
  `p8` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The eighth mlid in the materialized path. See p1.',
  `p9` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The ninth mlid in the materialized path. See p1.',
  `updated` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Flag that indicates that this link was generated during the update from Drupal 5.',
  `language` varchar(12) NOT NULL DEFAULT 'und',
  `i18n_tsid` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2162 DEFAULT CHARSET=utf8 COMMENT='Contains the individual links within a menu.';

-- --------------------------------------------------------

--
-- Table structure for table `menu_router`
--

CREATE TABLE IF NOT EXISTS `menu_router` (
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: the Drupal path this entry describes',
  `load_functions` blob NOT NULL COMMENT 'A serialized array of function names (like node_load) to be called to load an object corresponding to a part of the current path.',
  `to_arg_functions` blob NOT NULL COMMENT 'A serialized array of function names (like user_uid_optional_to_arg) to be called to replace a part of the router path with another string.',
  `access_callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'The callback which determines the access to this router path. Defaults to user_access.',
  `access_arguments` blob COMMENT 'A serialized array of arguments for the access callback.',
  `page_callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the function that renders the page.',
  `page_arguments` blob COMMENT 'A serialized array of arguments for the page callback.',
  `delivery_callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the function that sends the result of the page_callback function to the browser.',
  `fit` int(11) NOT NULL DEFAULT '0' COMMENT 'A numeric representation of how specific the path is.',
  `number_parts` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Number of parts in this router path.',
  `context` int(11) NOT NULL DEFAULT '0' COMMENT 'Only for local tasks (tabs) - the context of a local task to control its placement.',
  `tab_parent` varchar(255) NOT NULL DEFAULT '' COMMENT 'Only for local tasks (tabs) - the router path of the parent page (which may also be a local task).',
  `tab_root` varchar(255) NOT NULL DEFAULT '' COMMENT 'Router path of the closest non-tab parent page. For pages that are not local tasks, this will be the same as the path.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title for the current page, or the title for the tab if this is a local task.',
  `title_callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'A function which will alter the title. Defaults to t()',
  `title_arguments` varchar(255) NOT NULL DEFAULT '' COMMENT 'A serialized array of arguments for the title callback. If empty, the title will be used as the sole argument for the title callback.',
  `theme_callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'A function which returns the name of the theme that will be used to render this page. If left empty, the default theme will be used.',
  `theme_arguments` varchar(255) NOT NULL DEFAULT '' COMMENT 'A serialized array of arguments for the theme callback.',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT 'Numeric representation of the type of the menu item, like MENU_LOCAL_TASK.',
  `description` text NOT NULL COMMENT 'A description of this item.',
  `position` varchar(255) NOT NULL DEFAULT '' COMMENT 'The position of the block (left or right) on the system administration page for this item.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Weight of the element. Lighter weights are higher up, heavier weights go down.',
  `include_file` mediumtext COMMENT 'The file to include for this element, usually the page callback function lives in this file.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Maps paths to various callbacks (access, page and title)';

-- --------------------------------------------------------

--
-- Table structure for table `node`
--

CREATE TABLE IF NOT EXISTS `node` (
`nid` int(10) unsigned NOT NULL COMMENT 'The primary identifier for a node.',
  `vid` int(10) unsigned DEFAULT NULL COMMENT 'The current node_revision.vid version identifier.',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT 'The node_type.type of this node.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'The languages.language of this node.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title of this node, always treated as non-markup plain text.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid that owns this node; initially, this is the user that created it.',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT 'Boolean indicating whether the node is published (visible to non-administrators).',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was created.',
  `changed` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was most recently saved.',
  `comment` int(11) NOT NULL DEFAULT '0' COMMENT 'Whether comments are allowed on this node: 0 = no, 1 = closed (read only), 2 = open (read/write).',
  `promote` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node should be displayed on the front page.',
  `sticky` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node should be displayed at the top of lists in which it appears.',
  `tnid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The translation set id for this node, which equals the node id of the source post in each set.',
  `translate` int(11) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this translation page needs to be updated.'
) ENGINE=MyISAM AUTO_INCREMENT=446 DEFAULT CHARSET=utf8 COMMENT='The base table for nodes.';

-- --------------------------------------------------------

--
-- Table structure for table `node_access`
--

CREATE TABLE IF NOT EXISTS `node_access` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid this record affects.',
  `gid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The grant ID a user must possess in the specified realm to gain this row’s privileges on the node.',
  `realm` varchar(255) NOT NULL DEFAULT '' COMMENT 'The realm in which the user must possess the grant ID. Each node access node can define one or more realms.',
  `grant_view` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether a user with the realm/grant pair can view this node.',
  `grant_update` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether a user with the realm/grant pair can edit this node.',
  `grant_delete` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether a user with the realm/grant pair can delete this node.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Identifies which realm/grant pairs a user must possess in...';

-- --------------------------------------------------------

--
-- Table structure for table `node_comment_statistics`
--

CREATE TABLE IF NOT EXISTS `node_comment_statistics` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid for which the statistics are compiled.',
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT 'The comment.cid of the last comment.',
  `last_comment_timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp of the last comment that was posted within this node, from comment.changed.',
  `last_comment_name` varchar(60) DEFAULT NULL COMMENT 'The name of the latest author to post a comment on this node, from comment.name.',
  `last_comment_uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The user ID of the latest author to post a comment on this node, from comment.uid.',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The total number of comments on this node.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Maintains statistics of node and comments posts to show ...';

-- --------------------------------------------------------

--
-- Table structure for table `node_revision`
--

CREATE TABLE IF NOT EXISTS `node_revision` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node this version belongs to.',
`vid` int(10) unsigned NOT NULL COMMENT 'The primary identifier for this version.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid that created this version.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title of this version.',
  `log` longtext NOT NULL COMMENT 'The log entry explaining the changes in this version.',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when this version was created.',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT 'Boolean indicating whether the node (at the time of this revision) is published (visible to non-administrators).',
  `comment` int(11) NOT NULL DEFAULT '0' COMMENT 'Whether comments are allowed on this node (at the time of this revision): 0 = no, 1 = closed (read only), 2 = open (read/write).',
  `promote` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node (at the time of this revision) should be displayed on the front page.',
  `sticky` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node (at the time of this revision) should be displayed at the top of lists in which it appears.'
) ENGINE=MyISAM AUTO_INCREMENT=459 DEFAULT CHARSET=utf8 COMMENT='Stores information about each saved version of a node.';

-- --------------------------------------------------------

--
-- Table structure for table `node_type`
--

CREATE TABLE IF NOT EXISTS `node_type` (
  `type` varchar(32) NOT NULL COMMENT 'The machine-readable name of this type.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The human-readable name of this type.',
  `base` varchar(255) NOT NULL COMMENT 'The base string used to construct callbacks corresponding to this node type.',
  `module` varchar(255) NOT NULL COMMENT 'The module defining this node type.',
  `description` mediumtext NOT NULL COMMENT 'A brief description of this type.',
  `help` mediumtext NOT NULL COMMENT 'Help information shown to the user when creating a node of this type.',
  `has_title` tinyint(3) unsigned NOT NULL COMMENT 'Boolean indicating whether this type uses the node.title field.',
  `title_label` varchar(255) NOT NULL DEFAULT '' COMMENT 'The label displayed for the title field on the edit form.',
  `custom` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this type is defined by a module (FALSE) or by a user via Add content type (TRUE).',
  `modified` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this type has been modified by an administrator; currently not used in any way.',
  `locked` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether the administrator can change the machine name of this type.',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether the node type is disabled.',
  `orig_type` varchar(255) NOT NULL DEFAULT '' COMMENT 'The original machine-readable name of this node type. This may be different from the current type name if the locked field is 0.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores information about all defined node types.';

-- --------------------------------------------------------

--
-- Table structure for table `page_manager_handlers`
--

CREATE TABLE IF NOT EXISTS `page_manager_handlers` (
`did` int(11) NOT NULL COMMENT 'Primary ID field for the table. Not used for anything except internal lookups.',
  `name` varchar(255) DEFAULT NULL COMMENT 'Unique ID for this task handler. Used to identify it programmatically.',
  `task` varchar(64) DEFAULT NULL COMMENT 'ID of the task this handler is for.',
  `subtask` varchar(64) NOT NULL DEFAULT '' COMMENT 'ID of the subtask this handler is for.',
  `handler` varchar(64) DEFAULT NULL COMMENT 'ID of the task handler being used.',
  `weight` int(11) DEFAULT NULL COMMENT 'The order in which this handler appears. Lower numbers go first.',
  `conf` longtext NOT NULL COMMENT 'Serialized configuration of the handler, if needed.'
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `page_manager_pages`
--

CREATE TABLE IF NOT EXISTS `page_manager_pages` (
`pid` int(11) NOT NULL COMMENT 'Primary ID field for the table. Not used for anything except internal lookups.',
  `name` varchar(255) DEFAULT NULL COMMENT 'Unique ID for this subtask. Used to identify it programmatically.',
  `task` varchar(64) DEFAULT 'page' COMMENT 'What type of page this is, so that we can use the same mechanism for creating tighter UIs for targeted pages.',
  `admin_title` varchar(255) DEFAULT NULL COMMENT 'Human readable title for this page subtask.',
  `admin_description` longtext COMMENT 'Administrative description of this item.',
  `path` varchar(255) DEFAULT NULL COMMENT 'The menu path that will invoke this task.',
  `access` longtext NOT NULL COMMENT 'Access configuration for this path.',
  `menu` longtext NOT NULL COMMENT 'Serialized configuration of Drupal menu visibility settings for this item.',
  `arguments` longtext NOT NULL COMMENT 'Configuration of arguments for this menu item.',
  `conf` longtext NOT NULL COMMENT 'Serialized configuration of the page, if needed.'
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Contains page subtasks for implementing pages with...';

-- --------------------------------------------------------

--
-- Table structure for table `page_manager_weights`
--

CREATE TABLE IF NOT EXISTS `page_manager_weights` (
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Unique ID for this task handler. Used to identify it programmatically.',
  `weight` int(11) DEFAULT NULL COMMENT 'The order in which this handler appears. Lower numbers go first.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains override weights for page_manager handlers that...';

-- --------------------------------------------------------

--
-- Table structure for table `panels_display`
--

CREATE TABLE IF NOT EXISTS `panels_display` (
`did` int(11) NOT NULL,
  `layout` varchar(255) DEFAULT '',
  `layout_settings` longtext,
  `panel_settings` longtext,
  `cache` text,
  `title` varchar(255) DEFAULT '',
  `hide_title` tinyint(4) DEFAULT '0',
  `title_pane` int(11) DEFAULT '0',
  `uuid` char(36) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `panels_layout`
--

CREATE TABLE IF NOT EXISTS `panels_layout` (
`lid` int(11) NOT NULL COMMENT 'A database primary key to ensure uniqueness.',
  `name` varchar(255) DEFAULT NULL COMMENT 'Unique ID for this content. Used to identify it programmatically.',
  `admin_title` varchar(255) DEFAULT NULL COMMENT 'Administrative title for this layout.',
  `admin_description` longtext COMMENT 'Administrative description for this layout.',
  `category` varchar(255) DEFAULT NULL COMMENT 'Administrative category for this layout.',
  `plugin` varchar(255) DEFAULT NULL COMMENT 'The layout plugin that owns this layout.',
  `settings` longtext COMMENT 'Serialized settings for the actual layout. The contents of this field are up to the plugin that uses it.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains exportable customized layouts for this site.';

-- --------------------------------------------------------

--
-- Table structure for table `panels_mini`
--

CREATE TABLE IF NOT EXISTS `panels_mini` (
`pid` int(11) NOT NULL COMMENT 'The primary key for uniqueness.',
  `name` varchar(255) DEFAULT NULL COMMENT 'The unique name of the mini panel.',
  `category` varchar(64) DEFAULT NULL COMMENT 'The category this mini panel appears in on the add content pane.',
  `did` int(11) DEFAULT NULL COMMENT 'The display ID of the panel.',
  `admin_title` varchar(128) DEFAULT NULL COMMENT 'The administrative title of the mini panel.',
  `admin_description` longtext COMMENT 'Administrative title of this mini panel.',
  `requiredcontexts` longtext COMMENT 'An array of required contexts.',
  `contexts` longtext COMMENT 'An array of contexts embedded into the panel.',
  `relationships` longtext COMMENT 'An array of relationships embedded into the panel.'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `panels_node`
--

CREATE TABLE IF NOT EXISTS `panels_node` (
  `nid` int(11) NOT NULL DEFAULT '0',
  `css_id` varchar(255) DEFAULT NULL,
  `did` int(11) NOT NULL,
  `pipeline` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `panels_pane`
--

CREATE TABLE IF NOT EXISTS `panels_pane` (
`pid` int(11) NOT NULL,
  `did` int(11) NOT NULL DEFAULT '0',
  `panel` varchar(32) DEFAULT '',
  `type` varchar(32) DEFAULT '',
  `subtype` varchar(64) DEFAULT '',
  `shown` tinyint(4) DEFAULT '1',
  `access` longtext,
  `configuration` longtext,
  `cache` longtext,
  `style` longtext,
  `css` longtext,
  `extras` longtext,
  `position` smallint(6) DEFAULT '0',
  `locks` longtext,
  `uuid` char(36) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `panels_renderer_pipeline`
--

CREATE TABLE IF NOT EXISTS `panels_renderer_pipeline` (
`rpid` int(11) NOT NULL COMMENT 'A database primary key to ensure uniqueness.',
  `name` varchar(255) DEFAULT NULL COMMENT 'Unique ID for this content. Used to identify it programmatically.',
  `admin_title` varchar(255) DEFAULT NULL COMMENT 'Administrative title for this pipeline.',
  `admin_description` longtext COMMENT 'Administrative description for this pipeline.',
  `weight` smallint(6) DEFAULT '0',
  `settings` longtext COMMENT 'Serialized settings for the actual pipeline. The contents of this field are up to the plugin that uses it.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains renderer pipelines for Panels. Each pipeline...';

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
`pid` int(11) NOT NULL COMMENT 'Primary Key: Unique profile item ID.',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT 'The profile_type.type of this profile.',
  `uid` int(10) unsigned DEFAULT NULL COMMENT 'The users.uid of the associated user.',
  `label` varchar(255) NOT NULL DEFAULT '' COMMENT 'A human-readable label for this profile.',
  `created` int(11) DEFAULT NULL COMMENT 'The Unix timestamp when the profile was created.',
  `changed` int(11) DEFAULT NULL COMMENT 'The Unix timestamp when the profile was most recently saved.'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Stores profile items.';

-- --------------------------------------------------------

--
-- Table structure for table `profile_type`
--

CREATE TABLE IF NOT EXISTS `profile_type` (
`id` int(11) NOT NULL COMMENT 'Primary Key: Unique profile type ID.',
  `type` varchar(32) NOT NULL COMMENT 'The machine-readable name of this profile type.',
  `label` varchar(255) NOT NULL DEFAULT '' COMMENT 'The human-readable name of this profile type.',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The weight of this profile type in relation to others.',
  `data` longtext COMMENT 'A serialized array of additional data related to this profile type.',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'The exportable status of the entity.',
  `module` varchar(255) DEFAULT NULL COMMENT 'The name of the providing module if the entity has been defined in code.'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Stores information about all defined profile types.';

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE IF NOT EXISTS `queue` (
`item_id` int(10) unsigned NOT NULL COMMENT 'Primary Key: Unique item ID.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The queue name.',
  `data` longblob COMMENT 'The arbitrary data for the item.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp when the claim lease expires on the item.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp when the item was created.'
) ENGINE=MyISAM AUTO_INCREMENT=892 DEFAULT CHARSET=utf8 COMMENT='Stores items in queues.';

-- --------------------------------------------------------

--
-- Table structure for table `quicktabs`
--

CREATE TABLE IF NOT EXISTS `quicktabs` (
  `machine_name` varchar(255) NOT NULL COMMENT 'The primary identifier for a qt block.',
  `ajax` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Whether this is an ajax views block.',
  `hide_empty_tabs` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Whether this tabset hides empty tabs.',
  `default_tab` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Default tab.',
  `title` varchar(255) NOT NULL COMMENT 'The title of this quicktabs block.',
  `tabs` mediumtext NOT NULL COMMENT 'A serialized array of the contents of this qt block.',
  `renderer` varchar(255) NOT NULL COMMENT 'The rendering mechanism.',
  `style` varchar(255) NOT NULL COMMENT 'The tab style.',
  `options` mediumtext COMMENT 'A serialized array of the options for this qt instance.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='The quicktabs table.';

-- --------------------------------------------------------

--
-- Table structure for table `rdf_mapping`
--

CREATE TABLE IF NOT EXISTS `rdf_mapping` (
  `type` varchar(128) NOT NULL COMMENT 'The name of the entity type a mapping applies to (node, user, comment, etc.).',
  `bundle` varchar(128) NOT NULL COMMENT 'The name of the bundle a mapping applies to.',
  `mapping` longblob COMMENT 'The serialized mapping of the bundle type and fields to RDF terms.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores custom RDF mappings for user defined content types...';

-- --------------------------------------------------------

--
-- Table structure for table `registry`
--

CREATE TABLE IF NOT EXISTS `registry` (
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the function, class, or interface.',
  `type` varchar(9) NOT NULL DEFAULT '' COMMENT 'Either function or class or interface.',
  `filename` varchar(255) NOT NULL COMMENT 'Name of the file.',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of the module the file belongs to.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The order in which this module’s hooks should be invoked relative to other modules. Equal-weighted modules are ordered by name.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Each record is a function, class, or interface name and...';

-- --------------------------------------------------------

--
-- Table structure for table `registry_file`
--

CREATE TABLE IF NOT EXISTS `registry_file` (
  `filename` varchar(255) NOT NULL COMMENT 'Path to the file.',
  `hash` varchar(64) NOT NULL COMMENT 'sha-256 hash of the file’s contents when last parsed.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Files parsed to build the registry.';

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
`rid` int(10) unsigned NOT NULL COMMENT 'Primary Key: Unique role ID.',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT 'Unique role name.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of this role in listings and the user interface.'
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Stores user roles.';

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE IF NOT EXISTS `role_permission` (
  `rid` int(10) unsigned NOT NULL COMMENT 'Foreign Key: role.rid.',
  `permission` varchar(128) NOT NULL DEFAULT '' COMMENT 'A single permission granted to the role identified by rid.',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT 'The module declaring the permission.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores the permissions assigned to user roles.';

-- --------------------------------------------------------

--
-- Table structure for table `search_dataset`
--

CREATE TABLE IF NOT EXISTS `search_dataset` (
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Search item ID, e.g. node ID for nodes.',
  `type` varchar(16) NOT NULL COMMENT 'Type of item, e.g. node.',
  `data` longtext NOT NULL COMMENT 'List of space-separated words from the item.',
  `reindex` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Set to force node reindexing.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores items that will be searched.';

-- --------------------------------------------------------

--
-- Table structure for table `search_index`
--

CREATE TABLE IF NOT EXISTS `search_index` (
  `word` varchar(50) NOT NULL DEFAULT '' COMMENT 'The search_total.word that is associated with the search item.',
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The search_dataset.sid of the searchable item to which the word belongs.',
  `type` varchar(16) NOT NULL COMMENT 'The search_dataset.type of the searchable item to which the word belongs.',
  `score` float DEFAULT NULL COMMENT 'The numeric score of the word, higher being more important.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores the search index, associating words, items and...';

-- --------------------------------------------------------

--
-- Table structure for table `search_node_links`
--

CREATE TABLE IF NOT EXISTS `search_node_links` (
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The search_dataset.sid of the searchable item containing the link to the node.',
  `type` varchar(16) NOT NULL DEFAULT '' COMMENT 'The search_dataset.type of the searchable item containing the link to the node.',
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid that this item links to.',
  `caption` longtext COMMENT 'The text used to link to the node.nid.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores items (like nodes) that link to other nodes, used...';

-- --------------------------------------------------------

--
-- Table structure for table `search_total`
--

CREATE TABLE IF NOT EXISTS `search_total` (
  `word` varchar(50) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique word in the search index.',
  `count` float DEFAULT NULL COMMENT 'The count of the word in the index using Zipf’s law to equalize the probability distribution.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores search totals for words.';

-- --------------------------------------------------------

--
-- Table structure for table `semaphore`
--

CREATE TABLE IF NOT EXISTS `semaphore` (
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique name.',
  `value` varchar(255) NOT NULL DEFAULT '' COMMENT 'A value for the semaphore.',
  `expire` double NOT NULL COMMENT 'A Unix timestamp with microseconds indicating when the semaphore should expire.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Table for holding semaphores, locks, flags, etc. that...';

-- --------------------------------------------------------

--
-- Table structure for table `sequences`
--

CREATE TABLE IF NOT EXISTS `sequences` (
`value` int(10) unsigned NOT NULL COMMENT 'The value of the sequence.'
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='Stores IDs.';

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `uid` int(10) unsigned NOT NULL COMMENT 'The users.uid corresponding to a session, or 0 for anonymous user.',
  `sid` varchar(128) NOT NULL COMMENT 'A session ID. The value is generated by Drupal’s session handlers.',
  `ssid` varchar(128) NOT NULL DEFAULT '' COMMENT 'Secure session ID. The value is generated by Drupal’s session handlers.',
  `hostname` varchar(128) NOT NULL DEFAULT '' COMMENT 'The IP address that last used this session ID (sid).',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when this session last requested a page. Old records are purged by PHP automatically.',
  `cache` int(11) NOT NULL DEFAULT '0' COMMENT 'The time of this user’s last post. This is used when the site has specified a minimum_cache_lifetime. See cache_get().',
  `session` longblob COMMENT 'The serialized contents of $_SESSION, an array of name/value pairs that persists across page requests by this session ID. Drupal loads $_SESSION from here at the start of each request and saves it at the end.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Drupal’s session handlers read and write into the...';

-- --------------------------------------------------------

--
-- Table structure for table `shortcut_set`
--

CREATE TABLE IF NOT EXISTS `shortcut_set` (
  `set_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'Primary Key: The menu_links.menu_name under which the set’s links are stored.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title of the set.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores information about sets of shortcuts links.';

-- --------------------------------------------------------

--
-- Table structure for table `shortcut_set_users`
--

CREATE TABLE IF NOT EXISTS `shortcut_set_users` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The users.uid for this set.',
  `set_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'The shortcut_set.set_name that will be displayed for this user.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Maps users to shortcut sets.';

-- --------------------------------------------------------

--
-- Table structure for table `stylizer`
--

CREATE TABLE IF NOT EXISTS `stylizer` (
`sid` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT 'Unique ID for this style. Used to identify it programmatically.',
  `admin_title` varchar(255) DEFAULT NULL COMMENT 'Human readable title for this style.',
  `admin_description` longtext COMMENT 'Administrative description of this style.',
  `settings` longtext COMMENT 'A serialized array of settings specific to the style base that describes this plugin.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Customized stylizer styles created by administrative users.';

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

CREATE TABLE IF NOT EXISTS `system` (
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT 'The path of the primary file for this item, relative to the Drupal root; e.g. modules/node/node.module.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the item; e.g. node.',
  `type` varchar(12) NOT NULL DEFAULT '' COMMENT 'The type of the item, either module, theme, or theme_engine.',
  `owner` varchar(255) NOT NULL DEFAULT '' COMMENT 'A theme’s ’parent’ . Can be either a theme or an engine.',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether or not this item is enabled.',
  `bootstrap` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether this module is loaded during Drupal’s early bootstrapping phase (e.g. even before the page cache is consulted).',
  `schema_version` smallint(6) NOT NULL DEFAULT '-1' COMMENT 'The module’s database schema version number. -1 if the module is not installed (its tables do not exist); 0 or the largest N of the module’s hook_update_N() function that has either been run or existed when the module was first installed.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The order in which this module’s hooks should be invoked relative to other modules. Equal-weighted modules are ordered by name.',
  `info` blob COMMENT 'A serialized array containing information from the module’s .info file; keys can include name, description, package, version, core, dependencies, and php.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='A list of all modules, themes, and theme engines that are...';

-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_index`
--

CREATE TABLE IF NOT EXISTS `taxonomy_index` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid this record tracks.',
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The term ID.',
  `sticky` tinyint(4) DEFAULT '0' COMMENT 'Boolean indicating whether the node is sticky.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was created.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Maintains denormalized information about node/term...';

-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_menu`
--

CREATE TABLE IF NOT EXISTS `taxonomy_menu` (
  `mlid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The taxonomy terms menu_link.mlid.',
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Tid that is linked to the mlid.',
  `vid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Vid for the tid.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Links a taxonomy term to a menu item.';

-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_term_data`
--

CREATE TABLE IF NOT EXISTS `taxonomy_term_data` (
`tid` int(10) unsigned NOT NULL COMMENT 'Primary Key: Unique term ID.',
  `vid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The taxonomy_vocabulary.vid of the vocabulary to which the term is assigned.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The term name.',
  `description` longtext COMMENT 'A description of the term.',
  `format` varchar(255) DEFAULT NULL COMMENT 'The filter_format.format of the description.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of this term in relation to other terms.',
  `language` varchar(12) NOT NULL DEFAULT 'und',
  `i18n_tsid` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2318 DEFAULT CHARSET=utf8 COMMENT='Stores term information.';

-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_term_hierarchy`
--

CREATE TABLE IF NOT EXISTS `taxonomy_term_hierarchy` (
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Primary Key: The taxonomy_term_data.tid of the term.',
  `parent` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Primary Key: The taxonomy_term_data.tid of the term’s parent. 0 indicates no parent.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores the hierarchical relationship between terms.';

-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_vocabulary`
--

CREATE TABLE IF NOT EXISTS `taxonomy_vocabulary` (
`vid` int(10) unsigned NOT NULL COMMENT 'Primary Key: Unique vocabulary ID.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of the vocabulary.',
  `machine_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The vocabulary machine name.',
  `description` longtext COMMENT 'Description of the vocabulary.',
  `hierarchy` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'The type of hierarchy allowed within the vocabulary. (0 = disabled, 1 = single, 2 = multiple)',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT 'The module which created the vocabulary.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of this vocabulary in relation to other vocabularies.',
  `language` varchar(12) NOT NULL DEFAULT 'und',
  `i18n_mode` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='Stores vocabulary information.';

-- --------------------------------------------------------

--
-- Table structure for table `trigger_assignments`
--

CREATE TABLE IF NOT EXISTS `trigger_assignments` (
  `hook` varchar(78) NOT NULL DEFAULT '' COMMENT 'Primary Key: The name of the internal Drupal hook; for example, node_insert.',
  `aid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Action’s actions.aid.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of the trigger assignment in relation to other triggers.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Maps trigger to hook and operation assignments from...';

-- --------------------------------------------------------

--
-- Table structure for table `url_alias`
--

CREATE TABLE IF NOT EXISTS `url_alias` (
`pid` int(10) unsigned NOT NULL COMMENT 'A unique path alias identifier.',
  `source` varchar(255) NOT NULL DEFAULT '' COMMENT 'The Drupal path this alias is for; e.g. node/12.',
  `alias` varchar(255) NOT NULL DEFAULT '' COMMENT 'The alias for this path; e.g. title-of-the-story.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'The language this alias is for; if ’und’, the alias will be used for unknown languages. Each Drupal path can have an alias for each supported language.'
) ENGINE=MyISAM AUTO_INCREMENT=2766 DEFAULT CHARSET=utf8 COMMENT='A list of URL aliases for Drupal paths; a user may visit...';

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Primary Key: Unique user ID.',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT 'Unique user name.',
  `pass` varchar(128) NOT NULL DEFAULT '' COMMENT 'User’s password (hashed).',
  `mail` varchar(254) DEFAULT '' COMMENT 'User’s e-mail address.',
  `theme` varchar(255) NOT NULL DEFAULT '' COMMENT 'User’s default theme.',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT 'User’s signature.',
  `signature_format` varchar(255) DEFAULT NULL COMMENT 'The filter_format.format of the signature.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp for when user was created.',
  `access` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp for previous time user accessed the site.',
  `login` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp for user’s last login.',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Whether the user is active(1) or blocked(0).',
  `timezone` varchar(32) DEFAULT NULL COMMENT 'User’s time zone.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'User’s default language.',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT 'Foreign key: file_managed.fid of user’s picture.',
  `init` varchar(254) DEFAULT '' COMMENT 'E-mail address used for initial account creation.',
  `data` longblob COMMENT 'A serialized array of name value pairs that are related to the user. Any form values posted during user edit are stored and are loaded into the $user object during user_load(). Use of this field is discouraged and it will likely disappear in a future...'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores user data.';

-- --------------------------------------------------------

--
-- Table structure for table `users_roles`
--

CREATE TABLE IF NOT EXISTS `users_roles` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Primary Key: users.uid for user.',
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Primary Key: role.rid for role.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Maps users to roles.';

-- --------------------------------------------------------

--
-- Table structure for table `validate_fields`
--

CREATE TABLE IF NOT EXISTS `validate_fields` (
`id` int(10) unsigned NOT NULL COMMENT 'Unique identifier for the Validate-Fields.',
  `validation_type` varchar(128) DEFAULT NULL COMMENT 'Validation Type key.',
  `fields_name` varchar(128) DEFAULT NULL COMMENT 'Fields Name.',
  `content_type` varchar(128) DEFAULT NULL COMMENT 'Content Type Name.'
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Stores Validation Fields.';

-- --------------------------------------------------------

--
-- Table structure for table `variable`
--

CREATE TABLE IF NOT EXISTS `variable` (
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT 'The name of the variable.',
  `value` longblob NOT NULL COMMENT 'The value of the variable.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Named variable/value pairs created by Drupal core or any...';

-- --------------------------------------------------------

--
-- Table structure for table `vef_video_styles`
--

CREATE TABLE IF NOT EXISTS `vef_video_styles` (
  `name` varchar(255) NOT NULL COMMENT 'The machine-readable option set name.',
  `title` varchar(255) NOT NULL COMMENT 'The human-readable title for this option set.',
  `data` longblob NOT NULL COMMENT 'The configuration data for the style.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores video embed styles.';

-- --------------------------------------------------------

--
-- Table structure for table `views_display`
--

CREATE TABLE IF NOT EXISTS `views_display` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The view this display is attached to.',
  `id` varchar(64) NOT NULL DEFAULT '' COMMENT 'An identifier for this display; usually generated from the display_plugin, so should be something like page or page_1 or block_2, etc.',
  `display_title` varchar(64) NOT NULL DEFAULT '' COMMENT 'The title of the display, viewable by the administrator.',
  `display_plugin` varchar(64) NOT NULL DEFAULT '' COMMENT 'The type of the display. Usually page, block or embed, but is pluggable so may be other things.',
  `position` int(11) DEFAULT '0' COMMENT 'The order in which this display is loaded.',
  `display_options` longtext COMMENT 'A serialized array of options for this display; it contains options that are generally only pertinent to that display plugin type.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores information about each display attached to a view.';

-- --------------------------------------------------------

--
-- Table structure for table `views_view`
--

CREATE TABLE IF NOT EXISTS `views_view` (
`vid` int(10) unsigned NOT NULL COMMENT 'The view ID of the field, defined by the database.',
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT 'The unique name of the view. This is the primary field views are loaded from, and is used so that views may be internal and not necessarily in the database. May only be alphanumeric characters plus underscores.',
  `description` varchar(255) DEFAULT '' COMMENT 'A description of the view for the admin interface.',
  `tag` varchar(255) DEFAULT '' COMMENT 'A tag used to group/sort views in the admin interface',
  `base_table` varchar(64) NOT NULL DEFAULT '' COMMENT 'What table this view is based on, such as node, user, comment, or term.',
  `human_name` varchar(255) DEFAULT '' COMMENT 'A human readable name used to be displayed in the admin interface',
  `core` int(11) DEFAULT '0' COMMENT 'Stores the drupal core version of the view.'
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='Stores the general data for a view.';

-- --------------------------------------------------------

--
-- Table structure for table `watchdog`
--

CREATE TABLE IF NOT EXISTS `watchdog` (
`wid` int(11) NOT NULL COMMENT 'Primary Key: Unique watchdog event ID.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid of the user who triggered the event.',
  `type` varchar(64) NOT NULL DEFAULT '' COMMENT 'Type of log message, for example "user" or "page not found."',
  `message` longtext NOT NULL COMMENT 'Text of log message to be passed into the t() function.',
  `variables` longblob NOT NULL COMMENT 'Serialized array of variables that match the message string and that is passed into the t() function.',
  `severity` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'The severity level of the event; ranges from 0 (Emergency) to 7 (Debug)',
  `link` varchar(255) DEFAULT '' COMMENT 'Link to view the result of the event.',
  `location` text NOT NULL COMMENT 'URL of the origin of the event.',
  `referer` text COMMENT 'URL of referring page.',
  `hostname` varchar(128) NOT NULL DEFAULT '' COMMENT 'Hostname of the user who triggered the event.',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'Unix timestamp of when event occurred.'
) ENGINE=MyISAM AUTO_INCREMENT=198746 DEFAULT CHARSET=utf8 COMMENT='Table that contains logs of all system events.';

-- --------------------------------------------------------

--
-- Table structure for table `webform`
--

CREATE TABLE IF NOT EXISTS `webform` (
  `nid` int(10) unsigned NOT NULL COMMENT 'The node identifier of a webform.',
  `confirmation` text NOT NULL COMMENT 'The confirmation message or URL displayed to the user after submitting a form.',
  `confirmation_format` varchar(255) DEFAULT NULL COMMENT 'The filter_format.format of the confirmation message.',
  `redirect_url` varchar(255) DEFAULT '<confirmation>' COMMENT 'The URL a user is redirected to after submitting a form.',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Boolean value of a webform for open (1) or closed (0).',
  `block` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Boolean value for whether this form be available as a block.',
  `teaser` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Boolean value for whether the entire form should be displayed on the teaser.',
  `allow_draft` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Boolean value for whether submissions to this form be saved as a draft.',
  `auto_save` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Boolean value for whether submissions to this form should be auto-saved between pages.',
  `submit_notice` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Boolean value for whether to show or hide the previous submissions notification.',
  `submit_text` varchar(255) DEFAULT NULL COMMENT 'The title of the submit button on the form.',
  `submit_limit` tinyint(4) NOT NULL DEFAULT '-1' COMMENT 'The number of submissions a single user is allowed to submit within an interval. -1 is unlimited.',
  `submit_interval` int(11) NOT NULL DEFAULT '-1' COMMENT 'The amount of time in seconds that must pass before a user can submit another submission within the set limit.',
  `total_submit_limit` int(11) NOT NULL DEFAULT '-1' COMMENT 'The total number of submissions allowed within an interval. -1 is unlimited.',
  `total_submit_interval` int(11) NOT NULL DEFAULT '-1' COMMENT 'The amount of time in seconds that must pass before another submission can be submitted within the set limit.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Table for storing additional properties for webform nodes.';

-- --------------------------------------------------------

--
-- Table structure for table `webform_component`
--

CREATE TABLE IF NOT EXISTS `webform_component` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node identifier of a webform.',
  `cid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'The identifier for this component within this node, starts at 0 for each node.',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'If this component has a parent fieldset, the cid of that component.',
  `form_key` varchar(128) DEFAULT NULL COMMENT 'When the form is displayed and processed, this key can be used to reference the results.',
  `name` varchar(255) DEFAULT NULL COMMENT 'The label for this component.',
  `type` varchar(16) DEFAULT NULL COMMENT 'The field type of this component (textfield, select, hidden, etc.).',
  `value` text NOT NULL COMMENT 'The default value of the component when displayed to the end-user.',
  `extra` text NOT NULL COMMENT 'Additional information unique to the display or processing of this component.',
  `mandatory` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Boolean flag for if this component is required.',
  `weight` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Determines the position of this component in the form.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores information about components for webform nodes.';

-- --------------------------------------------------------

--
-- Table structure for table `webform_emails`
--

CREATE TABLE IF NOT EXISTS `webform_emails` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node identifier of a webform.',
  `eid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'The e-mail identifier for this row’s settings.',
  `email` text COMMENT 'The e-mail address that will be sent to upon submission. This may be an e-mail address, the special key "default" or a numeric value. If a numeric value is used, the value of a component will be substituted on submission.',
  `subject` varchar(255) DEFAULT NULL COMMENT 'The e-mail subject that will be used. This may be a string, the special key "default" or a numeric value. If a numeric value is used, the value of a component will be substituted on submission.',
  `from_name` varchar(255) DEFAULT NULL COMMENT 'The e-mail "from" name that will be used. This may be a string, the special key "default" or a numeric value. If a numeric value is used, the value of a component will be substituted on submission.',
  `from_address` varchar(255) DEFAULT NULL COMMENT 'The e-mail "from" e-mail address that will be used. This may be a string, the special key "default" or a numeric value. If a numeric value is used, the value of a component will be substituted on submission.',
  `template` text COMMENT 'A template that will be used for the sent e-mail. This may be a string or the special key "default", which will use the template provided by the theming layer.',
  `excluded_components` text NOT NULL COMMENT 'A list of components that will not be included in the %email_values token. A list of CIDs separated by commas.',
  `html` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Determines if the e-mail will be sent in an HTML format. Requires Mime Mail module.',
  `attachments` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Determines if the e-mail will include file attachments. Requires Mime Mail module.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds information regarding e-mails that should be sent...';

-- --------------------------------------------------------

--
-- Table structure for table `webform_last_download`
--

CREATE TABLE IF NOT EXISTS `webform_last_download` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node identifier of a webform.',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The user identifier.',
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The last downloaded submission number.',
  `requested` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Timestamp of last download request.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores last submission number per user download.';

-- --------------------------------------------------------

--
-- Table structure for table `webform_roles`
--

CREATE TABLE IF NOT EXISTS `webform_roles` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node identifier of a webform.',
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The role identifier.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Holds access information regarding which roles are...';

-- --------------------------------------------------------

--
-- Table structure for table `webform_submissions`
--

CREATE TABLE IF NOT EXISTS `webform_submissions` (
`sid` int(10) unsigned NOT NULL COMMENT 'The unique identifier for this submission.',
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node identifier of a webform.',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The id of the user that completed this submission.',
  `is_draft` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Is this a draft of the submission?',
  `submitted` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp of when the form was submitted.',
  `remote_addr` varchar(128) DEFAULT NULL COMMENT 'The IP address of the user that submitted the form.'
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='Holds general information about submissions outside of...';

-- --------------------------------------------------------

--
-- Table structure for table `webform_submitted_data`
--

CREATE TABLE IF NOT EXISTS `webform_submitted_data` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node identifier of a webform.',
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The unique identifier for this submission.',
  `cid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'The identifier for this component within this node, starts at 0 for each node.',
  `no` varchar(128) NOT NULL DEFAULT '0' COMMENT 'Usually this value is 0, but if a field has multiple values (such as a time or date), it may require multiple rows in the database.',
  `data` mediumtext NOT NULL COMMENT 'The submitted value of this field, may be serialized for some components.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores all submitted field data for webform submissions.';

-- --------------------------------------------------------

--
-- Table structure for table `workbench_moderation_node_history`
--

CREATE TABLE IF NOT EXISTS `workbench_moderation_node_history` (
`hid` int(11) NOT NULL COMMENT 'Node history entry key.',
  `vid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Node revision id. Foreign key to node_revision',
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Node id. Foreign key to node',
  `from_state` varchar(255) DEFAULT NULL COMMENT 'The old moderation state of the node',
  `state` varchar(255) DEFAULT NULL COMMENT 'The current moderation state of the node.',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The user id of the moderator who made the change. Foreign key to users.',
  `stamp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The timestamp of the change.',
  `published` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicated the live revision of a node.',
  `is_current` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicated the current revision of a node.'
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `workbench_moderation_states`
--

CREATE TABLE IF NOT EXISTS `workbench_moderation_states` (
  `name` varchar(255) NOT NULL COMMENT 'The machine name of the moderation state.',
  `label` varchar(255) DEFAULT NULL COMMENT 'A label for the moderation state.',
  `description` varchar(255) DEFAULT NULL COMMENT 'A description of the moderation state.',
  `weight` int(11) DEFAULT '0' COMMENT 'Sort weight for the moderation state.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Defines all possible states';

-- --------------------------------------------------------

--
-- Table structure for table `workbench_moderation_transitions`
--

CREATE TABLE IF NOT EXISTS `workbench_moderation_transitions` (
`id` int(10) unsigned NOT NULL COMMENT 'Primary Key: Unique workbench_moderation transition identifier.',
  `name` varchar(255) DEFAULT NULL COMMENT 'The machine-readable name of this workbench_moderation transition.',
  `from_name` varchar(255) DEFAULT NULL COMMENT 'The starting moderation state.',
  `to_name` varchar(255) DEFAULT NULL COMMENT 'The ending moderation state.'
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Defines the valid transitions for states';

-- --------------------------------------------------------

--
-- Table structure for table `workflows`
--

CREATE TABLE IF NOT EXISTS `workflows` (
`wid` int(11) NOT NULL COMMENT 'The primary identifier for a workflow.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The machine-readable name of this workflow.',
  `label` varchar(255) NOT NULL DEFAULT '' COMMENT 'The human-readable name of this workflow.',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'The exportable status of the entity.',
  `module` varchar(255) DEFAULT NULL COMMENT 'The name of the providing module if the entity has been defined in code.',
  `tab_roles` varchar(255) NOT NULL DEFAULT '' COMMENT 'The role IDs that can access the workflow tabs on node pages.',
  `options` longtext COMMENT 'Additional settings for the workflow.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Workflows';

-- --------------------------------------------------------

--
-- Table structure for table `workflow_node`
--

CREATE TABLE IF NOT EXISTS `workflow_node` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid this record is for.',
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The workflow_states.sid that this node is currently in.',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The users.uid who triggered this state.',
  `stamp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The unique stamp for the transition.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_node_history`
--

CREATE TABLE IF NOT EXISTS `workflow_node_history` (
`hid` int(11) NOT NULL COMMENT 'The unique ID for this record.',
  `entity_type` varchar(255) NOT NULL DEFAULT '' COMMENT 'The type of entity this transition belongs to.',
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid this record is for.',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The current version identifier.',
  `field_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'The name of the field the transition relates to.',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The languages.language of the entity.',
  `delta` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The sequence number for this data item, used for multi-value fields',
  `old_sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The workflow_states.sid this transition started as.',
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The workflow_states.sid this transition transitioned to.',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The users.uid who made this transition.',
  `stamp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The unique stamp for this transition.',
  `comment` longtext COMMENT 'The comment explaining this transition.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_scheduled_transition`
--

CREATE TABLE IF NOT EXISTS `workflow_scheduled_transition` (
  `entity_type` varchar(255) NOT NULL DEFAULT '' COMMENT 'The type of entity this transition belongs to.',
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The entity ID of the object this transition belongs to.',
  `field_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'The name of the field the transition relates to.',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The languages.language of the entity.',
  `delta` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The sequence number for this data item, used for multi-value fields',
  `old_sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The workflow_states.sid this state starts at.',
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The workflow_states.sid this state transitions to.',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The user who scheduled this state transition.',
  `scheduled` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The date this transition is scheduled for.',
  `comment` longtext COMMENT 'The comment explaining this transition.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_states`
--

CREATE TABLE IF NOT EXISTS `workflow_states` (
`sid` int(11) NOT NULL COMMENT 'The primary identifier for a workflow state.',
  `wid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The workflows.wid this state is part of.',
  `name` varchar(255) DEFAULT '' COMMENT 'The machine-readable name of this state.',
  `state` varchar(255) NOT NULL DEFAULT '' COMMENT 'The human-readable name of this state.',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The weight (order) of the state.',
  `sysid` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The type of state, usually either WORKFLOW_CREATION or empty.',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Whether the current state is active still.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_transitions`
--

CREATE TABLE IF NOT EXISTS `workflow_transitions` (
`tid` int(11) NOT NULL COMMENT 'The primary identifier for a workflow transition.',
  `name` varchar(32) DEFAULT '' COMMENT 'The machine-readable name of this transition.',
  `label` varchar(128) NOT NULL DEFAULT '' COMMENT 'The human-readable name of this transition.',
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The workflow_states.sid start state.',
  `target_sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The workflow_states.sid target state.',
  `roles` varchar(255) DEFAULT NULL COMMENT 'The role.sid that a user must have to perform transition.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `workflow_type_map`
--

CREATE TABLE IF NOT EXISTS `workflow_type_map` (
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT 'The node_type.type the workflow is used on.',
  `wid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The workflows.wid this record affects.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wysiwyg`
--

CREATE TABLE IF NOT EXISTS `wysiwyg` (
  `format` varchar(255) NOT NULL COMMENT 'The filter_format.format of the text format.',
  `editor` varchar(128) NOT NULL DEFAULT '' COMMENT 'Internal name of the editor attached to the text format.',
  `settings` text COMMENT 'Configuration settings for the editor.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores Wysiwyg profiles.';

-- --------------------------------------------------------

--
-- Table structure for table `wysiwyg_user`
--

CREATE TABLE IF NOT EXISTS `wysiwyg_user` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The users.uid of the user.',
  `format` varchar(255) DEFAULT NULL COMMENT 'The filter_format.format of the text format.',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the format is enabled by default.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores user preferences for wysiwyg profiles.';

-- --------------------------------------------------------

--
-- Table structure for table `xmlsitemap`
--

CREATE TABLE IF NOT EXISTS `xmlsitemap` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Primary key with type; a unique id for the item.',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT 'Primary key with id; the type of item (e.g. node, user, etc.).',
  `subtype` varchar(128) NOT NULL DEFAULT '' COMMENT 'A sub-type identifier for the link (node type, menu name, term VID, etc.).',
  `loc` varchar(255) NOT NULL DEFAULT '' COMMENT 'The URL to the item relative to the Drupal path.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'The languages.language of this link or an empty string if it is language-neutral.',
  `access` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'A boolean that represents if the item is viewable by the anonymous user. This field is useful to store the result of node_access() so we can retain changefreq and priority_override information.',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'An integer that represents if the item is included in the sitemap.',
  `status_override` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean that if TRUE means that the status field has been overridden from its default value.',
  `lastmod` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The UNIX timestamp of last modification of the item.',
  `priority` float DEFAULT NULL COMMENT 'The priority of this URL relative to other URLs on your site. Valid values range from 0.0 to 1.0.',
  `priority_override` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean that if TRUE means that the priority field has been overridden from its default value.',
  `changefreq` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The average time in seconds between changes of this item.',
  `changecount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The number of times this item has been changed. Used to help calculate the next changefreq value.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='The base table for xmlsitemap links.';

-- --------------------------------------------------------

--
-- Table structure for table `xmlsitemap_sitemap`
--

CREATE TABLE IF NOT EXISTS `xmlsitemap_sitemap` (
  `smid` varchar(64) NOT NULL COMMENT 'The sitemap ID (the hashed value of xmlsitemap.context.',
  `context` text NOT NULL COMMENT 'Serialized array with the sitemaps context',
  `updated` int(10) unsigned NOT NULL DEFAULT '0',
  `links` int(10) unsigned NOT NULL DEFAULT '0',
  `chunks` int(10) unsigned NOT NULL DEFAULT '0',
  `max_filesize` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actions`
--
ALTER TABLE `actions`
 ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `authmap`
--
ALTER TABLE `authmap`
 ADD PRIMARY KEY (`aid`), ADD UNIQUE KEY `authname` (`authname`);

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
 ADD PRIMARY KEY (`bid`), ADD KEY `token` (`token`);

--
-- Indexes for table `block`
--
ALTER TABLE `block`
 ADD PRIMARY KEY (`bid`), ADD UNIQUE KEY `tmd` (`theme`,`module`,`delta`), ADD KEY `list` (`theme`,`status`,`region`,`weight`,`module`);

--
-- Indexes for table `blocked_ips`
--
ALTER TABLE `blocked_ips`
 ADD PRIMARY KEY (`iid`), ADD KEY `blocked_ip` (`ip`);

--
-- Indexes for table `block_custom`
--
ALTER TABLE `block_custom`
 ADD PRIMARY KEY (`bid`), ADD UNIQUE KEY `info` (`info`);

--
-- Indexes for table `block_node_type`
--
ALTER TABLE `block_node_type`
 ADD PRIMARY KEY (`module`,`delta`,`type`), ADD KEY `type` (`type`);

--
-- Indexes for table `block_role`
--
ALTER TABLE `block_role`
 ADD PRIMARY KEY (`module`,`delta`,`rid`), ADD KEY `rid` (`rid`);

--
-- Indexes for table `box`
--
ALTER TABLE `box`
 ADD PRIMARY KEY (`delta`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
 ADD PRIMARY KEY (`cid`), ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_admin_menu`
--
ALTER TABLE `cache_admin_menu`
 ADD PRIMARY KEY (`cid`), ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_block`
--
ALTER TABLE `cache_block`
 ADD PRIMARY KEY (`cid`), ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_bootstrap`
--
ALTER TABLE `cache_bootstrap`
 ADD PRIMARY KEY (`cid`), ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_field`
--
ALTER TABLE `cache_field`
 ADD PRIMARY KEY (`cid`), ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_filter`
--
ALTER TABLE `cache_filter`
 ADD PRIMARY KEY (`cid`), ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_form`
--
ALTER TABLE `cache_form`
 ADD PRIMARY KEY (`cid`), ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_image`
--
ALTER TABLE `cache_image`
 ADD PRIMARY KEY (`cid`), ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_libraries`
--
ALTER TABLE `cache_libraries`
 ADD PRIMARY KEY (`cid`), ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_menu`
--
ALTER TABLE `cache_menu`
 ADD PRIMARY KEY (`cid`), ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_page`
--
ALTER TABLE `cache_page`
 ADD PRIMARY KEY (`cid`), ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_panels`
--
ALTER TABLE `cache_panels`
 ADD PRIMARY KEY (`cid`), ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_path`
--
ALTER TABLE `cache_path`
 ADD PRIMARY KEY (`cid`), ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_token`
--
ALTER TABLE `cache_token`
 ADD PRIMARY KEY (`cid`), ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_update`
--
ALTER TABLE `cache_update`
 ADD PRIMARY KEY (`cid`), ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_variable`
--
ALTER TABLE `cache_variable`
 ADD PRIMARY KEY (`cid`), ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_views`
--
ALTER TABLE `cache_views`
 ADD PRIMARY KEY (`cid`), ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_views_data`
--
ALTER TABLE `cache_views_data`
 ADD PRIMARY KEY (`cid`), ADD KEY `expire` (`expire`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
 ADD PRIMARY KEY (`cid`), ADD KEY `comment_status_pid` (`pid`,`status`), ADD KEY `comment_num_new` (`nid`,`status`,`created`,`cid`,`thread`), ADD KEY `comment_uid` (`uid`), ADD KEY `comment_nid_language` (`nid`,`language`), ADD KEY `comment_created` (`created`);

--
-- Indexes for table `conditional_fields`
--
ALTER TABLE `conditional_fields`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
 ADD PRIMARY KEY (`cid`), ADD UNIQUE KEY `category` (`category`), ADD KEY `list` (`weight`,`category`);

--
-- Indexes for table `context`
--
ALTER TABLE `context`
 ADD PRIMARY KEY (`name`);

--
-- Indexes for table `ctools_access_ruleset`
--
ALTER TABLE `ctools_access_ruleset`
 ADD PRIMARY KEY (`rsid`);

--
-- Indexes for table `ctools_css_cache`
--
ALTER TABLE `ctools_css_cache`
 ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `ctools_custom_content`
--
ALTER TABLE `ctools_custom_content`
 ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `ctools_object_cache`
--
ALTER TABLE `ctools_object_cache`
 ADD PRIMARY KEY (`sid`,`obj`,`name`), ADD KEY `updated` (`updated`);

--
-- Indexes for table `date_formats`
--
ALTER TABLE `date_formats`
 ADD PRIMARY KEY (`dfid`), ADD UNIQUE KEY `formats` (`format`,`type`);

--
-- Indexes for table `date_format_locale`
--
ALTER TABLE `date_format_locale`
 ADD PRIMARY KEY (`type`,`language`);

--
-- Indexes for table `date_format_type`
--
ALTER TABLE `date_format_type`
 ADD PRIMARY KEY (`type`), ADD KEY `title` (`title`);

--
-- Indexes for table `delta`
--
ALTER TABLE `delta`
 ADD PRIMARY KEY (`machine_name`);

--
-- Indexes for table `entityform`
--
ALTER TABLE `entityform`
 ADD PRIMARY KEY (`entityform_id`), ADD KEY `type` (`type`), ADD KEY `uid` (`uid`);

--
-- Indexes for table `entityform_type`
--
ALTER TABLE `entityform_type`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `type` (`type`);

--
-- Indexes for table `field_collection_item`
--
ALTER TABLE `field_collection_item`
 ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `field_collection_item_revision`
--
ALTER TABLE `field_collection_item_revision`
 ADD PRIMARY KEY (`revision_id`), ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `field_config`
--
ALTER TABLE `field_config`
 ADD PRIMARY KEY (`id`), ADD KEY `field_name` (`field_name`), ADD KEY `active` (`active`), ADD KEY `storage_active` (`storage_active`), ADD KEY `deleted` (`deleted`), ADD KEY `module` (`module`), ADD KEY `storage_module` (`storage_module`), ADD KEY `type` (`type`), ADD KEY `storage_type` (`storage_type`);

--
-- Indexes for table `field_config_instance`
--
ALTER TABLE `field_config_instance`
 ADD PRIMARY KEY (`id`), ADD KEY `field_name_bundle` (`field_name`,`entity_type`,`bundle`), ADD KEY `deleted` (`deleted`);

--
-- Indexes for table `field_data_body`
--
ALTER TABLE `field_data_body`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `body_format` (`body_format`);

--
-- Indexes for table `field_data_comment_body`
--
ALTER TABLE `field_data_comment_body`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `comment_body_format` (`comment_body_format`);

--
-- Indexes for table `field_data_field_age`
--
ALTER TABLE `field_data_field_age`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`);

--
-- Indexes for table `field_data_field_album`
--
ALTER TABLE `field_data_field_album`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_album_tid` (`field_album_tid`);

--
-- Indexes for table `field_data_field_attached`
--
ALTER TABLE `field_data_field_attached`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_attached_fid` (`field_attached_fid`);

--
-- Indexes for table `field_data_field_banner`
--
ALTER TABLE `field_data_field_banner`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_banner_tid` (`field_banner_tid`);

--
-- Indexes for table `field_data_field_beneficiary`
--
ALTER TABLE `field_data_field_beneficiary`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_beneficiary_tid` (`field_beneficiary_tid`);

--
-- Indexes for table `field_data_field_country`
--
ALTER TABLE `field_data_field_country`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_country_tid` (`field_country_tid`);

--
-- Indexes for table `field_data_field_current_minister`
--
ALTER TABLE `field_data_field_current_minister`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_current_minister_value` (`field_current_minister_value`);

--
-- Indexes for table `field_data_field_date`
--
ALTER TABLE `field_data_field_date`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`);

--
-- Indexes for table `field_data_field_designation`
--
ALTER TABLE `field_data_field_designation`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_designation_tid` (`field_designation_tid`);

--
-- Indexes for table `field_data_field_document_type`
--
ALTER TABLE `field_data_field_document_type`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_document_type_tid` (`field_document_type_tid`);

--
-- Indexes for table `field_data_field_email_feedback`
--
ALTER TABLE `field_data_field_email_feedback`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`);

--
-- Indexes for table `field_data_field_extention`
--
ALTER TABLE `field_data_field_extention`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`);

--
-- Indexes for table `field_data_field_fax`
--
ALTER TABLE `field_data_field_fax`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_fax_format` (`field_fax_format`);

--
-- Indexes for table `field_data_field_form_category`
--
ALTER TABLE `field_data_field_form_category`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_form_category_tid` (`field_form_category_tid`);

--
-- Indexes for table `field_data_field_group_field`
--
ALTER TABLE `field_data_field_group_field`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_group_field_revision_id` (`field_group_field_revision_id`);

--
-- Indexes for table `field_data_field_image`
--
ALTER TABLE `field_data_field_image`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_image_fid` (`field_image_fid`);

--
-- Indexes for table `field_data_field_knowledge_category`
--
ALTER TABLE `field_data_field_knowledge_category`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_knowledge_category_tid` (`field_knowledge_category_tid`);

--
-- Indexes for table `field_data_field_location`
--
ALTER TABLE `field_data_field_location`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_location_format` (`field_location_format`);

--
-- Indexes for table `field_data_field_minister`
--
ALTER TABLE `field_data_field_minister`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_minister_target_id` (`field_minister_target_id`);

--
-- Indexes for table `field_data_field_mobile_number`
--
ALTER TABLE `field_data_field_mobile_number`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`);

--
-- Indexes for table `field_data_field_name`
--
ALTER TABLE `field_data_field_name`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_name_format` (`field_name_format`);

--
-- Indexes for table `field_data_field_number`
--
ALTER TABLE `field_data_field_number`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`);

--
-- Indexes for table `field_data_field_owned_by`
--
ALTER TABLE `field_data_field_owned_by`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_owned_by_format` (`field_owned_by_format`);

--
-- Indexes for table `field_data_field_phone_no`
--
ALTER TABLE `field_data_field_phone_no`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_phone_no_format` (`field_phone_no_format`);

--
-- Indexes for table `field_data_field_pin_code`
--
ALTER TABLE `field_data_field_pin_code`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`);

--
-- Indexes for table `field_data_field_proactive_description`
--
ALTER TABLE `field_data_field_proactive_description`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_proactive_description_format` (`field_proactive_description_format`);

--
-- Indexes for table `field_data_field_proactive_set`
--
ALTER TABLE `field_data_field_proactive_set`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_proactive_set_revision_id` (`field_proactive_set_revision_id`);

--
-- Indexes for table `field_data_field_proactive_title`
--
ALTER TABLE `field_data_field_proactive_title`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_proactive_title_format` (`field_proactive_title_format`);

--
-- Indexes for table `field_data_field_qa_category`
--
ALTER TABLE `field_data_field_qa_category`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_qa_category_tid` (`field_qa_category_tid`);

--
-- Indexes for table `field_data_field_room_no`
--
ALTER TABLE `field_data_field_room_no`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_room_no_format` (`field_room_no_format`);

--
-- Indexes for table `field_data_field_rule_notifications`
--
ALTER TABLE `field_data_field_rule_notifications`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_rule_notifications_tid` (`field_rule_notifications_tid`);

--
-- Indexes for table `field_data_field_start_date`
--
ALTER TABLE `field_data_field_start_date`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`);

--
-- Indexes for table `field_data_field_state_district`
--
ALTER TABLE `field_data_field_state_district`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_state_district_tid` (`field_state_district_tid`);

--
-- Indexes for table `field_data_field_tags`
--
ALTER TABLE `field_data_field_tags`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_tags_tid` (`field_tags_tid`);

--
-- Indexes for table `field_data_field_upload_attachement`
--
ALTER TABLE `field_data_field_upload_attachement`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_upload_attachement_fid` (`field_upload_attachement_fid`);

--
-- Indexes for table `field_data_field_url`
--
ALTER TABLE `field_data_field_url`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`);

--
-- Indexes for table `field_data_field_video`
--
ALTER TABLE `field_data_field_video`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`);

--
-- Indexes for table `field_data_taxonomy_forums`
--
ALTER TABLE `field_data_taxonomy_forums`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `taxonomy_forums_tid` (`taxonomy_forums_tid`);

--
-- Indexes for table `field_revision_body`
--
ALTER TABLE `field_revision_body`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `body_format` (`body_format`);

--
-- Indexes for table `field_revision_comment_body`
--
ALTER TABLE `field_revision_comment_body`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `comment_body_format` (`comment_body_format`);

--
-- Indexes for table `field_revision_field_age`
--
ALTER TABLE `field_revision_field_age`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`);

--
-- Indexes for table `field_revision_field_album`
--
ALTER TABLE `field_revision_field_album`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_album_tid` (`field_album_tid`);

--
-- Indexes for table `field_revision_field_attached`
--
ALTER TABLE `field_revision_field_attached`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_attached_fid` (`field_attached_fid`);

--
-- Indexes for table `field_revision_field_banner`
--
ALTER TABLE `field_revision_field_banner`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_banner_tid` (`field_banner_tid`);

--
-- Indexes for table `field_revision_field_beneficiary`
--
ALTER TABLE `field_revision_field_beneficiary`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_beneficiary_tid` (`field_beneficiary_tid`);

--
-- Indexes for table `field_revision_field_country`
--
ALTER TABLE `field_revision_field_country`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_country_tid` (`field_country_tid`);

--
-- Indexes for table `field_revision_field_current_minister`
--
ALTER TABLE `field_revision_field_current_minister`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_current_minister_value` (`field_current_minister_value`);

--
-- Indexes for table `field_revision_field_date`
--
ALTER TABLE `field_revision_field_date`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`);

--
-- Indexes for table `field_revision_field_designation`
--
ALTER TABLE `field_revision_field_designation`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_designation_tid` (`field_designation_tid`);

--
-- Indexes for table `field_revision_field_document_type`
--
ALTER TABLE `field_revision_field_document_type`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_document_type_tid` (`field_document_type_tid`);

--
-- Indexes for table `field_revision_field_email_feedback`
--
ALTER TABLE `field_revision_field_email_feedback`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`);

--
-- Indexes for table `field_revision_field_extention`
--
ALTER TABLE `field_revision_field_extention`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`);

--
-- Indexes for table `field_revision_field_fax`
--
ALTER TABLE `field_revision_field_fax`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_fax_format` (`field_fax_format`);

--
-- Indexes for table `field_revision_field_form_category`
--
ALTER TABLE `field_revision_field_form_category`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_form_category_tid` (`field_form_category_tid`);

--
-- Indexes for table `field_revision_field_group_field`
--
ALTER TABLE `field_revision_field_group_field`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_group_field_revision_id` (`field_group_field_revision_id`);

--
-- Indexes for table `field_revision_field_image`
--
ALTER TABLE `field_revision_field_image`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_image_fid` (`field_image_fid`);

--
-- Indexes for table `field_revision_field_knowledge_category`
--
ALTER TABLE `field_revision_field_knowledge_category`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_knowledge_category_tid` (`field_knowledge_category_tid`);

--
-- Indexes for table `field_revision_field_location`
--
ALTER TABLE `field_revision_field_location`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_location_format` (`field_location_format`);

--
-- Indexes for table `field_revision_field_minister`
--
ALTER TABLE `field_revision_field_minister`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_minister_target_id` (`field_minister_target_id`);

--
-- Indexes for table `field_revision_field_mobile_number`
--
ALTER TABLE `field_revision_field_mobile_number`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`);

--
-- Indexes for table `field_revision_field_name`
--
ALTER TABLE `field_revision_field_name`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_name_format` (`field_name_format`);

--
-- Indexes for table `field_revision_field_number`
--
ALTER TABLE `field_revision_field_number`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`);

--
-- Indexes for table `field_revision_field_owned_by`
--
ALTER TABLE `field_revision_field_owned_by`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_owned_by_format` (`field_owned_by_format`);

--
-- Indexes for table `field_revision_field_phone_no`
--
ALTER TABLE `field_revision_field_phone_no`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_phone_no_format` (`field_phone_no_format`);

--
-- Indexes for table `field_revision_field_pin_code`
--
ALTER TABLE `field_revision_field_pin_code`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`);

--
-- Indexes for table `field_revision_field_proactive_description`
--
ALTER TABLE `field_revision_field_proactive_description`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_proactive_description_format` (`field_proactive_description_format`);

--
-- Indexes for table `field_revision_field_proactive_set`
--
ALTER TABLE `field_revision_field_proactive_set`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_proactive_set_revision_id` (`field_proactive_set_revision_id`);

--
-- Indexes for table `field_revision_field_proactive_title`
--
ALTER TABLE `field_revision_field_proactive_title`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_proactive_title_format` (`field_proactive_title_format`);

--
-- Indexes for table `field_revision_field_qa_category`
--
ALTER TABLE `field_revision_field_qa_category`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_qa_category_tid` (`field_qa_category_tid`);

--
-- Indexes for table `field_revision_field_room_no`
--
ALTER TABLE `field_revision_field_room_no`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_room_no_format` (`field_room_no_format`);

--
-- Indexes for table `field_revision_field_rule_notifications`
--
ALTER TABLE `field_revision_field_rule_notifications`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_rule_notifications_tid` (`field_rule_notifications_tid`);

--
-- Indexes for table `field_revision_field_start_date`
--
ALTER TABLE `field_revision_field_start_date`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`);

--
-- Indexes for table `field_revision_field_state_district`
--
ALTER TABLE `field_revision_field_state_district`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_state_district_tid` (`field_state_district_tid`);

--
-- Indexes for table `field_revision_field_tags`
--
ALTER TABLE `field_revision_field_tags`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_tags_tid` (`field_tags_tid`);

--
-- Indexes for table `field_revision_field_upload_attachement`
--
ALTER TABLE `field_revision_field_upload_attachement`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `field_upload_attachement_fid` (`field_upload_attachement_fid`);

--
-- Indexes for table `field_revision_field_url`
--
ALTER TABLE `field_revision_field_url`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`);

--
-- Indexes for table `field_revision_field_video`
--
ALTER TABLE `field_revision_field_video`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`);

--
-- Indexes for table `field_revision_taxonomy_forums`
--
ALTER TABLE `field_revision_taxonomy_forums`
 ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`), ADD KEY `entity_type` (`entity_type`), ADD KEY `bundle` (`bundle`), ADD KEY `deleted` (`deleted`), ADD KEY `entity_id` (`entity_id`), ADD KEY `revision_id` (`revision_id`), ADD KEY `language` (`language`), ADD KEY `taxonomy_forums_tid` (`taxonomy_forums_tid`);

--
-- Indexes for table `file_managed`
--
ALTER TABLE `file_managed`
 ADD PRIMARY KEY (`fid`), ADD UNIQUE KEY `uri` (`uri`), ADD KEY `uid` (`uid`), ADD KEY `status` (`status`), ADD KEY `timestamp` (`timestamp`);

--
-- Indexes for table `file_usage`
--
ALTER TABLE `file_usage`
 ADD PRIMARY KEY (`fid`,`type`,`id`,`module`), ADD KEY `type_id` (`type`,`id`), ADD KEY `fid_count` (`fid`,`count`), ADD KEY `fid_module` (`fid`,`module`);

--
-- Indexes for table `filter`
--
ALTER TABLE `filter`
 ADD PRIMARY KEY (`format`,`name`), ADD KEY `list` (`weight`,`module`,`name`);

--
-- Indexes for table `filter_format`
--
ALTER TABLE `filter_format`
 ADD PRIMARY KEY (`format`), ADD UNIQUE KEY `name` (`name`), ADD KEY `status_weight` (`status`,`weight`);

--
-- Indexes for table `flexslider_optionset`
--
ALTER TABLE `flexslider_optionset`
 ADD PRIMARY KEY (`name`);

--
-- Indexes for table `flood`
--
ALTER TABLE `flood`
 ADD PRIMARY KEY (`fid`), ADD KEY `allow` (`event`,`identifier`,`timestamp`), ADD KEY `purge` (`expiration`);

--
-- Indexes for table `forum`
--
ALTER TABLE `forum`
 ADD PRIMARY KEY (`vid`), ADD KEY `forum_topic` (`nid`,`tid`), ADD KEY `tid` (`tid`);

--
-- Indexes for table `forum_index`
--
ALTER TABLE `forum_index`
 ADD KEY `forum_topics` (`nid`,`tid`,`sticky`,`last_comment_timestamp`), ADD KEY `created` (`created`), ADD KEY `last_comment_timestamp` (`last_comment_timestamp`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
 ADD PRIMARY KEY (`uid`,`nid`), ADD KEY `nid` (`nid`);

--
-- Indexes for table `i18n_block_language`
--
ALTER TABLE `i18n_block_language`
 ADD PRIMARY KEY (`module`,`delta`,`language`), ADD KEY `language` (`language`);

--
-- Indexes for table `i18n_path`
--
ALTER TABLE `i18n_path`
 ADD PRIMARY KEY (`tpid`), ADD UNIQUE KEY `set_language` (`tsid`,`language`), ADD KEY `path` (`path`);

--
-- Indexes for table `i18n_string`
--
ALTER TABLE `i18n_string`
 ADD PRIMARY KEY (`lid`), ADD KEY `group_context` (`textgroup`,`context`);

--
-- Indexes for table `i18n_translation_set`
--
ALTER TABLE `i18n_translation_set`
 ADD PRIMARY KEY (`tsid`), ADD KEY `entity_bundle` (`type`,`bundle`);

--
-- Indexes for table `icon_bundle`
--
ALTER TABLE `icon_bundle`
 ADD PRIMARY KEY (`name`);

--
-- Indexes for table `image_effects`
--
ALTER TABLE `image_effects`
 ADD PRIMARY KEY (`ieid`), ADD KEY `isid` (`isid`), ADD KEY `weight` (`weight`);

--
-- Indexes for table `image_styles`
--
ALTER TABLE `image_styles`
 ADD PRIMARY KEY (`isid`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ips_allow_list`
--
ALTER TABLE `ips_allow_list`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
 ADD PRIMARY KEY (`language`), ADD KEY `list` (`weight`,`name`);

--
-- Indexes for table `locales_source`
--
ALTER TABLE `locales_source`
 ADD PRIMARY KEY (`lid`), ADD KEY `source_context` (`source`(30),`context`);

--
-- Indexes for table `locales_target`
--
ALTER TABLE `locales_target`
 ADD PRIMARY KEY (`language`,`lid`,`plural`), ADD KEY `lid` (`lid`), ADD KEY `plid` (`plid`), ADD KEY `plural` (`plural`);

--
-- Indexes for table `menu_custom`
--
ALTER TABLE `menu_custom`
 ADD PRIMARY KEY (`menu_name`);

--
-- Indexes for table `menu_links`
--
ALTER TABLE `menu_links`
 ADD PRIMARY KEY (`mlid`), ADD KEY `path_menu` (`link_path`(128),`menu_name`), ADD KEY `menu_plid_expand_child` (`menu_name`,`plid`,`expanded`,`has_children`), ADD KEY `menu_parents` (`menu_name`,`p1`,`p2`,`p3`,`p4`,`p5`,`p6`,`p7`,`p8`,`p9`), ADD KEY `router_path` (`router_path`(128));

--
-- Indexes for table `menu_router`
--
ALTER TABLE `menu_router`
 ADD PRIMARY KEY (`path`), ADD KEY `fit` (`fit`), ADD KEY `tab_parent` (`tab_parent`(64),`weight`,`title`), ADD KEY `tab_root_weight_title` (`tab_root`(64),`weight`,`title`);

--
-- Indexes for table `node`
--
ALTER TABLE `node`
 ADD PRIMARY KEY (`nid`), ADD UNIQUE KEY `vid` (`vid`), ADD KEY `node_changed` (`changed`), ADD KEY `node_created` (`created`), ADD KEY `node_frontpage` (`promote`,`status`,`sticky`,`created`), ADD KEY `node_status_type` (`status`,`type`,`nid`), ADD KEY `node_title_type` (`title`,`type`(4)), ADD KEY `node_type` (`type`(4)), ADD KEY `uid` (`uid`), ADD KEY `tnid` (`tnid`), ADD KEY `translate` (`translate`), ADD KEY `language` (`language`);

--
-- Indexes for table `node_access`
--
ALTER TABLE `node_access`
 ADD PRIMARY KEY (`nid`,`gid`,`realm`);

--
-- Indexes for table `node_comment_statistics`
--
ALTER TABLE `node_comment_statistics`
 ADD PRIMARY KEY (`nid`), ADD KEY `node_comment_timestamp` (`last_comment_timestamp`), ADD KEY `comment_count` (`comment_count`), ADD KEY `last_comment_uid` (`last_comment_uid`);

--
-- Indexes for table `node_revision`
--
ALTER TABLE `node_revision`
 ADD PRIMARY KEY (`vid`), ADD KEY `nid` (`nid`), ADD KEY `uid` (`uid`);

--
-- Indexes for table `node_type`
--
ALTER TABLE `node_type`
 ADD PRIMARY KEY (`type`);

--
-- Indexes for table `page_manager_handlers`
--
ALTER TABLE `page_manager_handlers`
 ADD PRIMARY KEY (`did`), ADD UNIQUE KEY `name` (`name`), ADD KEY `fulltask` (`task`,`subtask`,`weight`);

--
-- Indexes for table `page_manager_pages`
--
ALTER TABLE `page_manager_pages`
 ADD PRIMARY KEY (`pid`), ADD UNIQUE KEY `name` (`name`), ADD KEY `task` (`task`);

--
-- Indexes for table `page_manager_weights`
--
ALTER TABLE `page_manager_weights`
 ADD PRIMARY KEY (`name`), ADD KEY `weights` (`name`,`weight`);

--
-- Indexes for table `panels_display`
--
ALTER TABLE `panels_display`
 ADD PRIMARY KEY (`did`);

--
-- Indexes for table `panels_layout`
--
ALTER TABLE `panels_layout`
 ADD PRIMARY KEY (`lid`);

--
-- Indexes for table `panels_mini`
--
ALTER TABLE `panels_mini`
 ADD PRIMARY KEY (`pid`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `panels_node`
--
ALTER TABLE `panels_node`
 ADD PRIMARY KEY (`did`);

--
-- Indexes for table `panels_pane`
--
ALTER TABLE `panels_pane`
 ADD PRIMARY KEY (`pid`), ADD KEY `did_idx` (`did`);

--
-- Indexes for table `panels_renderer_pipeline`
--
ALTER TABLE `panels_renderer_pipeline`
 ADD PRIMARY KEY (`rpid`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
 ADD PRIMARY KEY (`pid`), ADD KEY `uid` (`uid`);

--
-- Indexes for table `profile_type`
--
ALTER TABLE `profile_type`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `type` (`type`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
 ADD PRIMARY KEY (`item_id`), ADD KEY `name_created` (`name`,`created`), ADD KEY `expire` (`expire`);

--
-- Indexes for table `quicktabs`
--
ALTER TABLE `quicktabs`
 ADD PRIMARY KEY (`machine_name`);

--
-- Indexes for table `rdf_mapping`
--
ALTER TABLE `rdf_mapping`
 ADD PRIMARY KEY (`type`,`bundle`);

--
-- Indexes for table `registry`
--
ALTER TABLE `registry`
 ADD PRIMARY KEY (`name`,`type`), ADD KEY `hook` (`type`,`weight`,`module`);

--
-- Indexes for table `registry_file`
--
ALTER TABLE `registry_file`
 ADD PRIMARY KEY (`filename`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
 ADD PRIMARY KEY (`rid`), ADD UNIQUE KEY `name` (`name`), ADD KEY `name_weight` (`name`,`weight`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
 ADD PRIMARY KEY (`rid`,`permission`), ADD KEY `permission` (`permission`);

--
-- Indexes for table `search_dataset`
--
ALTER TABLE `search_dataset`
 ADD PRIMARY KEY (`sid`,`type`);

--
-- Indexes for table `search_index`
--
ALTER TABLE `search_index`
 ADD PRIMARY KEY (`word`,`sid`,`type`), ADD KEY `sid_type` (`sid`,`type`);

--
-- Indexes for table `search_node_links`
--
ALTER TABLE `search_node_links`
 ADD PRIMARY KEY (`sid`,`type`,`nid`), ADD KEY `nid` (`nid`);

--
-- Indexes for table `search_total`
--
ALTER TABLE `search_total`
 ADD PRIMARY KEY (`word`);

--
-- Indexes for table `semaphore`
--
ALTER TABLE `semaphore`
 ADD PRIMARY KEY (`name`), ADD KEY `value` (`value`), ADD KEY `expire` (`expire`);

--
-- Indexes for table `sequences`
--
ALTER TABLE `sequences`
 ADD PRIMARY KEY (`value`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
 ADD PRIMARY KEY (`sid`,`ssid`), ADD KEY `timestamp` (`timestamp`), ADD KEY `uid` (`uid`), ADD KEY `ssid` (`ssid`);

--
-- Indexes for table `shortcut_set`
--
ALTER TABLE `shortcut_set`
 ADD PRIMARY KEY (`set_name`);

--
-- Indexes for table `shortcut_set_users`
--
ALTER TABLE `shortcut_set_users`
 ADD PRIMARY KEY (`uid`), ADD KEY `set_name` (`set_name`);

--
-- Indexes for table `stylizer`
--
ALTER TABLE `stylizer`
 ADD PRIMARY KEY (`sid`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `system`
--
ALTER TABLE `system`
 ADD PRIMARY KEY (`filename`), ADD KEY `system_list` (`status`,`bootstrap`,`type`,`weight`,`name`), ADD KEY `type_name` (`type`,`name`);

--
-- Indexes for table `taxonomy_index`
--
ALTER TABLE `taxonomy_index`
 ADD KEY `term_node` (`tid`,`sticky`,`created`), ADD KEY `nid` (`nid`);

--
-- Indexes for table `taxonomy_menu`
--
ALTER TABLE `taxonomy_menu`
 ADD PRIMARY KEY (`mlid`,`tid`), ADD KEY `vid` (`vid`);

--
-- Indexes for table `taxonomy_term_data`
--
ALTER TABLE `taxonomy_term_data`
 ADD PRIMARY KEY (`tid`), ADD KEY `taxonomy_tree` (`vid`,`weight`,`name`), ADD KEY `vid_name` (`vid`,`name`), ADD KEY `name` (`name`);

--
-- Indexes for table `taxonomy_term_hierarchy`
--
ALTER TABLE `taxonomy_term_hierarchy`
 ADD PRIMARY KEY (`tid`,`parent`), ADD KEY `parent` (`parent`);

--
-- Indexes for table `taxonomy_vocabulary`
--
ALTER TABLE `taxonomy_vocabulary`
 ADD PRIMARY KEY (`vid`), ADD UNIQUE KEY `machine_name` (`machine_name`), ADD KEY `list` (`weight`,`name`);

--
-- Indexes for table `trigger_assignments`
--
ALTER TABLE `trigger_assignments`
 ADD PRIMARY KEY (`hook`,`aid`);

--
-- Indexes for table `url_alias`
--
ALTER TABLE `url_alias`
 ADD PRIMARY KEY (`pid`), ADD KEY `alias_language_pid` (`alias`,`language`,`pid`), ADD KEY `source_language_pid` (`source`,`language`,`pid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`uid`), ADD UNIQUE KEY `name` (`name`), ADD KEY `access` (`access`), ADD KEY `created` (`created`), ADD KEY `mail` (`mail`), ADD KEY `picture` (`picture`);

--
-- Indexes for table `users_roles`
--
ALTER TABLE `users_roles`
 ADD PRIMARY KEY (`uid`,`rid`), ADD KEY `rid` (`rid`);

--
-- Indexes for table `validate_fields`
--
ALTER TABLE `validate_fields`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variable`
--
ALTER TABLE `variable`
 ADD PRIMARY KEY (`name`);

--
-- Indexes for table `vef_video_styles`
--
ALTER TABLE `vef_video_styles`
 ADD PRIMARY KEY (`name`);

--
-- Indexes for table `views_display`
--
ALTER TABLE `views_display`
 ADD PRIMARY KEY (`vid`,`id`), ADD KEY `vid` (`vid`,`position`);

--
-- Indexes for table `views_view`
--
ALTER TABLE `views_view`
 ADD PRIMARY KEY (`vid`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `watchdog`
--
ALTER TABLE `watchdog`
 ADD PRIMARY KEY (`wid`), ADD KEY `type` (`type`), ADD KEY `uid` (`uid`), ADD KEY `severity` (`severity`);

--
-- Indexes for table `webform`
--
ALTER TABLE `webform`
 ADD PRIMARY KEY (`nid`);

--
-- Indexes for table `webform_component`
--
ALTER TABLE `webform_component`
 ADD PRIMARY KEY (`nid`,`cid`);

--
-- Indexes for table `webform_emails`
--
ALTER TABLE `webform_emails`
 ADD PRIMARY KEY (`nid`,`eid`);

--
-- Indexes for table `webform_last_download`
--
ALTER TABLE `webform_last_download`
 ADD PRIMARY KEY (`nid`,`uid`);

--
-- Indexes for table `webform_roles`
--
ALTER TABLE `webform_roles`
 ADD PRIMARY KEY (`nid`,`rid`);

--
-- Indexes for table `webform_submissions`
--
ALTER TABLE `webform_submissions`
 ADD PRIMARY KEY (`sid`), ADD UNIQUE KEY `sid_nid` (`sid`,`nid`), ADD KEY `nid_uid_sid` (`nid`,`uid`,`sid`), ADD KEY `nid_sid` (`nid`,`sid`);

--
-- Indexes for table `webform_submitted_data`
--
ALTER TABLE `webform_submitted_data`
 ADD PRIMARY KEY (`nid`,`sid`,`cid`,`no`), ADD KEY `nid` (`nid`), ADD KEY `sid_nid` (`sid`,`nid`);

--
-- Indexes for table `workbench_moderation_node_history`
--
ALTER TABLE `workbench_moderation_node_history`
 ADD PRIMARY KEY (`hid`), ADD KEY `nid` (`nid`), ADD KEY `vid` (`vid`);

--
-- Indexes for table `workbench_moderation_states`
--
ALTER TABLE `workbench_moderation_states`
 ADD PRIMARY KEY (`name`);

--
-- Indexes for table `workbench_moderation_transitions`
--
ALTER TABLE `workbench_moderation_transitions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workflows`
--
ALTER TABLE `workflows`
 ADD PRIMARY KEY (`wid`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `workflow_node`
--
ALTER TABLE `workflow_node`
 ADD PRIMARY KEY (`nid`), ADD KEY `nid` (`nid`,`sid`);

--
-- Indexes for table `workflow_node_history`
--
ALTER TABLE `workflow_node_history`
 ADD PRIMARY KEY (`hid`), ADD KEY `sid` (`entity_type`,`nid`,`sid`);

--
-- Indexes for table `workflow_scheduled_transition`
--
ALTER TABLE `workflow_scheduled_transition`
 ADD KEY `entity_type` (`entity_type`), ADD KEY `entity_id` (`entity_type`,`nid`);

--
-- Indexes for table `workflow_states`
--
ALTER TABLE `workflow_states`
 ADD PRIMARY KEY (`sid`), ADD KEY `sysid` (`sysid`), ADD KEY `wid` (`wid`);

--
-- Indexes for table `workflow_transitions`
--
ALTER TABLE `workflow_transitions`
 ADD PRIMARY KEY (`tid`), ADD KEY `sid` (`sid`), ADD KEY `target_sid` (`target_sid`);

--
-- Indexes for table `workflow_type_map`
--
ALTER TABLE `workflow_type_map`
 ADD KEY `type` (`type`,`wid`);

--
-- Indexes for table `wysiwyg`
--
ALTER TABLE `wysiwyg`
 ADD PRIMARY KEY (`format`);

--
-- Indexes for table `wysiwyg_user`
--
ALTER TABLE `wysiwyg_user`
 ADD KEY `uid` (`uid`), ADD KEY `format` (`format`);

--
-- Indexes for table `xmlsitemap`
--
ALTER TABLE `xmlsitemap`
 ADD PRIMARY KEY (`id`,`type`), ADD KEY `loc` (`loc`), ADD KEY `access_status_loc` (`access`,`status`,`loc`), ADD KEY `type_subtype` (`type`,`subtype`), ADD KEY `language` (`language`);

--
-- Indexes for table `xmlsitemap_sitemap`
--
ALTER TABLE `xmlsitemap_sitemap`
 ADD PRIMARY KEY (`smid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authmap`
--
ALTER TABLE `authmap`
MODIFY `aid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique authmap ID.';
--
-- AUTO_INCREMENT for table `block`
--
ALTER TABLE `block`
MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique block ID.',AUTO_INCREMENT=975;
--
-- AUTO_INCREMENT for table `blocked_ips`
--
ALTER TABLE `blocked_ips`
MODIFY `iid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: unique ID for IP addresses.';
--
-- AUTO_INCREMENT for table `block_custom`
--
ALTER TABLE `block_custom`
MODIFY `bid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The block’s block.bid.',AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique comment ID.';
--
-- AUTO_INCREMENT for table `conditional_fields`
--
ALTER TABLE `conditional_fields`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a dependency.';
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
MODIFY `cid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique category ID.',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ctools_access_ruleset`
--
ALTER TABLE `ctools_access_ruleset`
MODIFY `rsid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'A database primary key to ensure uniqueness';
--
-- AUTO_INCREMENT for table `ctools_custom_content`
--
ALTER TABLE `ctools_custom_content`
MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'A database primary key to ensure uniqueness';
--
-- AUTO_INCREMENT for table `date_formats`
--
ALTER TABLE `date_formats`
MODIFY `dfid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The date format identifier.',AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `entityform`
--
ALTER TABLE `entityform`
MODIFY `entityform_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Identifier for a entityform.';
--
-- AUTO_INCREMENT for table `entityform_type`
--
ALTER TABLE `entityform_type`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique entityform type identifier.';
--
-- AUTO_INCREMENT for table `field_collection_item`
--
ALTER TABLE `field_collection_item`
MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique field collection item ID.',AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `field_collection_item_revision`
--
ALTER TABLE `field_collection_item_revision`
MODIFY `revision_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique revision ID.',AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `field_config`
--
ALTER TABLE `field_config`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a field',AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT for table `field_config_instance`
--
ALTER TABLE `field_config_instance`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a field instance',AUTO_INCREMENT=243;
--
-- AUTO_INCREMENT for table `file_managed`
--
ALTER TABLE `file_managed`
MODIFY `fid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'File ID.',AUTO_INCREMENT=416;
--
-- AUTO_INCREMENT for table `flood`
--
ALTER TABLE `flood`
MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique flood event ID.',AUTO_INCREMENT=130;
--
-- AUTO_INCREMENT for table `i18n_path`
--
ALTER TABLE `i18n_path`
MODIFY `tpid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a path in the translation set.';
--
-- AUTO_INCREMENT for table `i18n_translation_set`
--
ALTER TABLE `i18n_translation_set`
MODIFY `tsid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a translation set.',AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `image_effects`
--
ALTER TABLE `image_effects`
MODIFY `ieid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for an image effect.',AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `image_styles`
--
ALTER TABLE `image_styles`
MODIFY `isid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for an image style.',AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `ips_allow_list`
--
ALTER TABLE `ips_allow_list`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier for the Validate-String.';
--
-- AUTO_INCREMENT for table `locales_source`
--
ALTER TABLE `locales_source`
MODIFY `lid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of this string.',AUTO_INCREMENT=20918;
--
-- AUTO_INCREMENT for table `menu_links`
--
ALTER TABLE `menu_links`
MODIFY `mlid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The menu link ID (mlid) is the integer primary key.',AUTO_INCREMENT=2162;
--
-- AUTO_INCREMENT for table `node`
--
ALTER TABLE `node`
MODIFY `nid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a node.',AUTO_INCREMENT=446;
--
-- AUTO_INCREMENT for table `node_revision`
--
ALTER TABLE `node_revision`
MODIFY `vid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for this version.',AUTO_INCREMENT=459;
--
-- AUTO_INCREMENT for table `page_manager_handlers`
--
ALTER TABLE `page_manager_handlers`
MODIFY `did` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary ID field for the table. Not used for anything except internal lookups.',AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `page_manager_pages`
--
ALTER TABLE `page_manager_pages`
MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary ID field for the table. Not used for anything except internal lookups.',AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `panels_display`
--
ALTER TABLE `panels_display`
MODIFY `did` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `panels_layout`
--
ALTER TABLE `panels_layout`
MODIFY `lid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'A database primary key to ensure uniqueness.';
--
-- AUTO_INCREMENT for table `panels_mini`
--
ALTER TABLE `panels_mini`
MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The primary key for uniqueness.',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `panels_pane`
--
ALTER TABLE `panels_pane`
MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `panels_renderer_pipeline`
--
ALTER TABLE `panels_renderer_pipeline`
MODIFY `rpid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'A database primary key to ensure uniqueness.';
--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique profile item ID.',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `profile_type`
--
ALTER TABLE `profile_type`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique profile type ID.',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
MODIFY `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique item ID.',AUTO_INCREMENT=892;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
MODIFY `rid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique role ID.',AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sequences`
--
ALTER TABLE `sequences`
MODIFY `value` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The value of the sequence.',AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT for table `stylizer`
--
ALTER TABLE `stylizer`
MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `taxonomy_term_data`
--
ALTER TABLE `taxonomy_term_data`
MODIFY `tid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique term ID.',AUTO_INCREMENT=2318;
--
-- AUTO_INCREMENT for table `taxonomy_vocabulary`
--
ALTER TABLE `taxonomy_vocabulary`
MODIFY `vid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique vocabulary ID.',AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `url_alias`
--
ALTER TABLE `url_alias`
MODIFY `pid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'A unique path alias identifier.',AUTO_INCREMENT=2766;
--
-- AUTO_INCREMENT for table `validate_fields`
--
ALTER TABLE `validate_fields`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier for the Validate-Fields.',AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `views_view`
--
ALTER TABLE `views_view`
MODIFY `vid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The view ID of the field, defined by the database.',AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `watchdog`
--
ALTER TABLE `watchdog`
MODIFY `wid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique watchdog event ID.',AUTO_INCREMENT=198746;
--
-- AUTO_INCREMENT for table `webform_submissions`
--
ALTER TABLE `webform_submissions`
MODIFY `sid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The unique identifier for this submission.',AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `workbench_moderation_node_history`
--
ALTER TABLE `workbench_moderation_node_history`
MODIFY `hid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Node history entry key.',AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `workbench_moderation_transitions`
--
ALTER TABLE `workbench_moderation_transitions`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique workbench_moderation transition identifier.',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `workflows`
--
ALTER TABLE `workflows`
MODIFY `wid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a workflow.';
--
-- AUTO_INCREMENT for table `workflow_node_history`
--
ALTER TABLE `workflow_node_history`
MODIFY `hid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The unique ID for this record.';
--
-- AUTO_INCREMENT for table `workflow_states`
--
ALTER TABLE `workflow_states`
MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a workflow state.';
--
-- AUTO_INCREMENT for table `workflow_transitions`
--
ALTER TABLE `workflow_transitions`
MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a workflow transition.';
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
