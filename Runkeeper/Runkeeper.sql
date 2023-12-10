CREATE TABLE `trips` (
  `_id` int PRIMARY KEY AUTO_INCREMENT,
  `activity_type` text,
  `uuid` text,
  `ext_trip_id` text,
  `start_date` double,
  `name` text,
  `distance` double,
  `elapsed_time` double,
  `should_sync` bool,
  `is_synced` bool,
  `deleted` bool,
  `training_activity_id` int,
  `training_activity_interval_index` int,
  `training_activity_interval_value` int,
  `training_activity_interval_start_value` int,
  `training_activity_repetition` int,
  `manual` bool,
  `training_activity_interval_start_distance` double,
  `gym_equipment` bool,
  `calories` double,
  `heart_rate` double,
  `route_id` int,
  `notes` text,
  `training_workout_id` int,
  `scheduled_class_id` int,
  `gym_equipment_type` int,
  `web_sync_time` int,
  `device_sync_time` int,
  `is_skeleton` int,
  `training_session_id` int,
  `tags` text,
  `utcOffset` int,
  `hasPoints` int,
  `totalClimb` double,
  `startTimeFromElapsedRealTime` double,
  `needsPointsFromServer` bool NOT NULL,
  `trackingMode` int NOT NULL,
  `needs_watch_sync` bool NOT NULL,
  `external_gps_associated` bool NOT NULL,
  `using_external_points` bool NOT NULL,
  `nikeFuelTotal` double NOT NULL,
  `temperature_celsius` double,
  `apparent_temperature_celsius` double,
  `weather_conditions` text,
  `humidity` double,
  `wind_speed_mps` double,
  `wind_bearing_degrees` double,
  `nickname` text,
  `feedbackChoice` int,
  `has_step_data` int,
  `gps_correction` int,
  `fitness_class_id` text,
  `fitness_class_end_time` int,
  `virtualEventUUID` text,
  `virtualRaceUUID` text,
  `adjustedRaceTime` double
);

CREATE TABLE `points` (
  `_id` int PRIMARY KEY AUTO_INCREMENT,
  `trip_id` int,
  `ext_point_id` text,
  `has_been_sent` bool,
  `latitude` double,
  `longitude` double,
  `altitude` double,
  `time_at_point` int,
  `time_interval_at_point` double,
  `speed_from_last_point` double,
  `distance_from_last_point` double,
  `point_type` int,
  `accuracy` double,
  `distance_at_point` double,
  `split_type` int,
  `heartRate` int,
  `time_interval_at_point_ms` int,
  `point_source` int,
  `point_type_before_filter` int NOT NULL,
  `trip_uuid` text
);

CREATE TABLE `status_updates` (
  `status_id` int PRIMARY KEY AUTO_INCREMENT,
  `trip_id` int,
  `note` text,
  `haslmage` bool,
  `sent` bool,
  `latitude` double,
  `longitude` double,
  `timestamp` double,
  `image_content_provider_id` int,
  `hero_photo` int,
  `image_uri` text,
  `trip_uuid` text,
  `photo_url` text
);

CREATE TABLE `trip_settings` (
  `_id` int PRIMARY KEY AUTO_INCREMENT,
  `trip_id` int,
  `setting_key` text,
  `setting_value` text
);

CREATE TABLE `training_session` (
  `_id` int PRIMARY KEY AUTO_INCREMENT,
  `trip_uuid` text,
  `training_class_id` int,
  `description` text,
  `nutrition_info` text,
  `day_offset` int,
  `session_number` int,
  `customized` int,
  `training_workout_id` int,
  `summary` text,
  `completion_type` int
);

CREATE TABLE `routes` (
  `_id` int PRIMARY KEY AUTO_INCREMENT,
  `activity_type` int,
  `name` text,
  `distance` double
);

CREATE TABLE `route_activities` (
  `_id` int PRIMARY KEY AUTO_INCREMENT,
  `route_id` int,
  `start_date` double,
  `duration` double,
  `pace` double
);

CREATE TABLE `route_points` (
  `_id` int PRIMARY KEY AUTO_INCREMENT,
  `route_id` int,
  `latitude` double,
  `longitude` double
);

ALTER TABLE `points` ADD FOREIGN KEY (`trip_id`) REFERENCES `trips` (`_id`);

ALTER TABLE `status_updates` ADD FOREIGN KEY (`trip_id`) REFERENCES `trips` (`_id`);

ALTER TABLE `trip_settings` ADD FOREIGN KEY (`trip_id`) REFERENCES `trips` (`_id`);

ALTER TABLE `trips` ADD FOREIGN KEY (`uuid`) REFERENCES `training_session` (`trip_uuid`);

ALTER TABLE `trips` ADD FOREIGN KEY (`activity_type`) REFERENCES `routes` (`activity_type`);

ALTER TABLE `route_activities` ADD FOREIGN KEY (`route_id`) REFERENCES `routes` (`_id`);

ALTER TABLE `route_points` ADD FOREIGN KEY (`route_id`) REFERENCES `routes` (`_id`);
