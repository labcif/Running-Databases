CREATE TABLE `activity` (
  `as2_sa_id` int PRIMARY KEY AUTO_INCREMENT,
  `as2_sa_platform_id` text,
  `as2_sa_app_id` text NOT NULL,
  `as2_sa_start_utc_ms` int NOT NULL,
  `as2_sa_end_utc_ms` int NOT NULL,
  `as2_sa_active_duration_ms` int NOT NULL,
  `as2_sa_type` text NOT NULL,
  `as2_sa_user_category` text,
  `as2_sa_is_deleted` int NOT NULL,
  `as2_sa_is_dirty` int NOT NULL,
  `as2_sa_last_modified_ms` int NOT NULL,
  `as2_sa_change_tokens` text NOT NULL,
  `as2_sa_metrics` text NOT NULL,
  `as2_sa_sources` text NOT NULL
);

CREATE TABLE `activity_metric_group` (
  `as2_mg_id` int PRIMARY KEY AUTO_INCREMENT,
  `as2_mg_activity_id` int NOT NULL,
  `as2_mg_app_id` text,
  `as2_mg_is_dirty` int NOT NULL,
  `as2_mg_metric_type` text NOT NULL,
  `as2_mg_unit` text NOT NULL,
  `as2_mg_source` text NOT NULL
);

CREATE TABLE `activity_moment` (
  `as2_m_id` int PRIMARY KEY AUTO_INCREMENT,
  `as2_m_activity_id` int NOT NULL,
  `as2_m_app_id` text,
  `as2_m_type` text NOT NULL,
  `as2_m_value` text NOT NULL,
  `as2_m_source` text NOT NULL,
  `as2_m_timestamp_utc_ms` int NOT NULL
);

CREATE TABLE `activity_polyline` (
  `as2_p_id` int PRIMARY KEY AUTO_INCREMENT,
  `as2_p_activity_id` int NOT NULL,
  `as2_p_source` text NOT NULL,
  `as2_p_app_id` text NOT NULL,
  `as2_p_encoded_polyline` text NOT NULL,
  `as2_p_type` text NOT NULL
);

CREATE TABLE `activity_summary` (
  `as2_s_id` int PRIMARY KEY AUTO_INCREMENT,
  `as2_s_activity_id` int NOT NULL,
  `as2_s_app_id` text,
  `as2_s_metric_type` text NOT NULL,
  `as2_s_source` text NOT NULL,
  `as2_s_type` text NOT NULL,
  `as2_s_value` real NOT NULL
);

CREATE TABLE `activity_tag` (
  `as2_t_id` int PRIMARY KEY AUTO_INCREMENT,
  `as2_t_activity_id` int NOT NULL,
  `as2_t_type` text NOT NULL,
  `as2_t_value` text
);

CREATE TABLE `fullpower_activity_link` (
  `fpal_id` int PRIMARY KEY AUTO_INCREMENT,
  `fpal_local_activity_id` int NOT NULL,
  `fpal_fullpower_id` int NOT NULL
);

CREATE TABLE `activity_raw_metric` (
  `as2_rm_id` int PRIMARY KEY AUTO_INCREMENT,
  `as2_rm_metric_group_id` int NOT NULL,
  `as2_rm_end_utc_ms` int NOT NULL,
  `as2_rm_start_utc_ms` int NOT NULL,
  `as2_rm_value` real NOT NULL
);

ALTER TABLE `activity_metric_group` ADD FOREIGN KEY (`as2_mg_activity_id`) REFERENCES `activity` (`as2_sa_id`);

ALTER TABLE `activity_moment` ADD FOREIGN KEY (`as2_m_activity_id`) REFERENCES `activity` (`as2_sa_id`);

ALTER TABLE `activity_polyline` ADD FOREIGN KEY (`as2_p_activity_id`) REFERENCES `activity` (`as2_sa_id`);

ALTER TABLE `activity_summary` ADD FOREIGN KEY (`as2_s_activity_id`) REFERENCES `activity` (`as2_sa_id`);

ALTER TABLE `activity_tag` ADD FOREIGN KEY (`as2_t_activity_id`) REFERENCES `activity` (`as2_sa_id`);

ALTER TABLE `fullpower_activity_link` ADD FOREIGN KEY (`fpal_local_activity_id`) REFERENCES `activity` (`as2_sa_id`);

ALTER TABLE `activity_raw_metric` ADD FOREIGN KEY (`as2_rm_metric_group_id`) REFERENCES `activity_metric_group` (`as2_mg_id`);
