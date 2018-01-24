/*
 Navicat PostgreSQL Data Transfer

 Source Server         : local
 Source Server Type    : PostgreSQL
 Source Server Version : 100001
 Source Host           : localhost:5432
 Source Catalog        : postgres
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 100001
 File Encoding         : 65001

 Date: 24/01/2018 15:09:45
*/


-- ----------------------------
-- Sequence structure for wp_commentmeta_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."wp_commentmeta_seq";
CREATE SEQUENCE "public"."wp_commentmeta_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for wp_comments_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."wp_comments_seq";
CREATE SEQUENCE "public"."wp_comments_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for wp_links_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."wp_links_seq";
CREATE SEQUENCE "public"."wp_links_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for wp_options_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."wp_options_seq";
CREATE SEQUENCE "public"."wp_options_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for wp_postmeta_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."wp_postmeta_seq";
CREATE SEQUENCE "public"."wp_postmeta_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for wp_posts_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."wp_posts_seq";
CREATE SEQUENCE "public"."wp_posts_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for wp_term_taxonomy_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."wp_term_taxonomy_seq";
CREATE SEQUENCE "public"."wp_term_taxonomy_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for wp_termmeta_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."wp_termmeta_seq";
CREATE SEQUENCE "public"."wp_termmeta_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for wp_terms_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."wp_terms_seq";
CREATE SEQUENCE "public"."wp_terms_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for wp_usermeta_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."wp_usermeta_seq";
CREATE SEQUENCE "public"."wp_usermeta_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for wp_users_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."wp_users_seq";
CREATE SEQUENCE "public"."wp_users_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for wp_commentmeta
-- ----------------------------
DROP TABLE IF EXISTS "public"."wp_commentmeta";
CREATE TABLE "public"."wp_commentmeta" (
  "meta_id" int8 NOT NULL DEFAULT nextval(('wp_commentmeta_seq'::text)::regclass),
  "comment_id" int8 NOT NULL DEFAULT '0'::bigint,
  "meta_key" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "meta_value" text COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."wp_commentmeta" OWNER TO "postgres";

-- ----------------------------
-- Table structure for wp_comments
-- ----------------------------
DROP TABLE IF EXISTS "public"."wp_comments";
CREATE TABLE "public"."wp_comments" (
  "comment_ID" int8 NOT NULL DEFAULT nextval(('wp_comments_seq'::text)::regclass),
  "comment_post_ID" int8 NOT NULL DEFAULT '0'::bigint,
  "comment_author" text COLLATE "pg_catalog"."default" NOT NULL,
  "comment_author_email" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "comment_author_url" varchar(200) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "comment_author_ip" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "comment_date" timestamp(6) NOT NULL DEFAULT now(),
  "comment_date_gmt" timestamp(6) NOT NULL DEFAULT timezone('gmt'::text, now()),
  "comment_content" text COLLATE "pg_catalog"."default" NOT NULL,
  "comment_karma" int4 NOT NULL DEFAULT 0,
  "comment_approved" varchar(20) COLLATE "pg_catalog"."default" NOT NULL DEFAULT '1'::character varying,
  "comment_agent" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "comment_type" varchar(20) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "comment_parent" int8 NOT NULL DEFAULT '0'::bigint,
  "user_id" int8 NOT NULL DEFAULT '0'::bigint
)
;
ALTER TABLE "public"."wp_comments" OWNER TO "postgres";

-- ----------------------------
-- Records of wp_comments
-- ----------------------------
BEGIN;
INSERT INTO "public"."wp_comments" VALUES (1, 1, 'Un comentarista de WordPress', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2018-01-24 15:07:21', '2018-01-24 15:07:21', 'Hola, esto es un comentario.
Para empezar a moderar, editar y borrar comentarios, por favor, visita la pantalla de comentarios en el escritorio.
Los avatares de los comentaristas provienen de <a href="https://gravatar.com">Gravatar</a>.', 0, '1', '', '', 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for wp_links
-- ----------------------------
DROP TABLE IF EXISTS "public"."wp_links";
CREATE TABLE "public"."wp_links" (
  "link_id" int8 NOT NULL DEFAULT nextval(('wp_links_seq'::text)::regclass),
  "link_url" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "link_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "link_image" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "link_target" varchar(25) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "link_description" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "link_visible" varchar(20) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'Y'::character varying,
  "link_owner" int8 NOT NULL DEFAULT '1'::bigint,
  "link_rating" int4 NOT NULL DEFAULT 0,
  "link_updated" timestamp(6) NOT NULL DEFAULT now(),
  "link_rel" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "link_notes" text COLLATE "pg_catalog"."default" NOT NULL,
  "link_rss" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying
)
;
ALTER TABLE "public"."wp_links" OWNER TO "postgres";

-- ----------------------------
-- Table structure for wp_options
-- ----------------------------
DROP TABLE IF EXISTS "public"."wp_options";
CREATE TABLE "public"."wp_options" (
  "option_id" int8 NOT NULL DEFAULT nextval(('wp_options_seq'::text)::regclass),
  "option_name" varchar(191) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "option_value" text COLLATE "pg_catalog"."default" NOT NULL,
  "autoload" varchar(20) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'yes'::character varying
)
;
ALTER TABLE "public"."wp_options" OWNER TO "postgres";

-- ----------------------------
-- Records of wp_options
-- ----------------------------
BEGIN;
INSERT INTO "public"."wp_options" VALUES (1, 'siteurl', 'http://localhost/portal-pg', 'yes');
INSERT INTO "public"."wp_options" VALUES (2, 'home', 'http://localhost/portal-pg', 'yes');
INSERT INTO "public"."wp_options" VALUES (8, 'use_balanceTags', '0', 'yes');
INSERT INTO "public"."wp_options" VALUES (9, 'use_smilies', '1', 'yes');
INSERT INTO "public"."wp_options" VALUES (10, 'require_name_email', '1', 'yes');
INSERT INTO "public"."wp_options" VALUES (11, 'comments_notify', '1', 'yes');
INSERT INTO "public"."wp_options" VALUES (13, 'rss_use_excerpt', '0', 'yes');
INSERT INTO "public"."wp_options" VALUES (14, 'mailserver_url', 'mail.example.com', 'yes');
INSERT INTO "public"."wp_options" VALUES (15, 'mailserver_login', 'login@example.com', 'yes');
INSERT INTO "public"."wp_options" VALUES (16, 'mailserver_pass', 'password', 'yes');
INSERT INTO "public"."wp_options" VALUES (19, 'default_comment_status', 'open', 'yes');
INSERT INTO "public"."wp_options" VALUES (20, 'default_ping_status', 'open', 'yes');
INSERT INTO "public"."wp_options" VALUES (21, 'default_pingback_flag', '1', 'yes');
INSERT INTO "public"."wp_options" VALUES (24, 'time_format', 'g:i a', 'yes');
INSERT INTO "public"."wp_options" VALUES (25, 'links_updated_date_format', 'j F, Y g:i a', 'yes');
INSERT INTO "public"."wp_options" VALUES (26, 'comment_moderation', '0', 'yes');
INSERT INTO "public"."wp_options" VALUES (27, 'moderation_notify', '1', 'yes');
INSERT INTO "public"."wp_options" VALUES (30, 'hack_file', '0', 'yes');
INSERT INTO "public"."wp_options" VALUES (31, 'blog_charset', 'UTF-8', 'yes');
INSERT INTO "public"."wp_options" VALUES (32, 'moderation_keys', '', 'no');
INSERT INTO "public"."wp_options" VALUES (34, 'category_base', '', 'yes');
INSERT INTO "public"."wp_options" VALUES (35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes');
INSERT INTO "public"."wp_options" VALUES (36, 'comment_max_links', '2', 'yes');
INSERT INTO "public"."wp_options" VALUES (37, 'gmt_offset', '0', 'yes');
INSERT INTO "public"."wp_options" VALUES (39, 'recently_edited', '', 'no');
INSERT INTO "public"."wp_options" VALUES (42, 'comment_whitelist', '1', 'yes');
INSERT INTO "public"."wp_options" VALUES (43, 'blacklist_keys', '', 'no');
INSERT INTO "public"."wp_options" VALUES (44, 'comment_registration', '0', 'yes');
INSERT INTO "public"."wp_options" VALUES (45, 'html_type', 'text/html', 'yes');
INSERT INTO "public"."wp_options" VALUES (46, 'use_trackback', '0', 'yes');
INSERT INTO "public"."wp_options" VALUES (47, 'default_role', 'subscriber', 'yes');
INSERT INTO "public"."wp_options" VALUES (48, 'db_version', '38590', 'yes');
INSERT INTO "public"."wp_options" VALUES (49, 'uploads_use_yearmonth_folders', '1', 'yes');
INSERT INTO "public"."wp_options" VALUES (50, 'upload_path', '', 'yes');
INSERT INTO "public"."wp_options" VALUES (54, 'tag_base', '', 'yes');
INSERT INTO "public"."wp_options" VALUES (55, 'show_avatars', '1', 'yes');
INSERT INTO "public"."wp_options" VALUES (56, 'avatar_rating', 'G', 'yes');
INSERT INTO "public"."wp_options" VALUES (57, 'upload_url_path', '', 'yes');
INSERT INTO "public"."wp_options" VALUES (58, 'thumbnail_size_w', '150', 'yes');
INSERT INTO "public"."wp_options" VALUES (59, 'thumbnail_size_h', '150', 'yes');
INSERT INTO "public"."wp_options" VALUES (60, 'thumbnail_crop', '1', 'yes');
INSERT INTO "public"."wp_options" VALUES (61, 'medium_size_w', '300', 'yes');
INSERT INTO "public"."wp_options" VALUES (62, 'medium_size_h', '300', 'yes');
INSERT INTO "public"."wp_options" VALUES (63, 'avatar_default', 'mystery', 'yes');
INSERT INTO "public"."wp_options" VALUES (64, 'large_size_w', '1024', 'yes');
INSERT INTO "public"."wp_options" VALUES (65, 'large_size_h', '1024', 'yes');
INSERT INTO "public"."wp_options" VALUES (66, 'image_default_link_type', 'none', 'yes');
INSERT INTO "public"."wp_options" VALUES (67, 'image_default_size', '', 'yes');
INSERT INTO "public"."wp_options" VALUES (68, 'image_default_align', '', 'yes');
INSERT INTO "public"."wp_options" VALUES (69, 'close_comments_for_old_posts', '0', 'yes');
INSERT INTO "public"."wp_options" VALUES (70, 'close_comments_days_old', '14', 'yes');
INSERT INTO "public"."wp_options" VALUES (71, 'thread_comments', '1', 'yes');
INSERT INTO "public"."wp_options" VALUES (72, 'thread_comments_depth', '5', 'yes');
INSERT INTO "public"."wp_options" VALUES (73, 'page_comments', '0', 'yes');
INSERT INTO "public"."wp_options" VALUES (74, 'comments_per_page', '50', 'yes');
INSERT INTO "public"."wp_options" VALUES (75, 'default_comments_page', 'newest', 'yes');
INSERT INTO "public"."wp_options" VALUES (76, 'comment_order', 'asc', 'yes');
INSERT INTO "public"."wp_options" VALUES (77, 'sticky_posts', 'a:0:{}', 'yes');
INSERT INTO "public"."wp_options" VALUES (81, 'uninstall_plugins', 'a:0:{}', 'no');
INSERT INTO "public"."wp_options" VALUES (82, 'timezone_string', '', 'yes');
INSERT INTO "public"."wp_options" VALUES (85, 'default_post_format', '0', 'yes');
INSERT INTO "public"."wp_options" VALUES (86, 'link_manager_enabled', '0', 'yes');
INSERT INTO "public"."wp_options" VALUES (87, 'finished_splitting_shared_terms', '1', 'yes');
INSERT INTO "public"."wp_options" VALUES (88, 'site_icon', '0', 'yes');
INSERT INTO "public"."wp_options" VALUES (89, 'medium_large_size_w', '768', 'yes');
INSERT INTO "public"."wp_options" VALUES (90, 'medium_large_size_h', '0', 'yes');
INSERT INTO "public"."wp_options" VALUES (91, 'initial_db_version', '38590', 'yes');
INSERT INTO "public"."wp_options" VALUES (3, 'blogname', 'Portal P3', 'yes');
INSERT INTO "public"."wp_options" VALUES (6, 'admin_email', 'dsepulve@thougthworks.com', 'yes');
INSERT INTO "public"."wp_options" VALUES (78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO "public"."wp_options" VALUES (29, 'rewrite_rules', 'a:111:{s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:21:"^index.php/wp-json/?$";s:22:"index.php?rest_route=/";s:24:"^index.php/wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:57:"index.php/category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:52:"index.php/category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:33:"index.php/category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:45:"index.php/category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:27:"index.php/category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:54:"index.php/tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:49:"index.php/tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:30:"index.php/tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:42:"index.php/tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:24:"index.php/tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:55:"index.php/type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:50:"index.php/type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:31:"index.php/type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:43:"index.php/type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:25:"index.php/type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:42:"index.php/feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:37:"index.php/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:18:"index.php/embed/?$";s:21:"index.php?&embed=true";s:30:"index.php/page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:37:"index.php/comment-page-([0-9]{1,})/?$";s:38:"index.php?&page_id=2&cpage=$matches[1]";s:51:"index.php/comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:46:"index.php/comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:27:"index.php/comments/embed/?$";s:21:"index.php?&embed=true";s:54:"index.php/search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:49:"index.php/search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:30:"index.php/search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:42:"index.php/search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:24:"index.php/search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:57:"index.php/author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:52:"index.php/author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:33:"index.php/author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:45:"index.php/author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:27:"index.php/author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:79:"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:74:"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:55:"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:67:"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:49:"index.php/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:66:"index.php/([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:61:"index.php/([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:42:"index.php/([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:54:"index.php/([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:36:"index.php/([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:53:"index.php/([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:48:"index.php/([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:29:"index.php/([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:41:"index.php/([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:23:"index.php/([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:37:"index.php/.?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:47:"index.php/.?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:67:"index.php/.?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"index.php/.?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"index.php/.?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:43:"index.php/.?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:26:"index.php/(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:30:"index.php/(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:50:"index.php/(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:45:"index.php/(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:38:"index.php/(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:45:"index.php/(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:34:"index.php/(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:72:"index.php/.+?/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:82:"index.php/.+?/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:102:"index.php/.+?/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:97:"index.php/.+?/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:97:"index.php/.+?/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:78:"index.php/.+?/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:69:"index.php/(.+?)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$";s:117:"index.php?category_name=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&name=$matches[5]&embed=true";s:73:"index.php/(.+?)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$";s:111:"index.php?category_name=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&name=$matches[5]&tb=1";s:93:"index.php/(.+?)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:123:"index.php?category_name=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&name=$matches[5]&feed=$matches[6]";s:88:"index.php/(.+?)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:123:"index.php?category_name=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&name=$matches[5]&feed=$matches[6]";s:81:"index.php/(.+?)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$";s:124:"index.php?category_name=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&name=$matches[5]&paged=$matches[6]";s:88:"index.php/(.+?)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$";s:124:"index.php?category_name=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&name=$matches[5]&cpage=$matches[6]";s:77:"index.php/(.+?)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$";s:123:"index.php?category_name=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&name=$matches[5]&page=$matches[6]";s:61:"index.php/.+?/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:71:"index.php/.+?/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:91:"index.php/.+?/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:86:"index.php/.+?/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:86:"index.php/.+?/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:67:"index.php/.+?/[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:85:"index.php/(.+?)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:106:"index.php?category_name=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&feed=$matches[5]";s:80:"index.php/(.+?)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:106:"index.php?category_name=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&feed=$matches[5]";s:61:"index.php/(.+?)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:100:"index.php?category_name=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&embed=true";s:73:"index.php/(.+?)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:107:"index.php?category_name=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&paged=$matches[5]";s:80:"index.php/(.+?)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:107:"index.php?category_name=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]&cpage=$matches[5]";s:55:"index.php/(.+?)/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:89:"index.php?category_name=$matches[1]&year=$matches[2]&monthnum=$matches[3]&day=$matches[4]";s:72:"index.php/(.+?)/([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:90:"index.php?category_name=$matches[1]&year=$matches[2]&monthnum=$matches[3]&feed=$matches[4]";s:67:"index.php/(.+?)/([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:90:"index.php?category_name=$matches[1]&year=$matches[2]&monthnum=$matches[3]&feed=$matches[4]";s:48:"index.php/(.+?)/([0-9]{4})/([0-9]{1,2})/embed/?$";s:84:"index.php?category_name=$matches[1]&year=$matches[2]&monthnum=$matches[3]&embed=true";s:60:"index.php/(.+?)/([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:91:"index.php?category_name=$matches[1]&year=$matches[2]&monthnum=$matches[3]&paged=$matches[4]";s:67:"index.php/(.+?)/([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$";s:91:"index.php?category_name=$matches[1]&year=$matches[2]&monthnum=$matches[3]&cpage=$matches[4]";s:42:"index.php/(.+?)/([0-9]{4})/([0-9]{1,2})/?$";s:73:"index.php?category_name=$matches[1]&year=$matches[2]&monthnum=$matches[3]";s:59:"index.php/(.+?)/([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:69:"index.php?category_name=$matches[1]&year=$matches[2]&feed=$matches[3]";s:54:"index.php/(.+?)/([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:69:"index.php?category_name=$matches[1]&year=$matches[2]&feed=$matches[3]";s:35:"index.php/(.+?)/([0-9]{4})/embed/?$";s:63:"index.php?category_name=$matches[1]&year=$matches[2]&embed=true";s:47:"index.php/(.+?)/([0-9]{4})/page/?([0-9]{1,})/?$";s:70:"index.php?category_name=$matches[1]&year=$matches[2]&paged=$matches[3]";s:54:"index.php/(.+?)/([0-9]{4})/comment-page-([0-9]{1,})/?$";s:70:"index.php?category_name=$matches[1]&year=$matches[2]&cpage=$matches[3]";s:29:"index.php/(.+?)/([0-9]{4})/?$";s:52:"index.php?category_name=$matches[1]&year=$matches[2]";s:48:"index.php/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:43:"index.php/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:24:"index.php/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:36:"index.php/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:43:"index.php/(.+?)/comment-page-([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&cpage=$matches[2]";s:18:"index.php/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";}', 'yes');
INSERT INTO "public"."wp_options" VALUES (33, 'active_plugins', 'a:2:{i:0;s:29:"post-ratings/post-ratings.php";i:1;s:39:"really-simple-breadcrumb/breadcrumb.php";}', 'yes');
INSERT INTO "public"."wp_options" VALUES (40, 'template', 'creative-gem', 'yes');
INSERT INTO "public"."wp_options" VALUES (4, 'blogdescription', 'Portal del Pilar 3', 'yes');
INSERT INTO "public"."wp_options" VALUES (41, 'stylesheet', 'creative-gem', 'yes');
INSERT INTO "public"."wp_options" VALUES (18, 'default_category', '3', 'yes');
INSERT INTO "public"."wp_options" VALUES (38, 'default_email_category', '3', 'yes');
INSERT INTO "public"."wp_options" VALUES (52, 'default_link_category', '0', 'yes');
INSERT INTO "public"."wp_options" VALUES (17, 'mailserver_port', '110', 'yes');
INSERT INTO "public"."wp_options" VALUES (22, 'posts_per_page', '10', 'yes');
INSERT INTO "public"."wp_options" VALUES (23, 'date_format', 'd/m/Y', 'yes');
INSERT INTO "public"."wp_options" VALUES (7, 'start_of_week', '1', 'yes');
INSERT INTO "public"."wp_options" VALUES (5, 'users_can_register', '0', 'yes');
INSERT INTO "public"."wp_options" VALUES (28, 'permalink_structure', '/index.php/%category%/%year%/%monthnum%/%day%/%postname%/', 'yes');
INSERT INTO "public"."wp_options" VALUES (12, 'posts_per_rss', '10', 'yes');
INSERT INTO "public"."wp_options" VALUES (53, 'show_on_front', 'page', 'yes');
INSERT INTO "public"."wp_options" VALUES (84, 'page_on_front', '2', 'yes');
INSERT INTO "public"."wp_options" VALUES (83, 'page_for_posts', '0', 'yes');
INSERT INTO "public"."wp_options" VALUES (51, 'blog_public', '1', 'yes');
INSERT INTO "public"."wp_options" VALUES (127, '_site_transient_timeout_browser_1a1754b3cfd153933070a7f8ebd3ce82', '1517411260', 'no');
INSERT INTO "public"."wp_options" VALUES (128, '_site_transient_browser_1a1754b3cfd153933070a7f8ebd3ce82', 'a:10:{s:4:"name";s:6:"Chrome";s:7:"version";s:13:"63.0.3239.132";s:8:"platform";s:9:"Macintosh";s:10:"update_url";s:29:"https://www.google.com/chrome";s:7:"img_src";s:43:"http://s.w.org/images/browsers/chrome.png?1";s:11:"img_src_ssl";s:44:"https://s.w.org/images/browsers/chrome.png?1";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;s:6:"mobile";b:0;}', 'no');
INSERT INTO "public"."wp_options" VALUES (112, 'cron', 'a:3:{i:1516849641;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1516892858;a:2:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:25:"delete_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes');
INSERT INTO "public"."wp_options" VALUES (138, '_transient_feed_d117b5738fbd35bd8c0391cda1f2b5d9', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"


";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:61:"
	
	
	
	




















































";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"WordPress Planet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:28:"http://planet.wordpress.org/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:2:"en";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:47:"WordPress Planet - http://planet.wordpress.org/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:50:{i:0;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"HeroPress: Believe In Yourself";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:56:"https://heropress.com/?post_type=heropress-essays&p=2420";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:112:"https://heropress.com/essays/believe-in-yourself/#utm_source=rss&utm_medium=rss&utm_campaign=believe-in-yourself";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:10746:"<img width="960" height="480" src="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2018/01/012418-1024x512.jpg" class="attachment-large size-large wp-post-image" alt="Pull Quote: Working in WordPress has allowed my curiosity to run wild." /><p>Have you ever had a moment where you blinked your eyes and you wondered how you’ve gotten to where you are today? I’m having one of those moments right now as I sit here to share my story with you. It’s bizarre to think of how far I’ve come because I truly thought that I was not good enough to be where I am today. Let’s get into it.</p>
<h3>The Beginning</h3>
<p>As a child, I was always around technology. My dad was a computer scientist and considered it a great idea to get each of his four children their own computer so they would stay away from his. So as the years went by with system administrative tasks being “one of the hard-knocks of life”, I went off to Drexel University in 2005 to pursue a degree in Computer Science. I remember when I walked into my first class and instantly saw how different I was. Everyone was white. Everyone was male. And I was not. In fact, I couldn’t even check off one of those boxes. I was opposite. I was female and I was black.</p>
<p>The first year pursuing my degree actually went really well and finished off the year, completing my C++ final project to create a matching cards game using objects and classes. All was swell. I found that I was doing just as well as everyone else. And I found that was struggling in certain areas just like everyone else.</p>
<h3>Leaning In</h3>
<p>Next semester came and that’s when the more difficult course load began. There was one class in particular called “Data Algorithms &amp; Theories” that was incredibly and frustratingly difficult. As someone who always wanted to do well and is inclined to beat herself up for not being “perfect”, it was an incredibly stressful time for me. But once again, I was not the only one who was struggling because the class was difficult for all of my classmates. But as the class progressed, I decided to step out of my comfort zone and ask for help. This was the first time I would actually utilize the teaching assistant (TA) that was often present during this class. So our scheduled meeting comes around and it doesn’t go as I’d hoped. It wasn’t at all a welcoming atmosphere.</p>
<blockquote><p>The demeanor of the TA made it clear that he didn’t want to be there but my happy-go-lucky personality brushed it aside.</p></blockquote>
<p>To make things worse, I wasn’t understanding the “simple” concepts that he was explaining and was subject to the TA’s dismissive glances of judgement and shame. I remember at one point, my mind shifted into trying to make him like me rather than realize that he was discriminating against me. Then he said to me “You know, maybe this just isn’t for you. I’ve explained this to you multiple times and you’re just not getting.” This was a very upsetting moment in my life because someone who was supposed to be helping me learn was telling me that you’re too stupid to learn. Needless to say, I left that session very upset and I ultimately ended up changing my major to something “easier” because apparently it “wasn’t for me”.</p>
<h3>Accepting A Career</h3>
<p>After I graduated in 2010 with my degree in Information Technology, I moved to DC to pursue an unfulfilling Systems Engineering career in government contracting. Don’t get me wrong. I learned a plethora of valuable skills that I will use for the rest of my life. But I wasn’t doing something that was enriching me. Not only that, I was often made to feel ostracized in the work culture because of the lack of diversity.</p>
<blockquote><p>I’m not sure if anyone’s told you&#8230;but it’s extremely hard being a minority and working with people who don’t look like you and who can’t relate to you.</p></blockquote>
<p>If someone said something racially insensitive or offensive (and there have been multiple instances), that was always a battle I had to fight on my own. And to be honest, sometimes I didn’t fight because I knew no one would give a damn and the person would get away with it with a slap on the wrist.</p>
<h3>Remembering to Joy</h3>
<p>So in the mist of all of this, no matter how upset, beaten-up and angry I felt after a work day, I could always come back to my love for the metal music genre. I would spend so much time listening to new metal music after work that co-workers nicknamed me “the DJ”. Which isn’t completely untrue. In college, one of my extracurriculars was to host a weekly metal radio show on the college radio station. But I didn’t have that anymore so I essentially felt a bit lost.</p>
<p>That’s when I decided to get it back! Not in the form of an actual radio show. But in the form of a metal music blog. Outside of having played around with making marque-filled pages on GeoCities and changing the backgrounds of my MySpace and Xanga profiles to be neon-colored or highly pixelated images, I didn’t have any experience making a website. So I GOOGLED it! And in that research I learned how hosting providers work and the best blogging platform for me to use for my blog. And that platform was WordPress. So in 2015, I launched my first website ever on WordPress: <a href="http://metalandcoffee.com/">metalandcoffee.com</a>. And this point I didn’t really know anything super WordPress-nerdy outside of being able to select a theme and add/organize content on the navigation bar. But I finally had my own voice live and anyone can see it!</p>
<h3>Looking Deep</h3>
<p>Now &#8211; the year was 2017 and words cannot describe how miserable I am in my current work position. With the toll of my mom&#8217;s passing still weighing heavily on my heart,  I thought transferring to a position within the company that brought me back to Philadelphia would help my pain and suffering. However, it only numbed it for a couple months. I still didn’t like the environment, I didn’t like what I was doing, and although I was able to look at the occasional code snippet that would give me a spark of confidence when I understood what the code was doing, I wasn’t given an opportunity to be on the other side. This is what lit a fire under me to finally do everything in my power to move towards a developer career. I felt like that was where I was supposed to be. Sure, I was told that I wasn’t smart enough to be anywhere near code but why did it excite me to see it and recognize it? Why was I able to troubleshoot errors even though I wasn’t a developer? Why was I excelling at quality assuring software by being able to understand the code’s logic thus thinking of scenarios that were unaccounted for?</p>
<h3>Breaking Through</h3>
<p>So I signed up for a couple online courses focused on web development and eventually found myself having been accepted to <a href="http://www.interactivemechanics.com/fellowship">a front-end developer fellowship program</a> that provided me with an amazing mentor and a final project to work towards. For my final project, I chose to learn how to create a custom WordPress theme for my Metal &amp; Coffee website because the current one that I was using did not fully suite my needs.</p>
<blockquote><p>And there you have it &#8211; throughout the next 9 months, the doubt and shame instilled in me since college kept coming up and I kept having to find ways to break through it whether it’d be a pep talk from my mentor, talking to developers who look like me (black women) or using meditation to help me through the anxiety.</p></blockquote>
<p>And by the end of that, not only did I finish my final project (<a href="http://metalandcoffee.github.io">http://metalandcoffee.github.io</a>) and come to really love WordPress theming, I got a job offer from Tracy Levesque and Mia Levesque to work at their WordPress web agency, <a href="https://www.yikesinc.com/">Yikes Inc.</a></p>
<h3>Finding My Place</h3>
<p>Now, I’m a full-time WordPress developer and I couldn’t be more satisfied. Working at Yikes has sent my developer skills soaring over mountains and valleys. My curiosity is allowed to run wild and I’ve actually been diving into the plugin world, completely re-coding an internal plugin from the ground up and learning essential web programming practices in the process.</p>
<p>My next goal in the WordPress community is to see more WordPress developers who look like me. And one step I’ve taken to achieve that goal is to co-teach a Intro to WordPress workshop at <a href="http://codelandconf.com/">Codeland 2018</a> which I’m very excited (and nervous) for. I will continue to be as visible and outspoken as possible to encourage diversity and inclusive <em>(and metalheads)</em> in this community.</p>
<div class="rtsocial-container rtsocial-container-align-right rtsocial-horizontal"><div class="rtsocial-twitter-horizontal"><div class="rtsocial-twitter-horizontal-button"><a title="Tweet: Believe In Yourself" class="rtsocial-twitter-button" href="https://twitter.com/share?text=Believe%20In%20Yourself&via=heropress&url=https%3A%2F%2Fheropress.com%2Fessays%2Fbelieve-in-yourself%2F" rel="nofollow" target="_blank"></a></div></div><div class="rtsocial-fb-horizontal fb-light"><div class="rtsocial-fb-horizontal-button"><a title="Like: Believe In Yourself" class="rtsocial-fb-button rtsocial-fb-like-light" href="https://www.facebook.com/sharer.php?u=https%3A%2F%2Fheropress.com%2Fessays%2Fbelieve-in-yourself%2F" rel="nofollow" target="_blank"></a></div></div><div class="rtsocial-linkedin-horizontal"><div class="rtsocial-linkedin-horizontal-button"><a class="rtsocial-linkedin-button" href="https://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fheropress.com%2Fessays%2Fbelieve-in-yourself%2F&title=Believe+In+Yourself" rel="nofollow" target="_blank" title="Share: Believe In Yourself"></a></div></div><div class="rtsocial-pinterest-horizontal"><div class="rtsocial-pinterest-horizontal-button"><a class="rtsocial-pinterest-button" href="https://pinterest.com/pin/create/button/?url=https://heropress.com/essays/believe-in-yourself/&media=https://heropress.com/wp-content/uploads/2018/01/012418-150x150.jpg&description=Believe In Yourself" rel="nofollow" target="_blank" title="Pin: Believe In Yourself"></a></div></div><a rel="nofollow" class="perma-link" href="https://heropress.com/essays/believe-in-yourself/" title="Believe In Yourself"></a></div><p>The post <a rel="nofollow" href="https://heropress.com/essays/believe-in-yourself/">Believe In Yourself</a> appeared first on <a rel="nofollow" href="https://heropress.com">HeroPress</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 24 Jan 2018 13:00:37 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Ebonie Butler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:73:"WPTavern: New Toolkit Simplifies the Process of Creating Gutenberg Blocks";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:29:"https://wptavern.com/?p=77521";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:84:"https://wptavern.com/new-toolkit-simplifies-the-process-of-creating-gutenberg-blocks";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4420:"<p><a href="https://ahmadawais.com/">Ahmad Awais</a>, who <a href="https://wptavern.com/gutenberg-boilerplate-demonstrates-how-to-build-custom-blocks">created the Gutenberg Boilerplate</a> last year, has <a href="https://ahmadawais.com/create-guten-block-toolkit/">released</a> a <a href="https://github.com/ahmadawais/create-guten-block">Guten Block Toolkit</a>. The toolkit substantially simplifies the creation of Gutenberg Blocks by providing no configuration, one dependency, and no lock-in.</p>



<p>Awais created the toolkit after receiving feedback that configuring things like Webpack, React, ES 6/7/8/Next, ESLint, Babel and keeping up with their development was too difficult.</p>



<p>"Developers told me that they built Gutenberg blocks with ES5 because the amount of time required to configure, set up, and learn tools like Babel, Webpack, ESLint, Prettier, etc. wasn’t worth it," Awais said.<br /></p>



<p>"So, yes! I went ahead and built a solution — a zero-config-js #0CJS WordPress developers’ toolkit called create-guten-block!"</p>



<p>Creating blocks using the toolkit is a three-step process. <br /></p>



<p>Developers begin by installing Node version 8 or higher on a local server. The next step is to run the create-guten-block command and provide a name for the plugin that will be created. This command also creates the folder structure necessary to maintain the project. The last step is to run the NPM start command which runs the plugin in development mode.</p>



<p>Once these steps are completed, the WordPress plugin will be compatible with Gutenberg and have React.js, ES 6/7/8/Next, and Babel, which also has ESLint configurations for code editors to detect and use automatically. <br /></p>



<p>The Guten Block Toolkit comes with the following:</p>



<ul>
    <li>React, JSX, and ES6 syntax support.<br /> </li>
    <li>Webpack dev/production build process behind the scene.<br /> </li>
    <li>Language extras beyond ES6 like the object spread operator.<br /> </li>
    <li>Auto-prefixed CSS, so you don’t need -webkit or other prefixes.<br /> </li>
    <li>A build script to bundle JS, CSS, and images for production with source-maps.<br /> </li>
    <li>Hassle-free updates for the above tools with a single dependency cgb-scripts.</li>
</ul>



<p>The project has received positive feedback, including from members of Gutenberg&#x27;s development team.</p>




    <blockquote class="twitter-tweet"><p lang="en" dir="ltr">Mad props to <a href="https://twitter.com/MrAhmadAwais?ref_src=twsrc%5Etfw">@MrAhmadAwais</a> for making a super useful Gutenberg tool that I''ve been really looking forward to! 🎉<br /><br />I''m excited about the possibilities for this, and I love how it''s embraced WordPress'' "decisions, not options" philosophy, doing all of the hard work for you. 💪💯 <a href="https://t.co/hUAQVDL7S1">https://t.co/hUAQVDL7S1</a></p>&mdash; Gary (@GaryPendergast) <a href="https://twitter.com/GaryPendergast/status/954559771910193152?ref_src=twsrc%5Etfw">January 20, 2018</a></blockquote>





    <blockquote class="twitter-tweet"><p lang="en" dir="ltr">Tried the <a href="https://t.co/WkvhwSVBh6">https://t.co/WkvhwSVBh6</a> from <a href="https://twitter.com/MrAhmadAwais?ref_src=twsrc%5Etfw">@MrAhmadAwais</a>, had a block within a minute. Now it''s time to finish the <a href="https://twitter.com/hashtag/Gutenberg?src=hash&ref_src=twsrc%5Etfw">#Gutenberg</a> course from <a href="https://twitter.com/zgordon?ref_src=twsrc%5Etfw">@zgordon</a> to actually build something useful :D</p>&mdash; Igor Benić (@igorbenic) <a href="https://twitter.com/igorbenic/status/955539392273281025?ref_src=twsrc%5Etfw">January 22, 2018</a></blockquote>




<p>With a stable release now available to the public, Awais is working on <a href="https://github.com/ahmadawais/create-guten-block/issues/11">2.0.0</a>. "The next step is to get this toolkit tested and mature the entire app to release version 2.0.0 for that not only do I need your <a href="https://ahmadawais.com/contact/">support</a>, I ask that you hop on board and contribute — that’s the only way forward," he said.</p>



<p>Create Guten Block Toolkit is <a href="https://github.com/ahmadawais/create-guten-block/blob/master/LICENSE">MIT licensed</a> and available for free <a href="https://github.com/ahmadawais/create-guten-block">on GitHub</a>. Contributions are welcomed! </p>



<p></p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 24 Jan 2018 03:30:09 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:97:"WPTavern: Free Conference Dedicated to WordPress in Higher Ed Takes Place January 30th at 9AM CST";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:29:"https://wptavern.com/?p=77514";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:108:"https://wptavern.com/free-conference-dedicated-to-wordpress-in-higher-ed-takes-place-january-30th-at-9am-cst";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1380:"<p>If you&#8217;re interested in learning how WordPress is used in Higher Ed, tune in to <a href="https://online.wpcampus.org/">WPCampus Online</a>, January 30th at 9AM Central Standard Time. WPCampus Online is a virtual conference that people can watch for free, no traveling necessary. The event uses <a href="https://www.crowdcast.io/">Crowdcast</a> allowing viewers to switch between rooms, interact with each other, and ask questions.</p>
<p>Some of the topics that <a href="https://online.wpcampus.org/schedule/">will be presented</a> include, <a href="https://online.wpcampus.org/schedule/wordpress-and-real-world-data-with-students/">WordPress and Real-World Data with Students</a>, <a href="https://online.wpcampus.org/schedule/headless-brainless-wordpress/">Headless and Brainless WordPress</a>, and <a href="https://online.wpcampus.org/schedule/using-wordpress-support-run-student-government-elections/">Using WordPress to Support and Run Student Government Elections</a>. If in-person conferences are more your style, keep an eye out for information on WPCampus 2018 tentatively planned for this Summer.</p>
<p>To learn more about WPCampus and the people behind it, <a href="https://wptavern.com/wpweekly-episode-301-wordpress-in-highered-accessibility-and-more-with-rachel-cherry">listen to our interview</a> with Rachel Cherry on episode 301 of WordPress Weekly.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 22 Jan 2018 22:14:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:70:"Mark Jaquith: How I fixed Yoast SEO sitemaps on a large WordPress site";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:40:"http://markjaquith.wordpress.com/?p=5392";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:102:"https://markjaquith.wordpress.com/2018/01/22/how-i-fixed-yoast-seo-sitemaps-on-a-large-wordpress-site/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4852:"<p>One of my Covered Web Services clients recently came to me with a problem: <a href="https://yoast.com/wordpress/plugins/seo/">Yoast SEO</a> sitemaps were broken on their largest, highest-traffic WordPress site. Yoast SEO breaks your sitemap up into chunks. On this site, the individual chunks were loading, but the sitemap index (its &#8220;table of contents&#8221;) would not load, and was giving a timeout error. This prevented search engines from finding the individual sitemap chunks.</p>
<p>Sitemaps are really helpful for providing information to search engines about the content on your site, so fixing this issue was a high priority to the client! They were frustrated, and confused, because this was working just fine on their other sites.</p>
<p>Given that this site has over a decade of content, I figured that Yoast SEO&#8217;s dynamic generation of the sitemap was simply taking too long, and the server was giving up.</p>
<p>So I increased the site&#8217;s various timeout settings to 120 seconds.</p>
<p><strong>No good.</strong></p>
<p>I increased the timeout settings to 300 seconds. Five whole minutes!</p>
<p><strong>Still no good.</strong></p>
<p>This illustrates one of the problems that WordPress sites can face when they accumulate a lot of content: <strong>dynamic processes start to take longer</strong>. A process that takes a reasonable 5 seconds with 5,000 posts might take 100 seconds with 500,000 posts. I could have eventually made the Yoast SEO sitemap index work if I increased the timeout high enough, but that wouldn&#8217;t have been a good solution.</p>
<ol>
<li>It would have meant increasing the timeout settings irresponsibly high, leaving the server potentially open to abuse.</li>
<li>Even though it is search engines, not people, who are requesting the sitemap, it is unreasonable to expect them to wait over 5 minutes for it to load. They&#8217;re likely to give up. They might even penalize the site in their rankings for being slow.</li>
</ol>
<p>I needed the sitemap to be reliably generated without making the search engines wait.</p>
<p><strong>When something intensive needs to happen reliably on a site, look to the command line.</strong></p>
<h2>The Solution</h2>
<p>Yoast SEO doesn&#8217;t have <a href="http://wp-cli.org/">WP-CLI</a> (WordPress command line interface) commands, but that doesn&#8217;t matter — you can just use <a href="https://developer.wordpress.org/cli/commands/eval/"><b>wp eval</b></a> to run arbitrary WordPress PHP code.</p>
<p>After a little digging through the <a href="https://github.com/Yoast/wordpress-seo/blob/46802dbcf8e7d2ac0d6552f4de0923cd0eba2b07/inc/sitemaps/class-sitemaps.php#L345-L364">Yoast SEO code</a>, I determined that this WP-CLI command would output the index sitemap:</p>
<pre class="brush: bash; title: ; notranslate">wp eval ''
$sm = new WPSEO_Sitemaps;
$sm-&gt;build_root_map();
$sm-&gt;output();
''</pre>
<p>That took a good while to run on the command line, but that doesn&#8217;t matter, because I just set a <a href="https://help.ubuntu.com/community/CronHowto">cron job</a> to run it once a day and save its output to a static file.</p>
<pre class="brush: plain; title: ; notranslate">0 3 * * * cd /srv/www/example.com &amp;&amp; /usr/local/bin/wp eval ''$sm = new WPSEO_Sitemaps;$sm-&gt;build_root_map();$sm-&gt;output();'' &gt; /srv/www/example.com/wp-content/uploads/sitemap_index.xml</pre>
<p>The final step that was needed was to modify a rewrite in the site&#8217;s Nginx config that would make the <b>/sitemap_index.xml</b> path point to the cron-created static file, instead of resolving to Yoast SEO&#8217;s dynamic generation URL.</p>
<pre class="brush: plain; highlight: [4]; title: ; notranslate">location ~ ([^/]*)sitemap(.*).x(m|s)l$ {
    rewrite ^/sitemap.xml$ /sitemap_index.xml permanent;
    rewrite ^/([a-z]+)?-?sitemap.xsl$ /index.php?xsl=$1 last;
    rewrite ^/sitemap_index.xml$ /wp-content/uploads/sitemap_index.xml last;
    rewrite ^/([^/]+?)-sitemap([0-9]+)?.xml$ /index.php?sitemap=$1&amp;sitemap_n=$2 last;
}</pre>
<p>Now the sitemap index loads instantly (because it&#8217;s a static file), and is kept up-to-date with a reliable background process. The client is happy that they didn&#8217;t have to switch SEO plugins or install a separate sitemap plugin. Everything just works, thanks to a little bit of command line magic.</p>
<p>What other WordPress processes would benefit from this kind of approach?</p>
<hr />
<p><b>Do you need <a href="https://coveredwebservices.com/">WordPress services?</a></b></p>
<p>Mark runs <a href="https://coveredwebservices.com/">Covered Web Services</a> which specializes in custom WordPress solutions with focuses on security, speed optimization, plugin development and customization, and complex migrations.</p>
<p>Please reach out to start a conversation!</p>
[contact-form]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 22 Jan 2018 15:15:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Mark Jaquith";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"Matt: R.I.P Dean";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:22:"https://ma.tt/?p=47840";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:33:"https://ma.tt/2018/01/r-i-p-dean/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3493:"<p>Dean Allen, a web pioneer and good man, has passed away. I&#x27;ve been processing the news for a few days and still don&#x27;t know where to begin. Dean was a writer, who wrote the software he wrote on. His websites were crafted, designed, and typeset so well you would have visited them even if they were filled with Lorem Ipsum, and paired with his writing you were drawn into an impossibly rich world. His blog was called Textism, and among many other things it introduced me to the art of typography.</p>



<p>Later, he created Textpattern, without which WordPress wouldn&#x27;t exist. Later, he created Textdrive with Jason Hoffman, without which WordPress wouldn&#x27;t have found an early business model or had a home on the web. He brought a care and craft to everything he touched that inspires me to this day. As <a href="https://daringfireball.net/2018/01/dean_allen">John Gruber said</a>, "Dean strove for perfection and often achieved it." (Aside: Making typography better on the web led John Gruber to release Smarty Pants, Dean a tool called Textile, and myself something called Texturize all within a few months of each other; John continued his work and created Markdown, I put Texturize into WP, and Dean released Textile in Textpattern.)</p>



<p>Years later, we became friends and shared many trips, walks, drinks, and meals together, often with Hanni and <a href="https://om.co/2018/01/18/dean-allen-rest-in-peace/">Om</a>. (When we overlapped in Vancouver he immediately texted "I&#x27;ll show you some butt-kicking food and drink.") His zest for life was matched with an encyclopedic knowledge of culture and voracious reading (and later podcast listening) habits. I learned so much in our time together, a web inspiration who turned for me into a real-life mensch. He was endlessly generous with his time and counsel in design, prose, and fashion. I learned the impossibly clever sentences he wrote, that you assumed were the product of a small writing crew or at least a few revisions, came annoyingly easily to him, an extension of how he actually thought and wrote and the culmination of a lifetime of telling stories and connecting to the human psyche.</p>



<p>Dean, who (of course) was also a great photographer, didn&#x27;t love having his own photo taken but would occasionally tolerate me when I pointed a camera at him <a href="https://om.co/2018/01/18/dean-allen-rest-in-peace/">and Om has a number of the photos on his post</a>. There&#x27;s one that haunts me: before getting BBQ we were at his friend&#x27;s apartment in Vancouver, listening to Mingus and enjoying hand-crafted old fashioneds with <a href="https://ma.tt/files/2018/01/IMG_7147.jpg">antique bitters</a>, and despite the rain we went on the roof to see the art that was visible from there. He obliged to a photo this time though and we took photos of each other individually in front of a sign that said "EVERYTHING IS GOING TO BE ALRIGHT." It wasn&#x27;t, but it&#x27;s what I imagine Dean would say right now if he could.</p>



<div class="wp-block-gallery alignnone columns-2 is-cropped">
    <img src="https://i2.wp.com/ma.tt/files/2018/01/IMG_7151.jpg?w=604&ssl=1" />
    <img src="https://i0.wp.com/ma.tt/files/2018/01/IMG_7158.jpg?w=604&ssl=1" />
</div>



<img src="https://i1.wp.com/ma.tt/files/2018/01/104050690_ce98a95092_o.jpg?w=604&ssl=1" />
    When we first met, in 2006, <a href="https://www.flickr.com/photos/textdriveinc/104050690/in/photostream/">from Jason</a>.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 19 Jan 2018 05:21:34 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:100:"WPTavern: WPWeekly Episode 301 – WordPress in HigherEd, Accessibility, and More With Rachel Cherry";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:58:"https://wptavern.com?p=77497&preview=true&preview_id=77497";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:105:"https://wptavern.com/wpweekly-episode-301-wordpress-in-highered-accessibility-and-more-with-rachel-cherry";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2840:"<p>In this episode, <a href="http://jjj.me">John James Jacoby</a> and I are joined by <a href="https://bamadesigner.com/">Rachel Cherry</a>, Senior Software Engineer for <a href="http://www.disneyinteractive.com/">Disney Interactive</a> and Director of <a href="https://wpcampus.org/">WPCampus</a>. Cherry describes how she got involved with WordPress, its use in higher education, the inspiration behind WPCampus, and her thoughts on accessibility both in WordPress and across the web. She also assigned everyone the following homework assignment.</p>
<blockquote class="twitter-tweet">
<p lang="en" dir="ltr">Per my interview on <a href="https://twitter.com/hashtag/WordPress?src=hash&ref_src=twsrc%5Etfw">#WordPress</a> Weekly, I’ve assigned everyone <a href="https://twitter.com/hashtag/accessibility?src=hash&ref_src=twsrc%5Etfw">#accessibility</a> homework: open your website and navigate using ONLY THE KEYBOARD. Can you access all content and functionality? Can you open AND close popups? Let me know what you learned.</p>
<p>&mdash; Rachel Cherry (@bamadesigner) <a href="https://twitter.com/bamadesigner/status/953742847831818240?ref_src=twsrc%5Etfw">January 17, 2018</a></p></blockquote>
<p></p>
<p>If you want to learn how WordPress is being used in higher education, tune in to<a href="https://online.wpcampus.org/"> WPCampus Online</a> Tuesday, January 30, 2018. Viewers will be able to watch sessions and interact with the speakers for free. Near the end of the show, Jacoby provides a review of the Nintendo Switch he received for Christmas.</p>
<h2>Stories Discussed:</h2>
<p><a href="https://make.wordpress.org/core/2018/01/12/whats-new-in-gutenberg-12th-january/">Gutenberg 2.0 Released</a><br />
<a href="https://wptavern.com/wordpress-4-9-2-patches-xss-vulnerability">WordPress 4.9.2 Patches XSS Vulnerability</a><br />
<a href="https://wptavern.com/zac-gordon-launches-gutenberg-development-course-includes-more-than-30-videos">Zac Gordon Launches Gutenberg Development Course, Includes More Than 30 Videos</a></p>
<h2>Picks of the Week:</h2>
<p><a href="https://pippinsplugins.com/2017-in-review/">Pippin Williamson&#8217;s 2017 Year in Review</a></p>
<h2>WPWeekly Meta:</h2>
<p><strong>Next Episode:</strong> Wednesday, January 24th 3:00 P.M. Eastern</p>
<p>Subscribe to <a href="https://itunes.apple.com/us/podcast/wordpress-weekly/id694849738">WordPress Weekly via Itunes</a></p>
<p>Subscribe to <a href="https://www.wptavern.com/feed/podcast">WordPress Weekly via RSS</a></p>
<p>Subscribe to <a href="http://www.stitcher.com/podcast/wordpress-weekly-podcast?refid=stpr">WordPress Weekly via Stitcher Radio</a></p>
<p>Subscribe to <a href="https://play.google.com/music/listen?u=0#/ps/Ir3keivkvwwh24xy7qiymurwpbe">WordPress Weekly via Google Play</a></p>
<p><strong>Listen To Episode #301:</strong><br />
</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 18 Jan 2018 02:42:56 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:62:"WPTavern: DesktopServer 3.8.4 Includes A Gift to the Community";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:29:"https://wptavern.com/?p=77259";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:73:"https://wptavern.com/desktopserver-3-8-4-includes-a-gift-to-the-community";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2204:"<p>DesktopServer <a href="https://serverpress.com/announcing-desktopserver-v3-8-4/">has released</a> version 3.8.4 of its local development software. This version includes a lot of refactored code, setting the foundation for faster updates in the future along with design-time plugins.</p>



<p>One of the major changes in 3.8.4 is the use of the .dev.cc top level domain.</p>



<blockquote class="wp-block-quote">
    <p>Due to the latest changes with the .dev Top Level Domain and the fact that many browsers now force SSL on anything with the .dev extension, DesktopServer will now use .dev.cc as its TLD extension. This is a legitimate top level domain owned by ServerPress, LLC and will ONLY be used for local development purposes.</p><cite><a href="https://serverpress.com/announcing-desktopserver-v3-8-4/">Release Announcement Post</a></cite></blockquote>



<p>Marc Benzakein says the domain will work no matter which local development solution is being used and that it&#x27;s a gift to the community. Other domains such as .test will continue to work as expected. </p>



<p>Other improvements include speed optimizations for Windows installs, a Windows compatibility plugin to fix long filename problems when updating from third-party plugin repositories such as Easy Digital Downloads, and a WordPress 4.9.1 Blueprint.</p>



<p>If you use an Apple device with a Retina screen or Hi-DPI in Windows, you&#x27;ll likely appreciate the user-interface changes that are vastly improved on high resolution screens. Josh Eby does!</p>




    <blockquote class="twitter-tweet"><p lang="en" dir="ltr">Love the new scaling fix on <a href="https://twitter.com/DesktopServer?ref_src=twsrc%5Etfw">@DesktopServer</a> 3.8.4!  Looks great on my 4K display now. Can''t wait for 3.9 to get released!</p>&mdash; Josh Eby (@josheby) <a href="https://twitter.com/josheby/status/953089139439751168?ref_src=twsrc%5Etfw">January 16, 2018</a></blockquote>




<p>DesktopServer 3.8.4 also includes a number of enhancements for premium service customers. To view these and other notes related to the release, check out <a href="https://serverpress.com/announcing-desktopserver-v3-8-4/">the announcement post</a>. </p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 17 Jan 2018 19:12:14 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:51:"WPTavern: WordPress 4.9.2 Patches XSS Vulnerability";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:29:"https://wptavern.com/?p=77438";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"https://wptavern.com/wordpress-4-9-2-patches-xss-vulnerability";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1106:"<p>WordPress 4.9.2 has been released and patches a cross-site scripting vulnerability in the Flash fallback files in the MediaElement library. <a href="https://wordpress.org/news/2018/01/wordpress-4-9-2-security-and-maintenance-release/">According to Ian Dunn</a>, the Flash files are rarely needed and have been removed from WordPress.</p>



<p>If you need access to the Flash fallback files, they can be obtained using the <a href="https://wordpress.org/plugins/mediaelement-flash-fallbacks/">MediaElement Flash Fallback</a> plugin. <a href="https://opnsec.com">Enguerran Gillier</a> and <a href="https://widiz.com/">Widiz</a> are credited with responsibly disclosing the vulnerability. ﻿</p>



<p>In addition to the patch, this releases fixes 21 bugs. JavaScript errors that prevented saving posts in Firefox has been fixed and switching themes will attempt to restore previous widget assignments, even if no sidebars exist.</p>



<p>You can view detailed information about the changes in 4.9.2 by <a href="https://codex.wordpress.org/Version_4.9.2">reading the following Codex article</a>. </p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 17 Jan 2018 09:19:39 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:37:"HeroPress: Growing WordPress in India";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:56:"https://heropress.com/?post_type=heropress-essays&p=2406";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:120:"https://heropress.com/essays/growing-wordpress-india/#utm_source=rss&utm_medium=rss&utm_campaign=growing-wordpress-india";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:18327:"<img width="960" height="480" src="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2018/01/011718-1024x512.jpg" class="attachment-large size-large wp-post-image" alt="Pull Quote: The world will know you for the path you have chosen." /><h3>Preface</h3>
<p>I was one of the first batch of participants in the initial version of HeroPress, which was video stories but I backed out due to multiple reasons. But, I’m glad HeroPress has survived in this current avatar, telling some really interesting stories of some real wonderful people. Few of whom I’ve had the pleasure of calling friends.</p>
<p><a href="https://heropress.com/about/">Topher</a> has umpteen number of times asked me to write my HeroPress story and I have always either given excuses or deadlines that I never planned on meeting. The few times that I did start writing this article I went into too much of a deep dive into my life story (that I never finished it&#8230;) which is quite the rollercoaster from having failed Std.10th (high School) in English or dropping out in College to having guest lectured(teaching WordPress, of course) in one of the biggest B-schools in India OR my work experience which includes Film, TV, dealing cards to even working as an assistant to the Union Minister of India for Youth Affairs and sports… There I go again!! While that does make for a good story I should save it for when you buy me a beer.</p>
<p>I wanted my HeroPress article to tell a story of how our WordPress Community is truly open source and always open for everyone’s participation. I think this version does the Job. Also would like to thank <a href="https://profiles.wordpress.org/andreamiddleton">Andrea Middleton </a>and <a href="https://twitter.com/adityakane?lang=en">Aditya Kane</a> who have been the most supportive of my efforts all these years. Last but not the least I’d like to thank Topher for this great space he has created and being a true friend with whom I could share some of my troubles.</p>
<p>I am <a href="https://twitter.com/gounder?lang=en">Alexander Gounder</a>, somewhat of a nobody who become somebody not only because I tried but also because WordPress is open enough to allow it and this is my story!</p>
<h3>Background</h3>
<p>I was born in a lower middle class household in Mumbai, India. I am the middle kid among three siblings. My Father works as a tailor in Saudi Arabia and visits every few years. My Mother is a strong willed woman, who would fight the world for her kids which was evident when she refused to listen to doctors that my sister who suffers from Cerebral Palsy be sent to Special school and instead went pillar to post to get her to study in her normal school, even if it meant that she had to wait outside class during school hours (in case my sister had to go to the restroom) or carry my sister (who then was about 8 yrs old) around.</p>
<blockquote><p>I live where 70%, if not more, of Mumbai’s population lives the slum or <a href="https://en.wikipedia.org/wiki/Chawl">chawls</a> in the suburbs.</p></blockquote>
<p>So I’ve lived through the hunger for a day when I lost <u title="15 cents USD">Rs.10</u> on my way to buy bread, this was during the Gulf war when my father couldn’t send us any money for months; I’ve lived through the darkness of when there our frequent power cuts and still the power companies claim that there isn’t any load shedding in this city; I’ve lived through the annual ritual of walking in knee deep water to school, then college and now work as Monsoon water, thanks to clogged drains finds its way to the empty plot between our chawl and the main road.</p>
<p>In terms of education I was an above average student but somehow managed to fail my Std. 10 board exams (this is a very important milestones in the Indian education system). Failure has been my stepping stone to success. I learnt computers as I had free time because I had to wait six months for joining college. I got a job at a local cyber cafe which was run by a linux enthusiast, this was my introduction to Free and Open Source. Post that I attended college (but didn’t graduate) and had many jobs (I’ve been working since I was 17, almost 50% of my lifetime).</p>
<p>To conclude, the point I’m trying to make here is, I don’t come from a lot of money or have a lot in terms of education qualifications in spite of which I was able to do everything I did in the WordPress Community here in Mumbai and India at large.</p>
<h3>My first WordCamp</h3>
<p>I was an attendee at the first WordCamp in Mumbai in 2012. I was pretty excited about attending it, because only a few days before I saw a video from WordCamp San Francisco. I thought the idea of having a conference about WordPress was super cool. Though the tickets seemed a little expensive, I had just started freelancing and wasn’t attending events yet, so didn’t really have any benchmarks and thought it was worth it as this was an International/official event.</p>
<p>My excitement was short lived when talks were sponsor pitches or mostly not about WordPress. The arrangements too weren’t as expected. During a session that was delayed by over 45 mins because the speaker and his connectivity problems (which could have been resolved by just using another machine), I lost my cool and walked out, one of the volunteers struck a conversation with me where I began by complaining about the arrangements and wanted to speak with the organizers to complain, but anger turned to sympathy when I realized that these student volunteers were in fact the event organizers, with that fact in mind even putting together this event was a great achievement. I probed further trying to understand where things were going wrong, checked what they paid for the t-shirts, it was about 30-40% higher than market price, asked if everyone paid the sponsor amount listed on the site, they said &#8211; many had bargained for upto 50% less than the published sponsor slab and some agreed with speaker slots thrown in. I asked how many tickets they sold and was informed free tickets were distributed in their colleges and to some of their partners. Partners? These were a few individuals who in the guise of helping these kids organize WordCamp had brokered deals that got sponsors discounts and/or speaker slots, free tickets (over 50) for friends / colleagues / employees, speaker slots for themselves and even their companies or brands as in kind sponsors.</p>
<p>On the second day, things went to a confrontational stage with many (who paid to attend the event) questioning the Non-WordPress talks and long twitter threads ensued. While it is easy to blame the organizers of the WC Mumbai 2012, I think it was those few selfish individuals who weren’t part of the organizing team but tried to influence them while offering to help.</p>
<p>This showed there was a need for the Indian WordPress Community to come together so we started a small buddypress website which was inundated with spam registrations hence replaced it with a <a href="https://www.facebook.com/groups/JaiWP/">FB group</a>.</p>
<p>This WordPress India FB group helped us co-ordinate our first meetup in Jan 2013.</p>
<h3>Visiting Other WordCamps</h3>
<p>While talking to others about bringing WordPress enthusiasts from all over India, I got a sense there&#8217;s mostly mistrust among people involved in WordCamps and those attending or speaking at it. That&#8217;s when something I read on plan.wordcamp.org struck me, it said that sponsoring a WordCamp is a great way to contribute and give back. So I sponsored the next WordCamp in India, WC Baroda. When asked what is the sponsoring brand, I named our BuddyPress website. Little did I realise that this helped others see I was genuinely interested in bringing people together than make a quick buck or get publicity for myself.</p>
<p>While the next few WordCamps were better than my experience at WC Mumbai 2012, but they shared some common threads, in terms of the people who spoke there, or how there was no clarity in terms of how speakers were selected. I had even applied to speak at a WordCamp through FB chat, because that&#8217;s how the organiser was handling it. To my disappointment I sat through a session at that WordCamp with someone from automattic presenting exactly what I had proposed, later to be told by the speaker that he didn&#8217;t intend to speak and this was a topic proposed by the organisers.</p>
<blockquote><p>I was disgusted by how these WordCamps were filled with shady underhand deals and zero transparency. While WordCamps had some set of guidelines and expectations, these organizers knowingly or unknowingly followed none of them.</p></blockquote>
<p>At that point of time, the idea of organising a WordCamp in Mumbai came to mind too, but then what if I would end up doing the same as what was already happening was the only thing that stopped me from applying for a WordCamp.</p>
<h3>Moment of truth</h3>
<p>WordPress turned 10, and there were meetups organised everywhere and with a little confusion we too managed to organise a meet-up at a coffee shop, here the attendees weren&#8217;t people who we normally meet at WordCamps but regular WordPress users who discovered the meetup through WordPress.org. They had some amazing stories to tell about their association with the software &#8211; I met Manish who 80k downloads for his theme on WordPress.org or Sachin who had been blogging since ‘98 even before WordPress.</p>
<p>So I realised the Meetups and WordCamps weren&#8217;t really reaching most WordPress users within our own neighborhood, these users were equally passionate about WordPress and they too wanted to have real world meetups to meet others like them.</p>
<h3>Then how did we do it</h3>
<h4>We not I</h4>
<p>While “I” claim to have broken WordCamps in India, I couldn’t have done it alone. Right from the beginning I started asking other to join and help out, because we were at the end of the day trying to build a community and that couldn’t be done alone. At first it was Aditya, then we had other regular members like Sahil and Vachan join in to help us organize regular meetups.</p>
<p>Getting more stock holders allowed us to bring a different perspective to everything that we were doing. Till then people blocked others from participating as organizers or volunteers because of their own insecurities and used the line that “meetups don’t work in India”. Maybe even peddling that lie to even WordPress Foundation which was then allowing these WordCamps in the hope they would kickstart local. We went the opposite way.</p>
<h4>Persevere</h4>
<p>When we started off with meetups we were told “Meetups don’t work in India”, but this wasn’t true because I was already attending Startup Saturday, a monthly Meetup for startups, Quora had a meetup, Many Bloggers had meetups. So we got started. A few meetups had 10-20 people showing up while others had 2-3 but we didn’t give up on meetups because we were meeting new people which was our end goal. Aditya once remarked that even if he met one new person and discussed WordPress that would be a successful, and has resulted in us having a fairly active meetup with so many different people speaking and attending it.</p>
<h4>Put a little thought</h4>
<p>I became very close friends with Aditya and we spent a lot of time discussing what we were doing here. We were a good cop / bad cop team many times. From our discussion we set up some guidelines for what we stood for inclusiveness and transparency. This was before we had a WordCamp Handbook which guides you through most of the challenges you would face.</p>
<p>We were the first WordCamp in India to publish the code of conduct and make sure it was accessible to everyone, we made repeated announcements on the run-up to the WordCamp and during the WordCamp about this Code of Conduct and how serious we were about following it. We even discussed thing amongst ourselves about handling any complaints about violations of the code of conduct, for e.g. as per Indian law you can’t disclose the identity of a person who is victim of Sexual Harassment and therefore we took care and had a system in place to take complaints and maintain the complainants privacy.</p>
<p>When we did our first WordCamp we tried to have ticket cost as low as possible (<u title="">INR 300</u> or pay more if you’d like) to allow anyone to afford it. ( Fun fact &#8211; WC Mumbai to date has the lowest Avg. ticket price per day among WordCamps in India ).</p>
<blockquote><p>At the first WordCamp Mumbai (2014) organized by our meetup group, I had someone come to me and tell me that he was glad to have attended and missed the last Mumbai WordCamp because the tickets were too expensive and his parents wouldn’t give him that kind of money.</p></blockquote>
<p>This reinforced my view of never making WordCamp tickets too expensive, in fact we picked up what WC Pune 2015 did and started offering Student Discounts among other discounts to aid inclusivity.</p>
<p>During the WordCamp preparation time all vendor information, speaker selection and accounts data was available to all organizers, post WordCamp Mumbai 2014, we published this account on our WordCamp website for everyone to review.</p>
<h4>Focus on Basics</h4>
<p>We want to build a community that shared information and talked about WordPress, So we focused on the basics that included having regular meetups. Even our first WordCamp was very low key in terms of the menu or swag at the event or international speakers or host of sponsors… the things that other used to say if they organized a successful WordCamp. We focused instead on getting good speakers, affordable tickets, reaching out and spreading the message about our WordCamp. Putting in a Processes / Guidelines for speakers selection and so on. We wanted to get the WordCamp right rather than find something that we could brag about, we knew if we delivered on the first we could then brag all we want. Some simple ideas helped us cut cost as we didn’t really have many sponsors For e.g. we had packed lunch packets which bought catering cost to <u title="$2.36">INR 150/day</u> from INR 350 &#8211; 450/day if we would have a simple buffet spread. We did mugs instead of tshirts because the quality ones costed us INR 80 instead of INR 150 for decent quality t-shirts.</p>
<h4>Keeping it open</h4>
<p>We didn’t discriminate amongst attendees or treat someone as more important than others, everyone from the organizing team was approachable and we wanted to help. The meetups too became a welcoming space, we tried to keep a check on behaviour that could harmful or make the space unwelcoming to other. We didn’t shy away from calling out sexist behaviour. We didn’t discriminate amongst people who wanted to volunteer, we have freelancers and students in our team and they are as important as someone who owns an IT firm employing several people.</p>
<h4>What the future holds for us</h4>
<p>Even before WordCamp Central had a rule for allowing a person to be lead organizer only for two consecutive years we had started on planning of grooming the next set of leaders so that, if we decide to become a little inactive meetups and WordCamps would continue as usual.</p>
<p>WordCamp Mumbai in a gist:</p>
<p>As a result of the above I can proudly say that WordCamp Mumbai is oldest actively running WordCamp/meetup group in India having had twice as many WordCamps than any other city.</p>
<p>I would like to leave you with this song which everyone here at our meetup group can Identify with.</p>
<div class="jetpack-video-wrapper"></div>
<p>हमारी ही मुठ्ठी में आकाश सारा (Humari hi mutthi mein akash sara)<br />
जब भी खुलेगी चमकेगा तारा (Jab bhi khulenga chamkenga tara)<br />
कभी ना ढले जो, वो ही सितारा (Kabhi na dale jo, woh hi sitara)<br />
दिशा जिस से पहचाने संसार सारा (Disha jis se pehchane sansaar sara)</p>
<p>These lyrics roughly translate to</p>
<p>We have the skies in our fist. Whenever it opens, a star will shine.</p>
<p>One that never sets will be a Superstar and the world will know you for the path you have chosen.</p>
<div class="rtsocial-container rtsocial-container-align-right rtsocial-horizontal"><div class="rtsocial-twitter-horizontal"><div class="rtsocial-twitter-horizontal-button"><a title="Tweet: Growing WordPress in India" class="rtsocial-twitter-button" href="https://twitter.com/share?text=Growing%20WordPress%20in%20India&via=heropress&url=https%3A%2F%2Fheropress.com%2Fessays%2Fgrowing-wordpress-india%2F" rel="nofollow" target="_blank"></a></div></div><div class="rtsocial-fb-horizontal fb-light"><div class="rtsocial-fb-horizontal-button"><a title="Like: Growing WordPress in India" class="rtsocial-fb-button rtsocial-fb-like-light" href="https://www.facebook.com/sharer.php?u=https%3A%2F%2Fheropress.com%2Fessays%2Fgrowing-wordpress-india%2F" rel="nofollow" target="_blank"></a></div></div><div class="rtsocial-linkedin-horizontal"><div class="rtsocial-linkedin-horizontal-button"><a class="rtsocial-linkedin-button" href="https://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fheropress.com%2Fessays%2Fgrowing-wordpress-india%2F&title=Growing+WordPress+in+India" rel="nofollow" target="_blank" title="Share: Growing WordPress in India"></a></div></div><div class="rtsocial-pinterest-horizontal"><div class="rtsocial-pinterest-horizontal-button"><a class="rtsocial-pinterest-button" href="https://pinterest.com/pin/create/button/?url=https://heropress.com/essays/growing-wordpress-india/&media=https://heropress.com/wp-content/uploads/2018/01/011718-150x150.jpg&description=Growing WordPress in India" rel="nofollow" target="_blank" title="Pin: Growing WordPress in India"></a></div></div><a rel="nofollow" class="perma-link" href="https://heropress.com/essays/growing-wordpress-india/" title="Growing WordPress in India"></a></div><p>The post <a rel="nofollow" href="https://heropress.com/essays/growing-wordpress-india/">Growing WordPress in India</a> appeared first on <a rel="nofollow" href="https://heropress.com">HeroPress</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 17 Jan 2018 02:30:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Alexander Gounder";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:58:"Dev Blog: WordPress 4.9.2 Security and Maintenance Release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://wordpress.org/news/?p=5376";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:84:"https://wordpress.org/news/2018/01/wordpress-4-9-2-security-and-maintenance-release/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3953:"<p>WordPress 4.9.2 is now available. This is a <strong>security and maintenance release</strong> for all versions since WordPress 3.7﻿. We strongly encourage you to update your sites immediately.</p>



<p>An XSS vulnerability was discovered in the Flash fallback files in MediaElement, a library that is included with WordPress. Because the Flash files are no longer needed for most use cases, they have been removed from WordPress.</p>



<p>MediaElement has released a new version that contains a fix for the bug, and <a href="https://wordpress.org/plugins/mediaelement-flash-fallbacks/">a WordPress plugin containing the fixed files</a> is available in the plugin repository.</p>



<p>Thank you to the reporters of this issue for practicing <a href="https://make.wordpress.org/core/handbook/testing/reporting-security-vulnerabilities/">responsible security disclosure</a>: <a href="https://opnsec.com">Enguerran Gillier</a> and <a href="https://widiz.com/">Widiz﻿</a>.</p>



<p>21 other bugs were fixed in WordPress 4.9.2. Particularly of note were:</p>



<ul>
    <li>JavaScript errors that prevented saving posts in Firefox have been fixed.</li>
    <li>The previous taxonomy-agnostic behavior of <code>get_category_link()</code> and <code>category_description()</code> was restored.</li>
    <li>Switching themes will now attempt to restore previous widget assignments, even when there are no sidebars to map.<br /></li>
</ul>



<p>The Codex has <a href="https://codex.wordpress.org/Version_4.9.2">more information about all of the issues fixed in 4.9.2</a>, if you&#x27;d like to learn more.</p>



<p>﻿<a href="https://wordpress.org/download/"></a><a href="https://wordpress.org/download/">Download WordPress 4.9.2</a> or venture over to Dashboard → Updates and click "Update Now." Sites that support automatic background updates are already beginning to update automatically.</p>



<p>Thank you to everyone who contributed to WordPress 4.9.2:</p>



<p><a href="https://profiles.wordpress.org/0x6f0/">0x6f0</a>, <a href="https://profiles.wordpress.org/jorbin/">Aaron Jorbin</a>, <a href="https://profiles.wordpress.org/afercia/">Andrea Fercia</a>, <a href="https://profiles.wordpress.org/aduth/">Andrew Duthie</a>, <a href="https://profiles.wordpress.org/azaozz/">Andrew Ozz</a>, <a href="https://profiles.wordpress.org/blobfolio/">Blobfolio</a>, <a href="https://profiles.wordpress.org/boonebgorges/">Boone Gorges</a>, <a href="https://profiles.wordpress.org/icaleb/">Caleb Burks</a>, <a href="https://profiles.wordpress.org/poena/">Carolina Nymark</a>, <a href="https://profiles.wordpress.org/chasewg/">chasewg</a>, <a href="https://profiles.wordpress.org/chetan200891/">Chetan Prajapati</a>, <a href="https://profiles.wordpress.org/dd32/">Dion Hulse</a>, <a href="https://profiles.wordpress.org/hardik-amipara/">Hardik Amipara</a>, <a href="https://profiles.wordpress.org/ionvv/">ionvv</a>, <a href="https://profiles.wordpress.org/jaswrks/">Jason Caldwell</a>, <a href="https://profiles.wordpress.org/jbpaul17/">Jeffrey Paul</a>, <a href="https://profiles.wordpress.org/jeremyfelt/">Jeremy Felt</a>, <a href="https://profiles.wordpress.org/joemcgill/">Joe McGill</a>, <a href="https://profiles.wordpress.org/johnschulz/">johnschulz</a>, <a href="https://profiles.wordpress.org/juiiee8487/">Juhi Patel</a>, <a href="https://profiles.wordpress.org/obenland/">Konstantin Obenland</a>, <a href="https://profiles.wordpress.org/markjaquith/">Mark Jaquith</a>, <a href="https://profiles.wordpress.org/rabmalin/">Nilambar Sharma</a>, <a href="https://profiles.wordpress.org/peterwilsoncc/">Peter Wilson</a>, <a href="https://profiles.wordpress.org/rachelbaker/">Rachel Baker</a>, <a href="https://profiles.wordpress.org/rinkuyadav999/">Rinku Y</a>, <a href="https://profiles.wordpress.org/sergeybiryukov/">Sergey Biryukov</a>, and <a href="https://profiles.wordpress.org/westonruter/">Weston Ruter</a>.﻿<strong></strong><br /></p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 16 Jan 2018 23:00:14 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"Ian Dunn";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:97:"WPTavern: Gutenberg 2.0 Released With Numerous Accessibility and Keyboard Navigation Improvements";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:29:"https://wptavern.com/?p=77370";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:108:"https://wptavern.com/gutenberg-2-0-released-with-numerous-accessibility-and-keyboard-navigation-improvements";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1337:"<p><a href="https://wordpress.org/plugins/gutenberg/">Gutenberg 2.0</a> is available for testing and includes a <a href="https://wordpress.org/plugins/gutenberg/#developers">changelog</a> that&#x27;s a mile long. Accessibility, keyboard navigation, and the ability to drag-and-drop multiple images to the Gallery block are among the improvements listed.</p>



<p>Clicking the Publish button displays options in the sidebar rather than a drop-down menu to add polish to the publishing flow.<br /></p>



<img src="https://i0.wp.com/wptavern.com/wp-content/uploads/2018/01/PublishButtonSidebarOptions.png?w=627&ssl=1" />
    Publish Button Options In The Sidebar




<p>The Table of Contents has <a href="https://github.com/WordPress/gutenberg/pull/4288">been redesigned</a> to increase readability and copying and pasting has also significantly improved. </p>



<p>Gutenberg 2.0 covers a lot of ground and the changes are too numerous to list here. However, Matias Ventura does a great job <a href="https://make.wordpress.org/core/2018/01/12/whats-new-in-gutenberg-12th-january/">listing the changes</a> with links to Pull Requests on GitHub where people can see how they were made.</p>



<p>If you haven&#x27;t tried or tested <a href="https://wordpress.org/plugins/gutenberg/">Gutenberg</a>, now is a great time to check it out.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 15 Jan 2018 22:48:55 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:17:"Matt: Thirty-Four";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:22:"https://ma.tt/?p=47801";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:34:"https://ma.tt/2018/01/thirty-four/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2257:"<p>I am very thankful and grateful to have made it through the past year, which was a really special one personally and professionally. I learned to open myself up more to relationships, continued aspiring to be clear and direct with <a href="https://ma.tt/2017/01/rebirth-and-yellow-arrows/">yellow arrows</a>, and worked alongside some incredible people to tackle the biggest and hardest problems, whether it was getting plugin and theme support on WP.com or the start and growth of <a href="https://wordpress.org/plugins/gutenberg/">Gutenberg</a>.</p>



<p>I read a <a href="https://ma.tt/2017/12/books-in-2017/">lot more books</a>, traveled 337k miles between 91 cities, spent more time in Texas, kept my health in a good balance with weight training, running, and a better diet including several months of 16/8 intermittent fasting, while still getting in some excellent meals with friends and loved ones (up to 58% of top 50 list). As I&#x27;m solidly in my mid-thirties now, and I want to continue to live by: all things in moderation. I consider what I do with WordPress and Automattic my life&#x27;s work, and hope to continue it as long as I&#x27;m useful. Some days I pinch myself.</p>



<p>Thank you to all of you on this journey with me. I am imperfect but trying my darndest, and I&#x27;m lucky to have friends and colleagues doing the same.</p>



<img src="https://i1.wp.com/ma.tt/files/2018/01/IMG_1232.jpg?w=604&ssl=1" />



<p>Previously: <a href="https://ma.tt/2003/01/bday/">19</a>, <a href="https://ma.tt/2004/01/so-im-20/">20</a>, <a href="https://ma.tt/2005/01/hot-barely-legal-matt/">21</a>, <a href="https://ma.tt/2006/01/matt-22/">22</a>, <a href="https://ma.tt/2007/01/twenty-three/">23</a>, <a href="https://ma.tt/2008/01/twenty-four/">24</a>, <a href="https://ma.tt/2009/01/twenty-five/">25</a>, <a href="https://ma.tt/2010/01/twenty-six/">26</a>, <a href="https://ma.tt/2011/01/twenty-seven/">27</a>, <a href="https://ma.tt/2012/01/twenty-eight/">28</a>, <a href="https://ma.tt/2013/01/twenty-nine/">29</a>, <a href="https://ma.tt/2014/01/matt-3-0/">30</a>, <a href="https://ma.tt/2015/01/thirty-one/">31</a>, <a href="https://ma.tt/2016/01/thirty-two/">32</a>, and <a href="https://ma.tt/2017/01/thirty-three/">33</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 12 Jan 2018 01:55:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:39:"HeroPress: Make It Better, Give It Back";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:56:"https://heropress.com/?post_type=heropress-essays&p=2396";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:116:"https://heropress.com/essays/make-better-give-back/#utm_source=rss&utm_medium=rss&utm_campaign=make-better-give-back";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:13545:"<img width="960" height="480" src="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2018/01/011017-1024x512.jpg" class="attachment-large size-large wp-post-image" alt="Pull Quote: Giving back makes me a better person and allows me to help others become better people." /><p>Recently, technology entrepreneur Anil Dash <a href="https://twitter.com/anildash/status/939137973240696832">tweeted the following question</a>:</p>
<blockquote><p>Who is a person (not counting family) that opened doors for you in your career when they didn&#8217;t have to? Anytime is a good time to show gratitude!</p></blockquote>
<p>If you need a pick-me-up, go and read through the replies and threads that start with Anil&#8217;s question. There are replies from many people who are grateful to others for an unending variety of reasons, some large and immediate, some small and indirect, some that were only realised months or years later.</p>
<p>One commonality between many of the replies is that of selflessness. People who help others without expecting something in return. This prompted me to think about those people who&#8217;ve helped me in my career through their own selflessness, without my prompting, and without their expecting anything in return.</p>
<p>I&#8217;m lucky that several people have helped me in this way. My WordPress story started in around 1998 when, as a fourteen year old living in a house that was one among just sixteen in a forest in the English countryside, my divorced parents saved up and bought me a Windows 98 PC for Christmas. A personal computer was a big expenditure for my parents. We weren&#8217;t able to afford an Internet connection, and at that time I don&#8217;t recall being particularly aware of the Internet. As a result, I took an interesting route into web development.</p>
<p>Windows PCs at the time came bundled with Internet Explorer and promotional material from Internet service providers in HTML files. I wanted to find out how these pages were built, and I discovered Frontpage Express could edit the files, although often with many errors (which years later I attributed to the lack of HTML standards in use).</p>
<blockquote><p>One day my curiosity lead me to the View Source menu in Internet Explorer. <strong>Boom</strong>. What is all this code? What do all these angle brackets do? Is this how web pages are built? Can I change this?</p></blockquote>
<p>Naturally, everything I changed initially broke pages completely. The Undo command was my version control system. I figured out that text wrapped in <code>&lt;b&gt;</code> produced bold text. I hadn&#8217;t a clue how a <code>&lt;table&gt;</code> worked without breaking it. <code>&lt;marquee&gt;</code> ended up everywhere. Poor support for much of the markup in these files made Frontpage redundant. Looking back, I could say that the View Source menu in Internet Explorer was an important part of the progression of my career. Maybe also that of thousands of other web developers. If the inventor and early adopters of the web hadn&#8217;t been strong proponents of open data and information sharing, it&#8217;s possible that the View Source menu would never have existed and the open web would not have flourished to the extent that it has.</p>
<p>(The topic of open access to technology, both software and hardware, can be discussed all day. Consider if Adobe Photoshop would have had the same great commercial success that it did without its widespread piracy leading to an abundance of students leaving school with years of Photoshop experience. But I digress.)</p>
<p>I spent evenings after school hacking on HTML. My older brother Adam gave me a book titled &#8220;How to Create pages for the Web using HTML&#8221; which introduced me to the world of HTML 2.0. I learned about the available tags. I learned about inline CSS, which set me up for learning React twenty years later. And I learned that you can see the source behind any web page, hack on it, and learn from it.</p>
<h3>Getting Online</h3>
<p>I don&#8217;t remember the first web page that I put online when we eventually got Internet access. I doubt it was any good, but what the whole experience did do was help my curiosity grow, to which I&#8217;ve attributed much of my success so far. Being curious about a topic helps enormously when learning, self-teaching, and staying motivated.</p>
<p>I didn&#8217;t attend university, partly due to my excellent high school grades not being followed up by any good college grades (in the UK, there’s two years of sixth form college between high school and university). In hindsight I see that I got bored of state education, and two short years flew by with no time for me to to fix that attitude. Stay in school, kids.</p>
<p>The years after school saw me working barely above minimum wage in a supermarket by day and hacking on web projects at night. I was first introduced to WordPress by <a href="https://profiles.wordpress.org/lumpysimon/">my brother Simon</a> who built websites for customers of his printing business. After a brief period of building my own CMS (everyone&#8217;s done it, right?), I realised there were many advantages to using a free and community built CMS maintained by a relatively large number of people. I started building simple WordPress sites for myself. Along with Simon and his friend Tom, we played around with the idea of a hosted web service to make it even easier for people to publish online using WordPress. The project never went anywhere (hello wordpress.com), but the ideas we explored helped me learn a lot about WordPress.</p>
<blockquote><p>Who is a person (not counting family) that opened doors for you in your career when they didn&#8217;t have to? Anytime is a good time to show gratitude!</p></blockquote>
<p>I can pinpoint the start of my career with WordPress when Tom recommended me to someone who was looking for a WordPress plugin developer. That person, Conor O&#8217;Neill, became one of the people that opened a door for me in my career when they didn&#8217;t have to. Conor was pleased with the plugin work that I did for him, and selflessly passed my name onto several of his friends and acquaintances. He didn&#8217;t need to do that, it didn&#8217;t directly benefit him, but he did it because he knew it would help out his acquaintances and help me to get work.</p>
<h3>Becoming A WordPress Consultant</h3>
<p>I started building WordPress themes and plugins for people that Conor gave my name to. I didn&#8217;t have much experience at the time, but I had the advantage of personal recommendations. It&#8217;s difficult to overstate how valuable a personal recommendation is. All the advertising in the world can be useless when competing against a personal recommendation. If you&#8217;re looking to start or change a career, I recommend asking people to pass your name on to friends and colleagues whenever they can.</p>
<blockquote><p>I&#8217;m one of the lucky ones that got a good start through personal recommendations, and if you can do that too then it&#8217;ll set you up well.</p></blockquote>
<p>Conor passed my name onto a chap named Damien Mulley who was also instrumental in advancing my career by passing my name on when he didn&#8217;t need to. I owe a lot to the selflessness of Conor and Damien.</p>
<p>Around this time I started finding bugs in WordPress (a practice that I continue to this day). Another key point in my career came when I reported a bug on the WordPress bug tracking system, and was greeted with a pleasant welcome. One of the contributors, Lloyd Budd, was kind enough to take the time to explain to me that I could fix the bug myself and submit the fix to the WordPress project. He pointed me to resources for learning Subversion and creating patches. That small act of help lead to me becoming a regular WordPress contributor, and ultimately one of the core developers. Lloyd didn&#8217;t have to use his free time to help others out, but he did, and it had long-reaching impact on my career and on the WordPress project.</p>
<p>After a year of freelancing, I was able to get enough work that I could drop down to part time work at my supermarket job. I worked and self-taught for seventy hours a week for six months. I was afraid of leaving a stable job despite earning three times as much working as a freelance developer, but making that jump felt very scary before I made it. A combination of personal recommendations and working to get a name for myself in the WordPress sphere lead me to leave my supermarket job, freelance for a few years, become the first employee at WordPress agency <a href="https://codeforthepeople.com/">Code for the People</a>, and ultimately to join <a href="https://humanmade.com/">Human Made</a> as a senior WordPress engineer.</p>
<h3>Giving Back</h3>
<p>I’m lucky that I’m able to spend some of my time contributing back to WordPress, and I&#8217;ve been thinking a lot about how the principles of open source apply outside of software. I gave <a href="https://wordpress.tv/2016/05/31/john-blackbourn-rachel-mccollin-and-taco-verdonschot-lightning-sessions/">a short talk at WordCamp London in 2016</a> where I coined the phrase &#8220;<em>Make it better, give it back</em>&#8220;, which is how I interpret the fundamental principles of open source. It’s the idea of improving upon an existing process and giving it back to the community in order to embetter everyone, whether it’s through an open data project such as OpenStreetMap, a community initiative in your local area, or shared learning.</p>
<blockquote><p>Recently I came to realise that the &#8220;<em>it</em>&#8221; in &#8220;<em>Make it better, give it back</em>&#8221; doesn&#8217;t have to refer to the primary aspect of what you&#8217;re contributing to.</p></blockquote>
<p>Lloyd made WordPress better by writing code and giving it back, but he also made WordPress better by improving the knowledge and skills of its community members, many of whom in turn give back in a variety of ways.</p>
<p>Giving back allows me to improve many of my own skills. It allows me to challenge myself, not only technically but also in areas such as communication, compassion, critical thinking, and time management. Giving back makes me a better person and allows me to help others become better people.</p>
<a href="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2018/01/dsc_3097.jpg"><img class="wp-image-2398" src="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2018/01/dsc_3097-768x1024.jpg" alt="John and Francesca" width="350" height="467" /></a>John and Francesca
<p>Giving back has advanced my professional career thanks to the technical and people skills that I learn from it and the recognition gained by my contributions. In turn this has lead to many new friends, a career in a field that I enjoy very much, and it also lead to me finding the love of my life at a WordPress contributor day.</p>
<p>I hope that in one way or another I&#8217;ve given back to many people in the open source community. I&#8217;ve been involved with WordPress for twelve years now, and over those years I&#8217;ve given advice, pointers, and encouragement to others that might seem small or inconsequential at the time but can be just the sort of encouragement that somebody needs. The difference between not receiving a reply to a query, and receiving one which says &#8220;Thanks! That&#8217;s a good start&#8221; might mean the difference between never contributing again versus becoming a decade long community member.</p>
<div class="rtsocial-container rtsocial-container-align-right rtsocial-horizontal"><div class="rtsocial-twitter-horizontal"><div class="rtsocial-twitter-horizontal-button"><a title="Tweet: Make It Better, Give It Back" class="rtsocial-twitter-button" href="https://twitter.com/share?text=Make%20It%20Better%2C%20Give%20It%20Back&via=heropress&url=https%3A%2F%2Fheropress.com%2Fessays%2Fmake-better-give-back%2F" rel="nofollow" target="_blank"></a></div></div><div class="rtsocial-fb-horizontal fb-light"><div class="rtsocial-fb-horizontal-button"><a title="Like: Make It Better, Give It Back" class="rtsocial-fb-button rtsocial-fb-like-light" href="https://www.facebook.com/sharer.php?u=https%3A%2F%2Fheropress.com%2Fessays%2Fmake-better-give-back%2F" rel="nofollow" target="_blank"></a></div></div><div class="rtsocial-linkedin-horizontal"><div class="rtsocial-linkedin-horizontal-button"><a class="rtsocial-linkedin-button" href="https://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fheropress.com%2Fessays%2Fmake-better-give-back%2F&title=Make+It+Better%2C+Give+It+Back" rel="nofollow" target="_blank" title="Share: Make It Better, Give It Back"></a></div></div><div class="rtsocial-pinterest-horizontal"><div class="rtsocial-pinterest-horizontal-button"><a class="rtsocial-pinterest-button" href="https://pinterest.com/pin/create/button/?url=https://heropress.com/essays/make-better-give-back/&media=https://heropress.com/wp-content/uploads/2018/01/011017-150x150.jpg&description=Make It Better, Give It Back" rel="nofollow" target="_blank" title="Pin: Make It Better, Give It Back"></a></div></div><a rel="nofollow" class="perma-link" href="https://heropress.com/essays/make-better-give-back/" title="Make It Better, Give It Back"></a></div><p>The post <a rel="nofollow" href="https://heropress.com/essays/make-better-give-back/">Make It Better, Give It Back</a> appeared first on <a rel="nofollow" href="https://heropress.com">HeroPress</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 10 Jan 2018 08:00:35 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"John Blackbourn";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:29:"Matt: Ariel Levy in Longreads";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:22:"https://ma.tt/?p=47797";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:46:"https://ma.tt/2018/01/ariel-levy-in-longreads/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:769:"<p>I had originally planned last year to write <a href="https://ma.tt/2017/12/books-in-2017/">a review of each book as I read it</a>, but The Rules Do Not Apply threw a spanner in the works. I had no idea how to write about it, much less review it. The author, <a href="https://longreads.com/2017/03/14/ariel-levy-interview/">Ariel Levy, has a great interview in Longreads from when the book came out</a>.</p>



<p>Speaking of Longreads, <a href="https://longreads.com/2017/12/29/the-25-most-popular-longreads-exclusives-of-2017/">don&#x27;t forget to check out their top 25 exclusives from 2017</a>, and <a href="https://longreads.com/2017/12/11/longreads-best-of-2017-all-of-our-no-1-story-picks/">their number 1 picks overall</a>. Some amazing writing in there.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 08 Jan 2018 00:44:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:67:"Lorelle on WP: Vulnerability in phpMyAdmin Requires Immediate Patch";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:37:"http://lorelle.wordpress.com/?p=14409";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:94:"https://lorelle.wordpress.com/2018/01/06/vulnerability-in-phpmyadmin-requires-immediate-patch/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4273:"<p>A <a href="http://www.itprotoday.com/patch-management/critical-csrf-security-vulnerability-phpmyadmin-database-tool-patched" title="Critical CSRF Vulnerability in phpMyAdmin Database Tool Patched | IT Pro">critical CSRF Vulnerability in phpMyAdmin Database administration tool</a> has been found and a <a href="https://www.phpmyadmin.net/security/PMASA-2017-9/" title="phpMyAdmin - Security - PMASA-2017-9">patch is available</a> for all computers and servers running the MySQL database. </p>
<p>Does this include you?</p>
<p>If you are using WordPress, yes it does. </p>
<p>Contact your web host to ensure phpMyAdmin is updated immediately. </p>
<p>If you are self-hosted and manage your own server, update phpMyAdmin immediately. </p>
<p>If you are using WordPress or phpMyAdmin and MySQL on your computer through <a href="http://www.wampserver.com/en/" title="WAMP">WAMP</a>, <a href="http://www.mamp.info/en/index.html" title="MAMP">MAMP</a>, <a href="http://www.apachefriends.org/en/xampp.html" title="XAMPP">XAMPP</a>, <a href="http://www.instantwp.com/" title="Instant WordPress">Instant WordPress</a>, <a href="http://serverpress.com/products/desktopserver/" title="DesktopServer">DesktopServer</a>, <a href="http://bitnami.org/stack/wordpress" title="BitNami">BitNami</a> or any of the other ways you can install WordPress on your computer or a stick (USB), update phpMyAdmin by using the patch or check the install technique&#8217;s site for updates. </p>
<p><strong>If you are using WordPress.com, don&#8217;t worry.</strong> This does not apply to you or your site. </p>
<p>The flaw affects phpMyAdmin versions 4.7.x prior to 4.7.7. Hopefully, your server/web host company has been updating phpMyAdmin all along and you don&#8217;t need to worry, but even though this is a medium security vulnerability, it is your responsibility as a site owner and administrator to ensure that your site is safe. Don&#8217;t just rely on GoDaddy, Dreamhost, or whatever hosting service you use to take care of these things for you. Sometimes they are on top of these before an announcement is made public. Other times, they are clueless and require customer intervention and nagging. </p>
<p>Now, what is phpMyAdmin?</p>
<p>MySQL is an open source database program, and <a href="https://www.phpmyadmin.net/" title="phpMyAdmin">phpMyAdmin</a> is the free, open source tool that makes the administration and use of MySQL easier to manage. <em>It is not a database. It is a database manager.</em> You can <a href="https://lorelle.wordpress.com/2014/08/10/find-search-replace-and-delete-in-the-wordpress-database/" title="Find, Search, Replace, and Delete in the WordPress Database « Lorelle on WordPress">easily search and replace data</a> in the database, make changes, and do other maintenance and utility tasks in the database.</p>
<p>Every installation of WordPress requires PHP and MySQL along with a variety of other web-based programming packages and software. Most installations by web hosts and portable versions of WordPress add phpMyAdmin to manage the WordPress site. It is not required for WordPress to work, but don&#8217;t assume that it is or isn&#8217;t installed. CHECK. </p>
<p>To find out if phpMyAdmin is installed on your site:</p>
<ol>
<li>Check with your web host and ask. Don&#8217;t expect their customer service staff to know for sure. Make them check your account and verify whether or not it is installed, and if they&#8217;ve updated. Push them for a specific answer.</li>
<li>Check the site admin interface (cPanel, Plesk, etc.) to see if it is installed.</li>
<li>Log into your site through secure FTP into the root (if you have access) and look for the installation at <em>/usr/share/phpmyadmin</code> or <code>localhost/phpmyadmin</code>. Unfortunately, it could be anywhere depending upon the installation as these are virtual folders, not folders found on your computer, so it must be assigned to a location.</li>
<li>If running a portable installation of MySQL and/or WordPress, follow the instructions for that tool and download and install all patches to ensure phpMyAdmin is updated to the latest secure version.</li>
</ol>
<div class="sig">
<p><img src="https://lorelle.files.wordpress.com/2006/08/sig.gif" alt="" /></p>
<hr /> </div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 06 Jan 2018 16:55:40 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Lorelle VanFossen";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:15;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:88:"WPTavern: Zac Gordon Launches Gutenberg Development Course, Includes More Than 30 Videos";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:29:"https://wptavern.com/?p=77285";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:98:"https://wptavern.com/zac-gordon-launches-gutenberg-development-course-includes-more-than-30-videos";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2756:"<p><a href="https://zacgordon.com/">Zac Gordon</a>, a technology educator, has released his <a href="http://gutenberg.courses/">Gutenberg Development course</a>. The course is $79 but is available for $49 using the coupon code <strong>earlyadopter</strong>.</p>



<p>Gordon says the course is aimed at developers who want to update their themes, plugins, shortcodes, etc. to work with Gutenberg and take advantage of blocks. <br /></p>



<p>"There is also some content I am adding geared towards theme developers, but honestly there is not much to that," Gordon said. "I think plugin developers will fill a lot of the needs of theme developers and help prevent them from having to build too many custom blocks. </p>



<p>"Also, in my opinion, blocks belong in plugins, so maybe some theme developers will migrate into plugin development through working with blocks."</p>



<p>The course includes more than 30 videos, a dozen example blocks, access to support forums, and the community run Slack channel. It covers how Gutenberg works, how to extend and customize it, and using a modern JavaScript development approach.</p>



<p>Gordon learned quite a few things about Gutenberg while creating the course. "Specifically, I learned Gutenberg is really just React under the hood, and then the more traditional WordPress PHP under that," he said.</p>



<p>"Digging deeper into the source attributes system that Gutenberg has to keep track of dynamic data was interesting. Also, there are far more possibilities with server-side code hooking into blocks than I thought ahead of time. I also came to the opinion that I&#x27;m not sure why someone would build a block in anything other than React, so I&#x27;m interested to see what common practices evolve."</p>



<p>Creating the course has allowed Gordon to dive deep into Gutenberg. So does he think it&#x27;s a suitable replacement for the editor? <br /></p>



<p>"I think most users will feel Gutenberg is an improvement of the editing experience," he responded. "We are definitely moving in the right direction. Ironically perhaps, I still like site and page builder plugins when editing or creating content in WordPress."</p>



<p>Gutenberg is still in a high state of flux with rapid development. According to Gordon, if there is one thing developers should know about Gutenberg, it&#x27;s that learning JavaScript deeply will pay off.<br /></p>



<p>"Matt Mullenweg was right when he said &#x27;<a href="https://www.youtube.com/watch?v=KrZx4IY1IgU">Learn JavaScript Deeply</a>&#x27;," Gordon said. "In terms of Gutenberg, that means a foundation with ES+, JSX/React, and webpack/babel/etc. You can learn as you go, but we are definitely moving from the time of learning to a time of doing."</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 05 Jan 2018 23:32:12 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:16;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:25:"Matt: Xerox Alto Zero-Day";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:22:"https://ma.tt/?p=47788";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:42:"https://ma.tt/2018/01/xerox-alto-zero-day/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2208:"<p>Next to the <a href="https://www.schneier.com/blog/archives/2018/01/spectre_and_mel.html">very real news of the Spectre and Meltdown CPU issues</a>, it was lovely to come across <a href="http://www.righto.com/2018/01/xerox-alto-zero-day-cracking-disk.html">Ken Shirriff&#x27;s story of getting past password protection on some old Xerox Alta disk packs from the 1970s</a>.</p>



<p>As further proof for why 2018 is going to be the year of blogging, two of the comments are from people who actually know about the old disks!</p>



<blockquote class="wp-block-quote">
    <p>"I designed chips at PARC as a summer intern. You have a couple of disks from Doug Fairbairn, who was also in Lynn Conway&#x27;s group."</p>
</blockquote>



<p>and</p>



<blockquote class="wp-block-quote">
    <p>I&#x27;m flabbergasted. That&#x27;s <em>my</em> Alto disk you broke into!<br />><br /><br /><br /><br /><br />The APL stuff is surely related to some work I did with Leo Guibas, showing why lazy evaluation would be a really good idea for implementing APL: see <a href="https://dl.acm.org/citation.cfm?id=512761">Compilation and delayed evaluation in APL</a>, published January 1978. (That paper gives me an enviable Erdős number of 3, since Leo is a 2.) I&#x27;m sure it&#x27;s not a complete APL implementation, just a proof of concept. It happens that my very first part-time job at PARC, in 1973, involved writing decision analysis software <em>in</em> APL &#8212; on a timesharing system!<br />><br /><br /><br /><br /><br />Given the AATFDAFD hint, I&#x27;d guess the real password is ADDATADFAD. This derives from a project I did with Jef Raskin at UCSD in 1974. (He mentioned it in <a href="https://web.stanford.edu/dept/SUL/sites/mac/primary/interviews/raskin/trans.html">this interview</a>.) The Data General Nova we were working with produced some garbled message with ADDATADFAD where it should have said ADDITIONAL, and it was a running joke ever after. Strange, the things that occupy some brain cells for over 40 years.<br />><br /><br /><br /><br /><br />Thanks for an amusing blast from the past.<br />><br /><br /><br /><br /><br />&#8212; Doug Wyatt (Xerox PARC 1973-1994)</p>
</blockquote>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 05 Jan 2018 15:37:54 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:17;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:25:"Matt: Morten on Gutenberg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:22:"https://ma.tt/?p=47780";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:42:"https://ma.tt/2018/01/morten-on-gutenberg/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:211:"<p>Morten Rand-Hendriksen&#x27;s talk and demo on Gutenberg from WordCamp US is an excellent overview of where it is, where it could go, and some VR stuff thrown in there for fun. Definitely worth the watch.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 04 Jan 2018 20:54:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:18;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:81:"WPTavern: WPWeekly Episode 300 – Interview with Matt ‘Gutenbeard’ Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:58:"https://wptavern.com?p=77276&preview=true&preview_id=77276";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:82:"https://wptavern.com/wpweekly-episode-300-interview-with-matt-gutenbeard-mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1492:"<p>In this the 300th episode, <a href="http://jjj.me">John James Jacoby</a> and I interview <a href="https://ma.tt/">Matt &#8216;Gutenbeard&#8217; Mullenweg</a>, co-creator of the WordPress project. We discuss a range of topics including, the somewhat controversial poetry reading that included a curse word prior to the State of the Word, the WordPress Foundation increasing its range of funding, and of course, Gutenberg.</p>
<p>One of the big takeaways from this interview is learning that Gutenberg will not arrive at the flick of a switch. There will be a transition period and a considerable amount of effort to make it as smooth as possible. Unlike episode 296, Mullenweg&#8217;s internet is fantastic and we didn&#8217;t experience any audio issues. A transcription of this interview will be published in a few days.</p>
<h2>WPWeekly Meta:</h2>
<p><strong>Next Episode:</strong> Wednesday, January 10th 3:00 P.M. Eastern</p>
<p>Subscribe to <a href="https://itunes.apple.com/us/podcast/wordpress-weekly/id694849738">WordPress Weekly via Itunes</a></p>
<p>Subscribe to <a href="https://www.wptavern.com/feed/podcast">WordPress Weekly via RSS</a></p>
<p>Subscribe to <a href="http://www.stitcher.com/podcast/wordpress-weekly-podcast?refid=stpr">WordPress Weekly via Stitcher Radio</a></p>
<p>Subscribe to <a href="https://play.google.com/music/listen?u=0#/ps/Ir3keivkvwwh24xy7qiymurwpbe">WordPress Weekly via Google Play</a></p>
<p><strong>Listen To Episode #300:</strong><br />
</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 04 Jan 2018 03:55:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:19;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:72:"WPTavern: A Collection of Gutenberg Conversations, Resources, and Videos";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:29:"https://wptavern.com/?p=77141";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:81:"https://wptavern.com/a-collection-of-gutenberg-conversations-resources-and-videos";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:8714:"<p>Since the conclusion of WordCamp US in early December, there have been a number of Gutenberg related items published to the web.</p>



<p>The following is a collection of items related to Gutenberg that I came across throughout December. Feel free to add to this list in the comments below.</p>



<h2>Resources</h2>



<p><a href="https://gettingreadyforgutenberg.com/">Getting Ready for Gutenberg</a> is a community-run initiative to help users and developers prepare for Gutenberg&#x27;s inclusion in core. </p>



<p>GitHub repo filled with <a href="https://github.com/WordPress/gutenberg-examples">Gutenberg example blocks.</a></p>



<p>Although it was published in August of last year, WordImpress has a good guide on <a href="https://wordimpress.com/a-pot-stirrer-amongst-chefs-contributing-to-gutenberg-without-code/">how to contribute to Gutenberg without code</a>.</p>



<p>Rich Tabor explains <a href="https://richtabor.com/add-wordpress-theme-styles-to-gutenberg/">how to add WordPress theme styles</a> to Gutenberg. He&#x27;s also created a <a href="https://wordpress.org/plugins/social-sharing-block-gutenberg/">Gutenberg Social Sharing Block</a> plugin. <br /></p>



<p>Human Made <a href="https://hmn.md/white-papers/gutenberg-the-new-wordpress-editor/">published a Gutenberg White Paper</a> that introduces people to the project, goes over a number of blocks, and provides advice on how agencies can prepare for the transition. </p>



<p><a href="https://frontenberg.tomjn.com/">Frontenberg</a> is a new project by <a href="https://twitter.com/Tarendai/status/943531422861660169">Tom Nowell </a>that brings Gutenberg to the front end. This allows people to try Gutenberg without logging into a site or installing a plugin.</p>



<p>Ben Gilbanks has <a href="https://github.com/BinaryMoon/granule/commit/777cd2903c1e4a8ebfc6060e86a7f7a4ef2387da">added basic support</a> for Gutenberg to his Granule starter theme.</p>



<p>Andrew Taylor <a href="https://github.com/ataylorme/gutenberg-codepen-embed">created a Gutenberg block</a> that enables embedding Pens from CodePen.</p>



<p>Advanced Custom Fields <a href="https://www.advancedcustomfields.com/blog/acf-year-review-2017/">announced</a> it will focus on making ACF compatible with Gutenberg in 2018. </p>



<p>Meta Box has <a href="https://metabox.io/meta-box-2017-year-review-whats-next-2018/">also announced</a> its Gutenberg compatibility plans. </p>



<p>John Hawkins published a good post on the WebDevStudios blog on <a href="https://webdevstudios.com/2018/01/02/existing-content-affected-wordpress-gutenberg/">how existing content will be affected by Gutenberg</a>.﻿ </p>



<h2>Conversations</h2>



<p>Kevin Hoffman <a href="https://github.com/WordPress/gutenberg/issues/3902">started a conversation</a> on how plugin conflicts can be handled and communicated.</p>



<p>Bridget Willard shared her concerns with the <a href="https://bridgetwillard.com/economic-impact-timeline-gutenberg-rollout/">economic impact and timeline</a> of Gutenberg&#x27;s roll out. She also <a href="https://github.com/WordPress/gutenberg/issues/3926">created an issue</a> on GitHub.</p>



<p>Amanda Rush <a href="https://www.customerservant.com/thoughts-gutenberg-wordpress-tomorrow/">published her thoughts and concerns</a> related to Gutenberg&#x27;s Accessibility. </p>



<p>Morten Rand-Hendrisken published a series of articles on LinkedIn covering <a href="https://www.linkedin.com/pulse/wordpress-changing-here-3-things-you-need-know-morten-rand-hendriksen/">things you need to know</a> about Gutenberg and the <a href="https://www.linkedin.com/pulse/gutenberg-future-wordpress-conditions-success-morten-rand-hendriksen/?published=t">conditions for its success.</a></p>



<p>Scott Kingsley Clark, of the PODS framework plugin, announced they&#x27;re doing some cool things in the next release specifically for Gutenberg. </p>




    <blockquote class="twitter-tweet"><p lang="en" dir="ltr">We’re doing some cool stuff in this next <a href="https://twitter.com/podsframework?ref_src=twsrc%5Etfw">@podsframework</a> release for Gutenberg specifically. Lots to do, but I feel like there will be cases for meta boxes and cases for blocks. We’ll have a template editor too, which will be powered by Gutenberg itself <a href="https://twitter.com/hashtag/gutenception?src=hash&ref_src=twsrc%5Etfw">#gutenception</a></p>&mdash; Scott Kingsley Clark (@scottkclark) <a href="https://twitter.com/scottkclark/status/940348072151977984?ref_src=twsrc%5Etfw">December 11, 2017</a></blockquote>




<p>Freemius takes a look at <a href="https://freemius.com/blog/gutenberg-commercial-wordpress-products/">what Gutenberg means</a> for the future of commercial WordPress products. The post includes quotes from Beaver Builder, Elementor, and Visual Composer. </p>



<p>In <a href="https://wptavern.com/wpweekly-episode-297-wordcamp-us-2017-recap">episode 297 of WordPress Weekly</a>, Morten Rand-Hendriksen joined John James Jacoby and I in a detailed conversation about Gutenberg, its potential impacts, and the idea of forking WordPress.</p>



<p>GiveWP is <a href="https://github.com/WordImpress/Give/issues/2456#issuecomment-351317017">opening up its design process</a> for how its product will interface with Gutenberg. </p>



<p>Beaver Builder<a href="https://www.wpbeaverbuilder.com/page-builders-gutenberg-world/?utm_content=buffer12b34&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer"> takes a look</a> at Page Builders in a Gutenberg World, the future of WordPress, and how its product will embrace compatibility with Gutenberg. </p>



<p>Eric Mann on <a href="https://ttmm.io/tech/gutenberg-and-the-road-ahead/">Gutenberg and the road ahead</a>. Mann supports the idea of soft-forking WordPress to provide time and help for those who can&#x27;t immediately update to 5.0. </p>



<p>Help contribute to Gutenberg by <a href="https://make.wordpress.org/test/2017/12/15/help-us-analyse-the-wcus-gutenberg-usability-videos/">processing the usability tests</a> from WordCamp US 2017. </p>



<p>Michael Hebenstreit <a href="https://arrayinternet.com/blog/cost-gutenberg-transition-small-wordpress-businesses/">details the potential costs</a> for small WordPress businesses and independent developers to transition to Gutenberg. </p>



<p>WordCamp Miami 2018 is having a <a href="https://2018.miami.wordcamp.org/2017/12/19/developer-workshop-announcement-future-of-wordpress/">developer workshop</a> focused on Gutenberg.</p>




    <blockquote class="twitter-tweet"><p lang="en" dir="ltr">I''m seeing talk of how clients will be lost and users will leave <a href="https://twitter.com/hashtag/WordPress?src=hash&ref_src=twsrc%5Etfw">#WordPress</a> when <a href="https://twitter.com/hashtag/Gutenberg?src=hash&ref_src=twsrc%5Etfw">#Gutenberg</a> drops. As a former freelancer, in-house developer, agency designer, custom theme developer, and now plugin developer, here''s a practical look at how Gutenberg affects each.</p>&mdash; Kevin W. Hoffman (@kevinwhoffman) <a href="https://twitter.com/kevinwhoffman/status/943871967349886977?ref_src=twsrc%5Etfw">December 21, 2017</a></blockquote>





    <blockquote class="twitter-tweet"><p lang="en" dir="ltr">I think we will look back at 2017 and see it as the year the <a href="https://twitter.com/hashtag/WordPress?src=hash&ref_src=twsrc%5Etfw">#WordPress</a> project started to fracture. As much as the community desperately wants to see WordPress as an enterprise CMS, projects like <a href="https://twitter.com/hashtag/Gutenberg?src=hash&ref_src=twsrc%5Etfw">#Gutenberg</a> show it is anything but.</p>&mdash; Ben Furfie (@frontendben) <a href="https://twitter.com/frontendben/status/946296693926047744?ref_src=twsrc%5Etfw">December 28, 2017</a></blockquote>




<p>Tammie Lister <a href="https://tam.blog/2017/12/gutenberg-inspired-redesign/">shared her experience</a> redesigning her site using the <a href="https://github.com/WordPress/gutenberg-theme">Gutenberg theme</a> as a base. </p>



<p>WP4Good explains how they&#x27;re <a href="https://wp4good.org/getting-ready-for-gutenberg/">preparing for Gutenberg</a>. </p>



<h2>Videos</h2>



<p>Riad Benguella <a href="https://riad.blog/2017/12/11/with-gutenberg-what-happens-to-my-custom-fields/">published a visual example</a> that shows Meta Boxes mostly work in Gutenberg. Benguella created a sample plugin called Gutenberg Custom Fields that provides a similar user experience to existing Custom Fields plugins.</p>



<p>A live demo of Gutenberg during the 2017 State of the Word. </p>




    




<p>Gutenberg and the WordPress of Tomorrow by Morten Rand-Hendriksen</p>




    <div class="embed-wrap"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 03 Jan 2018 21:04:43 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:20;a:6:{s:4:"data";s:11:"
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:40:"HeroPress: A Review Of HeroPress in 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:29:"https://heropress.com/?p=2387";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:119:"https://heropress.com/a-review-of-heropress-2017/#utm_source=rss&utm_medium=rss&utm_campaign=a-review-of-heropress-2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:9508:"<img width="960" height="480" src="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2018/01/010318-1024x512.jpg" class="attachment-large size-large wp-post-image" alt="Pull Quote: HeroPress is something WordPress people do for themselves. The world simply gets to watch." /><p><strong>FIRST</strong>: please leave a comment if HeroPress has inspired or impacted you this year. I&#8217;ve love for you to be a part of this post.</p>
<p>With that out of the way, another year of HeroPress has come and gone. HeroPress is still young enough that we can&#8217;t really see multi-year trends, but I still find it interesting to look at them and try to guess things.  In this post we&#8217;ll look at some stats, some things I tried that didn&#8217;t work, some things that did work, and some dreams for the future.</p>
<h3>Statistics</h3>
<h4>Diversity</h4>
<p>Diversity has always been important to me.  In 2015 and 2016 I had more men than women, by a pretty wide margin, and that bothered me.  In 2017 I&#8217;m happy to say we had 32 women and 21 men. I didn&#8217;t work SUPER hard at that, it was just something I kind of kept in my head when I was looking for new folks.</p>
<p>We also had great geographical diversity in our contributors, representing 26 different countries.</p>
<table>
<tbody>
<tr>
<th>Country</th>
<th>No. of Essays</th>
</tr>
<tr>
<td>Bangladesh</td>
<td>1</td>
</tr>
<tr>
<td>Cameroon</td>
<td>1</td>
</tr>
<tr>
<td>Croatia</td>
<td>1</td>
</tr>
<tr>
<td>Finland</td>
<td>2</td>
</tr>
<tr>
<td>France</td>
<td>1</td>
</tr>
<tr>
<td>Germany</td>
<td>2</td>
</tr>
<tr>
<td>India</td>
<td>7</td>
</tr>
<tr>
<td>Italy</td>
<td>1</td>
</tr>
<tr>
<td>Jamaica</td>
<td>1</td>
</tr>
<tr>
<td>Nepal</td>
<td>1</td>
</tr>
<tr>
<td>Netherlands</td>
<td>2</td>
</tr>
<tr>
<td>Nigeria</td>
<td>1</td>
</tr>
<tr>
<td>Norway</td>
<td>1</td>
</tr>
<tr>
<td>Poland</td>
<td>1</td>
</tr>
<tr>
<td>Romania</td>
<td>1</td>
</tr>
<tr>
<td>Russia</td>
<td>1</td>
</tr>
<tr>
<td>Scotland</td>
<td>1</td>
</tr>
<tr>
<td>Serbia</td>
<td>1</td>
</tr>
<tr>
<td>Somalia</td>
<td>1</td>
</tr>
<tr>
<td>South Africa</td>
<td>1</td>
</tr>
<tr>
<td>Spain</td>
<td>1</td>
</tr>
<tr>
<td>Sweden</td>
<td>1</td>
</tr>
<tr>
<td>Turkey</td>
<td>1</td>
</tr>
<tr>
<td>United Kingdom</td>
<td>1</td>
</tr>
<tr>
<td>United States</td>
<td>13</td>
</tr>
<tr>
<td>Yemen</td>
<td>1</td>
</tr>
</tbody>
</table>
<p>The US and India had far more than any other country, which has been the trend since we started, but the US has far fewer in 2017 than 2016.</p>
<h4>Readers</h4>
<p>We had traffic from 175 countries this year.</p>
<p><img class="aligncenter size-full wp-image-2388" src="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2018/01/country_traffic.png" alt="World map showing HeroPress visitors" width="951" height="547" /></p>
<p>That said, HeroPress saw less traffic overall in 2017 than in 2016.</p>
<p><img class="aligncenter size-full wp-image-2389" src="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2018/01/heropress_stats.png" alt="Bar chart showing HeroPress stats" width="692" height="282" /></p>
<h4>The Important Stuff</h4>
<p>As fun as stats are, it&#8217;s been pointed out to me many times that they&#8217;re meaningless. Someone asked me recently how I define success for HeroPress, and the answer was that at least one person is impacted for the better. The interesting twist to that is the hierarchy of people impacted positively by HeroPress.  It goes like this:</p>
<p><strong>Topher</strong>: Because he gets to see them all, AND behind the scenes. It&#8217;s heady stuff.</p>
<p><strong>Contributors themselves</strong>: MANY people have told me that writing their story changed their life. The simple act of processing things from the past, and getting them out there, and being vulnerable is powerful.</p>
<p><strong>Readers</strong>: Lot&#8217;s of people tell me it&#8217;s inspiring.</p>
<p>What we learn from the above information is that HeroPress would be a success if we had zero readers. HeroPress is something WordPress people do for themselves. The world simply gets to watch.</p>
<h3>Experiments</h3>
<h4>The Scholarship</h4>
<p>Last spring the folks from WPShout approached me about working together to offer a scholarship.  They would offer the actual scholarship, and we would manage getting applicants and deciding who won.</p>
<p>It was a huge success.  We had tons of traffic, many great applicants, and the winners did great things with their scholarships.  We&#8217;d love to do something like that again, so if you&#8217;re interested, drop us a note.</p>
<h4>Commercial Support</h4>
<p>This changed a bit in 2017. Most of the year was sponsored by Gravity Forms, which was great. That ended with only a few weeks left in the year, and I was surprised to find that there were a number of organizations that were interested in sponsoring a single week. That worked quite well, and I&#8217;m interested in looking into that more.</p>
<p>At WordCamp US I spoke to an organization that was interested in sponsoring an entire quarter, which would be a first.  It hasn&#8217;t happened yet, but I&#8217;m also looking into that some more.</p>
<h4>Donations</h4>
<p>This didn&#8217;t really work out. I put up the donation form at the request of a few people that wanted to give. Those people gave, and a few more, but after the third day or so there were no more. There could be many reasons, but I&#8217;m not too concerned. I&#8217;ll probably take the form down, and if I ask for donations again it&#8217;ll be a Public Radio style press-a-thon for a week or something. Lots of flash, and then it&#8217;s gone for a year.</p>
<h3>Thanks</h3>
<p>As always happens, I got some great advice this year and lots of donated services and software.</p>
<p>Many thanks to Tine Haugen from XWP for her ongoing input from a Larger Company perspective.</p>
<p>Thanks to <a href="https://pagely.com/">Pagely</a> for hosting HeroPress.</p>
<p>Thanks to these commercial plugin folk that donated licenses:</p>
<ul>
<li>Analytify &#8211; Google Analytics Dashboard</li>
<li>Give &#8211; Donation Plugin</li>
<li>Make Plus</li>
<li>Maps Builder Pro</li>
<li>Ninja Forms</li>
<li>Postmatic &amp; Postmatic Labs</li>
</ul>
<p>Thanks to these wonderful software developers who&#8217;ve released there work to the world for free:</p>
<ul>
<li>Akismet Anti-Spam</li>
<li>Blog Time</li>
<li>Jetpack by WordPress.com</li>
<li>Post Type Archive Descriptions</li>
<li>Public Post Preview</li>
<li>Really Simple Series</li>
<li>rtSocial</li>
<li>Simple 301 Redirects</li>
<li>Simply Exclude</li>
<li>Widget Logic</li>
<li>WP Custom Login Page Logo</li>
<li>WP Retina 2x</li>
<li>Yoast SEO</li>
</ul>
<p>Thanks to 2017&#8217;s commercial supporters:</p>
<ul>
<li><a href="https://eventespresso.com/">Event Espresso</a></li>
<li><a href="https://www.gowp.com/">GoWP</a></li>
<li><a href="https://www.gravityforms.com/">Gravity Forms</a></li>
<li><a href="https://rtcamp.com/">rtCamp</a></li>
</ul>
<p><strong>MOST IMPORTANTLY</strong></p>
<p>Thanks to our contributors.  Without people willing to share of themselves, tell us their stories, make themselves vulnerable, HeroPress would not exist. Thank you SO SO much, all of you who&#8217;ve written.</p>
<h3>Your Turn</h3>
<p>As I mentioned at the top of the post, the rest of the post is to be written by you.  How has HeroPress impacted you this year? What value is there besides numbers and charts and graphs?</p>
<p>Please leave a comment.</p>
<div class="rtsocial-container rtsocial-container-align-right rtsocial-horizontal"><div class="rtsocial-twitter-horizontal"><div class="rtsocial-twitter-horizontal-button"><a title="Tweet: A Review Of HeroPress in 2017" class="rtsocial-twitter-button" href="https://twitter.com/share?text=A%20Review%20Of%20HeroPress%20in%202017&via=heropress&url=https%3A%2F%2Fheropress.com%2Fa-review-of-heropress-2017%2F" rel="nofollow" target="_blank"></a></div></div><div class="rtsocial-fb-horizontal fb-light"><div class="rtsocial-fb-horizontal-button"><a title="Like: A Review Of HeroPress in 2017" class="rtsocial-fb-button rtsocial-fb-like-light" href="https://www.facebook.com/sharer.php?u=https%3A%2F%2Fheropress.com%2Fa-review-of-heropress-2017%2F" rel="nofollow" target="_blank"></a></div></div><div class="rtsocial-linkedin-horizontal"><div class="rtsocial-linkedin-horizontal-button"><a class="rtsocial-linkedin-button" href="https://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fheropress.com%2Fa-review-of-heropress-2017%2F&title=A+Review+Of+HeroPress+in+2017" rel="nofollow" target="_blank" title="Share: A Review Of HeroPress in 2017"></a></div></div><div class="rtsocial-pinterest-horizontal"><div class="rtsocial-pinterest-horizontal-button"><a class="rtsocial-pinterest-button" href="https://pinterest.com/pin/create/button/?url=https://heropress.com/a-review-of-heropress-2017/&media=https://heropress.com/wp-content/uploads/2018/01/010318-150x150.jpg&description=A Review Of HeroPress in 2017" rel="nofollow" target="_blank" title="Pin: A Review Of HeroPress in 2017"></a></div></div><a rel="nofollow" class="perma-link" href="https://heropress.com/a-review-of-heropress-2017/" title="A Review Of HeroPress in 2017"></a></div><p>The post <a rel="nofollow" href="https://heropress.com/a-review-of-heropress-2017/">A Review Of HeroPress in 2017</a> appeared first on <a rel="nofollow" href="https://heropress.com">HeroPress</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 03 Jan 2018 17:49:39 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:21;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:47:"Dev Blog: The Month in WordPress: December 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://wordpress.org/news/?p=5424";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:72:"https://wordpress.org/news/2018/01/the-month-in-wordpress-december-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4742:"<p>Activity slowed down in December in the WordPress community, particularly in the last two weeks. However, the month started off with a big event and work pushed forward in a number of key areas of the project. Read on to find out more about what transpired in the WordPress community as 2017 came to a close.</p>



<hr class="wp-block-separator" />



<h2>WordCamp US 2017 Brings the Community Together</h2>



<p>The latest edition of <a href="https://2017.us.wordcamp.org/">WordCamp US</a> took place last month in Nashville on December 1-3. The event brought together over 1,400 WordPress enthusiasts from around the world, fostering a deeper, more engaged global community.</p>



<p>While attending a WordCamp is always a unique experience, you can catch up on <a href="https://wordpress.tv/event/wordcamp-us-2017/">the sessions on WordPress.tv</a> and look through <a href="https://www.facebook.com/pg/WordCampUSA/photos/?tab=albums">the event photos on Facebook</a> to get a feel for how it all happened. Of course, <a href="https://wordpress.tv/2017/12/04/matt-mullenweg-state-of-the-word-2017/">Matt Mullenweg’s State of the Word</a> talk is always one of the highlights at this event.</p>



<p>The next WordCamp US will be held in Nashville again in 2018, but if you would like to see it hosted in your city in 2019 and 2020, then <a href="https://make.wordpress.org/community/2017/12/19/apply-to-host-wordcamp-us-2019-2020/">you have until February 2 to apply</a>.</p>



<h2>WordPress User Survey Data Is Published</h2>



<p>Over the last few years, tens of thousands of WordPress users all over the world have filled out the annual WordPress user survey. The results of that survey are used to improve the WordPress project, but that data has mostly remained private. This has changed now and <a href="https://wordpress.org/news/2017/12/wordpress-user-survey-data-for-2015-2017/">the results from the last three surveys are now publicly available</a> for everyone to analyze.</p>



<p>The data will be useful to anyone involved in WordPress since it provides a detailed look at who uses WordPress and what they do with it — information that can help inform product development decisions across the board.</p>



<h2>New WordPress.org Team for the Tide Project</h2>



<p>As announced at WordCamp US, <a href="https://make.wordpress.org/tide/2017/12/02/new-home/">the Tide project is being brought under the WordPress.org umbrella</a> to be managed and developed by the community.</p>



<p>Tide is a series of automated tests run against every plugin and theme in the directory to help WordPress users make informed decisions about the plugins and themes that they choose to install.</p>



<p>To get involved in developing Tide, jump into the #tide channel in the <a href="https://make.wordpress.org/chat/">Making WordPress Slack group</a>, and follow <a href="https://make.wordpress.org/tide/">the Tide team blog</a>.</p>



<hr class="wp-block-separator" />



<h2>Further Reading:</h2>



<ul>
    <li>If you’re following the development of Gutenberg, or if you want a primer on where it’s headed, then <a href="https://wordpress.tv/2017/12/10/morten-rand-hendriksen-gutenberg-and-the-wordpress-of-tomorrow/">Morten Rand-Hendriksen’s talk from WordCamp US</a> is a must watch.</li>
    <li>The annual surveys for WordPress <a href="https://wordpressdotorg.polldaddy.com/s/2017-annual-meetup-member-survey">meetup members</a> and <a href="https://wordpressdotorg.polldaddy.com/s/2017-annual-meetup-organizer-survey">meetup organizers</a> are available for people to fill out — if you’re involved in or attend your local meetup group then be sure to complete those.</li>
    <li>10up has <a href="https://distributorplugin.com/">a brand new plugin in beta</a> that will assist with powerful and flexible content publishing and syndication across WordPress sites.</li>
    <li><a href="https://make.wordpress.org/community/2017/12/07/should-we-change-the-default-wordcamp-theme-to-campsite-2017/">The Community Team is exploring a move</a> to make the recently developed CampSite theme the default theme for all new WordCamp websites. This is the theme that was developed and employed for <a href="https://2017.europe.wordcamp.org">WordCamp Europe 2017</a>.</li>
    <li>The team working on the multisite features of WordPress Core has recently published <a href="https://make.wordpress.org/core/2017/12/19/multisite-roadmap-published/">their planned roadmap for development</a>.</li>
</ul>



<p><em>If you have a story we should consider including in the next “Month in WordPress” post, please <a href="https://make.wordpress.org/community/month-in-wordpress-submissions/">submit it here</a>.</em></p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 03 Jan 2018 10:00:24 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Hugh Lashbrooke";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:22;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"Matt: Books in 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:22:"https://ma.tt/?p=47744";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:36:"https://ma.tt/2017/12/books-in-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4679:"<p>Here&#x27;s what I ended up reading this year, in roughly chronological finishing order. (I usually have 3-4 books going on at once.)</p>



<ul>
    <li><a href="https://www.amazon.com/dp/B01HSMRWNU/?tag=photomatt08-20">Tools of Titans</a> by Tim Ferriss.</li>
    <li><a href="https://www.amazon.com/dp/B00JSRQSJS/?tag=photomatt08-20">The Art of Stillness</a> by Pico Ayer.</li>
    <li><a href="https://www.amazon.com/dp/B0162WIRKY/?tag=photomatt08-20">Out of Your Mind</a> by Alan Watts (audiobook, really a series of lectures).</li>
    <li><a href="https://www.amazon.com/dp/B007V3FHRU/?tag=photomatt08-20">Book of Five Rings</a> by Miyamoto Mushashi (audiobook).</li>
    <li><a href="https://smile.amazon.com/dp/B01KKNM8UQ/?tag=photomatt08-20">Do Not Say We Have Nothing</a> by Madeleine Thien.</li>
    <li><a href="https://www.amazon.com/dp/B01912QC5Y/?tag=photomatt08-20">The Best American Short Stories 2016</a> edited by Junot Diaz.</li>
    <li><a href="https://www.amazon.com/dp/B00CVNLK3K/?tag=photomatt08-20">Feynman</a> by Jim Ottaviani.</li>
    <li><a href="https://www.amazon.com/dp/8129137704/?tag=photomatt08-20">My Gita</a> by Devdutt Pattanaik.</li>
    <li><a href="https://www.amazon.com/dp/B00DTO6LZ2/?tag=photomatt08-20">From Plato to Post-modernism: Understanding the Essence of Literature and the Role of the Author</a> by Louis Markos (another lecture series).</li>
    <li><a href="https://www.amazon.com/dp/B01LZOV6R3/?tag=photomatt08-20">The Rules Do Not Apply</a> by Ariel Levy.</li>
    <li><a href="https://www.amazon.com/dp/B01BSNQJDY/?tag=photomatt08-20">The Story of a Brief Marriage</a> by Anuk Arudpragasam.</li>
    <li><a href="https://www.amazon.com/dp/B00DPM7TIG/?tag=photomatt08-20">All the Light We Cannot See</a> by Anthony Doerr.</li>
    <li><a href="https://www.amazon.com/dp/B01NAG34EH/?tag=photomatt08-20">Ikigai: The Japanese Secret to a Long and Happy Life</a> by Héctor García and Francesc Miralles.</li>
    <li><a href="https://www.amazon.com/dp/B00V3CE1M2/?tag=photomatt08-20">When Hitler Took Cocaine and Lenin Lost His Brain: History&#x27;s Unknown Chapters</a> by Giles Milton.</li>
    <li><a href="https://www.amazon.com/dp/184861098X/?tag=photomatt08-20">Widow Basquiat: A Love Story</a> by Jennifer Clement.</li>
    <li><a href="https://www.amazon.com/dp/0812983068/?tag=photomatt08-20">32 Yolks: From My Mother&#x27;s Table to Working the Line</a> by Eric Ripert.</li>
    <li><a href="https://www.amazon.com/dp/B005LH08M2/?tag=photomatt08-20">Identify: Basic Principles of Identity Design in the Iconic Trademarks</a> by Chermayeff &amp; Geismar.</li>
    <li><a href="https://www.amazon.com/dp/B0024NP55G/?tag=photomatt08-20">Catching the Big Fish: Meditation, Consciousness, and Creativity</a> by David Lynch (audiobook).</li>
    <li><a href="https://www.amazon.com/dp/B01HZFB3X0/?tag=photomatt08-20">The Upstarts: How Uber, Airbnb, and the Killer Companies of the New Silicon Valley Are Changing the World</a> by Brad Stone.</li>
    <li><a href="https://www.amazon.com/dp/B01JKHTNCY/?tag=photomatt08-20">The Leavers</a> by Lisa Ko.</li>
    <li><a href="https://www.amazon.com/dp/B002UZ5K4Y/?tag=photomatt08-20">Wolf Hall</a> by Hilary Mantel.</li>
    <li><a href="https://www.amazon.com/dp/B013PKGT2O/?tag=photomatt08-20">Girls on Fire</a> by Robin Wasserman.</li>
    <li><a href="https://www.amazon.com/dp/0195096444/?tag=photomatt08-20">The Executive&#x27;s Compass</a> by James O&#x27;Toole.</li>
    <li><a href="https://www.amazon.com/dp/B000SEGMAU/?tag=photomatt08-20">Tuesdays with Morrie</a> by Mitch Albom.</li>
    <li><a href="https://www.amazon.com/dp/B06WLGYW83/?tag=photomatt08-20">Dance of the Possible</a> by Scott Berkun.</li>
    <li><a href="https://subterraneanpress.com/magazine/fall_2010/fiction_the_lifecycle_of_software_objects_by_ted_chiang">The Lifecycle of Software Objects</a> by Ted Chiang (short story).</li>
    <li><a href="https://www.amazon.com/dp/B071KJ7PTB/?tag=photomatt08-20">Tribe of Mentors</a> by Tim Ferriss.</li>
    <li><a href="https://www.amazon.com/dp/B06XZSNB3W/?tag=photomatt08-20">After On: A Novel of Silicon Valley</a> by Rob Reid.</li>
    <li><a href="https://www.amazon.com/gp/product/1501124021/?tag=photomatt08-20">Principles</a> by Ray Dalio.</li>
    <li><a href="https://www.amazon.com/dp/B001H44FP4/?tag=photomatt08-20">The Graveyard Book</a> by Neil Gaiman (audiobook).</li>
    <li><a href="https://www.amazon.com/dp/B0073X0GRO/?tag=photomatt08-20">The Undiscovered Self: With Symbols and the Interpretation of Dreams</a> by C.G. Jung.</li>
</ul>



<p>A fairly random selection, and hopefully I can get a few more in next year.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 31 Dec 2017 23:19:10 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:23;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:54:"WPTavern: WPWeekly Episode 299 – 2017 Year in Review";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:58:"https://wptavern.com?p=77120&preview=true&preview_id=77120";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:61:"https://wptavern.com/wpweekly-episode-299-2017-year-in-review";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:19514:"<p>In this episode, <a href="https://jjj.blog/">John James Jacoby</a> and I review the WordPress news that made headlines on the Tavern in 2017. Among the stories we talk about more in-depth was Headway Themes, WP-CLI becoming a WordPress.org sanctioned project, and Disqus being acquired. We also talked about the future of comments in WordPress and what circumstances could lead to <a href="https://intensedebate.com/">Intense Debate</a> being relevant again.</p>
<p>Last but not least, we offered up our thoughts for the New Year. Shout out to <a href="https://gist.github.com/kevinwhoffman">Kevin Hoffman</a> who submitted a five-star review for WP Weekly on <a href="https://itunes.apple.com/us/podcast/wordpress-weekly/id694849738">iTunes</a>. Thank you to all of the listeners who have and continue to listen to WordPress Weekly.</p>
<h2>Stories Discussed:</h2>
<h3>January</h3>
<p><a href="https://wptavern.com/wp-cli-gets-official-wordpress-org-support">WP-CLI Gets Official WordPress.org Support</a><br />
<a href="https://wptavern.com/wordpress-4-7-1-fixes-eight-security-issues">WordPress 4.7.1 Fixes Eight Security Issues</a><br />
<a href="https://wptavern.com/automattic-releases-free-plugin-for-exporting-photos-from-lightroom-to-wordpress">Automattic Releases Free Plugin for Exporting Photos from Lightroom to WordPress</a><br />
<a href="https://wptavern.com/aaron-d-campbell-replaces-nikolay-bachiyski-as-wordpress-security-czar">Aaron D. Campbell Replaces Nikolay Bachiyski as WordPress&#8217; Security Czar</a><br />
<a href="https://wptavern.com/postmatic-basic-rebrands-as-replyable-moves-two-way-email-commenting-to-saas-product">Postmatic Basic Rebrands as Replyable, Moves Two-Way Email Commenting to SaaS Product</a><br />
<a href="https://wptavern.com/jetpack-4-5-expands-monetization-with-wordads-integration">Jetpack 4.5 Expands Monetization with WordAds Integration</a><br />
<a href="https://wptavern.com/obama-foundation-launches-new-website-powered-by-wordpress">Obama Foundation Launches New Website Powered by WordPress</a><br />
<a href="https://wptavern.com/wix-removes-gpl-licensed-wordpress-code-from-mobile-app-forks-original-mit-library">Wix Removes GPL-Licensed WordPress Code from Mobile App, Forks Original MIT Library</a></p>
<h3>February</h3>
<p><a href="https://wptavern.com/10up-unveils-elasticpress-io-elasticsearch-as-a-service-for-wordpress-sites">10up Unveils ElasticPress.io: Elasticsearch as a Service for WordPress Sites</a><br />
<a href="https://wptavern.com/matt-mullenweg-responds-to-security-rant-digital-signatures-for-wordpress-updates-are-important-but-not-a-priority">Matt Mullenweg Responds to Security Rant: Digital Signatures for WordPress Updates Are Important but Not a Priority</a><br />
<a href="https://wptavern.com/buddypress-2-8-boosts-minimum-php-requirement-adds-twenty-seventeen-companion-stylesheet">BuddyPress 2.8 Boosts Minimum PHP Requirement, Adds Twenty Seventeen Companion Stylesheet</a><br />
<a href="https://wptavern.com/wordpress-core-editor-team-publishes-ui-prototype-for-gutenberg-an-experimental-block-based-editor">WordPress Core Editor Team Publishes UI Prototype for &#8220;Gutenberg,&#8221; an Experimental Block Based Editor</a><br />
<a href="https://wptavern.com/zerif-lite-returns-to-wordpress-org-after-5-month-suspension-and-63-decline-in-revenue">Zerif Lite Returns to WordPress.org after 5-Month Suspension and 63% Decline in Revenue</a><br />
<a href="https://wptavern.com/cloudflare-memory-leak-exposes-private-data">Cloudflare Memory Leak Exposes Private Data</a><br />
<a href="https://wptavern.com/freemius-launches-insights-for-wordpress-themes">Freemius Launches Insights for WordPress Themes</a><br />
<a href="https://wptavern.com/hackerone-launches-free-community-edition-for-non-commercial-open-source-projects">HackerOne Launches Free Community Edition for Non-Commercial Open Source Projects</a></p>
<h3>March</h3>
<p><a href="https://wptavern.com/web-annotations-are-now-a-w3c-standard-paving-the-way-for-decentralized-annotation-infrastructure">Web Annotations are Now a W3C Standard, Paving the Way for Decentralized Annotation Infrastructure</a><br />
<a href="https://wptavern.com/wordpress-4-7-3-patches-six-security-vulnerabilities-immediate-update-advised">WordPress 4.7.3 Patches Six Security Vulnerabilities, Immediate Update Advised</a><br />
<a href="https://wptavern.com/wefoster-launches-hosting-platform-catered-to-online-communities">WeFoster Launches Hosting Platform Catered to Online Communities</a><br />
<a href="https://wptavern.com/jetpack-introduces-theme-installation-from-wordpress-com-sparks-controversy-with-alternative-marketplace-for-free-themes">Jetpack Introduces Theme Installation from WordPress.com, Sparks Controversy with Alternative Marketplace for Free Themes</a><br />
<a href="https://wptavern.com/pressshack-forks-edit-flow-to-create-publishpress-aims-to-improve-multi-user-editorial-workflow-in-wordpress">PressShack Forks Edit Flow to Create PublishPress, Aims to Improve Multi-User Editorial Workflow in WordPress</a><br />
<a href="https://wptavern.com/yoast-seo-4-5-urges-users-to-upgrade-to-php-7">Yoast SEO 4.5 Urges Users to Upgrade to PHP 7</a><br />
<a href="https://wptavern.com/foxhound-is-the-first-rest-api-powered-theme-on-wordpress-org">Foxhound Is the First REST API Powered Theme on WordPress.org</a><br />
<a href="https://wptavern.com/godaddy-acquires-sucuri">GoDaddy Acquires Sucuri</a><br />
<a href="https://wptavern.com/wordpress-relaunches-plugin-directory-with-new-design-and-improved-search-algorithm">WordPress Relaunches Plugin Directory with New Design and Improved Search Algorithm</a><br />
<a href="https://wptavern.com/poopy-life-lets-you-create-free-unlimited-wordpress-test-installs">Poopy.life Lets You Create Free, Unlimited WordPress Test Installs</a><br />
<a href="https://wptavern.com/wordpress-community-support-shuts-down-wordcamp-netherlands-in-favor-of-city-based-wordcamps">WordPress Community Support Shuts Down WordCamp Netherlands in Favor of City-Based WordCamps</a></p>
<h3>April</h3>
<p><a href="https://wptavern.com/woocommerce-3-0-brings-major-improvements-to-product-gallery-introduces-crud-classes-and-a-new-cli">WooCommerce 3.0 Brings Major Improvements to Product Gallery, Introduces CRUD Classes and a New CLI</a><br />
<a href="https://wptavern.com/jetpack-4-8-introduces-settings-redesign-adds-global-wordpress-com-toolbar">Jetpack 4.8 Introduces Settings Redesign, Adds Global WordPress.com Toolbar</a><br />
<a href="https://wptavern.com/yoast-seos-php-upgrade-nag-is-producing-a-significant-increase-in-sites-upgrading-to-php-7">Yoast SEO&#8217;s PHP Upgrade Nag is Producing a Significant Increase in Sites Upgrading to PHP 7</a><br />
<a href="https://wptavern.com/buddypress-2016-survey-results-show-54-of-respondents-are-on-php-7-0">BuddyPress 2016 Survey Results Show 54% of Respondents are on PHP 7.0+</a><br />
<a href="https://wptavern.com/wordpress-4-7-4-fixes-visual-editor-incompatibility-with-upcoming-version-of-chrome">WordPress 4.7.4 Fixes 47 Issues</a><br />
<a href="https://wptavern.com/headway-themes-appears-to-be-dying-a-slow-death">Headway Themes Appears to be Dying a Slow Death</a><br />
<a href="https://wptavern.com/shopify-discontinues-its-official-plugin-for-wordpress">Shopify Discontinues Its Official Plugin for WordPress</a></p>
<h3>May</h3>
<p><a href="https://wptavern.com/10up-releases-wp-docker-an-open-source-docker-configuration-for-local-wordpress-development">10up Releases WP Docker, an Open Source Docker Configuration for Local WordPress Development</a><br />
<a href="https://wptavern.com/jetpack-4-9-introduces-eu-cookie-law-banner-widget">Jetpack 4.9 Introduces EU Cookie Law Banner Widget</a><br />
<a href="https://wptavern.com/weglot-multilingual-plugin-closes-450k-in-seed-funding">Weglot Multilingual Plugin Closes €450K in Seed Funding</a><br />
<a href="https://wptavern.com/wordpress-is-now-on-hackerone-launches-bug-bounties">WordPress Is Now on HackerOne, Launches Bug Bounties</a><br />
<a href="https://wptavern.com/hookr-plugin-rebrands-as-wp-inspect-project-to-shift-to-a-module-based-architecture">Hookr Plugin Rebrands as WP Inspect, Project to Shift to a Module-Based Architecture</a><br />
<a href="https://wptavern.com/wordpress-4-7-5-patches-six-security-issues-immediate-update-recommended">WordPress 4.7.5 Patches Six Security Issues, Immediate Update Recommended</a><br />
<a href="https://wptavern.com/storefront-2-2-0-released-includes-design-refresh-and-major-improvements-to-new-user-experience">Storefront 2.2.0 Released, Includes Design Refresh and Major Improvements to New User Experience</a><br />
<a href="https://wptavern.com/rainmaker-digital-to-partner-with-nimble-worldwide">Rainmaker Digital to Partner with Nimble Worldwide</a><br />
<a href="https://wptavern.com/wordpress-removes-hhvm-from-testing-infrastructure">WordPress Removes HHVM from Testing Infrastructure</a><br />
<a href="https://wptavern.com/wp-cli-1-2-0-released-project-unveils-new-logo">WP-CLI 1.2.0 Released, Project Unveils New Logo</a></p>
<h3>June</h3>
<p><a href="https://wptavern.com/wpforms-acquires-wp-mail-smtp-plugin">WPForms Acquires WP Mail SMTP Plugin</a><br />
<a href="https://wptavern.com/versionpress-launches-versionpress-com-to-fund-open-source-project">VersionPress Launches VersionPress.com to Fund Open Source Project</a><br />
<a href="https://wptavern.com/wordpress-4-8-evans-released-featuring-nearby-wordpress-events-new-media-widgets-and-link-boundaries">WordPress 4.8 &#8220;Evans&#8221; Released Featuring Nearby WordPress Events, New Media Widgets, and Link Boundaries</a><br />
<a href="https://wptavern.com/imagely-acquires-teslathemes-is-seeking-other-acquisition-opportunities">Imagely Acquires TeslaThemes, Is Seeking Other Acquisition Opportunities</a><br />
<a href="https://wptavern.com/9seeds-acquires-web-savvy-marketings-genesis-theme-store">9seeds Acquires Web Savvy Marketing&#8217;s Genesis Theme Store</a><br />
<a href="https://wptavern.com/wordcamp-europe-2017-draws-1900-attendees-from-79-countries">WordCamp Europe 2017 Draws 1900 Attendees from 79 Countries</a><br />
<a href="https://wptavern.com/woocommerce-drops-50-renewal-discount-on-subscriptions">WooCommerce Drops 50% Renewal Discount on Subscriptions</a><br />
<a href="https://wptavern.com/wpshout-updates-and-acquires-wphierarchy-com">WPShout Updates and Acquires WPHierarchy.com</a><br />
<a href="https://wptavern.com/wordpress-new-gutenberg-editor-now-available-as-a-plugin-for-testing">WordPress&#8217; New Gutenberg Editor Now Available as a Plugin for Testing</a><br />
<a href="https://wptavern.com/automattic-to-renew-efforts-on-underscores-retire-components-starter-theme-generator">Automattic to Renew Efforts on Underscores, Retire Components Starter-Theme Generator</a><br />
<a href="https://wptavern.com/woocommerce-3-1-adds-new-csv-product-importerexporter-improves-extension-management">WooCommerce 3.1 Adds New CSV Product Importer/Exporter, Improves Extension Management</a><br />
<a href="https://wptavern.com/clef-is-shutting-down-june-6th">Clef Shuts Down</a></p>
<h3>July</h3>
<p><a href="https://wptavern.com/jesse-petersen-founder-of-genesis-the-me-passes-away">Jesse Petersen, Founder of Genesis The.me Passes Away</a><br />
<a href="https://wptavern.com/wangguard-plugin-author-shuts-down-splog-hunting-service-due-to-trauma-and-death-threats">WangGuard Plugin Author Shuts Down Splog Hunting Service Due to Trauma and Death Threats</a><br />
<a href="https://wptavern.com/lets-encrypt-passes-100-million-certificates-issued-will-offer-wildcard-certificates-in-january-2018">Let&#8217;s Encrypt Passes 100 Million Certificates Issued, Will Offer Wildcard Certificates in January 2018</a><br />
<a href="https://wptavern.com/10up-acquires-lift-ux">10up Acquires Lift UX</a><br />
<a href="https://wptavern.com/aj-morris-acquires-ithemes-exchange">AJ Morris Acquires iThemes Exchange</a><br />
<a href="https://wptavern.com/react-users-petition-facebook-to-re-license-react-js-after-apache-software-foundation-bans-bsdpatents-license-in-dependencies">React Users Petition Facebook to Re-license React.js after Apache Software Foundation Bans BSD+Patents License in Dependencies</a><br />
<a href="https://wptavern.com/sitelock-acquires-patchmans-malware-and-vulnerability-detection-technology-expands-wordpress-customer-base-to-4-million">SiteLock Acquires Patchman&#8217;s Malware and Vulnerability Detection Technology, Expands WordPress Customer Base to 4 Million</a><br />
<a href="https://wptavern.com/adobe-to-discontinue-flash-support-and-updates-in-2020">Adobe to Discontinue Flash Support and Updates in 2020</a><br />
<a href="https://wptavern.com/blog-passes-100000-registrations-66-5-of-purchased-domains-are-in-use">.blog Passes 100,000 Registrations, 66.5% of Purchased Domains are in Use</a></p>
<h3>August</h3>
<p><a href="https://wptavern.com/jetpack-5-2-brings-major-improvements-to-the-contact-form-module">Jetpack 5.2 Brings Major Improvements to the Contact Form Module</a><br />
<a href="https://wptavern.com/wordpress-polyglots-team-fuels-international-community-growth-with-3rd-global-translation-day">WordPress Polyglots Team Fuels International Community Growth with 3rd Global Translation Day</a><br />
<a href="https://wptavern.com/wordpress-4-8-1-released-adds-custom-html-widget">WordPress 4.8.1 Released, Adds Custom HTML Widget</a><br />
<a href="https://wptavern.com/trademark-trial-and-appeal-board-dismisses-automattics-trademark-dispute-against-chris-pearson">Trademark Trial and Appeal Board Dismisses Automattic&#8217;s Trademark Dispute Against Chris Pearson</a><br />
<a href="https://wptavern.com/wordpress-coms-business-plan-gives-subscribers-a-way-to-tap-into-wordpress-orgs-third-party-ecosystem">WordPress.com&#8217;s Business Plan Gives Subscribers a Way to Tap into WordPress.org&#8217;s Third-party Ecosystem</a><br />
<a href="https://wptavern.com/maekit-acquires-wp-remote-plans-to-add-cloud-based-backup-services">maekit Acquires WP Remote, Plans to Add Cloud-Based Backup Services</a><br />
<a href="https://wptavern.com/wordpress-org-now-allows-plugin-authors-to-specify-a-minimum-php-version-requirement">WordPress.org Now Allows Plugin Authors to Specify a Minimum PHP Version Requirement</a><br />
<a href="https://wptavern.com/gutenberg-1-0-0-introduces-drag-and-drop-for-adding-image-blocks">Gutenberg 1.0.0 Introduces Drag and Drop for Adding Image Blocks</a></p>
<h3>September</h3>
<p><a href="https://wptavern.com/jetpack-5-3-adds-php-7-1-compatibility-better-control-for-wordads-placement">Jetpack 5.3 Adds PHP 7.1 Compatibility, Better Control for WordAds Placement</a><br />
<a href="https://wptavern.com/wordpress-org-adds-new-support-rep-role-for-plugin-pages">WordPress.org Adds New Support Rep Role for Plugin Pages</a><br />
<a href="https://wptavern.com/wordpress-abandons-react-due-to-patents-clause-gutenberg-to-be-rewritten-with-a-different-library">WordPress Abandons React due to Patents Clause, Gutenberg to be Rewritten with a Different Library</a><br />
<a href="https://wptavern.com/wordpress-4-8-2-patches-eight-security-vulnerabilities">WordPress 4.8.2 Patches Eight Security Vulnerabilities</a><br />
<a href="https://wptavern.com/apply-filters-podcast-to-be-retired-after-83-episodes">Apply Filters Podcast to be Retired after 83 Episodes</a><br />
<a href="https://wptavern.com/wordpress-com-adds-google-photos-integration-available-now-for-jetpack-enabled-sites">WordPress.com Adds Google Photos Integration, Available Now for Jetpack-Enabled Sites</a></p>
<h3>October</h3>
<p><a href="https://wptavern.com/poopy-life-launches-pro-version-at-wpsandbox-io-aimed-at-theme-and-plugin-developers">Poopy.life Launches Pro Version at WPsandbox.io Aimed at Theme and Plugin Developers</a><br />
<a href="https://wptavern.com/disqus-data-breach-affects-17-5-million-accounts">Disqus Data Breach Affects 17.5 Million Accounts</a><br />
<a href="https://wptavern.com/gitlab-raises-20-million-series-c-round-adds-matt-mullenweg-to-board-of-directors">GitLab Raises $20 Million Series C Round, Adds Matt Mullenweg to Board of Directors</a><br />
<a href="https://wptavern.com/woocommerce-3-2-adds-ability-to-apply-coupons-in-the-admin-introduces-pre-update-version-checks-for-extensions">WooCommerce 3.2 Adds Ability to Apply Coupons in the Admin, Introduces Pre-Update Version Checks for Extensions</a><br />
<a href="https://wptavern.com/postman-smtp-plugin-forked-after-removal-from-wordpress-org-for-security-issues">Postman SMTP Plugin Forked after Removal from WordPress.org for Security Issues</a><br />
<a href="https://wptavern.com/woocommerce-retires-canvas-theme-recommends-customers-migrate-to-storefront-theme">WooCommerce Retires Canvas Theme, Recommends Customers Migrate to Storefront Theme</a><br />
<a href="https://wptavern.com/goodnight-firebug">Firebug is Retired</a></p>
<h3>November</h3>
<p><a href="https://wptavern.com/wordpress-4-8-3-a-security-release-six-weeks-in-the-making">WordPress 4.8.3, A Security Release Six Weeks in the Making</a><br />
<a href="https://wptavern.com/press-this-removed-from-wordpress-4-9-in-favor-of-a-plugin">Press This Removed from WordPress 4.9 in Favor of a Plugin</a><br />
<a href="https://wptavern.com/bianca-welds-awarded-kim-parsell-travel-scholarship">Bianca Welds Awarded Kim Parsell Travel Scholarship</a><br />
<a href="https://wptavern.com/jetpack-5-5-removes-syntax-highlighting-and-gallery-widget-for-compatibility-with-upcoming-wordpress-4-9-release">Jetpack 5.5 Removes Syntax Highlighting and Gallery Widget for Compatibility</a><br />
<a href="https://wptavern.com/wordpress-4-9-released-with-major-improvements-to-customizer-workflow-updated-code-editors-and-new-core-gallery-widget">WordPress 4.9 Released with Major Improvements to Customizer Workflow, Updated Code Editors, and New Core Gallery Widget</a><br />
<a href="https://wptavern.com/tailor-page-builder-plugin-discontinued-owners-cite-funding-gutenberg-and-competition">Tailor Page Builder Plugin Discontinued, Owners Cite Funding, Gutenberg, and Competition</a><br />
<a href="https://wptavern.com/wordpress-4-9-1-released-fixes-page-template-bug">WordPress 4.9.1 Released, Fixes Page Template Bug</a><br />
<a href="https://wptavern.com/wpweekly-episode-296-gutenberg-telemetry-calypso-and-more-with-matt-mullenweg">WPWeekly Episode 296 – Gutenberg, Telemetry, Calypso, and More With Matt Mullenweg</a></p>
<h3>December</h3>
<p><a href="https://wptavern.com/storify-to-close-may-16-2018-wordpress-plugin-discontinued">Storify to Close May 16, 2018, WordPress Plugin Discontinued</a><br />
<a href="https://wptavern.com/jetpack-5-6-1-increases-security-of-the-contact-form-module">Jetpack 5.6.1 Increases Security of the Contact Form Module</a><br />
<a href="https://wptavern.com/wp-site-care-acquires-wp-radius">WP Site Care Acquires WP Radius<b></b></a></p>
<h2>WPWeekly Meta:</h2>
<p><strong>Next Episode:</strong> Wednesday, January 3rd at 3:00 P.M. Eastern</p>
<p>Subscribe to <a href="https://itunes.apple.com/us/podcast/wordpress-weekly/id694849738">WordPress Weekly via Itunes</a></p>
<p>Subscribe to <a href="https://www.wptavern.com/feed/podcast">WordPress Weekly via RSS</a></p>
<p>Subscribe to <a href="http://www.stitcher.com/podcast/wordpress-weekly-podcast?refid=stpr">WordPress Weekly via Stitcher Radio</a></p>
<p><strong>Listen To Episode #299:</strong><br />
</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 28 Dec 2017 02:08:34 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:24;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:94:"HeroPress: My Journey from being a Dyslexic kid to becoming A Co-organiser For WordCamp Mumbai";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:56:"https://heropress.com/?post_type=heropress-essays&p=2369";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:190:"https://heropress.com/essays/journey-dyslexic-kid-becoming-co-organiser-wordcamp-mumbai/#utm_source=rss&utm_medium=rss&utm_campaign=journey-dyslexic-kid-becoming-co-organiser-wordcamp-mumbai";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:16513:"<img width="960" height="480" src="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2018/12/122717-1024x512.jpg" class="attachment-large size-large wp-post-image" alt="Pull Quote: My WordPress journey over the last two years has been excellent, filled with beautiful surprises." /><p>In my early childhood, my parents were told that I had <a href="https://en.wikipedia.org/wiki/Dyslexia">dyslexia</a> and <a href="https://en.wikipedia.org/wiki/Dyscalculia">dyscalculia</a>. They were told that with this drawback, I would never achieve anything constructive in my life. My parents were a little shocked as they had no clue what was dyslexia and dyscalculia and how to handle the situation. They never gave up on me and believe that I could reach great success in life. They found a tutor for me who was able to train me to do better and gave me the same treatment as other students.</p>
<p>As a student suffering from dyslexia and dyscalculia, I had an option to skip Maths and opt for an additional subject in  in 8th grade. Computer as an additional subject was introduced to me. It was the first time I was introduced to the world of internet. I started researching what internet has to offer and how it works. Those days email and website were all new and fascinating. My father bought our first desktop so I can do my research at home.</p>
<blockquote><p>My father wanted to turn my love for the computer into something more constructive to help me in my future.</p></blockquote>
<p>After 12th standard, my father enrolled me in a short computer course from NIIT to develop new skills and polish my old skills. Once the course was over, my teacher was so impressed with my performance that she advised my father to enroll me in a 3 years Software Development course. This course was carried out in parallel with my regular college. I would become both a graduate and a software developer at the same time. My father happily enrolled me.</p>
<p>(PS: I was a bit disappointed as I had to juggle 2 courses together during my college days. I thought it would be very difficult to concentrate on both things. BUT to be honest today when I look back, I feel that I enjoyed doing both college and NIIT together.)</p>
<p>During the 3 year period, I learned different languages like C Sharp, C, C++, Java, and dotNet.</p>
<p>After I completed my graduation and NIIT course, I was confused which field to select and apply for a job. There was a rule in NIIT, I had to complete 1 year of internship after my course. If due to any circumstance I could not complete, I would not get the certificate. My parents had spent a lot of money on my course and I didn&#8217;t want their hard earned money to go down the drain so I started going for different interviews in the IT field. My father had advised me that if after one year I was not happy with my IT job, I can quit and pursue Banking career.</p>
<blockquote><p>In 2009 on my birthday to my surprise and good fortune, I passed an interview and joined a company. On the first day, I was introduced to WordPress.</p></blockquote>
<p>I got an assignment to change the look and feel of WordPress dashboard. This assignment had to be completed within the next 6 hours. I had no clue what WordPress was. I was looking at the whiteboard in front of me and thinking this assignment is not possible to complete within 6 hours. I thought my boss was joking (Bosses generally joke with interns).</p>
<p>Guess who came to the rescue. GOOGLE. <img src="https://s.w.org/images/core/emoji/2.3/72x72/1f642.png" alt="🙂" class="wp-smiley" /></p>
<p>I started researching about WordPress on how it works and how to use it. After 2 hours, when I was comfortable using WordPress, I started searching how to change look and feel of WordPress Admin Dashboard. Thankfully, I found a plugin which can change the look and feel of the WordPress Dashboard. I learned how to install and work with it. After trying different combinations of color and style, I finally completed the assignment with 2 hours to spare. My boss was happy.</p>
<p>Unfortunately after 4 days of working with WordPress, I was shifted to another CMS. I started working with the other CMS for so long that I completely forgot about WordPress. I worked with that particular CMS for 5 years.</p>
<h3>Coming Back To WordPress</h3>
<p>After 5 years, my office got an international project in WordPress. My boss told me to lead the project. I was hesitant since I had lost touch with WordPress. But I decided this is a great opportunity to become a team leader and lead from front. I decided to update my WordPress skills. Google GOD came to my rescue again. I updated my skills and also taught my junior team members all about WordPress. My juniors team members who never knew anything about WordPress, started to love and use WordPress frequently after my training. My team completed the project in 2 weeks. This project got me back in WordPress for good.</p>
<p>As a team leader, one needs to help juniors to solve issues and guide them wherever necessary. I never always had the answer to their problems. I did not have any friends from the WordPress world who I can just talk to and discuss things. All my friends were either in dotNet OR commerce fields. For this reason, I was in look out for some kind group which would help me expand my scope of knowledge in WordPress.</p>
<h3>Finding the Community</h3>
<p>In 2015, when I was browsing Facebook, I came across an ad about WordCamp Mumbai. I missed out on the event by 2 days. Somehow I found the meetup website and joined the WordPress Mumbai meetup group.</p>
<p>At the beginning, I didn’t have time and there wasn’t any topic that interested or motivated me to attend the meetup. It was either clashing with shopping or work or outing with friends or something or the other. Finally, after months I found one interesting topic, and in the comments section, they had mentioned that it will be a beginner level workshop. Finally I decided attend the meetup at any cost. I rescheduled all my plans so I could attend the meetup.</p>
<p>I remember I was on my way to the meetup and was talking to my best friend on phone. I was a bit nervous as I didn’t know anyone there. I could not find the place for the meetup. I told my friend that I am taking a U-turn and going home. BUT to my disadvantage, I finally found the venue and I decided to attend the meetup. In the first 15 mins of the meetup I realized that it’s not a beginners topics. Once the meetup ended, I got up from my seat and left immediately. I was unhappy with the way it was presented.</p>
<blockquote><p>After a few months, another great topic was announced in the meetup group. My heart told me to take a chance again.</p></blockquote>
<p>Thankfully this time I knew the venue (same as last time). I attend the meetup and was happy with the way it was presented and learnt a few important tips. After the meetup was over the speaker took time and spoke to individual attendees. When he come to me, I took the opportunity and asked a couple of issues I had with one of my project. He sweetly gave me tips how to deal with my issues.</p>
<p>The next day to my surprise I receive a message from the team leader Alexander Gounder. He asked me if I want to speak at a meetup. I politely declined the offer as I was not confident. After this, for a couple of the next meetup, I attended and got to know a few people. During that period, there were talks about WordCamp Mumbai 2016.</p>
<h3>Taking Part In WordCamp</h3>
<p>I showed an interest to be a part of the team who handles WordCamp Mumbai. I thought WordCamp was a conference where 100 or more people attend it. On the first day of WordCamp Mumbai, I was surprised to see so many WordCamp enthusiastic attending and enjoying this event.</p>
<a href="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2018/12/wcmumbai16-group_photo.jpg"><img class="wp-image-2374 size-full" src="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2018/12/wcmumbai16-group_photo.jpg" alt="WordCamp Mumbai 2016" width="1000" height="358" /></a>WordCamp Mumbai 2016
<p>&nbsp;</p>
<a href="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2018/12/wcmumbai16-localhost-min.jpg"><img class="wp-image-2382 size-full" src="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2018/12/wcmumbai16-localhost-min.jpg" alt="" width="1000" height="664" /></a>WordCamp Mumbai 2016
<p>After seeing a successful WordCamp 2016, I try to attend as many meetups as possible.</p>
<p>I started with an entry-level role with basic responsibilities in my first WordCamp 2016. Gradually I started taking an active part in volunteering taking over more responsibilities. In WordCamp 2017 I handled speaker profiles and social media promotions. In WordCamp 2018, I am getting to know more about what all an organiser needs to do from planning to execution, to make the event the WordCamp an successful event.</p>
<p><b>WordCamp Mumbai 2017</b></p>
<a href="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2018/12/wcmumbai2017-1.jpg"><img class="size-full wp-image-2375" src="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2018/12/wcmumbai2017-1.jpg" alt="WordCamp Mumbai 2017" width="668" height="337" /></a>WordCamp Mumbai 2017
<p>After spending 3 years with WordPress Mumbai Community, I am glad to be part of this amazing team. My WordPress journey over the last two years has been excellent, filled with beautiful surprises.</p>
<p>I have been interviewed twice. Never in my wildest dreams did I ever thought that someone would interview me. <img src="https://s.w.org/images/core/emoji/2.3/72x72/1f642.png" alt="🙂" class="wp-smiley" /> My first ever interview was with <a href="https://www.wpwatercooler.com/video/community-connections-wordpress-at-home-in-india-w-meher-bala/">Bridget and Jen for Community Connections by WPwatercooler</a>. Second was with <a href="https://courses.wpshout.com/">David Hayes for WPShout on WordPress Security</a>.</p>
<p>Some highlights events are as below:</p>
<ol>
<li>Introduced to Rosie pins &#8211; Wapuu for Women Who WordPress.</li>
<li>Travelled to different cities across India, just to attended wordcamps.</li>
<li>Made many new friends locally and international.</li>
<li>Conducted a meetup on “Contributing to WordPress”.</li>
<li>Conducted a panel discussion at WC Nashik 2017.</li>
<li>Running a FB group especially for Indian WordPress Women Community.</li>
<li>Writing an article for HeroPress.</li>
<li>Contributing my part in the Marketing Team WordPress .</li>
</ol>
<table border="0">
<tbody>
<tr>
<td>
<p><a href="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2018/12/speaker-badge.jpg"><img class="wp-image-2376" src="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2018/12/speaker-badge-215x300.jpg" alt="Speaker Badge - WC Nashik 2017" width="300" height="418" /></a>Speaker Badge &#8211; WC Nashik 2017</td>
<td>
<p><a href="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2018/12/panel-discussion-selfie.jpg"><img class="wp-image-2377" src="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2018/12/panel-discussion-selfie-300x225.jpg" alt="Panel Group Selfie - WC Nashik 2017" width="400" height="300" /></a>Panel Group Selfie &#8211; WC Nashik 2017</td>
</tr>
<tr>
<td></td>
<td></td>
</tr>
<tr>
<td>
<p><a href="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2018/12/wp-profile.png"><img class="size-medium wp-image-2378" src="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2018/12/wp-profile-300x132.png" alt="Different Badges - WordPress Profile" width="300" height="132" /></a>Different Badges &#8211; WordPress Profile</td>
<td>
<p><a href="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2018/12/presentation-my-talk.jpg"><img class="wp-image-2379" src="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2018/12/presentation-my-talk-300x153.jpg" alt="Conducted my first meetup - WordPress Mumbai" width="400" height="204" /></a>Conducted my first meetup &#8211; WordPress Mumbai</td>
</tr>
</tbody>
</table>
<p><b>My wish list for 2018:</b></p>
<ol>
<li>Apply as a speaker in at least one the WordCamp.</li>
<li>Attend and volunteer at an International WordCamp.</li>
<li>Attend and volunteer at WordCamp US 2018.</li>
<li>Meeting Matt Mullenweg hopefully (Fingers crossed!).</li>
<li>Meeting all my lovely international virtual friends at one of the WordCamps.</li>
</ol>
<p>One of my biggest dreams would be to lead WordCamp Mumbai as a lead organiser.</p>
<blockquote><p>My advice to all who earn their livelihood from WordPress is to try and give back to the WordPress community in any way possible.</p></blockquote>
<p>I am sure you will either learn something new <b>or</b> teach something new to someone else <b>or</b> just make new friendships.</p>
<p>At the end of the article, I take the opportunity to thank my grantparents, parents and my sister for always standing by me and believing me. I thank my teacher Ms. Amita, my boss Mr. Ivan Bayross, my WordPress friends, and my virtual international friends for always guiding and motivating me to stay focussed and to keep learning new things in life.</p>
<p>A big thank you to Topher for giving me an opportunity to write about my life journey.</p>
<p>Being dyslexic I still make mistakes and I know that I&#8217;m not perfect. But I know for sure there is no harm in making mistakes. You need to learn from them and grow your skills. Don&#8217;t let your disabilities get in the way of your success. If you are reading this article and can connect with my story, do let me know in the comment section. I would love to hear from you.</p>
<div class="rtsocial-container rtsocial-container-align-right rtsocial-horizontal"><div class="rtsocial-twitter-horizontal"><div class="rtsocial-twitter-horizontal-button"><a title="Tweet: My Journey from being a Dyslexic kid to becoming A Co-organiser For WordCamp Mumbai" class="rtsocial-twitter-button" href="https://twitter.com/share?text=My%20Journey%20from%20being%20a%20Dyslexic%20kid%20to%20becoming%20A%20Co-organiser%20For%20WordCamp%20Mumbai&via=heropress&url=https%3A%2F%2Fheropress.com%2Fessays%2Fjourney-dyslexic-kid-becoming-co-organiser-wordcamp-mumbai%2F" rel="nofollow" target="_blank"></a></div></div><div class="rtsocial-fb-horizontal fb-light"><div class="rtsocial-fb-horizontal-button"><a title="Like: My Journey from being a Dyslexic kid to becoming A Co-organiser For WordCamp Mumbai" class="rtsocial-fb-button rtsocial-fb-like-light" href="https://www.facebook.com/sharer.php?u=https%3A%2F%2Fheropress.com%2Fessays%2Fjourney-dyslexic-kid-becoming-co-organiser-wordcamp-mumbai%2F" rel="nofollow" target="_blank"></a></div></div><div class="rtsocial-linkedin-horizontal"><div class="rtsocial-linkedin-horizontal-button"><a class="rtsocial-linkedin-button" href="https://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fheropress.com%2Fessays%2Fjourney-dyslexic-kid-becoming-co-organiser-wordcamp-mumbai%2F&title=My+Journey+from+being+a+Dyslexic+kid+to+becoming+A+Co-organiser+For+WordCamp+Mumbai" rel="nofollow" target="_blank" title="Share: My Journey from being a Dyslexic kid to becoming A Co-organiser For WordCamp Mumbai"></a></div></div><div class="rtsocial-pinterest-horizontal"><div class="rtsocial-pinterest-horizontal-button"><a class="rtsocial-pinterest-button" href="https://pinterest.com/pin/create/button/?url=https://heropress.com/essays/journey-dyslexic-kid-becoming-co-organiser-wordcamp-mumbai/&media=https://heropress.com/wp-content/uploads/2018/12/122717-150x150.jpg&description=My Journey from being a Dyslexic kid to becoming A Co-organiser For WordCamp Mumbai" rel="nofollow" target="_blank" title="Pin: My Journey from being a Dyslexic kid to becoming A Co-organiser For WordCamp Mumbai"></a></div></div><a rel="nofollow" class="perma-link" href="https://heropress.com/essays/journey-dyslexic-kid-becoming-co-organiser-wordcamp-mumbai/" title="My Journey from being a Dyslexic kid to becoming A Co-organiser For WordCamp Mumbai"></a></div><p>The post <a rel="nofollow" href="https://heropress.com/essays/journey-dyslexic-kid-becoming-co-organiser-wordcamp-mumbai/">My Journey from being a Dyslexic kid to becoming A Co-organiser For WordCamp Mumbai</a> appeared first on <a rel="nofollow" href="https://heropress.com">HeroPress</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 27 Dec 2017 02:23:42 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Meher Bala";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:25;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:29:"Matt: NORAD’s Santa Tracker";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:43:"https://ma.tt/2017/12/norads-santa-tracker/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:43:"https://ma.tt/2017/12/norads-santa-tracker/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:432:"<p>Politico has <a href="https://www.politico.com/amp/story/2017/12/24/norads-crazy-santa-cause-260254">a lovely story on the history and present of the NORAD Santa Tracker</a>, which started because a 1955 Sears department store ad had &#8220;a digit wrong — and was instead the direct line into the secret military nerve center in Colorado Springs, Colo., where the Pentagon was on the lookout to prevent nuclear war.&#8221;</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 24 Dec 2017 14:25:16 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:26;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:50:"Dev Blog: WordPress User Survey Data for 2015-2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://wordpress.org/news/?p=5310";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:76:"https://wordpress.org/news/2017/12/wordpress-user-survey-data-for-2015-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:61756:"<p>For many years, we&#8217;ve invited folks to tell us how they use WordPress by filling out an annual survey. In the past, interesting results from this survey have been shared in the annual <a href="https://ma.tt/2017/12/state-of-the-word-2017/">State of the Word</a> address. This year, for the first time, the results of the 2017 survey are being published on WordPress News, along with the results of the 2015 and 2016 survey.</p>
<p>So that information from the survey doesn&#8217;t reveal anything that respondents might consider private, we do not publish a full export of the raw data. We’d love to make this information as accessible as possible, though, so if you have a suggestion for an OS project or tool we can put the data into that allows people to play with it that still protects individual response privacy, please leave a comment on this post!</p>
<h4>Major Groups</h4>
<p>This survey features multiple groups, dividing respondents at the first question:</p>
<blockquote><p>Which of the following best describes how you use WordPress? (<em>Mandatory</em>)</p></blockquote>
<p>Those who selected &#8220;I&#8217;m a designer or developer, or I work for a company that designs/develops websites; I use WordPress to build websites and/or blogs for others. (This might include theme development, writing plugins, or other custom work.)&#8221; were served questions from what we&#8217;ll call the &#8220;WordPress Professionals&#8221; group.</p>
<p>This &#8220;WordPress Professionals&#8221; group is further divided into WordPress Company and WordPress Freelancer/Hobbyist groups, based on how the respondent answered the question, &#8220;Which of the following best describes your involvement with WordPress? (2015) / Do you work for a company, or on your own? (2016-17).&#8221;</p>
<p>Those who selected &#8220;I own, run, or contribute to a blog or website that is built with WordPress.&#8221; were served questions in what we&#8217;re calling the &#8220;WordPress Users&#8221; group.</p>
<p>The relevant survey group is noted in each table below. In the case of questions that were served to different groups in 2015 but then served to all respondents in 2016 and 2017, the group responses from 2015 have been consolidated into one set of data for easier comparison between years.</p>
<h4>Survey results</h4>
<p><a href="https://wordpress.org/news/feed/#pro">Jump to answers from WordPress Professionals</a></p>
<p><a href="https://wordpress.org/news/feed/#user">Jump to answers from WordPress Users</a></p>
<p><a href="https://wordpress.org/news/feed/#all">Jump to answers from All Respondents</a></p>
<p><!--td {border: 1px solid #ccc;}br {mso-data-placement:same-cell;}--></p>
<h3>Which of the following best describes how you use WordPress? (Mandatory)</h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="51" />
<col width="47" />
<col width="51" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td>Number of responses (since this question was mandatory, the number of responses here is the total number for the survey)</td>
<td>45,995</td>
<td></td>
<td>15,585</td>
<td></td>
<td>16,029</td>
<td></td>
</tr>
<tr>
<td>I&#8217;m a designer or developer, or I work for a company that designs/develops websites; I use WordPress to build websites and/or blogs for others. (This might include theme development, writing plugins, other custom work.)</td>
<td>26,662</td>
<td>58%</td>
<td>8,838</td>
<td>57%</td>
<td>9,099</td>
<td>57%</td>
</tr>
<tr>
<td>I own, run, or contribute to a blog or website that is built with WordPress.</td>
<td>16,130</td>
<td>35%</td>
<td>5,293</td>
<td>34%</td>
<td>5,625</td>
<td>35%</td>
</tr>
<tr>
<td>Neither of the above.</td>
<td>3,204</td>
<td>7%</td>
<td>1,460</td>
<td>9%</td>
<td>1,306</td>
<td>8%</td>
</tr>
</tbody>
</table>
<h2 id="pro">WordPress Professionals</h2>
<h3><strong>Which of the following best describes your involvement with WordPress? (Mandatory, 2015) / Do you work for a company, or on your own? (Mandatory, 2016-17)</strong></h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: WordPress Professional</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses</td>
<td>26,699</td>
<td></td>
<td>8,838</td>
<td></td>
<td>9,101</td>
<td></td>
</tr>
<tr>
<td>My primary job is working for a company or organization that uses WordPress.</td>
<td>9,505</td>
<td>36%</td>
<td>3,529</td>
<td>40%</td>
<td>3,660</td>
<td>40%</td>
</tr>
<tr>
<td>My primary job is as a self-employed designer or developer that uses WordPress.</td>
<td>9,310</td>
<td>35%</td>
<td>3,188</td>
<td>36%</td>
<td>3,440</td>
<td>38%</td>
</tr>
<tr>
<td>I earn money from part-time or occasional freelance work involving WordPress.</td>
<td>5,954</td>
<td>22%</td>
<td>1,633</td>
<td>18%</td>
<td>1,590</td>
<td>17%</td>
</tr>
<tr>
<td>Work that I do involving WordPress is just a hobby, I don&#8217;t make money from it.</td>
<td>1,930</td>
<td>7%</td>
<td>491</td>
<td>6%</td>
<td>411</td>
<td>5%</td>
</tr>
</tbody>
</table>
<h3>How does your company or organization work with WordPress?</h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: WordPress Company</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses</td>
<td>9,342</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Build/design and/or maintain websites or blogs for other people, companies, or organizations.</td>
<td>7,772</td>
<td>27%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Develop or customize themes.</td>
<td>5,404</td>
<td>19%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Build/design and/or maintain websites or blogs for my own use.</td>
<td>4,733</td>
<td>16%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Host websites for customers.</td>
<td>4,397</td>
<td>15%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Develop or distribute plugins.</td>
<td>3,181</td>
<td>11%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Provide educational resources to help others to use WordPress.</td>
<td>1,349</td>
<td>5%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Sponsor and/or attend WordCamps.</td>
<td>1,127</td>
<td>4%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Contribute bug reports and/or patches to WordPress core.</td>
<td>914</td>
<td>3%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Other Option</td>
<td>182</td>
<td> 1%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses</td>
<td></td>
<td></td>
<td>3,457</td>
<td></td>
<td>3,598</td>
<td></td>
</tr>
<tr>
<td>We make websites for others.</td>
<td></td>
<td></td>
<td>2,695</td>
<td>24%</td>
<td>2,722</td>
<td>23%</td>
</tr>
<tr>
<td>We make websites for ourselves.</td>
<td></td>
<td></td>
<td>2,355</td>
<td>21%</td>
<td>2,470</td>
<td>21%</td>
</tr>
<tr>
<td>We develop or customize themes.</td>
<td></td>
<td></td>
<td>1,866</td>
<td>16%</td>
<td>1,910</td>
<td>16%</td>
</tr>
<tr>
<td>We host websites for others.</td>
<td></td>
<td></td>
<td>1,564</td>
<td>14%</td>
<td>1,595</td>
<td>14%</td>
</tr>
<tr>
<td>We develop or distribute plugins.</td>
<td></td>
<td></td>
<td>1,283</td>
<td>11%</td>
<td>1,342</td>
<td>11%</td>
</tr>
<tr>
<td>We provide educational resources to help others to use WordPress.</td>
<td></td>
<td></td>
<td>581</td>
<td>5%</td>
<td>631</td>
<td>5%</td>
</tr>
<tr>
<td>We sponsor and/or attend WordCamps.</td>
<td></td>
<td></td>
<td>561</td>
<td>5%</td>
<td>579</td>
<td>5%</td>
</tr>
<tr>
<td>We contribute bug reports and/or patches to WordPress core.</td>
<td></td>
<td></td>
<td>444</td>
<td>4%</td>
<td>468</td>
<td>4%</td>
</tr>
<tr>
<td>Other Option</td>
<td></td>
<td></td>
<td>98</td>
<td>1%</td>
<td>96</td>
<td>1%</td>
</tr>
</tbody>
</table>
<p><strong>How would you describe the business of your typical client(s)? (2015) / How would you describe the business of your typical client/customer? (2016, 2017)</strong></p>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: WordPress Company</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses</td>
<td>9,154</td>
<td></td>
<td>3,317</td>
<td></td>
<td>3,498</td>
<td></td>
</tr>
<tr>
<td>Small business</td>
<td>6,893</td>
<td>32%</td>
<td>2,398</td>
<td>31%</td>
<td>2,510</td>
<td>31%</td>
</tr>
<tr>
<td>Large business or Enterprise</td>
<td>3,635</td>
<td>17%</td>
<td>1,361</td>
<td>18%</td>
<td>1,447</td>
<td>18%</td>
</tr>
<tr>
<td>Non-profit</td>
<td>2,644</td>
<td>12%</td>
<td>934</td>
<td>12%</td>
<td>992</td>
<td>12%</td>
</tr>
<tr>
<td>Individual</td>
<td>2,600</td>
<td>12%</td>
<td>888</td>
<td>12%</td>
<td>1,022</td>
<td>12%</td>
</tr>
<tr>
<td>Education</td>
<td>2,344</td>
<td>11%</td>
<td>854</td>
<td>11%</td>
<td>966</td>
<td>12%</td>
</tr>
<tr>
<td>Website development (sub-contracting)</td>
<td>2,065</td>
<td>10%</td>
<td>637</td>
<td>8%</td>
<td>677</td>
<td>8%</td>
</tr>
<tr>
<td>Government</td>
<td>1,410</td>
<td>6%</td>
<td>524</td>
<td>7%</td>
<td>552</td>
<td>7%</td>
</tr>
<tr>
<td>Other Option</td>
<td>127</td>
<td>1%</td>
<td>66</td>
<td>1%</td>
<td>64</td>
<td>1%</td>
</tr>
</tbody>
</table>
<p><strong>How does your company or organization use WordPress when developing websites? (2015) / When making websites, how does your company or organization use WordPress? (2016, 2017)</strong></p>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: WordPress Company</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses</td>
<td>9,078</td>
<td></td>
<td>3,369</td>
<td></td>
<td>3,552</td>
<td></td>
</tr>
<tr>
<td>Mostly as a content management system (CMS)</td>
<td>6,361</td>
<td>70%</td>
<td>2,482</td>
<td>74%</td>
<td>2,640</td>
<td>74%</td>
</tr>
<tr>
<td>About half the time as a blogging platform and half the time as a CMS</td>
<td>1,222</td>
<td>13%</td>
<td>370</td>
<td>11%</td>
<td>383</td>
<td>11%</td>
</tr>
<tr>
<td>Mostly as a blogging platform</td>
<td>721</td>
<td>8%</td>
<td>137</td>
<td>4%</td>
<td>129</td>
<td>4%</td>
</tr>
<tr>
<td>Mostly as an application framework</td>
<td>629</td>
<td>7%</td>
<td>303</td>
<td>9%</td>
<td>303</td>
<td>9%</td>
</tr>
<tr>
<td>Other Option</td>
<td>145</td>
<td>2%</td>
<td>78</td>
<td>2%</td>
<td>97</td>
<td>3%</td>
</tr>
</tbody>
</table>
<h3>How much is your average WordPress site customized from the original WordPress installation?</h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: WordPress Company</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses</td>
<td>9,054</td>
<td></td>
<td>3,302</td>
<td></td>
<td>3,473</td>
<td></td>
</tr>
<tr>
<td>A lot of work has been done, the front end is unrecognizable, but the Dashboard still looks like the usual WordPress interface.</td>
<td>5,651</td>
<td>62%</td>
<td>2,025</td>
<td>61%</td>
<td>2,105</td>
<td>61%</td>
</tr>
<tr>
<td>There&#8217;s a different theme and some plugins have been added.</td>
<td>2,230</td>
<td>25%</td>
<td>799</td>
<td>24%</td>
<td>905</td>
<td>26%</td>
</tr>
<tr>
<td>Not at all, it&#8217;s still pretty much the same as the original download.</td>
<td>756</td>
<td>8%</td>
<td>302</td>
<td>9%</td>
<td>298</td>
<td>9%</td>
</tr>
<tr>
<td>You&#8217;d never know this was a WordPress installation, everything (including the admin) has been customized.</td>
<td>417</td>
<td>5%</td>
<td>177</td>
<td>5%</td>
<td>165</td>
<td>5%</td>
</tr>
</tbody>
</table>
<h3>Roughly how many currently active WordPress sites has your company or organization built?</h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="51" />
<col width="47" />
<col width="51" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: WordPress Company</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses</td>
<td>8,801</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>200 +</td>
<td>1,074</td>
<td>12%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>51 &#8211; 200</td>
<td>1,721</td>
<td>20%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>21 &#8211; 50</td>
<td>1,718</td>
<td>20%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>11 &#8211; 20</td>
<td>1,284</td>
<td>15%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>6 &#8211; 10</td>
<td>1,109</td>
<td>13%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>2 &#8211; 5</td>
<td>1,418</td>
<td>16%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>1</td>
<td>390</td>
<td>4%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>0</td>
<td>87</td>
<td>1%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses</td>
<td></td>
<td></td>
<td>3,358</td>
<td></td>
<td>3,540</td>
<td></td>
</tr>
<tr>
<td>Thousands.</td>
<td></td>
<td></td>
<td>291</td>
<td>9%</td>
<td>331</td>
<td>9%</td>
</tr>
<tr>
<td>Hundreds.</td>
<td></td>
<td></td>
<td>770</td>
<td>23%</td>
<td>894</td>
<td>25%</td>
</tr>
<tr>
<td>Fewer than a hundred.</td>
<td></td>
<td></td>
<td>1,144</td>
<td>34%</td>
<td>1,177</td>
<td>33%</td>
</tr>
<tr>
<td>Just a few, but they are really great.</td>
<td></td>
<td></td>
<td>926</td>
<td>28%</td>
<td>896</td>
<td>25%</td>
</tr>
<tr>
<td>Prefer not to answer.</td>
<td></td>
<td></td>
<td>228</td>
<td>7%</td>
<td>242</td>
<td>7%</td>
</tr>
</tbody>
</table>
<h3>How many person-hours (of your company&#8217;s work) does the typical site take to complete?</h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="51" />
<col width="47" />
<col width="51" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: WordPress Company</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses</td>
<td>9,091</td>
<td></td>
<td>3,353</td>
<td></td>
<td>3,522</td>
<td></td>
</tr>
<tr>
<td>More than 200</td>
<td>939</td>
<td>10%</td>
<td>309</td>
<td>9%</td>
<td>325</td>
<td>9%</td>
</tr>
<tr>
<td>100 &#8211; 200</td>
<td>1080</td>
<td>12%</td>
<td>329</td>
<td>10%</td>
<td>367</td>
<td>10%</td>
</tr>
<tr>
<td>60 &#8211; 100</td>
<td>1541</td>
<td>17%</td>
<td>527</td>
<td>16%</td>
<td>513</td>
<td>15%</td>
</tr>
<tr>
<td>40 &#8211; 60</td>
<td>1854</td>
<td>20%</td>
<td>583</td>
<td>17%</td>
<td>620</td>
<td>18%</td>
</tr>
<tr>
<td>20 &#8211; 40</td>
<td>2066</td>
<td>23%</td>
<td>691</td>
<td>21%</td>
<td>685</td>
<td>19%</td>
</tr>
<tr>
<td>Fewer than 20</td>
<td>1611</td>
<td>18%</td>
<td>479</td>
<td>14%</td>
<td>519</td>
<td>15%</td>
</tr>
<tr>
<td>Prefer not to answer (2016, 2017)</td>
<td></td>
<td></td>
<td>436</td>
<td>13%</td>
<td>493</td>
<td>14%</td>
</tr>
</tbody>
</table>
<h3>Roughly what percentage of your company or organization&#8217;s output is based around WordPress (as opposed to other platforms or software)?</h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="51" />
<col width="47" />
<col width="51" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: WordPress Company</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses</td>
<td>8,950</td>
<td></td>
<td>3,345</td>
<td></td>
<td>3,503</td>
<td></td>
</tr>
<tr>
<td>100 %</td>
<td>1,089</td>
<td>12%</td>
<td>438</td>
<td>13%</td>
<td>480</td>
<td>14%</td>
</tr>
<tr>
<td>90 %</td>
<td>1,043</td>
<td>12%</td>
<td>417</td>
<td>12%</td>
<td>459</td>
<td>13%</td>
</tr>
<tr>
<td>80 %</td>
<td>955</td>
<td>11%</td>
<td>367</td>
<td>11%</td>
<td>424</td>
<td>12%</td>
</tr>
<tr>
<td>70 %</td>
<td>831</td>
<td>9%</td>
<td>305</td>
<td>9%</td>
<td>344</td>
<td>10%</td>
</tr>
<tr>
<td>60 %</td>
<td>534</td>
<td>6%</td>
<td>246</td>
<td>7%</td>
<td>226</td>
<td>6%</td>
</tr>
<tr>
<td>50 %</td>
<td>973</td>
<td>11%</td>
<td>335</td>
<td>10%</td>
<td>338</td>
<td>10%</td>
</tr>
<tr>
<td>40 %</td>
<td>613</td>
<td>7%</td>
<td>245</td>
<td>7%</td>
<td>202</td>
<td>6%</td>
</tr>
<tr>
<td>30 %</td>
<td>877</td>
<td>10%</td>
<td>335</td>
<td>10%</td>
<td>310</td>
<td>9%</td>
</tr>
<tr>
<td>20 %</td>
<td>806</td>
<td>9%</td>
<td>242</td>
<td>7%</td>
<td>280</td>
<td>8%</td>
</tr>
<tr>
<td>10 %</td>
<td>1,039</td>
<td>12%</td>
<td>344</td>
<td>10%</td>
<td>348</td>
<td>10%</td>
</tr>
<tr>
<td>0 %</td>
<td>190</td>
<td>2%</td>
<td>72</td>
<td>2%</td>
<td>92</td>
<td>3%</td>
</tr>
</tbody>
</table>
<h3>In which of the following ways do you work with WordPress?</h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: WordPress Freelancer/Hobbyist</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses</td>
<td>17,009</td>
<td></td>
<td>5,221</td>
<td></td>
<td>5,425</td>
<td></td>
</tr>
<tr>
<td>Build/design and/or maintain websites or blogs for other people, companies, or organizations</td>
<td>15,342</td>
<td>34%</td>
<td>4,795</td>
<td>34%</td>
<td>5,064</td>
<td>34%</td>
</tr>
<tr>
<td>Develop or customize themes</td>
<td>10,549</td>
<td>24%</td>
<td>2,997</td>
<td>21%</td>
<td>3,021</td>
<td>20%</td>
</tr>
<tr>
<td>Host websites for customers</td>
<td>8,142</td>
<td>18%</td>
<td>2,466</td>
<td>17%</td>
<td>2,728</td>
<td>18%</td>
</tr>
<tr>
<td>Develop or distribute plugins</td>
<td>4,125</td>
<td>9%</td>
<td>1,395</td>
<td>10%</td>
<td>1,416</td>
<td>9%</td>
</tr>
<tr>
<td>Provide educational resources to help others to use WordPress</td>
<td>3,276</td>
<td>7%</td>
<td>1,187</td>
<td>8%</td>
<td>1,308</td>
<td>9%</td>
</tr>
<tr>
<td>Sponsor and/or attend WordCamps</td>
<td>1,559</td>
<td>4%</td>
<td>648</td>
<td>5%</td>
<td>724</td>
<td>5%</td>
</tr>
<tr>
<td>Contribute bug reports and/or patches to WordPress core</td>
<td>1,107</td>
<td>2%</td>
<td>381</td>
<td>3%</td>
<td>393</td>
<td>3%</td>
</tr>
<tr>
<td>Other Option</td>
<td>389</td>
<td>1%</td>
<td>243</td>
<td>2%</td>
<td>299</td>
<td>2%</td>
</tr>
</tbody>
</table>
<h3>How would you describe the business of your typical client(s)?</h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: WordPress Freelancer/Hobbyist</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses</td>
<td>16,863</td>
<td></td>
<td>5,151</td>
<td></td>
<td>5,353</td>
<td></td>
</tr>
<tr>
<td>Small business</td>
<td>14,185</td>
<td>35%</td>
<td>4,342</td>
<td>35%</td>
<td>4,622</td>
<td>36%</td>
</tr>
<tr>
<td>Individual</td>
<td>8,513</td>
<td>21%</td>
<td>2,581</td>
<td>21%</td>
<td>2,583</td>
<td>20%</td>
</tr>
<tr>
<td>Non-profit</td>
<td>6,585</td>
<td>16%</td>
<td>2,004</td>
<td>16%</td>
<td>2,113</td>
<td>16%</td>
</tr>
<tr>
<td>Website development (sub-contracting)</td>
<td>4,301</td>
<td>11%</td>
<td>1,258</td>
<td>10%</td>
<td>1,216</td>
<td>9%</td>
</tr>
<tr>
<td>Education</td>
<td>3,458</td>
<td>8%</td>
<td>1,049</td>
<td>8%</td>
<td>1,139</td>
<td>9%</td>
</tr>
<tr>
<td>Large business or Enterprise</td>
<td>2,391</td>
<td>6%</td>
<td>805</td>
<td>6%</td>
<td>857</td>
<td>7%</td>
</tr>
<tr>
<td>Government</td>
<td>1,150</td>
<td>3%</td>
<td>300</td>
<td>2%</td>
<td>329</td>
<td>3%</td>
</tr>
<tr>
<td>Other Option</td>
<td>173</td>
<td>0%</td>
<td>101</td>
<td>1%</td>
<td>99</td>
<td>1%</td>
</tr>
</tbody>
</table>
<h3>How do you use WordPress in your development?</h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: WordPress Freelancer/Hobbyist</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses</td>
<td>16,768</td>
<td></td>
<td>5,145</td>
<td></td>
<td>5,372</td>
<td></td>
</tr>
<tr>
<td>Mostly as a content management system (CMS)</td>
<td>11,754</td>
<td>70%</td>
<td>3,641</td>
<td>71%</td>
<td>3,959</td>
<td>74%</td>
</tr>
<tr>
<td>About half the time as a blogging platform and half the time as a CMS</td>
<td>2,825</td>
<td>17%</td>
<td>812</td>
<td>16%</td>
<td>721</td>
<td>13%</td>
</tr>
<tr>
<td>Mostly as an application framework</td>
<td>1,012</td>
<td>6%</td>
<td>343</td>
<td>7%</td>
<td>344</td>
<td>6%</td>
</tr>
<tr>
<td>Mostly as a blogging platform</td>
<td>992</td>
<td>6%</td>
<td>246</td>
<td>5%</td>
<td>226</td>
<td>4%</td>
</tr>
<tr>
<td>Other Option</td>
<td>185</td>
<td>1%</td>
<td>105</td>
<td>2%</td>
<td>122</td>
<td>2%</td>
</tr>
</tbody>
</table>
<h3>How much is your average WordPress site customized from the original WordPress installation?</h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: WordPress Freelancer/Hobbyist</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses</td>
<td>16,699</td>
<td></td>
<td>5,131</td>
<td></td>
<td>5,317</td>
<td></td>
</tr>
<tr>
<td>A lot of work has been done, the front end is unrecognizable, but the Dashboard still looks like the usual WordPress interface.</td>
<td>9,457</td>
<td>57%</td>
<td>2,837</td>
<td>55%</td>
<td>2,998</td>
<td>56%</td>
</tr>
<tr>
<td>There&#8217;s a different theme and some plugins have been added.</td>
<td>5,526</td>
<td>33%</td>
<td>1,694</td>
<td>33%</td>
<td>1,781</td>
<td>34%</td>
</tr>
<tr>
<td>Not at all, it&#8217;s still pretty much the same as the original download.</td>
<td>977</td>
<td>6%</td>
<td>341</td>
<td>7%</td>
<td>310</td>
<td>6%</td>
</tr>
<tr>
<td>You&#8217;d never know this was a WordPress installation, everything (including the admin) has been customized.</td>
<td>739</td>
<td>4%</td>
<td>261</td>
<td>5%</td>
<td>228</td>
<td>4%</td>
</tr>
</tbody>
</table>
<h3>How many currently active WordPress sites have you built? (2015) / Roughly how many currently active WordPress sites have you built? (2016, 2017)</h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: WordPress Freelancer/Hobbyist</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses</td>
<td>16,690</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>200 +</td>
<td>514</td>
<td>3%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>51 &#8211; 200</td>
<td>1,728</td>
<td>10%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>21 &#8211; 50</td>
<td>3,000</td>
<td>18%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>11 &#8211; 20</td>
<td>3,146</td>
<td>19%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>6 &#8211; 10</td>
<td>3,405</td>
<td>20%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>2 &#8211; 5</td>
<td>3,838</td>
<td>23%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>1</td>
<td>698</td>
<td>4%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>0</td>
<td>361</td>
<td>2%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses</td>
<td></td>
<td></td>
<td>5,165</td>
<td></td>
<td>5367</td>
<td></td>
</tr>
<tr>
<td>Thousands.</td>
<td></td>
<td></td>
<td>110</td>
<td>2%</td>
<td>104</td>
<td>2%</td>
</tr>
<tr>
<td>Hundreds.</td>
<td></td>
<td></td>
<td>603</td>
<td>12%</td>
<td>713</td>
<td>13%</td>
</tr>
<tr>
<td>Fewer than a hundred.</td>
<td></td>
<td></td>
<td>2,264</td>
<td>44%</td>
<td>2,457</td>
<td>46%</td>
</tr>
<tr>
<td>Just a few, but they are really great.</td>
<td></td>
<td></td>
<td>1,871</td>
<td>36%</td>
<td>1,813</td>
<td>34%</td>
</tr>
<tr>
<td>Prefer not to answer.</td>
<td></td>
<td></td>
<td>319</td>
<td>6%</td>
<td>280</td>
<td>5%</td>
</tr>
</tbody>
</table>
<h3>Roughly what percentage of your working time is spent working with WordPress?</h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: WordPress Freelancer/Hobbyist</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses</td>
<td>16,658</td>
<td></td>
<td>5,039</td>
<td></td>
<td>5,241</td>
<td></td>
</tr>
<tr>
<td>100 %</td>
<td>949</td>
<td>6%</td>
<td>459</td>
<td>9%</td>
<td>461</td>
<td>9%</td>
</tr>
<tr>
<td>90 %</td>
<td>1,300</td>
<td>8%</td>
<td>527</td>
<td>10%</td>
<td>540</td>
<td>10%</td>
</tr>
<tr>
<td>80 %</td>
<td>1,784</td>
<td>11%</td>
<td>637</td>
<td>13%</td>
<td>711</td>
<td>14%</td>
</tr>
<tr>
<td>70 %</td>
<td>1,850</td>
<td>11%</td>
<td>608</td>
<td>12%</td>
<td>627</td>
<td>12%</td>
</tr>
<tr>
<td>60 %</td>
<td>1,313</td>
<td>8%</td>
<td>438</td>
<td>9%</td>
<td>465</td>
<td>9%</td>
</tr>
<tr>
<td>50 %</td>
<td>2,095</td>
<td>13%</td>
<td>612</td>
<td>12%</td>
<td>639</td>
<td>12%</td>
</tr>
<tr>
<td>40 %</td>
<td>1,438</td>
<td>9%</td>
<td>391</td>
<td>8%</td>
<td>384</td>
<td>7%</td>
</tr>
<tr>
<td>30 %</td>
<td>2,076</td>
<td>12%</td>
<td>530</td>
<td>11%</td>
<td>511</td>
<td>10%</td>
</tr>
<tr>
<td>20 %</td>
<td>1,743</td>
<td>10%</td>
<td>445</td>
<td>9%</td>
<td>429</td>
<td>8%</td>
</tr>
<tr>
<td>10 %</td>
<td>1,819</td>
<td>11%</td>
<td>342</td>
<td>7%</td>
<td>419</td>
<td>8%</td>
</tr>
<tr>
<td>0 %</td>
<td>291</td>
<td>2%</td>
<td>52</td>
<td>1%</td>
<td>55</td>
<td>1%</td>
</tr>
</tbody>
</table>
<h3>How many hours of your work does the typical site take to complete? (2015) / How many hours of work does your typical WordPress project take to launch? (2016, 2017)</h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="51" />
<col width="47" />
<col width="51" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: WordPress Freelancer/Hobbyist</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses</td>
<td>16,670</td>
<td></td>
<td>5,164</td>
<td></td>
<td>5,378</td>
<td></td>
</tr>
<tr>
<td>More than 200</td>
<td>503</td>
<td>3%</td>
<td>222</td>
<td>4%</td>
<td>245</td>
<td>5%</td>
</tr>
<tr>
<td>100 &#8211; 200</td>
<td>973</td>
<td>6%</td>
<td>386</td>
<td>7%</td>
<td>393</td>
<td>7%</td>
</tr>
<tr>
<td>60 &#8211; 100</td>
<td>2,277</td>
<td>14%</td>
<td>788</td>
<td>15%</td>
<td>815</td>
<td>15%</td>
</tr>
<tr>
<td>40 &#8211; 60</td>
<td>3,896</td>
<td>23%</td>
<td>1,153</td>
<td>22%</td>
<td>1,216</td>
<td>23%</td>
</tr>
<tr>
<td>20 &#8211; 40</td>
<td>6,068</td>
<td>36%</td>
<td>1,487</td>
<td>29%</td>
<td>1,582</td>
<td>29%</td>
</tr>
<tr>
<td>Fewer than 20</td>
<td>2,953</td>
<td>18%</td>
<td>712</td>
<td>14%</td>
<td>751</td>
<td>14%</td>
</tr>
<tr>
<td>Prefer not to answer</td>
<td></td>
<td></td>
<td>418</td>
<td>8%</td>
<td>376</td>
<td>7%</td>
</tr>
</tbody>
</table>
<h3>Which of the following have you done with WordPress?</h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" /> </colgroup>
</table>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: WordPress Professional (Company/Freelancer/Hobbyist)</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses</td>
<td>20,687</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>I’ve written a theme from scratch.</td>
<td>11,894</td>
<td>25%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>I’ve written a plugin.</td>
<td>9,719</td>
<td>21%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>I&#8217;ve answered a question in the WordPress forum.</td>
<td>8,805</td>
<td>19%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>I&#8217;ve attended a WordPress meetup.</td>
<td>4,062</td>
<td>9%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>I&#8217;ve submitted a WordPress bug report.</td>
<td>4,062</td>
<td>9%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>I&#8217;ve attended a WordCamp.</td>
<td>3,571</td>
<td>8%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>I&#8217;ve contributed to WordPress documentation.</td>
<td>1,778</td>
<td>4%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Other Option</td>
<td>1,739</td>
<td>4%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>I&#8217;ve contributed a WordPress core patch.</td>
<td>1,055</td>
<td>2%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>
<h3>What&#8217;s the best thing about WordPress?<a href="https://wordpress.org/news/feed/#text">*</a></h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: WordPress Professional</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses</td>
<td>22,718</td>
<td></td>
<td>7,891</td>
<td></td>
<td>8,267</td>
<td></td>
</tr>
<tr>
<td>Easy/simple/user-friendly</td>
<td>9,450</td>
<td>42%</td>
<td>3,454</td>
<td>44%</td>
<td>3,852</td>
<td>47%</td>
</tr>
<tr>
<td>Customizable/extensible/modular/plugins/themes</td>
<td>8,601</td>
<td>38%</td>
<td>3,116</td>
<td>39%</td>
<td>3,555</td>
<td>43%</td>
</tr>
<tr>
<td>Community/support/documentation/help</td>
<td>3,806</td>
<td>17%</td>
<td>1,211</td>
<td>15%</td>
<td>1,340</td>
<td>16%</td>
</tr>
<tr>
<td>Free/open/open source</td>
<td>2,291</td>
<td>10%</td>
<td>802</td>
<td>10%</td>
<td>908</td>
<td>11%</td>
</tr>
<tr>
<td>Popular/ubiquitous</td>
<td>249</td>
<td>1%</td>
<td>86</td>
<td>1%</td>
<td>187</td>
<td>2%</td>
</tr>
</tbody>
</table>
<h3> What&#8217;s the most frustrating thing about WordPress?<a href="https://wordpress.org/news/feed/#text">*</a></h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: WordPress Professional</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses</td>
<td>21,144</td>
<td></td>
<td>7,294</td>
<td></td>
<td>7,691</td>
<td></td>
</tr>
<tr>
<td>Plugins &amp; themes (abandoned/conflicts/coding standards)</td>
<td>6,122</td>
<td>29%</td>
<td>2,194</td>
<td>30%</td>
<td>2,187</td>
<td>28%</td>
</tr>
<tr>
<td>Security/vulnerabilities/hacks</td>
<td>2,321</td>
<td>11%</td>
<td>712</td>
<td>10%</td>
<td>829</td>
<td>11%</td>
</tr>
<tr>
<td>Updates</td>
<td>1,544</td>
<td>7%</td>
<td>422</td>
<td>6%</td>
<td>508</td>
<td>7%</td>
</tr>
<tr>
<td>Nothing/I don&#8217;t know/can&#8217;t think of anything</td>
<td>1,276</td>
<td>6%</td>
<td>344</td>
<td>5%</td>
<td>476</td>
<td>6%</td>
</tr>
<tr>
<td>Speed/performance/slow/heavy</td>
<td>1,196</td>
<td>6%</td>
<td>644</td>
<td>9%</td>
<td>516</td>
<td>7%</td>
</tr>
</tbody>
</table>
<h3>WordPress is as good as, or better than, its main competitors.</h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: WordPress Professional</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses (this question was not asked in the 2015 survey)</td>
<td></td>
<td></td>
<td>8,672</td>
<td></td>
<td>9,059</td>
<td></td>
</tr>
<tr>
<td>Agree</td>
<td></td>
<td></td>
<td>7551</td>
<td>87%</td>
<td>7836</td>
<td>87%</td>
</tr>
<tr>
<td>Prefer not to answer</td>
<td></td>
<td></td>
<td>754</td>
<td>9%</td>
<td>795</td>
<td>9%</td>
</tr>
<tr>
<td>Disagree</td>
<td></td>
<td></td>
<td>370</td>
<td>4%</td>
<td>428</td>
<td>5%</td>
</tr>
</tbody>
</table>
<h2 id="user">WordPress Users</h2>
<h3>Which of the following describes how you use WordPress?</h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: WordPress User</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses</td>
<td>15,169</td>
<td></td>
<td>5,043</td>
<td></td>
<td>5,521</td>
<td></td>
</tr>
<tr>
<td>My personal blog (or blogs) uses WordPress.</td>
<td>9,395</td>
<td>36%</td>
<td>3,117</td>
<td>36%</td>
<td>3,424</td>
<td>36%</td>
</tr>
<tr>
<td>My company or organization&#8217;s website is built with WordPress software.</td>
<td>7,480</td>
<td>29%</td>
<td>2,519</td>
<td>29%</td>
<td>2,841</td>
<td>30%</td>
</tr>
<tr>
<td>I have a hobby or side project that has a website built with WordPress.</td>
<td>6,112</td>
<td>23%</td>
<td>1,973</td>
<td>23%</td>
<td>2,200</td>
<td>23%</td>
</tr>
<tr>
<td>I write (or otherwise work) for an online publication that uses WordPress.</td>
<td>2,329</td>
<td>9%</td>
<td>806</td>
<td>9%</td>
<td>821</td>
<td>9%</td>
</tr>
<tr>
<td>Other Option</td>
<td>872</td>
<td>3%</td>
<td>234</td>
<td>3%</td>
<td>288</td>
<td>3%</td>
</tr>
</tbody>
</table>
<h3>Who installed your WordPress website?</h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: WordPress User</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses</td>
<td>15,055</td>
<td></td>
<td>5,020</td>
<td></td>
<td>5,523</td>
<td></td>
</tr>
<tr>
<td>I did.</td>
<td>11,216</td>
<td>66%</td>
<td>3,659</td>
<td>73%</td>
<td>4,129</td>
<td>75%</td>
</tr>
<tr>
<td>My hosting provider</td>
<td>2,236</td>
<td>13%</td>
<td>667</td>
<td>13%</td>
<td>767</td>
<td>14%</td>
</tr>
<tr>
<td>An external company</td>
<td>909</td>
<td>5%</td>
<td>182</td>
<td>4%</td>
<td>178</td>
<td>3%</td>
</tr>
<tr>
<td>An internal web person/team or a colleague</td>
<td>874</td>
<td>5%</td>
<td>178</td>
<td>4%</td>
<td>191</td>
<td>3%</td>
</tr>
<tr>
<td>A friend or family member</td>
<td>787</td>
<td>5%</td>
<td>192</td>
<td>4%</td>
<td>172</td>
<td>3%</td>
</tr>
<tr>
<td>I don&#8217;t know</td>
<td>502</td>
<td>3%</td>
<td>145</td>
<td>3%</td>
<td>87</td>
<td>2%</td>
</tr>
<tr>
<td>Other Option</td>
<td>345</td>
<td>2%</td>
<td>n/a</td>
<td>n/a</td>
<td>n/a</td>
<td>n/a</td>
</tr>
</tbody>
</table>
<h3>How much has the site been customized from the original WordPress installation?</h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: WordPress User</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses</td>
<td>14,789</td>
<td></td>
<td>4,997</td>
<td></td>
<td>5,494</td>
<td></td>
</tr>
<tr>
<td>There&#8217;s a different theme and some plugins have been added.</td>
<td>7,465</td>
<td>50%</td>
<td>2,337</td>
<td>47%</td>
<td>2,660</td>
<td>48%</td>
</tr>
<tr>
<td>A lot of work has been done, the site itself is unrecognizable from the original theme, but the Dashboard still looks like the usual WordPress interface.</td>
<td>4,715</td>
<td>32%</td>
<td>1,707</td>
<td>34%</td>
<td>1,872</td>
<td>34%</td>
</tr>
<tr>
<td>Not at all, it&#8217;s still pretty much the same as it was when I started out.</td>
<td>1,841</td>
<td>12%</td>
<td>635</td>
<td>13%</td>
<td>673</td>
<td>12%</td>
</tr>
<tr>
<td>You&#8217;d never know this was a WordPress installation, everything has been customized.</td>
<td>768</td>
<td>5%</td>
<td>321</td>
<td>6%</td>
<td>290</td>
<td>5%</td>
</tr>
</tbody>
</table>
<h3>What&#8217;s the best thing about WordPress?<a href="https://wordpress.org/news/feed/#text">*</a></h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: WordPress User</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses</td>
<td>14,328</td>
<td></td>
<td>4,613</td>
<td></td>
<td>5,076</td>
<td></td>
</tr>
<tr>
<td>Easy/simple/user-friendly</td>
<td>7,391</td>
<td>52%</td>
<td>2,276</td>
<td>49%</td>
<td>2,511</td>
<td>49%</td>
</tr>
<tr>
<td>Customizable/extensible/modular/plugins/themes</td>
<td>4,219</td>
<td>29%</td>
<td>1,569</td>
<td>34%</td>
<td>1,632</td>
<td>32%</td>
</tr>
<tr>
<td>Free/open/open source</td>
<td>1,586</td>
<td>11%</td>
<td>493</td>
<td>11%</td>
<td>538</td>
<td>11%</td>
</tr>
<tr>
<td>Community/support/documentation/help</td>
<td>1,085</td>
<td>8%</td>
<td>388</td>
<td>8%</td>
<td>458</td>
<td>9%</td>
</tr>
<tr>
<td>Popular/ubiquitous</td>
<td>223</td>
<td>2%</td>
<td>74</td>
<td>2%</td>
<td>48</td>
<td>1%</td>
</tr>
</tbody>
</table>
<h3>What&#8217;s the most frustrating thing about WordPress?<a href="https://wordpress.org/news/feed/#text">*</a></h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: WordPress User</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses</td>
<td>13,681</td>
<td></td>
<td>4,287</td>
<td></td>
<td>4,758</td>
<td></td>
</tr>
<tr>
<td>Plugins &amp; themes (abandoned/conflicts/coding standards)</td>
<td>2,531</td>
<td>19%</td>
<td>1,183</td>
<td>28%</td>
<td>1,300</td>
<td>27%</td>
</tr>
<tr>
<td>Customization/design/look/template</td>
<td>1,273</td>
<td>9%</td>
<td>381</td>
<td>9%</td>
<td>408</td>
<td>9%</td>
</tr>
<tr>
<td>Code/coding/PHP</td>
<td>931</td>
<td>7%</td>
<td>306</td>
<td>7%</td>
<td>277</td>
<td>6%</td>
</tr>
<tr>
<td>Updates</td>
<td>926</td>
<td>7%</td>
<td>209</td>
<td>5%</td>
<td>296</td>
<td>6%</td>
</tr>
<tr>
<td>Security/vulnerabilites/hacks</td>
<td>785</td>
<td>6%</td>
<td>255</td>
<td>6%</td>
<td>292</td>
<td>6%</td>
</tr>
</tbody>
</table>
<h3>WordPress is as good as, or better than, its main competitors.</h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="51" />
<col width="47" />
<col width="51" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: WordPress User</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses</td>
<td></td>
<td></td>
<td>5,026</td>
<td></td>
<td>5,498</td>
<td></td>
</tr>
<tr>
<td>Agree</td>
<td></td>
<td></td>
<td>4,038</td>
<td>80%</td>
<td>4,462</td>
<td>81%</td>
</tr>
<tr>
<td>Prefer not to answer</td>
<td></td>
<td></td>
<td>737</td>
<td>15%</td>
<td>782</td>
<td>14%</td>
</tr>
<tr>
<td>Disagree</td>
<td></td>
<td></td>
<td>254</td>
<td>5%</td>
<td>255</td>
<td>5%</td>
</tr>
</tbody>
</table>
<h2 id="all">All Respondents</h2>
<h3>Can you (truthfully!) say &#8220;I make my living from WordPress&#8221;?</h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: All Respondents</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses (combination of all three groups from 2015; this question was not broken out by group in 2016-2017)</td>
<td>42,236</td>
<td></td>
<td>14,906</td>
<td></td>
<td>15,616</td>
<td></td>
</tr>
<tr>
<td>Not really, but I do get some or all of my income as a result of working with WordPress.</td>
<td>16,607</td>
<td>39%</td>
<td>5,408</td>
<td>36%</td>
<td>5,702</td>
<td>37%</td>
</tr>
<tr>
<td>Yes.</td>
<td>9,635</td>
<td>23%</td>
<td>4,791</td>
<td>32%</td>
<td>5,033</td>
<td>32%</td>
</tr>
<tr>
<td>No.</td>
<td>15,995</td>
<td>38%</td>
<td>4,713</td>
<td>32%</td>
<td>4,882</td>
<td>31%</td>
</tr>
</tbody>
</table>
<h3>Which devices do you access WordPress on?</h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: All Respondents</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses (combination of all three groups from 2015; this question was not broken out by group in 2016-2017)</td>
<td>42,433</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Web</td>
<td>40,503</td>
<td>95%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Android phone</td>
<td>15,396</td>
<td>36%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>iPhone</td>
<td>12,353</td>
<td>29%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>iPad</td>
<td>11,748</td>
<td>28%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Android tablet</td>
<td>9,223</td>
<td>22%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Desktop app, like MarsEdit</td>
<td>6,018</td>
<td>14%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Other Option</td>
<td>1837</td>
<td>4%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses (this question was not broken out by group in 2016-2017)</td>
<td></td>
<td></td>
<td>14,840</td>
<td></td>
<td>15,597</td>
<td></td>
</tr>
<tr>
<td>Web browser on a desktop or laptop</td>
<td></td>
<td></td>
<td>14,160</td>
<td>54%</td>
<td>15,052</td>
<td>55%</td>
</tr>
<tr>
<td>Web browser on a mobile device (tablet or phone)</td>
<td></td>
<td></td>
<td>7,952</td>
<td>30%</td>
<td>8,248</td>
<td>30%</td>
</tr>
<tr>
<td>An app on a mobile device (table or phone)</td>
<td></td>
<td></td>
<td>3,309</td>
<td>13%</td>
<td>3,311</td>
<td>12%</td>
</tr>
<tr>
<td>A desktop app like MarsEdit</td>
<td></td>
<td></td>
<td>517</td>
<td>2%</td>
<td>498</td>
<td>2%</td>
</tr>
<tr>
<td>Other Option</td>
<td></td>
<td></td>
<td>282</td>
<td>1%</td>
<td>240</td>
<td>1%</td>
</tr>
</tbody>
</table>
<h3>WordPress now updates minor &amp; security releases automatically for you. Check all that apply: (question not asked in 2016, 2017)</h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="36" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: All Respondents</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses (combination of all three groups)</td>
<td>39,726</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>I love auto-updates.</td>
<td>17,367</td>
<td>44%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>I&#8217;d like to see auto-updates for plugins.</td>
<td>12,796</td>
<td>32%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Initially, I was nervous about auto updates.</td>
<td>11,868</td>
<td>30%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Auto updates still make me nervous.</td>
<td>10,809</td>
<td>27%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Auto updates don&#8217;t make me nervous now.</td>
<td>10,708</td>
<td>27%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>I&#8217;d like to see auto-updates for themes.</td>
<td>10,449</td>
<td>26%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>I&#8217;d like to see auto updates for major versions of WordPress.</td>
<td>10,225</td>
<td>26%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>This is the first I&#8217;ve heard of auto-updates.</td>
<td>8,660</td>
<td>22%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>I hate auto-updates.</td>
<td>3,293</td>
<td>8%</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>
<h3>What is your gender?<a href="https://wordpress.org/news/feed/#text">*</a></h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="51" />
<col width="47" />
<col width="51" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: All respondents (This question was not asked in the 2015 survey.)</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses</td>
<td></td>
<td></td>
<td>13,953</td>
<td></td>
<td>14,680</td>
<td></td>
</tr>
<tr>
<td>Male</td>
<td></td>
<td></td>
<td>10,978</td>
<td>78.68%</td>
<td>11,570</td>
<td>78.81%</td>
</tr>
<tr>
<td>Female</td>
<td></td>
<td></td>
<td>2,340</td>
<td>16.77%</td>
<td>2,511</td>
<td>21.70%</td>
</tr>
<tr>
<td>Prefer not to answer</td>
<td></td>
<td></td>
<td>601</td>
<td>4.31%</td>
<td>562</td>
<td>3.83%</td>
</tr>
<tr>
<td>Transgender</td>
<td></td>
<td></td>
<td>11</td>
<td>0.08%</td>
<td>8</td>
<td>0.05%</td>
</tr>
<tr>
<td>Nonbinary</td>
<td></td>
<td></td>
<td>8</td>
<td>0.06%</td>
<td>17</td>
<td>0.12%</td>
</tr>
<tr>
<td>Genderqueer</td>
<td></td>
<td></td>
<td>4</td>
<td>0.03%</td>
<td>3</td>
<td>0.02%</td>
</tr>
<tr>
<td>Androgynous</td>
<td></td>
<td></td>
<td>6</td>
<td>0.04%</td>
<td>5</td>
<td>0.03%</td>
</tr>
<tr>
<td>Fluid</td>
<td></td>
<td></td>
<td>3</td>
<td>0.02%</td>
<td>4</td>
<td>0.03%</td>
</tr>
<tr>
<td>Demimale</td>
<td></td>
<td></td>
<td>2</td>
<td>0.01%</td>
<td>0</td>
<td>0</td>
</tr>
</tbody>
</table>
<h3>Where are you located?</h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="51" />
<col width="47" />
<col width="51" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: All respondents (This question was not asked in the 2015 survey.)</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses</td>
<td></td>
<td></td>
<td>14,562</td>
<td></td>
<td>15,343</td>
<td></td>
</tr>
<tr>
<td>United States</td>
<td></td>
<td></td>
<td>3,770</td>
<td>25.89%</td>
<td>4,067</td>
<td>26.51%</td>
</tr>
<tr>
<td>India</td>
<td></td>
<td></td>
<td>1,456</td>
<td>10.00%</td>
<td>1,424</td>
<td>9.28%</td>
</tr>
<tr>
<td>United Kingdom</td>
<td></td>
<td></td>
<td>810</td>
<td>5.56%</td>
<td>900</td>
<td>5.87%</td>
</tr>
<tr>
<td>Germany</td>
<td></td>
<td></td>
<td>555</td>
<td>3.81%</td>
<td>729</td>
<td>4.75%</td>
</tr>
<tr>
<td>Canada</td>
<td></td>
<td></td>
<td>511</td>
<td>3.51%</td>
<td>599</td>
<td>3.90%</td>
</tr>
<tr>
<td>Australia</td>
<td></td>
<td></td>
<td>389</td>
<td>2.67%</td>
<td>460</td>
<td>3.00%</td>
</tr>
<tr>
<td>Italy</td>
<td></td>
<td></td>
<td>298</td>
<td>2.05%</td>
<td>356</td>
<td>2.32%</td>
</tr>
<tr>
<td>Netherlands</td>
<td></td>
<td></td>
<td>343</td>
<td>2.36%</td>
<td>350</td>
<td>2.28%</td>
</tr>
<tr>
<td>France</td>
<td></td>
<td></td>
<td>232</td>
<td>1.59%</td>
<td>283</td>
<td>1.84%</td>
</tr>
<tr>
<td>Bangladesh</td>
<td></td>
<td></td>
<td>257</td>
<td>1.76%</td>
<td>263</td>
<td>1.71%</td>
</tr>
<tr>
<td>Spain</td>
<td></td>
<td></td>
<td>271</td>
<td>1.86%</td>
<td>252</td>
<td>1.64%</td>
</tr>
<tr>
<td>Brazil</td>
<td></td>
<td></td>
<td>239</td>
<td>1.64%</td>
<td>251</td>
<td>1.64%</td>
</tr>
<tr>
<td>Pakistan</td>
<td></td>
<td></td>
<td>254</td>
<td>1.74%</td>
<td>240</td>
<td>1.56%</td>
</tr>
<tr>
<td>Indonesia</td>
<td></td>
<td></td>
<td>230</td>
<td>1.58%</td>
<td>226</td>
<td>1.47%</td>
</tr>
<tr>
<td>Iran, Islamic Republic of</td>
<td></td>
<td></td>
<td>190</td>
<td>1.30%</td>
<td>173</td>
<td>1.13%</td>
</tr>
<tr>
<td>Sweden</td>
<td></td>
<td></td>
<td>144</td>
<td>0.99%</td>
<td>173</td>
<td>1.13%</td>
</tr>
<tr>
<td>Nigeria</td>
<td></td>
<td></td>
<td>196</td>
<td>1.35%</td>
<td>172</td>
<td>1.12%</td>
</tr>
<tr>
<td>South Africa</td>
<td></td>
<td></td>
<td>193</td>
<td>1.33%</td>
<td>172</td>
<td>1.12%</td>
</tr>
<tr>
<td>Russian Federation</td>
<td></td>
<td></td>
<td>181</td>
<td>1.24%</td>
<td>151</td>
<td>0.98%</td>
</tr>
<tr>
<td>Poland</td>
<td></td>
<td></td>
<td>129</td>
<td>0.89%</td>
<td>137</td>
<td>0.89%</td>
</tr>
<tr>
<td>Romania</td>
<td></td>
<td></td>
<td>144</td>
<td>0.99%</td>
<td>132</td>
<td>0.86%</td>
</tr>
<tr>
<td>Switzerland</td>
<td></td>
<td></td>
<td>122</td>
<td>0.84%</td>
<td>130</td>
<td>0.85%</td>
</tr>
<tr>
<td>Philippines</td>
<td></td>
<td></td>
<td>92</td>
<td>0.63%</td>
<td>125</td>
<td>0.81%</td>
</tr>
<tr>
<td>China</td>
<td></td>
<td></td>
<td>136</td>
<td>0.93%</td>
<td>123</td>
<td>0.80%</td>
</tr>
<tr>
<td>Austria</td>
<td></td>
<td></td>
<td>89</td>
<td>0.61%</td>
<td>122</td>
<td>0.80%</td>
</tr>
<tr>
<td>Ukraine</td>
<td></td>
<td></td>
<td>105</td>
<td>0.72%</td>
<td>118</td>
<td>0.77%</td>
</tr>
<tr>
<td>Denmark</td>
<td></td>
<td></td>
<td>107</td>
<td>0.73%</td>
<td>114</td>
<td>0.74%</td>
</tr>
<tr>
<td>Greece</td>
<td></td>
<td></td>
<td>120</td>
<td>0.82%</td>
<td>114</td>
<td>0.74%</td>
</tr>
<tr>
<td>Portugal</td>
<td></td>
<td></td>
<td>94</td>
<td>0.65%</td>
<td>109</td>
<td>0.71%</td>
</tr>
<tr>
<td>Vietnam</td>
<td></td>
<td></td>
<td>101</td>
<td>0.69%</td>
<td>108</td>
<td>0.70%</td>
</tr>
<tr>
<td>Mexico</td>
<td></td>
<td></td>
<td>94</td>
<td>0.65%</td>
<td>105</td>
<td>0.68%</td>
</tr>
<tr>
<td>Nepal</td>
<td></td>
<td></td>
<td>76</td>
<td>0.52%</td>
<td>97</td>
<td>0.63%</td>
</tr>
<tr>
<td>Ireland</td>
<td></td>
<td></td>
<td>72</td>
<td>0.49%</td>
<td>94</td>
<td>0.61%</td>
</tr>
<tr>
<td>Israel</td>
<td></td>
<td></td>
<td>78</td>
<td>0.54%</td>
<td>94</td>
<td>0.61%</td>
</tr>
<tr>
<td>New Zealand</td>
<td></td>
<td></td>
<td>77</td>
<td>0.53%</td>
<td>91</td>
<td>0.59%</td>
</tr>
<tr>
<td>Finland</td>
<td></td>
<td></td>
<td>63</td>
<td>0.43%</td>
<td>90</td>
<td>0.59%</td>
</tr>
<tr>
<td>Turkey</td>
<td></td>
<td></td>
<td>91</td>
<td>0.62%</td>
<td>86</td>
<td>0.56%</td>
</tr>
<tr>
<td>Malaysia</td>
<td></td>
<td></td>
<td>91</td>
<td>0.62%</td>
<td>81</td>
<td>0.53%</td>
</tr>
<tr>
<td>Belgium</td>
<td></td>
<td></td>
<td>84</td>
<td>0.58%</td>
<td>79</td>
<td>0.51%</td>
</tr>
<tr>
<td>Norway</td>
<td></td>
<td></td>
<td>66</td>
<td>0.45%</td>
<td>79</td>
<td>0.51%</td>
</tr>
<tr>
<td>Argentina</td>
<td></td>
<td></td>
<td>65</td>
<td>0.45%</td>
<td>76</td>
<td>0.50%</td>
</tr>
<tr>
<td>Bulgaria</td>
<td></td>
<td></td>
<td>74</td>
<td>0.51%</td>
<td>72</td>
<td>0.47%</td>
</tr>
<tr>
<td>Japan</td>
<td></td>
<td></td>
<td>61</td>
<td>0.42%</td>
<td>68</td>
<td>0.44%</td>
</tr>
<tr>
<td>Thailand</td>
<td></td>
<td></td>
<td>69</td>
<td>0.47%</td>
<td>67</td>
<td>0.44%</td>
</tr>
<tr>
<td>Czech Republic</td>
<td></td>
<td></td>
<td>76</td>
<td>0.52%</td>
<td>66</td>
<td>0.43%</td>
</tr>
<tr>
<td>Serbia</td>
<td></td>
<td></td>
<td>89</td>
<td>0.61%</td>
<td>63</td>
<td>0.41%</td>
</tr>
<tr>
<td>Kenya</td>
<td></td>
<td></td>
<td>58</td>
<td>0.40%</td>
<td>62</td>
<td>0.40%</td>
</tr>
<tr>
<td>Colombia</td>
<td></td>
<td></td>
<td>39</td>
<td>0.27%</td>
<td>59</td>
<td>0.38%</td>
</tr>
<tr>
<td>Egypt</td>
<td></td>
<td></td>
<td>40</td>
<td>0.27%</td>
<td>52</td>
<td>0.34%</td>
</tr>
</tbody>
</table>
<h3>What is your age?</h3>
<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
<colgroup>
<col width="554" />
<col width="47" />
<col width="36" />
<col width="47" />
<col width="51" />
<col width="47" />
<col width="51" /></colgroup>
<tbody>
<tr>
<td></td>
<td colspan="2" rowspan="1"><strong>2015</strong></td>
<td colspan="2" rowspan="1"><strong>2016</strong></td>
<td colspan="2" rowspan="1"><strong>2017</strong></td>
</tr>
<tr>
<td><em>Group: All Respondents</em></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>Number of responses (This question was not asked in 2015.)</td>
<td></td>
<td></td>
<td>14,944</td>
<td></td>
<td>15,636</td>
<td></td>
</tr>
<tr>
<td>60 and over</td>
<td></td>
<td></td>
<td>1,139</td>
<td>8%</td>
<td>1,641</td>
<td>11%</td>
</tr>
<tr>
<td>50-59</td>
<td></td>
<td></td>
<td>1,537</td>
<td>10%</td>
<td>1,996</td>
<td>13%</td>
</tr>
<tr>
<td>40-49</td>
<td></td>
<td></td>
<td>2,205</td>
<td>15%</td>
<td>2,643</td>
<td>17%</td>
</tr>
<tr>
<td>30-39</td>
<td></td>
<td></td>
<td>3,914</td>
<td>26%</td>
<td>3,972</td>
<td>25%</td>
</tr>
<tr>
<td>20-29</td>
<td></td>
<td></td>
<td>5,013</td>
<td>34%</td>
<td>4,444</td>
<td>28%</td>
</tr>
<tr>
<td>Under 20</td>
<td></td>
<td></td>
<td>1142</td>
<td>8%</td>
<td>941</td>
<td>6%</td>
</tr>
</tbody>
</table>
<p>Thank you to everyone who made time to fill out the survey &#8212; we&#8217;re so happy you use WordPress, and we&#8217;re very grateful that you&#8217;re willing to share your experiences with us! Thanks also to everyone who spread the word about this survey, and to those of you who read all the way to the bottom of this post. <img src="https://s.w.org/images/core/emoji/2.3/72x72/1f609.png" alt="😉" class="wp-smiley" /></p>
<p><small><a id="text"></a>*Text Field Questions: Each survey included some questions that could be answered only by filling out a text field. In the case of the questions &#8220;What is the best thing about WordPress?&#8221; and &#8220;What is the most frustrating thing about WordPress?&#8221; we listed the five most common responses, aggregated when applicable. In the case of the question “What is your gender?” in the 2016 and 2017 surveys, we aggregated responses as best we could. Responses meant to obscure respondents’ gender entirely are aggregated in “prefer not to answer.”</small></p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 22 Dec 2017 21:40:57 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Andrea Middleton";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:27;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:82:"WPTavern: WPWeekly Episode 298 – GDPR, User Privacy, and More With Heather Burns";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:58:"https://wptavern.com?p=77110&preview=true&preview_id=77110";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:87:"https://wptavern.com/wpweekly-episode-298-gdpr-user-privacy-and-more-with-heather-burns";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2570:"<p>In this episode, <a href="https://jjj.blog/">John James Jacoby</a> and I are joined by <a href="https://twitter.com/webdevlaw?lang=en">Heather Burns</a>, Founder of <a href="https://webdevlaw.uk/">WebDevLaw</a>. We have a lengthy discussion about <a href="https://www.eugdpr.org/">GDPR</a> (General Data Protection Regulation), what it is, what&#8217;s at stake, and its potential impacts on the WordPress ecosystem. We also discuss the cultural differences between the North American and European views on user privacy.</p>
<p>When asked what she hopes to see as we approach May of 2018, Burns replied:</p>
<p>&#8220;I want to see all hands on deck making WordPress a force for good, that people can trust, and that people can be empowered to change for the better. Don&#8217;t let the fact that it involves law put you off. GDPR is a toolkit for empowerment, it&#8217;s a means for protecting and safeguarding your users in these quite scary times we&#8217;re living in. And it will make you a better developer and site administrator in the end.&#8221;</p>
<p>For questions related to GDPR or how to make your site or WordPress plugins compliant, <a href="https://webdevlaw.uk/">please get in touch with Burns</a>. You can also <a href="https://videopress.com/v/JkKwb2zi">view her presentation</a> on WordPress.TV from WordCamp Belfast, 2016.</p>
<h2>Stories Discussed:</h2>
<p><a href="https://wptavern.com/wp-site-care-acquires-wp-radius">WP Site Care Acquires WP Radius</a></p>
<h2>Picks of the Week:</h2>
<p><a href="https://frontenberg.tomjn.com/">Frontenberg</a> by Tom J. Nowell is a new site that displays Gutenberg to the frontend of WordPress. It allows visitors to tinker with Gutenberg without having to login to a site or install a plugin.</p>
<p>John gave props to <a href="https://github.com/renatonascalves">Renato Alves</a> who has been working on adding WP-CLI support for <a href="https://github.com/bbpress/wp-cli-bbpress">bbPress</a> and <a href="https://github.com/buddypress/wp-cli-buddypress">BuddyPress</a>.</p>
<h2>WPWeekly Meta:</h2>
<p><strong>Next Episode:</strong> Wednesday, December 27th 18th 3:00 P.M. Eastern</p>
<p>Subscribe to <a href="https://itunes.apple.com/us/podcast/wordpress-weekly/id694849738">WordPress Weekly via Itunes</a></p>
<p>Subscribe to <a href="https://www.wptavern.com/feed/podcast">WordPress Weekly via RSS</a></p>
<p>Subscribe to <a href="http://www.stitcher.com/podcast/wordpress-weekly-podcast?refid=stpr">WordPress Weekly via Stitcher Radio</a></p>
<p><strong>Listen To Episode #298:</strong><br />
</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 21 Dec 2017 01:21:42 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:28;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Matt: Design in Kentucky";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:22:"https://ma.tt/?p=47730";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:41:"https://ma.tt/2017/12/design-in-kentucky/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:352:"<p>Fast Company Design has written ﻿<a href="https://www.fastcodesign.com/90154530/tech-has-a-diversity-problem-so-this-designer-went-to-kentucky">Tech Has A Diversity Problem–So This Designer Went To Kentucky</a>, about John Maeda&#x27;s work pairing some of the top designers in the world with students in Paintsville, Kentucky. </p>



<p></p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 20 Dec 2017 21:17:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:29;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:41:"WPTavern: WP Site Care Acquires WP Radius";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:29:"https://wptavern.com/?p=77086";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:52:"https://wptavern.com/wp-site-care-acquires-wp-radius";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1407:"<p><a href="https://www.wpsitecare.com">WP Site Care</a>, a WordPress management and maintenance service provider<a href="https://www.wpsitecare.com/weve-acquired-wp-radius/"> has acquired</a> <a href="https://www.wpradius.com/">WP Radius</a>.﻿ Ryan Sullivan, Founder of WP Site Care, says the acquisition has been in the works for some time. </p>



<p>"We’ve been working toward growing our customer base and learning about new business models in the WordPress support space for quite some time, and the WP Radius acquisition allows us to accomplish both of those goals," he said.<br /></p>



<p>The move increases WP Site Care&#x27;s customer base by 20% and will allow it to experiment with <a href="https://www.wpradius.com/plans/">an unlimited jobs model</a>, something that set WP Radius apart. </p>



<p>"We’ve been very interested in the unlimited jobs model and what that really means from an operations standpoint for quite some time, and whether or not it’s <em>actually</em> better for customers, so this move will allow us to learn a lot more about how that all plays out in the real world," Sullivan said.</p>



<p>WP Radius will continue to operate as a separate entity and will eventually be consolidated into the WP Site Care brand. </p>



<p>WP Radius was founded in 2015 by Todd Schwartzfarb and Brandon Yanofsky. Financial details of the acquisition were not disclosed. </p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 20 Dec 2017 19:38:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:30;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:51:"HeroPress: WordPress allowed me to have a Dream Job";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:56:"https://heropress.com/?post_type=heropress-essays&p=2357";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:128:"https://heropress.com/essays/wordpress-allowed-dream-job/#utm_source=rss&utm_medium=rss&utm_campaign=wordpress-allowed-dream-job";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:13902:"<img width="960" height="480" src="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2017/12/121917-1024x512.jpg" class="attachment-large size-large wp-post-image" alt="Pull Quote: You know that you should never stop dreaming, right?" /><p>I was always interested in computers but I did not know I would become a developer. As a kid, a dream job, was playing and reviewing video games. I believe, many kids had a similar dream job. I guess, that’s where I started seeing a dream job would be a job where you would be happy to go to and maybe even sad when going from it.</p>
<p>Today, I see myself as having a dream job. Let me tell you how I got to my current situation.</p>
<h3>Programming was not for me</h3>
<p>While going to high school, I was introduced to programming. We did some Turbo C++ and I could not understand a thing. Even a simple for-loop was hard for me. I would rather play Counter-Strike with friends who attended that class. After that, as I did not understand programming, I chose not to follow such career path. I did not want my parents to pay for my college expenses since I would have to go to another city. Especially since I realised I don’t understand how to code.</p>
<p>Since I live in Croatia, I did not have access to a high speed internet. At that time, a high speed internet was an ADSL with a download speed of 200kb/s.</p>
<blockquote><p>I was using the 56k modem which was too expensive so I had only 2 hours per week to spend on it.</p></blockquote>
<p>I used those 2 hours for playing games instead of learning.</p>
<p>Once I got the ADSL, somewhere near the end of high school, I was able to get my hands on Photoshop and learned how to manipulate images. After high school, I went to the Maritime College but soon after I knew I did not want to spend years and years working on ships, not seeing my family or friends. That was not my dream job.</p>
<h3>Second Try</h3>
<p>I decided to give another chance to programming, but with a different learning path. Since I already knew how to use Photoshop, I realized there was an option “Slice for Web..”. That was my first introduction to web development.</p>
<p>I knew having a web page composed of images from Photoshop was not how it should be done. I was used to 56k modem and I knew how a page like that would take long to load.</p>
<p>The luck was on my side now since I had ADSL and I could spend hours and hours weekly search the Internet. I searched how to slice images and prepare them for web pages by reading PSD Tuts+. Back then there were only PSD and Net TutsPlus sites in their network.</p>
<p>I learned a lot on PSD to HTML and how to use CSS to style your web sites. After that, I wanted to learn how do blogging sites work. How do they show those articles. I mean, it couldn’t be that for each article, they would open one HTML file and edit it. That’s just too much work. So, I found about PHP and MySQL and got some courses on Lynda on that.</p>
<p>I learned about creating a blog using PHP and MySQL. I also learned a little on advanced coding and I was really happy with my knowledge. All that was just a month or two from where I knew nothing on programming.</p>
<h3>Looking for a CMS</h3>
<p>With my knowledge, I knew how to build various types of sites. I asked other businesses if I could build a site for them in return of a favour or even product. Some of them were up to that. I didn’t want to charge since I knew I still had a lot to learn.</p>
<p>After a while, I was a bit tired (read: lazy) of building SQL tables and all the base functions for each project. I wanted to see if there are some tools I could use for a faster development. Something that would give me a starting point with basic functionalities such as content, users, settings etc.</p>
<p>After reading a lot of tutorials on PHP, I also read about Joomla, WordPress and similar. So I went for both. I was so confused by Joomla and how everything I wanted to do required me several clicks. After that, I tried WordPress. I loved it. Joomla had articles, which you could set as pages. WordPress had Posts and Pages. I really loved how everything was so easy to setup. At that time, there were no custom post types or featured images, but I did not need them yet. I was just beginning my journey with WordPress.</p>
<p>From there forward I downloaded many themes and plugins just to read their code and learn how they’ve been developed.</p>
<h3>The First Breadcrumbs &amp; Disappointments</h3>
<p>Even though I did not know too much, I did know how to develop something, how to use a library and integrate it into my own and so on.</p>
<blockquote><p>The first time I realised that WordPress could help me have a dream job is when I created a simple Dropbox plugin for my own needs.</p></blockquote>
<p>Once I’ve built it and scanned through CodeCanyon, I saw there was nothing like that (now there are several). So I went and uploaded it there. It went live after a week or so.</p>
<p>I did not expect much from it. I could gather around $300 from it after several months. As a college student who didn’t work on a side job, such income was really great for me.</p>
<p>That is where it all started for me. I decided to use WordPress for any new projects and build custom ones to learn more.</p>
<p>Don’t get me wrong. It was not so easy to get new projects. I did get a job as a student which was a failure in the sense that I did not get paid for it. I also had another freelancing experience that was not good. But that did not let me down.</p>
<p>You WILL get those clients from hell. It is something I think most of us get to know. But in time, you will learn how to identify such clients and pass on such projects.</p>
<p>Fast forward a year and I got a job where I did not use WordPress. But I did not intend to leave it. I joined Elance (now Upwork) so I could earn some side money using WordPress.</p>
<p>I did not earn anything on Elance and on my daily job, for a year, I was getting only 60% of the monthly paycheck because the Company did not have enough money. Somehow they did get the other 40% by the end of the month.</p>
<p>But can you imagine how stressful was that? You can never know if you can travel or save some money. I could not afford purchasing a course which could improve my knowledge.</p>
<p>I had a job where I liked to work, but the money situation was really stressful and I did not want to rely just on the company. WordPress to the rescue!</p>
<h3>WordPress Community</h3>
<p>Not long after, I learned about WordPress Croatia. Before that, I never used social media for such discussions and networking. That Facebook group was the first group I joined to discuss about WordPress and help each other.</p>
<p>That was really a great experience. I learned about WordCamps and Meetups and that group pushed me into making my first eBook on WordPress. Another product I was able to earn some side money which involved WordPress. My mindset started to change.</p>
<blockquote><p>By helping others through teaching and discussion, I can also help the WordPress Community.</p></blockquote>
<p>My first experience on public speaking was on a WordPress Meetup in Zagreb. I would never go if I was not invited by Emanuel Blagonić. A great guy who with his brother Lucijan and several other folks really started a WordPress movement in Croatia.</p>
<p>I never seen anything like that before. People helping each others, going so much to take their own free time to fix or at least investigate a bug on someone else’s site. I really liked it and wanted to be a part of such a community.</p>
<p>Even if such a community does not help you directly to land a job or get a new gig, it really does help you indirectly with all the knowledge that is shared (from development to business).</p>
<h3>Teaching &amp; Job Opportunities</h3>
<p>Because of the WordPress community in Croatia, I wanted to help by teaching others. So I also started a site where I have written a lot of tutorials on WordPress development. That site was in Croatian so people can start much sooner (even if they don’t know English).</p>
<p>I used to sleep only for 2 to 3 hours so I could get up much earlier and start to write tutorials or make videos. I did not have a microphone at first, so I used a webcam as a microphone. You can imagine how awful the audio was. Even if it’s in Croatian, you can check the quality of it on <a href="https://www.youtube.com/channel/UCzcRclnBSnJRPM5h4PfnqWw">YouTube</a>.</p>
<blockquote><p>But I was really happy I could help someone who knows less than me.</p></blockquote>
<p>By teaching, I have learned a lot and I am so thankful to the community which was one of the reasons I kept going like that. I also got invited to several WordPress projects just because people saw me as someone who understands WordPress.</p>
<h3>WordCamps &amp; WebCamps</h3>
<p>You can make friends there. Seems a bit odd maybe, but you can. Due to the community I made some friends such as Ana &amp; Marko from <a href="https://www.anarieldesign.com/">anarieldesign.com</a> and Goran Jakovljević from <a href="https://wpgens.com/">wpgens.com</a>.</p>
<p>We have become friends through the community on social media. I’ve met them all just after a year or so on WordCamp Zagreb 2017. But we talked as if we were friends for years and years. I’ve seen how people from all over the world talk to each other and how a friendly and welcoming this WordPress Community is.</p>
<p>Even today, I frequently talk to all of them and we help each other as we can. That is something that you can’t have everywhere.</p>
<p><a href="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2017/12/codeable.png"><img class="alignleft size-medium wp-image-2359" src="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2017/12/codeable-300x270.png" alt="Codeable sticker on a ski helmet" width="300" height="270" /></a>My dream job progress came after WebCamp Zagreb 2016 where I met other people from the IT community. I got introduced to Toptal and just a month from it, I joined Toptal. Codeable was also something I wanted to try and I did. As if those platform communicated together, I got invited into <a href="https://codeable.io/">Codeable</a> a week after I joined <a href="https://www.toptal.com/">Toptal</a>.</p>
<p>That is where it all has started getting real to me. I was able to freelance as much as I wanted and when I wanted. It was the first time I could go do my hobbies without worrying about money.</p>
<h3>The Dream Job we all seek</h3>
<p>My definition of a dream job is the feeling when you’re waking up happy and not sad because you have to go to work. Such job should also challenge you so you learn something new. Sometimes it may even get you out of your comfort zone, but you’ll be a better person because of it.</p>
<p>I still have an occupied day, working on a daily job and then working with my own clients. It may not suit all. But I am finally able to feel somehow financially free, going happy to work and making friends while doing it. Even if I don’t have any side projects, I am working on my plugins and writing tutorials on my own site (I love it).</p>
<p>Today, for the first time, I am planning to go to a WordCamp outside Croatia.</p>
<p><strong>That is all thanks to WordPress.</strong></p>
<p>You know that you should never stop dreaming, right?</p>
<p>I guess, I wanted to let you know that WordPress can help you get a dream job! It can be something totally different, but as long as it involves Internet, I think WordPress can help you with it.</p>
<p><strong>WordPress would not be where it is today if it was not to the whole WordPress Community. So, thanks to all involved in it!</strong></p>
<div class="rtsocial-container rtsocial-container-align-right rtsocial-horizontal"><div class="rtsocial-twitter-horizontal"><div class="rtsocial-twitter-horizontal-button"><a title="Tweet: WordPress allowed me to have a Dream Job" class="rtsocial-twitter-button" href="https://twitter.com/share?text=WordPress%20allowed%20me%20to%20have%20a%20Dream%20Job&via=heropress&url=https%3A%2F%2Fheropress.com%2Fessays%2Fwordpress-allowed-dream-job%2F" rel="nofollow" target="_blank"></a></div></div><div class="rtsocial-fb-horizontal fb-light"><div class="rtsocial-fb-horizontal-button"><a title="Like: WordPress allowed me to have a Dream Job" class="rtsocial-fb-button rtsocial-fb-like-light" href="https://www.facebook.com/sharer.php?u=https%3A%2F%2Fheropress.com%2Fessays%2Fwordpress-allowed-dream-job%2F" rel="nofollow" target="_blank"></a></div></div><div class="rtsocial-linkedin-horizontal"><div class="rtsocial-linkedin-horizontal-button"><a class="rtsocial-linkedin-button" href="https://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fheropress.com%2Fessays%2Fwordpress-allowed-dream-job%2F&title=WordPress+allowed+me+to+have+a+Dream+Job" rel="nofollow" target="_blank" title="Share: WordPress allowed me to have a Dream Job"></a></div></div><div class="rtsocial-pinterest-horizontal"><div class="rtsocial-pinterest-horizontal-button"><a class="rtsocial-pinterest-button" href="https://pinterest.com/pin/create/button/?url=https://heropress.com/essays/wordpress-allowed-dream-job/&media=https://heropress.com/wp-content/uploads/2017/12/121917-150x150.jpg&description=WordPress allowed me to have a Dream Job" rel="nofollow" target="_blank" title="Pin: WordPress allowed me to have a Dream Job"></a></div></div><a rel="nofollow" class="perma-link" href="https://heropress.com/essays/wordpress-allowed-dream-job/" title="WordPress allowed me to have a Dream Job"></a></div><p>The post <a rel="nofollow" href="https://heropress.com/essays/wordpress-allowed-dream-job/">WordPress allowed me to have a Dream Job</a> appeared first on <a rel="nofollow" href="https://heropress.com">HeroPress</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 20 Dec 2017 07:00:21 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"Igor Benić";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:31;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:71:"Akismet: Version 4.0.2 of the Akismet WordPress Plugin Is Now Available";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:31:"http://blog.akismet.com/?p=1982";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:99:"https://blog.akismet.com/2017/12/18/version-4-0-2-of-the-akismet-wordpress-plugin-is-now-available/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1161:"<p>Version 4.0.2 of <a href="http://wordpress.org/plugins/akismet/">the Akismet plugin for WordPress</a> is now available.</p>
<p>4.0.2 contains a few helpful changes:</p>
<ul>
<li class="p1"><span class="s1">Fixed a bug that could cause Akismet to recheck a comment that has already been manually approved or marked as spam.</span></li>
<li class="p1"><span class="s1">Fixed a bug that could cause Akismet to claim that some comments are still waiting to be checked when no comments are waiting to be checked.</span></li>
</ul>
<p>To upgrade, visit the Updates page of your WordPress dashboard and follow the instructions. If you need to download the plugin zip file directly, links to all versions are available in <a href="http://wordpress.org/plugins/akismet/">the WordPress plugins directory</a>.</p><br />  <a rel="nofollow" href="http://feeds.wordpress.com/1.0/gocomments/akismet.wordpress.com/1982/"><img alt="" border="0" src="http://feeds.wordpress.com/1.0/comments/akismet.wordpress.com/1982/" /></a> <img alt="" border="0" src="https://pixel.wp.com/b.gif?host=blog.akismet.com&blog=116920&post=1982&subd=akismet&ref=&feed=1" width="1" height="1" />";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 18 Dec 2017 16:56:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Stephane Daury";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:32;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:69:"WPTavern: Jetpack 5.6.1 Increases Security of the Contact Form Module";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:29:"https://wptavern.com/?p=77061";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:80:"https://wptavern.com/jetpack-5-6-1-increases-security-of-the-contact-form-module";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:575:"<p>Jetpack has <a href="https://jetpack.com/2017/12/14/jetpack-5-6-1/">released version 5.6.1</a> which hardens the Contact Form module by improving permissions checking when updating a form&#x27;s settings. In addition to security fixes, the character count for when Publicize publishes content to Twitter has been increased to 280. </p>



<p>This release also fixes a bug that disabled the ability to save widgets after removing a Widget Visibility rule. Users are encouraged to update as soon as possible, especially if you make heavy use of the Contact Form module. </p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 15 Dec 2017 22:49:08 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:33;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:57:"WPTavern: WPWeekly Episode 297 – WordCamp US 2017 Recap";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:58:"https://wptavern.com?p=77042&preview=true&preview_id=77042";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"https://wptavern.com/wpweekly-episode-297-wordcamp-us-2017-recap";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2715:"<p>In this episode, <a href="https://jjj.blog/">John James Jacoby</a> and I are joined by <a href="https://mor10.com/">Morten Rand-Hendriksen</a>. We have an engaging conversation about WordCamp US 2017, Gutenberg, and what it&#8217;s going to take for it to succeed. Rand-Hendriksen shared what he thinks are <a href="https://mor10.com/gutenberg-and-the-future-of-wordpress-conditions-for-success/">the three conditions</a> that need to be met before Gutenberg can be shipped.</p>
<p>Near the end of the show, we discuss the possible impacts Gutenberg&#8217;s timeline may have on the WordPress economy. Jacoby and I round out the show by reviewing the 2017 State of the Word and our picks of the week.</p>
<h2>Stories Discussed:</h2>
<p><a href="https://wptavern.com/storify-to-close-may-16-2018-wordpress-plugin-discontinued">Storify to Close May 16, 2018, WordPress Plugin Discontinued</a><br />
<a href="https://wptavern.com/gutenberg-and-the-wordpress-of-tomorrow-by-morten-rand-hendriksen" rel="bookmark">Gutenberg and the WordPress of Tomorrow by Morten Rand-Hendriksen</a><br />
<a href="https://bridgetwillard.com/economic-impact-timeline-gutenberg-rollout/">The Economic Impact of the Timeline of the Gutenberg Rollout</a></p>
<h2>Picks of the Week:</h2>
<p><a href="https://www.copytrans.net/copytransheic/">CopyTrans</a> is a plugin for Windows to view HEIC files. In iOS 11, Apple started using HEIC/HEIF. HEIF stands for High Efficiency Image Format, and, as the name suggests, is a more streamlined way to store image files. It allows digital photographs to be created in smaller files sizes while retaining higher image quality than its JPEG alternative. The image format is currently not supported in Windows 7, 8, and 10.</p>
<p>CopyTrans HEIC for Windows is a simple Windows plugin that allows you to open HEIC files using Windows Photo Viewer. This format is also <a href="https://core.trac.wordpress.org/ticket/42775">not compatible with WordPress.</a></p>
<p><a href="http://github.com/10up/wpsnapshots">WP Snapshots</a> is a command line interface (CLI) tool by 10Up that empowers engineering teams to quickly share WordPress projects, including files and the database.</p>
<h2>WPWeekly Meta:</h2>
<p><strong>Next Episode:</strong> Wednesday, December 20th 3:00 P.M. Eastern</p>
<p>Subscribe to <a href="https://itunes.apple.com/us/podcast/wordpress-weekly/id694849738">WordPress Weekly via Itunes</a></p>
<p>Subscribe to <a href="https://www.wptavern.com/feed/podcast">WordPress Weekly via RSS</a></p>
<p>Subscribe to <a href="http://www.stitcher.com/podcast/wordpress-weekly-podcast?refid=stpr">WordPress Weekly via Stitcher Radio</a></p>
<p><strong>Listen To Episode #297:</strong> </p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 14 Dec 2017 00:59:12 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:34;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:48:"HeroPress: Finding My Way Out Of My Comfort Zone";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:56:"https://heropress.com/?post_type=heropress-essays&p=2341";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:122:"https://heropress.com/essays/finding-way-comfort-zone/#utm_source=rss&utm_medium=rss&utm_campaign=finding-way-comfort-zone";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:20331:"<img width="960" height="480" src="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2017/12/121317-1024x512.jpg" class="attachment-large size-large wp-post-image" alt="Pull Quote: As web developers, programmers, people who speak English, people who have internet access to read this article, are incredibly, very, very, very lucky." /><p>I don&#8217;t remember when we had a computer for the first time. I practically grew up with them. Hungary was a communist country when I was born in &#8217;84, so while everyone had a job, no one could really do their own thing. Everything was state owned.</p>
<p>In 1989-1990 there was a change of regime which followed the collapse of the Berlin wall, and suddenly the country became a democracy, and people were free to start and own companies. Yes, the era also had other problems, like 35% inflation at one point, but at least we were &#8220;free&#8221;.</p>
<p>My parents started out by importing computers from Hong Kong. That was a huge thing. We had one of the first of those, a 286 with a whopping speed of 8 Mhz which went up to 16 if I pressed the Turbo button! I had no idea what that meant though besides the number being higher.</p>
<p><a href="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2017/12/young_gabor.jpg"><img class="aligncenter size-large wp-image-2343" src="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2017/12/young_gabor-1024x576.jpg" alt="Gabor about age 3, at a computer" width="960" height="540" /></a></p>
<p>It was a good time of Sim City, Prince of Persia, and Sokoban.</p>
<h3>Finding the Web</h3>
<p>My first &#8220;website&#8221; was one my grandmother asked me to make for her Quaker group. I was 12. I created it with tables and inline styling (CSS wasn&#8217;t a thing back then), but never got it live &#8211; hosting wasn&#8217;t something I really knew about.</p>
<p>Fast forward to 2003 when I started university studying architecture in Budapest. It was fun, I loved physics, I loved drawing, I loved math, I <em>especially</em> loved descriptive geometry! The latter is pretty much &#8220;how to represent a 3d thing on a sheet of paper&#8221;. Incidentally that brought me my first high paying consulting job. As a student in 2nd year I coached a student in first year in descriptive geometry &#8211; he had broken his leg so couldn&#8217;t actually make the classes, but he had to pass that subject to advance. So every week I would go to their house and spend about 3 hours helping him draw and figure out how to draw what to draw and why to draw those things that way. That experience taught him everything he needed to know to pass with a 4 (on a scale of 5, 5 being best), which translates to around 80%. I had my first satisfied customer. <img src="https://s.w.org/images/core/emoji/2.3/72x72/1f642.png" alt="🙂" class="wp-smiley" /></p>
<p>It also taught me two very important things:</p>
<ol>
<li>if you&#8217;re good at it, they will overlook the fact that you&#8217;re not actually &#8220;qualified&#8221; to do the thing (I wasn&#8217;t a TA / lecturer. I was merely another student in an upper class. An upperclassman. 先輩)</li>
<li>if you&#8217;re good at it, you can charge people a lot more than you otherwise think. I got paid about 3x the standard hourly wage of adults working the majority of hourly jobs, and as a student, that was awesome!</li>
</ol>
<p>For context though, there is no tuition fee for your first degree (i.e.: it&#8217;s paid for by the government for you which gets that money from taxes).</p>
<p>The second formative experience was between 2004-2006. I joined an extracurricular architecture club. Basically students who don&#8217;t just want to bumble through the university but actually get good! Like, REALLY GOOD. We pitched to host EASA &#8211; European Architecture Students&#8217; Assembly &#8211; in Budapest in 2006. For that we needed a website, both an internal forum, and a public facing site for sponsors / attendees / workshops / visitors / everyone.</p>
<p>I knew nothing besides basic html.</p>
<p>So naturally I volunteered.</p>
<h3>Leveling up</h3>
<p>I learned PHP, MySQL, and Flash from books: learn php in 24 hours, PHP 4 reference, learn mysql in 24 hours, learn flash in 24 hours, etc. I had one guy over the internet who helped me figure out things in PHP, but other than that I was all alone. Stack Overflow wasn&#8217;t a thing either. Wild times. From memory I could probably exploit that engine in one of 284 ways today. I&#8217;m glad it&#8217;s not online any more. The flash site is, it&#8217;s somewhat broken, but here you go: <a href="https://javorszky.github.io/ancientflashsite/" rel="nofollow">https://javorszky.github.io/ancientflashsite/</a></p>
<p>I built a forum engine and a full actionscript site. We also had a requirement that whoever applies to host whatever workshop, we need to judge the workshop on its own merit, not on who submits it, so I built the submit form in such a way that it took the files, and renamed them, scrubbed the email addresses that reached the judging committee, and we made it a rule that if there&#8217;s any identifying information ON the pdf, it&#8217;s immediately disqualified. The year is 2005.</p>
<p>Looking back, I realized two things:</p>
<ol>
<li>learn to learn on the job, and learn to enjoy not knowing stuff. Nobody does, really</li>
<li>biases are real. Mitigate them. Even the ones you don&#8217;t know about. Especially the ones you don&#8217;t know about! Or at least have a framework by which you acknowledge if you&#8217;re called out</li>
</ol>
<h3>Moving On</h3>
<p>I then decided to not continue my studies there. I was failed in one class where I expected a strong pass. We were split into 12 groups, and groups 1 and 2 got mostly failed, and groups 3-12 got overwhelmingly passed. Something wasn&#8217;t right, I spoke up, but I was a student, and they were faculty. I left because I didn&#8217;t feel like fighting and losing my soul over it.</p>
<blockquote><p>Something wasn&#8217;t right, I spoke up, but I was a student, and they were faculty. I left because I didn&#8217;t feel like fighting and losing my soul over it.</p></blockquote>
<p>I continued making websites for myself and got introduced to WordPress around this time. I don&#8217;t remember my first project. I <em>think</em> it was a site I built for myself in 8 hours for a competition which led me to my first paying website job, which I totally screwed up.</p>
<p>In 2010 I decided to move countries with 3 friends I went to university with, at the time I was studying International Tourism Management, and I could transfer to Oxford Brookes University (not the one you heard about).</p>
<p>I missed the application deadline.</p>
<p>Which meant that I had to find work. When I bought my plane ticket I decided that whatever it takes, I will make it work. Staying in Hungary was not an option for me: I didn&#8217;t like the politics, I didn&#8217;t like where the country was heading economically, and I longed for a more cheerful society to surround me. Movement rights and language I can speak and other people going the same way helped me decide on the UK.</p>
<h3>Restarting</h3>
<p>So I made it work: I accepted the first full time job that I got offered. I worked as a wait staff at the restaurant of one of the luxury hotels in the city. It had very little to do with computers, but I had income, I could pay back the help I got from my friends (and by extension, their families), and I could actually take control of my own life instead of just bumping into furniture.</p>
<blockquote><p>It had very little to do with computers, but I had income, I could pay back the help I got from my friends (and by extension, their families), and I could actually take control of my own life [&#8230;]</p></blockquote>
<p>I&#8217;ve learned a lot from working there. Chef taught me that literally no one cares WHY there was a mistake at that time in putting through an order &#8211; what&#8217;s important is what the error was, what&#8217;s needed to correct it. Everything else is wasting everyone&#8217;s time. Of course we&#8217;d go through these after the service.</p>
<p>I&#8217;ve learned that to work in hospitality, you have to leave your ego at the door. Doesn&#8217;t mean you should take abuse, but there you&#8217;re part of a &#8211; hopefully &#8211; finely tuned, oiled machinery, and keeping the whole thing operating is the number one goal. Turns out that&#8217;s also applicable to working in teams in general.</p>
<p>A year goes by, and we need to move out of the house we&#8217;re renting. In a break between morning and evening shifts I look at the job postings in the local newspaper: someone&#8217;s looking for a developer! It was a Wednesday. I got an interview for Friday, and started on Monday. I had to talk to my supervisor to move me to evening-only shifts because I have a second desk job. My days: 9am &#8211; 4:45pm developer, 5pm &#8211; 2am (ish, whenever we finished) waiting tables. Rinse and repeat.</p>
<p>Working 60-80 hours could only go on for so long. After about 3 months I had a very sharp chest pain while on shift at the restaurant. Had to walk home (normally I cycle), and then made my way to the emergency room where after having waited 5 hours, I got an X-ray, and EKG, and the doctor determined there&#8217;s nothing wrong, so here&#8217;s some Ibuprofen (3&#215;1) and some Paracetamol (1&#215;1).</p>
<blockquote><p>Kids, don&#8217;t work 60-80 hours a week.</p></blockquote>
<p>&#8220;Uh, which one should I take on a day?&#8221; &#8220;Oh&#8230; both!&#8221;</p>
<p>I went home, took the first dose, and slept for 22 hours. I handed in my resignation 2 days later at the restaurant because I needed to not work that much. My manager pleaded me to stay at least on part time, which I did, because they were genuinely lovely people.</p>
<p>Kids, don&#8217;t work 60-80 hours a week.</p>
<h3>Back to the web with full steam</h3>
<p>After a year at the development agency + restaurant combo, I got hired to a WordPress agency through recruiters. My new boss asked me why I haven&#8217;t applied to them directly, even though I saw their ad, why I waited to go through a recruiter. I said I didn&#8217;t think I was good enough. That decision ended up costing him a few thousand pounds in recruitment fees.</p>
<p>I quit my restaurant job for good. I also learned a lesson to actually trust myself.</p>
<p>Something that during the 2,5 years with them I would question a lot of times. There have been instances when I made mistakes that were incredibly easy to avoid had I just taken 5 more minutes to think. But every time it was something we could correct fairly fast (shoutout to hospitality experience!) and then I had a postmortem, and changed the way I work to avoid similar problems.</p>
<p>I had the privilege to work on some seriously challenging WordPress sites while with them. That was my first actual commercial experience with it. We built blogs from Oxford University (the one you heard about) to eCommerce site migrations from Magento using Jigoshop and later WooCommerce.</p>
<p>I&#8217;ve had to disassemble how WooCommerce worked fairly fast because of some of the client requirements, and I got pretty good at it.</p>
<p>In November 2014 I got hired to one of the product companies around WooCommerce and spent a year and a half with them maintaining their plugins, answering customer queries and helping them fix their sites occasionally. That was my first help desk experience.</p>
<p>I got access to some incredibly large eCommerce stores and I quickly discovered where the bottlenecks were in our plugins, WordPress, and WooCommerce itself. Some of the customers had access to New Relic, which I could use to help me find what&#8217;s taking so long.</p>
<p>From then on it was just a case of finding what&#8217;s slow, following it back, reading the documentation and code on why it&#8217;s slow, and coming up with ideas on how to fix it.</p>
<p>I got really good at this.</p>
<h3>The Freelance Days</h3>
<p>At the end of July 2016 our ways parted, and I had a buffer of about 3 months when I didn&#8217;t need to worry about having to find another job. While trying to figure out what to do, where next, I started getting requests to work on some projects. They asked me my hourly rate. I said a number I was slightly uncomfortable with, they said yeah, and off I went.</p>
<blockquote><p>[&#8230;] I started getting requests to work on some projects. They asked me my hourly rate. I said a number I was slightly uncomfortable with, they said yeah [&#8230;]</p></blockquote>
<p>It also helped that I was at the time known for my love of hard problems and actually figuring out why things break and fixing them.</p>
<p>I thought &#8220;hey, if I can command that much hourly rate, I could make this work!&#8221;</p>
<p>I took on clients, and managed to make things work for&#8230; a surprisingly long time. Having GREAT accountants is a must for self employment.</p>
<p>I suddenly also had time to pursue some of my other interests: I learned how to ride a motorcycle.</p>
<p><a href="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2017/12/gabor_motorcycle.jpg"><img class="aligncenter size-large wp-image-2344" src="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2017/12/gabor_motorcycle-1024x576.jpg" alt="Gabor standing by a sporty motorcycle" width="960" height="540" /></a></p>
<p>I started learning Japanese! I got back onto the slackline.</p>
<p><a href="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2017/12/gabor_slackline.jpg"><img class="aligncenter size-large wp-image-2345" src="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2017/12/gabor_slackline-1024x768.jpg" alt="Gabor balancing on a narrow strap hung between two trees" width="960" height="720" /></a></p>
<p>I got to speak at WordCamp Brighton in 2017!</p>
<p><a href="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2017/12/gabor_wordcamp.jpg"><img class="aligncenter wp-image-2346 size-large" src="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2017/12/gabor_wordcamp-1024x683.jpg" alt="Gabor, on stage at WordCamp Brighton" width="960" height="640" /></a></p>
<p>Until very recently, it was a game of &#8220;how long can I be self employed before I need to look for a job?&#8221; Turns out I couldn&#8217;t answer this, because an opportunity came up to join Mindsize as a lead backend developer.</p>
<p>When I heard about them starting up a few months prior, I had two thoughts:</p>
<ol>
<li>they are probably the only company I would stop doing freelance work for</li>
<li>I&#8217;m not good enough to work with them yet</li>
</ol>
<p>Statement 1 was true :).</p>
<h3>Catching up with the present</h3>
<p>This brings us into the very recent present. It&#8217;s maybe a month old development at the time of publication. Since then I&#8217;ve been working really hard to reclaim my time of about 40 hours worked a week. With the holiday push of the clients I had as a freelancer, there was a transition phase where I had to work 60-80 hours.</p>
<p>Don&#8217;t work 60-80 hours a week, kids!</p>
<p>Looking back it was incredibly humbling experience so far, but also exciting, and full of challenges, and learnings. I&#8217;ve made a lot of excellent friends, and luckily very few enemies. I am grateful for each and every one of them.</p>
<p>I don&#8217;t know where life takes me. For the foreseeable future I&#8217;ll be with Mindsize and will make eCommerce sites awesome, and will make awesome eCommerce sites. But I&#8217;ll also try and pass on some of the things I&#8217;ve learned by helping people new to the industry.</p>
<p>There are a lot more things I could say, but they aren&#8217;t necessarily part of my journey, so I&#8217;ll save them for some other time.</p>
<h3>On privilege</h3>
<blockquote><p>We, as web developers, programmers, people who speak English, people who have internet access to read this article, are incredibly, very, very, very lucky.</p></blockquote>
<p>Except for one thing. When I worked at the WordPress agency, Twitter, and by extension, society, started the &#8220;check your privilege&#8221; trend. It took a while to understand what it was all about, but it&#8217;s something I wish everyone did.</p>
<p>We, as web developers, programmers, people who speak English, people who have internet access to read this article, are incredibly, very, very, very lucky. I&#8217;ve realized that my journey wouldn&#8217;t have been possible had I been born to less fortunate circumstances:</p>
<p>If my parents didn&#8217;t make the decision to start teaching me English when I was 3.</p>
<p>If I didn&#8217;t have the financial stability in my family to be able to just explore what I like to do.</p>
<p>If I didn&#8217;t have the financial stability to just drop out of university after 3 years because &#8220;I didn&#8217;t like it&#8221;. And another one after a semester. And never finish my Tourism Management course.</p>
<p>If I didn&#8217;t live in a developed nation with easy access and high standards of living.</p>
<p>This brings into mind one of my favorite tweets:</p>
<blockquote class="twitter-tweet">
<p lang="en" dir="ltr">Your job, lucky person, is to help others less lucky than you to improve their odds.</p>
<p>&mdash; Dylan Wilbanks, Human Grumpy Cat (@dylanw) <a href="https://twitter.com/dylanw/status/522060876304486400?ref_src=twsrc%5Etfw">October 14, 2014</a></p></blockquote>
<p></p>
<p>Not everyone has these opportunities and every day I am conscious of it.</p>
<p>Humans are hard. Interpersonal skills are hard. Treating each other with dignity, respect, and grace is hard if you haven&#8217;t been brought up with those values as a kid. It&#8217;s been a challenge for me to shed the &#8220;boys will be boys&#8221; upbringing I was carrying.</p>
<p>Let&#8217;s use our power and means and help the less fortunate walk their own paths. Let&#8217;s lessen marginalization with the view of ending it. Let&#8217;s be excellent to each other!</p>
<p>And don&#8217;t use &#8220;guys&#8221; to mean everyone!</p>
<div class="rtsocial-container rtsocial-container-align-right rtsocial-horizontal"><div class="rtsocial-twitter-horizontal"><div class="rtsocial-twitter-horizontal-button"><a title="Tweet: Finding My Way Out Of My Comfort Zone" class="rtsocial-twitter-button" href="https://twitter.com/share?text=Finding%20My%20Way%20Out%20Of%20My%20Comfort%20Zone&via=heropress&url=https%3A%2F%2Fheropress.com%2Fessays%2Ffinding-way-comfort-zone%2F" rel="nofollow" target="_blank"></a></div></div><div class="rtsocial-fb-horizontal fb-light"><div class="rtsocial-fb-horizontal-button"><a title="Like: Finding My Way Out Of My Comfort Zone" class="rtsocial-fb-button rtsocial-fb-like-light" href="https://www.facebook.com/sharer.php?u=https%3A%2F%2Fheropress.com%2Fessays%2Ffinding-way-comfort-zone%2F" rel="nofollow" target="_blank"></a></div></div><div class="rtsocial-linkedin-horizontal"><div class="rtsocial-linkedin-horizontal-button"><a class="rtsocial-linkedin-button" href="https://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fheropress.com%2Fessays%2Ffinding-way-comfort-zone%2F&title=Finding+My+Way+Out+Of+My+Comfort+Zone" rel="nofollow" target="_blank" title="Share: Finding My Way Out Of My Comfort Zone"></a></div></div><div class="rtsocial-pinterest-horizontal"><div class="rtsocial-pinterest-horizontal-button"><a class="rtsocial-pinterest-button" href="https://pinterest.com/pin/create/button/?url=https://heropress.com/essays/finding-way-comfort-zone/&media=https://heropress.com/wp-content/uploads/2017/12/121317-150x150.jpg&description=Finding My Way Out Of My Comfort Zone" rel="nofollow" target="_blank" title="Pin: Finding My Way Out Of My Comfort Zone"></a></div></div><a rel="nofollow" class="perma-link" href="https://heropress.com/essays/finding-way-comfort-zone/" title="Finding My Way Out Of My Comfort Zone"></a></div><p>The post <a rel="nofollow" href="https://heropress.com/essays/finding-way-comfort-zone/">Finding My Way Out Of My Comfort Zone</a> appeared first on <a rel="nofollow" href="https://heropress.com">HeroPress</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 13 Dec 2017 08:00:23 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Gabor Javorszky";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:35;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:70:"WPTavern: Storify to Close May 16, 2018, WordPress Plugin Discontinued";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:29:"https://wptavern.com/?p=76992";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:79:"https://wptavern.com/storify-to-close-may-16-2018-wordpress-plugin-discontinued";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2906:"<p><a href="https://storify.com/">Storify</a>, a service that launched in 2010 and opened to the public in 2013 has announced that it is shutting down version one of its service on May 16th, 2018. Concurrently, its WordPress plugin that is actively installed on more than 2,000 sites has been <a href="https://wordpress.org/plugins/storify/">discontinued</a>. </p>



<img src="https://i0.wp.com/wptavern.com/wp-content/uploads/2017/12/StorifyPluginDiscontinued.png?w=627&ssl=1" />
    Storify Plugin is Discontinued




<p>Storify enabled journalists and others to build stories and timelines similar to Twitter and other social networks. The service <a href="https://techcrunch.com/2013/09/09/livefyre-acquires-storify/">was acquired</a> by <a href="http://www.livefyre.com">Livefyre</a> in 2013 and became part of Adobe when it <a href="https://techcrunch.com/2016/05/03/adobe-acquires-livefyre/">acquired Livefyre</a> in 2016. </p>



<p>Storify has disabled new accounts from being created and will delete stories and accounts on May 16th, 2018. Existing users who want to move to Storify 2, a paid feature of Livefyre, will need to purchase a license. The service has <a href="https://storify.com/faq-eol">published a FAQ</a> that includes directions on how to export content. </p>



<h2>New Plugin Opportunity</h2>



<p>According to some users, the export process is cumbersome, providing an excellent opportunity for a prospecting developer to create a WordPress plugin that makes the process easier. A search of the WordPress plugin directory for Storify Export produces zero results. <br /></p>




    <blockquote class="twitter-tweet"><p lang="en" dir="ltr">A fantastic <a href="https://twitter.com/hashtag/WordPress?src=hash&ref_src=twsrc%5Etfw">#WordPress</a> dev opportunity: <a href="https://twitter.com/Storify?ref_src=twsrc%5Etfw">@Storify</a> just announced its "End of Life" for May 2018. The export is kinda lame. If I could import a story from Storify into a WordPress Post/Page that would be fabulous! I have a few stories that I wouldn''t want to lose. <a href="https://twitter.com/hashtag/biz?src=hash&ref_src=twsrc%5Etfw">#biz</a></p>&mdash; Birgit Pauli-Haack (@bph) <a href="https://twitter.com/bph/status/940706045449703424?ref_src=twsrc%5Etfw">December 12, 2017</a></blockquote>





    <blockquote class="twitter-tweet"><p lang="en" dir="ltr">I have a lot of Storify stories I''d hate to lose, too. If you hear of someone doing this, I''d love to know about it.</p>&mdash; Deborah Edwards-Onoro (@redcrew) <a href="https://twitter.com/redcrew/status/940729186469253120?ref_src=twsrc%5Etfw">December 12, 2017</a></blockquote>




<p>If you know of any methods or plugins that eases the process of exporting content from Storify and importing it to WordPress, please share them in the comments. Also feel free to let us know if you create a plugin that performs this task. </p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 13 Dec 2017 07:30:24 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:36;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:75:"WPTavern: Gutenberg and the WordPress of Tomorrow by Morten Rand-Hendriksen";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:29:"https://wptavern.com/?p=76959";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:86:"https://wptavern.com/gutenberg-and-the-wordpress-of-tomorrow-by-morten-rand-hendriksen";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1054:"<p>While attending WordCamp US 2017, there were a number of sessions that stood out to me. <a href="https://wordpress.tv/2017/12/10/morten-rand-hendriksen-gutenberg-and-the-wordpress-of-tomorrow/">Gutenberg and the WordPress of Tomorrow</a> by Morten Rand-Hendriksen was one of them. </p>



<p>Hendriksen explains the state of WYSIWYG in WordPress and how it doesn&#x27;t really exist but Gutenberg provides opportunities to change that. He explores developing sites without being confined to a small view port. He also performs a live demo of Gutenberg showing off its capabilities.</p>



<p>An interesting outcome from his presentation is the amount of optimism and excitement it generated from the audience. During the question and answer session, a member of the audience commented on how far Gutenberg has advanced in the last three months and that it looks cool to use now. </p>



<p>To gain insight into how Gutenberg can moonshot WordPress over its competition, watch Hendriksen&#x27;s presentation. </p>




    <div class="embed-wrap"></div>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 12 Dec 2017 20:57:15 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:37;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"Matt: Post-Verbal Language";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:22:"https://ma.tt/?p=47705";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:43:"https://ma.tt/2017/12/post-verbal-language/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1800:"<p>James Beshara has a <a href="https://jjbeshara.com/2017/12/09/a-post-verbal-world/">really interesting read on how communication will change and evolve in a post-verbal world</a>, namely one where human/brain interfaces like <a href="https://waitbutwhy.com/2017/04/neuralink.html">Neuralink</a> can more directly transmit thought between people than the medium of language allows today. </p>



<p>After reading the essay I wonder if people&#x27;s thoughts or the neural pathways they activate, if they could be directly transmitted into another brain, would actually make any sense to someone else with a unique internal set of pathways and framework for parsing and understanding the world. The essay assumes we&#x27;d understand and have more empathy with each other, but that seems like a leap. It seems likely the neural link would need it own set of abstractions, perhaps even unique per person, similar to how <a href="https://www.newscientist.com/article/2114748-google-translate-ai-invents-its-own-language-to-translate-with/">Google Translate AI invented its own meta-language</a>. </p>



<p>Today <a href="https://www.economist.com/news/leaders/21730871-facebook-google-and-twitter-were-supposed-save-politics-good-information-drove-out">idea-viruses that cause outrage (outrageous?) in today&#x27;s discourse  have been weaponized by algorithms optimizing for engagement</a>, and directly brain-transmitted memes seem especially risky for appealing to our base natures or causing <a href="https://en.wikipedia.org/wiki/Amygdala_hijack">amygdala hijack</a>. But perhaps a feature of these neural interface devices could counteract that, with a command like "tell me this piece of news but suppress my confirmation bias and tribal emotional reactions while I&#x27;m taking it in."</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 12 Dec 2017 03:09:01 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:38;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:26:"Matt: iPhone Fast Charging";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:22:"https://ma.tt/?p=47682";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:38:"https://ma.tt/2017/12/iphone-charging/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:382:"<p>I love USB, cables, and charging things. <a href="https://www.macrumors.com/guide/iphone-x-fast-charging-speeds-compared/">So MacRumors comparison of different wired and wireless charging options and speed for the iPhone X is my catnip</a>. tl; dr: USB-C + USB-C-to-Lightning cable gives you far and away the fastest times. I&#x27;ve found this true for the iPad Pro as well.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 07 Dec 2017 16:51:19 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:39;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:29:"Matt: State of the Word, 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:22:"https://ma.tt/?p=47687";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:45:"https://ma.tt/2017/12/state-of-the-word-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:524:"<p>I really enjoyed connecting with the WordPress community in Nashville this previous weekend. On Saturday I delivered the State of the Word presentation alongside <a href="https://choycedesign.com/">Mel</a>, <a href="https://weston.ruter.net/">Weston</a>, and <a href="https://matiasventura.com/">Matías</a>. There&#x27;s always a post-event buzz but I definitely noticed a change in tenor of people&#x27;s thoughts on Gutenberg after the presentation and demo. The video is above, check it out when you get a chance.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 06 Dec 2017 23:38:20 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:40;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:37:"HeroPress: Remote Work Brings Freedom";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:56:"https://heropress.com/?post_type=heropress-essays&p=2324";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:126:"https://heropress.com/essays/remote-work-brings-freedom/#utm_source=rss&utm_medium=rss&utm_campaign=remote-work-brings-freedom";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:21046:"<img width="960" height="480" src="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2017/12/120617-1024x512.jpg" class="attachment-large size-large wp-post-image" alt="Pull Quote: WordPress is not just a CMS, it''s a Community of lovely people!" /><p><a href="http://heropress.com/feed/#gujarati">આ નિબંધ ગુજરાતીમાં પણ ઉપલબ્ધ છે</a></p>
<p>First of all, I want to say thank you to HeroPress for reaching out and letting so many people share their stories. I am a follower of HeroPress and read new stories every week! A few months ago my friend <a href="https://heropress.com/essays/wordpress-good-indian-women/">Juhi Patel shared her great WordPress story</a>, and I was inspired by her to share my own and how it has changed my way of working.</p>
<blockquote><p>I am that guy who hates theory and loves to do practical programming.</p></blockquote>
<p>After completing my bachelor of engineering with Information Technology in 2013, I was looking for a job. I found that there were many different kinds of programming language jobs that were available. I was really not sure which one I needed or wanted to choose. After getting advice from a senior, I started training for PHP because it was easy and quick to learn. A few days before I had completed Training, I got selected in small company (5 Employees) as a PHP Developer. I was making websites there using PHP codeigniter framework.</p>
<p>I was belong from a small town, and everyday it took me around 3 hours to travel to my job. After about 2 months, I applied for a job at another big company and was selected as Web Developer. There I was working on CMS Framework (not WordPress <img src="https://s.w.org/images/core/emoji/2.3/72x72/1f600.png" alt="😀" class="wp-smiley" /> ) for website projects. After a few days, I made my personal site using WordPress in my free time.</p>
<blockquote><p>At that time, I was not aware of themes and plugins. I was just playing with theme files and editor to make changes on my website! <img src="https://s.w.org/images/core/emoji/2.3/72x72/1f61c.png" alt="😜" class="wp-smiley" /></p></blockquote>
<p>After a month, my team leader got to know about that I was interested in WordPress. I got the opportunity to learn WordPress. I learned and explored WordPress with some demo projects by understanding how plugins and themes work. After 3 weeks of learning WordPress, I worked on my first WordPress project. This project took around 4 months to complete <img src="https://s.w.org/images/core/emoji/2.3/72x72/1f600.png" alt="😀" class="wp-smiley" /> After this successful project, the whole CMS Team migrated to WordPress.</p>
<blockquote><p>I realized that, WordPress is so easy to learn, get help and work on it!</p></blockquote>
<p>After around 1 year and 3 months of working with that company, I was told to work after working hours due to heavy requirements from our projects. I felt really stressed and frustrated at work and during that time…</p>
<blockquote><p>I got to know about “Remote” work. But I didn’t know what that was or how it works?</p></blockquote>
<p>I explored about remote work and found that this is a career that you can work from your home, workplace or anywhere you like. I saw that many people in world are doing remote work happily. I decided to switch my job from Office Job to Remote Job. My parents, family and relatives advised me to not leave office job because they believed Remote Job is not as secure as an Office Job. But I stuck with my decision. In March 2015, I resigned from my job without notice period with the condition of no experience letter would be provided to me of this job.</p>
<blockquote><p>At the initial stage it was hard to be freelancer. But I was trying and trying to get that started.</p></blockquote>
<p>I had registered in one popular freelancer marketplace. After 1 week of trying very hard I got my first project. It was just for $5 to make an HTML page with a countdown timer. I did it successfully and got the best review. After that I had also completed many projects successfully. That’s it! I was done with my decision. Within the first few weeks I made a website for one US Client. They were impressed by my work and hired me as Full time Web Developer for their company in April 2015. I am remotely working with them happily still today from my home!</p>
<blockquote><p>Everything is going smoothly. I am enjoying Work from Home, Freedom and Quality time with Family.</p></blockquote>
<p>In October 2016, I learned about WordCamp. I attended my first WordCamp Nashik 2016. I met many WordPress Developers, Freelancers, Professionals, Users and many other people at this WordCamp. After that, I became a fan of WordCamp. We started organizing Meetups in our City. Within the last year, I have attended, volunteered and contributed as a friend and sponsor at more than 6 WordCamps. Currently I am active member of Ahmedabad WordPress Community.</p>
<blockquote><p>I am a WordCamp Lover. WordCamp is a way to meet new people, learn and share knowledge!</p></blockquote>
<p>In October 2017, we successfully organized WordCamp in our city. I have been speaking about how remote job can be a good opportunity as a career to students and newbie in panel discussion of WordCamp Ahmedabad.</p>
<a href="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2017/12/wcahmedabad-panel-discussion.jpg"><img class="size-large wp-image-2325" src="http://20094-presscdn.pagely.netdna-cdn.com/wp-content/uploads/2017/12/wcahmedabad-panel-discussion-1024x683.jpg" alt="4 men on a couch at the front of a room." width="960" height="640" /></a>Panel Discussion &#8211; WordCamp Ahmedabad 2017 (PC. Meher Bala)
<blockquote><p>WordPress is not just a CMS, It&#8217;s a community of lovely people!</p></blockquote>
<hr />
<h1 id="gujarati">રિમોટ કામ સ્વતંત્રતા લાવે છે.</h1>
<blockquote><p>“મને હીરોપ્રેસ સ્ટોરીમાં ભાગ લેવામાં કેવી રીતે પ્રેરણા મળી?”</p></blockquote>
<p>સૌ પ્રથમ, ઘણા લોકો સુધી પહોંચીને અને તેમની વાર્તાઓ કહેવા માટે હું હીરોપ્રેસનો ખુબ જ આભાર માનું છું. હું હિરોપ્રેસનો અનુયાયી છું અને દર અઠવાડિયે નવી વાર્તાઓ વાંચું છું! થોડા મહિના પહેલા મારી મિત્ર જુહી પટેલે તેની વર્ડપ્રેસની રસપ્રદ વાર્તા હીરોપ્રેસ પર કહી હતી. તે વાંચીને મને, મારા પોતાની વાર્તા, મારા કામ કરવાની રીત કઇ રીતે બદલાઈ તે કહેવા માટે પ્રેરણા મળી હતી.</p>
<blockquote><p>&#8220;હું તે વ્યક્તિ છું જે થિયોરીને નફરત કરે છે અને પ્રાયોગિક પ્રોગ્રામિંગ કરવા માટે પ્રેમ કરે છે. &#8220;</p></blockquote>
<p>2013 માં ઇન્ફોર્મેશન ટેકનોલોજી સાથે મારી સ્નાતક એન્જિનિયરિંગ પૂર્ણ કર્યા પછી, હું નોકરી શોધી રહ્યો હતો ત્યારે મેં જોયું કે અહીં ઘણી બધી પ્રોગ્રામિંગ ભાષાની નોકરીઓ ઉપલબ્ધ છે. ત્યારે હું ચોક્કસ ન હતો કે મારે કઈ પ્રોગ્રામિંગ ભાષા પસંદ કરવાની જરૂર છે? વરિષ્ઠ પાસેથી સલાહ મેળવ્યા પછી, મેં PHP માટે તાલીમ શરૂ કરી, કારણ કે તે શીખવા માટે સરળ અને ઝડપી હતી. તાલીમ પૂર્ણ થયાના થોડા દિવસો પહેલાં, મારી નાની કંપની (5 કર્મચારીઓ) માં PHP ડેવલપર તરીકે પસંદગી થઇ. હું PHP Codeigniter ફ્રેમવર્કનો ઉપયોગ કરીને ત્યાં વેબસાઇટ્સ બતાવતો હતો.</p>
<p>હું એક નાનકડા શહેરમાંથી આવતો હતો, અને દરરોજ મને મારી નોકરી પર મુસાફરી કરવા માટે 3 કલાક જેવા થતા હતા. લગભગ 2 મહિના પછી, મેં બીજી મોટી કંપનીમાં નોકરી માટે અરજી કરી હતી અને ત્યાં મારી વેબ ડેવલપર તરીકે પસંદગી કરવામાં આવી હતી. ત્યાં હું વેબસાઇટ સંબંધિત પ્રોજેક્ટ્સ માટે સીએમએસ ફ્રેમવર્ક (વર્ડપ્રેસ સિવાયની <img src="https://s.w.org/images/core/emoji/2.3/72x72/1f600.png" alt="😀" class="wp-smiley" />) પર કામ કરતો હતો. થોડા દિવસો પછી, મેં મારી વ્યક્તિગત વેબસાઈટને મારા સ્વતંત્ર સમય દરમિયાન વર્ડપ્રેસની મદદથી બનાવી.</p>
<blockquote><p>&#8220;તે સમયે, હું થીમ્સ અને પ્લગિન્સથી વાકેફ ન હતો. હું મારી વેબસાઇટ પર ફેરફારો કરવા માટે માત્ર થીમ ફાઇલો અને એડિટર સાથે રમી રહ્યો હતો! <img src="https://s.w.org/images/core/emoji/2.3/72x72/1f61c.png" alt="😜" class="wp-smiley" />&#8221;</p></blockquote>
<p>એક મહિના પછી, મારી ટીમના આગેવાનને જાણવા મળ્યું કે મને વર્ડપ્રેસમાં રસ હતો. ત્યારે મને વર્ડપ્રેસ શીખવાની તક મળી. વર્ડપ્રેસ થીમ્સ અને પ્લગીંસ કેવી રીતે કામ કરે છે એ સમજવા, મેં જાતે શીખીને કેટલાક ડેમો પ્રોજેક્ટસ બનાવ્યા. વર્ડપ્રેસ શીખવાના 3 અઠવાડિયા પછી, મેં મારા પ્રથમ વર્ડપ્રેસ લાઈવ પ્રોજેક્ટ પર કામ કર્યું હતું. આ પ્રોજેક્ટ પૂર્ણ કરવા માટે મને લગભગ 4 મહિના લાગ્યા હતા <img src="https://s.w.org/images/core/emoji/2.3/72x72/1f600.png" alt="😀" class="wp-smiley" /> આ સફળ પ્રોજેક્ટ પછી, સમગ્ર સીએમએસ ટીમ વર્ડપ્રેસમાં જોડાઈ ગઈ.</p>
<blockquote><p>&#8220;મેં અનુભવ કર્યો કે, વર્ડપ્રેસ શીખવું, સહાય મેળવવી અને તેના પર કાર્ય કરવુ ખૂબ જ સરળ છે!&#8221;</p></blockquote>
<p>લગભગ 1 વર્ષ અને 3 મહિના તે કંપની સાથે કામ કર્યા પછી, મને અમારા પ્રોજેક્ટ્સની ભારે આવશ્યકતાના કારણે કામના કલાકો પછી પણ વધારે રોકાઈને કામ કરવા કહેવામાં આવતું હતું અને તે 2 સપ્તાહથી વધુ ચાલુ રહ્યું. ત્યારે મને કામ કરવું ખરેખર ભારયુક્ત અને નિરાશાજનક લાગવા લાગ્યું, તે સમય દરમિયાન ..</p>
<blockquote><p>&#8220;મને &#8220;રિમોટ&#8221; કામ વિશે જાણવા મળ્યું. પરંતુ મને ખબર નહોતી કે તે કે તે કેવી રીતે કાર્ય કરે છે?&#8221;</p></blockquote>
<p>મેં રિમોટ કામ વિશે તપાસ કરી અને જાણવા મળ્યું કે આ એક કારકિર્દી છે જે તમે તમારા ઘર, કાર્યસ્થળ અથવા તમને પસંદ હોય એ જગ્યાએથી કામ કરી શકો છો. મેં જોયું કે દુનિયામાં ઘણા લોકો રિમોટ કામ ખુબ જ ખુશીથી કરી રહ્યા હતા. મેં ઑફિસ જોબ છોડીને રિમોટ કામ કરવાનું નક્કી કર્યું. મારા માતાપિતા, કુટુંબીજનો અને સંબંધીઓએ મને ઓફિસની નોકરી ના છોડવાની સલાહ આપી કારણ કે તેઓ માનતા હતા કે રિમોટ કામ એ ઓફિસ જોબ જેટલું સુરક્ષિત નથી. પરંતુ હું મારા નિર્ણય સાથે જોડાઈ રહ્યો. માર્ચ 2015 માં, મેં નોટિસના સમયગાળા વગર મારા કામમાંથી રાજીનામું આપ્યું હતું અને શરત હતી કે આ નોકરીનો કોઈપણ અનુભવ પત્ર મને પૂરો પાડવામાં આવશે નહીં.</p>
<blockquote><p>&#8220;પ્રારંભિક તબક્કે ફ્રીલાન્સર બનવું મુશ્કેલ હતું. પરંતુ હું તે ગમે તેમ કરીને શરૂ કરવાનો ખુબ જ પ્રયાસ કરી રહ્યો હતો.&#8221;</p></blockquote>
<p>મેં એક લોકપ્રિય ફ્રીલાન્સર માર્કેટપ્લેસમાં રજીસ્ટર કર્યું હતું. 1 અઠવાડિયાના સખત પ્રયાસ કાર્ય પછી મને પહેલો પ્રોજેક્ટ મળ્યો. આ પ્રોજેક્ટ કાઉન્ટડાઉન ટાઈમર સાથે એક HTML પેજ બનાવવા માટે મને માત્ર $5 મળ્યા હતા. મેં એ પ્રોજેક્ટ સફળતાપૂર્વક પૂરો કર્યો અને શ્રેષ્ઠ રિવ્યૂ મેળવ્યો. તે પછી મેં ઘણા પ્રોજેક્ટ્સ પણ સફળતાપૂર્વક પૂર્ણ કર્યા હતા. બસ આ જ! મને મારો નિર્ણય સાચો પુરવાર થયો. પ્રથમ થોડા અઠવાડિયાની અંદર મેં એક યુએસ ક્લાયન્ટ માટે વેબસાઇટ બનાવી. તેઓ મારા કામથી પ્રભાવિત થયા હતા અને એપ્રિલ 2015 માં મને તેમની કંપની માટે સંપૂર્ણ સમય માટે વેબ ડેવલપર તરીકે નિયુક્ત કર્યો. હું આજે પણ તેમની સાથે ખુબ જ ખુશીપૂર્વક મારા ઘરેથી રિમોટ કામ કરું છું!</p>
<blockquote><p>&#8220;બધું સરળતાપૂર્વક જઈ રહ્યું છે. હું ઘરેથી કામ કરીને સ્વતંત્રતા અને પરિવાર સાથે ગુણવત્તાભર્યો સમય પસાર કરવાનો આનંદ અનુભવું છું.&#8221;</p></blockquote>
<p>ઑક્ટોબર 2016 માં, મને વર્ડકેમ્પ વિશે જાણવા મળ્યું. મેં મારી પહેલી વર્ડકેમ્પ નાસિક 2016 માં હાજરી આપી હતી. હું ઘણા વર્ડપ્રેસ ડેવલપર્સ, ફ્રીલાન્સર્સ, પ્રોફેશનલ્સ, યુઝર્સ અને ઘણા અન્ય લોકોને આ વર્ડકેમ્પ પર મળ્યો હતો. તે પછી, હું વર્ડકેમ્પ નો ચાહક બની ગયો. અમે અમારા શહેરમાં મીટપનું નું આયોજન કરવાનું શરૂ કર્યું. છેલ્લા વર્ષમાં, 6 થી વધુ વર્ડકેમ્પ પર મેં હાજરી આપીને, સ્વયંસેવક અને મિત્ર સ્પોન્સર તરીકે ફાળો આપ્યો છે. હાલમાં હું અમદાવાદ વર્ડપ્રેસ સમુદાયનો સક્રિય સભ્ય છું</p>
<blockquote><p>&#8220;હું વર્ડકેમ્પનો પ્રેમી છું. વર્ડકેમ્પ નવા લોકોને મળવાનો, પોતાના જ્ઞાનની આપ-લે કરવાનો એક માર્ગ છે!&#8221;</p></blockquote>
<p>ઓક્ટોબર 2017 માં, અમે અમારા શહેરમાં સફળતાપૂર્વક વર્ડકૅમ્પનું આયોજન કર્યું હતું. વર્ડકૅમ્પ અમદાવાદની પેનલ ચર્ચામાં મેં વિદ્યાર્થીઓ અને વપરાશકર્તાઓ માટે રિમોટ કામ કેવી રીતે સારી કારકિર્દી હોઈ શકે તે વિશે ચર્ચા કરી હતી.</p>
<blockquote><p>&#8220;વર્ડપ્રેસ ફક્ત સીએમએસ નથી, પણ તે શ્રેષ્ઠ લોકોનો સમુદાય છે.&#8221;</p></blockquote>
<div class="rtsocial-container rtsocial-container-align-right rtsocial-horizontal"><div class="rtsocial-twitter-horizontal"><div class="rtsocial-twitter-horizontal-button"><a title="Tweet: Remote Work Brings Freedom" class="rtsocial-twitter-button" href="https://twitter.com/share?text=Remote%20Work%20Brings%20Freedom&via=heropress&url=https%3A%2F%2Fheropress.com%2Fessays%2Fremote-work-brings-freedom%2F" rel="nofollow" target="_blank"></a></div></div><div class="rtsocial-fb-horizontal fb-light"><div class="rtsocial-fb-horizontal-button"><a title="Like: Remote Work Brings Freedom" class="rtsocial-fb-button rtsocial-fb-like-light" href="https://www.facebook.com/sharer.php?u=https%3A%2F%2Fheropress.com%2Fessays%2Fremote-work-brings-freedom%2F" rel="nofollow" target="_blank"></a></div></div><div class="rtsocial-linkedin-horizontal"><div class="rtsocial-linkedin-horizontal-button"><a class="rtsocial-linkedin-button" href="https://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fheropress.com%2Fessays%2Fremote-work-brings-freedom%2F&title=Remote+Work+Brings+Freedom" rel="nofollow" target="_blank" title="Share: Remote Work Brings Freedom"></a></div></div><div class="rtsocial-pinterest-horizontal"><div class="rtsocial-pinterest-horizontal-button"><a class="rtsocial-pinterest-button" href="https://pinterest.com/pin/create/button/?url=https://heropress.com/essays/remote-work-brings-freedom/&media=https://heropress.com/wp-content/uploads/2017/12/120617-150x150.jpg&description=Remote Work Brings Freedom" rel="nofollow" target="_blank" title="Pin: Remote Work Brings Freedom"></a></div></div><a rel="nofollow" class="perma-link" href="https://heropress.com/essays/remote-work-brings-freedom/" title="Remote Work Brings Freedom"></a></div><p>The post <a rel="nofollow" href="https://heropress.com/essays/remote-work-brings-freedom/">Remote Work Brings Freedom</a> appeared first on <a rel="nofollow" href="https://heropress.com">HeroPress</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 06 Dec 2017 02:30:55 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Chetan Prajapati";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:41;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:65:"WPTavern: WordCamp US 2017 is Livestreaming All Sessions for Free";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:29:"https://wptavern.com/?p=76937";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:76:"https://wptavern.com/wordcamp-us-2017-is-livestreaming-all-sessions-for-free";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2781:"<p><a href="https://i1.wp.com/wptavern.com/wp-content/uploads/2017/04/wordcamp-us-nashville.jpeg?ssl=1"><img /></a></p>
<p>WordCamp US is kicking off this morning. If you couldn&#8217;t make the journey to Nashville, you can still follow along at home or wherever you are in the world. <a href="https://2017.us.wordcamp.org/tickets/" rel="noopener" target="_blank">Livestream Tickets</a> are free on the event&#8217;s website. Once you&#8217;ve registered for a ticket, head on over to <a href="https://2017.us.wordcamp.org/live-stream/" rel="noopener" target="_blank">2017.us.wordcamp.org/live-stream/</a> and you&#8217;ll be able to tune in to the Fiddle Track, Banjo Track, Guitar Track, and the State of the Word (scheduled for Saturday, December 2, at 4PM CST).</p>
<p>WordCamp US will be running three tracks simultaneously for both days of the conference and all sessions will be livestreamed. Check out the <a href="https://2017.us.wordcamp.org/schedule/" rel="noopener" target="_blank">schedule</a> to find sessions you want to attend from home. Volunteers will also include captions, which will be embedded within the live stream video. If you have any problems with the stream, the event has a page dedicated to <a href="https://2017.us.wordcamp.org/live-stream/attendee-test/" rel="noopener" target="_blank">livestream attendees</a> with a backup stream, as well as a troubleshooting page for <a href="https://2017.us.wordcamp.org/live-stream/support/" rel="noopener" target="_blank">livestream support</a>.</p>
<p>If you&#8217;re following along on Twitter, the <a href="https://twitter.com/wordcampus" rel="noopener" target="_blank">WCUS Twitter</a> volunteers will be providing threaded coverage of sessions. This should keep your Twitter stream a little tidier with a kickoff tweet for each session, followed by live coverage threaded under each as replies.</p>
<blockquote class="twitter-tweet">
<p lang="en" dir="ltr">Want to follow along with WCUS coverage at home? It will be easy by following our threaded coverage.  Each session will start with a tweet that looks like this, All coverage of that session will be threaded to that kick-off tweet. <a href="https://t.co/J0M6jo6GEi">pic.twitter.com/J0M6jo6GEi</a></p>
<p>&mdash; WordCamp US (@WordCampUS) <a href="https://twitter.com/WordCampUS/status/936595172485468160?ref_src=twsrc%5Etfw">December 1, 2017</a></p></blockquote>
<p></p>
<p>Want to see WCUS hosted near you in 2019/2020? <a href="https://wordcampcentral.polldaddy.com/s/wcus-2019-2020" rel="noopener" target="_blank">Applications for host cities</a> opened today. If you want to be part of the team that makes WCUS happen in your city, talk to your local WordPress community organizers about filling out an application for the next host city.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 01 Dec 2017 15:34:56 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:42;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:47:"Dev Blog: The Month in WordPress: November 2017";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://wordpress.org/news/?p=5290";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:72:"https://wordpress.org/news/2017/12/the-month-in-wordpress-november-2017/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4232:"<p>The WordPress project recently released WordPress 4.9, “Tipton” — a new major release named in honor of musician and band leader Billy Tipton. Read on to find out more about this and other interesting news from around the WordPress world in November.</p>



<hr class="wp-block-separator" />



<h2>WordPress 4.9 “Tipton”</h2>



<p>On November 16, <a href="https://wordpress.org/news/2017/11/tipton/">WordPress 4.9 was released</a> with new features for publishers and developers alike. Release highlights include design locking, scheduling, and previews in the Customizer, an even more secure and usable code editing experience, a new gallery widget, and text widget improvements.</p>



<p>The follow up security and maintenance, v4.9.1, <a href="https://wordpress.org/news/2017/11/wordpress-4-9-1-security-and-maintenance-release/">has now been released</a> to tighten up the security of WordPress as a whole.</p>



<p>To get involved in building WordPress Core, jump into the #core channel in the<a href="https://make.wordpress.org/chat/"> Making WordPress Slack group</a>, and follow<a href="https://make.wordpress.org/core/"> the Core team blog</a>.</p>



<h2>Apply to Speak At WordCamp Europe 2018</h2>



<p>The next edition of WordCamp Europe takes place in June, 2018. While the organizing team is still in the early stages of planning, <a href="https://2018.europe.wordcamp.org/2017/11/15/are-you-ready-to-speak-at-the-largest-wordpress-event-in-europe/">they are accepting speaker applications</a>.</p>



<p>WordCamp Europe is the largest WordCamp in the world and, along with WordCamp US, one of the flagship events of the WordCamp program — speaking at this event is a great way to give back to the global WordPress community by sharing your knowledge and expertise with thousands of WordPress enthusiasts.</p>



<h2>Diversity Outreach Speaker Training Initiative</h2>



<p>To help WordPress community organizers offer diverse speaker lineups, <a href="https://make.wordpress.org/community/2017/11/13/call-for-volunteers-diversity-outreach-speaker-training/">a new community initiative has kicked off</a> to use existing <a href="https://make.wordpress.org/training/handbook/speaker-training/">speaker training workshops</a> to demystify speaking requirements and help participants gain confidence in their ability to share their WordPress knowledge in a WordCamp session.</p>



<p>The working group behind this initiative will be meeting regularly to discuss and plan how they can help local communities to train speakers for WordCamps and other events.</p>



<p>To get involved in this initiative, you can join the meetings at 5pm UTC every other Wednesday in the #community-team channel of the<a href="https://make.wordpress.org/chat/"> Making WordPress Slack group</a>.</p>



<hr class="wp-block-separator" />



<h2>Further Reading:</h2>



<ul>
    <li><a href="https://2017.us.wordcamp.org/">WordCamp US 2017</a> is happening on December 1-3 in Nashville, with the annual State of the Word talk happening on Saturday afternoon — <a href="https://2017.us.wordcamp.org/live-stream/">the live stream of the entire event is available to view for free</a>.</li>
    <li><a href="https://xwp.co/tide-a-path-to-better-code-across-the-wordpress-ecosystem/">Tide</a>, a new service from XWP designed to help users make informed plugin choices, is due to launch at WordCamp US.</li>
    <li>Gutenberg development is continuing rapidly, with <a href="https://make.wordpress.org/core/2017/11/28/whats-new-in-gutenberg-28th-november/">a packed new release</a> and a focus on <a href="https://make.wordpress.org/test/2017/11/22/testing-flow-in-gutenberg/">usability testing</a>.</li>
    <li>After some discussion among the community, <a href="https://make.wordpress.org/community/2017/11/10/discussion-micro-regional-wordcamps/">a new type of micro-regional WordCamp</a> is going to be introduced into the global WordCamp program.</li>
</ul>



<p><em></em></p>



<p><em>If you have a story we should consider including in the next “Month in WordPress” post, please <a href="https://make.wordpress.org/community/month-in-wordpress-submissions/">submit it here</a>.</em></p>



<p><em></em></p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 01 Dec 2017 11:00:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Hugh Lashbrooke";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:43;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:34:"BuddyPress: BuddyPress 2018 Survey";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://buddypress.org/?p=269296";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:54:"https://buddypress.org/2017/12/buddypress-2018-survey/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:630:"<p>What would you like BuddyPress to focus on in 2018? The core team has ideas of where BuddyPress can expand on and your input is important to harness the time and resources of an all-volunteer crew.</p>
<p>The survey will take 10-15 minutes to complete. Be assured that we will not publish your name, email address, nor IP address when we post the results of this survey at BuddyPress.org.</p>
<p>Thank you for your time and cooperation. Your feedback will help us improve BuddyPress for you.</p>
<p>=&gt;  <strong><a href="https://mercime.polldaddy.com/s/buddypress-2018-survey">Take the 2018 BuddyPress Survey</a></strong></p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 01 Dec 2017 10:26:07 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"@mercime";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:44;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:72:"WPTavern: Gutenberg 1.8 Adds Greater Extensibility for Plugin Developers";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:29:"https://wptavern.com/?p=76855";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:83:"https://wptavern.com/gutenberg-1-8-adds-greater-extensibility-for-plugin-developers";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3668:"<p><a href="https://make.wordpress.org/core/2017/11/28/whats-new-in-gutenberg-28th-november/" rel="noopener" target="_blank">Gutenberg 1.8</a> was released this week with several notable improvements that will give plugin developers more flexibility in extending the editor. It introduces <a href="https://github.com/WordPress/gutenberg/pull/3668" rel="noopener" target="_blank">block templates</a>, which developers can use when registering a new custom post type. The block templates define a set of pre-configured blocks that will initialize when a user creates a new post. In the example below, Gutenberg lead engineer Matias Ventura demonstrates what a block template for a book custom post type might look like.</p>
<p><a href="https://i0.wp.com/wptavern.com/wp-content/uploads/2017/11/block-template-book.gif?ssl=1"><img /></a></p>
<p>This release also <a href="https://github.com/WordPress/gutenberg/pull/3456" rel="noopener" target="_blank">improves the design of the tools menu</a> (toggled by the ellipses at the top of the editor) to have a more lightweight UI that will lend itself better to displaying items added by extensions in the future. The new design displays multiple menu items as a radio group where the selected item shows a checkmark, an approach that Gutenberg designers found to be more intuitive after some research.</p>
<p><a href="https://i0.wp.com/wptavern.com/wp-content/uploads/2017/11/Screen-Shot-2017-11-29-at-10.02.09-PM.png?ssl=1"><img /></a></p>
<p>Version 1.8 adds the ability for developers to <a href="https://github.com/WordPress/gutenberg/pull/3577" rel="noopener" target="_blank">filter allowed block types</a> by specifying an array of type names that can be shown in the inserter component. This capability paves the way for block nesting where developers can define allowed children types. It also allows custom post types to specify which blocks are allowed or restricted, which will be useful for keeping CPTs lean as Gutenberg already has a large number of block types.</p>
<p>The release also <a href="https://github.com/WordPress/gutenberg/pull/3554" rel="noopener" target="_blank">improves meta box compatibility</a> with a fallback to the classic editor if Gutenberg detects that the meta box is unsupported. Plugin authors can now explicitly declare Gutenberg incompatibility when registering meta boxes, which will trigger a warning to the end user that explains which meta boxes have caused the fallback to the classic editor.</p>
<p>In addition to all the improvements for extending Gutenberg, version 1.8 makes many small design tweaks, including <a href="https://github.com/WordPress/gutenberg/pull/3054" rel="noopener" target="_blank">updated color pickers</a> with color indications and collapsible panels, <a href="https://github.com/WordPress/gutenberg/pull/3563" rel="noopener" target="_blank">updated icon and tooltip</a> for table of contents menu, and a new <a href="https://github.com/WordPress/gutenberg/pull/3483" rel="noopener" target="_blank">contrast checker</a> for paragraph color options. It also <a href="https://github.com/WordPress/gutenberg/pull/3632" rel="noopener" target="_blank">puts block actions back on the block level</a> for the default, while still preserving the option to change it to a fixed toolbar at the top of the screen.</p>
<p>For a full list of all the changes in version 1.8, check out the <a href="https://make.wordpress.org/core/2017/11/28/whats-new-in-gutenberg-28th-november/" rel="noopener" target="_blank">release post</a> and the <a href="https://wordpress.org/plugins/gutenberg/#developers" rel="noopener" target="_blank">changelog</a> on WordPress.org.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 30 Nov 2017 17:23:28 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:45;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:94:"WPTavern: WPWeekly Episode 296 – Gutenberg, Telemetry, Calypso, and More With Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:58:"https://wptavern.com?p=76917&preview=true&preview_id=76917";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:98:"https://wptavern.com/wpweekly-episode-296-gutenberg-telemetry-calypso-and-more-with-matt-mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1249:"<p>In this episode, <a href="https://jjj.blog/">John James Jacoby</a> and I are joined by <a href="https://ma.tt/">Matt Mullenweg</a>, co-creator of the WordPress project and CEO of Automattic. We discussed a wide range of topics including, his role on the board of directors at GitLab, Telemetry or data-usage gathering in WordPress, and the WordPress Growth Council.</p>
<p>We learned what&#8217;s happening with the Mobile teams inside Automattic, the future of Calypso, and the role of Pressable as a testing bed. Last but not least, we find out how beneficial joining HackerOne has been for WordPress and why WordPress.com finally allowed the installation of third-party themes and plugins through its Business Plan.</p>
<h2>WPWeekly Meta:</h2>
<p><strong>Next Episode:</strong> Wednesday, December 13th 3:00 P.M. Eastern</p>
<p>Subscribe to <a href="https://itunes.apple.com/us/podcast/wordpress-weekly/id694849738">WordPress Weekly via Itunes</a></p>
<p>Subscribe to <a href="https://www.wptavern.com/feed/podcast">WordPress Weekly via RSS</a></p>
<p>Subscribe to <a href="http://www.stitcher.com/podcast/wordpress-weekly-podcast?refid=stpr">WordPress Weekly via Stitcher Radio</a></p>
<p><strong>Listen To Episode #296:</strong><br />
</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 30 Nov 2017 04:40:42 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:46;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:59:"WPTavern: WordPress 4.9.1 Released, Fixes Page Template Bug";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:29:"https://wptavern.com/?p=76879";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://wptavern.com/wordpress-4-9-1-released-fixes-page-template-bug";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1473:"<p>WordPress 4.9.1 <a href="https://wordpress.org/news/2017/11/wordpress-4-9-1-security-and-maintenance-release/">is available</a> for download and is a maintenance and security release. This release addresses four security issues in WordPress 4.9 and below that could potentially be used as part of a multi-vector attack. According to the release notes, the following changes have been made to WordPress to protect against these vulnerabilities.</p>
<ol>
<li>Use a properly generated hash for the <code>newbloguser</code> key instead of a determinate substring.</li>
<li>Add escaping to the language attributes used on <code>html</code> elements.</li>
<li>Ensure the attributes of enclosures are correctly escaped in RSS and Atom feeds.</li>
<li>Remove the ability to upload JavaScript files for users who do not have the <code>unfiltered_html</code> capability.</li>
</ol>
<p><a href="https://twitter.com/0x62626262">Rahul Pratap Singh</a> and John Blackbourn are credited with responsibly disclosing the vulnerabilities. In addition to the changes above, 4.9.1 fixes eleven bugs, including the Page Template issue <a href="https://wptavern.com/workarounds-for-the-page-template-bug-in-wordpress-4-9">we wrote about</a> last week. Many sites have already updated to 4.9.1 automatically. To see a list of detailed changes, check out <a href="https://make.wordpress.org/core/2017/11/28/wordpress-4-9-1-scheduled-for-november-29th/">this post</a> on Make WordPress Core.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 30 Nov 2017 04:07:31 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:47;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:96:"WPTavern: Distributor Plugin Now in Beta: A New WordPress Content Syndication Solution from 10up";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:29:"https://wptavern.com/?p=76871";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:106:"https://wptavern.com/distributor-plugin-now-in-beta-a-new-wordpress-content-syndication-solution-from-10up";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:6117:"<p>10up published a <a href="https://10up.com/blog/2017/distributor-plugin/" rel="noopener" target="_blank">preview of its Distributor plugin</a> today, a new solution for syndicating content across WordPress multisite networks and the web. The <a href="https://distributorplugin.com/" rel="noopener" target="_blank">plugin</a>, which the company plans to release for free, is currently in final closed beta. It enables content managers to either &#8220;push&#8221; or &#8220;pull&#8221; content to/from sites where they have permission to publish.</p>
<a href="https://i2.wp.com/wptavern.com/wp-content/uploads/2017/11/distributor-push-screenshot.jpg?ssl=1"><img /></a>image credit: <a href="https://10up.com/blog/2017/distributor-plugin/">10up</a>
<p>Distributor includes the ability for editors to make changes to the original post and have linked copies automatically inherit the changes. This includes post content, post meta (custom fields), and taxonomy terms. It also ensures that content is SEO-friendly by providing canonical links that prevent duplicate content issues.</p>
<p>The plugin differs from many <a href="https://wordpress.org/plugins/search/syndicate/" rel="noopener" target="_blank">existing content syndication solutions</a>, which traditionally make use of RSS or XML/RPC, in that it is built using the <a href="https://developer.wordpress.org/rest-api/" rel="noopener" target="_blank">REST API</a>.</p>
<p>&#8220;The main technical advantage of the REST API is that it’s a &#8216;standard&#8217; inside core for sharing information across sites,&#8221; 10up President Jake Goldman said. &#8220;Outside of multisite, we never even considered another approach. It is worth saying that you do need Distributor installed on both &#8216;ends&#8217; for all of its features to work across the REST API &#8211; we need to extend the REST API a bit to get everything to pull across (plus the handling of &#8216;linked&#8217; copies).&#8221;</p>
<p><a href="https://i0.wp.com/wptavern.com/wp-content/uploads/2017/11/distributor-pull-screenshot.jpg?ssl=1"><img /></a></p>
<p>Goldman said that although &#8220;syndication&#8221; means many different things to different people, the &#8220;classic&#8221; use case of simply pulling from a source, such as ingesting content from a newswire, is not exactly the use case for Distributor. He said the team behind the plugin is perhaps more excited about the &#8220;push&#8221; implementation. In building their own solution, 10up also incorporated its trademark lean/streamlined UI, as many existing solutions are more complicated to use.</p>
<p>&#8220;We’re definitely aware that there are other takes at a good content sharing workflow,&#8221; Goldman said. &#8220;We even helped Automattic refactor their solution a few years ago, which they use on VIP. We took a bit of inspiration from that project, including the modular &#8216;connection&#8217; types. In earnest, when trying to help our clients find solutions that were intuitive, extensible, and engineered to an enterprise grade, we just couldn’t endorse any of the options we found. It’s more a UX problem &#8211; clunky workflows, overwhelming interfaces, feature overload (I prefer a certain simplicity) &#8211; than anything, though we also have concerns about how modular / customizable some of the other solutions are.&#8221;</p>
<h3>10up Plans to Release Distributor on WordPress.org Following the Closed Beta</h3>
<p>10up currently has several clients using Distributor, including large publishers with several properties/magazines/newspapers, as well as large technology businesses using it for their news and media features across a network of sites. The plugin is in final closed beta but 10up is granting early access to those with interesting use cases.</p>
<p>&#8220;We’re casting a pretty broad net in terms of &#8216;appropriate&#8217; use cases for the beta; in fact, we’re hoping that broader beta testing will open our eyes to great use cases within the scope of its purpose that we hadn’t  considered,&#8221; Goldman said. &#8220;We’ve already heard from some very large publishers, some smaller digital publishers, universities, public school systems, some enterprises with multiple properties, agencies interested in staging content, and just engineers who own multiple sites that share content &#8211; we’re excited about all of these use cases!&#8221;</p>
<p>Goldman said his team is most curious to see Distributor applied to use cases that aren&#8217;t simply &#8220;news and publishing,&#8221; including CRMs and product businesses with multiples sites that share content. 10up has not yet tested specific plugins for full compatibility with Distributor, but Goldman said pre-version 1.0, it should work with any plugin that adds custom post types and fields/taxonomies &#8220;the WordPress way.&#8221;</p>
<p>&#8220;In fact, Distributor checks to see which sites support the same post type and terms before it offers a list of sites you can &#8216;distribute&#8217; content to (so you can’t &#8216;distribute&#8217; a WooCommerce product to a site not running WooCommerce),&#8221; he said. Selling the same products across multiple stores, with automatically updating inventory and price changes, is just one of the many interesting use cases for Distributor.</p>
<p>Goldman said the team anticipates taking the plugin out of beta and putting it on WordPress.org by mid to late Q1 of 2018, in approximately 2-3 months, depending on feedback from testers. 10up does not currently have a plan to monetize the plugin.</p>
<p>&#8220;I never want to rule out that there are &#8216;eventually&#8217; opportunities for commercialization, but I can honestly say that isn’t anywhere on our roadmap or consideration set at the moment,&#8221; Goldman said.</p>
<p>Those who want to get in on the Distributor beta before it is publicly available can <a href="https://distributorplugin.com/" rel="noopener" target="_blank">sign up on the plugin&#8217;s website </a>with a quick explanation of your use case. 10up will send a copy of the plugin for testing.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 29 Nov 2017 23:19:59 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:48;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:58:"Dev Blog: WordPress 4.9.1 Security and Maintenance Release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"https://wordpress.org/news/?p=5215";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:84:"https://wordpress.org/news/2017/11/wordpress-4-9-1-security-and-maintenance-release/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4275:"<p>WordPress 4.9.1 is now available. This is a <strong>security and maintenance release</strong> for all versions since WordPress 3.7. We strongly encourage you to update your sites immediately.</p>



<p>WordPress versions 4.9 and earlier are affected by four security issues which could potentially be exploited as part of a multi-vector attack. As part of the core team&#x27;s ongoing commitment to security hardening, the following fixes have been implemented in 4.9.1:</p>



<ol>
    <li>Use a properly generated hash for the <code>newbloguser</code> key instead of a determinate substring.</li>
    <li>Add escaping to the language attributes used on <code>html</code> elements.</li>
    <li>Ensure the attributes of enclosures are correctly escaped in RSS and Atom feeds.</li>
    <li>Remove the ability to upload JavaScript files for users who do not have the <code>unfiltered_html</code> capability.</li>
</ol>



<p>Thank you to the reporters of these issues for practicing <a href="https://make.wordpress.org/core/handbook/testing/reporting-security-vulnerabilities/">responsible security disclosure</a>: <a href="https://twitter.com/0x62626262">Rahul Pratap Singh</a> and John Blackbourn.</p>



<p>Eleven other bugs were fixed in WordPress 4.9.1. Particularly of note were:</p>



<ul>
    <li>Issues relating to the caching of theme template files.</li>
    <li>A MediaElement JavaScript error preventing users of certain languages from being able to upload media files.</li>
    <li>The inability to edit theme and plugin files on Windows based servers.</li>
</ul>



<p><a href="https://make.wordpress.org/core/2017/11/28/wordpress-4-9-1-scheduled-for-november-29th/">This post has more information about all of the issues fixed in 4.9.1 if you&#x27;d like to learn more</a>.</p>



<p><a href="https://wordpress.org/download/">Download WordPress 4.9.1</a> or venture over to Dashboard → Updates and click "Update Now." Sites that support automatic background updates are already beginning to update automatically.</p>



<p>Thank you to everyone who contributed to WordPress 4.9.1:</p>



<p><a href="https://profiles.wordpress.org/schlessera/">Alain Schlesser</a>, <a href="https://profiles.wordpress.org/afercia/">Andrea Fercia</a>, <a href="https://profiles.wordpress.org/la-geek/">Angelika Reisiger</a>, <a href="https://profiles.wordpress.org/blobfolio/">Blobfolio</a>, <a href="https://profiles.wordpress.org/bobbingwide/">bobbingwide</a>, <a href="https://profiles.wordpress.org/chetan200891/">Chetan Prajapati</a>, <a href="https://profiles.wordpress.org/dd32/">Dion Hulse</a>, <a href="https://profiles.wordpress.org/ocean90/">Dominik Schilling (ocean90)</a>, <a href="https://profiles.wordpress.org/edo888/">edo888</a>, <a href="https://profiles.wordpress.org/erich_k4wp/">Erich Munz</a>, <a href="https://profiles.wordpress.org/flixos90/">Felix Arntz</a>, <a href="https://profiles.wordpress.org/mista-flo/">Florian TIAR</a>, <a href="https://profiles.wordpress.org/pento/">Gary Pendergast</a>, <a href="https://profiles.wordpress.org/ibenic/">Igor Benic</a>, <a href="https://profiles.wordpress.org/jfarthing84/">Jeff Farthing</a>, <a href="https://profiles.wordpress.org/jbpaul17/">Jeffrey Paul</a>, <a href="https://profiles.wordpress.org/jeremyescott/">jeremyescott</a>, <a href="https://profiles.wordpress.org/joemcgill/">Joe McGill</a>, <a href="https://profiles.wordpress.org/johnbillion/">John Blackbourn</a>, <a href="https://profiles.wordpress.org/johnpgreen/">johnpgreen</a>, <a href="https://profiles.wordpress.org/ryelle/">Kelly Dwan</a>, <a href="https://profiles.wordpress.org/lenasterg/">lenasterg</a>, <a href="https://profiles.wordpress.org/clorith/">Marius L. J.</a>, <a href="https://profiles.wordpress.org/melchoyce/">Mel Choyce</a>, <a href="https://profiles.wordpress.org/mariovalney/">Mário Valney</a>, <a href="https://profiles.wordpress.org/natacado/">natacado</a>, <a href="https://profiles.wordpress.org/odysseygate/">odyssey</a>, <a href="https://profiles.wordpress.org/precies/">precies</a>, <a href="https://profiles.wordpress.org/stodorovic/">Saša</a>, <a href="https://profiles.wordpress.org/sergeybiryukov/">Sergey Biryukov</a>, and <a href="https://profiles.wordpress.org/westonruter/">Weston Ruter</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 29 Nov 2017 20:33:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"John Blackbourn";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:49;a:6:{s:4:"data";s:13:"
	
	
	
	
	
	
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:74:"WPTavern: Four Things I’d Like to See in This Year’s State of the Word";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:29:"https://wptavern.com/?p=76830";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:79:"https://wptavern.com/four-things-id-like-to-see-in-this-years-state-of-the-word";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2724:"<p>This weekend, WordPressers from far and wide will descend upon Nashville, TN, for WordCamp US. One of the highlights of the event is Matt Mullenweg&#8217;s <a href="https://ma.tt/2016/12/state-of-the-word-2016/">State of the Word</a>. Last year, Mullenweg shared a variety of statistics, made a few announcements, and plotted a new course for WordPress development.</p>
<p>As the event draws near, here are some things I&#8217;d like to see addressed in this year&#8217;s State of the Word.</p>
<h2>Will There Be A Renewed Effort to Make Calypso Plugin Aware?</h2>
<p>During the 2016 State of the Word, Mullenweg announced that Calypso became plugin aware.</p>
<img />Plugin Aware Calypso
<p>The idea was that plugins that are actively installed on more than 1 million sites could participate in an experimental program that would add meta box support and other plugin specific features to Calypso. To this day, this has not materialized and I&#8217;d like to know what happened and if there will be a renewed effort in 2018.</p>
<h2>An Update on WordPress Foundation Supported Initiatives</h2>
<p>Last year, we learned that WordCamp Central became its own Public Benefit Corporation while the WordPress Foundation maintained its non-profit status. In addition, the Foundation announced support for like-minded non-profits such as, Hack the Hood, Internet Archive, and Black Girls CODE.</p>
<p>I&#8217;d like to know how much money the Foundation has contributed to these causes and if any progress has been made on providing educational workshops in underdeveloped countries.</p>
<h2>An Update on WordPress&#8217; Development/Release Strategy</h2>
<p>A year into WordPress&#8217; new development and release strategy, I&#8217;d like to know what challenges he and the team have faced and overcome. I&#8217;d also like to know if the results he has seen thus far warrant continuing the experiment in 2018.</p>
<h2>Take an Opportunity to Explain What Gutenberg Really Is</h2>
<p>Last year, Mullenweg surprised the community by announcing that the WordPress post editor would be revamped. Since then, we&#8217;ve learned that the project&#8217;s <a href="https://ma.tt/2017/08/we-called-it-gutenberg-for-a-reason/">name is Gutenberg</a> and it&#8217;s about more than just the editor. I&#8217;d like to see Mullenweg take this unique opportunity to provide a deeper explanation into what the project is and why it&#8217;s pivotal for WordPress&#8217; continued success.</p>
<hr />
<p>This year&#8217;s State of the Word will be presented on Saturday, December 2nd, at 4PM Eastern. If you can&#8217;t see it in-person, you can <a href="https://2017.us.wordcamp.org/live-stream/">watch it for free</a> via the livestream.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 29 Nov 2017 17:38:16 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";O:42:"Requests_Utility_CaseInsensitiveDictionary":1:{s:7:"', 'no');
INSERT INTO "public"."wp_options" VALUES (139, '_transient_timeout_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1516849664', 'no');
INSERT INTO "public"."wp_options" VALUES (140, '_transient_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1516806464', 'no');
INSERT INTO "public"."wp_options" VALUES (141, '_transient_timeout_dash_v2_c05853b002c443ec8e57ff884f56cdde', '1516849664', 'no');
INSERT INTO "public"."wp_options" VALUES (142, '_transient_dash_v2_c05853b002c443ec8e57ff884f56cdde', '<div class="rss-widget"><ul><li><a class=''rsswidget'' href=''https://es.wordpress.org/2018/01/22/noticias-y-eventos-wordpress-para-la-semana-04-18/''>Noticias y eventos de la semana</a></li></ul></div><div class="rss-widget"><ul><li><a class=''rsswidget'' href=''https://heropress.com/essays/believe-in-yourself/#utm_source=rss&#038;utm_medium=rss&#038;utm_campaign=believe-in-yourself''>HeroPress: Believe In Yourself</a></li><li><a class=''rsswidget'' href=''https://wptavern.com/new-toolkit-simplifies-the-process-of-creating-gutenberg-blocks''>WPTavern: New Toolkit Simplifies the Process of Creating Gutenberg Blocks</a></li><li><a class=''rsswidget'' href=''https://wptavern.com/free-conference-dedicated-to-wordpress-in-higher-ed-takes-place-january-30th-at-9am-cst''>WPTavern: Free Conference Dedicated to WordPress in Higher Ed Takes Place January 30th at 9AM CST</a></li></ul></div>', 'no');
INSERT INTO "public"."wp_options" VALUES (119, '_site_transient_update_plugins', 'O:8:"stdClass":5:{s:12:"last_checked";i:1516812834;s:7:"checked";a:5:{s:19:"akismet/akismet.php";s:5:"4.0.2";s:9:"hello.php";s:3:"1.6";s:29:"post-ratings/post-ratings.php";s:3:"3.0";s:39:"really-simple-breadcrumb/breadcrumb.php";s:5:"1.0.2";s:23:"wp-review/wp-review.php";s:6:"4.0.11";}s:8:"response";a:0:{}s:12:"translations";a:1:{i:0;a:7:{s:4:"type";s:6:"plugin";s:4:"slug";s:11:"hello-dolly";s:8:"language";s:5:"es_ES";s:7:"version";s:3:"1.6";s:7:"updated";s:19:"2017-09-22 18:05:32";s:7:"package";s:76:"https://downloads.wordpress.org/translation/plugin/hello-dolly/1.6/es_ES.zip";s:10:"autoupdate";b:1;}}s:9:"no_update";a:5:{s:19:"akismet/akismet.php";O:8:"stdClass":9:{s:2:"id";s:21:"w.org/plugins/akismet";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"4.0.2";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.4.0.2.zip";s:5:"icons";a:3:{s:2:"1x";s:59:"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272";s:2:"2x";s:59:"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272";s:7:"default";s:59:"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272";}s:7:"banners";a:2:{s:2:"1x";s:61:"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904";s:7:"default";s:61:"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904";}s:11:"banners_rtl";a:0:{}}s:9:"hello.php";O:8:"stdClass":9:{s:2:"id";s:25:"w.org/plugins/hello-dolly";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";s:5:"icons";a:3:{s:2:"1x";s:63:"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=969907";s:2:"2x";s:63:"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907";s:7:"default";s:63:"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907";}s:7:"banners";a:2:{s:2:"1x";s:65:"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342";s:7:"default";s:65:"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342";}s:11:"banners_rtl";a:0:{}}s:29:"post-ratings/post-ratings.php";O:8:"stdClass":9:{s:2:"id";s:26:"w.org/plugins/post-ratings";s:4:"slug";s:12:"post-ratings";s:6:"plugin";s:29:"post-ratings/post-ratings.php";s:11:"new_version";s:3:"3.0";s:3:"url";s:43:"https://wordpress.org/plugins/post-ratings/";s:7:"package";s:59:"https://downloads.wordpress.org/plugin/post-ratings.3.0.zip";s:5:"icons";a:0:{}s:7:"banners";a:0:{}s:11:"banners_rtl";a:0:{}}s:39:"really-simple-breadcrumb/breadcrumb.php";O:8:"stdClass":9:{s:2:"id";s:38:"w.org/plugins/really-simple-breadcrumb";s:4:"slug";s:24:"really-simple-breadcrumb";s:6:"plugin";s:39:"really-simple-breadcrumb/breadcrumb.php";s:11:"new_version";s:5:"1.0.2";s:3:"url";s:55:"https://wordpress.org/plugins/really-simple-breadcrumb/";s:7:"package";s:73:"https://downloads.wordpress.org/plugin/really-simple-breadcrumb.1.0.2.zip";s:5:"icons";a:0:{}s:7:"banners";a:0:{}s:11:"banners_rtl";a:0:{}}s:23:"wp-review/wp-review.php";O:8:"stdClass":9:{s:2:"id";s:23:"w.org/plugins/wp-review";s:4:"slug";s:9:"wp-review";s:6:"plugin";s:23:"wp-review/wp-review.php";s:11:"new_version";s:6:"4.0.11";s:3:"url";s:40:"https://wordpress.org/plugins/wp-review/";s:7:"package";s:59:"https://downloads.wordpress.org/plugin/wp-review.4.0.11.zip";s:5:"icons";a:3:{s:2:"1x";s:61:"https://ps.w.org/wp-review/assets/icon-128x128.png?rev=979969";s:2:"2x";s:61:"https://ps.w.org/wp-review/assets/icon-256x256.png?rev=979969";s:7:"default";s:61:"https://ps.w.org/wp-review/assets/icon-256x256.png?rev=979969";}s:7:"banners";a:2:{s:2:"1x";s:63:"https://ps.w.org/wp-review/assets/banner-772x250.png?rev=860453";s:7:"default";s:63:"https://ps.w.org/wp-review/assets/banner-772x250.png?rev=860453";}s:11:"banners_rtl";a:0:{}}}}', 'no');
INSERT INTO "public"."wp_options" VALUES (92, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:62:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:14:"manage_ratings";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes');
INSERT INTO "public"."wp_options" VALUES (113, 'theme_mods_twentyseventeen', 'a:2:{s:18:"custom_css_post_id";i:-1;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1516806645;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes');
INSERT INTO "public"."wp_options" VALUES (94, 'WPLANG', 'es_ES', 'yes');
INSERT INTO "public"."wp_options" VALUES (95, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO "public"."wp_options" VALUES (96, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO "public"."wp_options" VALUES (97, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO "public"."wp_options" VALUES (98, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO "public"."wp_options" VALUES (99, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO "public"."wp_options" VALUES (101, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO "public"."wp_options" VALUES (102, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO "public"."wp_options" VALUES (103, 'widget_media_audio', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO "public"."wp_options" VALUES (104, 'widget_media_image', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO "public"."wp_options" VALUES (105, 'widget_media_gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO "public"."wp_options" VALUES (106, 'widget_media_video', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO "public"."wp_options" VALUES (107, 'nonce_key', 'VL`)u}1m-VU$7*Wu.}8aJdNK=rKR=#^ 7/,WluvHQFLh.2 $CaWEkeDf7,aN2sQ|', 'no');
INSERT INTO "public"."wp_options" VALUES (108, 'nonce_salt', 'cC5(Q*{|FjP5~oOox:VP`AnG=2)-EO;9|*Jz>=w!y{GR*L5C]<;M.KQ<^JXw]MTR', 'no');
INSERT INTO "public"."wp_options" VALUES (109, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO "public"."wp_options" VALUES (110, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO "public"."wp_options" VALUES (111, 'widget_custom_html', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO "public"."wp_options" VALUES (117, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:65:"https://downloads.wordpress.org/release/es_ES/wordpress-4.9.2.zip";s:6:"locale";s:5:"es_ES";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:65:"https://downloads.wordpress.org/release/es_ES/wordpress-4.9.2.zip";s:10:"no_content";b:0;s:11:"new_bundled";b:0;s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.9.2";s:7:"version";s:5:"4.9.2";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.7";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1516806446;s:15:"version_checked";s:5:"4.9.2";s:12:"translations";a:0:{}}', 'no');
INSERT INTO "public"."wp_options" VALUES (118, 'auto_updater.lock', '1516806446', 'no');
INSERT INTO "public"."wp_options" VALUES (123, 'auth_key', 'P:]XANL<XWoRlat:^R,a@iT?4=(!]bew;7q9I$p8&XTQtK/5jdl[?7ZSKCDpQ`+D', 'no');
INSERT INTO "public"."wp_options" VALUES (124, 'auth_salt', '_5>Fro$0Hq+<T)R:Ws=~@e.@);mW}<JH_6Qs7Qhh~VF&gzXG;dk1<~k?_EmY?;FY', 'no');
INSERT INTO "public"."wp_options" VALUES (125, 'logged_in_key', 'yozSMyyUs*hXjzqpW.]3@8B;laJs!@AT,xI?l7UYbr*%}uD=u$=aA!!1~:DQ6nER', 'no');
INSERT INTO "public"."wp_options" VALUES (126, 'logged_in_salt', '?;oqu#B:n3R*] VYif}v>[Y_R.<WN_+dv;v-;xgL{f@e$wXdaeKaUn84z}-J7O}H', 'no');
INSERT INTO "public"."wp_options" VALUES (130, 'can_compress_scripts', '1', 'no');
INSERT INTO "public"."wp_options" VALUES (131, '_site_transient_timeout_community-events-4501c091b0366d76ea3218b6cfdd8097', '1516849662', 'no');
INSERT INTO "public"."wp_options" VALUES (132, '_site_transient_community-events-4501c091b0366d76ea3218b6cfdd8097', 'a:2:{s:8:"location";a:1:{s:2:"ip";s:2:"::";}s:6:"events";a:0:{}}', 'no');
INSERT INTO "public"."wp_options" VALUES (133, '_transient_timeout_feed_69c933d8a78805efd0abe985766ffb51', '1516849662', 'no');
INSERT INTO "public"."wp_options" VALUES (134, '_transient_feed_69c933d8a78805efd0abe985766ffb51', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"


";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:49:"
	
	
	
	
	
	
	
	
	
	
		
		
		
		
		
		
		
		
		
	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:8:"Español";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:24:"https://es.wordpress.org";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:8:"Español";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:34:"
	Tue, 23 Jan 2018 22:57:20 +0000	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"es-ES";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:40:"https://wordpress.org/?v=5.0-alpha-42588";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:42:"
		
		
		
		
		
				

		
		
				
			
		
		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Noticias y eventos de la semana";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:86:"https://es.wordpress.org/2018/01/22/noticias-y-eventos-wordpress-para-la-semana-04-18/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:94:"https://es.wordpress.org/2018/01/22/noticias-y-eventos-wordpress-para-la-semana-04-18/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 22 Jan 2018 08:29:29 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"General";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://es.wordpress.org/?p=1981";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:377:"¡Hola a todos! Os dejamos como todas las semanas el listado con los próximos Meetups de WordPress alrededor de España y el avance de las distintas WordCamps. Meetups de esta semana 22/01 &#8211; Las Palmas de Gran Canaria &#8211; Designers vs. Developers, mesa redonda 24/01 &#8211; Sevilla &#8211; Vamos a comer juntos #francachelawpsevilla 24/01 &#8211; Ourense [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Mauricio Gelves";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:6403:"<p><img class="aligncenter size-full wp-image-1150" src="https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana.png" alt="Eventos WordPress para esta semana en españa" width="1280" height="476" srcset="https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana.png 1280w, https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana-300x112.png 300w, https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana-768x286.png 768w, https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana-1024x381.png 1024w" sizes="(max-width: 1280px) 100vw, 1280px" /></p>
<p><strong>¡Hola a todos! </strong>Os dejamos como todas las semanas el listado con los próximos Meetups de <strong>WordPress</strong> alrededor de España y el avance de las distintas WordCamps.</p>
<h2>Meetups de esta semana</h2>
<ul>
<li>22/01 &#8211; <strong>Las Palmas de Gran Canaria</strong> &#8211; <a href="https://www.meetup.com/es-ES/Las-Palmas-de-Gran-Canaria-WordPress-Meetup/events/246271922/">Designers vs. Developers, mesa redonda</a></li>
<li>24/01 &#8211; <strong>Sevilla</strong> &#8211; <a href="https://www.meetup.com/es-ES/WordPress-Sevilla/events/246799483/">Vamos a comer juntos #francachelawpsevilla</a></li>
<li>24/01 &#8211; <strong>Ourense</strong> &#8211; <a href="https://www.meetup.com/es-ES/WordPressOurense/events/246672090/">Modifica y crea temas de WordPress</a></li>
<li>24/01 &#8211; <strong>Cádiz</strong> &#8211; <a href="https://www.meetup.com/es-ES/Cadiz-WordPress-Meetup/events/247049034/">Plugins WordPress Pata NEGRA</a></li>
<li>25/01 &#8211; <strong>Pamplona</strong> &#8211; <a href="https://www.meetup.com/es-ES/WordPress-Pamplona/events/246346181/">Emprendimiento online con WordPress: primeros pasos para crear tu web</a></li>
<li>25/01 &#8211; <strong>Cartagena</strong> &#8211; <a href="https://www.meetup.com/es-ES/WordPress-Cartagena/events/245665314/">WordPress Café</a></li>
<li>25/01 &#8211; <strong>Barcelona</strong> &#8211; <a href="https://www.meetup.com/es-ES/wordpressbcn/events/246710210/">Cómo conseguir un blog de éxito y mantenerlo fácilmente</a></li>
<li>25/01 &#8211; <strong>Cáceres</strong> &#8211; <a href="https://www.meetup.com/es-ES/wpextremadura/events/246611547/">WPO para WordPress</a></li>
<li>25/01 &#8211; <strong>Collado Villalba</strong> &#8211; <a href="https://www.meetup.com/es-ES/WordPress-Collado-Villalba-Meetup/events/246641400/">Una imagen optimizada vale más que 1000 WPO’s</a></li>
<li>25/01 &#8211; <strong>Lleida</strong> &#8211; <a href="https://www.meetup.com/es-ES/WordPress-Lleida/events/246747775/">Primeres passes per començar a vendre amb el teu WordPress</a></li>
<li>25/01 &#8211; <strong>Tarragona</strong> &#8211; <a href="https://www.meetup.com/es-ES/wordpresstarragona/events/246860001/">Introducción a WooCommerce</a></li>
<li>25/01 &#8211; <strong>Málaga</strong> &#8211; <a href="https://www.meetup.com/es-ES/WordPress-Malaga/events/246938562/">Preguntas y Respuestas sobre WordPress</a></li>
<li>26/01 &#8211; <strong>Irún</strong> &#8211; <a href="https://www.meetup.com/es-ES/Irun-WordPress-Meetup/events/246862329/">Sobrevive a la gestión de Proyectos Web</a></li>
<li>26/01 &#8211; <strong>Pontevedra</strong> &#8211; <a href="https://www.meetup.com/es-ES/Pontevedra-WordPress-Meetup/events/246057750/">Monetización de blogs con ingresos pasivos: AdSense, afiliación e infoproductos</a></li>
<li>26/01 &#8211; <strong>Lugo</strong> &#8211; <a href="https://www.meetup.com/es-ES/WordPressLugo/events/246620585/">5ª MeetUp de WordPress Lugo</a></li>
<li>26/01 &#8211; <strong>Badajoz</strong> &#8211; <a href="https://www.meetup.com/es-ES/WordPress-Badajoz/events/246993321/">WordPress práctico : Control de calidad del sitio web</a></li>
<li>28/01 &#8211; <strong>Madrid</strong> &#8211; <a href="https://www.meetup.com/es-ES/WordPress-Madrid/events/246812634/">WordPress Cañas en el Mercado de San Fernando</a></li>
</ul>
<h2>Fotos de las Meetups de la semana anterior</h2>
<a href="https://es.wordpress.org/2018/01/22/noticias-y-eventos-wordpress-para-la-semana-04-18/#gallery-1981-1-slideshow">Haz click para ver el pase de diapositivas.</a>
<p>&nbsp;</p>
<h2>Próximas WordCamps</h2>
<p>Sigue de cerca la organización de los próximos WordCamps que se celebrarán en España durante el 2018.</p>
<p>&#8212;&#8212;&#8212;</p>
<p><img class=" wp-image-1839 alignnone" src="https://es.wordpress.org/files/2017/11/wordcamp-gran-canaria-logo.png" alt="" width="434" height="190" /></p>
<h3>WordCamp Gran Canaria | 23-25 de Febrero 2018</h3>
<p><a href="https://2018.laspalmas.wordcamp.org/" target="_blank" rel="noopener">Web</a> | <a href="https://2018.laspalmas.wordcamp.org/llamada-a-ponentes/">Ponentes</a> | <a href="https://2018.laspalmas.wordcamp.org/llamada-a-voluntarios/">Voluntarios</a> | <a href="https://2018.laspalmas.wordcamp.org/llamada-a-patrocinadores/">Patrocinadores</a> | Programa | <a href="https://2018.laspalmas.wordcamp.org/tickets/">Tickets</a> <img src="https://s.w.org/images/core/emoji/2.3/72x72/1f39f.png" alt="🎟" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>
<hr />
<p><img class="size-full wp-image-1983 alignnone" src="https://es.wordpress.org/files/2018/01/wordcamp-madrid-2018.jpg" alt="wordcamp madrid 2018" width="434" height="190" srcset="https://es.wordpress.org/files/2018/01/wordcamp-madrid-2018.jpg 434w, https://es.wordpress.org/files/2018/01/wordcamp-madrid-2018-300x131.jpg 300w" sizes="(max-width: 434px) 100vw, 434px" /></p>
<h3>WordCamp Madrid | 21-22 de Abril 2018</h3>
<p><a href="https://2018.madrid.wordcamp.org/" target="_blank" rel="noopener">Web</a> | Ponentes | <a href="https://2018.laspalmas.wordcamp.org/llamada-a-voluntarios/">Voluntarios</a> | <a href="https://2018.madrid.wordcamp.org/anuncios/llamada-a-patrocinadores/">Patrocinadores</a> | Programa | Tickets <img src="https://s.w.org/images/core/emoji/2.3/72x72/1f39f.png" alt="🎟" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>
<hr />
<h3>WordCamp Barcelona | 05-06 de Octubre 2018</h3>
<p><a href="https://2018.barcelona.wordcamp.org/" target="_blank" rel="noopener">Web</a> | Ponentes | Voluntarios | Patrocinadores | Programa | Tickets <img src="https://s.w.org/images/core/emoji/2.3/72x72/1f39f.png" alt="🎟" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:91:"https://es.wordpress.org/2018/01/22/noticias-y-eventos-wordpress-para-la-semana-04-18/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:54:"
		
		
		
		
		
				
		
		
		
		

		
		
				
			
		
		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:60:"WordPress 4.9.2, actualización de seguridad y mantenimiento";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:97:"https://es.wordpress.org/2018/01/17/wordpress-4-9-2-actualizacion-de-seguridad-y-mantenimiento-2/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:106:"https://es.wordpress.org/2018/01/17/wordpress-4-9-2-actualizacion-de-seguridad-y-mantenimiento-2/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 17 Jan 2018 07:12:52 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:5:{i:0;a:5:{s:4:"data";s:15:"Actualizaciones";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:13:"Mantenimiento";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:9:"Seguridad";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:3:"4.9";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:4;a:5:{s:4:"data";s:5:"4.9.2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://es.wordpress.org/?p=1977";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:413:"WordPress 4.9.2 está disponible. Esta es una actualización de seguridad y mantenimiento para todas las versiones desde WordPress 3.7. Te recomendamos encarecidamente que actualices inmediatamente tus sitios. Se ha descubierto una vulnerabilidad XSS en los archivos Flash de MediaElement, una biblioteca incluida en WordPress.Como los archivos Flash ya no se necesitan en la mayoría de las ocasiones [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Fernando Tellado";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:4065:"<p>WordPress 4.9.2 está disponible. Esta es una <strong>actualización de seguridad y mantenimiento</strong> para todas las versiones desde WordPress 3.7. Te recomendamos encarecidamente que actualices inmediatamente tus sitios.</p>
<p>Se ha descubierto una vulnerabilidad XSS en los archivos Flash de MediaElement, una biblioteca incluida en WordPress.Como los archivos Flash ya no se necesitan en la mayoría de las ocasiones se han eliminado de WordPress.</p>
<p>MediaElement ha lanzado una nueva versión que contiene una solución para el fallo, y hay un  <a href="https://wordpress.org/plugins/mediaelement-flash-fallbacks/">plugin WordPress que contiene los archivos arreglados</a> disponible en el directorio de plugins.</p>
<p>Gracias a los que han informado de estos problemas por practicar la <a href="https://make.wordpress.org/core/handbook/testing/reporting-security-vulnerabilities/">divulgación responsable:</a> <a href="https://opnsec.com/">Enguerran Gillier</a> y <a href="https://widiz.com/">Widiz</a>.</p>
<p>Se ha solucionado otros 21 fallos en WordPress 4.9.2. Merecen especial atención estos:</p>
<ul>
<li>Se han solucionado errores JavaScript que impedían guardar entradas en Firefox.</li>
<li>Se ha restaurado el anterior comportamiento independiente de la taxonomía de <code>get_category_link()</code> y <code>category_description()</code>.</li>
<li>Al cambiar de temas ahora se tratará de restaurar las asignaciones de widgets previas, incluso aunque no haya barras laterales que coincidan.</li>
</ul>
<p>El Codex tienen <a href="https://codex.wordpress.org/Version_4.9.2">más información de todos los problemas solucionados en la versión 4.9.2</a>, por si quieres aprender más.</p>
<p><a href="https://es.wordpress.org/txt-download/">Descarga WordPress 4.9.2</a> o pásate por tu Escritorio → Actualizaciones y simplemente haz clic en “Actualizar ahora.”Los sitios compatibles con las actualizaciones automáticas en segundo plano ya se están actualizando.</p>
<p>Gracias a todos los que han colaborado con WordPress 4.9.2:</p>
<p><a href="https://profiles.wordpress.org/0x6f0/">0x6f0</a>, <a href="https://profiles.wordpress.org/jorbin/">Aaron Jorbin</a>, <a href="https://profiles.wordpress.org/afercia/">Andrea Fercia</a>, <a href="https://profiles.wordpress.org/aduth/">Andrew Duthie</a>, <a href="https://profiles.wordpress.org/azaozz/">Andrew Ozz</a>, <a href="https://profiles.wordpress.org/blobfolio/">Blobfolio</a>, <a href="https://profiles.wordpress.org/boonebgorges/">Boone Gorges</a>, <a href="https://profiles.wordpress.org/icaleb/">Caleb Burks</a>, <a href="https://profiles.wordpress.org/poena/">Carolina Nymark</a>, <a href="https://profiles.wordpress.org/chasewg/">chasewg</a>, <a href="https://profiles.wordpress.org/chetan200891/">Chetan Prajapati</a>, <a href="https://profiles.wordpress.org/dd32/">Dion Hulse</a>, <a href="https://profiles.wordpress.org/hardik-amipara/">Hardik Amipara</a>, <a href="https://profiles.wordpress.org/ionvv/">ionvv</a>, <a href="https://profiles.wordpress.org/jaswrks/">Jason Caldwell</a>, <a href="https://profiles.wordpress.org/jbpaul17/">Jeffrey Paul</a>, <a href="https://profiles.wordpress.org/jeremyfelt/">Jeremy Felt</a>, <a href="https://profiles.wordpress.org/joemcgill/">Joe McGill</a>, <a href="https://profiles.wordpress.org/johnschulz/">johnschulz</a>, <a href="https://profiles.wordpress.org/juiiee8487/">Juhi Patel</a>, <a href="https://profiles.wordpress.org/obenland/">Konstantin Obenland</a>, <a href="https://profiles.wordpress.org/markjaquith/">Mark Jaquith</a>, <a href="https://profiles.wordpress.org/rabmalin/">Nilambar Sharma</a>, <a href="https://profiles.wordpress.org/peterwilsoncc/">Peter Wilson</a>, <a href="https://profiles.wordpress.org/rachelbaker/">Rachel Baker</a>, <a href="https://profiles.wordpress.org/rinkuyadav999/">Rinku Y</a>, <a href="https://profiles.wordpress.org/sergeybiryukov/">Sergey Biryukov</a>, and <a href="https://profiles.wordpress.org/westonruter/">Weston Ruter</a>.</p>
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:102:"https://es.wordpress.org/2018/01/17/wordpress-4-9-2-actualizacion-de-seguridad-y-mantenimiento-2/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:42:"
		
		
		
		
		
				

		
		
				
			
		
		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Noticias y eventos de la semana";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:86:"https://es.wordpress.org/2018/01/15/noticias-y-eventos-wordpress-para-la-semana-03-18/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:94:"https://es.wordpress.org/2018/01/15/noticias-y-eventos-wordpress-para-la-semana-03-18/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 15 Jan 2018 06:30:14 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"General";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://es.wordpress.org/?p=1969";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:379:"¡Hola a todos! Os dejamos como todas las semanas el listado con los próximos Meetups de WordPress alrededor de España y el avance de las distintas WordCamps. Meetups de esta semana 16/01 &#8211; Granollers &#8211; Plugins o Cómo Añadir Funcionalidad a tu WordPress 17/01 &#8211; Valencia &#8211; WordCamps! 17/01 &#8211; Granada &#8211; Obligaciones Legales en un [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Mauricio Gelves";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:3068:"<p><img class="aligncenter size-full wp-image-1150" src="https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana.png" alt="Eventos WordPress para esta semana en españa" width="1280" height="476" srcset="https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana.png 1280w, https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana-300x112.png 300w, https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana-768x286.png 768w, https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana-1024x381.png 1024w" sizes="(max-width: 1280px) 100vw, 1280px" /></p>
<p><strong>¡Hola a todos! </strong>Os dejamos como todas las semanas el listado con los próximos Meetups de <strong>WordPress</strong> alrededor de España y el avance de las distintas WordCamps.</p>
<h2>Meetups de esta semana</h2>
<ul>
<li>16/01 &#8211; <strong>Granollers</strong> &#8211; <a href="https://www.meetup.com/es-ES/WordPressGranollers/events/246640389/">Plugins o Cómo Añadir Funcionalidad a tu WordPress</a></li>
<li>17/01 &#8211; <strong>Valencia</strong> &#8211; <a href="https://www.meetup.com/es-ES/wordpress-valencia-meetup/events/246443588/">WordCamps!</a></li>
<li>17/01 &#8211; <strong>Granada</strong> &#8211; <a href="https://www.meetup.com/es-ES/Granada-WordPress-Meetup/events/246087248/">Obligaciones Legales en un sitio Web</a></li>
<li>18/01 &#8211; <strong>Madrid</strong> &#8211; <a href="https://www.meetup.com/es-ES/WordPress-Madrid/events/245892634/">Desarrollando un Tema con Genesis</a></li>
<li>18/01 &#8211; <strong>Murcia</strong> &#8211; <a href="https://www.meetup.com/es-ES/WordPress-Murcia/events/243647813/">Quedada de organización</a></li>
<li>18/01 &#8211; <strong>Alcalá de Henares</strong> &#8211; <a href="https://www.meetup.com/es-ES/Alcala-de-Henares-WordPress-Meetup/events/246707551/">Cómo elegir la plantilla perfecta</a></li>
<li>20/01 &#8211; <strong>Cantabria</strong> &#8211; <a href="https://www.meetup.com/es-ES/WP-Cantabria/events/245616532/">Desarrollo WordPress en local con &#8220;Local by Flywheel&#8221;</a></li>
</ul>
<h2>Próximas WordCamps</h2>
<p>Sigue de cerca la organización de los próximos WordCamps que se celebrarán en España durante el 2018.</p>
<p>&#8212;&#8212;&#8212;</p>
<p><img class=" wp-image-1839 alignnone" src="https://es.wordpress.org/files/2017/11/wordcamp-gran-canaria-logo.png" alt="" width="434" height="190" /></p>
<h3>WordCamp Gran Canaria | 23-25 de Febrero 2018</h3>
<p><a href="https://2018.laspalmas.wordcamp.org/" target="_blank" rel="noopener">Web</a> | <a href="https://2018.laspalmas.wordcamp.org/llamada-a-ponentes/">Ponentes</a> | <a href="https://2018.laspalmas.wordcamp.org/llamada-a-voluntarios/">Voluntarios</a> | <a href="https://2018.laspalmas.wordcamp.org/llamada-a-patrocinadores/">Patrocinadores</a> | Programa | <a href="https://2018.laspalmas.wordcamp.org/tickets/">Tickets</a> <img src="https://s.w.org/images/core/emoji/2.3/72x72/1f39f.png" alt="🎟" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:91:"https://es.wordpress.org/2018/01/15/noticias-y-eventos-wordpress-para-la-semana-03-18/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:42:"
		
		
		
		
		
				

		
		
				
			
		
		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Noticias y eventos de la semana";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:86:"https://es.wordpress.org/2018/01/08/noticias-y-eventos-wordpress-para-la-semana-02-18/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:94:"https://es.wordpress.org/2018/01/08/noticias-y-eventos-wordpress-para-la-semana-02-18/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 08 Jan 2018 09:00:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"General";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://es.wordpress.org/?p=1966";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:358:"¡Hola a todos! Os dejamos como todas las semanas el listado con los próximos Meetups de WordPress alrededor de España y el avance de las distintas WordCamps. Meetups de esta semana 11/01 &#8211; Almería &#8211; El sitio más rápido de Tabernas&#8230; WPO fácil para tu WordPress 12/01 &#8211; Girona &#8211; Com escollir quin plugin utilitzar [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Mauricio Gelves";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:3407:"<p><img class="aligncenter size-full wp-image-1150" src="https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana.png" alt="Eventos WordPress para esta semana en españa" width="1280" height="476" srcset="https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana.png 1280w, https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana-300x112.png 300w, https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana-768x286.png 768w, https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana-1024x381.png 1024w" sizes="(max-width: 1280px) 100vw, 1280px" /></p>
<p><strong>¡Hola a todos! </strong>Os dejamos como todas las semanas el listado con los próximos Meetups de <strong>WordPress</strong> alrededor de España y el avance de las distintas WordCamps.</p>
<h2>Meetups de esta semana</h2>
<ul>
<li>11/01 &#8211; <strong>Almería</strong> &#8211; <a href="https://www.meetup.com/es-ES/WPAlmeria/events/246261735/">El sitio más rápido de Tabernas&#8230; WPO fácil para tu WordPress</a></li>
<li>12/01 &#8211; <strong>Girona</strong> &#8211; <a href="https://www.meetup.com/es-ES/Girona-WordPress-Meetup/events/246117250/">Com escollir quin plugin utilitzar segons les teves necessitats</a></li>
</ul>
<h2>Próximas WordCamps</h2>
<p>Sigue de cerca la organización de los próximos WordCamps que se celebrarán en España durante el 2018.</p>
<p>&#8212;&#8212;&#8212;</p>
<p><img class="size-full wp-image-1860 alignnone" src="https://es.wordpress.org/files/2017/11/wordcamp-zaragoza-logo.png" alt="wordcamp zaragoza logo" width="434" height="190" srcset="https://es.wordpress.org/files/2017/11/wordcamp-zaragoza-logo.png 434w, https://es.wordpress.org/files/2017/11/wordcamp-zaragoza-logo-300x131.png 300w" sizes="(max-width: 434px) 100vw, 434px" /></p>
<h3>WordCamp Zaragoza | 13-14 de Enero 2018</h3>
<p><a href="https://2018.zaragoza.wordcamp.org/" target="_blank" rel="noopener">Web</a> | <a href="https://2018.zaragoza.wordcamp.org/llamada-a-ponentes/" target="_blank" rel="noopener">Ponentes</a> | <a href="https://2018.zaragoza.wordcamp.org/llamada-a-voluntarios/" target="_blank" rel="noopener">Voluntarios</a> | <a href="https://2018.zaragoza.wordcamp.org/llamada-a-patrocinadores/" target="_blank" rel="noopener">Patrocinadores</a> | <a href="https://2018.zaragoza.wordcamp.org/programa/" target="_blank" rel="noopener">Programa</a> | <a href="https://2018.zaragoza.wordcamp.org/compra-tu-entrada/" target="_blank" rel="noopener">Tickets</a> <img src="https://s.w.org/images/core/emoji/2.3/72x72/1f39f.png" alt="🎟" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>
<p>&#8212;&#8212;&#8212;</p>
<p><img class=" wp-image-1839 alignnone" src="https://es.wordpress.org/files/2017/11/wordcamp-gran-canaria-logo.png" alt="" width="434" height="190" /></p>
<h3>WordCamp Gran Canaria | 23-25 de Febrero 2018</h3>
<p><a href="https://2018.laspalmas.wordcamp.org/" target="_blank" rel="noopener">Web</a> | <a href="https://2018.laspalmas.wordcamp.org/llamada-a-ponentes/">Ponentes</a> | <a href="https://2018.laspalmas.wordcamp.org/llamada-a-voluntarios/">Voluntarios</a> | <a href="https://2018.laspalmas.wordcamp.org/llamada-a-patrocinadores/">Patrocinadores</a> | Programa | Tickets <img src="https://s.w.org/images/core/emoji/2.3/72x72/1f39f.png" alt="🎟" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:91:"https://es.wordpress.org/2018/01/08/noticias-y-eventos-wordpress-para-la-semana-02-18/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:42:"
		
		
		
		
		
				

		
		
				
			
		
		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Noticias y eventos de la semana";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:86:"https://es.wordpress.org/2018/01/01/noticias-y-eventos-wordpress-para-la-semana-01-18/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:94:"https://es.wordpress.org/2018/01/01/noticias-y-eventos-wordpress-para-la-semana-01-18/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 01 Jan 2018 12:44:13 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"General";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://es.wordpress.org/?p=1959";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:344:"¡Hola a todos y feliz año nuevo! Esta semana no habrá eventos de WordPress en España pero queríamos aprovechar la ocasión para desear a todos un excelente comienzo de año 🥂🎉. Para este 2018 tendremos muchas y algunas nuevas WordCamps alrededor del país, como es el caso de las próximas WordCamp Zaragoza y Gran Canaria. [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Mauricio Gelves";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:3573:"<p><img class="aligncenter size-full wp-image-1150" src="https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana.png" alt="Eventos WordPress para esta semana en españa" width="1280" height="476" srcset="https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana.png 1280w, https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana-300x112.png 300w, https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana-768x286.png 768w, https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana-1024x381.png 1024w" sizes="(max-width: 1280px) 100vw, 1280px" /></p>
<p><strong>¡Hola a todos y feliz año nuevo!</strong> Esta semana no habrá eventos de WordPress en España pero queríamos aprovechar la ocasión para desear a todos un excelente comienzo de año <img src="https://s.w.org/images/core/emoji/2.3/72x72/1f942.png" alt="🥂" class="wp-smiley" style="height: 1em; max-height: 1em;" /><img src="https://s.w.org/images/core/emoji/2.3/72x72/1f389.png" alt="🎉" class="wp-smiley" style="height: 1em; max-height: 1em;" />.</p>
<p>Para este 2018 tendremos muchas y algunas nuevas WordCamps alrededor del país, como es el caso de las próximas WordCamp Zaragoza y Gran Canaria.</p>
<p>Y como siempre, cada lunes seguiremos escribiendo estos artículos para mantenerte informado de todos los eventos Meetups y WordCamps que se realizan a lo largo y ancho del país.</p>
<h2>Próximas WordCamps</h2>
<p>Sigue de cerca la organización de los próximos WordCamps que se celebrarán en España durante el 2018.</p>
<p>&#8212;&#8212;&#8212;</p>
<p><img class="size-full wp-image-1860 alignnone" src="https://es.wordpress.org/files/2017/11/wordcamp-zaragoza-logo.png" alt="wordcamp zaragoza logo" width="434" height="190" srcset="https://es.wordpress.org/files/2017/11/wordcamp-zaragoza-logo.png 434w, https://es.wordpress.org/files/2017/11/wordcamp-zaragoza-logo-300x131.png 300w" sizes="(max-width: 434px) 100vw, 434px" /></p>
<h3>WordCamp Zaragoza | 13-14 de Enero 2018</h3>
<p><a href="https://2018.zaragoza.wordcamp.org/" target="_blank" rel="noopener">Web</a> | <a href="https://2018.zaragoza.wordcamp.org/llamada-a-ponentes/" target="_blank" rel="noopener">Ponentes</a> | <a href="https://2018.zaragoza.wordcamp.org/llamada-a-voluntarios/" target="_blank" rel="noopener">Voluntarios</a> | <a href="https://2018.zaragoza.wordcamp.org/llamada-a-patrocinadores/" target="_blank" rel="noopener">Patrocinadores</a> | <a href="https://2018.zaragoza.wordcamp.org/programa/" target="_blank" rel="noopener">Programa</a> | <a href="https://2018.zaragoza.wordcamp.org/compra-tu-entrada/" target="_blank" rel="noopener">Tickets</a> <img src="https://s.w.org/images/core/emoji/2.3/72x72/1f39f.png" alt="🎟" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>
<p>&#8212;&#8212;&#8212;</p>
<p><img class=" wp-image-1839 alignnone" src="https://es.wordpress.org/files/2017/11/wordcamp-gran-canaria-logo.png" alt="" width="434" height="190" /></p>
<h3>WordCamp Gran Canaria | 23-25 de Febrero 2018</h3>
<p><a href="https://2018.laspalmas.wordcamp.org/" target="_blank" rel="noopener">Web</a> | <a href="https://2018.laspalmas.wordcamp.org/llamada-a-ponentes/">Ponentes</a> | <a href="https://2018.laspalmas.wordcamp.org/llamada-a-voluntarios/">Voluntarios</a> | <a href="https://2018.laspalmas.wordcamp.org/llamada-a-patrocinadores/">Patrocinadores</a> | Programa | Tickets <img src="https://s.w.org/images/core/emoji/2.3/72x72/1f39f.png" alt="🎟" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:91:"https://es.wordpress.org/2018/01/01/noticias-y-eventos-wordpress-para-la-semana-01-18/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:42:"
		
		
		
		
		
				

		
		
				
			
		
		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Noticias y eventos de la semana";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:86:"https://es.wordpress.org/2017/12/26/noticias-y-eventos-wordpress-para-la-semana-52-17/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:94:"https://es.wordpress.org/2017/12/26/noticias-y-eventos-wordpress-para-la-semana-52-17/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 26 Dec 2017 07:48:59 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"General";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://es.wordpress.org/?p=1949";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:357:"¡Hola a todos! Esperamos que hayáis pasado unas excelentes fiestas rodeados de familiares y amigos 🎄❄. Os dejamos como todas las semanas el listado con los próximos Meetups de WordPress alrededor de España y el avance de las distintas WordCamps. Meetups de esta semana 27/12 &#8211; Ourense &#8211; Hablemos claro de Hosting y cómo puede [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Mauricio Gelves";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:4380:"<p><img class="aligncenter size-full wp-image-1150" src="https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana.png" alt="Eventos WordPress para esta semana en españa" width="1280" height="476" srcset="https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana.png 1280w, https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana-300x112.png 300w, https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana-768x286.png 768w, https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana-1024x381.png 1024w" sizes="(max-width: 1280px) 100vw, 1280px" /></p>
<p><strong>¡Hola a todos! </strong>Esperamos que hayáis pasado unas excelentes fiestas rodeados de familiares y amigos <img src="https://s.w.org/images/core/emoji/2.3/72x72/1f384.png" alt="🎄" class="wp-smiley" style="height: 1em; max-height: 1em;" /><img src="https://s.w.org/images/core/emoji/2.3/72x72/2744.png" alt="❄" class="wp-smiley" style="height: 1em; max-height: 1em;" />.<br />
Os dejamos como todas las semanas el listado con los próximos Meetups de <strong>WordPress</strong> alrededor de España y el avance de las distintas WordCamps.</p>
<h2>Meetups de esta semana</h2>
<ul>
<li>27/12 &#8211; <strong>Ourense</strong> &#8211; <a href="https://www.meetup.com/es-ES/WordPressOurense/events/245256225/">Hablemos claro de Hosting y cómo puede potenciar tu negocio</a></li>
<li>28/12 &#8211; <strong>Cartagena</strong> &#8211; <a href="https://www.meetup.com/es-ES/WordPress-Cartagena/events/245665847/">Instalar una versión básica de bbPress en nuestro hosting</a></li>
<li>28/12 &#8211; <strong>Cartagena</strong> &#8211; <a href="https://www.meetup.com/es-ES/WordPress-Cartagena/events/245755629/">Taller: Aprende a crear tu propio Child Theme (2ª parte)</a></li>
<li>28/12 &#8211; <strong>Sevilla</strong> &#8211; <a href="https://www.meetup.com/es-ES/WordPress-Sevilla/events/246020800/">De localhost a tudominio.com. IP, DNS, URL sin volverte loco</a></li>
</ul>
<h2>Fotos de las Meetups de la semana anterior</h2>
<a href="https://es.wordpress.org/2017/12/26/noticias-y-eventos-wordpress-para-la-semana-52-17/#gallery-1949-2-slideshow">Haz click para ver el pase de diapositivas.</a>
<h2>Próximas WordCamps</h2>
<p>Sigue de cerca la organización de los próximos WordCamps que se celebrarán en España durante el 2017 y 2018.</p>
<p>&#8212;&#8212;&#8212;</p>
<p><img class="size-full wp-image-1860 alignnone" src="https://es.wordpress.org/files/2017/11/wordcamp-zaragoza-logo.png" alt="wordcamp zaragoza logo" width="434" height="190" srcset="https://es.wordpress.org/files/2017/11/wordcamp-zaragoza-logo.png 434w, https://es.wordpress.org/files/2017/11/wordcamp-zaragoza-logo-300x131.png 300w" sizes="(max-width: 434px) 100vw, 434px" /></p>
<h3>WordCamp Zaragoza | 13-14 de Enero 2018</h3>
<p><a href="https://2018.zaragoza.wordcamp.org/" target="_blank" rel="noopener">Web</a> | <a href="https://2018.zaragoza.wordcamp.org/llamada-a-ponentes/" target="_blank" rel="noopener">Ponentes</a> | <a href="https://2018.zaragoza.wordcamp.org/llamada-a-voluntarios/" target="_blank" rel="noopener">Voluntarios</a> | <a href="https://2018.zaragoza.wordcamp.org/llamada-a-patrocinadores/" target="_blank" rel="noopener">Patrocinadores</a> | <a href="https://2018.zaragoza.wordcamp.org/programa/" target="_blank" rel="noopener">Programa</a> | <a href="https://2018.zaragoza.wordcamp.org/compra-tu-entrada/" target="_blank" rel="noopener">Tickets</a> <img src="https://s.w.org/images/core/emoji/2.3/72x72/1f39f.png" alt="🎟" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>
<p>&#8212;&#8212;&#8212;</p>
<p><img class=" wp-image-1839 alignnone" src="https://es.wordpress.org/files/2017/11/wordcamp-gran-canaria-logo.png" alt="" width="434" height="190" /></p>
<h3>WordCamp Gran Canaria | 23-25 de Febrero 2018</h3>
<p><a href="https://2018.laspalmas.wordcamp.org/" target="_blank" rel="noopener">Web</a> | <a href="https://2018.laspalmas.wordcamp.org/llamada-a-ponentes/">Ponentes</a> | <a href="https://2018.laspalmas.wordcamp.org/llamada-a-voluntarios/">Voluntarios</a> | <a href="https://2018.laspalmas.wordcamp.org/llamada-a-patrocinadores/">Patrocinadores</a> | Programa | Tickets <img src="https://s.w.org/images/core/emoji/2.3/72x72/1f39f.png" alt="🎟" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:91:"https://es.wordpress.org/2017/12/26/noticias-y-eventos-wordpress-para-la-semana-52-17/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:42:"
		
		
		
		
		
				

		
		
				
			
		
		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Noticias y eventos de la semana";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:86:"https://es.wordpress.org/2017/12/18/noticias-y-eventos-wordpress-para-la-semana-51-17/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:94:"https://es.wordpress.org/2017/12/18/noticias-y-eventos-wordpress-para-la-semana-51-17/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 18 Dec 2017 08:52:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"General";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://es.wordpress.org/?p=1938";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:337:"¡Hola a todos! Os dejamos como todas las semanas el listado con los próximos Meetups de WordPress alrededor de España y el avance de las distintas WordCamps. Meetups de esta semana 18/12 &#8211; Alicante &#8211; Aprende a hacer tu web: Temas de WordPress 18/12 &#8211; Las Palmas de Gran Canaria &#8211; Taller: Crea una web [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Mauricio Gelves";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:4560:"<p><img class="aligncenter size-full wp-image-1150" src="https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana.png" alt="Eventos WordPress para esta semana en españa" width="1280" height="476" srcset="https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana.png 1280w, https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana-300x112.png 300w, https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana-768x286.png 768w, https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana-1024x381.png 1024w" sizes="(max-width: 1280px) 100vw, 1280px" /></p>
<p><strong>¡Hola a todos! </strong>Os dejamos como todas las semanas el listado con los próximos Meetups de <strong>WordPress</strong> alrededor de España y el avance de las distintas WordCamps.</p>
<h2>Meetups de esta semana</h2>
<ul>
<li>18/12 &#8211; <strong>Alicante</strong> &#8211; <a href="https://www.meetup.com/es-ES/WordPress-Alicante/events/245491518/">Aprende a hacer tu web: Temas de WordPress</a></li>
<li>18/12 &#8211; <strong>Las Palmas de Gran Canaria</strong> &#8211; <a href="https://www.meetup.com/es-ES/Las-Palmas-de-Gran-Canaria-WordPress-Meetup/events/245358416/">Taller: Crea una web con WordPress para felicitar la Navidad</a></li>
<li>20/12 &#8211; <strong>Irún</strong> &#8211; <a href="https://www.meetup.com/es-ES/Irun-WordPress-Meetup/events/245848252/">Planifica 2018 con WordPress&amp;Beers</a></li>
<li>20/12 &#8211; <strong>Zaragoza</strong> &#8211; <a href="https://www.meetup.com/es-ES/WordPress-Zaragoza/events/245831836/">Si dominas WordPress, ahora sabes crear Apps</a></li>
<li>21/12 &#8211; <strong>Cádiz</strong> &#8211; <a href="https://www.meetup.com/es-ES/Cadiz-WordPress-Meetup/events/245882154/">WordPress &amp; Turrón</a></li>
<li>21/12 &#8211; <strong>Barcelona</strong> &#8211; <a href="https://www.meetup.com/es-ES/wordpressbcn/events/245555577/">Seguridad WordPress: Prevenir antes que limpiar un hackeo</a></li>
<li>21/12 &#8211; <strong>Alcázar de San Juan</strong> &#8211; <a href="https://www.meetup.com/es-ES/Alcazar-de-San-Juan-WordPress-Meetup/events/245801880/">Vender para informátic@s!</a></li>
</ul>
<h2>Fotos de las Meetups de la semana anterior</h2>
<a href="https://es.wordpress.org/2017/12/18/noticias-y-eventos-wordpress-para-la-semana-51-17/#gallery-1938-3-slideshow">Haz click para ver el pase de diapositivas.</a>
<h2>Próximas WordCamps</h2>
<p>Sigue de cerca la organización de los próximos WordCamps que se celebrarán en España durante el 2017 y 2018.</p>
<p>&#8212;&#8212;&#8212;</p>
<p><img class="size-full wp-image-1860 alignnone" src="https://es.wordpress.org/files/2017/11/wordcamp-zaragoza-logo.png" alt="wordcamp zaragoza logo" width="434" height="190" srcset="https://es.wordpress.org/files/2017/11/wordcamp-zaragoza-logo.png 434w, https://es.wordpress.org/files/2017/11/wordcamp-zaragoza-logo-300x131.png 300w" sizes="(max-width: 434px) 100vw, 434px" /></p>
<h3>WordCamp Zaragoza | 13-14 de Enero 2018</h3>
<p><a href="https://2018.zaragoza.wordcamp.org/" target="_blank" rel="noopener">Web</a> | <a href="https://2018.zaragoza.wordcamp.org/llamada-a-ponentes/" target="_blank" rel="noopener">Ponentes</a> | <a href="https://2018.zaragoza.wordcamp.org/llamada-a-voluntarios/" target="_blank" rel="noopener">Voluntarios</a> | <a href="https://2018.zaragoza.wordcamp.org/llamada-a-patrocinadores/" target="_blank" rel="noopener">Patrocinadores</a> | <a href="https://2018.zaragoza.wordcamp.org/programa/" target="_blank" rel="noopener">Programa</a> | <a href="https://2018.zaragoza.wordcamp.org/compra-tu-entrada/" target="_blank" rel="noopener">Tickets</a> <img src="https://s.w.org/images/core/emoji/2.3/72x72/1f39f.png" alt="🎟" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>
<p>&#8212;&#8212;&#8212;</p>
<p><img class=" wp-image-1839 alignnone" src="https://es.wordpress.org/files/2017/11/wordcamp-gran-canaria-logo.png" alt="" width="434" height="190" /></p>
<h3>WordCamp Gran Canaria | 23-25 de Febrero 2018</h3>
<p><a href="https://2018.laspalmas.wordcamp.org/" target="_blank" rel="noopener">Web</a> | <a href="https://2018.laspalmas.wordcamp.org/llamada-a-ponentes/">Ponentes</a> | <a href="https://2018.laspalmas.wordcamp.org/llamada-a-voluntarios/">Voluntarios</a> | <a href="https://2018.laspalmas.wordcamp.org/llamada-a-patrocinadores/">Patrocinadores</a> | Programa | Tickets <img src="https://s.w.org/images/core/emoji/2.3/72x72/1f39f.png" alt="🎟" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:91:"https://es.wordpress.org/2017/12/18/noticias-y-eventos-wordpress-para-la-semana-51-17/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:42:"
		
		
		
		
		
				

		
		
				
			
		
		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Noticias y eventos de la semana";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:86:"https://es.wordpress.org/2017/12/11/noticias-y-eventos-wordpress-para-la-semana-50-17/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:94:"https://es.wordpress.org/2017/12/11/noticias-y-eventos-wordpress-para-la-semana-50-17/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 11 Dec 2017 06:32:22 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"General";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://es.wordpress.org/?p=1929";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:357:"¡Hola a todos! Os dejamos como todas las semanas el listado con los próximos Meetups de WordPress alrededor de España y el avance de las distintas WordCamps. Meetups de esta semana 12/12 &#8211; Madrid &#8211; Actions &#38; Filters 4 dummies 12/12 &#8211; Granollers &#8211; Sesión Práctica: Personaliza tu Theme sin morir en el intento 12/12 [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Mauricio Gelves";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:5182:"<p><img class="aligncenter size-full wp-image-1150" src="https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana.png" alt="Eventos WordPress para esta semana en españa" width="1280" height="476" srcset="https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana.png 1280w, https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana-300x112.png 300w, https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana-768x286.png 768w, https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana-1024x381.png 1024w" sizes="(max-width: 1280px) 100vw, 1280px" /></p>
<p><strong>¡Hola a todos! </strong>Os dejamos como todas las semanas el listado con los próximos Meetups de <strong>WordPress</strong> alrededor de España y el avance de las distintas WordCamps.</p>
<h2>Meetups de esta semana</h2>
<ul>
<li>12/12 &#8211; <strong>Madrid</strong> &#8211; <a href="https://www.meetup.com/es-ES/WordPress-Madrid/events/245533390/">Actions &amp; Filters 4 dummies</a></li>
<li>12/12 &#8211; <strong>Granollers</strong> &#8211; <a href="https://www.meetup.com/es-ES/WordPressGranollers/events/243621114/">Sesión Práctica: Personaliza tu Theme sin morir en el intento</a></li>
<li>12/12 &#8211; <strong>Collado Villalba</strong> &#8211; <a href="https://www.meetup.com/es-ES/WordPress-Collado-Villalba-Meetup/events/245561397/">Comunidad &amp; Beers</a></li>
<li>13/12 &#8211; <strong>Valencia</strong> &#8211; <a href="https://www.meetup.com/es-ES/wordpress-valencia-meetup/events/243737175/">Snippets (recetas) para WordPress</a></li>
<li>13/12 &#8211; <strong>Granada</strong> &#8211; <a href="https://www.meetup.com/es-ES/Granada-WordPress-Meetup/events/245021181/">Terapia de grupo: Tarifas y otras pesadillas</a></li>
<li>14/12 &#8211; <strong>Girona</strong> &#8211; <a href="https://www.meetup.com/es-ES/Girona-WordPress-Meetup/events/245139030/">Com escollir una plantilla adequada pel teu projecte web?</a></li>
<li>14/12 &#8211; <strong>Cáceres</strong> &#8211; <a href="https://www.meetup.com/es-ES/wpextremadura/events/245380933/">Como crear tus propios campos en WordPress con ACF Advanced Custom Fields</a></li>
<li>14/12 &#8211; <strong>Tarragona</strong> &#8211; <a href="https://www.meetup.com/es-ES/wordpresstarragona/events/245757600/">WordPress&amp;Beers­ – Meetup Navideña!</a></li>
<li>14/12 &#8211; <strong>Almería</strong> &#8211; <a href="https://www.meetup.com/es-ES/WPAlmeria/events/245632480/">Crea un sitio DIVIno</a></li>
<li>15/12 &#8211; <strong>Pontevedra</strong> &#8211; <a href="https://www.meetup.com/es-ES/Pontevedra-WordPress-Meetup/events/245555935/">Pesadilla en WordPress street MMXVII: una historia de terror</a></li>
<li>15/12 &#8211; <strong>Bilbao</strong> &#8211; <a href="https://www.meetup.com/es-ES/WordPress-Bilbao/events/244967754/">¿Cuáles son los mejores plugins WordPress?</a></li>
</ul>
<h2>Fotos de las Meetups de la semana anterior</h2>
<a href="https://es.wordpress.org/2017/12/11/noticias-y-eventos-wordpress-para-la-semana-50-17/#gallery-1929-4-slideshow">Haz click para ver el pase de diapositivas.</a>
<h2>Próximas WordCamps</h2>
<p>Sigue de cerca la organización de los próximos WordCamps que se celebrarán en España durante el 2017 y 2018.</p>
<p>&#8212;&#8212;&#8212;</p>
<p><img class="size-full wp-image-1860 alignnone" src="https://es.wordpress.org/files/2017/11/wordcamp-zaragoza-logo.png" alt="wordcamp zaragoza logo" width="434" height="190" srcset="https://es.wordpress.org/files/2017/11/wordcamp-zaragoza-logo.png 434w, https://es.wordpress.org/files/2017/11/wordcamp-zaragoza-logo-300x131.png 300w" sizes="(max-width: 434px) 100vw, 434px" /></p>
<h3>WordCamp Zaragoza | 13-14 de Enero 2018</h3>
<p><a href="https://2018.zaragoza.wordcamp.org/" target="_blank" rel="noopener">Web</a> | <a href="https://2018.zaragoza.wordcamp.org/llamada-a-ponentes/" target="_blank" rel="noopener">Ponentes</a> | <a href="https://2018.zaragoza.wordcamp.org/llamada-a-voluntarios/" target="_blank" rel="noopener">Voluntarios</a> | <a href="https://2018.zaragoza.wordcamp.org/llamada-a-patrocinadores/" target="_blank" rel="noopener">Patrocinadores</a> | Programa | <a href="https://2018.zaragoza.wordcamp.org/compra-tu-entrada/" target="_blank" rel="noopener">Tickets</a> <img src="https://s.w.org/images/core/emoji/2.3/72x72/1f39f.png" alt="🎟" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>
<p>&#8212;&#8212;&#8212;</p>
<p><img class=" wp-image-1839 alignnone" src="https://es.wordpress.org/files/2017/11/wordcamp-gran-canaria-logo.png" alt="" width="434" height="190" /></p>
<h3>WordCamp Gran Canaria | 23-25 de Febrero 2018</h3>
<p><a href="https://2018.laspalmas.wordcamp.org/" target="_blank" rel="noopener">Web</a> | <a href="https://2018.laspalmas.wordcamp.org/llamada-a-ponentes/">Ponentes</a> | <a href="https://2018.laspalmas.wordcamp.org/llamada-a-voluntarios/">Voluntarios</a> | <a href="https://2018.laspalmas.wordcamp.org/llamada-a-patrocinadores/">Patrocinadores</a> | Programa | Tickets <img src="https://s.w.org/images/core/emoji/2.3/72x72/1f39f.png" alt="🎟" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:91:"https://es.wordpress.org/2017/12/11/noticias-y-eventos-wordpress-para-la-semana-50-17/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:42:"
		
		
		
		
		
				

		
		
				
			
		
		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"Noticias y eventos de la semana";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:86:"https://es.wordpress.org/2017/12/04/noticias-y-eventos-wordpress-para-la-semana-49-17/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:94:"https://es.wordpress.org/2017/12/04/noticias-y-eventos-wordpress-para-la-semana-49-17/#respond";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 04 Dec 2017 08:46:24 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:7:"General";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://es.wordpress.org/?p=1922";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:346:"¡Hola a todos! Os dejamos como todas las semanas el listado con los próximos Meetups de WordPress alrededor de España y el avance de las distintas WordCamps. Meetups de esta semana 05/12 &#8211; Chiclana &#8211; Tips de seguridad para tu WordPress 09/12 &#8211; Pamplona &#8211; Help Desk: trae tus problemas de WordPress a la Meetup [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Mauricio Gelves";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:3547:"<p><img class="aligncenter size-full wp-image-1150" src="https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana.png" alt="Eventos WordPress para esta semana en españa" width="1280" height="476" srcset="https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana.png 1280w, https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana-300x112.png 300w, https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana-768x286.png 768w, https://es.wordpress.org/files/2017/02/eventos-wordpress-semana-espana-1024x381.png 1024w" sizes="(max-width: 1280px) 100vw, 1280px" /></p>
<p><strong>¡Hola a todos! </strong>Os dejamos como todas las semanas el listado con los próximos Meetups de <strong>WordPress</strong> alrededor de España y el avance de las distintas WordCamps.</p>
<h2>Meetups de esta semana</h2>
<ul>
<li>05/12 &#8211; <strong>Chiclana</strong> &#8211; <a href="https://www.meetup.com/es-ES/WordPress-Meetup-Chiclana/events/245503204/" target="_blank" rel="noopener">Tips de seguridad para tu WordPress</a></li>
<li>09/12 &#8211; <strong>Pamplona</strong> &#8211; <a href="https://www.meetup.com/es-ES/WordPress-Pamplona/events/245583898/">Help Desk: trae tus problemas de WordPress a la Meetup</a></li>
</ul>
<h2>Fotos de las Meetups de la semana anterior</h2>
<a href="https://es.wordpress.org/2017/12/04/noticias-y-eventos-wordpress-para-la-semana-49-17/#gallery-1922-5-slideshow">Haz click para ver el pase de diapositivas.</a>
<h2>Próximas WordCamps</h2>
<p>Sigue de cerca la organización de los próximos WordCamps que se celebrarán en España durante el 2017 y 2018.</p>
<p>&#8212;&#8212;&#8212;</p>
<p><img class="size-full wp-image-1860 alignnone" src="https://es.wordpress.org/files/2017/11/wordcamp-zaragoza-logo.png" alt="wordcamp zaragoza logo" width="434" height="190" srcset="https://es.wordpress.org/files/2017/11/wordcamp-zaragoza-logo.png 434w, https://es.wordpress.org/files/2017/11/wordcamp-zaragoza-logo-300x131.png 300w" sizes="(max-width: 434px) 100vw, 434px" /></p>
<h3>WordCamp Zaragoza | 13-14 de Enero 2018</h3>
<p><a href="https://2018.zaragoza.wordcamp.org/" target="_blank" rel="noopener">Web</a> | <a href="https://2018.zaragoza.wordcamp.org/llamada-a-ponentes/" target="_blank" rel="noopener">Ponentes</a> | <a href="https://2018.zaragoza.wordcamp.org/llamada-a-voluntarios/" target="_blank" rel="noopener">Voluntarios</a> | <a href="https://2018.zaragoza.wordcamp.org/llamada-a-patrocinadores/" target="_blank" rel="noopener">Patrocinadores</a> | Programa | <a href="https://2018.zaragoza.wordcamp.org/compra-tu-entrada/" target="_blank" rel="noopener">Tickets</a> <img src="https://s.w.org/images/core/emoji/2.3/72x72/1f39f.png" alt="🎟" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>
<p>&#8212;&#8212;&#8212;</p>
<p><img class=" wp-image-1839 alignnone" src="https://es.wordpress.org/files/2017/11/wordcamp-gran-canaria-logo.png" alt="" width="434" height="190" /></p>
<h3>WordCamp Gran Canaria | 23-25 de Febrero 2018</h3>
<p><a href="https://2018.laspalmas.wordcamp.org/" target="_blank" rel="noopener">Web</a> | <a href="https://2018.laspalmas.wordcamp.org/llamada-a-ponentes/">Ponentes</a> | <a href="https://2018.laspalmas.wordcamp.org/llamada-a-voluntarios/">Voluntarios</a> | <a href="https://2018.laspalmas.wordcamp.org/llamada-a-patrocinadores/">Patrocinadores</a> | Programa | Tickets <img src="https://s.w.org/images/core/emoji/2.3/72x72/1f39f.png" alt="🎟" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:91:"https://es.wordpress.org/2017/12/04/noticias-y-eventos-wordpress-para-la-semana-49-17/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:57:"
		
		
		
		
		
				
		
		
		
		
		

		
		
				
			
		
		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:60:"WordPress 4.9.1, actualización de seguridad y mantenimiento";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:95:"https://es.wordpress.org/2017/11/29/wordpress-4-9-1-actualizacion-de-seguridad-y-mantenimiento/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:104:"https://es.wordpress.org/2017/11/29/wordpress-4-9-1-actualizacion-de-seguridad-y-mantenimiento/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 29 Nov 2017 20:49:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:6:{i:0;a:5:{s:4:"data";s:15:"Actualizaciones";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:13:"Mantenimiento";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:9:"Seguridad";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:3:"4.9";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:4;a:5:{s:4:"data";s:5:"4.9.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:5;a:5:{s:4:"data";s:13:"mantenimiento";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"https://es.wordpress.org/?p=1917";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:406:"Ya está disponible WordPress 4.9.1. Esta es una actualización de seguridad y mantenimiento para todas las versiones desde WordPress 3.7. Te recomendamos encarecidamente que actualices inmediatamente tus sitios. Las versiones de WordPress 4.9 y anteriores están afectadas por problemas de seguridad que podrían, potencialmente, ser aprovechados como parte de un ataque en varios vectores. Como [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Fernando Tellado";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:4507:"<p>Ya está disponible WordPress 4.9.1. Esta es una <strong>actualización de seguridad y mantenimiento</strong> para todas las versiones desde WordPress 3.7. Te recomendamos encarecidamente que actualices inmediatamente tus sitios.</p>
<p>Las versiones de WordPress 4.9 y anteriores están afectadas por problemas de seguridad que podrían, potencialmente, ser aprovechados como parte de un ataque en varios vectores. Como parte del lanzamiento en marcha del equipo principal del núcleo, para fortalecer las seguridad, se han implementado las siguientes soluciones en la versión 4.9.1:</p>
<ol>
<li>Uso de un hast generado correctamente en la clave <code>newbloguser</code> en vez de una subcadena determinada.</li>
<li>Añadido un escape a los atributos de idioma utilizados en los elementos <code>html</code>.</li>
<li>Asegurar que los cierres de atributos se escapan correctamente en los feeds RSS y Atom.</li>
<li>Eliminada la posibilidad de subir archivos JavaScript por los usuarios que no tengan la capacidad de <code>unfiltered_html</code>.</li>
</ol>
<p>Gracias a los que han informado de estos problemas por practicar la <a href="https://make.wordpress.org/core/handbook/testing/reporting-security-vulnerabilities/">divulgación responsable:</a> Rahul Pratap Singh y John Blackbourn.</p>
<p>Se han solucionado otros once fallos en WordPress 4.9.1. En concreto citamos estos:</p>
<ul>
<li>Problemas relacionados con la caché de los archivos de plantillas de temas.</li>
<li>Un error de MediaElement JavaScript que impedía que usuarios de ciertos idiomas pudieran subir archivos de medios.</li>
<li>La imposibilidad de editar archivos de temas y plugins en servidores basados en Windows.</li>
</ul>
<p><a href="https://make.wordpress.org/core/2017/11/28/wordpress-4-9-1-scheduled-for-november-29th/">Si quieres aprender más esta entrada tiene más información sobre los problemas solucionados en la versión 4.9.1</a>.</p>
<p><a href="https://es.wordpress.org/releases/">Descarga WordPress 4.9.1</a> o pásate por tu Escritorio → Actualizaciones y simplemente haz clic en “Actualizar ahora.”Los sitios compatibles con las actualizaciones automáticas en segundo plano ya se están actualizando a WordPress 4.9.1</p>
<p>Gracias a todos los que han colaborado con la versión 4.9.1</p>
<p><a href="https://profiles.wordpress.org/schlessera/">Alain Schlesser</a>, <a href="https://profiles.wordpress.org/afercia/">Andrea Fercia</a>, <a href="https://profiles.wordpress.org/la-geek/">Angelika Reisiger</a>, <a href="https://profiles.wordpress.org/blobfolio/">Blobfolio</a>, <a href="https://profiles.wordpress.org/bobbingwide/">bobbingwide</a>, <a href="https://profiles.wordpress.org/chetan200891/">Chetan Prajapati</a>, <a href="https://profiles.wordpress.org/dd32/">Dion Hulse</a>, <a href="https://profiles.wordpress.org/ocean90/">Dominik Schilling (ocean90)</a>, <a href="https://profiles.wordpress.org/edo888/">edo888</a>, <a href="https://profiles.wordpress.org/erich_k4wp/">Erich Munz</a>, <a href="https://profiles.wordpress.org/flixos90/">Felix Arntz</a>, <a href="https://profiles.wordpress.org/mista-flo/">Florian TIAR</a>, <a href="https://profiles.wordpress.org/pento/">Gary Pendergast</a>, <a href="https://profiles.wordpress.org/ibenic/">Igor Benic</a>, <a href="https://profiles.wordpress.org/jfarthing84/">Jeff Farthing</a>, <a href="https://profiles.wordpress.org/jbpaul17/">Jeffrey Paul</a>, <a href="https://profiles.wordpress.org/jeremyescott/">jeremyescott</a>, <a href="https://profiles.wordpress.org/joemcgill/">Joe McGill</a>, <a href="https://profiles.wordpress.org/johnbillion/">John Blackbourn</a>, <a href="https://profiles.wordpress.org/johnpgreen/">johnpgreen</a>, <a href="https://profiles.wordpress.org/ryelle/">Kelly Dwan</a>, <a href="https://profiles.wordpress.org/lenasterg/">lenasterg</a>, <a href="https://profiles.wordpress.org/clorith/">Marius L. J.</a>, <a href="https://profiles.wordpress.org/melchoyce/">Mel Choyce</a>, <a href="https://profiles.wordpress.org/mariovalney/">Mário Valney</a>, <a href="https://profiles.wordpress.org/natacado/">natacado</a>, <a href="https://profiles.wordpress.org/odysseygate/">odyssey</a>, <a href="https://profiles.wordpress.org/precies/">precies</a>, <a href="https://profiles.wordpress.org/stodorovic/">Saša</a>, <a href="https://profiles.wordpress.org/sergeybiryukov/">Sergey Biryukov</a> y <a href="https://profiles.wordpress.org/westonruter/">Weston Ruter</a>.</p>
";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:100:"https://es.wordpress.org/2017/11/29/wordpress-4-9-1-actualizacion-de-seguridad-y-mantenimiento/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"3";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:30:"https://es.wordpress.org/feed/";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:44:"http://purl.org/rss/1.0/modules/syndication/";a:2:{s:12:"updatePeriod";a:1:{i:0;a:5:{s:4:"data";s:9:"
	hourly	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:15:"updateFrequency";a:1:{i:0;a:5:{s:4:"data";s:4:"
	1	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";O:42:"Requests_Utility_CaseInsensitiveDictionary":1:{s:7:"', 'no');
INSERT INTO "public"."wp_options" VALUES (135, '_transient_timeout_feed_mod_69c933d8a78805efd0abe985766ffb51', '1516849662', 'no');
INSERT INTO "public"."wp_options" VALUES (136, '_transient_feed_mod_69c933d8a78805efd0abe985766ffb51', '1516806462', 'no');
INSERT INTO "public"."wp_options" VALUES (137, '_transient_timeout_feed_d117b5738fbd35bd8c0391cda1f2b5d9', '1516849664', 'no');
INSERT INTO "public"."wp_options" VALUES (120, '_site_transient_timeout_theme_roots', '1516808413', 'no');
INSERT INTO "public"."wp_options" VALUES (121, '_site_transient_theme_roots', 'a:4:{s:12:"creative-gem";s:7:"/themes";s:13:"twentyfifteen";s:7:"/themes";s:15:"twentyseventeen";s:7:"/themes";s:13:"twentysixteen";s:7:"/themes";}', 'no');
INSERT INTO "public"."wp_options" VALUES (100, 'sidebars_widgets', 'a:9:{s:19:"wp_inactive_widgets";a:0:{}s:7:"sidebar";a:0:{}s:16:"top-widget-first";a:0:{}s:17:"top-widget-second";a:0:{}s:16:"top-widget-third";a:0:{}s:12:"footer-first";a:0:{}s:13:"footer-second";a:0:{}s:12:"footer-third";a:0:{}s:13:"array_version";i:3;}', 'yes');
INSERT INTO "public"."wp_options" VALUES (122, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1516806614;s:7:"checked";a:4:{s:12:"creative-gem";s:3:"3.0";s:13:"twentyfifteen";s:3:"1.9";s:15:"twentyseventeen";s:3:"1.4";s:13:"twentysixteen";s:3:"1.4";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'no');
INSERT INTO "public"."wp_options" VALUES (93, 'fresh_site', '0', 'yes');
INSERT INTO "public"."wp_options" VALUES (160, 'widget_ratings-widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO "public"."wp_options" VALUES (198, 'widget_post_ratings_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO "public"."wp_options" VALUES (185, 'wp_review_activated', '1516812180', 'yes');
INSERT INTO "public"."wp_options" VALUES (146, 'postratings_image', 'stars', 'yes');
INSERT INTO "public"."wp_options" VALUES (147, 'postratings_max', '5', 'yes');
INSERT INTO "public"."wp_options" VALUES (148, 'postratings_template_vote', '%RATINGS_IMAGES_VOTE% (<strong>%RATINGS_USERS%</strong> votes, average: <strong>%RATINGS_AVERAGE%</strong> out of %RATINGS_MAX%)<br />%RATINGS_TEXT%', 'yes');
INSERT INTO "public"."wp_options" VALUES (149, 'postratings_template_text', '%RATINGS_IMAGES% (<em><strong>%RATINGS_USERS%</strong> votes, average: <strong>%RATINGS_AVERAGE%</strong> out of %RATINGS_MAX%, <strong>rated</strong></em>)', 'yes');
INSERT INTO "public"."wp_options" VALUES (150, 'postratings_template_none', '%RATINGS_IMAGES_VOTE% (No Ratings Yet)<br />%RATINGS_TEXT%', 'yes');
INSERT INTO "public"."wp_options" VALUES (151, 'postratings_logging_method', '3', 'yes');
INSERT INTO "public"."wp_options" VALUES (152, 'postratings_allowtorate', '2', 'yes');
INSERT INTO "public"."wp_options" VALUES (153, 'postratings_ratingstext', 'a:5:{i:0;s:6:"1 Star";i:1;s:7:"2 Stars";i:2;s:7:"3 Stars";i:3;s:7:"4 Stars";i:4;s:7:"5 Stars";}', 'yes');
INSERT INTO "public"."wp_options" VALUES (154, 'postratings_template_highestrated', '<li><a href="%POST_URL%" title="%POST_TITLE%">%POST_TITLE%</a> %RATINGS_IMAGES% (%RATINGS_AVERAGE% out of %RATINGS_MAX%)</li>', 'yes');
INSERT INTO "public"."wp_options" VALUES (155, 'postratings_ajax_style', 'a:2:{s:7:"loading";i:1;s:6:"fading";i:1;}', 'yes');
INSERT INTO "public"."wp_options" VALUES (156, 'postratings_ratingsvalue', 'a:5:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:5;}', 'yes');
INSERT INTO "public"."wp_options" VALUES (157, 'postratings_customrating', '0', 'yes');
INSERT INTO "public"."wp_options" VALUES (158, 'postratings_template_permission', '%RATINGS_IMAGES% (<em><strong>%RATINGS_USERS%</strong> votes, average: <strong>%RATINGS_AVERAGE%</strong> out of %RATINGS_MAX%</em>)<br /><em>You need to be a registered member to rate this.</em>', 'yes');
INSERT INTO "public"."wp_options" VALUES (159, 'postratings_template_mostrated', '<li><a href="%POST_URL%"  title="%POST_TITLE%">%POST_TITLE%</a> - %RATINGS_USERS% votes</li>', 'yes');
INSERT INTO "public"."wp_options" VALUES (186, 'widget_wp_review_tab_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO "public"."wp_options" VALUES (161, 'current_theme', 'Creative Gem', 'yes');
INSERT INTO "public"."wp_options" VALUES (163, 'theme_switched', '', 'yes');
INSERT INTO "public"."wp_options" VALUES (162, 'theme_mods_creative-gem', 'a:3:{i:0;b:0;s:18:"nav_menu_locations";a:0:{}s:18:"custom_css_post_id";i:-1;}', 'yes');
INSERT INTO "public"."wp_options" VALUES (172, '_site_transient_timeout_available_translations', '1516817803', 'no');
INSERT INTO "public"."wp_options" VALUES (173, '_site_transient_available_translations', 'a:111:{s:2:"af";a:8:{s:8:"language";s:2:"af";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-12-01 13:40:41";s:12:"english_name";s:9:"Afrikaans";s:11:"native_name";s:9:"Afrikaans";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.9.2/af.zip";s:3:"iso";a:2:{i:1;s:2:"af";i:2;s:3:"afr";}s:7:"strings";a:1:{s:8:"continue";s:10:"Gaan voort";}}s:2:"ar";a:8:{s:8:"language";s:2:"ar";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-11-27 09:27:02";s:12:"english_name";s:6:"Arabic";s:11:"native_name";s:14:"العربية";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.9.2/ar.zip";s:3:"iso";a:2:{i:1;s:2:"ar";i:2;s:3:"ara";}s:7:"strings";a:1:{s:8:"continue";s:16:"المتابعة";}}s:3:"ary";a:8:{s:8:"language";s:3:"ary";s:7:"version";s:5:"4.7.7";s:7:"updated";s:19:"2017-01-26 15:42:35";s:12:"english_name";s:15:"Moroccan Arabic";s:11:"native_name";s:31:"العربية المغربية";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.7/ary.zip";s:3:"iso";a:2:{i:1;s:2:"ar";i:3;s:3:"ary";}s:7:"strings";a:1:{s:8:"continue";s:16:"المتابعة";}}s:2:"as";a:8:{s:8:"language";s:2:"as";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-11-22 18:59:07";s:12:"english_name";s:8:"Assamese";s:11:"native_name";s:21:"অসমীয়া";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/as.zip";s:3:"iso";a:3:{i:1;s:2:"as";i:2;s:3:"asm";i:3;s:3:"asm";}s:7:"strings";a:1:{s:8:"continue";s:0:"";}}s:3:"azb";a:8:{s:8:"language";s:3:"azb";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-09-12 20:34:31";s:12:"english_name";s:17:"South Azerbaijani";s:11:"native_name";s:29:"گؤنئی آذربایجان";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/azb.zip";s:3:"iso";a:2:{i:1;s:2:"az";i:3;s:3:"azb";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:2:"az";a:8:{s:8:"language";s:2:"az";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-11-06 00:09:27";s:12:"english_name";s:11:"Azerbaijani";s:11:"native_name";s:16:"Azərbaycan dili";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/az.zip";s:3:"iso";a:2:{i:1;s:2:"az";i:2;s:3:"aze";}s:7:"strings";a:1:{s:8:"continue";s:5:"Davam";}}s:3:"bel";a:8:{s:8:"language";s:3:"bel";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2018-01-14 16:27:27";s:12:"english_name";s:10:"Belarusian";s:11:"native_name";s:29:"Беларуская мова";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.9.2/bel.zip";s:3:"iso";a:2:{i:1;s:2:"be";i:2;s:3:"bel";}s:7:"strings";a:1:{s:8:"continue";s:20:"Працягнуць";}}s:5:"bg_BG";a:8:{s:8:"language";s:5:"bg_BG";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-11-15 09:53:15";s:12:"english_name";s:9:"Bulgarian";s:11:"native_name";s:18:"Български";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/bg_BG.zip";s:3:"iso";a:2:{i:1;s:2:"bg";i:2;s:3:"bul";}s:7:"strings";a:1:{s:8:"continue";s:22:"Продължение";}}s:5:"bn_BD";a:8:{s:8:"language";s:5:"bn_BD";s:7:"version";s:5:"4.8.5";s:7:"updated";s:19:"2017-10-01 12:57:10";s:12:"english_name";s:7:"Bengali";s:11:"native_name";s:15:"বাংলা";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.5/bn_BD.zip";s:3:"iso";a:1:{i:1;s:2:"bn";}s:7:"strings";a:1:{s:8:"continue";s:23:"এগিয়ে চল.";}}s:2:"bo";a:8:{s:8:"language";s:2:"bo";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-09-05 09:44:12";s:12:"english_name";s:7:"Tibetan";s:11:"native_name";s:21:"བོད་ཡིག";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/bo.zip";s:3:"iso";a:2:{i:1;s:2:"bo";i:2;s:3:"tib";}s:7:"strings";a:1:{s:8:"continue";s:24:"མུ་མཐུད།";}}s:5:"bs_BA";a:8:{s:8:"language";s:5:"bs_BA";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-09-04 20:20:28";s:12:"english_name";s:7:"Bosnian";s:11:"native_name";s:8:"Bosanski";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/bs_BA.zip";s:3:"iso";a:2:{i:1;s:2:"bs";i:2;s:3:"bos";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:2:"ca";a:8:{s:8:"language";s:2:"ca";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-12-29 05:52:09";s:12:"english_name";s:7:"Catalan";s:11:"native_name";s:7:"Català";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.9.2/ca.zip";s:3:"iso";a:2:{i:1;s:2:"ca";i:2;s:3:"cat";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:3:"ceb";a:8:{s:8:"language";s:3:"ceb";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-03-02 17:25:51";s:12:"english_name";s:7:"Cebuano";s:11:"native_name";s:7:"Cebuano";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/ceb.zip";s:3:"iso";a:2:{i:2;s:3:"ceb";i:3;s:3:"ceb";}s:7:"strings";a:1:{s:8:"continue";s:7:"Padayun";}}s:5:"cs_CZ";a:8:{s:8:"language";s:5:"cs_CZ";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2018-01-10 17:55:47";s:12:"english_name";s:5:"Czech";s:11:"native_name";s:9:"Čeština";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/cs_CZ.zip";s:3:"iso";a:2:{i:1;s:2:"cs";i:2;s:3:"ces";}s:7:"strings";a:1:{s:8:"continue";s:11:"Pokračovat";}}s:2:"cy";a:8:{s:8:"language";s:2:"cy";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-11-22 16:19:20";s:12:"english_name";s:5:"Welsh";s:11:"native_name";s:7:"Cymraeg";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.9.2/cy.zip";s:3:"iso";a:2:{i:1;s:2:"cy";i:2;s:3:"cym";}s:7:"strings";a:1:{s:8:"continue";s:6:"Parhau";}}s:5:"da_DK";a:8:{s:8:"language";s:5:"da_DK";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2018-01-14 18:20:23";s:12:"english_name";s:6:"Danish";s:11:"native_name";s:5:"Dansk";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/da_DK.zip";s:3:"iso";a:2:{i:1;s:2:"da";i:2;s:3:"dan";}s:7:"strings";a:1:{s:8:"continue";s:12:"Forts&#230;t";}}s:5:"de_CH";a:8:{s:8:"language";s:5:"de_CH";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-11-22 15:38:30";s:12:"english_name";s:20:"German (Switzerland)";s:11:"native_name";s:17:"Deutsch (Schweiz)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/de_CH.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:14:"de_CH_informal";a:8:{s:8:"language";s:14:"de_CH_informal";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-11-22 15:43:53";s:12:"english_name";s:30:"German (Switzerland, Informal)";s:11:"native_name";s:21:"Deutsch (Schweiz, Du)";s:7:"package";s:73:"https://downloads.wordpress.org/translation/core/4.9.2/de_CH_informal.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:6:"Weiter";}}s:5:"de_DE";a:8:{s:8:"language";s:5:"de_DE";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-12-28 20:27:03";s:12:"english_name";s:6:"German";s:11:"native_name";s:7:"Deutsch";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/de_DE.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:12:"de_DE_formal";a:8:{s:8:"language";s:12:"de_DE_formal";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-12-28 20:27:48";s:12:"english_name";s:15:"German (Formal)";s:11:"native_name";s:13:"Deutsch (Sie)";s:7:"package";s:71:"https://downloads.wordpress.org/translation/core/4.9.2/de_DE_formal.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:3:"dzo";a:8:{s:8:"language";s:3:"dzo";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-06-29 08:59:03";s:12:"english_name";s:8:"Dzongkha";s:11:"native_name";s:18:"རྫོང་ཁ";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/dzo.zip";s:3:"iso";a:2:{i:1;s:2:"dz";i:2;s:3:"dzo";}s:7:"strings";a:1:{s:8:"continue";s:0:"";}}s:2:"el";a:8:{s:8:"language";s:2:"el";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2018-01-06 10:31:42";s:12:"english_name";s:5:"Greek";s:11:"native_name";s:16:"Ελληνικά";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.9.2/el.zip";s:3:"iso";a:2:{i:1;s:2:"el";i:2;s:3:"ell";}s:7:"strings";a:1:{s:8:"continue";s:16:"Συνέχεια";}}s:5:"en_CA";a:8:{s:8:"language";s:5:"en_CA";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-11-23 18:53:44";s:12:"english_name";s:16:"English (Canada)";s:11:"native_name";s:16:"English (Canada)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/en_CA.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_AU";a:8:{s:8:"language";s:5:"en_AU";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2018-01-04 09:12:07";s:12:"english_name";s:19:"English (Australia)";s:11:"native_name";s:19:"English (Australia)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/en_AU.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_NZ";a:8:{s:8:"language";s:5:"en_NZ";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2018-01-04 09:10:37";s:12:"english_name";s:21:"English (New Zealand)";s:11:"native_name";s:21:"English (New Zealand)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/en_NZ.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_ZA";a:8:{s:8:"language";s:5:"en_ZA";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-11-15 09:54:30";s:12:"english_name";s:22:"English (South Africa)";s:11:"native_name";s:22:"English (South Africa)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/en_ZA.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_GB";a:8:{s:8:"language";s:5:"en_GB";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2018-01-16 08:56:09";s:12:"english_name";s:12:"English (UK)";s:11:"native_name";s:12:"English (UK)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/en_GB.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:2:"eo";a:8:{s:8:"language";s:2:"eo";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-11-14 01:23:37";s:12:"english_name";s:9:"Esperanto";s:11:"native_name";s:9:"Esperanto";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.9.2/eo.zip";s:3:"iso";a:2:{i:1;s:2:"eo";i:2;s:3:"epo";}s:7:"strings";a:1:{s:8:"continue";s:8:"Daŭrigi";}}s:5:"es_CO";a:8:{s:8:"language";s:5:"es_CO";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-11-15 23:17:08";s:12:"english_name";s:18:"Spanish (Colombia)";s:11:"native_name";s:20:"Español de Colombia";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/es_CO.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_GT";a:8:{s:8:"language";s:5:"es_GT";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-11-15 15:03:42";s:12:"english_name";s:19:"Spanish (Guatemala)";s:11:"native_name";s:21:"Español de Guatemala";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/es_GT.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_AR";a:8:{s:8:"language";s:5:"es_AR";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-11-16 03:15:17";s:12:"english_name";s:19:"Spanish (Argentina)";s:11:"native_name";s:21:"Español de Argentina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/es_AR.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_ES";a:8:{s:8:"language";s:5:"es_ES";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-12-18 11:09:35";s:12:"english_name";s:15:"Spanish (Spain)";s:11:"native_name";s:8:"Español";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/es_ES.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_VE";a:8:{s:8:"language";s:5:"es_VE";s:7:"version";s:5:"4.8.5";s:7:"updated";s:19:"2017-07-30 16:09:17";s:12:"english_name";s:19:"Spanish (Venezuela)";s:11:"native_name";s:21:"Español de Venezuela";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.5/es_VE.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_MX";a:8:{s:8:"language";s:5:"es_MX";s:7:"version";s:5:"4.8.5";s:7:"updated";s:19:"2017-07-31 15:12:02";s:12:"english_name";s:16:"Spanish (Mexico)";s:11:"native_name";s:19:"Español de México";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.5/es_MX.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_CR";a:8:{s:8:"language";s:5:"es_CR";s:7:"version";s:5:"4.8.3";s:7:"updated";s:19:"2017-10-01 17:54:52";s:12:"english_name";s:20:"Spanish (Costa Rica)";s:11:"native_name";s:22:"Español de Costa Rica";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.3/es_CR.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_PE";a:8:{s:8:"language";s:5:"es_PE";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-09-09 09:36:22";s:12:"english_name";s:14:"Spanish (Peru)";s:11:"native_name";s:17:"Español de Perú";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/es_PE.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_CL";a:8:{s:8:"language";s:5:"es_CL";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-11-28 20:09:49";s:12:"english_name";s:15:"Spanish (Chile)";s:11:"native_name";s:17:"Español de Chile";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/es_CL.zip";s:3:"iso";a:3:{i:1;s:2:"es";i:2;s:3:"spa";i:3;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:2:"et";a:8:{s:8:"language";s:2:"et";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-11-19 14:11:29";s:12:"english_name";s:8:"Estonian";s:11:"native_name";s:5:"Eesti";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.9.2/et.zip";s:3:"iso";a:2:{i:1;s:2:"et";i:2;s:3:"est";}s:7:"strings";a:1:{s:8:"continue";s:6:"Jätka";}}s:2:"eu";a:8:{s:8:"language";s:2:"eu";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-12-09 21:12:23";s:12:"english_name";s:6:"Basque";s:11:"native_name";s:7:"Euskara";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.9.2/eu.zip";s:3:"iso";a:2:{i:1;s:2:"eu";i:2;s:3:"eus";}s:7:"strings";a:1:{s:8:"continue";s:8:"Jarraitu";}}s:5:"fa_IR";a:8:{s:8:"language";s:5:"fa_IR";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2018-01-14 15:13:01";s:12:"english_name";s:7:"Persian";s:11:"native_name";s:10:"فارسی";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/fa_IR.zip";s:3:"iso";a:2:{i:1;s:2:"fa";i:2;s:3:"fas";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:2:"fi";a:8:{s:8:"language";s:2:"fi";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-11-15 09:48:14";s:12:"english_name";s:7:"Finnish";s:11:"native_name";s:5:"Suomi";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.9.2/fi.zip";s:3:"iso";a:2:{i:1;s:2:"fi";i:2;s:3:"fin";}s:7:"strings";a:1:{s:8:"continue";s:5:"Jatka";}}s:5:"fr_CA";a:8:{s:8:"language";s:5:"fr_CA";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-11-19 23:55:33";s:12:"english_name";s:15:"French (Canada)";s:11:"native_name";s:19:"Français du Canada";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/fr_CA.zip";s:3:"iso";a:2:{i:1;s:2:"fr";i:2;s:3:"fra";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:5:"fr_BE";a:8:{s:8:"language";s:5:"fr_BE";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2018-01-09 09:23:29";s:12:"english_name";s:16:"French (Belgium)";s:11:"native_name";s:21:"Français de Belgique";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/fr_BE.zip";s:3:"iso";a:2:{i:1;s:2:"fr";i:2;s:3:"fra";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:5:"fr_FR";a:8:{s:8:"language";s:5:"fr_FR";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2018-01-14 10:19:51";s:12:"english_name";s:15:"French (France)";s:11:"native_name";s:9:"Français";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/fr_FR.zip";s:3:"iso";a:1:{i:1;s:2:"fr";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:2:"gd";a:8:{s:8:"language";s:2:"gd";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-08-23 17:41:37";s:12:"english_name";s:15:"Scottish Gaelic";s:11:"native_name";s:9:"Gàidhlig";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/gd.zip";s:3:"iso";a:3:{i:1;s:2:"gd";i:2;s:3:"gla";i:3;s:3:"gla";}s:7:"strings";a:1:{s:8:"continue";s:15:"Lean air adhart";}}s:5:"gl_ES";a:8:{s:8:"language";s:5:"gl_ES";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-11-16 10:40:05";s:12:"english_name";s:8:"Galician";s:11:"native_name";s:6:"Galego";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/gl_ES.zip";s:3:"iso";a:2:{i:1;s:2:"gl";i:2;s:3:"glg";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:2:"gu";a:8:{s:8:"language";s:2:"gu";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-11-16 11:06:53";s:12:"english_name";s:8:"Gujarati";s:11:"native_name";s:21:"ગુજરાતી";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.9.2/gu.zip";s:3:"iso";a:2:{i:1;s:2:"gu";i:2;s:3:"guj";}s:7:"strings";a:1:{s:8:"continue";s:31:"ચાલુ રાખવું";}}s:3:"haz";a:8:{s:8:"language";s:3:"haz";s:7:"version";s:5:"4.4.2";s:7:"updated";s:19:"2015-12-05 00:59:09";s:12:"english_name";s:8:"Hazaragi";s:11:"native_name";s:15:"هزاره گی";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.4.2/haz.zip";s:3:"iso";a:1:{i:3;s:3:"haz";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:5:"he_IL";a:8:{s:8:"language";s:5:"he_IL";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-12-06 13:23:01";s:12:"english_name";s:6:"Hebrew";s:11:"native_name";s:16:"עִבְרִית";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/he_IL.zip";s:3:"iso";a:1:{i:1;s:2:"he";}s:7:"strings";a:1:{s:8:"continue";s:12:"להמשיך";}}s:5:"hi_IN";a:8:{s:8:"language";s:5:"hi_IN";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-12-02 23:26:33";s:12:"english_name";s:5:"Hindi";s:11:"native_name";s:18:"हिन्दी";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/hi_IN.zip";s:3:"iso";a:2:{i:1;s:2:"hi";i:2;s:3:"hin";}s:7:"strings";a:1:{s:8:"continue";s:12:"जारी";}}s:2:"hr";a:8:{s:8:"language";s:2:"hr";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-11-14 13:03:07";s:12:"english_name";s:8:"Croatian";s:11:"native_name";s:8:"Hrvatski";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.9.2/hr.zip";s:3:"iso";a:2:{i:1;s:2:"hr";i:2;s:3:"hrv";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:5:"hu_HU";a:8:{s:8:"language";s:5:"hu_HU";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-12-14 10:14:07";s:12:"english_name";s:9:"Hungarian";s:11:"native_name";s:6:"Magyar";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/hu_HU.zip";s:3:"iso";a:2:{i:1;s:2:"hu";i:2;s:3:"hun";}s:7:"strings";a:1:{s:8:"continue";s:7:"Tovább";}}s:2:"hy";a:8:{s:8:"language";s:2:"hy";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-12-03 16:21:10";s:12:"english_name";s:8:"Armenian";s:11:"native_name";s:14:"Հայերեն";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/hy.zip";s:3:"iso";a:2:{i:1;s:2:"hy";i:2;s:3:"hye";}s:7:"strings";a:1:{s:8:"continue";s:20:"Շարունակել";}}s:5:"id_ID";a:8:{s:8:"language";s:5:"id_ID";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-12-21 02:45:34";s:12:"english_name";s:10:"Indonesian";s:11:"native_name";s:16:"Bahasa Indonesia";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/id_ID.zip";s:3:"iso";a:2:{i:1;s:2:"id";i:2;s:3:"ind";}s:7:"strings";a:1:{s:8:"continue";s:9:"Lanjutkan";}}s:5:"is_IS";a:8:{s:8:"language";s:5:"is_IS";s:7:"version";s:5:"4.7.7";s:7:"updated";s:19:"2017-04-13 13:55:54";s:12:"english_name";s:9:"Icelandic";s:11:"native_name";s:9:"Íslenska";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.7/is_IS.zip";s:3:"iso";a:2:{i:1;s:2:"is";i:2;s:3:"isl";}s:7:"strings";a:1:{s:8:"continue";s:6:"Áfram";}}s:5:"it_IT";a:8:{s:8:"language";s:5:"it_IT";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2018-01-08 14:46:48";s:12:"english_name";s:7:"Italian";s:11:"native_name";s:8:"Italiano";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/it_IT.zip";s:3:"iso";a:2:{i:1;s:2:"it";i:2;s:3:"ita";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"ja";a:8:{s:8:"language";s:2:"ja";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-11-17 09:56:44";s:12:"english_name";s:8:"Japanese";s:11:"native_name";s:9:"日本語";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.9.2/ja.zip";s:3:"iso";a:1:{i:1;s:2:"ja";}s:7:"strings";a:1:{s:8:"continue";s:9:"続ける";}}s:5:"jv_ID";a:8:{s:8:"language";s:5:"jv_ID";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-11-14 11:47:57";s:12:"english_name";s:8:"Javanese";s:11:"native_name";s:9:"Basa Jawa";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/jv_ID.zip";s:3:"iso";a:2:{i:1;s:2:"jv";i:2;s:3:"jav";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nutugne";}}s:5:"ka_GE";a:8:{s:8:"language";s:5:"ka_GE";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-12-07 12:32:16";s:12:"english_name";s:8:"Georgian";s:11:"native_name";s:21:"ქართული";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/ka_GE.zip";s:3:"iso";a:2:{i:1;s:2:"ka";i:2;s:3:"kat";}s:7:"strings";a:1:{s:8:"continue";s:30:"გაგრძელება";}}s:3:"kab";a:8:{s:8:"language";s:3:"kab";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2018-01-09 14:06:54";s:12:"english_name";s:6:"Kabyle";s:11:"native_name";s:9:"Taqbaylit";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.9.2/kab.zip";s:3:"iso";a:2:{i:2;s:3:"kab";i:3;s:3:"kab";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:2:"km";a:8:{s:8:"language";s:2:"km";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-12-07 02:07:59";s:12:"english_name";s:5:"Khmer";s:11:"native_name";s:27:"ភាសាខ្មែរ";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/km.zip";s:3:"iso";a:2:{i:1;s:2:"km";i:2;s:3:"khm";}s:7:"strings";a:1:{s:8:"continue";s:12:"បន្ត";}}s:5:"ko_KR";a:8:{s:8:"language";s:5:"ko_KR";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-12-04 01:44:20";s:12:"english_name";s:6:"Korean";s:11:"native_name";s:9:"한국어";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/ko_KR.zip";s:3:"iso";a:2:{i:1;s:2:"ko";i:2;s:3:"kor";}s:7:"strings";a:1:{s:8:"continue";s:6:"계속";}}s:3:"ckb";a:8:{s:8:"language";s:3:"ckb";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2017-01-26 15:48:25";s:12:"english_name";s:16:"Kurdish (Sorani)";s:11:"native_name";s:13:"كوردی‎";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/ckb.zip";s:3:"iso";a:2:{i:1;s:2:"ku";i:3;s:3:"ckb";}s:7:"strings";a:1:{s:8:"continue";s:30:"به‌رده‌وام به‌";}}s:2:"lo";a:8:{s:8:"language";s:2:"lo";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-11-12 09:59:23";s:12:"english_name";s:3:"Lao";s:11:"native_name";s:21:"ພາສາລາວ";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/lo.zip";s:3:"iso";a:2:{i:1;s:2:"lo";i:2;s:3:"lao";}s:7:"strings";a:1:{s:8:"continue";s:9:"ຕໍ່";}}s:5:"lt_LT";a:8:{s:8:"language";s:5:"lt_LT";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-11-15 19:40:23";s:12:"english_name";s:10:"Lithuanian";s:11:"native_name";s:15:"Lietuvių kalba";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/lt_LT.zip";s:3:"iso";a:2:{i:1;s:2:"lt";i:2;s:3:"lit";}s:7:"strings";a:1:{s:8:"continue";s:6:"Tęsti";}}s:2:"lv";a:8:{s:8:"language";s:2:"lv";s:7:"version";s:5:"4.7.7";s:7:"updated";s:19:"2017-03-17 20:40:40";s:12:"english_name";s:7:"Latvian";s:11:"native_name";s:16:"Latviešu valoda";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.7/lv.zip";s:3:"iso";a:2:{i:1;s:2:"lv";i:2;s:3:"lav";}s:7:"strings";a:1:{s:8:"continue";s:9:"Turpināt";}}s:5:"mk_MK";a:8:{s:8:"language";s:5:"mk_MK";s:7:"version";s:5:"4.7.7";s:7:"updated";s:19:"2017-01-26 15:54:41";s:12:"english_name";s:10:"Macedonian";s:11:"native_name";s:31:"Македонски јазик";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.7/mk_MK.zip";s:3:"iso";a:2:{i:1;s:2:"mk";i:2;s:3:"mkd";}s:7:"strings";a:1:{s:8:"continue";s:16:"Продолжи";}}s:5:"ml_IN";a:8:{s:8:"language";s:5:"ml_IN";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2017-01-27 03:43:32";s:12:"english_name";s:9:"Malayalam";s:11:"native_name";s:18:"മലയാളം";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/ml_IN.zip";s:3:"iso";a:2:{i:1;s:2:"ml";i:2;s:3:"mal";}s:7:"strings";a:1:{s:8:"continue";s:18:"തുടരുക";}}s:2:"mn";a:8:{s:8:"language";s:2:"mn";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2017-01-12 07:29:35";s:12:"english_name";s:9:"Mongolian";s:11:"native_name";s:12:"Монгол";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/mn.zip";s:3:"iso";a:2:{i:1;s:2:"mn";i:2;s:3:"mon";}s:7:"strings";a:1:{s:8:"continue";s:24:"Үргэлжлүүлэх";}}s:2:"mr";a:8:{s:8:"language";s:2:"mr";s:7:"version";s:5:"4.8.5";s:7:"updated";s:19:"2017-09-30 06:25:41";s:12:"english_name";s:7:"Marathi";s:11:"native_name";s:15:"मराठी";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.8.5/mr.zip";s:3:"iso";a:2:{i:1;s:2:"mr";i:2;s:3:"mar";}s:7:"strings";a:1:{s:8:"continue";s:25:"सुरु ठेवा";}}s:5:"ms_MY";a:8:{s:8:"language";s:5:"ms_MY";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-12-09 00:51:20";s:12:"english_name";s:5:"Malay";s:11:"native_name";s:13:"Bahasa Melayu";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/ms_MY.zip";s:3:"iso";a:2:{i:1;s:2:"ms";i:2;s:3:"msa";}s:7:"strings";a:1:{s:8:"continue";s:8:"Teruskan";}}s:5:"my_MM";a:8:{s:8:"language";s:5:"my_MM";s:7:"version";s:6:"4.1.20";s:7:"updated";s:19:"2015-03-26 15:57:42";s:12:"english_name";s:17:"Myanmar (Burmese)";s:11:"native_name";s:15:"ဗမာစာ";s:7:"package";s:65:"https://downloads.wordpress.org/translation/core/4.1.20/my_MM.zip";s:3:"iso";a:2:{i:1;s:2:"my";i:2;s:3:"mya";}s:7:"strings";a:1:{s:8:"continue";s:54:"ဆက်လက်လုပ်ေဆာင်ပါ။";}}s:5:"nb_NO";a:8:{s:8:"language";s:5:"nb_NO";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-11-17 19:14:57";s:12:"english_name";s:19:"Norwegian (Bokmål)";s:11:"native_name";s:13:"Norsk bokmål";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/nb_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nb";i:2;s:3:"nob";}s:7:"strings";a:1:{s:8:"continue";s:8:"Fortsett";}}s:5:"ne_NP";a:8:{s:8:"language";s:5:"ne_NP";s:7:"version";s:5:"4.8.3";s:7:"updated";s:19:"2017-10-05 06:45:20";s:12:"english_name";s:6:"Nepali";s:11:"native_name";s:18:"नेपाली";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.3/ne_NP.zip";s:3:"iso";a:2:{i:1;s:2:"ne";i:2;s:3:"nep";}s:7:"strings";a:1:{s:8:"continue";s:31:"जारीराख्नु ";}}s:5:"nl_NL";a:8:{s:8:"language";s:5:"nl_NL";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-12-22 08:05:07";s:12:"english_name";s:5:"Dutch";s:11:"native_name";s:10:"Nederlands";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/nl_NL.zip";s:3:"iso";a:2:{i:1;s:2:"nl";i:2;s:3:"nld";}s:7:"strings";a:1:{s:8:"continue";s:8:"Doorgaan";}}s:5:"nl_BE";a:8:{s:8:"language";s:5:"nl_BE";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-12-06 06:13:30";s:12:"english_name";s:15:"Dutch (Belgium)";s:11:"native_name";s:20:"Nederlands (België)";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/nl_BE.zip";s:3:"iso";a:2:{i:1;s:2:"nl";i:2;s:3:"nld";}s:7:"strings";a:1:{s:8:"continue";s:8:"Doorgaan";}}s:12:"nl_NL_formal";a:8:{s:8:"language";s:12:"nl_NL_formal";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-12-22 08:13:09";s:12:"english_name";s:14:"Dutch (Formal)";s:11:"native_name";s:20:"Nederlands (Formeel)";s:7:"package";s:71:"https://downloads.wordpress.org/translation/core/4.9.2/nl_NL_formal.zip";s:3:"iso";a:2:{i:1;s:2:"nl";i:2;s:3:"nld";}s:7:"strings";a:1:{s:8:"continue";s:8:"Doorgaan";}}s:5:"nn_NO";a:8:{s:8:"language";s:5:"nn_NO";s:7:"version";s:5:"4.8.3";s:7:"updated";s:19:"2017-09-25 10:02:16";s:12:"english_name";s:19:"Norwegian (Nynorsk)";s:11:"native_name";s:13:"Norsk nynorsk";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.8.3/nn_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nn";i:2;s:3:"nno";}s:7:"strings";a:1:{s:8:"continue";s:9:"Hald fram";}}s:3:"oci";a:8:{s:8:"language";s:3:"oci";s:7:"version";s:5:"4.8.3";s:7:"updated";s:19:"2017-08-25 10:03:08";s:12:"english_name";s:7:"Occitan";s:11:"native_name";s:7:"Occitan";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.8.3/oci.zip";s:3:"iso";a:2:{i:1;s:2:"oc";i:2;s:3:"oci";}s:7:"strings";a:1:{s:8:"continue";s:9:"Contunhar";}}s:5:"pa_IN";a:8:{s:8:"language";s:5:"pa_IN";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2017-01-16 05:19:43";s:12:"english_name";s:7:"Punjabi";s:11:"native_name";s:18:"ਪੰਜਾਬੀ";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/pa_IN.zip";s:3:"iso";a:2:{i:1;s:2:"pa";i:2;s:3:"pan";}s:7:"strings";a:1:{s:8:"continue";s:25:"ਜਾਰੀ ਰੱਖੋ";}}s:5:"pl_PL";a:8:{s:8:"language";s:5:"pl_PL";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2018-01-11 12:23:44";s:12:"english_name";s:6:"Polish";s:11:"native_name";s:6:"Polski";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/pl_PL.zip";s:3:"iso";a:2:{i:1;s:2:"pl";i:2;s:3:"pol";}s:7:"strings";a:1:{s:8:"continue";s:9:"Kontynuuj";}}s:2:"ps";a:8:{s:8:"language";s:2:"ps";s:7:"version";s:6:"4.1.20";s:7:"updated";s:19:"2015-03-29 22:19:48";s:12:"english_name";s:6:"Pashto";s:11:"native_name";s:8:"پښتو";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1.20/ps.zip";s:3:"iso";a:2:{i:1;s:2:"ps";i:2;s:3:"pus";}s:7:"strings";a:1:{s:8:"continue";s:8:"دوام";}}s:5:"pt_PT";a:8:{s:8:"language";s:5:"pt_PT";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-12-19 23:04:20";s:12:"english_name";s:21:"Portuguese (Portugal)";s:11:"native_name";s:10:"Português";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/pt_PT.zip";s:3:"iso";a:1:{i:1;s:2:"pt";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"pt_BR";a:8:{s:8:"language";s:5:"pt_BR";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2018-01-01 14:17:04";s:12:"english_name";s:19:"Portuguese (Brazil)";s:11:"native_name";s:20:"Português do Brasil";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/pt_BR.zip";s:3:"iso";a:2:{i:1;s:2:"pt";i:2;s:3:"por";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:10:"pt_PT_ao90";a:8:{s:8:"language";s:10:"pt_PT_ao90";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-12-18 12:10:14";s:12:"english_name";s:27:"Portuguese (Portugal, AO90)";s:11:"native_name";s:17:"Português (AO90)";s:7:"package";s:69:"https://downloads.wordpress.org/translation/core/4.9.2/pt_PT_ao90.zip";s:3:"iso";a:1:{i:1;s:2:"pt";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:3:"rhg";a:8:{s:8:"language";s:3:"rhg";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-03-16 13:03:18";s:12:"english_name";s:8:"Rohingya";s:11:"native_name";s:8:"Ruáinga";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/rhg.zip";s:3:"iso";a:1:{i:3;s:3:"rhg";}s:7:"strings";a:1:{s:8:"continue";s:0:"";}}s:5:"ro_RO";a:8:{s:8:"language";s:5:"ro_RO";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2018-01-04 18:30:47";s:12:"english_name";s:8:"Romanian";s:11:"native_name";s:8:"Română";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/ro_RO.zip";s:3:"iso";a:2:{i:1;s:2:"ro";i:2;s:3:"ron";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuă";}}s:5:"ru_RU";a:8:{s:8:"language";s:5:"ru_RU";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-12-15 20:59:00";s:12:"english_name";s:7:"Russian";s:11:"native_name";s:14:"Русский";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/ru_RU.zip";s:3:"iso";a:2:{i:1;s:2:"ru";i:2;s:3:"rus";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продолжить";}}s:3:"sah";a:8:{s:8:"language";s:3:"sah";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2017-01-21 02:06:41";s:12:"english_name";s:5:"Sakha";s:11:"native_name";s:14:"Сахалыы";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/sah.zip";s:3:"iso";a:2:{i:2;s:3:"sah";i:3;s:3:"sah";}s:7:"strings";a:1:{s:8:"continue";s:12:"Салҕаа";}}s:5:"si_LK";a:8:{s:8:"language";s:5:"si_LK";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-11-12 06:00:52";s:12:"english_name";s:7:"Sinhala";s:11:"native_name";s:15:"සිංහල";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/si_LK.zip";s:3:"iso";a:2:{i:1;s:2:"si";i:2;s:3:"sin";}s:7:"strings";a:1:{s:8:"continue";s:44:"දිගටම කරගෙන යන්න";}}s:5:"sk_SK";a:8:{s:8:"language";s:5:"sk_SK";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2018-01-08 12:38:03";s:12:"english_name";s:6:"Slovak";s:11:"native_name";s:11:"Slovenčina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/sk_SK.zip";s:3:"iso";a:2:{i:1;s:2:"sk";i:2;s:3:"slk";}s:7:"strings";a:1:{s:8:"continue";s:12:"Pokračovať";}}s:5:"sl_SI";a:8:{s:8:"language";s:5:"sl_SI";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2018-01-04 13:33:13";s:12:"english_name";s:9:"Slovenian";s:11:"native_name";s:13:"Slovenščina";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/sl_SI.zip";s:3:"iso";a:2:{i:1;s:2:"sl";i:2;s:3:"slv";}s:7:"strings";a:1:{s:8:"continue";s:10:"Nadaljujte";}}s:2:"sq";a:8:{s:8:"language";s:2:"sq";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-11-30 17:20:03";s:12:"english_name";s:8:"Albanian";s:11:"native_name";s:5:"Shqip";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.9.2/sq.zip";s:3:"iso";a:2:{i:1;s:2:"sq";i:2;s:3:"sqi";}s:7:"strings";a:1:{s:8:"continue";s:6:"Vazhdo";}}s:5:"sr_RS";a:8:{s:8:"language";s:5:"sr_RS";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-11-15 23:19:48";s:12:"english_name";s:7:"Serbian";s:11:"native_name";s:23:"Српски језик";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/sr_RS.zip";s:3:"iso";a:2:{i:1;s:2:"sr";i:2;s:3:"srp";}s:7:"strings";a:1:{s:8:"continue";s:14:"Настави";}}s:5:"sv_SE";a:8:{s:8:"language";s:5:"sv_SE";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2018-01-08 22:15:45";s:12:"english_name";s:7:"Swedish";s:11:"native_name";s:7:"Svenska";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/sv_SE.zip";s:3:"iso";a:2:{i:1;s:2:"sv";i:2;s:3:"swe";}s:7:"strings";a:1:{s:8:"continue";s:9:"Fortsätt";}}s:3:"szl";a:8:{s:8:"language";s:3:"szl";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-09-24 19:58:14";s:12:"english_name";s:8:"Silesian";s:11:"native_name";s:17:"Ślōnskŏ gŏdka";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/szl.zip";s:3:"iso";a:1:{i:3;s:3:"szl";}s:7:"strings";a:1:{s:8:"continue";s:13:"Kōntynuować";}}s:5:"ta_IN";a:8:{s:8:"language";s:5:"ta_IN";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2017-01-27 03:22:47";s:12:"english_name";s:5:"Tamil";s:11:"native_name";s:15:"தமிழ்";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/ta_IN.zip";s:3:"iso";a:2:{i:1;s:2:"ta";i:2;s:3:"tam";}s:7:"strings";a:1:{s:8:"continue";s:24:"தொடரவும்";}}s:2:"te";a:8:{s:8:"language";s:2:"te";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2017-01-26 15:47:39";s:12:"english_name";s:6:"Telugu";s:11:"native_name";s:18:"తెలుగు";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/te.zip";s:3:"iso";a:2:{i:1;s:2:"te";i:2;s:3:"tel";}s:7:"strings";a:1:{s:8:"continue";s:30:"కొనసాగించు";}}s:2:"th";a:8:{s:8:"language";s:2:"th";s:7:"version";s:5:"4.8.3";s:7:"updated";s:19:"2017-10-07 02:08:56";s:12:"english_name";s:4:"Thai";s:11:"native_name";s:9:"ไทย";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.8.3/th.zip";s:3:"iso";a:2:{i:1;s:2:"th";i:2;s:3:"tha";}s:7:"strings";a:1:{s:8:"continue";s:15:"ต่อไป";}}s:2:"tl";a:8:{s:8:"language";s:2:"tl";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-12-30 02:38:08";s:12:"english_name";s:7:"Tagalog";s:11:"native_name";s:7:"Tagalog";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.7.2/tl.zip";s:3:"iso";a:2:{i:1;s:2:"tl";i:2;s:3:"tgl";}s:7:"strings";a:1:{s:8:"continue";s:10:"Magpatuloy";}}s:5:"tr_TR";a:8:{s:8:"language";s:5:"tr_TR";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-11-20 16:20:13";s:12:"english_name";s:7:"Turkish";s:11:"native_name";s:8:"Türkçe";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/tr_TR.zip";s:3:"iso";a:2:{i:1;s:2:"tr";i:2;s:3:"tur";}s:7:"strings";a:1:{s:8:"continue";s:5:"Devam";}}s:5:"tt_RU";a:8:{s:8:"language";s:5:"tt_RU";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-11-20 20:20:50";s:12:"english_name";s:5:"Tatar";s:11:"native_name";s:19:"Татар теле";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/tt_RU.zip";s:3:"iso";a:2:{i:1;s:2:"tt";i:2;s:3:"tat";}s:7:"strings";a:1:{s:8:"continue";s:17:"дәвам итү";}}s:3:"tah";a:8:{s:8:"language";s:3:"tah";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-03-06 18:39:39";s:12:"english_name";s:8:"Tahitian";s:11:"native_name";s:10:"Reo Tahiti";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.7.2/tah.zip";s:3:"iso";a:3:{i:1;s:2:"ty";i:2;s:3:"tah";i:3;s:3:"tah";}s:7:"strings";a:1:{s:8:"continue";s:0:"";}}s:5:"ug_CN";a:8:{s:8:"language";s:5:"ug_CN";s:7:"version";s:5:"4.7.2";s:7:"updated";s:19:"2016-12-05 09:23:39";s:12:"english_name";s:6:"Uighur";s:11:"native_name";s:9:"Uyƣurqə";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.7.2/ug_CN.zip";s:3:"iso";a:2:{i:1;s:2:"ug";i:2;s:3:"uig";}s:7:"strings";a:1:{s:8:"continue";s:26:"داۋاملاشتۇرۇش";}}s:2:"uk";a:8:{s:8:"language";s:2:"uk";s:7:"version";s:5:"4.8.3";s:7:"updated";s:19:"2017-11-02 17:05:02";s:12:"english_name";s:9:"Ukrainian";s:11:"native_name";s:20:"Українська";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.8.3/uk.zip";s:3:"iso";a:2:{i:1;s:2:"uk";i:2;s:3:"ukr";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продовжити";}}s:2:"ur";a:8:{s:8:"language";s:2:"ur";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-12-20 11:26:53";s:12:"english_name";s:4:"Urdu";s:11:"native_name";s:8:"اردو";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.9.2/ur.zip";s:3:"iso";a:2:{i:1;s:2:"ur";i:2;s:3:"urd";}s:7:"strings";a:1:{s:8:"continue";s:19:"جاری رکھیں";}}s:5:"uz_UZ";a:8:{s:8:"language";s:5:"uz_UZ";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-12-28 12:41:50";s:12:"english_name";s:5:"Uzbek";s:11:"native_name";s:11:"O‘zbekcha";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/uz_UZ.zip";s:3:"iso";a:2:{i:1;s:2:"uz";i:2;s:3:"uzb";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продолжить";}}s:2:"vi";a:8:{s:8:"language";s:2:"vi";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-11-15 10:43:28";s:12:"english_name";s:10:"Vietnamese";s:11:"native_name";s:14:"Tiếng Việt";s:7:"package";s:61:"https://downloads.wordpress.org/translation/core/4.9.2/vi.zip";s:3:"iso";a:2:{i:1;s:2:"vi";i:2;s:3:"vie";}s:7:"strings";a:1:{s:8:"continue";s:12:"Tiếp tục";}}s:5:"zh_TW";a:8:{s:8:"language";s:5:"zh_TW";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-12-02 09:46:12";s:12:"english_name";s:16:"Chinese (Taiwan)";s:11:"native_name";s:12:"繁體中文";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/zh_TW.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"繼續";}}s:5:"zh_HK";a:8:{s:8:"language";s:5:"zh_HK";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-12-09 02:29:44";s:12:"english_name";s:19:"Chinese (Hong Kong)";s:11:"native_name";s:16:"香港中文版	";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/zh_HK.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"繼續";}}s:5:"zh_CN";a:8:{s:8:"language";s:5:"zh_CN";s:7:"version";s:5:"4.9.2";s:7:"updated";s:19:"2017-11-17 22:20:52";s:12:"english_name";s:15:"Chinese (China)";s:11:"native_name";s:12:"简体中文";s:7:"package";s:64:"https://downloads.wordpress.org/translation/core/4.9.2/zh_CN.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"继续";}}}', 'no');
INSERT INTO "public"."wp_options" VALUES (174, 'category_children', 'a:0:{}', 'yes');
INSERT INTO "public"."wp_options" VALUES (201, '_transient_timeout_post_ratings_ip_cache', '1518022466', 'no');
INSERT INTO "public"."wp_options" VALUES (209, '_transient_is_multi_author', '0', 'yes');
INSERT INTO "public"."wp_options" VALUES (202, '_transient_post_ratings_ip_cache', 'a:1:{i:1;a:1:{i:0;s:3:"::1";}}', 'no');
INSERT INTO "public"."wp_options" VALUES (175, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO "public"."wp_options" VALUES (176, 'widget_text', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes');
INSERT INTO "public"."wp_options" VALUES (179, 'new_admin_email', 'dsepulve@thougthworks.com', 'yes');
INSERT INTO "public"."wp_options" VALUES (187, 'wp_review_options', 'a:5:{s:6:"colors";a:5:{s:5:"color";s:7:"#1e73be";s:9:"fontcolor";s:7:"#555555";s:8:"bgcolor1";s:7:"#e7e7e7";s:8:"bgcolor2";s:7:"#ffffff";s:11:"bordercolor";s:7:"#e7e7e7";}s:12:"add_backlink";s:1:"0";s:8:"last_tab";s:7:"styling";s:15:"review_location";s:6:"bottom";s:16:"default_features";a:1:{i:0;s:0:"";}}', 'yes');
INSERT INTO "public"."wp_options" VALUES (145, 'recently_activated', 'a:2:{s:23:"wp-review/wp-review.php";i:1516812881;s:33:"wp-postratings/wp-postratings.php";i:1516807149;}', 'yes');
INSERT INTO "public"."wp_options" VALUES (144, '_transient_plugin_slugs', 'a:5:{i:0;s:19:"akismet/akismet.php";i:1;s:9:"hello.php";i:2;s:29:"post-ratings/post-ratings.php";i:3;s:39:"really-simple-breadcrumb/breadcrumb.php";i:4;s:23:"wp-review/wp-review.php";}', 'no');
INSERT INTO "public"."wp_options" VALUES (143, '_transient_timeout_plugin_slugs', '1516899282', 'no');
INSERT INTO "public"."wp_options" VALUES (197, 'post-ratings', 'a:14:{s:14:"anonymous_vote";b:1;s:10:"max_rating";i:5;s:16:"bayesian_formula";s:40:"(v / (v + MV)) * r + (MV / (v + MV)) * R";s:12:"user_formula";s:0:"";s:11:"before_post";b:0;s:10:"after_post";b:1;s:11:"custom_hook";b:0;s:13:"custom_filter";s:0:"";s:10:"post_types";a:1:{i:0;s:4:"post";}s:10:"visibility";a:3:{i:0;s:4:"home";i:1;s:7:"archive";i:2;s:8:"singular";}s:10:"avg_rating";i:4;s:9:"num_votes";i:1;s:15:"num_rated_posts";i:1;s:7:"version";s:3:"3.0";}', 'no');
COMMIT;

-- ----------------------------
-- Table structure for wp_postmeta
-- ----------------------------
DROP TABLE IF EXISTS "public"."wp_postmeta";
CREATE TABLE "public"."wp_postmeta" (
  "meta_id" int8 NOT NULL DEFAULT nextval(('wp_postmeta_seq'::text)::regclass),
  "post_id" int8 NOT NULL DEFAULT '0'::bigint,
  "meta_key" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "meta_value" text COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."wp_postmeta" OWNER TO "postgres";

-- ----------------------------
-- Records of wp_postmeta
-- ----------------------------
BEGIN;
INSERT INTO "public"."wp_postmeta" VALUES (1, 2, '_wp_page_template', 'default');
INSERT INTO "public"."wp_postmeta" VALUES (2, 4, '_wp_trash_meta_status', 'publish');
INSERT INTO "public"."wp_postmeta" VALUES (3, 4, '_wp_trash_meta_time', '1516807390');
INSERT INTO "public"."wp_postmeta" VALUES (4, 5, '_wp_trash_meta_status', 'publish');
INSERT INTO "public"."wp_postmeta" VALUES (5, 5, '_wp_trash_meta_time', '1516807427');
INSERT INTO "public"."wp_postmeta" VALUES (33, 2, '_edit_last', '1');
INSERT INTO "public"."wp_postmeta" VALUES (32, 2, '_edit_lock', '1516813027:1');
INSERT INTO "public"."wp_postmeta" VALUES (30, 1, 'rating', '4');
INSERT INTO "public"."wp_postmeta" VALUES (31, 1, 'votes', '1');
INSERT INTO "public"."wp_postmeta" VALUES (17, 1, 'wp_review_bgcolor1', '#e7e7e7');
INSERT INTO "public"."wp_postmeta" VALUES (18, 1, 'wp_review_bgcolor2', '#ffffff');
INSERT INTO "public"."wp_postmeta" VALUES (19, 1, 'wp_review_bordercolor', '#e7e7e7');
INSERT INTO "public"."wp_postmeta" VALUES (15, 1, 'wp_review_color', '#1e73be');
INSERT INTO "public"."wp_postmeta" VALUES (12, 1, 'wp_review_desc_title', 'Resumen');
INSERT INTO "public"."wp_postmeta" VALUES (16, 1, 'wp_review_fontcolor', '#555555');
INSERT INTO "public"."wp_postmeta" VALUES (10, 1, 'wp_review_location', 'bottom');
INSERT INTO "public"."wp_postmeta" VALUES (29, 1, 'wp_review_review_count', '0');
INSERT INTO "public"."wp_postmeta" VALUES (14, 1, 'wp_review_total', '0.0');
INSERT INTO "public"."wp_postmeta" VALUES (11, 1, 'wp_review_type', 'star');
INSERT INTO "public"."wp_postmeta" VALUES (13, 1, 'wp_review_userReview', '2');
INSERT INTO "public"."wp_postmeta" VALUES (28, 1, 'wp_review_user_reviews', '0');
INSERT INTO "public"."wp_postmeta" VALUES (20, 1, 'wp_review_user_review_type', 'star');
INSERT INTO "public"."wp_postmeta" VALUES (7, 1, '_edit_last', '1');
INSERT INTO "public"."wp_postmeta" VALUES (36, 1, '_wp_old_slug', 'hola-mundo');
INSERT INTO "public"."wp_postmeta" VALUES (6, 1, '_edit_lock', '1516814418:1');
COMMIT;

-- ----------------------------
-- Table structure for wp_posts
-- ----------------------------
DROP TABLE IF EXISTS "public"."wp_posts";
CREATE TABLE "public"."wp_posts" (
  "ID" int8 NOT NULL DEFAULT nextval(('wp_posts_seq'::text)::regclass),
  "post_author" int8 NOT NULL DEFAULT '0'::bigint,
  "post_date" timestamp(6) NOT NULL DEFAULT now(),
  "post_date_gmt" timestamp(6) NOT NULL DEFAULT timezone('gmt'::text, now()),
  "post_content" text COLLATE "pg_catalog"."default" NOT NULL,
  "post_title" text COLLATE "pg_catalog"."default" NOT NULL,
  "post_excerpt" text COLLATE "pg_catalog"."default" NOT NULL,
  "post_status" varchar(20) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'publish'::character varying,
  "comment_status" varchar(20) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'open'::character varying,
  "ping_status" varchar(20) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'open'::character varying,
  "post_password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "post_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "to_ping" text COLLATE "pg_catalog"."default" NOT NULL,
  "pinged" text COLLATE "pg_catalog"."default" NOT NULL,
  "post_modified" timestamp(6) NOT NULL DEFAULT now(),
  "post_modified_gmt" timestamp(6) NOT NULL DEFAULT timezone('gmt'::text, now()),
  "post_content_filtered" text COLLATE "pg_catalog"."default" NOT NULL,
  "post_parent" int8 NOT NULL DEFAULT '0'::bigint,
  "guid" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "menu_order" int4 NOT NULL DEFAULT 0,
  "post_type" varchar(20) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'post'::character varying,
  "post_mime_type" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "comment_count" int8 NOT NULL DEFAULT '0'::bigint
)
;
ALTER TABLE "public"."wp_posts" OWNER TO "postgres";

-- ----------------------------
-- Records of wp_posts
-- ----------------------------
BEGIN;
INSERT INTO "public"."wp_posts" VALUES (3, 1, '2018-01-24 15:07:40', '2018-01-24 15:07:41.214322', '', 'Borrador automático', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-01-24 15:07:40', '2018-01-24 15:07:41.214322', '', 0, 'http://localhost/portal-pg/?p=3', 0, 'post', '', 0);
INSERT INTO "public"."wp_posts" VALUES (1, 1, '2018-01-24 15:07:21', '2018-01-24 15:07:21', '<b>1 - ¿Qué es el feminismo?</b>

<span style="font-weight: 400;">El feminismo como movimiento filosófico empezó en  el siglo XVII y ha tenido varias transformaciones, sabores e interpretaciones a lo largo de la historia. Este movimiento cuestiona la situación de las mujeres en la sociedad, como han sido pensadas y como su sexo ha sido conceptualizado. El artículo </span><a href="http://www.mujeresenred.net/spip.php?article1397"><span style="font-weight: 400;">Feminismo: historia y corrientes</span></a><span style="font-weight: 400;"> describe las transformaciones por las que el movimiento ha pasado desde sus inicios hasta ahora.</span>

<span style="font-weight: 400;">A pesar de que las mujeres fueron parte de los grandes acontecimientos históricos, esta presencia fue más subordinada hacia objetivos más globales, relegándolas al ámbito privado de la familia y el hogar, dejando el espacio público exclusivamente para los hombres. Es a partir de la Revolución Francesa, ligada a la ideología de la racionalidad e igualdad, junto con la lucha por nuevas -y mejores- condiciones de trabajo generadas por la Revolución Industrial, que las mujeres empiezan a realizar una búsqueda más puntual de reivindicación de sus derechos, en el plano civil, político, educativo y laboral.</span>

<i><span style="font-weight: 400;">[ ...En el s. XIX, Flora Tristán vincula las reivindicaciones de la mujer con las luchas obreras. Publica en 1842 La Unión Obrera, donde presenta el primer proyecto de una Internacional de trabajadores, y expresa “la mujer es la proletaria del proletariado [...] hasta el más oprimido de los hombres quiere oprimir a otro ser: su mujer”. ]</span></i>

<span style="font-weight: 400;">Es importante notar que éste no es un movimiento homogéneo, sino que se ha nutrido (y se nutre) de diferentes ideologías transversales en la sociedad, pero en resumen es un movimiento integral político que refleja la lucha de las mujeres contra cualquier tipo de discriminación.  </span>

<span style="font-weight: 400;">Una de las discusiones alrededor del movimiento es:  si el feminismo busca la igualdad, </span><a href="http://porquetulodigas.tumblr.com/post/97974251633/si-el-feminismo-busca-la-igualdad-por-qu%C3%A9-se"><span style="font-weight: 400;">¿por qué se llama feminismo y no igualitarismo?</span></a>

<b>2 - Actualidad</b>

<span style="font-weight: 400;">En la actualidad se apunta mucho a los logros obtenidos por las mujeres y la mayor representatividad que existe de las mismas. Las mujeres </span><b>pueden en efecto estudiar</b><span style="font-weight: 400;">,</span><a href="http://www.unwomen.org/es/what-we-do/ending-violence-against-women/facts-and-figures#note"><span style="font-weight: 400;"> </span><i><span style="font-weight: 400;">[</span></i><i><span style="font-weight: 400;">En el entorno escolar, las pruebas señalan que las niñas están en situación de mayor riesgo de sufrir violencia sexual, acoso y explotación..]</span></i></a><span style="font-weight: 400;">, </span><b>tienen derechos civiles,</b><span style="font-weight: 400;"> </span><a href="http://www.ohchr.org/EN/Issues/Women/WRGS/Pages/WRGSIndex.aspx"><span style="font-weight: 400;">[</span><i><span style="font-weight: 400;">Aún millones de mujeres experimentan discriminación en la aplicación de sus derechos],</span></i></a><i><span style="font-weight: 400;"> </span></i><b>pueden acceder a cargos políticos y de liderazgo </b><a href="http://www.unwomen.org/es/what-we-do/leadership-and-political-participation/facts-and-figures"><i><span style="font-weight: 400;">[Alrededor del mundo, sólo un 22% de parlamentarios nacionales son mujeres]</span></i></a><i><span style="font-weight: 400;"> </span></i><span style="font-weight: 400;">, </span><b>tienen libertad sobre sus cuerpos</b><a href="http://www.unwomen.org/es/what-we-do/ending-violence-against-women/facts-and-figures#note"><span style="font-weight: 400;"> </span><i><span style="font-weight: 400;">[..</span></i><i><span style="font-weight: 400;">Se estima que 200 millones de niñas y mujeres han sufrido algún tipo de mutilación/ablación genital femenina en 30 países..]</span></i></a><i><span style="font-weight: 400;">.</span></i>

<span style="font-weight: 400;">Sin embargo, a pesar de esta percibida igualdad, aún existe discriminación y estamos lejos de reflejar una presencia igualitaria en diferentes instancias de la sociedad, más aún, la valoración de las mujeres por su físico y no por su capacidad, sigue siendo el común incluso en las sociedades occidentales [ver </span><a href="http://www.imdb.com/title/tt1784538/?ref_=tt_rec_tt"><span style="font-weight: 400;">Miss Representation</span></a><span style="font-weight: 400;">] y, aunado a esto el problema latente de la violencia contra mujeres y niñas, en sus diferentes formas.</span>

<b>3 - Datos y debates en torno al feminismo en Chile</b><span style="font-weight: 400;">:</span>
<ul>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Precursoras del Feminismo en Chile:  </span><a href="http://www.memoriachilena.cl/602/w3-article-95954.html"><span style="font-weight: 400;">http://www.memoriachilena.cl/602/w3-article-95954.html</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Femicidios en Chile al 2017: </span><a href="http://www.minmujeryeg.cl/femicidios/que-es/"><span style="font-weight: 400;">http://www.minmujeryeg.cl/femicidios/que-es/</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Violencia de Género en Chile. No hay refugio. </span><a href="http://www.quepasa.cl/articulo/actualidad/2017/06/no-hay-refugio.shtml/"><span style="font-weight: 400;">http://www.quepasa.cl/articulo/actualidad/2017/06/no-hay-refugio.shtml/</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Violencia en el pololeo. Un tema pendiente. </span><a href="http://www.elmostrador.cl/braga/2017/02/14/ley-de-violencia-intrafamiliar-las-razones-de-por-que-se-dejo-fuera-el-pololeo/"><span style="font-weight: 400;">h</span><span style="font-weight: 400;">ttp://www.elmostrador.cl/braga/2017/02/14/ley-de-violencia-intrafamiliar-las-razones-de-por-que-se-dejo-fuera-el-pololeo/</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Leyes integrales de violencia contra las mujeres en América Latina: el caso de Uruguay</span></li>
</ul>
<a href="http://www.bcn.cl/observatorio/americas/noticias/leyes-integrales-de-violencia-contra-las-mujeres-en-america-latina-el-caso-de-uruguay"><span style="font-weight: 400;">http://www.bcn.cl/observatorio/americas/noticias/leyes-integrales-de-violencia-contra-las-mujeres-en-america-latina-el-caso-de-uruguay</span></a>
<ul>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Mujer, normas desde 1990</span></li>
</ul>
<a href="https://www.leychile.cl/Consulta/listado_n_sel?_grupo_aporte=&amp;sub=828&amp;agr=2&amp;comp"><span style="font-weight: 400;">https://www.leychile.cl/Consulta/listado_n_sel?_grupo_aporte=&amp;sub=828&amp;agr=2&amp;comp</span></a><span style="font-weight: 400;">=</span>

<b>4 - Datos y debates en torno al feminismo en Ecuador</b>
<ul>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Mapa de femicidios por país: </span><a href="http://www.bbc.com/mundo/noticias-america-latina-37828573"><span style="font-weight: 400;">http://www.bbc.com/mundo/noticias-america-latina-37828573</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Casos de femicidio en Ecuador:</span></li>
 	<li style="font-weight: 400;"><a href="http://www.eluniverso.com/noticias/2017/01/24/nota/6014020/casos-femicidos-ecuador-se-han-duplicado-2017-segun-dinased"><span style="font-weight: 400;">http://www.eluniverso.com/noticias/2017/01/24/nota/6014020/casos-femicidos-ecuador-se-han-duplicado-2017-segun-dinased</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Equidad laboral: </span><a href="http://www.andes.info.ec/es/noticias/mujeres-luchan-equidad-laboral-ecuador.html"><span style="font-weight: 400;">http://www.andes.info.ec/es/noticias/mujeres-luchan-equidad-laboral-ecuador.html</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">El acoso sigue siendo pan de cada día en la sociedad ecuatoriana: </span><b>#PrimerAcoso #NoCallamosMás - </b><span style="font-weight: 400;">Grupo secreto en Facebook que tiene más de 27.000 miembros</span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Un link interesante acerca de las leyes machistas que han existido éstos últimos años en Ecuador: </span><a href="http://elecciones2017.gkillcity.com/2017/02/03/leyes-machistas-en-ecuador/"><span style="font-weight: 400;">http://elecciones2017.gkillcity.com/2017/02/03/leyes-machistas-en-ecuador/</span></a></li>
</ul>
<b>5 - El rol de los hombres en la lucha</b>

<span style="font-weight: 400;">Uno de los debates dentro de esta lucha, fue entender qué papel ocupan los hombres en la liberación de las mujeres y la lucha contra el sistema patriarcal en general. En ese sentido han existido debates muy interesantes acerca de si </span><a href="http://www.tribunafeminista.org/2017/01/el-papel-de-los-hombres-en-la-lucha-feminista/"><span style="font-weight: 400;">el rol de hombre rol en la lucha feminista es el de acompañamiento, solidaridad, apoyo y complicidad</span></a><span style="font-weight: 400;"> o si en realidad </span><a href="http://horizontal.mx/hombres-feministas-y-el-problema-del-privilegio-masculino/"><span style="font-weight: 400;">el hombre si puede ser considerado como feminista (a pesar de que la sociedad le atribuya privilegios)</span></a><i><span style="font-weight: 400;">.</span></i>

<i><span style="font-weight: 400;">[“Debemos evitar apropiarnos de la lucha relativa a las cuestiones de género. Siempre debemos ser conscientes de ello. La tentación existe debido a la tendencia dominante de los hombres. Debemos mantenernos vigilantes y recordar que ésta es una lucha que tienen que liderar las mujeres”. </span></i><i><span style="font-weight: 400;">Mbuyiselo Botha, Foro de hombres sudafricanos</span></i><i><span style="font-weight: 400;">]</span></i>

<b>Referencias para profundizar:</b>

<span style="font-weight: 400;">Si quieres conocer más, aquí hay algunos recursos con los que puedes empezar:</span>
<ul>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Feminism is for everybody, Bell Hooks </span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Todos deberíamos ser feministas, Chimamanda Ngozi Adichie</span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Teoría King Kong, Virginie Despentes</span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">El Segundo Sexo, Simone de Beauvoir</span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Feminismos populares: pedagogías y políticas, Claudia Korol (compiladora).</span></li>
 	<li style="font-weight: 400;"><a href="http://www.imdb.com/title/tt3319508/?ref_=tt_rec_tt"><span style="font-weight: 400;">She’s Beautiful when she’s angry.</span></a><span style="font-weight: 400;"> Documental</span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Talentos Ocultos, película.</span></li>
 	<li style="font-weight: 400;"><a href="https://masculinidades.wordpress.com/los-hombres-en-el-feminismo/"><span style="font-weight: 400;">Los hombres en el feminismo</span></a></li>
</ul>', '¿Qué es el feminismo?', '', 'publish', 'open', 'open', '', 'que-es-el-feminismo', '', '', '2018-01-24 17:01:43', '2018-01-24 17:01:43', '', 0, 'http://localhost/portal-pg/?p=1', 0, 'post', '', 1);
INSERT INTO "public"."wp_posts" VALUES (4, 1, '2018-01-24 15:23:10', '2018-01-24 15:23:10', '{
    "sidebars_widgets[sidebar]": {
        "value": [],
        "type": "option",
        "user_id": 1,
        "date_modified_gmt": "2018-01-24 15:23:10"
    }
}', '', '', 'trash', 'closed', 'closed', '', 'dc36ec41-8c9c-4a0a-bd50-e40daf9d3df1', '', '', '2018-01-24 15:23:10', '2018-01-24 15:23:10', '', 0, 'http://localhost/portal-pg/index.php/2018/01/24/dc36ec41-8c9c-4a0a-bd50-e40daf9d3df1/', 0, 'customize_changeset', '', 0);
INSERT INTO "public"."wp_posts" VALUES (5, 1, '2018-01-24 15:23:47', '2018-01-24 15:23:47', '{
    "blogdescription": {
        "value": "Portal del Pilar 3",
        "type": "option",
        "user_id": 1,
        "date_modified_gmt": "2018-01-24 15:23:47"
    }
}', '', '', 'trash', 'closed', 'closed', '', '2cd539af-95b2-4df7-af4d-eb136348c03f', '', '', '2018-01-24 15:23:47', '2018-01-24 15:23:47', '', 0, 'http://localhost/portal-pg/index.php/2018/01/24/2cd539af-95b2-4df7-af4d-eb136348c03f/', 0, 'customize_changeset', '', 0);
INSERT INTO "public"."wp_posts" VALUES (6, 1, '2018-01-24 16:47:26', '2018-01-24 16:47:26', '<b>1 - ¿Qué es el feminismo?</b>

&nbsp;

<span style="font-weight: 400;">El feminismo como movimiento filosófico empezó en  el siglo XVII y ha tenido varias transformaciones, sabores e interpretaciones a lo largo de la historia. Este movimiento cuestiona la situación de las mujeres en la sociedad, como han sido pensadas y como su sexo ha sido conceptualizado. El artículo </span><a href="http://www.mujeresenred.net/spip.php?article1397"><span style="font-weight: 400;">Feminismo: historia y corrientes</span></a><span style="font-weight: 400;"> describe las transformaciones por las que el movimiento ha pasado desde sus inicios hasta ahora.</span>

&nbsp;

<span style="font-weight: 400;">A pesar de que las mujeres fueron parte de los grandes acontecimientos históricos, esta presencia fue más subordinada hacia objetivos más globales, relegándolas al ámbito privado de la familia y el hogar, dejando el espacio público exclusivamente para los hombres. Es a partir de la Revolución Francesa, ligada a la ideología de la racionalidad e igualdad, junto con la lucha por nuevas -y mejores- condiciones de trabajo generadas por la Revolución Industrial, que las mujeres empiezan a realizar una búsqueda más puntual de reivindicación de sus derechos, en el plano civil, político, educativo y laboral.</span>

<i><span style="font-weight: 400;">[ ...En el s. XIX, Flora Tristán vincula las reivindicaciones de la mujer con las luchas obreras. Publica en 1842 La Unión Obrera, donde presenta el primer proyecto de una Internacional de trabajadores, y expresa “la mujer es la proletaria del proletariado [...] hasta el más oprimido de los hombres quiere oprimir a otro ser: su mujer”. ]</span></i>

<span style="font-weight: 400;">Es importante notar que éste no es un movimiento homogéneo, sino que se ha nutrido (y se nutre) de diferentes ideologías transversales en la sociedad, pero en resumen es un movimiento integral político que refleja la lucha de las mujeres contra cualquier tipo de discriminación.  </span>

<span style="font-weight: 400;">Una de las discusiones alrededor del movimiento es:  si el feminismo busca la igualdad, </span><a href="http://porquetulodigas.tumblr.com/post/97974251633/si-el-feminismo-busca-la-igualdad-por-qu%C3%A9-se"><span style="font-weight: 400;">¿por qué se llama feminismo y no igualitarismo?</span></a>

<b>2 - Actualidad</b>

<span style="font-weight: 400;">En la actualidad se apunta mucho a los logros obtenidos por las mujeres y la mayor representatividad que existe de las mismas. Las mujeres </span><b>pueden en efecto estudiar</b><span style="font-weight: 400;">,</span><a href="http://www.unwomen.org/es/what-we-do/ending-violence-against-women/facts-and-figures#note"><span style="font-weight: 400;"> </span><i><span style="font-weight: 400;">[</span></i><i><span style="font-weight: 400;">En el entorno escolar, las pruebas señalan que las niñas están en situación de mayor riesgo de sufrir violencia sexual, acoso y explotación..]</span></i></a><span style="font-weight: 400;">, </span><b>tienen derechos civiles,</b><span style="font-weight: 400;"> </span><a href="http://www.ohchr.org/EN/Issues/Women/WRGS/Pages/WRGSIndex.aspx"><span style="font-weight: 400;">[</span><i><span style="font-weight: 400;">Aún millones de mujeres experimentan discriminación en la aplicación de sus derechos],</span></i></a><i><span style="font-weight: 400;"> </span></i><b>pueden acceder a cargos políticos y de liderazgo </b><a href="http://www.unwomen.org/es/what-we-do/leadership-and-political-participation/facts-and-figures"><i><span style="font-weight: 400;">[Alrededor del mundo, sólo un 22% de parlamentarios nacionales son mujeres]</span></i></a><i><span style="font-weight: 400;"> </span></i><span style="font-weight: 400;">, </span><b>tienen libertad sobre sus cuerpos</b><a href="http://www.unwomen.org/es/what-we-do/ending-violence-against-women/facts-and-figures#note"><span style="font-weight: 400;"> </span><i><span style="font-weight: 400;">[..</span></i><i><span style="font-weight: 400;">Se estima que 200 millones de niñas y mujeres han sufrido algún tipo de mutilación/ablación genital femenina en 30 países..]</span></i></a><i><span style="font-weight: 400;">.</span></i>

<span style="font-weight: 400;">

</span>

<span style="font-weight: 400;">Sin embargo, a pesar de esta percibida igualdad, aún existe discriminación y estamos lejos de reflejar una presencia igualitaria en diferentes instancias de la sociedad, más aún, la valoración de las mujeres por su físico y no por su capacidad, sigue siendo el común incluso en las sociedades occidentales [ver </span><a href="http://www.imdb.com/title/tt1784538/?ref_=tt_rec_tt"><span style="font-weight: 400;">Miss Representation</span></a><span style="font-weight: 400;">] y, aunado a esto el problema latente de la violencia contra mujeres y niñas, en sus diferentes formas.</span>

&nbsp;

<b>

</b>

<b>3 - Datos y debates en torno al feminismo en Chile</b><span style="font-weight: 400;">:</span>

<span style="font-weight: 400;">

</span>
<ul>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Precursoras del Feminismo en Chile:  </span><a href="http://www.memoriachilena.cl/602/w3-article-95954.html"><span style="font-weight: 400;">http://www.memoriachilena.cl/602/w3-article-95954.html</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Femicidios en Chile al 2017: </span><a href="http://www.minmujeryeg.cl/femicidios/que-es/"><span style="font-weight: 400;">http://www.minmujeryeg.cl/femicidios/que-es/</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Violencia de Género en Chile. No hay refugio. </span><a href="http://www.quepasa.cl/articulo/actualidad/2017/06/no-hay-refugio.shtml/"><span style="font-weight: 400;">http://www.quepasa.cl/articulo/actualidad/2017/06/no-hay-refugio.shtml/</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Violencia en el pololeo. Un tema pendiente. </span><a href="http://www.elmostrador.cl/braga/2017/02/14/ley-de-violencia-intrafamiliar-las-razones-de-por-que-se-dejo-fuera-el-pololeo/"><span style="font-weight: 400;">h</span><span style="font-weight: 400;">ttp://www.elmostrador.cl/braga/2017/02/14/ley-de-violencia-intrafamiliar-las-razones-de-por-que-se-dejo-fuera-el-pololeo/</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Leyes integrales de violencia contra las mujeres en América Latina: el caso de Uruguay</span></li>
</ul>
<a href="http://www.bcn.cl/observatorio/americas/noticias/leyes-integrales-de-violencia-contra-las-mujeres-en-america-latina-el-caso-de-uruguay"><span style="font-weight: 400;">http://www.bcn.cl/observatorio/americas/noticias/leyes-integrales-de-violencia-contra-las-mujeres-en-america-latina-el-caso-de-uruguay</span></a>
<ul>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Mujer, normas desde 1990</span></li>
</ul>
<a href="https://www.leychile.cl/Consulta/listado_n_sel?_grupo_aporte=&amp;sub=828&amp;agr=2&amp;comp"><span style="font-weight: 400;">https://www.leychile.cl/Consulta/listado_n_sel?_grupo_aporte=&amp;sub=828&amp;agr=2&amp;comp</span></a><span style="font-weight: 400;">=</span>

&nbsp;

<b>4 - Datos y debates en torno al feminismo en Ecuador</b>

&nbsp;
<ul>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Mapa de femicidios por país: </span><a href="http://www.bbc.com/mundo/noticias-america-latina-37828573"><span style="font-weight: 400;">http://www.bbc.com/mundo/noticias-america-latina-37828573</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Casos de femicidio en Ecuador:</span></li>
 	<li style="font-weight: 400;"><a href="http://www.eluniverso.com/noticias/2017/01/24/nota/6014020/casos-femicidos-ecuador-se-han-duplicado-2017-segun-dinased"><span style="font-weight: 400;">http://www.eluniverso.com/noticias/2017/01/24/nota/6014020/casos-femicidos-ecuador-se-han-duplicado-2017-segun-dinased</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Equidad laboral: </span><a href="http://www.andes.info.ec/es/noticias/mujeres-luchan-equidad-laboral-ecuador.html"><span style="font-weight: 400;">http://www.andes.info.ec/es/noticias/mujeres-luchan-equidad-laboral-ecuador.html</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">El acoso sigue siendo pan de cada día en la sociedad ecuatoriana: </span><b>#PrimerAcoso #NoCallamosMás - </b><span style="font-weight: 400;">Grupo secreto en Facebook que tiene más de 27.000 miembros</span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Un link interesante acerca de las leyes machistas que han existido éstos últimos años en Ecuador: </span><a href="http://elecciones2017.gkillcity.com/2017/02/03/leyes-machistas-en-ecuador/"><span style="font-weight: 400;">http://elecciones2017.gkillcity.com/2017/02/03/leyes-machistas-en-ecuador/</span></a></li>
</ul>
&nbsp;

<b>5 - El rol de los hombres en la lucha</b>

<span style="font-weight: 400;">

</span>

<span style="font-weight: 400;">Uno de los debates dentro de esta lucha, fue entender qué papel ocupan los hombres en la liberación de las mujeres y la lucha contra el sistema patriarcal en general. En ese sentido han existido debates muy interesantes acerca de si </span><a href="http://www.tribunafeminista.org/2017/01/el-papel-de-los-hombres-en-la-lucha-feminista/"><span style="font-weight: 400;">el rol de hombre rol en la lucha feminista es el de acompañamiento, solidaridad, apoyo y complicidad</span></a><span style="font-weight: 400;"> o si en realidad </span><a href="http://horizontal.mx/hombres-feministas-y-el-problema-del-privilegio-masculino/"><span style="font-weight: 400;">el hombre si puede ser considerado como feminista (a pesar de que la sociedad le atribuya privilegios)</span></a><i><span style="font-weight: 400;">.</span></i>

&nbsp;

<i><span style="font-weight: 400;">[“Debemos evitar apropiarnos de la lucha relativa a las cuestiones de género. Siempre debemos ser conscientes de ello. La tentación existe debido a la tendencia dominante de los hombres. Debemos mantenernos vigilantes y recordar que ésta es una lucha que tienen que liderar las mujeres”. </span></i><i><span style="font-weight: 400;">Mbuyiselo Botha, Foro de hombres sudafricanos</span></i><i><span style="font-weight: 400;">]</span></i>

&nbsp;

<b>Referencias para profundizar:</b>

&nbsp;

<span style="font-weight: 400;">Si quieres conocer más, aquí hay algunos recursos con los que puedes empezar:</span>
<ul>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Feminism is for everybody, Bell Hooks </span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Todos deberíamos ser feministas, Chimamanda Ngozi Adichie</span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Teoría King Kong, Virginie Despentes</span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">El Segundo Sexo, Simone de Beauvoir</span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Feminismos populares: pedagogías y políticas, Claudia Korol (compiladora).</span></li>
 	<li style="font-weight: 400;"><a href="http://www.imdb.com/title/tt3319508/?ref_=tt_rec_tt"><span style="font-weight: 400;">She’s Beautiful when she’s angry.</span></a><span style="font-weight: 400;"> Documental</span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Talentos Ocultos, película.</span></li>
 	<li style="font-weight: 400;"><a href="https://masculinidades.wordpress.com/los-hombres-en-el-feminismo/"><span style="font-weight: 400;">Los hombres en el feminismo</span></a></li>
</ul>
&nbsp;', '¡Hola mundo!', '', 'inherit', 'closed', 'closed', '', '1-autosave-v1', '', '', '2018-01-24 16:47:26', '2018-01-24 16:47:26', '', 1, 'http://localhost/portal-pg/index.php/feminismo/2018/01/24/1-autosave-v1/', 0, 'revision', '', 0);
INSERT INTO "public"."wp_posts" VALUES (7, 1, '2018-01-24 16:48:06', '2018-01-24 16:48:06', '<b>1 - ¿Qué es el feminismo?</b>

&nbsp;

<span style="font-weight: 400;">El feminismo como movimiento filosófico empezó en  el siglo XVII y ha tenido varias transformaciones, sabores e interpretaciones a lo largo de la historia. Este movimiento cuestiona la situación de las mujeres en la sociedad, como han sido pensadas y como su sexo ha sido conceptualizado. El artículo </span><a href="http://www.mujeresenred.net/spip.php?article1397"><span style="font-weight: 400;">Feminismo: historia y corrientes</span></a><span style="font-weight: 400;"> describe las transformaciones por las que el movimiento ha pasado desde sus inicios hasta ahora.</span>

<span style="font-weight: 400;">A pesar de que las mujeres fueron parte de los grandes acontecimientos históricos, esta presencia fue más subordinada hacia objetivos más globales, relegándolas al ámbito privado de la familia y el hogar, dejando el espacio público exclusivamente para los hombres. Es a partir de la Revolución Francesa, ligada a la ideología de la racionalidad e igualdad, junto con la lucha por nuevas -y mejores- condiciones de trabajo generadas por la Revolución Industrial, que las mujeres empiezan a realizar una búsqueda más puntual de reivindicación de sus derechos, en el plano civil, político, educativo y laboral.</span>

<i><span style="font-weight: 400;">[ ...En el s. XIX, Flora Tristán vincula las reivindicaciones de la mujer con las luchas obreras. Publica en 1842 La Unión Obrera, donde presenta el primer proyecto de una Internacional de trabajadores, y expresa “la mujer es la proletaria del proletariado [...] hasta el más oprimido de los hombres quiere oprimir a otro ser: su mujer”. ]</span></i>

<span style="font-weight: 400;">Es importante notar que éste no es un movimiento homogéneo, sino que se ha nutrido (y se nutre) de diferentes ideologías transversales en la sociedad, pero en resumen es un movimiento integral político que refleja la lucha de las mujeres contra cualquier tipo de discriminación.  </span>

<span style="font-weight: 400;">Una de las discusiones alrededor del movimiento es:  si el feminismo busca la igualdad, </span><a href="http://porquetulodigas.tumblr.com/post/97974251633/si-el-feminismo-busca-la-igualdad-por-qu%C3%A9-se"><span style="font-weight: 400;">¿por qué se llama feminismo y no igualitarismo?</span></a>

<b>2 - Actualidad</b>

<span style="font-weight: 400;">En la actualidad se apunta mucho a los logros obtenidos por las mujeres y la mayor representatividad que existe de las mismas. Las mujeres </span><b>pueden en efecto estudiar</b><span style="font-weight: 400;">,</span><a href="http://www.unwomen.org/es/what-we-do/ending-violence-against-women/facts-and-figures#note"><span style="font-weight: 400;"> </span><i><span style="font-weight: 400;">[</span></i><i><span style="font-weight: 400;">En el entorno escolar, las pruebas señalan que las niñas están en situación de mayor riesgo de sufrir violencia sexual, acoso y explotación..]</span></i></a><span style="font-weight: 400;">, </span><b>tienen derechos civiles,</b><span style="font-weight: 400;"> </span><a href="http://www.ohchr.org/EN/Issues/Women/WRGS/Pages/WRGSIndex.aspx"><span style="font-weight: 400;">[</span><i><span style="font-weight: 400;">Aún millones de mujeres experimentan discriminación en la aplicación de sus derechos],</span></i></a><i><span style="font-weight: 400;"> </span></i><b>pueden acceder a cargos políticos y de liderazgo </b><a href="http://www.unwomen.org/es/what-we-do/leadership-and-political-participation/facts-and-figures"><i><span style="font-weight: 400;">[Alrededor del mundo, sólo un 22% de parlamentarios nacionales son mujeres]</span></i></a><i><span style="font-weight: 400;"> </span></i><span style="font-weight: 400;">, </span><b>tienen libertad sobre sus cuerpos</b><a href="http://www.unwomen.org/es/what-we-do/ending-violence-against-women/facts-and-figures#note"><span style="font-weight: 400;"> </span><i><span style="font-weight: 400;">[..</span></i><i><span style="font-weight: 400;">Se estima que 200 millones de niñas y mujeres han sufrido algún tipo de mutilación/ablación genital femenina en 30 países..]</span></i></a><i><span style="font-weight: 400;">.</span></i>

<span style="font-weight: 400;">

</span>

<span style="font-weight: 400;">Sin embargo, a pesar de esta percibida igualdad, aún existe discriminación y estamos lejos de reflejar una presencia igualitaria en diferentes instancias de la sociedad, más aún, la valoración de las mujeres por su físico y no por su capacidad, sigue siendo el común incluso en las sociedades occidentales [ver </span><a href="http://www.imdb.com/title/tt1784538/?ref_=tt_rec_tt"><span style="font-weight: 400;">Miss Representation</span></a><span style="font-weight: 400;">] y, aunado a esto el problema latente de la violencia contra mujeres y niñas, en sus diferentes formas.</span>

<b>3 - Datos y debates en torno al feminismo en Chile</b><span style="font-weight: 400;">:</span>
<ul>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Precursoras del Feminismo en Chile:  </span><a href="http://www.memoriachilena.cl/602/w3-article-95954.html"><span style="font-weight: 400;">http://www.memoriachilena.cl/602/w3-article-95954.html</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Femicidios en Chile al 2017: </span><a href="http://www.minmujeryeg.cl/femicidios/que-es/"><span style="font-weight: 400;">http://www.minmujeryeg.cl/femicidios/que-es/</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Violencia de Género en Chile. No hay refugio. </span><a href="http://www.quepasa.cl/articulo/actualidad/2017/06/no-hay-refugio.shtml/"><span style="font-weight: 400;">http://www.quepasa.cl/articulo/actualidad/2017/06/no-hay-refugio.shtml/</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Violencia en el pololeo. Un tema pendiente. </span><a href="http://www.elmostrador.cl/braga/2017/02/14/ley-de-violencia-intrafamiliar-las-razones-de-por-que-se-dejo-fuera-el-pololeo/"><span style="font-weight: 400;">h</span><span style="font-weight: 400;">ttp://www.elmostrador.cl/braga/2017/02/14/ley-de-violencia-intrafamiliar-las-razones-de-por-que-se-dejo-fuera-el-pololeo/</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Leyes integrales de violencia contra las mujeres en América Latina: el caso de Uruguay</span></li>
</ul>
<a href="http://www.bcn.cl/observatorio/americas/noticias/leyes-integrales-de-violencia-contra-las-mujeres-en-america-latina-el-caso-de-uruguay"><span style="font-weight: 400;">http://www.bcn.cl/observatorio/americas/noticias/leyes-integrales-de-violencia-contra-las-mujeres-en-america-latina-el-caso-de-uruguay</span></a>
<ul>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Mujer, normas desde 1990</span></li>
</ul>
<a href="https://www.leychile.cl/Consulta/listado_n_sel?_grupo_aporte=&amp;sub=828&amp;agr=2&amp;comp"><span style="font-weight: 400;">https://www.leychile.cl/Consulta/listado_n_sel?_grupo_aporte=&amp;sub=828&amp;agr=2&amp;comp</span></a><span style="font-weight: 400;">=</span>

<b>4 - Datos y debates en torno al feminismo en Ecuador</b>
<ul>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Mapa de femicidios por país: </span><a href="http://www.bbc.com/mundo/noticias-america-latina-37828573"><span style="font-weight: 400;">http://www.bbc.com/mundo/noticias-america-latina-37828573</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Casos de femicidio en Ecuador:</span></li>
 	<li style="font-weight: 400;"><a href="http://www.eluniverso.com/noticias/2017/01/24/nota/6014020/casos-femicidos-ecuador-se-han-duplicado-2017-segun-dinased"><span style="font-weight: 400;">http://www.eluniverso.com/noticias/2017/01/24/nota/6014020/casos-femicidos-ecuador-se-han-duplicado-2017-segun-dinased</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Equidad laboral: </span><a href="http://www.andes.info.ec/es/noticias/mujeres-luchan-equidad-laboral-ecuador.html"><span style="font-weight: 400;">http://www.andes.info.ec/es/noticias/mujeres-luchan-equidad-laboral-ecuador.html</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">El acoso sigue siendo pan de cada día en la sociedad ecuatoriana: </span><b>#PrimerAcoso #NoCallamosMás - </b><span style="font-weight: 400;">Grupo secreto en Facebook que tiene más de 27.000 miembros</span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Un link interesante acerca de las leyes machistas que han existido éstos últimos años en Ecuador: </span><a href="http://elecciones2017.gkillcity.com/2017/02/03/leyes-machistas-en-ecuador/"><span style="font-weight: 400;">http://elecciones2017.gkillcity.com/2017/02/03/leyes-machistas-en-ecuador/</span></a></li>
</ul>
<b>5 - El rol de los hombres en la lucha</b>

<span style="font-weight: 400;">Uno de los debates dentro de esta lucha, fue entender qué papel ocupan los hombres en la liberación de las mujeres y la lucha contra el sistema patriarcal en general. En ese sentido han existido debates muy interesantes acerca de si </span><a href="http://www.tribunafeminista.org/2017/01/el-papel-de-los-hombres-en-la-lucha-feminista/"><span style="font-weight: 400;">el rol de hombre rol en la lucha feminista es el de acompañamiento, solidaridad, apoyo y complicidad</span></a><span style="font-weight: 400;"> o si en realidad </span><a href="http://horizontal.mx/hombres-feministas-y-el-problema-del-privilegio-masculino/"><span style="font-weight: 400;">el hombre si puede ser considerado como feminista (a pesar de que la sociedad le atribuya privilegios)</span></a><i><span style="font-weight: 400;">.</span></i>

<i><span style="font-weight: 400;">[“Debemos evitar apropiarnos de la lucha relativa a las cuestiones de género. Siempre debemos ser conscientes de ello. La tentación existe debido a la tendencia dominante de los hombres. Debemos mantenernos vigilantes y recordar que ésta es una lucha que tienen que liderar las mujeres”. </span></i><i><span style="font-weight: 400;">Mbuyiselo Botha, Foro de hombres sudafricanos</span></i><i><span style="font-weight: 400;">]</span></i>

<b>Referencias para profundizar:</b>

<span style="font-weight: 400;">Si quieres conocer más, aquí hay algunos recursos con los que puedes empezar:</span>
<ul>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Feminism is for everybody, Bell Hooks </span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Todos deberíamos ser feministas, Chimamanda Ngozi Adichie</span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Teoría King Kong, Virginie Despentes</span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">El Segundo Sexo, Simone de Beauvoir</span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Feminismos populares: pedagogías y políticas, Claudia Korol (compiladora).</span></li>
 	<li style="font-weight: 400;"><a href="http://www.imdb.com/title/tt3319508/?ref_=tt_rec_tt"><span style="font-weight: 400;">She’s Beautiful when she’s angry.</span></a><span style="font-weight: 400;"> Documental</span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Talentos Ocultos, película.</span></li>
 	<li style="font-weight: 400;"><a href="https://masculinidades.wordpress.com/los-hombres-en-el-feminismo/"><span style="font-weight: 400;">Los hombres en el feminismo</span></a></li>
</ul>', '¡Hola mundo!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2018-01-24 16:48:06', '2018-01-24 16:48:06', '', 1, 'http://localhost/portal-pg/index.php/feminismo/2018/01/24/1-revision-v1/', 0, 'revision', '', 0);
INSERT INTO "public"."wp_posts" VALUES (8, 1, '2018-01-24 16:48:27', '2018-01-24 16:48:27', '<b>1 - ¿Qué es el feminismo?</b>

<span style="font-weight: 400;">El feminismo como movimiento filosófico empezó en  el siglo XVII y ha tenido varias transformaciones, sabores e interpretaciones a lo largo de la historia. Este movimiento cuestiona la situación de las mujeres en la sociedad, como han sido pensadas y como su sexo ha sido conceptualizado. El artículo </span><a href="http://www.mujeresenred.net/spip.php?article1397"><span style="font-weight: 400;">Feminismo: historia y corrientes</span></a><span style="font-weight: 400;"> describe las transformaciones por las que el movimiento ha pasado desde sus inicios hasta ahora.</span>

<span style="font-weight: 400;">A pesar de que las mujeres fueron parte de los grandes acontecimientos históricos, esta presencia fue más subordinada hacia objetivos más globales, relegándolas al ámbito privado de la familia y el hogar, dejando el espacio público exclusivamente para los hombres. Es a partir de la Revolución Francesa, ligada a la ideología de la racionalidad e igualdad, junto con la lucha por nuevas -y mejores- condiciones de trabajo generadas por la Revolución Industrial, que las mujeres empiezan a realizar una búsqueda más puntual de reivindicación de sus derechos, en el plano civil, político, educativo y laboral.</span>

<i><span style="font-weight: 400;">[ ...En el s. XIX, Flora Tristán vincula las reivindicaciones de la mujer con las luchas obreras. Publica en 1842 La Unión Obrera, donde presenta el primer proyecto de una Internacional de trabajadores, y expresa “la mujer es la proletaria del proletariado [...] hasta el más oprimido de los hombres quiere oprimir a otro ser: su mujer”. ]</span></i>

<span style="font-weight: 400;">Es importante notar que éste no es un movimiento homogéneo, sino que se ha nutrido (y se nutre) de diferentes ideologías transversales en la sociedad, pero en resumen es un movimiento integral político que refleja la lucha de las mujeres contra cualquier tipo de discriminación.  </span>

<span style="font-weight: 400;">Una de las discusiones alrededor del movimiento es:  si el feminismo busca la igualdad, </span><a href="http://porquetulodigas.tumblr.com/post/97974251633/si-el-feminismo-busca-la-igualdad-por-qu%C3%A9-se"><span style="font-weight: 400;">¿por qué se llama feminismo y no igualitarismo?</span></a>

<b>2 - Actualidad</b>

<span style="font-weight: 400;">En la actualidad se apunta mucho a los logros obtenidos por las mujeres y la mayor representatividad que existe de las mismas. Las mujeres </span><b>pueden en efecto estudiar</b><span style="font-weight: 400;">,</span><a href="http://www.unwomen.org/es/what-we-do/ending-violence-against-women/facts-and-figures#note"><span style="font-weight: 400;"> </span><i><span style="font-weight: 400;">[</span></i><i><span style="font-weight: 400;">En el entorno escolar, las pruebas señalan que las niñas están en situación de mayor riesgo de sufrir violencia sexual, acoso y explotación..]</span></i></a><span style="font-weight: 400;">, </span><b>tienen derechos civiles,</b><span style="font-weight: 400;"> </span><a href="http://www.ohchr.org/EN/Issues/Women/WRGS/Pages/WRGSIndex.aspx"><span style="font-weight: 400;">[</span><i><span style="font-weight: 400;">Aún millones de mujeres experimentan discriminación en la aplicación de sus derechos],</span></i></a><i><span style="font-weight: 400;"> </span></i><b>pueden acceder a cargos políticos y de liderazgo </b><a href="http://www.unwomen.org/es/what-we-do/leadership-and-political-participation/facts-and-figures"><i><span style="font-weight: 400;">[Alrededor del mundo, sólo un 22% de parlamentarios nacionales son mujeres]</span></i></a><i><span style="font-weight: 400;"> </span></i><span style="font-weight: 400;">, </span><b>tienen libertad sobre sus cuerpos</b><a href="http://www.unwomen.org/es/what-we-do/ending-violence-against-women/facts-and-figures#note"><span style="font-weight: 400;"> </span><i><span style="font-weight: 400;">[..</span></i><i><span style="font-weight: 400;">Se estima que 200 millones de niñas y mujeres han sufrido algún tipo de mutilación/ablación genital femenina en 30 países..]</span></i></a><i><span style="font-weight: 400;">.</span></i>

&nbsp;

&nbsp;

<span style="font-weight: 400;">Sin embargo, a pesar de esta percibida igualdad, aún existe discriminación y estamos lejos de reflejar una presencia igualitaria en diferentes instancias de la sociedad, más aún, la valoración de las mujeres por su físico y no por su capacidad, sigue siendo el común incluso en las sociedades occidentales [ver </span><a href="http://www.imdb.com/title/tt1784538/?ref_=tt_rec_tt"><span style="font-weight: 400;">Miss Representation</span></a><span style="font-weight: 400;">] y, aunado a esto el problema latente de la violencia contra mujeres y niñas, en sus diferentes formas.</span>

<b>3 - Datos y debates en torno al feminismo en Chile</b><span style="font-weight: 400;">:</span>
<ul>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Precursoras del Feminismo en Chile:  </span><a href="http://www.memoriachilena.cl/602/w3-article-95954.html"><span style="font-weight: 400;">http://www.memoriachilena.cl/602/w3-article-95954.html</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Femicidios en Chile al 2017: </span><a href="http://www.minmujeryeg.cl/femicidios/que-es/"><span style="font-weight: 400;">http://www.minmujeryeg.cl/femicidios/que-es/</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Violencia de Género en Chile. No hay refugio. </span><a href="http://www.quepasa.cl/articulo/actualidad/2017/06/no-hay-refugio.shtml/"><span style="font-weight: 400;">http://www.quepasa.cl/articulo/actualidad/2017/06/no-hay-refugio.shtml/</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Violencia en el pololeo. Un tema pendiente. </span><a href="http://www.elmostrador.cl/braga/2017/02/14/ley-de-violencia-intrafamiliar-las-razones-de-por-que-se-dejo-fuera-el-pololeo/"><span style="font-weight: 400;">h</span><span style="font-weight: 400;">ttp://www.elmostrador.cl/braga/2017/02/14/ley-de-violencia-intrafamiliar-las-razones-de-por-que-se-dejo-fuera-el-pololeo/</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Leyes integrales de violencia contra las mujeres en América Latina: el caso de Uruguay</span></li>
</ul>
<a href="http://www.bcn.cl/observatorio/americas/noticias/leyes-integrales-de-violencia-contra-las-mujeres-en-america-latina-el-caso-de-uruguay"><span style="font-weight: 400;">http://www.bcn.cl/observatorio/americas/noticias/leyes-integrales-de-violencia-contra-las-mujeres-en-america-latina-el-caso-de-uruguay</span></a>
<ul>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Mujer, normas desde 1990</span></li>
</ul>
<a href="https://www.leychile.cl/Consulta/listado_n_sel?_grupo_aporte=&amp;sub=828&amp;agr=2&amp;comp"><span style="font-weight: 400;">https://www.leychile.cl/Consulta/listado_n_sel?_grupo_aporte=&amp;sub=828&amp;agr=2&amp;comp</span></a><span style="font-weight: 400;">=</span>

<b>4 - Datos y debates en torno al feminismo en Ecuador</b>
<ul>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Mapa de femicidios por país: </span><a href="http://www.bbc.com/mundo/noticias-america-latina-37828573"><span style="font-weight: 400;">http://www.bbc.com/mundo/noticias-america-latina-37828573</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Casos de femicidio en Ecuador:</span></li>
 	<li style="font-weight: 400;"><a href="http://www.eluniverso.com/noticias/2017/01/24/nota/6014020/casos-femicidos-ecuador-se-han-duplicado-2017-segun-dinased"><span style="font-weight: 400;">http://www.eluniverso.com/noticias/2017/01/24/nota/6014020/casos-femicidos-ecuador-se-han-duplicado-2017-segun-dinased</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Equidad laboral: </span><a href="http://www.andes.info.ec/es/noticias/mujeres-luchan-equidad-laboral-ecuador.html"><span style="font-weight: 400;">http://www.andes.info.ec/es/noticias/mujeres-luchan-equidad-laboral-ecuador.html</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">El acoso sigue siendo pan de cada día en la sociedad ecuatoriana: </span><b>#PrimerAcoso #NoCallamosMás - </b><span style="font-weight: 400;">Grupo secreto en Facebook que tiene más de 27.000 miembros</span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Un link interesante acerca de las leyes machistas que han existido éstos últimos años en Ecuador: </span><a href="http://elecciones2017.gkillcity.com/2017/02/03/leyes-machistas-en-ecuador/"><span style="font-weight: 400;">http://elecciones2017.gkillcity.com/2017/02/03/leyes-machistas-en-ecuador/</span></a></li>
</ul>
<b>5 - El rol de los hombres en la lucha</b>

<span style="font-weight: 400;">Uno de los debates dentro de esta lucha, fue entender qué papel ocupan los hombres en la liberación de las mujeres y la lucha contra el sistema patriarcal en general. En ese sentido han existido debates muy interesantes acerca de si </span><a href="http://www.tribunafeminista.org/2017/01/el-papel-de-los-hombres-en-la-lucha-feminista/"><span style="font-weight: 400;">el rol de hombre rol en la lucha feminista es el de acompañamiento, solidaridad, apoyo y complicidad</span></a><span style="font-weight: 400;"> o si en realidad </span><a href="http://horizontal.mx/hombres-feministas-y-el-problema-del-privilegio-masculino/"><span style="font-weight: 400;">el hombre si puede ser considerado como feminista (a pesar de que la sociedad le atribuya privilegios)</span></a><i><span style="font-weight: 400;">.</span></i>

<i><span style="font-weight: 400;">[“Debemos evitar apropiarnos de la lucha relativa a las cuestiones de género. Siempre debemos ser conscientes de ello. La tentación existe debido a la tendencia dominante de los hombres. Debemos mantenernos vigilantes y recordar que ésta es una lucha que tienen que liderar las mujeres”. </span></i><i><span style="font-weight: 400;">Mbuyiselo Botha, Foro de hombres sudafricanos</span></i><i><span style="font-weight: 400;">]</span></i>

<b>Referencias para profundizar:</b>

<span style="font-weight: 400;">Si quieres conocer más, aquí hay algunos recursos con los que puedes empezar:</span>
<ul>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Feminism is for everybody, Bell Hooks </span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Todos deberíamos ser feministas, Chimamanda Ngozi Adichie</span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Teoría King Kong, Virginie Despentes</span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">El Segundo Sexo, Simone de Beauvoir</span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Feminismos populares: pedagogías y políticas, Claudia Korol (compiladora).</span></li>
 	<li style="font-weight: 400;"><a href="http://www.imdb.com/title/tt3319508/?ref_=tt_rec_tt"><span style="font-weight: 400;">She’s Beautiful when she’s angry.</span></a><span style="font-weight: 400;"> Documental</span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Talentos Ocultos, película.</span></li>
 	<li style="font-weight: 400;"><a href="https://masculinidades.wordpress.com/los-hombres-en-el-feminismo/"><span style="font-weight: 400;">Los hombres en el feminismo</span></a></li>
</ul>', '¿Qué es el feminismo?', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2018-01-24 16:48:27', '2018-01-24 16:48:27', '', 1, 'http://localhost/portal-pg/index.php/feminismo/2018/01/24/1-revision-v1/', 0, 'revision', '', 0);
INSERT INTO "public"."wp_posts" VALUES (9, 1, '2018-01-24 16:50:42', '2018-01-24 16:50:42', '<b>1 - ¿Qué es el feminismo?</b>

<span style="font-weight: 400;">El feminismo como movimiento filosófico empezó en  el siglo XVII y ha tenido varias transformaciones, sabores e interpretaciones a lo largo de la historia. Este movimiento cuestiona la situación de las mujeres en la sociedad, como han sido pensadas y como su sexo ha sido conceptualizado. El artículo </span><a href="http://www.mujeresenred.net/spip.php?article1397"><span style="font-weight: 400;">Feminismo: historia y corrientes</span></a><span style="font-weight: 400;"> describe las transformaciones por las que el movimiento ha pasado desde sus inicios hasta ahora.</span>

<span style="font-weight: 400;">A pesar de que las mujeres fueron parte de los grandes acontecimientos históricos, esta presencia fue más subordinada hacia objetivos más globales, relegándolas al ámbito privado de la familia y el hogar, dejando el espacio público exclusivamente para los hombres. Es a partir de la Revolución Francesa, ligada a la ideología de la racionalidad e igualdad, junto con la lucha por nuevas -y mejores- condiciones de trabajo generadas por la Revolución Industrial, que las mujeres empiezan a realizar una búsqueda más puntual de reivindicación de sus derechos, en el plano civil, político, educativo y laboral.</span>

<i><span style="font-weight: 400;">[ ...En el s. XIX, Flora Tristán vincula las reivindicaciones de la mujer con las luchas obreras. Publica en 1842 La Unión Obrera, donde presenta el primer proyecto de una Internacional de trabajadores, y expresa “la mujer es la proletaria del proletariado [...] hasta el más oprimido de los hombres quiere oprimir a otro ser: su mujer”. ]</span></i>

<span style="font-weight: 400;">Es importante notar que éste no es un movimiento homogéneo, sino que se ha nutrido (y se nutre) de diferentes ideologías transversales en la sociedad, pero en resumen es un movimiento integral político que refleja la lucha de las mujeres contra cualquier tipo de discriminación.  </span>

<span style="font-weight: 400;">Una de las discusiones alrededor del movimiento es:  si el feminismo busca la igualdad, </span><a href="http://porquetulodigas.tumblr.com/post/97974251633/si-el-feminismo-busca-la-igualdad-por-qu%C3%A9-se"><span style="font-weight: 400;">¿por qué se llama feminismo y no igualitarismo?</span></a>

<b>2 - Actualidad</b>

<span style="font-weight: 400;">En la actualidad se apunta mucho a los logros obtenidos por las mujeres y la mayor representatividad que existe de las mismas. Las mujeres </span><b>pueden en efecto estudiar</b><span style="font-weight: 400;">,</span><a href="http://www.unwomen.org/es/what-we-do/ending-violence-against-women/facts-and-figures#note"><span style="font-weight: 400;"> </span><i><span style="font-weight: 400;">[</span></i><i><span style="font-weight: 400;">En el entorno escolar, las pruebas señalan que las niñas están en situación de mayor riesgo de sufrir violencia sexual, acoso y explotación..]</span></i></a><span style="font-weight: 400;">, </span><b>tienen derechos civiles,</b><span style="font-weight: 400;"> </span><a href="http://www.ohchr.org/EN/Issues/Women/WRGS/Pages/WRGSIndex.aspx"><span style="font-weight: 400;">[</span><i><span style="font-weight: 400;">Aún millones de mujeres experimentan discriminación en la aplicación de sus derechos],</span></i></a><i><span style="font-weight: 400;"> </span></i><b>pueden acceder a cargos políticos y de liderazgo </b><a href="http://www.unwomen.org/es/what-we-do/leadership-and-political-participation/facts-and-figures"><i><span style="font-weight: 400;">[Alrededor del mundo, sólo un 22% de parlamentarios nacionales son mujeres]</span></i></a><i><span style="font-weight: 400;"> </span></i><span style="font-weight: 400;">, </span><b>tienen libertad sobre sus cuerpos</b><a href="http://www.unwomen.org/es/what-we-do/ending-violence-against-women/facts-and-figures#note"><span style="font-weight: 400;"> </span><i><span style="font-weight: 400;">[..</span></i><i><span style="font-weight: 400;">Se estima que 200 millones de niñas y mujeres han sufrido algún tipo de mutilación/ablación genital femenina en 30 países..]</span></i></a><i><span style="font-weight: 400;">.</span></i>

<span style="font-weight: 400;">Sin embargo, a pesar de esta percibida igualdad, aún existe discriminación y estamos lejos de reflejar una presencia igualitaria en diferentes instancias de la sociedad, más aún, la valoración de las mujeres por su físico y no por su capacidad, sigue siendo el común incluso en las sociedades occidentales [ver </span><a href="http://www.imdb.com/title/tt1784538/?ref_=tt_rec_tt"><span style="font-weight: 400;">Miss Representation</span></a><span style="font-weight: 400;">] y, aunado a esto el problema latente de la violencia contra mujeres y niñas, en sus diferentes formas.</span>

<b>3 - Datos y debates en torno al feminismo en Chile</b><span style="font-weight: 400;">:</span>
<ul>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Precursoras del Feminismo en Chile:  </span><a href="http://www.memoriachilena.cl/602/w3-article-95954.html"><span style="font-weight: 400;">http://www.memoriachilena.cl/602/w3-article-95954.html</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Femicidios en Chile al 2017: </span><a href="http://www.minmujeryeg.cl/femicidios/que-es/"><span style="font-weight: 400;">http://www.minmujeryeg.cl/femicidios/que-es/</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Violencia de Género en Chile. No hay refugio. </span><a href="http://www.quepasa.cl/articulo/actualidad/2017/06/no-hay-refugio.shtml/"><span style="font-weight: 400;">http://www.quepasa.cl/articulo/actualidad/2017/06/no-hay-refugio.shtml/</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Violencia en el pololeo. Un tema pendiente. </span><a href="http://www.elmostrador.cl/braga/2017/02/14/ley-de-violencia-intrafamiliar-las-razones-de-por-que-se-dejo-fuera-el-pololeo/"><span style="font-weight: 400;">h</span><span style="font-weight: 400;">ttp://www.elmostrador.cl/braga/2017/02/14/ley-de-violencia-intrafamiliar-las-razones-de-por-que-se-dejo-fuera-el-pololeo/</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Leyes integrales de violencia contra las mujeres en América Latina: el caso de Uruguay</span></li>
</ul>
<a href="http://www.bcn.cl/observatorio/americas/noticias/leyes-integrales-de-violencia-contra-las-mujeres-en-america-latina-el-caso-de-uruguay"><span style="font-weight: 400;">http://www.bcn.cl/observatorio/americas/noticias/leyes-integrales-de-violencia-contra-las-mujeres-en-america-latina-el-caso-de-uruguay</span></a>
<ul>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Mujer, normas desde 1990</span></li>
</ul>
<a href="https://www.leychile.cl/Consulta/listado_n_sel?_grupo_aporte=&amp;sub=828&amp;agr=2&amp;comp"><span style="font-weight: 400;">https://www.leychile.cl/Consulta/listado_n_sel?_grupo_aporte=&amp;sub=828&amp;agr=2&amp;comp</span></a><span style="font-weight: 400;">=</span>

<b>4 - Datos y debates en torno al feminismo en Ecuador</b>
<ul>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Mapa de femicidios por país: </span><a href="http://www.bbc.com/mundo/noticias-america-latina-37828573"><span style="font-weight: 400;">http://www.bbc.com/mundo/noticias-america-latina-37828573</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Casos de femicidio en Ecuador:</span></li>
 	<li style="font-weight: 400;"><a href="http://www.eluniverso.com/noticias/2017/01/24/nota/6014020/casos-femicidos-ecuador-se-han-duplicado-2017-segun-dinased"><span style="font-weight: 400;">http://www.eluniverso.com/noticias/2017/01/24/nota/6014020/casos-femicidos-ecuador-se-han-duplicado-2017-segun-dinased</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Equidad laboral: </span><a href="http://www.andes.info.ec/es/noticias/mujeres-luchan-equidad-laboral-ecuador.html"><span style="font-weight: 400;">http://www.andes.info.ec/es/noticias/mujeres-luchan-equidad-laboral-ecuador.html</span></a></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">El acoso sigue siendo pan de cada día en la sociedad ecuatoriana: </span><b>#PrimerAcoso #NoCallamosMás - </b><span style="font-weight: 400;">Grupo secreto en Facebook que tiene más de 27.000 miembros</span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Un link interesante acerca de las leyes machistas que han existido éstos últimos años en Ecuador: </span><a href="http://elecciones2017.gkillcity.com/2017/02/03/leyes-machistas-en-ecuador/"><span style="font-weight: 400;">http://elecciones2017.gkillcity.com/2017/02/03/leyes-machistas-en-ecuador/</span></a></li>
</ul>
<b>5 - El rol de los hombres en la lucha</b>

<span style="font-weight: 400;">Uno de los debates dentro de esta lucha, fue entender qué papel ocupan los hombres en la liberación de las mujeres y la lucha contra el sistema patriarcal en general. En ese sentido han existido debates muy interesantes acerca de si </span><a href="http://www.tribunafeminista.org/2017/01/el-papel-de-los-hombres-en-la-lucha-feminista/"><span style="font-weight: 400;">el rol de hombre rol en la lucha feminista es el de acompañamiento, solidaridad, apoyo y complicidad</span></a><span style="font-weight: 400;"> o si en realidad </span><a href="http://horizontal.mx/hombres-feministas-y-el-problema-del-privilegio-masculino/"><span style="font-weight: 400;">el hombre si puede ser considerado como feminista (a pesar de que la sociedad le atribuya privilegios)</span></a><i><span style="font-weight: 400;">.</span></i>

<i><span style="font-weight: 400;">[“Debemos evitar apropiarnos de la lucha relativa a las cuestiones de género. Siempre debemos ser conscientes de ello. La tentación existe debido a la tendencia dominante de los hombres. Debemos mantenernos vigilantes y recordar que ésta es una lucha que tienen que liderar las mujeres”. </span></i><i><span style="font-weight: 400;">Mbuyiselo Botha, Foro de hombres sudafricanos</span></i><i><span style="font-weight: 400;">]</span></i>

<b>Referencias para profundizar:</b>

<span style="font-weight: 400;">Si quieres conocer más, aquí hay algunos recursos con los que puedes empezar:</span>
<ul>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Feminism is for everybody, Bell Hooks </span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Todos deberíamos ser feministas, Chimamanda Ngozi Adichie</span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Teoría King Kong, Virginie Despentes</span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">El Segundo Sexo, Simone de Beauvoir</span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Feminismos populares: pedagogías y políticas, Claudia Korol (compiladora).</span></li>
 	<li style="font-weight: 400;"><a href="http://www.imdb.com/title/tt3319508/?ref_=tt_rec_tt"><span style="font-weight: 400;">She’s Beautiful when she’s angry.</span></a><span style="font-weight: 400;"> Documental</span></li>
 	<li style="font-weight: 400;"><span style="font-weight: 400;">Talentos Ocultos, película.</span></li>
 	<li style="font-weight: 400;"><a href="https://masculinidades.wordpress.com/los-hombres-en-el-feminismo/"><span style="font-weight: 400;">Los hombres en el feminismo</span></a></li>
</ul>', '¿Qué es el feminismo?', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2018-01-24 16:50:42', '2018-01-24 16:50:42', '', 1, 'http://localhost/portal-pg/index.php/feminismo/2018/01/24/1-revision-v1/', 0, 'revision', '', 0);
INSERT INTO "public"."wp_posts" VALUES (2, 1, '2018-01-24 15:07:21', '2018-01-24 15:07:21', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras pulvinar mattis nunc sed. Malesuada fames ac turpis egestas integer eget. Maecenas sed enim ut sem viverra aliquet. Viverra suspendisse potenti nullam ac tortor vitae purus. Velit ut tortor pretium viverra. In iaculis nunc sed augue lacus viverra. Posuere lorem ipsum dolor sit amet consectetur. Nibh praesent tristique magna sit amet purus. Tincidunt ornare massa eget egestas purus viverra accumsan in nisl. Varius morbi enim nunc faucibus a pellentesque sit. Porttitor eget dolor morbi non arcu risus. Leo vel fringilla est ullamcorper eget nulla. Ante metus dictum at tempor commodo ullamcorper. Sem nulla pharetra diam sit amet nisl. Lacus suspendisse faucibus interdum posuere lorem ipsum dolor sit amet. Sit amet volutpat consequat mauris nunc congue nisi vitae suscipit. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci a. Auctor urna nunc id cursus metus. Magna ac placerat vestibulum lectus mauris.

Fermentum dui faucibus in ornare quam viverra orci sagittis. Tristique senectus et netus et malesuada fames ac. Vitae justo eget magna fermentum iaculis eu non diam. Rutrum quisque non tellus orci ac auctor augue mauris. Blandit massa enim nec dui nunc. Laoreet non curabitur gravida arcu ac tortor dignissim convallis. Elementum tempus egestas sed sed risus. Diam maecenas ultricies mi eget mauris pharetra et ultrices neque. Tincidunt eget nullam non nisi. Dapibus ultrices in iaculis nunc. Aliquam sem fringilla ut morbi. Pellentesque habitant morbi tristique senectus. Eu nisl nunc mi ipsum. Netus et malesuada fames ac turpis egestas sed. Dictumst quisque sagittis purus sit amet volutpat consequat mauris nunc. Malesuada pellentesque elit eget gravida cum. Varius morbi enim nunc faucibus a pellentesque sit amet. Nulla pharetra diam sit amet. Odio facilisis mauris sit amet massa vitae tortor condimentum lacinia. Enim tortor at auctor urna nunc.', 'Home', '', 'publish', 'closed', 'open', '', 'home', '', '', '2018-01-24 16:58:15', '2018-01-24 16:58:15', '', 0, 'http://localhost/portal-pg/?page_id=2', 0, 'page', '', 0);
INSERT INTO "public"."wp_posts" VALUES (10, 1, '2018-01-24 16:58:15', '2018-01-24 16:58:15', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cras pulvinar mattis nunc sed. Malesuada fames ac turpis egestas integer eget. Maecenas sed enim ut sem viverra aliquet. Viverra suspendisse potenti nullam ac tortor vitae purus. Velit ut tortor pretium viverra. In iaculis nunc sed augue lacus viverra. Posuere lorem ipsum dolor sit amet consectetur. Nibh praesent tristique magna sit amet purus. Tincidunt ornare massa eget egestas purus viverra accumsan in nisl. Varius morbi enim nunc faucibus a pellentesque sit. Porttitor eget dolor morbi non arcu risus. Leo vel fringilla est ullamcorper eget nulla. Ante metus dictum at tempor commodo ullamcorper. Sem nulla pharetra diam sit amet nisl. Lacus suspendisse faucibus interdum posuere lorem ipsum dolor sit amet. Sit amet volutpat consequat mauris nunc congue nisi vitae suscipit. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci a. Auctor urna nunc id cursus metus. Magna ac placerat vestibulum lectus mauris.

Fermentum dui faucibus in ornare quam viverra orci sagittis. Tristique senectus et netus et malesuada fames ac. Vitae justo eget magna fermentum iaculis eu non diam. Rutrum quisque non tellus orci ac auctor augue mauris. Blandit massa enim nec dui nunc. Laoreet non curabitur gravida arcu ac tortor dignissim convallis. Elementum tempus egestas sed sed risus. Diam maecenas ultricies mi eget mauris pharetra et ultrices neque. Tincidunt eget nullam non nisi. Dapibus ultrices in iaculis nunc. Aliquam sem fringilla ut morbi. Pellentesque habitant morbi tristique senectus. Eu nisl nunc mi ipsum. Netus et malesuada fames ac turpis egestas sed. Dictumst quisque sagittis purus sit amet volutpat consequat mauris nunc. Malesuada pellentesque elit eget gravida cum. Varius morbi enim nunc faucibus a pellentesque sit amet. Nulla pharetra diam sit amet. Odio facilisis mauris sit amet massa vitae tortor condimentum lacinia. Enim tortor at auctor urna nunc.', 'Home', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2018-01-24 16:58:15', '2018-01-24 16:58:15', '', 2, 'http://localhost/portal-pg/index.php/feminismo/2018/01/24/2-revision-v1/', 0, 'revision', '', 0);
COMMIT;

-- ----------------------------
-- Table structure for wp_term_relationships
-- ----------------------------
DROP TABLE IF EXISTS "public"."wp_term_relationships";
CREATE TABLE "public"."wp_term_relationships" (
  "object_id" int8 NOT NULL DEFAULT 0,
  "term_taxonomy_id" int8 NOT NULL DEFAULT 0,
  "term_order" int4 NOT NULL DEFAULT 0
)
;
ALTER TABLE "public"."wp_term_relationships" OWNER TO "postgres";

-- ----------------------------
-- Records of wp_term_relationships
-- ----------------------------
BEGIN;
INSERT INTO "public"."wp_term_relationships" VALUES (1, 2, 0);
COMMIT;

-- ----------------------------
-- Table structure for wp_term_taxonomy
-- ----------------------------
DROP TABLE IF EXISTS "public"."wp_term_taxonomy";
CREATE TABLE "public"."wp_term_taxonomy" (
  "term_taxonomy_id" int8 NOT NULL DEFAULT nextval(('wp_term_taxonomy_seq'::text)::regclass),
  "term_id" int8 NOT NULL DEFAULT 0,
  "taxonomy" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "description" text COLLATE "pg_catalog"."default" NOT NULL,
  "parent" int8 NOT NULL DEFAULT 0,
  "count" int8 NOT NULL DEFAULT 0
)
;
ALTER TABLE "public"."wp_term_taxonomy" OWNER TO "postgres";

-- ----------------------------
-- Records of wp_term_taxonomy
-- ----------------------------
BEGIN;
INSERT INTO "public"."wp_term_taxonomy" VALUES (3, 4, 'category', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 0, 0);
INSERT INTO "public"."wp_term_taxonomy" VALUES (4, 5, 'category', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 0, 0);
INSERT INTO "public"."wp_term_taxonomy" VALUES (2, 3, 'category', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for wp_termmeta
-- ----------------------------
DROP TABLE IF EXISTS "public"."wp_termmeta";
CREATE TABLE "public"."wp_termmeta" (
  "meta_id" int8 NOT NULL DEFAULT nextval(('wp_termmeta_seq'::text)::regclass),
  "term_id" int8 NOT NULL DEFAULT '0'::bigint,
  "meta_key" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "meta_value" text COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."wp_termmeta" OWNER TO "postgres";

-- ----------------------------
-- Table structure for wp_terms
-- ----------------------------
DROP TABLE IF EXISTS "public"."wp_terms";
CREATE TABLE "public"."wp_terms" (
  "term_id" int8 NOT NULL DEFAULT nextval(('wp_terms_seq'::text)::regclass),
  "name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "slug" varchar(200) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "term_group" int4 NOT NULL DEFAULT 0
)
;
ALTER TABLE "public"."wp_terms" OWNER TO "postgres";

-- ----------------------------
-- Records of wp_terms
-- ----------------------------
BEGIN;
INSERT INTO "public"."wp_terms" VALUES (3, 'Feminismo', 'feminismo', 0);
INSERT INTO "public"."wp_terms" VALUES (4, 'Capitalismo', 'capitalismno', 0);
INSERT INTO "public"."wp_terms" VALUES (5, 'Defensa del Internet', 'defensa-del-internet', 0);
COMMIT;

-- ----------------------------
-- Table structure for wp_usermeta
-- ----------------------------
DROP TABLE IF EXISTS "public"."wp_usermeta";
CREATE TABLE "public"."wp_usermeta" (
  "umeta_id" int8 NOT NULL DEFAULT nextval(('wp_usermeta_seq'::text)::regclass),
  "user_id" int8 NOT NULL DEFAULT '0'::bigint,
  "meta_key" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "meta_value" text COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."wp_usermeta" OWNER TO "postgres";

-- ----------------------------
-- Records of wp_usermeta
-- ----------------------------
BEGIN;
INSERT INTO "public"."wp_usermeta" VALUES (1, 1, 'nickname', 'twadmin');
INSERT INTO "public"."wp_usermeta" VALUES (2, 1, 'first_name', '');
INSERT INTO "public"."wp_usermeta" VALUES (3, 1, 'last_name', '');
INSERT INTO "public"."wp_usermeta" VALUES (4, 1, 'description', '');
INSERT INTO "public"."wp_usermeta" VALUES (5, 1, 'rich_editing', 'true');
INSERT INTO "public"."wp_usermeta" VALUES (6, 1, 'syntax_highlighting', 'true');
INSERT INTO "public"."wp_usermeta" VALUES (7, 1, 'comment_shortcuts', 'false');
INSERT INTO "public"."wp_usermeta" VALUES (8, 1, 'admin_color', 'fresh');
INSERT INTO "public"."wp_usermeta" VALUES (9, 1, 'use_ssl', '0');
INSERT INTO "public"."wp_usermeta" VALUES (10, 1, 'show_admin_bar_front', 'true');
INSERT INTO "public"."wp_usermeta" VALUES (11, 1, 'locale', '');
INSERT INTO "public"."wp_usermeta" VALUES (14, 1, 'dismissed_wp_pointers', '');
INSERT INTO "public"."wp_usermeta" VALUES (12, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}');
INSERT INTO "public"."wp_usermeta" VALUES (13, 1, 'wp_user_level', '10');
INSERT INTO "public"."wp_usermeta" VALUES (15, 1, 'show_welcome_panel', '1');
INSERT INTO "public"."wp_usermeta" VALUES (16, 1, 'session_tokens', 'a:1:{s:64:"ff7ad6fb662de43ce4053cf7805c7ebb851f9564fcd8f3d0b4d053754652ce09";a:4:{s:10:"expiration";i:1516979258;s:2:"ip";s:3:"::1";s:2:"ua";s:121:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36";s:5:"login";i:1516806458;}}');
INSERT INTO "public"."wp_usermeta" VALUES (17, 1, 'wp_user-settings', 'hidetb=1&editor=tinymce');
INSERT INTO "public"."wp_usermeta" VALUES (18, 1, 'wp_user-settings-time', '1516806455');
INSERT INTO "public"."wp_usermeta" VALUES (19, 1, 'wp_dashboard_quick_press_last_post_id', '3');
INSERT INTO "public"."wp_usermeta" VALUES (20, 1, 'community-events-location', 'a:1:{s:2:"ip";s:2:"::";}');
INSERT INTO "public"."wp_usermeta" VALUES (21, 1, 'posts_rated', 'a:0:{}');
COMMIT;

-- ----------------------------
-- Table structure for wp_users
-- ----------------------------
DROP TABLE IF EXISTS "public"."wp_users";
CREATE TABLE "public"."wp_users" (
  "ID" int8 NOT NULL DEFAULT nextval(('wp_users_seq'::text)::regclass),
  "user_login" varchar(60) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "user_pass" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "user_nicename" varchar(50) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "user_email" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "user_url" varchar(100) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "user_registered" timestamp(6) NOT NULL DEFAULT now(),
  "user_activation_key" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "user_status" int4 NOT NULL DEFAULT 0,
  "display_name" varchar(250) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying
)
;
ALTER TABLE "public"."wp_users" OWNER TO "postgres";

-- ----------------------------
-- Records of wp_users
-- ----------------------------
BEGIN;
INSERT INTO "public"."wp_users" VALUES (1, 'twadmin', '$P$BH2OvidTztfhkW/kbDv5gBrn364VDY.', 'twadmin', 'dsepulve@thougthworks.com', '', '2018-01-24 15:07:21', '', 0, 'twadmin');
COMMIT;

-- ----------------------------
-- Function structure for field
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."field"(IN anyelement, VARIADIC anyarray);
CREATE OR REPLACE FUNCTION "public"."field"(IN anyelement, VARIADIC anyarray)
  RETURNS "pg_catalog"."int8" AS $BODY$
SELECT rownum
FROM (SELECT ROW_NUMBER() OVER () AS rownum, elem
	FROM unnest($2) elem) numbered
WHERE numbered.elem = $1
UNION ALL
SELECT 0
$BODY$
  LANGUAGE sql IMMUTABLE
  COST 100;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."wp_commentmeta_seq"', 2, false);
SELECT setval('"public"."wp_comments_seq"', 2, true);
SELECT setval('"public"."wp_links_seq"', 2, false);
SELECT setval('"public"."wp_options_seq"', 210, true);
SELECT setval('"public"."wp_postmeta_seq"', 37, true);
SELECT setval('"public"."wp_posts_seq"', 11, true);
SELECT setval('"public"."wp_term_taxonomy_seq"', 5, true);
SELECT setval('"public"."wp_termmeta_seq"', 2, false);
SELECT setval('"public"."wp_terms_seq"', 6, true);
SELECT setval('"public"."wp_usermeta_seq"', 22, true);
SELECT setval('"public"."wp_users_seq"', 2, true);

-- ----------------------------
-- Indexes structure for table wp_commentmeta
-- ----------------------------
CREATE INDEX "wp_commentmeta_comment_id" ON "public"."wp_commentmeta" USING btree (
  "comment_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "wp_commentmeta_meta_key" ON "public"."wp_commentmeta" USING btree (
  "meta_key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table wp_commentmeta
-- ----------------------------
ALTER TABLE "public"."wp_commentmeta" ADD CONSTRAINT "wp_commentmeta_pkey" PRIMARY KEY ("meta_id");

-- ----------------------------
-- Indexes structure for table wp_comments
-- ----------------------------
CREATE INDEX "wp_comments_comment_approved_date_gmt" ON "public"."wp_comments" USING btree (
  "comment_approved" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "comment_date_gmt" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "wp_comments_comment_author_email" ON "public"."wp_comments" USING btree (
  "comment_author_email" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "wp_comments_comment_date_gmt" ON "public"."wp_comments" USING btree (
  "comment_date_gmt" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "wp_comments_comment_parent" ON "public"."wp_comments" USING btree (
  "comment_parent" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "wp_comments_comment_post_ID" ON "public"."wp_comments" USING btree (
  "comment_post_ID" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table wp_comments
-- ----------------------------
ALTER TABLE "public"."wp_comments" ADD CONSTRAINT "wp_comments_pkey" PRIMARY KEY ("comment_ID");

-- ----------------------------
-- Indexes structure for table wp_links
-- ----------------------------
CREATE INDEX "wp_links_link_visible" ON "public"."wp_links" USING btree (
  "link_visible" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table wp_links
-- ----------------------------
ALTER TABLE "public"."wp_links" ADD CONSTRAINT "wp_links_pkey" PRIMARY KEY ("link_id");

-- ----------------------------
-- Indexes structure for table wp_options
-- ----------------------------
CREATE UNIQUE INDEX "wp_options_option_name" ON "public"."wp_options" USING btree (
  "option_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table wp_options
-- ----------------------------
ALTER TABLE "public"."wp_options" ADD CONSTRAINT "wp_options_pkey" PRIMARY KEY ("option_id");

-- ----------------------------
-- Indexes structure for table wp_postmeta
-- ----------------------------
CREATE INDEX "wp_postmeta_meta_key" ON "public"."wp_postmeta" USING btree (
  "meta_key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "wp_postmeta_post_id" ON "public"."wp_postmeta" USING btree (
  "post_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table wp_postmeta
-- ----------------------------
ALTER TABLE "public"."wp_postmeta" ADD CONSTRAINT "wp_postmeta_pkey" PRIMARY KEY ("meta_id");

-- ----------------------------
-- Indexes structure for table wp_posts
-- ----------------------------
CREATE INDEX "wp_posts_post_author" ON "public"."wp_posts" USING btree (
  "post_author" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "wp_posts_post_name" ON "public"."wp_posts" USING btree (
  "post_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "wp_posts_post_parent" ON "public"."wp_posts" USING btree (
  "post_parent" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "wp_posts_type_status_date" ON "public"."wp_posts" USING btree (
  "post_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "post_status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "post_date" "pg_catalog"."timestamp_ops" ASC NULLS LAST,
  "ID" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table wp_posts
-- ----------------------------
ALTER TABLE "public"."wp_posts" ADD CONSTRAINT "wp_posts_pkey" PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table wp_term_relationships
-- ----------------------------
CREATE INDEX "wp_term_relationships_term_taxonomy_id" ON "public"."wp_term_relationships" USING btree (
  "term_taxonomy_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table wp_term_relationships
-- ----------------------------
ALTER TABLE "public"."wp_term_relationships" ADD CONSTRAINT "wp_term_relationships_pkey" PRIMARY KEY ("object_id", "term_taxonomy_id");

-- ----------------------------
-- Indexes structure for table wp_term_taxonomy
-- ----------------------------
CREATE INDEX "wp_term_taxonomy_taxonomy" ON "public"."wp_term_taxonomy" USING btree (
  "taxonomy" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "wp_term_taxonomy_term_id_taxonomy" ON "public"."wp_term_taxonomy" USING btree (
  "term_id" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "taxonomy" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table wp_term_taxonomy
-- ----------------------------
ALTER TABLE "public"."wp_term_taxonomy" ADD CONSTRAINT "wp_term_taxonomy_pkey" PRIMARY KEY ("term_taxonomy_id");

-- ----------------------------
-- Indexes structure for table wp_termmeta
-- ----------------------------
CREATE INDEX "wp_termmeta_meta_key" ON "public"."wp_termmeta" USING btree (
  "meta_key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "wp_termmeta_term_id" ON "public"."wp_termmeta" USING btree (
  "term_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table wp_termmeta
-- ----------------------------
ALTER TABLE "public"."wp_termmeta" ADD CONSTRAINT "wp_termmeta_pkey" PRIMARY KEY ("meta_id");

-- ----------------------------
-- Indexes structure for table wp_terms
-- ----------------------------
CREATE INDEX "wp_terms_name" ON "public"."wp_terms" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "wp_terms_slug" ON "public"."wp_terms" USING btree (
  "slug" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table wp_terms
-- ----------------------------
ALTER TABLE "public"."wp_terms" ADD CONSTRAINT "wp_terms_pkey" PRIMARY KEY ("term_id");

-- ----------------------------
-- Indexes structure for table wp_usermeta
-- ----------------------------
CREATE INDEX "wp_usermeta_meta_key" ON "public"."wp_usermeta" USING btree (
  "meta_key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "wp_usermeta_user_id" ON "public"."wp_usermeta" USING btree (
  "user_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table wp_usermeta
-- ----------------------------
ALTER TABLE "public"."wp_usermeta" ADD CONSTRAINT "wp_usermeta_pkey" PRIMARY KEY ("umeta_id");

-- ----------------------------
-- Indexes structure for table wp_users
-- ----------------------------
CREATE INDEX "wp_users_user_email" ON "public"."wp_users" USING btree (
  "user_email" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "wp_users_user_login_key" ON "public"."wp_users" USING btree (
  "user_login" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "wp_users_user_nicename" ON "public"."wp_users" USING btree (
  "user_nicename" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table wp_users
-- ----------------------------
ALTER TABLE "public"."wp_users" ADD CONSTRAINT "wp_users_pkey" PRIMARY KEY ("ID");
