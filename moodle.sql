CREATE DATABASE `moodle` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

use `moodle`;

-- moodle.mdl_adminpresets definição

CREATE TABLE `mdl_adminpresets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `site` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `moodleversion` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `moodlerelease` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `iscore` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timeimported` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Table to store presets data';


-- moodle.mdl_adminpresets_app definição

CREATE TABLE `mdl_adminpresets_app` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `adminpresetid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `time` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_admiapp_adm_ix` (`adminpresetid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Applied presets';


-- moodle.mdl_adminpresets_app_it definição

CREATE TABLE `mdl_adminpresets_app_it` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `adminpresetapplyid` bigint NOT NULL,
  `configlogid` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_admiappit_con_ix` (`configlogid`),
  KEY `mdl_admiappit_adm_ix` (`adminpresetapplyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Admin presets applied items. To maintain the relation with c';


-- moodle.mdl_adminpresets_app_it_a definição

CREATE TABLE `mdl_adminpresets_app_it_a` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `adminpresetapplyid` bigint NOT NULL,
  `configlogid` bigint NOT NULL,
  `itemname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_admiappita_con_ix` (`configlogid`),
  KEY `mdl_admiappita_adm_ix` (`adminpresetapplyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Attributes of the applied items';


-- moodle.mdl_adminpresets_app_plug definição

CREATE TABLE `mdl_adminpresets_app_plug` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `adminpresetapplyid` bigint NOT NULL,
  `plugin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` smallint NOT NULL DEFAULT '0',
  `oldvalue` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_admiappplug_adm_ix` (`adminpresetapplyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Admin presets plugins applied';


-- moodle.mdl_adminpresets_it definição

CREATE TABLE `mdl_adminpresets_it` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `adminpresetid` bigint NOT NULL,
  `plugin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_admiit_adm_ix` (`adminpresetid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Table to store settings';


-- moodle.mdl_adminpresets_it_a definição

CREATE TABLE `mdl_adminpresets_it_a` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `itemid` bigint NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_admiita_ite_ix` (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Admin presets items attributes. For settings with attributes';


-- moodle.mdl_adminpresets_plug definição

CREATE TABLE `mdl_adminpresets_plug` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `adminpresetid` bigint NOT NULL,
  `plugin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enabled` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_admiplug_adm_ix` (`adminpresetid`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Admin presets plugins status, to store information about whe';


-- moodle.mdl_ai_action_explain_text definição

CREATE TABLE `mdl_ai_action_explain_text` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `prompt` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `responseid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fingerprint` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generatedcontent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `finishreason` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prompttokens` bigint DEFAULT NULL,
  `completiontoken` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores specific data about explain text actions.';


-- moodle.mdl_ai_action_generate_image definição

CREATE TABLE `mdl_ai_action_generate_image` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `prompt` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `numberimages` bigint NOT NULL,
  `quality` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `aspectratio` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `style` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sourceurl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revisedprompt` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores specific data about generate image actions';


-- moodle.mdl_ai_action_generate_text definição

CREATE TABLE `mdl_ai_action_generate_text` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `prompt` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `responseid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fingerprint` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generatedcontent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `finishreason` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prompttokens` bigint DEFAULT NULL,
  `completiontoken` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores specific data about generate text actions.';


-- moodle.mdl_ai_action_register definição

CREATE TABLE `mdl_ai_action_register` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `actionname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `actionid` bigint NOT NULL,
  `success` tinyint(1) NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL,
  `contextid` bigint NOT NULL,
  `provider` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `errorcode` smallint DEFAULT NULL,
  `errormessage` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `timecreated` bigint NOT NULL,
  `timecompleted` bigint DEFAULT NULL,
  `model` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_aiactiregi_actact_uix` (`actionname`,`actionid`),
  KEY `mdl_aiactiregi_actpro_ix` (`actionname`,`provider`),
  KEY `mdl_aiactiregi_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores information about processed ai actions.';


-- moodle.mdl_ai_action_summarise_text definição

CREATE TABLE `mdl_ai_action_summarise_text` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `prompt` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `responseid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fingerprint` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generatedcontent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `finishreason` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prompttokens` bigint DEFAULT NULL,
  `completiontoken` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores specific data about summarise text actions.';


-- moodle.mdl_ai_policy_register definição

CREATE TABLE `mdl_ai_policy_register` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL,
  `contextid` bigint NOT NULL,
  `timeaccepted` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_aipoliregi_use_uix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Register of users who have accepted this sites AI usage poli';


-- moodle.mdl_ai_providers definição

CREATE TABLE `mdl_ai_providers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `actionconfig` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_aiprov_pro_ix` (`provider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='AI provider instances';


-- moodle.mdl_analytics_indicator_calc definição

CREATE TABLE `mdl_analytics_indicator_calc` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `starttime` bigint NOT NULL,
  `endtime` bigint NOT NULL,
  `contextid` bigint NOT NULL,
  `sampleorigin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sampleid` bigint NOT NULL,
  `indicator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` decimal(10,2) DEFAULT NULL,
  `timecreated` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_analindicalc_staendcon_ix` (`starttime`,`endtime`,`contextid`),
  KEY `mdl_analindicalc_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stored indicator calculations';


-- moodle.mdl_analytics_models definição

CREATE TABLE `mdl_analytics_models` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `trained` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `indicators` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timesplitting` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `predictionsprocessor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` bigint NOT NULL,
  `contextids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `timecreated` bigint DEFAULT NULL,
  `timemodified` bigint NOT NULL,
  `usermodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_analmode_enatra_ix` (`enabled`,`trained`),
  KEY `mdl_analmode_use_ix` (`usermodified`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Analytic models.';


-- moodle.mdl_analytics_models_log definição

CREATE TABLE `mdl_analytics_models_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `modelid` bigint NOT NULL,
  `version` bigint NOT NULL,
  `evaluationmode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `indicators` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timesplitting` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `score` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dir` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timecreated` bigint NOT NULL,
  `usermodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_analmodelog_mod_ix` (`modelid`),
  KEY `mdl_analmodelog_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Analytic models changes during evaluation.';


-- moodle.mdl_analytics_predict_samples definição

CREATE TABLE `mdl_analytics_predict_samples` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `modelid` bigint NOT NULL,
  `analysableid` bigint NOT NULL,
  `timesplitting` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rangeindex` bigint NOT NULL,
  `sampleids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_analpredsamp_modanatimr_ix` (`modelid`,`analysableid`,`timesplitting`,`rangeindex`),
  KEY `mdl_analpredsamp_mod_ix` (`modelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Samples already used for predictions.';


-- moodle.mdl_analytics_prediction_actions definição

CREATE TABLE `mdl_analytics_prediction_actions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `predictionid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `actionname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_analpredacti_preuseact_ix` (`predictionid`,`userid`,`actionname`),
  KEY `mdl_analpredacti_pre_ix` (`predictionid`),
  KEY `mdl_analpredacti_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Register of user actions over predictions.';


-- moodle.mdl_analytics_predictions definição

CREATE TABLE `mdl_analytics_predictions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `modelid` bigint NOT NULL,
  `contextid` bigint NOT NULL,
  `sampleid` bigint NOT NULL,
  `rangeindex` mediumint NOT NULL,
  `prediction` decimal(10,2) NOT NULL,
  `predictionscore` decimal(10,5) NOT NULL,
  `calculations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timestart` bigint DEFAULT NULL,
  `timeend` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_analpred_modcon_ix` (`modelid`,`contextid`),
  KEY `mdl_analpred_mod_ix` (`modelid`),
  KEY `mdl_analpred_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Predictions';


-- moodle.mdl_analytics_train_samples definição

CREATE TABLE `mdl_analytics_train_samples` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `modelid` bigint NOT NULL,
  `analysableid` bigint NOT NULL,
  `timesplitting` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sampleids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timecreated` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_analtraisamp_modanatim_ix` (`modelid`,`analysableid`,`timesplitting`),
  KEY `mdl_analtraisamp_mod_ix` (`modelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Samples used for training';


-- moodle.mdl_analytics_used_analysables definição

CREATE TABLE `mdl_analytics_used_analysables` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `modelid` bigint NOT NULL,
  `action` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `analysableid` bigint NOT NULL,
  `firstanalysis` bigint NOT NULL,
  `timeanalysed` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_analusedanal_modact_ix` (`modelid`,`action`),
  KEY `mdl_analusedanal_ana_ix` (`analysableid`),
  KEY `mdl_analusedanal_mod_ix` (`modelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='List of analysables used by each model';


-- moodle.mdl_analytics_used_files definição

CREATE TABLE `mdl_analytics_used_files` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `modelid` bigint NOT NULL DEFAULT '0',
  `fileid` bigint NOT NULL DEFAULT '0',
  `action` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_analusedfile_modactfil_ix` (`modelid`,`action`,`fileid`),
  KEY `mdl_analusedfile_mod_ix` (`modelid`),
  KEY `mdl_analusedfile_fil_ix` (`fileid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Files that have already been used for training and predictio';


-- moodle.mdl_assign definição

CREATE TABLE `mdl_assign` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL DEFAULT '0',
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `introformat` smallint NOT NULL DEFAULT '0',
  `alwaysshowdescription` tinyint NOT NULL DEFAULT '0',
  `nosubmissions` tinyint NOT NULL DEFAULT '0',
  `submissiondrafts` tinyint NOT NULL DEFAULT '0',
  `sendnotifications` tinyint NOT NULL DEFAULT '0',
  `sendlatenotifications` tinyint NOT NULL DEFAULT '0',
  `duedate` bigint NOT NULL DEFAULT '0',
  `allowsubmissionsfromdate` bigint NOT NULL DEFAULT '0',
  `grade` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `requiresubmissionstatement` tinyint NOT NULL DEFAULT '0',
  `completionsubmit` tinyint NOT NULL DEFAULT '0',
  `cutoffdate` bigint NOT NULL DEFAULT '0',
  `gradingduedate` bigint NOT NULL DEFAULT '0',
  `teamsubmission` tinyint NOT NULL DEFAULT '0',
  `requireallteammemberssubmit` tinyint NOT NULL DEFAULT '0',
  `teamsubmissiongroupingid` bigint NOT NULL DEFAULT '0',
  `blindmarking` tinyint NOT NULL DEFAULT '0',
  `hidegrader` tinyint NOT NULL DEFAULT '0',
  `revealidentities` tinyint NOT NULL DEFAULT '0',
  `attemptreopenmethod` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'untilpass',
  `maxattempts` mediumint NOT NULL DEFAULT '1',
  `markingworkflow` tinyint NOT NULL DEFAULT '0',
  `markingallocation` tinyint NOT NULL DEFAULT '0',
  `markinganonymous` tinyint NOT NULL DEFAULT '0',
  `sendstudentnotifications` tinyint NOT NULL DEFAULT '1',
  `preventsubmissionnotingroup` tinyint NOT NULL DEFAULT '0',
  `activity` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `activityformat` smallint NOT NULL DEFAULT '0',
  `timelimit` bigint NOT NULL DEFAULT '0',
  `submissionattachments` tinyint NOT NULL DEFAULT '0',
  `gradepenalty` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou_ix` (`course`),
  KEY `mdl_assi_tea_ix` (`teamsubmissiongroupingid`),
  KEY `mdl_assi_gra_ix` (`gradepenalty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='This table saves information about an instance of mod_assign';


-- moodle.mdl_assign_grades definição

CREATE TABLE `mdl_assign_grades` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `assignment` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `grader` bigint NOT NULL DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '0.00000',
  `penalty` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `attemptnumber` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_assigrad_assuseatt_uix` (`assignment`,`userid`,`attemptnumber`),
  KEY `mdl_assigrad_use_ix` (`userid`),
  KEY `mdl_assigrad_att_ix` (`attemptnumber`),
  KEY `mdl_assigrad_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Grading information about a single assignment submission.';


-- moodle.mdl_assign_overrides definição

CREATE TABLE `mdl_assign_overrides` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `assignid` bigint NOT NULL DEFAULT '0',
  `groupid` bigint DEFAULT NULL,
  `userid` bigint DEFAULT NULL,
  `sortorder` bigint DEFAULT NULL,
  `allowsubmissionsfromdate` bigint DEFAULT NULL,
  `duedate` bigint DEFAULT NULL,
  `cutoffdate` bigint DEFAULT NULL,
  `timelimit` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_assiover_ass_ix` (`assignid`),
  KEY `mdl_assiover_gro_ix` (`groupid`),
  KEY `mdl_assiover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='The overrides to assign settings.';


-- moodle.mdl_assign_plugin_config definição

CREATE TABLE `mdl_assign_plugin_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `assignment` bigint NOT NULL DEFAULT '0',
  `plugin` varchar(28) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `subtype` varchar(28) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(28) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_assiplugconf_plu_ix` (`plugin`),
  KEY `mdl_assiplugconf_sub_ix` (`subtype`),
  KEY `mdl_assiplugconf_nam_ix` (`name`),
  KEY `mdl_assiplugconf_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Config data for an instance of a plugin in an assignment.';


-- moodle.mdl_assign_submission definição

CREATE TABLE `mdl_assign_submission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `assignment` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `timestarted` bigint DEFAULT NULL,
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `groupid` bigint NOT NULL DEFAULT '0',
  `attemptnumber` bigint NOT NULL DEFAULT '0',
  `latest` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_assisubm_assusegroatt_uix` (`assignment`,`userid`,`groupid`,`attemptnumber`),
  KEY `mdl_assisubm_use_ix` (`userid`),
  KEY `mdl_assisubm_att_ix` (`attemptnumber`),
  KEY `mdl_assisubm_assusegrolat_ix` (`assignment`,`userid`,`groupid`,`latest`),
  KEY `mdl_assisubm_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='This table keeps information about student interactions with';


-- moodle.mdl_assign_user_flags definição

CREATE TABLE `mdl_assign_user_flags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL DEFAULT '0',
  `assignment` bigint NOT NULL DEFAULT '0',
  `locked` bigint NOT NULL DEFAULT '0',
  `mailed` smallint NOT NULL DEFAULT '0',
  `extensionduedate` bigint NOT NULL DEFAULT '0',
  `workflowstate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allocatedmarker` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiuserflag_mai_ix` (`mailed`),
  KEY `mdl_assiuserflag_use_ix` (`userid`),
  KEY `mdl_assiuserflag_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='List of flags that can be set for a single user in a single ';


-- moodle.mdl_assign_user_mapping definição

CREATE TABLE `mdl_assign_user_mapping` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `assignment` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiusermapp_ass_ix` (`assignment`),
  KEY `mdl_assiusermapp_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Map an assignment specific id number to a user';


-- moodle.mdl_assignfeedback_comments definição

CREATE TABLE `mdl_assignfeedback_comments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `assignment` bigint NOT NULL DEFAULT '0',
  `grade` bigint NOT NULL DEFAULT '0',
  `commenttext` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `commentformat` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assicomm_ass_ix` (`assignment`),
  KEY `mdl_assicomm_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Text feedback for submitted assignments';


-- moodle.mdl_assignfeedback_editpdf_annot definição

CREATE TABLE `mdl_assignfeedback_editpdf_annot` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gradeid` bigint NOT NULL DEFAULT '0',
  `pageno` bigint NOT NULL DEFAULT '0',
  `x` bigint DEFAULT '0',
  `y` bigint DEFAULT '0',
  `endx` bigint DEFAULT '0',
  `endy` bigint DEFAULT '0',
  `path` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'line',
  `colour` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'black',
  `draft` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditanno_grapag_ix` (`gradeid`,`pageno`),
  KEY `mdl_assieditanno_gra_ix` (`gradeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='stores annotations added to pdfs submitted by students';


-- moodle.mdl_assignfeedback_editpdf_cmnt definição

CREATE TABLE `mdl_assignfeedback_editpdf_cmnt` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gradeid` bigint NOT NULL DEFAULT '0',
  `x` bigint DEFAULT '0',
  `y` bigint DEFAULT '0',
  `width` bigint DEFAULT '120',
  `rawtext` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `pageno` bigint NOT NULL DEFAULT '0',
  `colour` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'black',
  `draft` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditcmnt_grapag_ix` (`gradeid`,`pageno`),
  KEY `mdl_assieditcmnt_gra_ix` (`gradeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores comments added to pdfs';


-- moodle.mdl_assignfeedback_editpdf_quick definição

CREATE TABLE `mdl_assignfeedback_editpdf_quick` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL DEFAULT '0',
  `rawtext` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `width` bigint NOT NULL DEFAULT '120',
  `colour` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'yellow',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditquic_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores teacher specified quicklist comments';


-- moodle.mdl_assignfeedback_editpdf_rot definição

CREATE TABLE `mdl_assignfeedback_editpdf_rot` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gradeid` bigint NOT NULL DEFAULT '0',
  `pageno` bigint NOT NULL DEFAULT '0',
  `pathnamehash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isrotated` tinyint(1) NOT NULL DEFAULT '0',
  `degree` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_assieditrot_grapag_uix` (`gradeid`,`pageno`),
  KEY `mdl_assieditrot_gra_ix` (`gradeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores rotation information of a page.';


-- moodle.mdl_assignfeedback_file definição

CREATE TABLE `mdl_assignfeedback_file` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `assignment` bigint NOT NULL DEFAULT '0',
  `grade` bigint NOT NULL DEFAULT '0',
  `numfiles` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass2_ix` (`assignment`),
  KEY `mdl_assifile_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores info about the number of files submitted by a student';


-- moodle.mdl_assignsubmission_file definição

CREATE TABLE `mdl_assignsubmission_file` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `assignment` bigint NOT NULL DEFAULT '0',
  `submission` bigint NOT NULL DEFAULT '0',
  `numfiles` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass_ix` (`assignment`),
  KEY `mdl_assifile_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Info about file submissions for assignments';


-- moodle.mdl_assignsubmission_onlinetext definição

CREATE TABLE `mdl_assignsubmission_onlinetext` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `assignment` bigint NOT NULL DEFAULT '0',
  `submission` bigint NOT NULL DEFAULT '0',
  `onlinetext` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `onlineformat` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assionli_ass_ix` (`assignment`),
  KEY `mdl_assionli_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Info about onlinetext submission';


-- moodle.mdl_auth_lti_linked_login definição

CREATE TABLE `mdl_auth_lti_linked_login` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL,
  `issuer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `issuer256` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sub` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sub256` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_authltilinklogi_useiss_uix` (`userid`,`issuer256`,`sub256`),
  KEY `mdl_authltilinklogi_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Accounts linked to a users Moodle account.';


-- moodle.mdl_auth_oauth2_linked_login definição

CREATE TABLE `mdl_auth_oauth2_linked_login` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `usermodified` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `issuerid` bigint NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirmtoken` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `confirmtokenexpires` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_authoautlinklogi_useis_uix` (`userid`,`issuerid`,`username`),
  KEY `mdl_authoautlinklogi_issuse_ix` (`issuerid`,`username`),
  KEY `mdl_authoautlinklogi_use_ix` (`usermodified`),
  KEY `mdl_authoautlinklogi_use2_ix` (`userid`),
  KEY `mdl_authoautlinklogi_iss_ix` (`issuerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Accounts linked to a users Moodle account.';


-- moodle.mdl_backup_controllers definição

CREATE TABLE `mdl_backup_controllers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `operation` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'backup',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint NOT NULL,
  `format` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `interactive` smallint NOT NULL,
  `purpose` smallint NOT NULL,
  `userid` bigint NOT NULL,
  `status` smallint NOT NULL,
  `execution` smallint NOT NULL,
  `executiontime` bigint NOT NULL,
  `checksum` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `progress` decimal(15,14) NOT NULL DEFAULT '0.00000000000000',
  `controller` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcont_bac_uix` (`backupid`),
  KEY `mdl_backcont_typite_ix` (`type`,`itemid`),
  KEY `mdl_backcont_useite_ix` (`userid`,`itemid`),
  KEY `mdl_backcont_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='To store the backup_controllers as they are used';


-- moodle.mdl_backup_courses definição

CREATE TABLE `mdl_backup_courses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `courseid` bigint NOT NULL DEFAULT '0',
  `laststarttime` bigint NOT NULL DEFAULT '0',
  `lastendtime` bigint NOT NULL DEFAULT '0',
  `laststatus` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '5',
  `nextstarttime` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcour_cou_uix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='To store every course backup status';


-- moodle.mdl_backup_logs definição

CREATE TABLE `mdl_backup_logs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `loglevel` smallint NOT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timecreated` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backlogs_bacid_uix` (`backupid`,`id`),
  KEY `mdl_backlogs_bac_ix` (`backupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='To store all the logs from backup and restore operations (by';


-- moodle.mdl_badge definição

CREATE TABLE `mdl_badge` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `usercreated` bigint NOT NULL,
  `usermodified` bigint NOT NULL,
  `issuername` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `issuerurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `issuercontact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiredate` bigint DEFAULT NULL,
  `expireperiod` bigint DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `courseid` bigint DEFAULT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `messagesubject` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment` tinyint(1) NOT NULL DEFAULT '1',
  `notification` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `nextcron` bigint DEFAULT NULL,
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagecaption` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_badg_typ_ix` (`type`),
  KEY `mdl_badg_cou_ix` (`courseid`),
  KEY `mdl_badg_use_ix` (`usermodified`),
  KEY `mdl_badg_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Defines badge';


-- moodle.mdl_badge_alignment definição

CREATE TABLE `mdl_badge_alignment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `badgeid` bigint NOT NULL DEFAULT '0',
  `targetname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `targeturl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `targetdescription` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `targetframework` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `targetcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgalig_bad_ix` (`badgeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Defines alignment for badges';


-- moodle.mdl_badge_backpack definição

CREATE TABLE `mdl_badge_backpack` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL DEFAULT '0',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `backpackuid` bigint NOT NULL,
  `autosync` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `externalbackpackid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgback_useext_uix` (`userid`,`externalbackpackid`),
  KEY `mdl_badgback_use_ix` (`userid`),
  KEY `mdl_badgback_ext_ix` (`externalbackpackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Defines settings for connecting external backpack';


-- moodle.mdl_badge_backpack_oauth2 definição

CREATE TABLE `mdl_badge_backpack_oauth2` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usermodified` bigint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL,
  `issuerid` bigint NOT NULL,
  `externalbackpackid` bigint NOT NULL,
  `token` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `refreshtoken` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` bigint DEFAULT NULL,
  `scope` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_badgbackoaut_use_ix` (`usermodified`),
  KEY `mdl_badgbackoaut_use2_ix` (`userid`),
  KEY `mdl_badgbackoaut_iss_ix` (`issuerid`),
  KEY `mdl_badgbackoaut_ext_ix` (`externalbackpackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Default comment for the table, please edit me';


-- moodle.mdl_badge_criteria definição

CREATE TABLE `mdl_badge_criteria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `badgeid` bigint NOT NULL DEFAULT '0',
  `criteriatype` bigint DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '1',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionformat` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgcrit_badcri_uix` (`badgeid`,`criteriatype`),
  KEY `mdl_badgcrit_cri_ix` (`criteriatype`),
  KEY `mdl_badgcrit_bad_ix` (`badgeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Defines criteria for issuing badges';


-- moodle.mdl_badge_criteria_met definição

CREATE TABLE `mdl_badge_criteria_met` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `issuedid` bigint DEFAULT NULL,
  `critid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `datemet` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgcritmet_cri_ix` (`critid`),
  KEY `mdl_badgcritmet_use_ix` (`userid`),
  KEY `mdl_badgcritmet_iss_ix` (`issuedid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Defines criteria that were met for an issued badge';


-- moodle.mdl_badge_criteria_param definição

CREATE TABLE `mdl_badge_criteria_param` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `critid` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgcritpara_cri_ix` (`critid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Defines parameters for badges criteria';


-- moodle.mdl_badge_endorsement definição

CREATE TABLE `mdl_badge_endorsement` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `badgeid` bigint NOT NULL DEFAULT '0',
  `issuername` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `issuerurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `issueremail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `claimid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `claimcomment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dateissued` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_badgendo_bad_ix` (`badgeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Defines endorsement for badge';


-- moodle.mdl_badge_external definição

CREATE TABLE `mdl_badge_external` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `backpackid` bigint NOT NULL,
  `collectionid` bigint NOT NULL,
  `entityid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assertion` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_badgexte_bac_ix` (`backpackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Setting for external badges display';


-- moodle.mdl_badge_external_backpack definição

CREATE TABLE `mdl_badge_external_backpack` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `backpackapiurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `backpackweburl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `apiversion` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint NOT NULL DEFAULT '0',
  `oauth2_issuerid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgexteback_bac_uix` (`backpackapiurl`),
  UNIQUE KEY `mdl_badgexteback_bac2_uix` (`backpackweburl`),
  KEY `mdl_badgexteback_oau_ix` (`oauth2_issuerid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Defines settings for site level backpacks that a user can co';


-- moodle.mdl_badge_external_identifier definição

CREATE TABLE `mdl_badge_external_identifier` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sitebackpackid` bigint NOT NULL,
  `internalid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `externalid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgexteiden_sitintext_uix` (`sitebackpackid`,`internalid`,`externalid`,`type`),
  KEY `mdl_badgexteiden_sit_ix` (`sitebackpackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Setting for external badges mappings';


-- moodle.mdl_badge_issued definição

CREATE TABLE `mdl_badge_issued` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `badgeid` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `uniquehash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateissued` bigint NOT NULL DEFAULT '0',
  `dateexpire` bigint DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `issuernotified` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgissu_baduse_uix` (`badgeid`,`userid`),
  KEY `mdl_badgissu_bad_ix` (`badgeid`),
  KEY `mdl_badgissu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Defines issued badges';


-- moodle.mdl_badge_manual_award definição

CREATE TABLE `mdl_badge_manual_award` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `badgeid` bigint NOT NULL,
  `recipientid` bigint NOT NULL,
  `issuerid` bigint NOT NULL,
  `issuerrole` bigint NOT NULL,
  `datemet` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgmanuawar_bad_ix` (`badgeid`),
  KEY `mdl_badgmanuawar_rec_ix` (`recipientid`),
  KEY `mdl_badgmanuawar_iss_ix` (`issuerid`),
  KEY `mdl_badgmanuawar_iss2_ix` (`issuerrole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Track manual award criteria for badges';


-- moodle.mdl_badge_related definição

CREATE TABLE `mdl_badge_related` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `badgeid` bigint NOT NULL DEFAULT '0',
  `relatedbadgeid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgrela_badrel_uix` (`badgeid`,`relatedbadgeid`),
  KEY `mdl_badgrela_bad_ix` (`badgeid`),
  KEY `mdl_badgrela_rel_ix` (`relatedbadgeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Defines badge related for badges';


-- moodle.mdl_bigbluebuttonbn definição

CREATE TABLE `mdl_bigbluebuttonbn` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` tinyint NOT NULL DEFAULT '0',
  `course` bigint NOT NULL DEFAULT '0',
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `introformat` smallint NOT NULL DEFAULT '1',
  `meetingid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `moderatorpass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `viewerpass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `wait` tinyint(1) NOT NULL DEFAULT '0',
  `record` tinyint(1) NOT NULL DEFAULT '0',
  `recordallfromstart` tinyint(1) NOT NULL DEFAULT '0',
  `recordhidebutton` tinyint(1) NOT NULL DEFAULT '0',
  `welcome` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `voicebridge` mediumint NOT NULL DEFAULT '0',
  `openingtime` bigint NOT NULL DEFAULT '0',
  `closingtime` bigint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `presentation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `participants` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `userlimit` smallint NOT NULL DEFAULT '0',
  `recordings_html` tinyint(1) NOT NULL DEFAULT '0',
  `recordings_deleted` tinyint(1) NOT NULL DEFAULT '1',
  `recordings_imported` tinyint(1) NOT NULL DEFAULT '0',
  `recordings_preview` tinyint(1) NOT NULL DEFAULT '0',
  `clienttype` tinyint(1) NOT NULL DEFAULT '0',
  `muteonstart` tinyint(1) NOT NULL DEFAULT '0',
  `disablecam` tinyint(1) NOT NULL DEFAULT '0',
  `disablemic` tinyint(1) NOT NULL DEFAULT '0',
  `disableprivatechat` tinyint(1) NOT NULL DEFAULT '0',
  `disablepublicchat` tinyint(1) NOT NULL DEFAULT '0',
  `disablenote` tinyint(1) NOT NULL DEFAULT '0',
  `hideuserlist` tinyint(1) NOT NULL DEFAULT '0',
  `completionattendance` int NOT NULL DEFAULT '0',
  `completionengagementchats` int NOT NULL DEFAULT '0',
  `completionengagementtalks` int NOT NULL DEFAULT '0',
  `completionengagementraisehand` int NOT NULL DEFAULT '0',
  `completionengagementpollvotes` int NOT NULL DEFAULT '0',
  `completionengagementemojis` int NOT NULL DEFAULT '0',
  `guestallowed` tinyint DEFAULT '0',
  `mustapproveuser` tinyint DEFAULT '1',
  `guestlinkuid` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guestpassword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `showpresentation` tinyint(1) NOT NULL DEFAULT '1',
  `grade` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='The bigbluebuttonbn table to store information about a meeti';


-- moodle.mdl_bigbluebuttonbn_logs definição

CREATE TABLE `mdl_bigbluebuttonbn_logs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `courseid` bigint NOT NULL,
  `bigbluebuttonbnid` bigint NOT NULL,
  `userid` bigint DEFAULT NULL,
  `timecreated` bigint NOT NULL DEFAULT '0',
  `meetingid` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `log` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_bigblogs_cou_ix` (`courseid`),
  KEY `mdl_bigblogs_log_ix` (`log`),
  KEY `mdl_bigblogs_coubiguselog_ix` (`courseid`,`bigbluebuttonbnid`,`userid`,`log`),
  KEY `mdl_bigblogs_uselog_ix` (`userid`,`log`),
  KEY `mdl_bigblogs_coubig_ix` (`courseid`,`bigbluebuttonbnid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='The bigbluebuttonbn table to store meeting activity events';


-- moodle.mdl_bigbluebuttonbn_recordings definição

CREATE TABLE `mdl_bigbluebuttonbn_recordings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `courseid` bigint NOT NULL,
  `bigbluebuttonbnid` bigint NOT NULL,
  `groupid` bigint DEFAULT NULL,
  `recordingid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `headless` tinyint(1) NOT NULL DEFAULT '0',
  `imported` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `importeddata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `timecreated` bigint NOT NULL DEFAULT '0',
  `usermodified` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_bigbreco_cou_ix` (`courseid`),
  KEY `mdl_bigbreco_rec_ix` (`recordingid`),
  KEY `mdl_bigbreco_big_ix` (`bigbluebuttonbnid`),
  KEY `mdl_bigbreco_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='The bigbluebuttonbn table to store references to recordings';


-- moodle.mdl_block definição

CREATE TABLE `mdl_block` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cron` bigint NOT NULL DEFAULT '0',
  `lastcron` bigint NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_bloc_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='contains all installed blocks';


-- moodle.mdl_block_instances definição

CREATE TABLE `mdl_block_instances` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `blockname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `parentcontextid` bigint NOT NULL,
  `showinsubcontexts` smallint NOT NULL,
  `requiredbytheme` smallint NOT NULL DEFAULT '0',
  `pagetypepattern` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `subpagepattern` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `defaultregion` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `defaultweight` bigint NOT NULL,
  `configdata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blocinst_parshopagsub_ix` (`parentcontextid`,`showinsubcontexts`,`pagetypepattern`,`subpagepattern`),
  KEY `mdl_blocinst_tim_ix` (`timemodified`),
  KEY `mdl_blocinst_blo_ix` (`blockname`),
  KEY `mdl_blocinst_par_ix` (`parentcontextid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='This table stores block instances. The type of block this is';


-- moodle.mdl_block_positions definição

CREATE TABLE `mdl_block_positions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `blockinstanceid` bigint NOT NULL,
  `contextid` bigint NOT NULL,
  `pagetype` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `subpage` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `visible` smallint NOT NULL,
  `region` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `weight` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_blocposi_bloconpagsub_uix` (`blockinstanceid`,`contextid`,`pagetype`,`subpage`),
  KEY `mdl_blocposi_blo_ix` (`blockinstanceid`),
  KEY `mdl_blocposi_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores the position of a sticky block_instance on a another ';


-- moodle.mdl_block_recent_activity definição

CREATE TABLE `mdl_block_recent_activity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `courseid` bigint NOT NULL,
  `cmid` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `action` tinyint(1) NOT NULL,
  `modname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blocreceacti_coutim_ix` (`courseid`,`timecreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Recent activity block';


-- moodle.mdl_block_recentlyaccesseditems definição

CREATE TABLE `mdl_block_recentlyaccesseditems` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `courseid` bigint NOT NULL,
  `cmid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `timeaccess` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_blocrece_usecoucmi_uix` (`userid`,`courseid`,`cmid`),
  KEY `mdl_blocrece_use_ix` (`userid`),
  KEY `mdl_blocrece_cou_ix` (`courseid`),
  KEY `mdl_blocrece_cmi_ix` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Most recently accessed items accessed by a user';


-- moodle.mdl_block_rss_client definição

CREATE TABLE `mdl_block_rss_client` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL DEFAULT '0',
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `preferredtitle` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shared` tinyint NOT NULL DEFAULT '0',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `skiptime` bigint NOT NULL DEFAULT '0',
  `skipuntil` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Remote news feed information. Contains the news feed id, the';


-- moodle.mdl_blog_association definição

CREATE TABLE `mdl_blog_association` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contextid` bigint NOT NULL,
  `blogid` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blogasso_con_ix` (`contextid`),
  KEY `mdl_blogasso_blo_ix` (`blogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Associations of blog entries with courses and module instanc';


-- moodle.mdl_blog_external definição

CREATE TABLE `mdl_blog_external` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `filtertags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `failedlastsync` tinyint(1) NOT NULL DEFAULT '0',
  `timemodified` bigint DEFAULT NULL,
  `timefetched` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_blogexte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='External blog links used for RSS copying of blog entries to ';


-- moodle.mdl_book definição

CREATE TABLE `mdl_book` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL DEFAULT '0',
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `introformat` smallint NOT NULL DEFAULT '0',
  `numbering` smallint NOT NULL DEFAULT '0',
  `navstyle` smallint NOT NULL DEFAULT '1',
  `customtitles` tinyint NOT NULL DEFAULT '0',
  `revision` bigint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_book_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Defines book';


-- moodle.mdl_book_chapters definição

CREATE TABLE `mdl_book_chapters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bookid` bigint NOT NULL DEFAULT '0',
  `pagenum` bigint NOT NULL DEFAULT '0',
  `subchapter` bigint NOT NULL DEFAULT '0',
  `title` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contentformat` smallint NOT NULL DEFAULT '0',
  `hidden` tinyint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `importsrc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_bookchap_boo_ix` (`bookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Defines book_chapters';


-- moodle.mdl_cache_filters definição

CREATE TABLE `mdl_cache_filters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `version` bigint NOT NULL DEFAULT '0',
  `md5key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rawtext` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachfilt_filmd5_ix` (`filter`,`md5key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='For keeping information about cached data';


-- moodle.mdl_cache_flags definição

CREATE TABLE `mdl_cache_flags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `flagtype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_cachflag_fla_ix` (`flagtype`),
  KEY `mdl_cachflag_nam_ix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Cache of time-sensitive flags';


-- moodle.mdl_capabilities definição

CREATE TABLE `mdl_capabilities` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `captype` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contextlevel` bigint NOT NULL DEFAULT '0',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `riskbitmask` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_capa_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=757 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='this defines all capabilities';


-- moodle.mdl_choice definição

CREATE TABLE `mdl_choice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL DEFAULT '0',
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `introformat` smallint NOT NULL DEFAULT '0',
  `publish` tinyint NOT NULL DEFAULT '0',
  `showresults` tinyint NOT NULL DEFAULT '0',
  `display` smallint NOT NULL DEFAULT '0',
  `allowupdate` tinyint NOT NULL DEFAULT '0',
  `allowmultiple` tinyint NOT NULL DEFAULT '0',
  `showunanswered` tinyint NOT NULL DEFAULT '0',
  `includeinactive` tinyint NOT NULL DEFAULT '1',
  `limitanswers` tinyint NOT NULL DEFAULT '0',
  `timeopen` bigint NOT NULL DEFAULT '0',
  `timeclose` bigint NOT NULL DEFAULT '0',
  `showpreview` tinyint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  `showavailable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choi_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Available choices are stored here';


-- moodle.mdl_choice_answers definição

CREATE TABLE `mdl_choice_answers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `choiceid` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `optionid` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiansw_use_ix` (`userid`),
  KEY `mdl_choiansw_cho_ix` (`choiceid`),
  KEY `mdl_choiansw_opt_ix` (`optionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='choices performed by users';


-- moodle.mdl_choice_options definição

CREATE TABLE `mdl_choice_options` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `choiceid` bigint NOT NULL DEFAULT '0',
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `maxanswers` bigint DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiopti_cho_ix` (`choiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='available options to choice';


-- moodle.mdl_cohort definição

CREATE TABLE `mdl_cohort` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contextid` bigint NOT NULL,
  `name` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionformat` tinyint NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `theme` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_coho_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Each record represents one cohort (aka site-wide group).';


-- moodle.mdl_cohort_members definição

CREATE TABLE `mdl_cohort_members` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cohortid` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `timeadded` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cohomemb_cohuse_uix` (`cohortid`,`userid`),
  KEY `mdl_cohomemb_coh_ix` (`cohortid`),
  KEY `mdl_cohomemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Link a user to a cohort.';


-- moodle.mdl_comments definição

CREATE TABLE `mdl_comments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contextid` bigint NOT NULL,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commentarea` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `format` tinyint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_comm_concomite_ix` (`contextid`,`commentarea`,`itemid`),
  KEY `mdl_comm_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='moodle comments module';


-- moodle.mdl_communication definição

CREATE TABLE `mdl_communication` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contextid` bigint NOT NULL,
  `instanceid` bigint NOT NULL,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instancetype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `provider` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `roomname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatarfilename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `avatarsynced` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_comm_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Communication records';


-- moodle.mdl_communication_customlink definição

CREATE TABLE `mdl_communication_customlink` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `commid` bigint NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_commcust_com_ix` (`commid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores the link associated with a custom link communication ';


-- moodle.mdl_communication_user definição

CREATE TABLE `mdl_communication_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `commid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `synced` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_commuser_com_ix` (`commid`),
  KEY `mdl_commuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Communication user records mapping';


-- moodle.mdl_competency definição

CREATE TABLE `mdl_competency` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shortname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionformat` smallint NOT NULL DEFAULT '0',
  `idnumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `competencyframeworkid` bigint NOT NULL,
  `parentid` bigint NOT NULL DEFAULT '0',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint NOT NULL,
  `ruletype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ruleoutcome` tinyint NOT NULL DEFAULT '0',
  `ruleconfig` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `scaleid` bigint DEFAULT NULL,
  `scaleconfiguration` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `usermodified` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_comp_comidn_uix` (`competencyframeworkid`,`idnumber`),
  KEY `mdl_comp_rul_ix` (`ruleoutcome`),
  KEY `mdl_comp_sca_ix` (`scaleid`),
  KEY `mdl_comp_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='This table contains the master record of each competency in ';


-- moodle.mdl_competency_coursecomp definição

CREATE TABLE `mdl_competency_coursecomp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `courseid` bigint NOT NULL,
  `competencyid` bigint NOT NULL,
  `ruleoutcome` tinyint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `usermodified` bigint NOT NULL,
  `sortorder` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compcour_coucom_uix` (`courseid`,`competencyid`),
  KEY `mdl_compcour_courul_ix` (`courseid`,`ruleoutcome`),
  KEY `mdl_compcour_cou2_ix` (`courseid`),
  KEY `mdl_compcour_com_ix` (`competencyid`),
  KEY `mdl_compcour_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Link a competency to a course.';


-- moodle.mdl_competency_coursecompsetting definição

CREATE TABLE `mdl_competency_coursecompsetting` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `courseid` bigint NOT NULL,
  `pushratingstouserplans` tinyint DEFAULT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `usermodified` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compcour_cou_uix` (`courseid`),
  KEY `mdl_compcour_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='This table contains the course specific settings for compete';


-- moodle.mdl_competency_evidence definição

CREATE TABLE `mdl_competency_evidence` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usercompetencyid` bigint NOT NULL,
  `contextid` bigint NOT NULL,
  `action` tinyint NOT NULL,
  `actionuserid` bigint DEFAULT NULL,
  `descidentifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `desccomponent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `desca` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grade` bigint DEFAULT NULL,
  `note` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `usermodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_compevid_use_ix` (`usercompetencyid`),
  KEY `mdl_compevid_con_ix` (`contextid`),
  KEY `mdl_compevid_act_ix` (`actionuserid`),
  KEY `mdl_compevid_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='The evidence linked to a user competency';


-- moodle.mdl_competency_framework definição

CREATE TABLE `mdl_competency_framework` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shortname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contextid` bigint NOT NULL,
  `idnumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionformat` smallint NOT NULL DEFAULT '0',
  `scaleid` bigint DEFAULT NULL,
  `scaleconfiguration` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible` tinyint NOT NULL DEFAULT '1',
  `taxonomies` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `usermodified` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compfram_idn_uix` (`idnumber`),
  KEY `mdl_compfram_con_ix` (`contextid`),
  KEY `mdl_compfram_sca_ix` (`scaleid`),
  KEY `mdl_compfram_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='List of competency frameworks.';


-- moodle.mdl_competency_modulecomp definição

CREATE TABLE `mdl_competency_modulecomp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cmid` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `usermodified` bigint NOT NULL,
  `sortorder` bigint NOT NULL,
  `competencyid` bigint NOT NULL,
  `ruleoutcome` tinyint NOT NULL,
  `overridegrade` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compmodu_cmicom_uix` (`cmid`,`competencyid`),
  KEY `mdl_compmodu_cmirul_ix` (`cmid`,`ruleoutcome`),
  KEY `mdl_compmodu_cmi_ix` (`cmid`),
  KEY `mdl_compmodu_com_ix` (`competencyid`),
  KEY `mdl_compmodu_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Link a competency to a module.';


-- moodle.mdl_competency_plan definição

CREATE TABLE `mdl_competency_plan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionformat` smallint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL,
  `templateid` bigint DEFAULT NULL,
  `origtemplateid` bigint DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `duedate` bigint DEFAULT '0',
  `reviewerid` bigint DEFAULT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL DEFAULT '0',
  `usermodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_compplan_usesta_ix` (`userid`,`status`),
  KEY `mdl_compplan_tem_ix` (`templateid`),
  KEY `mdl_compplan_stadue_ix` (`status`,`duedate`),
  KEY `mdl_compplan_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Learning plans';


-- moodle.mdl_competency_plancomp definição

CREATE TABLE `mdl_competency_plancomp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `planid` bigint NOT NULL,
  `competencyid` bigint NOT NULL,
  `sortorder` bigint DEFAULT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint DEFAULT NULL,
  `usermodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compplan_placom_uix` (`planid`,`competencyid`),
  KEY `mdl_compplan_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Plan competencies';


-- moodle.mdl_competency_relatedcomp definição

CREATE TABLE `mdl_competency_relatedcomp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `competencyid` bigint NOT NULL,
  `relatedcompetencyid` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint DEFAULT NULL,
  `usermodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_comprela_com_ix` (`competencyid`),
  KEY `mdl_comprela_rel_ix` (`relatedcompetencyid`),
  KEY `mdl_comprela_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Related competencies';


-- moodle.mdl_competency_template definição

CREATE TABLE `mdl_competency_template` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shortname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contextid` bigint NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionformat` smallint NOT NULL DEFAULT '0',
  `visible` tinyint NOT NULL DEFAULT '1',
  `duedate` bigint DEFAULT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `usermodified` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_comptemp_con_ix` (`contextid`),
  KEY `mdl_comptemp_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Learning plan templates.';


-- moodle.mdl_competency_templatecohort definição

CREATE TABLE `mdl_competency_templatecohort` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `templateid` bigint NOT NULL,
  `cohortid` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `usermodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_comptemp_temcoh_uix` (`templateid`,`cohortid`),
  KEY `mdl_comptemp_tem2_ix` (`templateid`),
  KEY `mdl_comptemp_use3_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Default comment for the table, please edit me';


-- moodle.mdl_competency_templatecomp definição

CREATE TABLE `mdl_competency_templatecomp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `templateid` bigint NOT NULL,
  `competencyid` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `usermodified` bigint NOT NULL,
  `sortorder` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_comptemp_tem_ix` (`templateid`),
  KEY `mdl_comptemp_com_ix` (`competencyid`),
  KEY `mdl_comptemp_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Link a competency to a learning plan template.';


-- moodle.mdl_competency_usercomp definição

CREATE TABLE `mdl_competency_usercomp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL,
  `competencyid` bigint NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `reviewerid` bigint DEFAULT NULL,
  `proficiency` tinyint DEFAULT NULL,
  `grade` bigint DEFAULT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint DEFAULT NULL,
  `usermodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compuser_usecom_uix` (`userid`,`competencyid`),
  KEY `mdl_compuser_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='User competencies';


-- moodle.mdl_competency_usercompcourse definição

CREATE TABLE `mdl_competency_usercompcourse` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL,
  `courseid` bigint NOT NULL,
  `competencyid` bigint NOT NULL,
  `proficiency` tinyint DEFAULT NULL,
  `grade` bigint DEFAULT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint DEFAULT NULL,
  `usermodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compuser_usecoucom_uix` (`userid`,`courseid`,`competencyid`),
  KEY `mdl_compuser_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='User competencies in a course';


-- moodle.mdl_competency_usercompplan definição

CREATE TABLE `mdl_competency_usercompplan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL,
  `competencyid` bigint NOT NULL,
  `planid` bigint NOT NULL,
  `proficiency` tinyint DEFAULT NULL,
  `grade` bigint DEFAULT NULL,
  `sortorder` bigint DEFAULT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint DEFAULT NULL,
  `usermodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compuser_usecompla_uix` (`userid`,`competencyid`,`planid`),
  KEY `mdl_compuser_use3_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='User competencies plans';


-- moodle.mdl_competency_userevidence definição

CREATE TABLE `mdl_competency_userevidence` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descriptionformat` tinyint(1) NOT NULL,
  `url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `usermodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_compuser_use4_ix` (`userid`),
  KEY `mdl_compuser_use5_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='The evidence of prior learning';


-- moodle.mdl_competency_userevidencecomp definição

CREATE TABLE `mdl_competency_userevidencecomp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userevidenceid` bigint NOT NULL,
  `competencyid` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `usermodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compuser_usecom2_uix` (`userevidenceid`,`competencyid`),
  KEY `mdl_compuser_use6_ix` (`userevidenceid`),
  KEY `mdl_compuser_use7_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Relationship between user evidence and competencies';


-- moodle.mdl_config definição

CREATE TABLE `mdl_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_conf_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=586 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Moodle configuration variables';


-- moodle.mdl_config_log definição

CREATE TABLE `mdl_config_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `plugin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `oldvalue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_conflog_tim_ix` (`timemodified`),
  KEY `mdl_conflog_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=1744 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Changes done in server configuration through admin UI';


-- moodle.mdl_config_plugins definição

CREATE TABLE `mdl_config_plugins` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `plugin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'core',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_confplug_plunam_uix` (`plugin`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1983 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Moodle modules and plugins configuration variables';


-- moodle.mdl_contentbank_content definição

CREATE TABLE `mdl_contentbank_content` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contenttype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint NOT NULL,
  `visibility` tinyint(1) NOT NULL DEFAULT '1',
  `instanceid` bigint DEFAULT NULL,
  `configdata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `usercreated` bigint NOT NULL,
  `usermodified` bigint DEFAULT NULL,
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_contcont_nam_ix` (`name`),
  KEY `mdl_contcont_conconins_ix` (`contextid`,`contenttype`,`instanceid`),
  KEY `mdl_contcont_con_ix` (`contextid`),
  KEY `mdl_contcont_use_ix` (`usermodified`),
  KEY `mdl_contcont_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='This table stores content data in the content bank.';


-- moodle.mdl_context definição

CREATE TABLE `mdl_context` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contextlevel` bigint NOT NULL DEFAULT '0',
  `instanceid` bigint NOT NULL DEFAULT '0',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `depth` tinyint NOT NULL DEFAULT '0',
  `locked` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cont_conins_uix` (`contextlevel`,`instanceid`),
  KEY `mdl_cont_ins_ix` (`instanceid`),
  KEY `mdl_cont_pat_ix` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='one of these must be set';


-- moodle.mdl_context_temp definição

CREATE TABLE `mdl_context_temp` (
  `id` bigint NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `depth` tinyint NOT NULL,
  `locked` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Used by build_context_path() in upgrade and cron to keep con';


-- moodle.mdl_course definição

CREATE TABLE `mdl_course` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category` bigint NOT NULL DEFAULT '0',
  `sortorder` bigint NOT NULL DEFAULT '0',
  `fullname` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `summaryformat` tinyint NOT NULL DEFAULT '0',
  `format` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'topics',
  `showgrades` tinyint NOT NULL DEFAULT '1',
  `newsitems` mediumint NOT NULL DEFAULT '1',
  `startdate` bigint NOT NULL DEFAULT '0',
  `enddate` bigint NOT NULL DEFAULT '0',
  `relativedatesmode` tinyint(1) NOT NULL DEFAULT '0',
  `marker` bigint NOT NULL DEFAULT '0',
  `maxbytes` bigint NOT NULL DEFAULT '0',
  `legacyfiles` smallint NOT NULL DEFAULT '0',
  `showreports` smallint NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `downloadcontent` tinyint(1) DEFAULT NULL,
  `groupmode` smallint NOT NULL DEFAULT '0',
  `groupmodeforce` smallint NOT NULL DEFAULT '0',
  `defaultgroupingid` bigint NOT NULL DEFAULT '0',
  `lang` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `calendartype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `theme` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `requested` tinyint(1) NOT NULL DEFAULT '0',
  `enablecompletion` tinyint(1) NOT NULL DEFAULT '0',
  `completionnotify` tinyint(1) NOT NULL DEFAULT '0',
  `cacherev` bigint NOT NULL DEFAULT '0',
  `originalcourseid` bigint DEFAULT NULL,
  `showactivitydates` tinyint(1) NOT NULL DEFAULT '0',
  `showcompletionconditions` tinyint(1) DEFAULT NULL,
  `pdfexportfont` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enableaitools` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_cour_cat_ix` (`category`),
  KEY `mdl_cour_idn_ix` (`idnumber`),
  KEY `mdl_cour_sho_ix` (`shortname`),
  KEY `mdl_cour_sor_ix` (`sortorder`),
  KEY `mdl_cour_ori_ix` (`originalcourseid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Central course table';


-- moodle.mdl_course_categories definição

CREATE TABLE `mdl_course_categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionformat` tinyint NOT NULL DEFAULT '0',
  `parent` bigint NOT NULL DEFAULT '0',
  `sortorder` bigint NOT NULL DEFAULT '0',
  `coursecount` bigint NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `depth` bigint NOT NULL DEFAULT '0',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `theme` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcate_par_ix` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Course categories';


-- moodle.mdl_course_completion_aggr_methd definição

CREATE TABLE `mdl_course_completion_aggr_methd` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL DEFAULT '0',
  `criteriatype` bigint DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '0',
  `value` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompaggrmeth_coucr_uix` (`course`,`criteriatype`),
  KEY `mdl_courcompaggrmeth_cou_ix` (`course`),
  KEY `mdl_courcompaggrmeth_cri_ix` (`criteriatype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Course completion aggregation methods for criteria';


-- moodle.mdl_course_completion_crit_compl definição

CREATE TABLE `mdl_course_completion_crit_compl` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL DEFAULT '0',
  `course` bigint NOT NULL DEFAULT '0',
  `criteriaid` bigint NOT NULL DEFAULT '0',
  `gradefinal` decimal(10,5) DEFAULT NULL,
  `unenroled` bigint DEFAULT NULL,
  `timecompleted` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompcritcomp_useco_uix` (`userid`,`course`,`criteriaid`),
  KEY `mdl_courcompcritcomp_use_ix` (`userid`),
  KEY `mdl_courcompcritcomp_cou_ix` (`course`),
  KEY `mdl_courcompcritcomp_cri_ix` (`criteriaid`),
  KEY `mdl_courcompcritcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Course completion user records';


-- moodle.mdl_course_completion_criteria definição

CREATE TABLE `mdl_course_completion_criteria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL DEFAULT '0',
  `criteriatype` bigint NOT NULL DEFAULT '0',
  `module` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `moduleinstance` bigint DEFAULT NULL,
  `courseinstance` bigint DEFAULT NULL,
  `enrolperiod` bigint DEFAULT NULL,
  `timeend` bigint DEFAULT NULL,
  `gradepass` decimal(10,5) DEFAULT NULL,
  `role` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcompcrit_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Course completion criteria';


-- moodle.mdl_course_completion_defaults definição

CREATE TABLE `mdl_course_completion_defaults` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL,
  `module` bigint NOT NULL,
  `completion` tinyint(1) NOT NULL DEFAULT '0',
  `completionview` tinyint(1) NOT NULL DEFAULT '0',
  `completionusegrade` tinyint(1) NOT NULL DEFAULT '0',
  `completionpassgrade` tinyint(1) NOT NULL DEFAULT '0',
  `completionexpected` bigint NOT NULL DEFAULT '0',
  `customrules` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompdefa_coumod_uix` (`course`,`module`),
  KEY `mdl_courcompdefa_mod_ix` (`module`),
  KEY `mdl_courcompdefa_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Default settings for activities completion';


-- moodle.mdl_course_completions definição

CREATE TABLE `mdl_course_completions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL DEFAULT '0',
  `course` bigint NOT NULL DEFAULT '0',
  `timeenrolled` bigint NOT NULL DEFAULT '0',
  `timestarted` bigint NOT NULL DEFAULT '0',
  `timecompleted` bigint DEFAULT NULL,
  `reaggregate` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcomp_usecou_uix` (`userid`,`course`),
  KEY `mdl_courcomp_use_ix` (`userid`),
  KEY `mdl_courcomp_cou_ix` (`course`),
  KEY `mdl_courcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Course completion records';


-- moodle.mdl_course_format_options definição

CREATE TABLE `mdl_course_format_options` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `courseid` bigint NOT NULL,
  `format` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sectionid` bigint NOT NULL DEFAULT '0',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courformopti_couforsec_uix` (`courseid`,`format`,`sectionid`,`name`),
  KEY `mdl_courformopti_cou_ix` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores format-specific options for the course or course sect';


-- moodle.mdl_course_modules definição

CREATE TABLE `mdl_course_modules` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL DEFAULT '0',
  `module` bigint NOT NULL DEFAULT '0',
  `instance` bigint NOT NULL DEFAULT '0',
  `section` bigint NOT NULL DEFAULT '0',
  `idnumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added` bigint NOT NULL DEFAULT '0',
  `score` smallint NOT NULL DEFAULT '0',
  `indent` mediumint NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleoncoursepage` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint NOT NULL DEFAULT '0',
  `groupingid` bigint NOT NULL DEFAULT '0',
  `completion` tinyint(1) NOT NULL DEFAULT '0',
  `completiongradeitemnumber` bigint DEFAULT NULL,
  `completionview` tinyint(1) NOT NULL DEFAULT '0',
  `completionexpected` bigint NOT NULL DEFAULT '0',
  `completionpassgrade` tinyint(1) NOT NULL DEFAULT '0',
  `showdescription` tinyint(1) NOT NULL DEFAULT '0',
  `availability` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `deletioninprogress` tinyint(1) NOT NULL DEFAULT '0',
  `downloadcontent` tinyint(1) DEFAULT '1',
  `lang` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enableaitools` tinyint(1) DEFAULT NULL,
  `enabledaiactions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_courmodu_vis_ix` (`visible`),
  KEY `mdl_courmodu_cou_ix` (`course`),
  KEY `mdl_courmodu_mod_ix` (`module`),
  KEY `mdl_courmodu_ins_ix` (`instance`),
  KEY `mdl_courmodu_idncou_ix` (`idnumber`,`course`),
  KEY `mdl_courmodu_gro_ix` (`groupingid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='course_modules table retrofitted from MySQL';


-- moodle.mdl_course_modules_completion definição

CREATE TABLE `mdl_course_modules_completion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `completionstate` tinyint(1) NOT NULL,
  `overrideby` bigint DEFAULT NULL,
  `timemodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courmoducomp_usecou_uix` (`userid`,`coursemoduleid`),
  KEY `mdl_courmoducomp_cou_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores the completion state (completed or not completed, etc';


-- moodle.mdl_course_modules_viewed definição

CREATE TABLE `mdl_course_modules_viewed` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courmoduview_usecou_uix` (`userid`,`coursemoduleid`),
  KEY `mdl_courmoduview_cou_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Tracks the completion viewed (viewed with cmid/userid and ot';


-- moodle.mdl_course_published definição

CREATE TABLE `mdl_course_published` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `huburl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `courseid` bigint NOT NULL,
  `timepublished` bigint NOT NULL,
  `enrollable` tinyint(1) NOT NULL DEFAULT '1',
  `hubcourseid` bigint NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `timechecked` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courpubl_hub_ix` (`hubcourseid`),
  KEY `mdl_courpubl_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Information about how and when an local courses were publish';


-- moodle.mdl_course_request definição

CREATE TABLE `mdl_course_request` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fullname` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summaryformat` tinyint NOT NULL DEFAULT '0',
  `category` bigint NOT NULL DEFAULT '0',
  `reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `requester` bigint NOT NULL DEFAULT '0',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_courrequ_sho_ix` (`shortname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='course requests';


-- moodle.mdl_course_sections definição

CREATE TABLE `mdl_course_sections` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL DEFAULT '0',
  `section` bigint NOT NULL DEFAULT '0',
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `summaryformat` tinyint NOT NULL DEFAULT '0',
  `sequence` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `availability` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemid` bigint DEFAULT NULL,
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_coursect_cousec_uix` (`course`,`section`),
  KEY `mdl_coursect_comite_ix` (`component`,`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='to define the sections for each course';


-- moodle.mdl_customfield_category definição

CREATE TABLE `mdl_customfield_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionformat` bigint DEFAULT NULL,
  `sortorder` bigint DEFAULT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `area` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint NOT NULL DEFAULT '0',
  `contextid` bigint DEFAULT NULL,
  `shared` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_custcate_comareitesor_ix` (`component`,`area`,`itemid`,`sortorder`),
  KEY `mdl_custcate_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='core_customfield category table';


-- moodle.mdl_customfield_data definição

CREATE TABLE `mdl_customfield_data` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fieldid` bigint NOT NULL,
  `instanceid` bigint NOT NULL,
  `intvalue` bigint DEFAULT NULL,
  `decvalue` decimal(10,5) DEFAULT NULL,
  `shortcharvalue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charvalue` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `valueformat` bigint NOT NULL,
  `valuetrust` tinyint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `contextid` bigint DEFAULT NULL,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `area` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_custdata_insfiecomarei_uix` (`instanceid`,`fieldid`,`component`,`area`,`itemid`),
  KEY `mdl_custdata_fieint_ix` (`fieldid`,`intvalue`),
  KEY `mdl_custdata_fiesho_ix` (`fieldid`,`shortcharvalue`),
  KEY `mdl_custdata_fiedec_ix` (`fieldid`,`decvalue`),
  KEY `mdl_custdata_fie_ix` (`fieldid`),
  KEY `mdl_custdata_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='core_customfield data table';


-- moodle.mdl_customfield_field definição

CREATE TABLE `mdl_customfield_field` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shortname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionformat` bigint DEFAULT NULL,
  `sortorder` bigint DEFAULT NULL,
  `categoryid` bigint DEFAULT NULL,
  `configdata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_custfiel_catsor_ix` (`categoryid`,`sortorder`),
  KEY `mdl_custfiel_cat_ix` (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='core_customfield field table';


-- moodle.mdl_customfield_shared definição

CREATE TABLE `mdl_customfield_shared` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `categoryid` bigint NOT NULL,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `area` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint NOT NULL DEFAULT '0',
  `usermodified` bigint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_custshar_catcomareite_uix` (`categoryid`,`component`,`area`,`itemid`),
  KEY `mdl_custshar_cat_ix` (`categoryid`),
  KEY `mdl_custshar_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='core_customfield shared category table';


-- moodle.mdl_data definição

CREATE TABLE `mdl_data` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL DEFAULT '0',
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `introformat` smallint NOT NULL DEFAULT '0',
  `comments` smallint NOT NULL DEFAULT '0',
  `timeavailablefrom` bigint NOT NULL DEFAULT '0',
  `timeavailableto` bigint NOT NULL DEFAULT '0',
  `timeviewfrom` bigint NOT NULL DEFAULT '0',
  `timeviewto` bigint NOT NULL DEFAULT '0',
  `requiredentries` int NOT NULL DEFAULT '0',
  `requiredentriestoview` int NOT NULL DEFAULT '0',
  `maxentries` int NOT NULL DEFAULT '0',
  `rssarticles` smallint NOT NULL DEFAULT '0',
  `singletemplate` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `listtemplate` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `listtemplateheader` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `listtemplatefooter` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `addtemplate` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rsstemplate` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rsstitletemplate` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `csstemplate` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `jstemplate` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `asearchtemplate` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `approval` smallint NOT NULL DEFAULT '0',
  `manageapproved` smallint NOT NULL DEFAULT '1',
  `scale` bigint NOT NULL DEFAULT '0',
  `assessed` bigint NOT NULL DEFAULT '0',
  `assesstimestart` bigint NOT NULL DEFAULT '0',
  `assesstimefinish` bigint NOT NULL DEFAULT '0',
  `defaultsort` bigint NOT NULL DEFAULT '0',
  `defaultsortdir` smallint NOT NULL DEFAULT '0',
  `editany` smallint NOT NULL DEFAULT '0',
  `notification` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `completionentries` bigint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_data_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='all database activities';


-- moodle.mdl_data_content definição

CREATE TABLE `mdl_data_content` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fieldid` bigint NOT NULL DEFAULT '0',
  `recordid` bigint NOT NULL DEFAULT '0',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content2` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content3` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content4` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_datacont_rec_ix` (`recordid`),
  KEY `mdl_datacont_fie_ix` (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='the content introduced in each record/fields';


-- moodle.mdl_data_fields definição

CREATE TABLE `mdl_data_fields` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dataid` bigint NOT NULL DEFAULT '0',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `param1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `param2` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `param3` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `param4` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `param5` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `param6` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `param7` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `param8` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `param9` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `param10` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_datafiel_typdat_ix` (`type`,`dataid`),
  KEY `mdl_datafiel_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='every field available';


-- moodle.mdl_data_records definição

CREATE TABLE `mdl_data_records` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL DEFAULT '0',
  `groupid` bigint NOT NULL DEFAULT '0',
  `dataid` bigint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `approved` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_datareco_dat_ix` (`dataid`),
  KEY `mdl_datareco_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='every record introduced';


-- moodle.mdl_enrol definição

CREATE TABLE `mdl_enrol` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `enrol` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` bigint NOT NULL DEFAULT '0',
  `courseid` bigint NOT NULL,
  `sortorder` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enrolperiod` bigint DEFAULT '0',
  `enrolstartdate` bigint DEFAULT '0',
  `enrolenddate` bigint DEFAULT '0',
  `expirynotify` tinyint(1) DEFAULT '0',
  `expirythreshold` bigint DEFAULT '0',
  `notifyall` tinyint(1) DEFAULT '0',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roleid` bigint DEFAULT '0',
  `customint1` bigint DEFAULT NULL,
  `customint2` bigint DEFAULT NULL,
  `customint3` bigint DEFAULT NULL,
  `customint4` bigint DEFAULT NULL,
  `customint5` bigint DEFAULT NULL,
  `customint6` bigint DEFAULT NULL,
  `customint7` bigint DEFAULT NULL,
  `customint8` bigint DEFAULT NULL,
  `customchar1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customchar2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customchar3` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customdec1` decimal(12,7) DEFAULT NULL,
  `customdec2` decimal(12,7) DEFAULT NULL,
  `customtext1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `customtext2` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `customtext3` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `customtext4` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enro_enr_ix` (`enrol`),
  KEY `mdl_enro_cou_ix` (`courseid`),
  KEY `mdl_enro_rol_ix` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Instances of enrolment plugins used in courses, fields marke';


-- moodle.mdl_enrol_flatfile definição

CREATE TABLE `mdl_enrol_flatfile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `action` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `roleid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `courseid` bigint NOT NULL,
  `timestart` bigint NOT NULL DEFAULT '0',
  `timeend` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enroflat_cou_ix` (`courseid`),
  KEY `mdl_enroflat_use_ix` (`userid`),
  KEY `mdl_enroflat_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='enrol_flatfile table retrofitted from MySQL';


-- moodle.mdl_enrol_lti_app_registration definição

CREATE TABLE `mdl_enrol_lti_app_registration` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `platformid` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `clientid` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uniqueid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `platformclienthash` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platformuniqueidhash` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authenticationrequesturl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `jwksurl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `accesstokenurl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_enroltiappregi_uni_uix` (`uniqueid`),
  UNIQUE KEY `mdl_enroltiappregi_pla_uix` (`platformclienthash`),
  UNIQUE KEY `mdl_enroltiappregi_pla2_uix` (`platformuniqueidhash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Details of each application that has been registered with th';


-- moodle.mdl_enrol_lti_context definição

CREATE TABLE `mdl_enrol_lti_context` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contextid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ltideploymentid` bigint NOT NULL,
  `type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_enrolticont_lticon_uix` (`ltideploymentid`,`contextid`),
  KEY `mdl_enrolticont_lti_ix` (`ltideploymentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Each row represents a context in the platform, where resourc';


-- moodle.mdl_enrol_lti_deployment definição

CREATE TABLE `mdl_enrol_lti_deployment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `deploymentid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `platformid` bigint NOT NULL,
  `legacyconsumerkey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_enroltidepl_pladep_uix` (`platformid`,`deploymentid`),
  KEY `mdl_enroltidepl_pla_ix` (`platformid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Each row represents a deployment of a tool within a platform';


-- moodle.mdl_enrol_lti_lti2_consumer definição

CREATE TABLE `mdl_enrol_lti_lti2_consumer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `consumerkey256` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `consumerkey` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `secret` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ltiversion` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `consumername` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `consumerversion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `consumerguid` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `toolproxy` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `protected` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `enablefrom` bigint DEFAULT NULL,
  `enableuntil` bigint DEFAULT NULL,
  `lastaccess` bigint DEFAULT NULL,
  `created` bigint NOT NULL,
  `updated` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_enroltilti2cons_con_uix` (`consumerkey256`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='LTI consumers interacting with moodle';


-- moodle.mdl_enrol_lti_lti2_context definição

CREATE TABLE `mdl_enrol_lti_lti2_context` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `consumerid` bigint NOT NULL,
  `lticontextkey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created` bigint NOT NULL,
  `updated` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_enroltilti2cont_con_ix` (`consumerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Information about a specific LTI contexts from the consumers';


-- moodle.mdl_enrol_lti_lti2_nonce definição

CREATE TABLE `mdl_enrol_lti_lti2_nonce` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `consumerid` bigint NOT NULL,
  `value` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `expires` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_enroltilti2nonc_con_ix` (`consumerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Nonce used for authentication between moodle and a consumer';


-- moodle.mdl_enrol_lti_lti2_resource_link definição

CREATE TABLE `mdl_enrol_lti_lti2_resource_link` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contextid` bigint DEFAULT NULL,
  `consumerid` bigint DEFAULT NULL,
  `ltiresourcelinkkey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `primaryresourcelinkid` bigint DEFAULT NULL,
  `shareapproved` tinyint(1) DEFAULT NULL,
  `created` bigint NOT NULL,
  `updated` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_enroltilti2resolink_con_ix` (`contextid`),
  KEY `mdl_enroltilti2resolink_pri_ix` (`primaryresourcelinkid`),
  KEY `mdl_enroltilti2resolink_co2_ix` (`consumerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Link from the consumer to the tool';


-- moodle.mdl_enrol_lti_lti2_share_key definição

CREATE TABLE `mdl_enrol_lti_lti2_share_key` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sharekey` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `resourcelinkid` bigint NOT NULL,
  `autoapprove` tinyint(1) NOT NULL,
  `expires` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_enroltilti2sharkey_sha_uix` (`sharekey`),
  UNIQUE KEY `mdl_enroltilti2sharkey_res_uix` (`resourcelinkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Resource link share key';


-- moodle.mdl_enrol_lti_lti2_tool_proxy definição

CREATE TABLE `mdl_enrol_lti_lti2_tool_proxy` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `toolproxykey` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `consumerid` bigint NOT NULL,
  `toolproxy` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` bigint NOT NULL,
  `updated` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_enroltilti2toolprox_to_uix` (`toolproxykey`),
  KEY `mdl_enroltilti2toolprox_con_ix` (`consumerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='A tool proxy between moodle and a consumer';


-- moodle.mdl_enrol_lti_lti2_user_result definição

CREATE TABLE `mdl_enrol_lti_lti2_user_result` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `resourcelinkid` bigint NOT NULL,
  `ltiuserkey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ltiresultsourcedid` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created` bigint NOT NULL,
  `updated` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_enroltilti2userresu_res_ix` (`resourcelinkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Results for each user for each resource link';


-- moodle.mdl_enrol_lti_resource_link definição

CREATE TABLE `mdl_enrol_lti_resource_link` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `resourcelinkid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ltideploymentid` bigint NOT NULL,
  `resourceid` bigint NOT NULL,
  `lticontextid` bigint DEFAULT NULL,
  `lineitemsservice` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lineitemservice` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lineitemscope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resultscope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scorescope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contextmembershipsurl` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nrpsserviceversions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_enroltiresolink_reslti_uix` (`resourcelinkid`,`ltideploymentid`),
  KEY `mdl_enroltiresolink_lti_ix` (`ltideploymentid`),
  KEY `mdl_enroltiresolink_lti2_ix` (`lticontextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Each row represents a resource link for a platform and deplo';


-- moodle.mdl_enrol_lti_tool_consumer_map definição

CREATE TABLE `mdl_enrol_lti_tool_consumer_map` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `toolid` bigint NOT NULL,
  `consumerid` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_enroltitoolconsmap_too_ix` (`toolid`),
  KEY `mdl_enroltitoolconsmap_con_ix` (`consumerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Table that maps the published tool to tool consumers.';


-- moodle.mdl_enrol_lti_tools definição

CREATE TABLE `mdl_enrol_lti_tools` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `enrolid` bigint NOT NULL,
  `contextid` bigint NOT NULL,
  `ltiversion` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'LTI-1p3',
  `institution` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lang` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `timezone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '99',
  `maxenrolled` bigint NOT NULL DEFAULT '0',
  `maildisplay` tinyint NOT NULL DEFAULT '2',
  `city` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `gradesync` tinyint(1) NOT NULL DEFAULT '0',
  `gradesynccompletion` tinyint(1) NOT NULL DEFAULT '0',
  `membersync` tinyint(1) NOT NULL DEFAULT '0',
  `membersyncmode` tinyint(1) NOT NULL DEFAULT '0',
  `roleinstructor` bigint NOT NULL,
  `rolelearner` bigint NOT NULL,
  `secret` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provisioningmodelearner` tinyint DEFAULT NULL,
  `provisioningmodeinstructor` tinyint DEFAULT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_enroltitool_uui_uix` (`uuid`),
  KEY `mdl_enroltitool_enr_ix` (`enrolid`),
  KEY `mdl_enroltitool_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='List of tools provided to the remote system';


-- moodle.mdl_enrol_lti_user_resource_link definição

CREATE TABLE `mdl_enrol_lti_user_resource_link` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ltiuserid` bigint NOT NULL,
  `resourcelinkid` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_enroltiuserresolink_lt_uix` (`ltiuserid`,`resourcelinkid`),
  KEY `mdl_enroltiuserresolink_lti_ix` (`ltiuserid`),
  KEY `mdl_enroltiuserresolink_res_ix` (`resourcelinkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Join table mapping users to resource links as this is a many';


-- moodle.mdl_enrol_lti_users definição

CREATE TABLE `mdl_enrol_lti_users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL,
  `toolid` bigint NOT NULL,
  `serviceurl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sourceid` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ltideploymentid` bigint DEFAULT NULL,
  `consumerkey` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `consumersecret` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `membershipsurl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `membershipsid` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `lastgrade` decimal(10,5) DEFAULT NULL,
  `lastaccess` bigint DEFAULT NULL,
  `timecreated` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_enroltiuser_use_ix` (`userid`),
  KEY `mdl_enroltiuser_too_ix` (`toolid`),
  KEY `mdl_enroltiuser_lti_ix` (`ltideploymentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='User access log and gradeback data';


-- moodle.mdl_enrol_paypal definição

CREATE TABLE `mdl_enrol_paypal` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `business` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `receiver_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `receiver_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `item_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `instanceid` bigint NOT NULL DEFAULT '0',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_name1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_selection1_x` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_name2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_selection2_x` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pending_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `reason_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `txn_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `parent_txn_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `payment_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timeupdated` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enropayp_bus_ix` (`business`),
  KEY `mdl_enropayp_rec_ix` (`receiver_email`),
  KEY `mdl_enropayp_cou_ix` (`courseid`),
  KEY `mdl_enropayp_use_ix` (`userid`),
  KEY `mdl_enropayp_ins_ix` (`instanceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Holds all known information about PayPal transactions';


-- moodle.mdl_event definição

CREATE TABLE `mdl_event` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `format` smallint NOT NULL DEFAULT '0',
  `categoryid` bigint NOT NULL DEFAULT '0',
  `courseid` bigint NOT NULL DEFAULT '0',
  `groupid` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `repeatid` bigint NOT NULL DEFAULT '0',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modulename` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instance` bigint NOT NULL DEFAULT '0',
  `type` smallint NOT NULL DEFAULT '0',
  `eventtype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timestart` bigint NOT NULL DEFAULT '0',
  `timeduration` bigint NOT NULL DEFAULT '0',
  `timesort` bigint DEFAULT NULL,
  `visible` smallint NOT NULL DEFAULT '1',
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sequence` bigint NOT NULL DEFAULT '1',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `subscriptionid` bigint DEFAULT NULL,
  `priority` bigint DEFAULT NULL,
  `location` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_even_cou_ix` (`courseid`),
  KEY `mdl_even_use_ix` (`userid`),
  KEY `mdl_even_tim_ix` (`timestart`),
  KEY `mdl_even_tim2_ix` (`timeduration`),
  KEY `mdl_even_uui_ix` (`uuid`),
  KEY `mdl_even_typtim_ix` (`type`,`timesort`),
  KEY `mdl_even_grocoucatvisuse_ix` (`groupid`,`courseid`,`categoryid`,`visible`,`userid`),
  KEY `mdl_even_eve_ix` (`eventtype`),
  KEY `mdl_even_comeveins_ix` (`component`,`eventtype`,`instance`),
  KEY `mdl_even_modinseve_ix` (`modulename`,`instance`,`eventtype`),
  KEY `mdl_even_cat_ix` (`categoryid`),
  KEY `mdl_even_sub_ix` (`subscriptionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='For everything with a time associated to it';


-- moodle.mdl_event_subscriptions definição

CREATE TABLE `mdl_event_subscriptions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `categoryid` bigint NOT NULL DEFAULT '0',
  `courseid` bigint NOT NULL DEFAULT '0',
  `groupid` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `eventtype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pollinterval` bigint NOT NULL DEFAULT '0',
  `lastupdated` bigint DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_evensubs_cou_ix` (`courseid`),
  KEY `mdl_evensubs_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Tracks subscriptions to remote calendars.';


-- moodle.mdl_events_handlers definição

CREATE TABLE `mdl_events_handlers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `eventname` varchar(166) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(166) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `handlerfile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `handlerfunction` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `schedule` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` bigint NOT NULL DEFAULT '0',
  `internal` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_evenhand_evecom_uix` (`eventname`,`component`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='This table is for storing which components requests what typ';


-- moodle.mdl_events_queue definição

CREATE TABLE `mdl_events_queue` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `eventdata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stackdump` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `userid` bigint DEFAULT NULL,
  `timecreated` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='This table is for storing queued events. It stores only one ';


-- moodle.mdl_events_queue_handlers definição

CREATE TABLE `mdl_events_queue_handlers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `queuedeventid` bigint NOT NULL,
  `handlerid` bigint NOT NULL,
  `status` bigint DEFAULT NULL,
  `errormessage` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `timemodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueuhand_que_ix` (`queuedeventid`),
  KEY `mdl_evenqueuhand_han_ix` (`handlerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='This is the list of queued handlers for processing. The even';


-- moodle.mdl_external_functions definição

CREATE TABLE `mdl_external_functions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `methodname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `classpath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `capabilities` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `services` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_extefunc_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=761 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='list of all external functions';


-- moodle.mdl_external_services definição

CREATE TABLE `mdl_external_services` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  `requiredcapability` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restrictedusers` tinyint(1) NOT NULL,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint DEFAULT NULL,
  `shortname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `downloadfiles` tinyint(1) NOT NULL DEFAULT '0',
  `uploadfiles` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_exteserv_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='built in and custom external services';


-- moodle.mdl_external_services_functions definição

CREATE TABLE `mdl_external_services_functions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint NOT NULL,
  `functionname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_exteservfunc_ext_ix` (`externalserviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=431 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='lists functions available in each service group';


-- moodle.mdl_external_services_users definição

CREATE TABLE `mdl_external_services_users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `iprestriction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validuntil` bigint DEFAULT NULL,
  `timecreated` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_exteservuser_ext_ix` (`externalserviceid`),
  KEY `mdl_exteservuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='users allowed to use services with restricted users flag';


-- moodle.mdl_external_tokens definição

CREATE TABLE `mdl_external_tokens` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `privatetoken` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tokentype` smallint NOT NULL,
  `userid` bigint NOT NULL,
  `externalserviceid` bigint NOT NULL,
  `sid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contextid` bigint NOT NULL,
  `creatorid` bigint NOT NULL DEFAULT '1',
  `iprestriction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validuntil` bigint DEFAULT NULL,
  `timecreated` bigint NOT NULL,
  `lastaccess` bigint DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_extetoke_tok_ix` (`token`),
  KEY `mdl_extetoke_sid_ix` (`sid`),
  KEY `mdl_extetoke_use_ix` (`userid`),
  KEY `mdl_extetoke_ext_ix` (`externalserviceid`),
  KEY `mdl_extetoke_con_ix` (`contextid`),
  KEY `mdl_extetoke_cre_ix` (`creatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Security tokens for accessing of external services';


-- moodle.mdl_favourite definição

CREATE TABLE `mdl_favourite` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `itemtype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint NOT NULL,
  `contextid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `ordering` bigint DEFAULT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_favo_comiteiteconuse_uix` (`component`,`itemtype`,`itemid`,`contextid`,`userid`),
  KEY `mdl_favo_con_ix` (`contextid`),
  KEY `mdl_favo_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores the relationship between an arbitrary item (itemtype,';


-- moodle.mdl_feedback definição

CREATE TABLE `mdl_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL DEFAULT '0',
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `introformat` smallint NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '1',
  `email_notification` tinyint(1) NOT NULL DEFAULT '1',
  `multiple_submit` tinyint(1) NOT NULL DEFAULT '1',
  `autonumbering` tinyint(1) NOT NULL DEFAULT '1',
  `site_after_submit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `page_after_submit` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_after_submitformat` tinyint NOT NULL DEFAULT '0',
  `publish_stats` tinyint(1) NOT NULL DEFAULT '0',
  `timeopen` bigint NOT NULL DEFAULT '0',
  `timeclose` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feed_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='all feedbacks';


-- moodle.mdl_feedback_completed definição

CREATE TABLE `mdl_feedback_completed` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feedback` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `random_response` bigint NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  `courseid` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use_ix` (`userid`),
  KEY `mdl_feedcomp_fee_ix` (`feedback`),
  KEY `mdl_feedcomp_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='filled out feedback';


-- moodle.mdl_feedback_completedtmp definição

CREATE TABLE `mdl_feedback_completedtmp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feedback` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `guestid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `random_response` bigint NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  `courseid` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use2_ix` (`userid`),
  KEY `mdl_feedcomp_fee2_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='filled out feedback';


-- moodle.mdl_feedback_item definição

CREATE TABLE `mdl_feedback_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feedback` bigint NOT NULL DEFAULT '0',
  `template` bigint NOT NULL DEFAULT '0',
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `presentation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `typ` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hasvalue` tinyint(1) NOT NULL DEFAULT '0',
  `position` smallint NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `dependitem` bigint NOT NULL DEFAULT '0',
  `dependvalue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `options` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feeditem_fee_ix` (`feedback`),
  KEY `mdl_feeditem_tem_ix` (`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='feedback_items';


-- moodle.mdl_feedback_sitecourse_map definição

CREATE TABLE `mdl_feedback_sitecourse_map` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feedbackid` bigint NOT NULL DEFAULT '0',
  `courseid` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedsitemap_cou_ix` (`courseid`),
  KEY `mdl_feedsitemap_fee_ix` (`feedbackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='feedback sitecourse map';


-- moodle.mdl_feedback_template definição

CREATE TABLE `mdl_feedback_template` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtemp_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='templates of feedbackstructures';


-- moodle.mdl_feedback_value definição

CREATE TABLE `mdl_feedback_value` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course_id` bigint NOT NULL DEFAULT '0',
  `item` bigint NOT NULL DEFAULT '0',
  `completed` bigint NOT NULL DEFAULT '0',
  `tmp_completed` bigint NOT NULL DEFAULT '0',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_feedvalu_comitecou_uix` (`completed`,`item`,`course_id`),
  KEY `mdl_feedvalu_cou_ix` (`course_id`),
  KEY `mdl_feedvalu_ite_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='values of the completeds';


-- moodle.mdl_feedback_valuetmp definição

CREATE TABLE `mdl_feedback_valuetmp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course_id` bigint NOT NULL DEFAULT '0',
  `item` bigint NOT NULL DEFAULT '0',
  `completed` bigint NOT NULL DEFAULT '0',
  `tmp_completed` bigint NOT NULL DEFAULT '0',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_feedvalu_comitecou2_uix` (`completed`,`item`,`course_id`),
  KEY `mdl_feedvalu_cou2_ix` (`course_id`),
  KEY `mdl_feedvalu_ite2_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='values of the completedstmp';


-- moodle.mdl_file_conversion definição

CREATE TABLE `mdl_file_conversion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usermodified` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `sourcefileid` bigint NOT NULL,
  `targetformat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` bigint DEFAULT '0',
  `statusmessage` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `converter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destfileid` bigint DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_fileconv_sou_ix` (`sourcefileid`),
  KEY `mdl_fileconv_des_ix` (`destfileid`),
  KEY `mdl_fileconv_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Table to track file conversions.';


-- moodle.mdl_files definição

CREATE TABLE `mdl_files` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contenthash` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pathnamehash` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint NOT NULL,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `filearea` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint NOT NULL,
  `filepath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint DEFAULT NULL,
  `filesize` bigint NOT NULL,
  `mimetype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` bigint NOT NULL DEFAULT '0',
  `source` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `sortorder` bigint NOT NULL DEFAULT '0',
  `referencefileid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_file_pat_uix` (`pathnamehash`),
  KEY `mdl_file_comfilconite_ix` (`component`,`filearea`,`contextid`,`itemid`),
  KEY `mdl_file_con_ix` (`contenthash`),
  KEY `mdl_file_lic_ix` (`license`),
  KEY `mdl_file_fil_ix` (`filename`),
  KEY `mdl_file_con2_ix` (`contextid`),
  KEY `mdl_file_use_ix` (`userid`),
  KEY `mdl_file_ref_ix` (`referencefileid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='description of files, content is stored in sha1 file pool';


-- moodle.mdl_files_reference definição

CREATE TABLE `mdl_files_reference` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repositoryid` bigint NOT NULL,
  `lastsync` bigint DEFAULT NULL,
  `reference` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `referencehash` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filerefe_refrep_uix` (`referencehash`,`repositoryid`),
  KEY `mdl_filerefe_rep_ix` (`repositoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Store files references';


-- moodle.mdl_filter_active definição

CREATE TABLE `mdl_filter_active` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint NOT NULL,
  `active` smallint NOT NULL,
  `sortorder` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtacti_confil_uix` (`contextid`,`filter`),
  KEY `mdl_filtacti_con_ix` (`contextid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores information about which filters are active in which c';


-- moodle.mdl_filter_config definição

CREATE TABLE `mdl_filter_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtconf_confilnam_uix` (`contextid`,`filter`,`name`),
  KEY `mdl_filtconf_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores per-context configuration settings for filters which ';


-- moodle.mdl_folder definição

CREATE TABLE `mdl_folder` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL DEFAULT '0',
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `introformat` smallint NOT NULL DEFAULT '0',
  `revision` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `display` smallint NOT NULL DEFAULT '0',
  `showexpanded` tinyint(1) NOT NULL DEFAULT '1',
  `showdownloadfolder` tinyint(1) NOT NULL DEFAULT '1',
  `forcedownload` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_fold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='each record is one folder resource';


-- moodle.mdl_forum definição

CREATE TABLE `mdl_forum` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL DEFAULT '0',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'general',
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `introformat` smallint NOT NULL DEFAULT '0',
  `duedate` bigint NOT NULL DEFAULT '0',
  `cutoffdate` bigint NOT NULL DEFAULT '0',
  `assessed` bigint NOT NULL DEFAULT '0',
  `assesstimestart` bigint NOT NULL DEFAULT '0',
  `assesstimefinish` bigint NOT NULL DEFAULT '0',
  `scale` bigint NOT NULL DEFAULT '0',
  `grade_forum` bigint NOT NULL DEFAULT '0',
  `grade_forum_notify` smallint NOT NULL DEFAULT '0',
  `maxbytes` bigint NOT NULL DEFAULT '0',
  `maxattachments` bigint NOT NULL DEFAULT '1',
  `forcesubscribe` tinyint(1) NOT NULL DEFAULT '0',
  `trackingtype` tinyint NOT NULL DEFAULT '1',
  `rsstype` tinyint NOT NULL DEFAULT '0',
  `rssarticles` tinyint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `warnafter` bigint NOT NULL DEFAULT '0',
  `blockafter` bigint NOT NULL DEFAULT '0',
  `blockperiod` bigint NOT NULL DEFAULT '0',
  `completiondiscussions` int NOT NULL DEFAULT '0',
  `completionreplies` int NOT NULL DEFAULT '0',
  `completionposts` int NOT NULL DEFAULT '0',
  `displaywordcount` tinyint(1) NOT NULL DEFAULT '0',
  `lockdiscussionafter` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foru_cou_ix` (`course`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Forums contain and structure discussion';


-- moodle.mdl_forum_digests definição

CREATE TABLE `mdl_forum_digests` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL,
  `forum` bigint NOT NULL,
  `maildigest` tinyint(1) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_forudige_forusemai_uix` (`forum`,`userid`,`maildigest`),
  KEY `mdl_forudige_use_ix` (`userid`),
  KEY `mdl_forudige_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Keeps track of user mail delivery preferences for each forum';


-- moodle.mdl_forum_discussion_subs definição

CREATE TABLE `mdl_forum_discussion_subs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `forum` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `discussion` bigint NOT NULL,
  `preference` bigint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_forudiscsubs_usedis_uix` (`userid`,`discussion`),
  KEY `mdl_forudiscsubs_for_ix` (`forum`),
  KEY `mdl_forudiscsubs_use_ix` (`userid`),
  KEY `mdl_forudiscsubs_dis_ix` (`discussion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Users may choose to subscribe and unsubscribe from specific ';


-- moodle.mdl_forum_discussions definição

CREATE TABLE `mdl_forum_discussions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL DEFAULT '0',
  `forum` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `firstpost` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `groupid` bigint NOT NULL DEFAULT '-1',
  `assessed` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `usermodified` bigint NOT NULL DEFAULT '0',
  `timestart` bigint NOT NULL DEFAULT '0',
  `timeend` bigint NOT NULL DEFAULT '0',
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  `timelocked` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forudisc_use_ix` (`userid`),
  KEY `mdl_forudisc_cou_ix` (`course`),
  KEY `mdl_forudisc_for_ix` (`forum`),
  KEY `mdl_forudisc_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Forums are composed of discussions';


-- moodle.mdl_forum_grades definição

CREATE TABLE `mdl_forum_grades` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `forum` bigint NOT NULL,
  `itemnumber` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `grade` decimal(10,5) DEFAULT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_forugrad_foriteuse_uix` (`forum`,`itemnumber`,`userid`),
  KEY `mdl_forugrad_use_ix` (`userid`),
  KEY `mdl_forugrad_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Grading data for forum instances';


-- moodle.mdl_forum_posts definição

CREATE TABLE `mdl_forum_posts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `discussion` bigint NOT NULL DEFAULT '0',
  `parent` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `created` bigint NOT NULL DEFAULT '0',
  `modified` bigint NOT NULL DEFAULT '0',
  `mailed` tinyint NOT NULL DEFAULT '0',
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `messageformat` tinyint NOT NULL DEFAULT '0',
  `messagetrust` tinyint NOT NULL DEFAULT '0',
  `attachment` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `totalscore` smallint NOT NULL DEFAULT '0',
  `mailnow` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `privatereplyto` bigint NOT NULL DEFAULT '0',
  `wordcount` bigint DEFAULT NULL,
  `charcount` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_forupost_use_ix` (`userid`),
  KEY `mdl_forupost_cre_ix` (`created`),
  KEY `mdl_forupost_mai_ix` (`mailed`),
  KEY `mdl_forupost_pri_ix` (`privatereplyto`),
  KEY `mdl_forupost_dis_ix` (`discussion`),
  KEY `mdl_forupost_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='All posts are stored in this table';


-- moodle.mdl_forum_queue definição

CREATE TABLE `mdl_forum_queue` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL DEFAULT '0',
  `discussionid` bigint NOT NULL DEFAULT '0',
  `postid` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruqueu_use_ix` (`userid`),
  KEY `mdl_foruqueu_dis_ix` (`discussionid`),
  KEY `mdl_foruqueu_pos_ix` (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='For keeping track of posts that will be mailed in digest for';


-- moodle.mdl_forum_read definição

CREATE TABLE `mdl_forum_read` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL DEFAULT '0',
  `forumid` bigint NOT NULL DEFAULT '0',
  `discussionid` bigint NOT NULL DEFAULT '0',
  `postid` bigint NOT NULL DEFAULT '0',
  `firstread` bigint NOT NULL DEFAULT '0',
  `lastread` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruread_foruse_ix` (`forumid`,`userid`),
  KEY `mdl_foruread_disuse_ix` (`discussionid`,`userid`),
  KEY `mdl_foruread_posuse_ix` (`postid`,`userid`),
  KEY `mdl_foruread_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Tracks each users read posts';


-- moodle.mdl_forum_subscriptions definição

CREATE TABLE `mdl_forum_subscriptions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL DEFAULT '0',
  `forum` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_forusubs_usefor_uix` (`userid`,`forum`),
  KEY `mdl_forusubs_use_ix` (`userid`),
  KEY `mdl_forusubs_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Keeps track of who is subscribed to what forum';


-- moodle.mdl_forum_track_prefs definição

CREATE TABLE `mdl_forum_track_prefs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL DEFAULT '0',
  `forumid` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forutracpref_usefor_ix` (`userid`,`forumid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Tracks each users untracked forums';


-- moodle.mdl_glossary definição

CREATE TABLE `mdl_glossary` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL DEFAULT '0',
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `introformat` smallint NOT NULL DEFAULT '0',
  `allowduplicatedentries` tinyint NOT NULL DEFAULT '0',
  `displayformat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'dictionary',
  `mainglossary` tinyint NOT NULL DEFAULT '0',
  `showspecial` tinyint NOT NULL DEFAULT '1',
  `showalphabet` tinyint NOT NULL DEFAULT '1',
  `showall` tinyint NOT NULL DEFAULT '1',
  `allowcomments` tinyint NOT NULL DEFAULT '0',
  `allowprintview` tinyint NOT NULL DEFAULT '1',
  `usedynalink` tinyint NOT NULL DEFAULT '1',
  `defaultapproval` tinyint NOT NULL DEFAULT '1',
  `approvaldisplayformat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `globalglossary` tinyint NOT NULL DEFAULT '0',
  `entbypage` smallint NOT NULL DEFAULT '10',
  `editalways` tinyint NOT NULL DEFAULT '0',
  `rsstype` tinyint NOT NULL DEFAULT '0',
  `rssarticles` tinyint NOT NULL DEFAULT '0',
  `assessed` bigint NOT NULL DEFAULT '0',
  `assesstimestart` bigint NOT NULL DEFAULT '0',
  `assesstimefinish` bigint NOT NULL DEFAULT '0',
  `scale` bigint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `completionentries` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glos_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='all glossaries';


-- moodle.mdl_glossary_alias definição

CREATE TABLE `mdl_glossary_alias` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `entryid` bigint NOT NULL DEFAULT '0',
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_glosalia_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='entries alias';


-- moodle.mdl_glossary_categories definição

CREATE TABLE `mdl_glossary_categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `usedynalink` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_gloscate_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='all categories for glossary entries';


-- moodle.mdl_glossary_entries definição

CREATE TABLE `mdl_glossary_entries` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `concept` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `definition` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `definitionformat` tinyint NOT NULL DEFAULT '0',
  `definitiontrust` tinyint NOT NULL DEFAULT '0',
  `attachment` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `teacherentry` tinyint NOT NULL DEFAULT '0',
  `sourceglossaryid` bigint NOT NULL DEFAULT '0',
  `usedynalink` tinyint NOT NULL DEFAULT '1',
  `casesensitive` tinyint NOT NULL DEFAULT '0',
  `fullmatch` tinyint NOT NULL DEFAULT '1',
  `approved` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentr_use_ix` (`userid`),
  KEY `mdl_glosentr_con_ix` (`concept`),
  KEY `mdl_glosentr_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='all glossary entries';


-- moodle.mdl_glossary_entries_categories definição

CREATE TABLE `mdl_glossary_entries_categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `categoryid` bigint NOT NULL DEFAULT '0',
  `entryid` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentrcate_cat_ix` (`categoryid`),
  KEY `mdl_glosentrcate_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='categories of each glossary entry';


-- moodle.mdl_glossary_formats definição

CREATE TABLE `mdl_glossary_formats` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `popupformatname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint NOT NULL DEFAULT '1',
  `showgroup` tinyint NOT NULL DEFAULT '1',
  `showtabs` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `defaultmode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `defaulthook` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortkey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortorder` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Setting of the display formats';


-- moodle.mdl_grade_categories definição

CREATE TABLE `mdl_grade_categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `courseid` bigint NOT NULL,
  `parent` bigint DEFAULT NULL,
  `depth` bigint NOT NULL DEFAULT '0',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `aggregation` bigint NOT NULL DEFAULT '0',
  `keephigh` bigint NOT NULL DEFAULT '0',
  `droplow` bigint NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `hidden` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcate_cou_ix` (`courseid`),
  KEY `mdl_gradcate_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='This table keeps information about categories, used for grou';


-- moodle.mdl_grade_categories_history definição

CREATE TABLE `mdl_grade_categories_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `action` bigint NOT NULL DEFAULT '0',
  `oldid` bigint NOT NULL,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timemodified` bigint DEFAULT NULL,
  `loggeduser` bigint DEFAULT NULL,
  `courseid` bigint NOT NULL,
  `parent` bigint DEFAULT NULL,
  `depth` bigint NOT NULL DEFAULT '0',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `aggregation` bigint NOT NULL DEFAULT '0',
  `keephigh` bigint NOT NULL DEFAULT '0',
  `droplow` bigint NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcatehist_act_ix` (`action`),
  KEY `mdl_gradcatehist_tim_ix` (`timemodified`),
  KEY `mdl_gradcatehist_old_ix` (`oldid`),
  KEY `mdl_gradcatehist_cou_ix` (`courseid`),
  KEY `mdl_gradcatehist_par_ix` (`parent`),
  KEY `mdl_gradcatehist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='History of grade_categories';


-- moodle.mdl_grade_grades definição

CREATE TABLE `mdl_grade_grades` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `itemid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint DEFAULT NULL,
  `usermodified` bigint DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint NOT NULL DEFAULT '0',
  `locked` bigint NOT NULL DEFAULT '0',
  `locktime` bigint NOT NULL DEFAULT '0',
  `exported` bigint NOT NULL DEFAULT '0',
  `overridden` bigint NOT NULL DEFAULT '0',
  `excluded` bigint NOT NULL DEFAULT '0',
  `feedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `feedbackformat` bigint NOT NULL DEFAULT '0',
  `information` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `informationformat` bigint NOT NULL DEFAULT '0',
  `timecreated` bigint DEFAULT NULL,
  `timemodified` bigint DEFAULT NULL,
  `aggregationstatus` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unknown',
  `aggregationweight` decimal(10,5) DEFAULT NULL,
  `deductedmark` decimal(10,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradgrad_useite_uix` (`userid`,`itemid`),
  KEY `mdl_gradgrad_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_gradgrad_ite_ix` (`itemid`),
  KEY `mdl_gradgrad_use_ix` (`userid`),
  KEY `mdl_gradgrad_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgrad_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='grade_grades  This table keeps individual grades for each us';


-- moodle.mdl_grade_grades_history definição

CREATE TABLE `mdl_grade_grades_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `action` bigint NOT NULL DEFAULT '0',
  `oldid` bigint NOT NULL,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timemodified` bigint DEFAULT NULL,
  `loggeduser` bigint DEFAULT NULL,
  `itemid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint DEFAULT NULL,
  `usermodified` bigint DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint NOT NULL DEFAULT '0',
  `locked` bigint NOT NULL DEFAULT '0',
  `locktime` bigint NOT NULL DEFAULT '0',
  `exported` bigint NOT NULL DEFAULT '0',
  `overridden` bigint NOT NULL DEFAULT '0',
  `excluded` bigint NOT NULL DEFAULT '0',
  `feedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `feedbackformat` bigint NOT NULL DEFAULT '0',
  `information` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `informationformat` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradgradhist_act_ix` (`action`),
  KEY `mdl_gradgradhist_tim_ix` (`timemodified`),
  KEY `mdl_gradgradhist_useitetim_ix` (`userid`,`itemid`,`timemodified`),
  KEY `mdl_gradgradhist_old_ix` (`oldid`),
  KEY `mdl_gradgradhist_ite_ix` (`itemid`),
  KEY `mdl_gradgradhist_use_ix` (`userid`),
  KEY `mdl_gradgradhist_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgradhist_use2_ix` (`usermodified`),
  KEY `mdl_gradgradhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='History table';


-- moodle.mdl_grade_import_newitem definição

CREATE TABLE `mdl_grade_import_newitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `itemname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `importcode` bigint NOT NULL,
  `importer` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimponewi_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='temporary table for storing new grade_item names from grade ';


-- moodle.mdl_grade_import_values definição

CREATE TABLE `mdl_grade_import_values` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `itemid` bigint DEFAULT NULL,
  `newgradeitem` bigint DEFAULT NULL,
  `userid` bigint NOT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `feedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `importcode` bigint NOT NULL,
  `importer` bigint DEFAULT NULL,
  `importonlyfeedback` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradimpovalu_ite_ix` (`itemid`),
  KEY `mdl_gradimpovalu_new_ix` (`newgradeitem`),
  KEY `mdl_gradimpovalu_imp_ix` (`importer`),
  KEY `mdl_gradimpovalu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Temporary table for importing grades';


-- moodle.mdl_grade_items definição

CREATE TABLE `mdl_grade_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `courseid` bigint DEFAULT NULL,
  `categoryid` bigint DEFAULT NULL,
  `itemname` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemtype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `itemmodule` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iteminstance` bigint DEFAULT NULL,
  `itemnumber` bigint DEFAULT NULL,
  `iteminfo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `idnumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calculation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `gradetype` smallint NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint DEFAULT NULL,
  `outcomeid` bigint DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef2` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint NOT NULL DEFAULT '0',
  `display` bigint NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `hidden` bigint NOT NULL DEFAULT '0',
  `locked` bigint NOT NULL DEFAULT '0',
  `locktime` bigint NOT NULL DEFAULT '0',
  `needsupdate` bigint NOT NULL DEFAULT '0',
  `weightoverride` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint DEFAULT NULL,
  `timemodified` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_graditem_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_graditem_itenee_ix` (`itemtype`,`needsupdate`),
  KEY `mdl_graditem_gra_ix` (`gradetype`),
  KEY `mdl_graditem_idncou_ix` (`idnumber`,`courseid`),
  KEY `mdl_graditem_iteiteitecou_ix` (`itemtype`,`itemmodule`,`iteminstance`,`courseid`),
  KEY `mdl_graditem_cou_ix` (`courseid`),
  KEY `mdl_graditem_cat_ix` (`categoryid`),
  KEY `mdl_graditem_sca_ix` (`scaleid`),
  KEY `mdl_graditem_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='This table keeps information about gradeable items (ie colum';


-- moodle.mdl_grade_items_history definição

CREATE TABLE `mdl_grade_items_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `action` bigint NOT NULL DEFAULT '0',
  `oldid` bigint NOT NULL,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timemodified` bigint DEFAULT NULL,
  `loggeduser` bigint DEFAULT NULL,
  `courseid` bigint DEFAULT NULL,
  `categoryid` bigint DEFAULT NULL,
  `itemname` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemtype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `itemmodule` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iteminstance` bigint DEFAULT NULL,
  `itemnumber` bigint DEFAULT NULL,
  `iteminfo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `idnumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calculation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `gradetype` smallint NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint DEFAULT NULL,
  `outcomeid` bigint DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef2` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint NOT NULL DEFAULT '0',
  `hidden` bigint NOT NULL DEFAULT '0',
  `locked` bigint NOT NULL DEFAULT '0',
  `locktime` bigint NOT NULL DEFAULT '0',
  `needsupdate` bigint NOT NULL DEFAULT '0',
  `display` bigint NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `weightoverride` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_graditemhist_act_ix` (`action`),
  KEY `mdl_graditemhist_tim_ix` (`timemodified`),
  KEY `mdl_graditemhist_old_ix` (`oldid`),
  KEY `mdl_graditemhist_cou_ix` (`courseid`),
  KEY `mdl_graditemhist_cat_ix` (`categoryid`),
  KEY `mdl_graditemhist_sca_ix` (`scaleid`),
  KEY `mdl_graditemhist_out_ix` (`outcomeid`),
  KEY `mdl_graditemhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='History of grade_items';


-- moodle.mdl_grade_letters definição

CREATE TABLE `mdl_grade_letters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contextid` bigint NOT NULL,
  `lowerboundary` decimal(10,5) NOT NULL,
  `letter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradlett_conlowlet_uix` (`contextid`,`lowerboundary`,`letter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Repository for grade letters, for courses and other moodle e';


-- moodle.mdl_grade_outcomes definição

CREATE TABLE `mdl_grade_outcomes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `courseid` bigint DEFAULT NULL,
  `shortname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `fullname` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `scaleid` bigint DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionformat` tinyint NOT NULL DEFAULT '0',
  `timecreated` bigint DEFAULT NULL,
  `timemodified` bigint DEFAULT NULL,
  `usermodified` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutc_cousho_uix` (`courseid`,`shortname`),
  KEY `mdl_gradoutc_cou_ix` (`courseid`),
  KEY `mdl_gradoutc_sca_ix` (`scaleid`),
  KEY `mdl_gradoutc_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='This table describes the outcomes used in the system. An out';


-- moodle.mdl_grade_outcomes_courses definição

CREATE TABLE `mdl_grade_outcomes_courses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `courseid` bigint NOT NULL,
  `outcomeid` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutccour_couout_uix` (`courseid`,`outcomeid`),
  KEY `mdl_gradoutccour_cou_ix` (`courseid`),
  KEY `mdl_gradoutccour_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='stores what outcomes are used in what courses.';


-- moodle.mdl_grade_outcomes_history definição

CREATE TABLE `mdl_grade_outcomes_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `action` bigint NOT NULL DEFAULT '0',
  `oldid` bigint NOT NULL,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timemodified` bigint DEFAULT NULL,
  `loggeduser` bigint DEFAULT NULL,
  `courseid` bigint DEFAULT NULL,
  `shortname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `fullname` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `scaleid` bigint DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionformat` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradoutchist_act_ix` (`action`),
  KEY `mdl_gradoutchist_tim_ix` (`timemodified`),
  KEY `mdl_gradoutchist_old_ix` (`oldid`),
  KEY `mdl_gradoutchist_cou_ix` (`courseid`),
  KEY `mdl_gradoutchist_sca_ix` (`scaleid`),
  KEY `mdl_gradoutchist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='History table';


-- moodle.mdl_grade_settings definição

CREATE TABLE `mdl_grade_settings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `courseid` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradsett_counam_uix` (`courseid`,`name`),
  KEY `mdl_gradsett_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='gradebook settings';


-- moodle.mdl_gradepenalty_duedate_rule definição

CREATE TABLE `mdl_gradepenalty_duedate_rule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contextid` bigint NOT NULL,
  `sortorder` bigint NOT NULL DEFAULT '0',
  `overdueby` bigint NOT NULL,
  `penalty` double(10,0) NOT NULL,
  `usermodified` bigint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradduedrule_con_ix` (`contextid`),
  KEY `mdl_gradduedrule_use_ix` (`usermodified`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Penalty rules';


-- moodle.mdl_grading_areas definição

CREATE TABLE `mdl_grading_areas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contextid` bigint NOT NULL,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `areaname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `activemethod` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradarea_concomare_uix` (`contextid`,`component`,`areaname`),
  KEY `mdl_gradarea_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Identifies gradable areas where advanced grading can happen.';


-- moodle.mdl_grading_definitions definição

CREATE TABLE `mdl_grading_definitions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `areaid` bigint NOT NULL,
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionformat` tinyint DEFAULT NULL,
  `status` bigint NOT NULL DEFAULT '0',
  `copiedfromid` bigint DEFAULT NULL,
  `timecreated` bigint NOT NULL,
  `usercreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `usermodified` bigint NOT NULL,
  `timecopied` bigint DEFAULT '0',
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_graddefi_aremet_uix` (`areaid`,`method`),
  KEY `mdl_graddefi_are_ix` (`areaid`),
  KEY `mdl_graddefi_use_ix` (`usermodified`),
  KEY `mdl_graddefi_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Contains the basic information about an advanced grading for';


-- moodle.mdl_grading_instances definição

CREATE TABLE `mdl_grading_instances` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `definitionid` bigint NOT NULL,
  `raterid` bigint NOT NULL,
  `itemid` bigint DEFAULT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `status` bigint NOT NULL DEFAULT '0',
  `feedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `feedbackformat` tinyint DEFAULT NULL,
  `timemodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradinst_def_ix` (`definitionid`),
  KEY `mdl_gradinst_rat_ix` (`raterid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Grading form instance is an assessment record for one gradab';


-- moodle.mdl_gradingform_guide_comments definição

CREATE TABLE `mdl_gradingform_guide_comments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `definitionid` bigint NOT NULL,
  `sortorder` bigint NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionformat` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcomm_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='frequently used comments used in marking guide';


-- moodle.mdl_gradingform_guide_criteria definição

CREATE TABLE `mdl_gradingform_guide_criteria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `definitionid` bigint NOT NULL,
  `sortorder` bigint NOT NULL,
  `shortname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionformat` tinyint DEFAULT NULL,
  `descriptionmarkers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionmarkersformat` tinyint DEFAULT NULL,
  `maxscore` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores the rows of the criteria grid.';


-- moodle.mdl_gradingform_guide_fillings definição

CREATE TABLE `mdl_gradingform_guide_fillings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `instanceid` bigint NOT NULL,
  `criterionid` bigint NOT NULL,
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `remarkformat` tinyint DEFAULT NULL,
  `score` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradguidfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradguidfill_ins_ix` (`instanceid`),
  KEY `mdl_gradguidfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores the data of how the guide is filled by a particular r';


-- moodle.mdl_gradingform_rubric_criteria definição

CREATE TABLE `mdl_gradingform_rubric_criteria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `definitionid` bigint NOT NULL,
  `sortorder` bigint NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionformat` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores the rows of the rubric grid.';


-- moodle.mdl_gradingform_rubric_fillings definição

CREATE TABLE `mdl_gradingform_rubric_fillings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `instanceid` bigint NOT NULL,
  `criterionid` bigint NOT NULL,
  `levelid` bigint DEFAULT NULL,
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `remarkformat` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradrubrfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradrubrfill_lev_ix` (`levelid`),
  KEY `mdl_gradrubrfill_ins_ix` (`instanceid`),
  KEY `mdl_gradrubrfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores the data of how the rubric is filled by a particular ';


-- moodle.mdl_gradingform_rubric_levels definição

CREATE TABLE `mdl_gradingform_rubric_levels` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `criterionid` bigint NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `definition` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `definitionformat` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrleve_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores the columns of the rubric grid.';


-- moodle.mdl_groupings definição

CREATE TABLE `mdl_groupings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `courseid` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionformat` tinyint NOT NULL DEFAULT '0',
  `configdata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn2_ix` (`idnumber`),
  KEY `mdl_grou_cou2_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='A grouping is a collection of groups. WAS: groups_groupings';


-- moodle.mdl_groupings_groups definição

CREATE TABLE `mdl_groupings_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `groupingid` bigint NOT NULL DEFAULT '0',
  `groupid` bigint NOT NULL DEFAULT '0',
  `timeadded` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grougrou_gro_ix` (`groupingid`),
  KEY `mdl_grougrou_gro2_ix` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Link a grouping to a group (note, groups can be in multiple ';


-- moodle.mdl_groups definição

CREATE TABLE `mdl_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `courseid` bigint NOT NULL,
  `idnumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionformat` tinyint NOT NULL DEFAULT '0',
  `enrolmentkey` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture` bigint NOT NULL DEFAULT '0',
  `visibility` tinyint(1) NOT NULL DEFAULT '0',
  `participation` tinyint(1) NOT NULL DEFAULT '1',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn_ix` (`idnumber`),
  KEY `mdl_grou_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Each record represents a group.';


-- moodle.mdl_groups_members definição

CREATE TABLE `mdl_groups_members` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `groupid` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `timeadded` bigint NOT NULL DEFAULT '0',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_groumemb_usegro_uix` (`userid`,`groupid`),
  KEY `mdl_groumemb_gro_ix` (`groupid`),
  KEY `mdl_groumemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Link a user to a group.';


-- moodle.mdl_h5p definição

CREATE TABLE `mdl_h5p` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `jsoncontent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mainlibraryid` bigint NOT NULL,
  `displayoptions` smallint DEFAULT NULL,
  `pathnamehash` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contenthash` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `filtered` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_h5p_pat_ix` (`pathnamehash`),
  KEY `mdl_h5p_mai_ix` (`mainlibraryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores H5P content information';


-- moodle.mdl_h5p_contents_libraries definição

CREATE TABLE `mdl_h5p_contents_libraries` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `h5pid` bigint NOT NULL,
  `libraryid` bigint NOT NULL,
  `dependencytype` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dropcss` tinyint(1) NOT NULL,
  `weight` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_h5pcontlibr_h5p_ix` (`h5pid`),
  KEY `mdl_h5pcontlibr_lib_ix` (`libraryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Store which library is used in which content.';


-- moodle.mdl_h5p_libraries definição

CREATE TABLE `mdl_h5p_libraries` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `machinename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `majorversion` smallint NOT NULL,
  `minorversion` smallint NOT NULL,
  `patchversion` smallint NOT NULL,
  `runnable` tinyint(1) NOT NULL,
  `fullscreen` tinyint(1) NOT NULL DEFAULT '0',
  `embedtypes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `preloadedjs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `preloadedcss` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `droplibrarycss` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `semantics` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `addto` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `coremajor` smallint DEFAULT NULL,
  `coreminor` smallint DEFAULT NULL,
  `metadatasettings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tutorial` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `example` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_h5plibr_macmajminpatrun_ix` (`machinename`,`majorversion`,`minorversion`,`patchversion`,`runnable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores information about libraries used by H5P content.';


-- moodle.mdl_h5p_libraries_cachedassets definição

CREATE TABLE `mdl_h5p_libraries_cachedassets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `libraryid` bigint NOT NULL,
  `hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_h5plibrcach_lib_ix` (`libraryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='H5P cached library assets';


-- moodle.mdl_h5p_library_dependencies definição

CREATE TABLE `mdl_h5p_library_dependencies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `libraryid` bigint NOT NULL,
  `requiredlibraryid` bigint NOT NULL,
  `dependencytype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_h5plibrdepe_lib_ix` (`libraryid`),
  KEY `mdl_h5plibrdepe_req_ix` (`requiredlibraryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores H5P library dependencies';


-- moodle.mdl_h5pactivity definição

CREATE TABLE `mdl_h5pactivity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL,
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `introformat` smallint NOT NULL DEFAULT '0',
  `grade` bigint DEFAULT '0',
  `displayoptions` smallint NOT NULL DEFAULT '0',
  `enabletracking` tinyint(1) NOT NULL DEFAULT '1',
  `grademethod` smallint NOT NULL DEFAULT '1',
  `reviewmode` smallint DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_h5pa_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores the h5pactivity activity module instances.';


-- moodle.mdl_h5pactivity_attempts definição

CREATE TABLE `mdl_h5pactivity_attempts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `h5pactivityid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `attempt` mediumint NOT NULL DEFAULT '1',
  `rawscore` bigint DEFAULT '0',
  `maxscore` bigint DEFAULT '0',
  `scaled` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `duration` bigint DEFAULT '0',
  `completion` tinyint(1) DEFAULT NULL,
  `success` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_h5paatte_h5puseatt_uix` (`h5pactivityid`,`userid`,`attempt`),
  KEY `mdl_h5paatte_tim_ix` (`timecreated`),
  KEY `mdl_h5paatte_h5ptim_ix` (`h5pactivityid`,`timecreated`),
  KEY `mdl_h5paatte_h5puse_ix` (`h5pactivityid`,`userid`),
  KEY `mdl_h5paatte_h5p_ix` (`h5pactivityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Users attempts inside H5P activities';


-- moodle.mdl_h5pactivity_attempts_results definição

CREATE TABLE `mdl_h5pactivity_attempts_results` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `attemptid` bigint NOT NULL,
  `subcontent` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timecreated` bigint NOT NULL,
  `interactiontype` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `correctpattern` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `additionals` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rawscore` bigint NOT NULL DEFAULT '0',
  `maxscore` bigint NOT NULL DEFAULT '0',
  `duration` bigint DEFAULT '0',
  `completion` tinyint(1) DEFAULT NULL,
  `success` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_h5paatteresu_atttim_ix` (`attemptid`,`timecreated`),
  KEY `mdl_h5paatteresu_att_ix` (`attemptid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='H5Pactivities_attempts tracking info';


-- moodle.mdl_imscp definição

CREATE TABLE `mdl_imscp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL DEFAULT '0',
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `introformat` smallint NOT NULL DEFAULT '0',
  `revision` bigint NOT NULL DEFAULT '0',
  `keepold` bigint NOT NULL DEFAULT '-1',
  `structure` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_imsc_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='each record is one imscp resource';


-- moodle.mdl_infected_files definição

CREATE TABLE `mdl_infected_files` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `filename` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quarantinedfile` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `userid` bigint NOT NULL,
  `reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timecreated` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_infefile_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Table to store infected file details.';


-- moodle.mdl_label definição

CREATE TABLE `mdl_label` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL DEFAULT '0',
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `introformat` smallint DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_labe_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Defines labels';


-- moodle.mdl_lesson definição

CREATE TABLE `mdl_lesson` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL DEFAULT '0',
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `introformat` smallint NOT NULL DEFAULT '0',
  `practice` smallint NOT NULL DEFAULT '0',
  `modattempts` smallint NOT NULL DEFAULT '0',
  `usepassword` smallint NOT NULL DEFAULT '0',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dependency` bigint NOT NULL DEFAULT '0',
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `grade` bigint NOT NULL DEFAULT '0',
  `custom` smallint NOT NULL DEFAULT '0',
  `ongoing` smallint NOT NULL DEFAULT '0',
  `usemaxgrade` smallint NOT NULL DEFAULT '0',
  `maxanswers` smallint NOT NULL DEFAULT '4',
  `maxattempts` smallint NOT NULL DEFAULT '5',
  `review` smallint NOT NULL DEFAULT '0',
  `nextpagedefault` smallint NOT NULL DEFAULT '0',
  `feedback` smallint NOT NULL DEFAULT '1',
  `minquestions` smallint NOT NULL DEFAULT '0',
  `maxpages` smallint NOT NULL DEFAULT '0',
  `timelimit` bigint NOT NULL DEFAULT '0',
  `retake` smallint NOT NULL DEFAULT '1',
  `activitylink` bigint NOT NULL DEFAULT '0',
  `mediafile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mediaheight` bigint NOT NULL DEFAULT '100',
  `mediawidth` bigint NOT NULL DEFAULT '650',
  `mediaclose` smallint NOT NULL DEFAULT '0',
  `slideshow` smallint NOT NULL DEFAULT '0',
  `width` bigint NOT NULL DEFAULT '640',
  `height` bigint NOT NULL DEFAULT '480',
  `bgcolor` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#FFFFFF',
  `displayleft` smallint NOT NULL DEFAULT '0',
  `displayleftif` smallint NOT NULL DEFAULT '0',
  `progressbar` smallint NOT NULL DEFAULT '0',
  `available` bigint NOT NULL DEFAULT '0',
  `deadline` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `completionendreached` tinyint(1) DEFAULT '0',
  `completiontimespent` bigint DEFAULT '0',
  `allowofflineattempts` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_less_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Defines lesson';


-- moodle.mdl_lesson_answers definição

CREATE TABLE `mdl_lesson_answers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `lessonid` bigint NOT NULL DEFAULT '0',
  `pageid` bigint NOT NULL DEFAULT '0',
  `jumpto` bigint NOT NULL DEFAULT '0',
  `grade` smallint NOT NULL DEFAULT '0',
  `score` bigint NOT NULL DEFAULT '0',
  `flags` smallint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `answerformat` tinyint NOT NULL DEFAULT '0',
  `response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `responseformat` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessansw_les_ix` (`lessonid`),
  KEY `mdl_lessansw_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Defines lesson_answers';


-- moodle.mdl_lesson_attempts definição

CREATE TABLE `mdl_lesson_attempts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `lessonid` bigint NOT NULL DEFAULT '0',
  `pageid` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `answerid` bigint NOT NULL DEFAULT '0',
  `retry` smallint NOT NULL DEFAULT '0',
  `correct` bigint NOT NULL DEFAULT '0',
  `useranswer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `timeseen` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessatte_use_ix` (`userid`),
  KEY `mdl_lessatte_les_ix` (`lessonid`),
  KEY `mdl_lessatte_pag_ix` (`pageid`),
  KEY `mdl_lessatte_ans_ix` (`answerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Defines lesson_attempts';


-- moodle.mdl_lesson_branch definição

CREATE TABLE `mdl_lesson_branch` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `lessonid` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `pageid` bigint NOT NULL DEFAULT '0',
  `retry` bigint NOT NULL DEFAULT '0',
  `flag` smallint NOT NULL DEFAULT '0',
  `timeseen` bigint NOT NULL DEFAULT '0',
  `nextpageid` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessbran_use_ix` (`userid`),
  KEY `mdl_lessbran_les_ix` (`lessonid`),
  KEY `mdl_lessbran_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='branches for each lesson/user';


-- moodle.mdl_lesson_grades definição

CREATE TABLE `mdl_lesson_grades` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `lessonid` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `late` smallint NOT NULL DEFAULT '0',
  `completed` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessgrad_use_ix` (`userid`),
  KEY `mdl_lessgrad_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Defines lesson_grades';


-- moodle.mdl_lesson_overrides definição

CREATE TABLE `mdl_lesson_overrides` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `lessonid` bigint NOT NULL DEFAULT '0',
  `groupid` bigint DEFAULT NULL,
  `userid` bigint DEFAULT NULL,
  `available` bigint DEFAULT NULL,
  `deadline` bigint DEFAULT NULL,
  `timelimit` bigint DEFAULT NULL,
  `review` smallint DEFAULT NULL,
  `maxattempts` smallint DEFAULT NULL,
  `retake` smallint DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_lessover_les_ix` (`lessonid`),
  KEY `mdl_lessover_gro_ix` (`groupid`),
  KEY `mdl_lessover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='The overrides to lesson settings.';


-- moodle.mdl_lesson_pages definição

CREATE TABLE `mdl_lesson_pages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `lessonid` bigint NOT NULL DEFAULT '0',
  `prevpageid` bigint NOT NULL DEFAULT '0',
  `nextpageid` bigint NOT NULL DEFAULT '0',
  `qtype` smallint NOT NULL DEFAULT '0',
  `qoption` smallint NOT NULL DEFAULT '0',
  `layout` smallint NOT NULL DEFAULT '1',
  `display` smallint NOT NULL DEFAULT '1',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contentsformat` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesspage_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Defines lesson_pages';


-- moodle.mdl_lesson_timer definição

CREATE TABLE `mdl_lesson_timer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `lessonid` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `starttime` bigint NOT NULL DEFAULT '0',
  `lessontime` bigint NOT NULL DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `timemodifiedoffline` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesstime_use_ix` (`userid`),
  KEY `mdl_lesstime_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='lesson timer for each lesson';


-- moodle.mdl_license definição

CREATE TABLE `mdl_license` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullname` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `version` bigint NOT NULL DEFAULT '0',
  `custom` tinyint(1) NOT NULL DEFAULT '0',
  `sortorder` mediumint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='store licenses used by moodle';


-- moodle.mdl_lock_db definição

CREATE TABLE `mdl_lock_db` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `resourcekey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `expires` bigint DEFAULT NULL,
  `owner` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_lockdb_res_uix` (`resourcekey`),
  KEY `mdl_lockdb_exp_ix` (`expires`),
  KEY `mdl_lockdb_own_ix` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores active and inactive lock types for db locking method.';


-- moodle.mdl_log definição

CREATE TABLE `mdl_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `time` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `course` bigint NOT NULL DEFAULT '0',
  `module` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cmid` bigint NOT NULL DEFAULT '0',
  `action` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_log_coumodact_ix` (`course`,`module`,`action`),
  KEY `mdl_log_tim_ix` (`time`),
  KEY `mdl_log_act_ix` (`action`),
  KEY `mdl_log_usecou_ix` (`userid`,`course`),
  KEY `mdl_log_cmi_ix` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Every action is logged as far as possible';


-- moodle.mdl_log_display definição

CREATE TABLE `mdl_log_display` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `module` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `action` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mtable` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_logdisp_modact_uix` (`module`,`action`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='For a particular module/action, specifies a moodle table/fie';


-- moodle.mdl_log_queries definição

CREATE TABLE `mdl_log_queries` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `qtype` mediumint NOT NULL,
  `sqltext` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sqlparams` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `error` mediumint NOT NULL DEFAULT '0',
  `info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `backtrace` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `exectime` decimal(10,5) NOT NULL,
  `timelogged` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Logged database queries.';


-- moodle.mdl_logstore_standard_log definição

CREATE TABLE `mdl_logstore_standard_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `eventname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `action` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `target` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `objecttable` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `objectid` bigint DEFAULT NULL,
  `crud` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `edulevel` tinyint(1) NOT NULL,
  `contextid` bigint NOT NULL,
  `contextlevel` bigint NOT NULL,
  `contextinstanceid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `courseid` bigint DEFAULT NULL,
  `relateduserid` bigint DEFAULT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `other` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `timecreated` bigint NOT NULL,
  `origin` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `realuserid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_logsstanlog_tim_ix` (`timecreated`),
  KEY `mdl_logsstanlog_couanotim_ix` (`courseid`,`anonymous`,`timecreated`),
  KEY `mdl_logsstanlog_useconconcr_ix` (`userid`,`contextlevel`,`contextinstanceid`,`crud`,`edulevel`,`timecreated`),
  KEY `mdl_logsstanlog_con_ix` (`contextid`),
  KEY `mdl_logsstanlog_use_ix` (`userid`),
  KEY `mdl_logsstanlog_cou_ix` (`courseid`),
  KEY `mdl_logsstanlog_rea_ix` (`realuserid`),
  KEY `mdl_logsstanlog_rel_ix` (`relateduserid`)
) ENGINE=InnoDB AUTO_INCREMENT=1111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Standard log table';


-- moodle.mdl_lti definição

CREATE TABLE `mdl_lti` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL DEFAULT '0',
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `introformat` smallint DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `typeid` bigint DEFAULT NULL,
  `toolurl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `securetoolurl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `instructorchoicesendname` tinyint(1) DEFAULT NULL,
  `instructorchoicesendemailaddr` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowroster` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowsetting` tinyint(1) DEFAULT NULL,
  `instructorcustomparameters` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `instructorchoiceacceptgrades` tinyint(1) DEFAULT NULL,
  `grade` bigint NOT NULL DEFAULT '100',
  `launchcontainer` tinyint NOT NULL DEFAULT '1',
  `resourcekey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `debuglaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showtitlelaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showdescriptionlaunch` tinyint(1) NOT NULL DEFAULT '0',
  `servicesalt` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `secureicon` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_lti_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='This table contains Basic LTI activities instances';


-- moodle.mdl_lti_access_tokens definição

CREATE TABLE `mdl_lti_access_tokens` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `typeid` bigint NOT NULL,
  `scope` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `validuntil` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `lastaccess` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_ltiaccetoke_tok_uix` (`token`),
  KEY `mdl_ltiaccetoke_typ_ix` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Security tokens for accessing of LTI services';


-- moodle.mdl_lti_coursevisible definição

CREATE TABLE `mdl_lti_coursevisible` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `typeid` bigint NOT NULL,
  `courseid` bigint NOT NULL,
  `coursevisible` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_lticour_cou_ix` (`courseid`),
  KEY `mdl_lticour_typ_ix` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Table to store coursevisible setting for site tool on course';


-- moodle.mdl_lti_submission definição

CREATE TABLE `mdl_lti_submission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ltiid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `datesubmitted` bigint NOT NULL,
  `dateupdated` bigint NOT NULL,
  `gradepercent` decimal(10,5) NOT NULL,
  `originalgrade` decimal(10,5) NOT NULL,
  `launchid` bigint NOT NULL,
  `state` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltisubm_lti_ix` (`ltiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Keeps track of individual submissions for LTI activities.';


-- moodle.mdl_lti_tool_proxies definição

CREATE TABLE `mdl_lti_tool_proxies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Tool Provider',
  `regurl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `state` tinyint NOT NULL DEFAULT '1',
  `guid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendorcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capabilityoffered` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `serviceoffered` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `toolproxy` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `createdby` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_ltitoolprox_gui_uix` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='LTI tool proxy registrations';


-- moodle.mdl_lti_tool_settings definição

CREATE TABLE `mdl_lti_tool_settings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `toolproxyid` bigint NOT NULL,
  `typeid` bigint DEFAULT NULL,
  `course` bigint DEFAULT NULL,
  `coursemoduleid` bigint DEFAULT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltitoolsett_too_ix` (`toolproxyid`),
  KEY `mdl_ltitoolsett_typ_ix` (`typeid`),
  KEY `mdl_ltitoolsett_cou_ix` (`course`),
  KEY `mdl_ltitoolsett_cou2_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='LTI tool setting values';


-- moodle.mdl_lti_types definição

CREATE TABLE `mdl_lti_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'basiclti Activity',
  `baseurl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tooldomain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint NOT NULL DEFAULT '2',
  `course` bigint NOT NULL,
  `coursevisible` tinyint(1) NOT NULL DEFAULT '0',
  `ltiversion` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `clientid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `toolproxyid` bigint DEFAULT NULL,
  `enabledcapability` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `parameter` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `icon` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `secureicon` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `createdby` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_ltitype_cli_uix` (`clientid`),
  KEY `mdl_ltitype_cou_ix` (`course`),
  KEY `mdl_ltitype_too_ix` (`tooldomain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Basic LTI pre-configured activities';


-- moodle.mdl_lti_types_categories definição

CREATE TABLE `mdl_lti_types_categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `typeid` bigint NOT NULL,
  `categoryid` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltitypecate_typ_ix` (`typeid`),
  KEY `mdl_ltitypecate_cat_ix` (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Link LTI types to course categories';


-- moodle.mdl_lti_types_config definição

CREATE TABLE `mdl_lti_types_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `typeid` bigint NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltitypeconf_typ_ix` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Basic LTI types configuration';


-- moodle.mdl_ltiservice_gradebookservices definição

CREATE TABLE `mdl_ltiservice_gradebookservices` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gradeitemid` bigint NOT NULL,
  `courseid` bigint NOT NULL,
  `toolproxyid` bigint DEFAULT NULL,
  `typeid` bigint DEFAULT NULL,
  `baseurl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ltilinkid` bigint DEFAULT NULL,
  `resourceid` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subreviewurl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `subreviewparams` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_ltisgrad_lti_ix` (`ltilinkid`),
  KEY `mdl_ltisgrad_gracou_ix` (`gradeitemid`,`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='This file records the grade items created by the LTI Gradebo';


-- moodle.mdl_matrix_room definição

CREATE TABLE `mdl_matrix_room` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `commid` bigint NOT NULL,
  `roomid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `topic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_matrroom_com_ix` (`commid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores the matrix room information associated with the commu';


-- moodle.mdl_message definição

CREATE TABLE `mdl_message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint NOT NULL DEFAULT '0',
  `useridto` bigint NOT NULL DEFAULT '0',
  `subject` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fullmessage` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fullmessageformat` smallint DEFAULT '0',
  `fullmessagehtml` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `smallmessage` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contexturlname` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timeuserfromdeleted` bigint NOT NULL DEFAULT '0',
  `timeusertodeleted` bigint NOT NULL DEFAULT '0',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eventtype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customdata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_mess_useusetimtim_ix` (`useridfrom`,`useridto`,`timeuserfromdeleted`,`timeusertodeleted`),
  KEY `mdl_mess_usetimnot_ix` (`useridfrom`,`timeuserfromdeleted`,`notification`),
  KEY `mdl_mess_usetimnot2_ix` (`useridto`,`timeusertodeleted`,`notification`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores all unread messages';


-- moodle.mdl_message_airnotifier_devices definição

CREATE TABLE `mdl_message_airnotifier_devices` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userdeviceid` bigint NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messairndevi_use_uix` (`userdeviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Store information about the devices registered in Airnotifie';


-- moodle.mdl_message_contact_requests definição

CREATE TABLE `mdl_message_contact_requests` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL,
  `requesteduserid` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messcontrequ_usereq_uix` (`userid`,`requesteduserid`),
  KEY `mdl_messcontrequ_use_ix` (`userid`),
  KEY `mdl_messcontrequ_req_ix` (`requesteduserid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Maintains list of contact requests between users';


-- moodle.mdl_message_contacts definição

CREATE TABLE `mdl_message_contacts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL,
  `contactid` bigint NOT NULL,
  `timecreated` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messcont_usecon_uix` (`userid`,`contactid`),
  KEY `mdl_messcont_use_ix` (`userid`),
  KEY `mdl_messcont_con_ix` (`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Maintains lists of contacts between users';


-- moodle.mdl_message_conversation_actions definição

CREATE TABLE `mdl_message_conversation_actions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL,
  `conversationid` bigint NOT NULL,
  `action` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_messconvacti_use_ix` (`userid`),
  KEY `mdl_messconvacti_con_ix` (`conversationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores all per-user actions on individual conversations';


-- moodle.mdl_message_conversation_members definição

CREATE TABLE `mdl_message_conversation_members` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `conversationid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_messconvmemb_con_ix` (`conversationid`),
  KEY `mdl_messconvmemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores all members in a conversations';


-- moodle.mdl_message_conversations definição

CREATE TABLE `mdl_message_conversations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` bigint NOT NULL DEFAULT '1',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `convhash` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemtype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemid` bigint DEFAULT NULL,
  `contextid` bigint DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL,
  `timemodified` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_messconv_typ_ix` (`type`),
  KEY `mdl_messconv_con_ix` (`convhash`),
  KEY `mdl_messconv_comiteitecon_ix` (`component`,`itemtype`,`itemid`,`contextid`),
  KEY `mdl_messconv_con2_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores all message conversations';


-- moodle.mdl_message_email_messages definição

CREATE TABLE `mdl_message_email_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `useridto` bigint NOT NULL,
  `conversationid` bigint NOT NULL,
  `messageid` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_messemaimess_use_ix` (`useridto`),
  KEY `mdl_messemaimess_con_ix` (`conversationid`),
  KEY `mdl_messemaimess_mes_ix` (`messageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Keeps track of what emails to send in an email digest';


-- moodle.mdl_message_popup definição

CREATE TABLE `mdl_message_popup` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `messageid` bigint NOT NULL,
  `isread` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messpopu_mesisr_uix` (`messageid`,`isread`),
  KEY `mdl_messpopu_isr_ix` (`isread`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Keep state of notifications for the popup message processor';


-- moodle.mdl_message_popup_notifications definição

CREATE TABLE `mdl_message_popup_notifications` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `notificationid` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_messpopunoti_not_ix` (`notificationid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='List of notifications to display in the message output popup';


-- moodle.mdl_message_processors definição

CREATE TABLE `mdl_message_processors` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(166) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='List of message output plugins';


-- moodle.mdl_message_providers definição

CREATE TABLE `mdl_message_providers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `capability` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messprov_comnam_uix` (`component`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='This table stores the message providers (modules and core sy';


-- moodle.mdl_message_read definição

CREATE TABLE `mdl_message_read` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint NOT NULL DEFAULT '0',
  `useridto` bigint NOT NULL DEFAULT '0',
  `subject` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fullmessage` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fullmessageformat` smallint DEFAULT '0',
  `fullmessagehtml` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `smallmessage` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contexturlname` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timeread` bigint NOT NULL DEFAULT '0',
  `timeuserfromdeleted` bigint NOT NULL DEFAULT '0',
  `timeusertodeleted` bigint NOT NULL DEFAULT '0',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eventtype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_messread_useusetimtim_ix` (`useridfrom`,`useridto`,`timeuserfromdeleted`,`timeusertodeleted`),
  KEY `mdl_messread_nottim_ix` (`notification`,`timeread`),
  KEY `mdl_messread_usetimnot_ix` (`useridfrom`,`timeuserfromdeleted`,`notification`),
  KEY `mdl_messread_usetimnot2_ix` (`useridto`,`timeusertodeleted`,`notification`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores all messages that have been read';


-- moodle.mdl_message_user_actions definição

CREATE TABLE `mdl_message_user_actions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL,
  `messageid` bigint NOT NULL,
  `action` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messuseracti_usemesact_uix` (`userid`,`messageid`,`action`),
  KEY `mdl_messuseracti_use_ix` (`userid`),
  KEY `mdl_messuseracti_mes_ix` (`messageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores all per-user actions on individual messages';


-- moodle.mdl_message_users_blocked definição

CREATE TABLE `mdl_message_users_blocked` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL,
  `blockeduserid` bigint NOT NULL,
  `timecreated` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messuserbloc_useblo_uix` (`userid`,`blockeduserid`),
  KEY `mdl_messuserbloc_use_ix` (`userid`),
  KEY `mdl_messuserbloc_blo_ix` (`blockeduserid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Maintains lists of blocked users';


-- moodle.mdl_messageinbound_datakeys definição

CREATE TABLE `mdl_messageinbound_datakeys` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `handler` bigint NOT NULL,
  `datavalue` bigint NOT NULL,
  `datakey` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timecreated` bigint NOT NULL,
  `expires` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messdata_handat_uix` (`handler`,`datavalue`),
  KEY `mdl_messdata_han_ix` (`handler`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Inbound Message data item secret keys.';


-- moodle.mdl_messageinbound_handlers definição

CREATE TABLE `mdl_messageinbound_handlers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `defaultexpiration` bigint NOT NULL DEFAULT '86400',
  `validateaddress` tinyint(1) NOT NULL DEFAULT '1',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messhand_cla_uix` (`classname`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Inbound Message Handler definitions.';


-- moodle.mdl_messageinbound_messagelist definição

CREATE TABLE `mdl_messageinbound_messagelist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `messageid` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `userid` bigint NOT NULL,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timecreated` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_messmess_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='A list of message IDs for existing replies';


-- moodle.mdl_messages definição

CREATE TABLE `mdl_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint NOT NULL,
  `conversationid` bigint NOT NULL,
  `subject` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fullmessage` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fullmessageformat` tinyint(1) NOT NULL DEFAULT '0',
  `fullmessagehtml` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `smallmessage` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `timecreated` bigint NOT NULL,
  `fullmessagetrust` tinyint NOT NULL DEFAULT '0',
  `customdata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_mess_contim_ix` (`conversationid`,`timecreated`),
  KEY `mdl_mess_use_ix` (`useridfrom`),
  KEY `mdl_mess_con_ix` (`conversationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores all messages';


-- moodle.mdl_mnet_application definição

CREATE TABLE `mdl_mnet_application` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `xmlrpc_server_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sso_land_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sso_jump_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Information about applications on remote hosts';


-- moodle.mdl_mnet_host definição

CREATE TABLE `mdl_mnet_host` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `wwwroot` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `public_key` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `public_key_expires` bigint NOT NULL DEFAULT '0',
  `transport` tinyint NOT NULL DEFAULT '0',
  `portno` mediumint NOT NULL DEFAULT '0',
  `last_connect_time` bigint NOT NULL DEFAULT '0',
  `last_log_id` bigint NOT NULL DEFAULT '0',
  `force_theme` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `applicationid` bigint NOT NULL DEFAULT '1',
  `sslverification` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mnethost_las_ix` (`last_log_id`),
  KEY `mdl_mnethost_app_ix` (`applicationid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Information about the local and remote hosts for RPC';


-- moodle.mdl_mnet_host2service definição

CREATE TABLE `mdl_mnet_host2service` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `hostid` bigint NOT NULL DEFAULT '0',
  `serviceid` bigint NOT NULL DEFAULT '0',
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `subscribe` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnethost_hosser_uix` (`hostid`,`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Information about the services for a given host';


-- moodle.mdl_mnet_log definição

CREATE TABLE `mdl_mnet_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `hostid` bigint NOT NULL DEFAULT '0',
  `remoteid` bigint NOT NULL DEFAULT '0',
  `time` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `course` bigint NOT NULL DEFAULT '0',
  `coursename` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `module` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cmid` bigint NOT NULL DEFAULT '0',
  `action` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetlog_hosusecou_ix` (`hostid`,`userid`,`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Store session data from users migrating to other sites';


-- moodle.mdl_mnet_remote_rpc definição

CREATE TABLE `mdl_mnet_remote_rpc` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `plugintype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pluginname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='This table describes functions that might be called remotely';


-- moodle.mdl_mnet_remote_service2rpc definição

CREATE TABLE `mdl_mnet_remote_service2rpc` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `serviceid` bigint NOT NULL DEFAULT '0',
  `rpcid` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetremoserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Group functions or methods under a service';


-- moodle.mdl_mnet_rpc definição

CREATE TABLE `mdl_mnet_rpc` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `plugintype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pluginname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `help` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `static` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_mnetrpc_enaxml_ix` (`enabled`,`xmlrpcpath`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Functions or methods that we may publish or subscribe to';


-- moodle.mdl_mnet_service definição

CREATE TABLE `mdl_mnet_service` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `apiversion` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `offer` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='A service is a group of functions';


-- moodle.mdl_mnet_service2rpc definição

CREATE TABLE `mdl_mnet_service2rpc` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `serviceid` bigint NOT NULL DEFAULT '0',
  `rpcid` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Group functions or methods under a service';


-- moodle.mdl_mnet_session definição

CREATE TABLE `mdl_mnet_session` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL DEFAULT '0',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `token` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mnethostid` bigint NOT NULL DEFAULT '0',
  `useragent` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `confirm_timeout` bigint NOT NULL DEFAULT '0',
  `session_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `expires` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetsess_tok_uix` (`token`),
  KEY `mdl_mnetsess_use_ix` (`userid`),
  KEY `mdl_mnetsess_mne_ix` (`mnethostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Store session data from users migrating to other sites';


-- moodle.mdl_mnet_sso_access_control definição

CREATE TABLE `mdl_mnet_sso_access_control` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mnet_host_id` bigint NOT NULL DEFAULT '0',
  `accessctrl` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'allow',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetssoaccecont_mneuse_uix` (`mnet_host_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Users by host permitted (or not) to login from a remote prov';


-- moodle.mdl_modules definição

CREATE TABLE `mdl_modules` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cron` bigint NOT NULL DEFAULT '0',
  `lastcron` bigint NOT NULL DEFAULT '0',
  `search` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_modu_nam_ix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='modules available in the site';


-- moodle.mdl_moodlenet_share_progress definição

CREATE TABLE `mdl_moodlenet_share_progress` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` tinyint NOT NULL,
  `courseid` bigint NOT NULL,
  `cmid` bigint DEFAULT NULL,
  `userid` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `resourceurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Records MoodleNet share progress';


-- moodle.mdl_my_pages definição

CREATE TABLE `mdl_my_pages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint DEFAULT '0',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `private` tinyint(1) NOT NULL DEFAULT '1',
  `sortorder` mediumint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mypage_usepri_ix` (`userid`,`private`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Extra user pages for the My Moodle system';


-- moodle.mdl_notifications definição

CREATE TABLE `mdl_notifications` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint NOT NULL,
  `useridto` bigint NOT NULL,
  `subject` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fullmessage` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fullmessageformat` tinyint(1) NOT NULL DEFAULT '0',
  `fullmessagehtml` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `smallmessage` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eventtype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contexturl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contexturlname` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `timeread` bigint DEFAULT NULL,
  `timecreated` bigint NOT NULL,
  `customdata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_noti_use_ix` (`useridfrom`),
  KEY `mdl_noti_tim_ix` (`timecreated`),
  KEY `mdl_noti_tim2_ix` (`timeread`),
  KEY `mdl_noti_use2_ix` (`useridto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores all notifications';


-- moodle.mdl_oauth2_access_token definição

CREATE TABLE `mdl_oauth2_access_token` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `usermodified` bigint NOT NULL,
  `issuerid` bigint NOT NULL,
  `token` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` bigint NOT NULL,
  `scope` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_oautaccetoke_iss_uix` (`issuerid`),
  KEY `mdl_oautaccetoke_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores access tokens for system accounts in order to be able';


-- moodle.mdl_oauth2_endpoint definição

CREATE TABLE `mdl_oauth2_endpoint` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `usermodified` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `issuerid` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_oautendp_iss_ix` (`issuerid`),
  KEY `mdl_oautendp_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Describes the named endpoint for an oauth2 service.';


-- moodle.mdl_oauth2_issuer definição

CREATE TABLE `mdl_oauth2_issuer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `usermodified` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `baseurl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientid` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `clientsecret` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `loginscopes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `loginscopesoffline` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `loginparams` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `loginparamsoffline` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alloweddomains` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopessupported` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `enabled` tinyint NOT NULL DEFAULT '1',
  `showonloginpage` tinyint NOT NULL DEFAULT '1',
  `basicauth` tinyint NOT NULL DEFAULT '0',
  `sortorder` bigint NOT NULL,
  `requireconfirmation` tinyint NOT NULL DEFAULT '1',
  `servicetype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loginpagename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `systememail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Details for an oauth 2 connect identity issuer.';


-- moodle.mdl_oauth2_refresh_token definição

CREATE TABLE `mdl_oauth2_refresh_token` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `issuerid` bigint NOT NULL,
  `token` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopehash` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_oautrefrtoke_useisssco_uix` (`userid`,`issuerid`,`scopehash`),
  KEY `mdl_oautrefrtoke_iss_ix` (`issuerid`),
  KEY `mdl_oautrefrtoke_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores refresh tokens which can be exchanged for access toke';


-- moodle.mdl_oauth2_system_account definição

CREATE TABLE `mdl_oauth2_system_account` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `usermodified` bigint NOT NULL,
  `issuerid` bigint NOT NULL,
  `refreshtoken` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `grantedscopes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `username` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_oautsystacco_iss_uix` (`issuerid`),
  KEY `mdl_oautsystacco_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stored details used to get an access token as a system user ';


-- moodle.mdl_oauth2_user_field_mapping definição

CREATE TABLE `mdl_oauth2_user_field_mapping` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `timemodified` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `usermodified` bigint NOT NULL,
  `issuerid` bigint NOT NULL,
  `externalfield` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `internalfield` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_oautuserfielmapp_issin_uix` (`issuerid`,`internalfield`),
  KEY `mdl_oautuserfielmapp_iss_ix` (`issuerid`),
  KEY `mdl_oautuserfielmapp_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Mapping of oauth user fields to moodle fields.';


-- moodle.mdl_page definição

CREATE TABLE `mdl_page` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL DEFAULT '0',
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `introformat` smallint NOT NULL DEFAULT '0',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentformat` smallint NOT NULL DEFAULT '0',
  `legacyfiles` smallint NOT NULL DEFAULT '0',
  `legacyfileslast` bigint DEFAULT NULL,
  `display` smallint NOT NULL DEFAULT '0',
  `displayoptions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revision` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_page_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Each record is one page and its config data';


-- moodle.mdl_paygw_paypal definição

CREATE TABLE `mdl_paygw_paypal` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `paymentid` bigint NOT NULL,
  `pp_orderid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'The ID of the order in PayPal',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_paygpayp_pay_uix` (`paymentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores PayPal related information';


-- moodle.mdl_payment_accounts definição

CREATE TABLE `mdl_payment_accounts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contextid` bigint NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint DEFAULT NULL,
  `timemodified` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_paymacco_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Payment accounts';


-- moodle.mdl_payment_gateways definição

CREATE TABLE `mdl_payment_gateways` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `accountid` bigint NOT NULL,
  `gateway` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_paymgate_acc_ix` (`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Configuration for one gateway for one payment account';


-- moodle.mdl_payments definição

CREATE TABLE `mdl_payments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `paymentarea` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `amount` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `accountid` bigint NOT NULL,
  `gateway` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_paym_gat_ix` (`gateway`),
  KEY `mdl_paym_compayite_ix` (`component`,`paymentarea`,`itemid`),
  KEY `mdl_paym_use_ix` (`userid`),
  KEY `mdl_paym_acc_ix` (`accountid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores information about payments';


-- moodle.mdl_portfolio_instance definição

CREATE TABLE `mdl_portfolio_instance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `plugin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='base table (not including config data) for instances of port';


-- moodle.mdl_portfolio_instance_config definição

CREATE TABLE `mdl_portfolio_instance_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `instance` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstconf_nam_ix` (`name`),
  KEY `mdl_portinstconf_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='config for portfolio plugin instances';


-- moodle.mdl_portfolio_instance_user definição

CREATE TABLE `mdl_portfolio_instance_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `instance` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstuser_ins_ix` (`instance`),
  KEY `mdl_portinstuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='user data for portfolio instances.';


-- moodle.mdl_portfolio_log definição

CREATE TABLE `mdl_portfolio_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL,
  `time` bigint NOT NULL,
  `portfolio` bigint NOT NULL,
  `caller_class` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `caller_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `caller_component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caller_sha1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tempdataid` bigint NOT NULL DEFAULT '0',
  `returnurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `continueurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portlog_use_ix` (`userid`),
  KEY `mdl_portlog_por_ix` (`portfolio`),
  KEY `mdl_portlog_tem_ix` (`tempdataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='log of portfolio transfers (used to later check for duplicat';


-- moodle.mdl_portfolio_tempdata definição

CREATE TABLE `mdl_portfolio_tempdata` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `expirytime` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `instance` bigint DEFAULT '0',
  `queued` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_porttemp_use_ix` (`userid`),
  KEY `mdl_porttemp_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='stores temporary data for portfolio exports. the id of this ';


-- moodle.mdl_post definição

CREATE TABLE `mdl_post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `module` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint NOT NULL DEFAULT '0',
  `courseid` bigint NOT NULL DEFAULT '0',
  `groupid` bigint NOT NULL DEFAULT '0',
  `moduleid` bigint NOT NULL DEFAULT '0',
  `coursemoduleid` bigint NOT NULL DEFAULT '0',
  `subject` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `uniquehash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rating` bigint NOT NULL DEFAULT '0',
  `format` bigint NOT NULL DEFAULT '0',
  `summaryformat` tinyint NOT NULL DEFAULT '0',
  `attachment` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publishstate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `lastmodified` bigint NOT NULL DEFAULT '0',
  `created` bigint NOT NULL DEFAULT '0',
  `usermodified` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_post_iduse_uix` (`id`,`userid`),
  KEY `mdl_post_las_ix` (`lastmodified`),
  KEY `mdl_post_mod_ix` (`module`),
  KEY `mdl_post_sub_ix` (`subject`),
  KEY `mdl_post_use_ix` (`usermodified`),
  KEY `mdl_post_cou_ix` (`courseid`),
  KEY `mdl_post_cou2_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Generic post table to hold data blog entries etc in differen';


-- moodle.mdl_profiling definição

CREATE TABLE `mdl_profiling` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `runid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalexecutiontime` bigint NOT NULL,
  `totalcputime` bigint NOT NULL,
  `totalcalls` bigint NOT NULL,
  `totalmemory` bigint NOT NULL,
  `runreference` tinyint NOT NULL DEFAULT '0',
  `runcomment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_prof_run_uix` (`runid`),
  KEY `mdl_prof_urlrun_ix` (`url`,`runreference`),
  KEY `mdl_prof_timrun_ix` (`timecreated`,`runreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores the results of all the profiling runs';


-- moodle.mdl_qbank definição

CREATE TABLE `mdl_qbank` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL,
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `introformat` smallint NOT NULL DEFAULT '0',
  `type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_qban_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores the qbank activity module instances.';


-- moodle.mdl_qtype_ddimageortext definição

CREATE TABLE `mdl_qtype_ddimageortext` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questionid` bigint NOT NULL DEFAULT '0',
  `shuffleanswers` smallint NOT NULL DEFAULT '1',
  `correctfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint NOT NULL DEFAULT '0',
  `dropzonevisibility` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddim_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Defines drag and drop (text or images onto a background imag';


-- moodle.mdl_qtype_ddimageortext_drags definição

CREATE TABLE `mdl_qtype_ddimageortext_drags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questionid` bigint NOT NULL DEFAULT '0',
  `no` bigint NOT NULL DEFAULT '0',
  `draggroup` bigint NOT NULL DEFAULT '0',
  `infinite` smallint NOT NULL DEFAULT '0',
  `label` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddimdrag_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Images to drag. Actual file names are not stored here we use';


-- moodle.mdl_qtype_ddimageortext_drops definição

CREATE TABLE `mdl_qtype_ddimageortext_drops` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questionid` bigint NOT NULL DEFAULT '0',
  `no` bigint NOT NULL DEFAULT '0',
  `xleft` bigint NOT NULL DEFAULT '0',
  `ytop` bigint NOT NULL DEFAULT '0',
  `choice` bigint NOT NULL DEFAULT '0',
  `label` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddimdrop_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Drop boxes';


-- moodle.mdl_qtype_ddmarker definição

CREATE TABLE `mdl_qtype_ddmarker` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questionid` bigint NOT NULL DEFAULT '0',
  `shuffleanswers` smallint NOT NULL DEFAULT '1',
  `correctfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint NOT NULL DEFAULT '0',
  `showmisplaced` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddma_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Defines drag and drop (text or images onto a background imag';


-- moodle.mdl_qtype_ddmarker_drags definição

CREATE TABLE `mdl_qtype_ddmarker_drags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questionid` bigint NOT NULL DEFAULT '0',
  `no` bigint NOT NULL DEFAULT '0',
  `label` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `infinite` smallint NOT NULL DEFAULT '0',
  `noofdrags` bigint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddmadrag_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Labels for markers to drag.';


-- moodle.mdl_qtype_ddmarker_drops definição

CREATE TABLE `mdl_qtype_ddmarker_drops` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questionid` bigint NOT NULL DEFAULT '0',
  `no` bigint NOT NULL DEFAULT '0',
  `shape` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `choice` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddmadrop_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='drop regions';


-- moodle.mdl_qtype_essay_options definição

CREATE TABLE `mdl_qtype_essay_options` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questionid` bigint NOT NULL,
  `responseformat` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'editor',
  `responserequired` tinyint NOT NULL DEFAULT '1',
  `responsefieldlines` smallint NOT NULL DEFAULT '15',
  `minwordlimit` bigint DEFAULT NULL,
  `maxwordlimit` bigint DEFAULT NULL,
  `attachments` smallint NOT NULL DEFAULT '0',
  `attachmentsrequired` smallint NOT NULL DEFAULT '0',
  `graderinfo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `graderinfoformat` smallint NOT NULL DEFAULT '0',
  `responsetemplate` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `responsetemplateformat` smallint NOT NULL DEFAULT '0',
  `maxbytes` bigint NOT NULL DEFAULT '0',
  `filetypeslist` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypessaopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Extra options for essay questions.';


-- moodle.mdl_qtype_match_options definição

CREATE TABLE `mdl_qtype_match_options` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questionid` bigint NOT NULL DEFAULT '0',
  `shuffleanswers` smallint NOT NULL DEFAULT '1',
  `correctfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypmatcopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Defines the question-type specific options for matching ques';


-- moodle.mdl_qtype_match_subquestions definição

CREATE TABLE `mdl_qtype_match_subquestions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questionid` bigint NOT NULL DEFAULT '0',
  `questiontext` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `questiontextformat` tinyint NOT NULL DEFAULT '0',
  `answertext` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypmatcsubq_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='The subquestions that make up a matching question';


-- moodle.mdl_qtype_multichoice_options definição

CREATE TABLE `mdl_qtype_multichoice_options` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questionid` bigint NOT NULL DEFAULT '0',
  `layout` smallint NOT NULL DEFAULT '0',
  `single` smallint NOT NULL DEFAULT '0',
  `shuffleanswers` smallint NOT NULL DEFAULT '1',
  `correctfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint NOT NULL DEFAULT '0',
  `showstandardinstruction` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypmultopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Options for multiple choice questions';


-- moodle.mdl_qtype_ordering_options definição

CREATE TABLE `mdl_qtype_ordering_options` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questionid` bigint NOT NULL DEFAULT '0',
  `layouttype` tinyint NOT NULL DEFAULT '0',
  `selecttype` tinyint NOT NULL DEFAULT '0',
  `selectcount` smallint NOT NULL DEFAULT '2',
  `gradingtype` tinyint NOT NULL DEFAULT '0',
  `showgrading` tinyint NOT NULL DEFAULT '0',
  `numberingstyle` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `correctfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `correctfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `incorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `partiallycorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypordeopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Options for ordering questions';


-- moodle.mdl_qtype_randomsamatch_options definição

CREATE TABLE `mdl_qtype_randomsamatch_options` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questionid` bigint NOT NULL DEFAULT '0',
  `choose` bigint NOT NULL DEFAULT '4',
  `subcats` tinyint NOT NULL DEFAULT '1',
  `correctfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtyprandopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Info about a random short-answer matching question';


-- moodle.mdl_qtype_shortanswer_options definição

CREATE TABLE `mdl_qtype_shortanswer_options` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questionid` bigint NOT NULL DEFAULT '0',
  `usecase` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypshoropti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Options for short answer questions';


-- moodle.mdl_question definição

CREATE TABLE `mdl_question` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `questiontext` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `questiontextformat` tinyint NOT NULL DEFAULT '0',
  `generalfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `generalfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `defaultmark` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.3333333',
  `qtype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `length` bigint NOT NULL DEFAULT '1',
  `stamp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `createdby` bigint DEFAULT NULL,
  `modifiedby` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ques_qty_ix` (`qtype`),
  KEY `mdl_ques_par_ix` (`parent`),
  KEY `mdl_ques_cre_ix` (`createdby`),
  KEY `mdl_ques_mod_ix` (`modifiedby`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='This table stores the definition of one version of a questio';


-- moodle.mdl_question_answers definição

CREATE TABLE `mdl_question_answers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question` bigint NOT NULL DEFAULT '0',
  `answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answerformat` tinyint NOT NULL DEFAULT '0',
  `fraction` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `feedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `feedbackformat` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Answers, with a fractional grade (0-1) and feedback';


-- moodle.mdl_question_attempt_step_data definição

CREATE TABLE `mdl_question_attempt_step_data` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `attemptstepid` bigint NOT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_quesattestepdata_att_ix` (`attemptstepid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Each question_attempt_step has an associative array of the d';


-- moodle.mdl_question_attempt_steps definição

CREATE TABLE `mdl_question_attempt_steps` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questionattemptid` bigint NOT NULL,
  `sequencenumber` bigint NOT NULL,
  `state` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `fraction` decimal(12,7) DEFAULT NULL,
  `timecreated` bigint NOT NULL,
  `userid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestep_queseq_uix` (`questionattemptid`,`sequencenumber`),
  KEY `mdl_quesattestep_que_ix` (`questionattemptid`),
  KEY `mdl_quesattestep_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores one step in in a question attempt. As well as the dat';


-- moodle.mdl_question_attempts definição

CREATE TABLE `mdl_question_attempts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint NOT NULL,
  `slot` bigint NOT NULL,
  `behaviour` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `questionid` bigint NOT NULL,
  `variant` bigint NOT NULL DEFAULT '1',
  `maxmark` decimal(12,7) NOT NULL,
  `minfraction` decimal(12,7) NOT NULL,
  `maxfraction` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `flagged` tinyint(1) NOT NULL DEFAULT '0',
  `questionsummary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rightanswer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `responsesummary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `timemodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesatte_queslo_uix` (`questionusageid`,`slot`),
  KEY `mdl_quesatte_beh_ix` (`behaviour`),
  KEY `mdl_quesatte_que_ix` (`questionid`),
  KEY `mdl_quesatte_que2_ix` (`questionusageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Each row here corresponds to an attempt at one question, as ';


-- moodle.mdl_question_bank_entries definição

CREATE TABLE `mdl_question_bank_entries` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questioncategoryid` bigint NOT NULL DEFAULT '0',
  `idnumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ownerid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesbankentr_queidn_uix` (`questioncategoryid`,`idnumber`),
  KEY `mdl_quesbankentr_que_ix` (`questioncategoryid`),
  KEY `mdl_quesbankentr_own_ix` (`ownerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Each question bank entry. This table has one row for each qu';


-- moodle.mdl_question_calculated definição

CREATE TABLE `mdl_question_calculated` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question` bigint NOT NULL DEFAULT '0',
  `answer` bigint NOT NULL DEFAULT '0',
  `tolerance` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0',
  `tolerancetype` bigint NOT NULL DEFAULT '1',
  `correctanswerlength` bigint NOT NULL DEFAULT '2',
  `correctanswerformat` bigint NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalc_ans_ix` (`answer`),
  KEY `mdl_quescalc_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Options for questions of type calculated';


-- moodle.mdl_question_calculated_options definição

CREATE TABLE `mdl_question_calculated_options` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question` bigint NOT NULL DEFAULT '0',
  `synchronize` tinyint NOT NULL DEFAULT '0',
  `single` smallint NOT NULL DEFAULT '0',
  `shuffleanswers` smallint NOT NULL DEFAULT '0',
  `correctfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `correctfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `partiallycorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `incorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalcopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Options for questions of type calculated';


-- moodle.mdl_question_categories definição

CREATE TABLE `mdl_question_categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint NOT NULL DEFAULT '0',
  `info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `infoformat` tinyint NOT NULL DEFAULT '0',
  `stamp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `parent` bigint NOT NULL DEFAULT '0',
  `sortorder` bigint NOT NULL DEFAULT '999',
  `idnumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quescate_consta_uix` (`contextid`,`stamp`),
  UNIQUE KEY `mdl_quescate_conidn_uix` (`contextid`,`idnumber`),
  KEY `mdl_quescate_con_ix` (`contextid`),
  KEY `mdl_quescate_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Categories are for grouping questions';


-- moodle.mdl_question_dataset_definitions definição

CREATE TABLE `mdl_question_dataset_definitions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` bigint NOT NULL DEFAULT '0',
  `options` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `itemcount` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdatadefi_cat_ix` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Organises and stores properties for dataset items';


-- moodle.mdl_question_dataset_items definição

CREATE TABLE `mdl_question_dataset_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `definition` bigint NOT NULL DEFAULT '0',
  `itemnumber` bigint NOT NULL DEFAULT '0',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdataitem_def_ix` (`definition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Individual dataset items';


-- moodle.mdl_question_datasets definição

CREATE TABLE `mdl_question_datasets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question` bigint NOT NULL DEFAULT '0',
  `datasetdefinition` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdata_quedat_ix` (`question`,`datasetdefinition`),
  KEY `mdl_quesdata_que_ix` (`question`),
  KEY `mdl_quesdata_dat_ix` (`datasetdefinition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Many-many relation between questions and dataset definitions';


-- moodle.mdl_question_ddwtos definição

CREATE TABLE `mdl_question_ddwtos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questionid` bigint NOT NULL DEFAULT '0',
  `shuffleanswers` smallint NOT NULL DEFAULT '1',
  `correctfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesddwt_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Defines drag and drop (words into sentences) questions';


-- moodle.mdl_question_gapselect definição

CREATE TABLE `mdl_question_gapselect` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questionid` bigint NOT NULL DEFAULT '0',
  `shuffleanswers` smallint NOT NULL DEFAULT '1',
  `correctfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesgaps_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Defines select missing words questions';


-- moodle.mdl_question_hints definição

CREATE TABLE `mdl_question_hints` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questionid` bigint NOT NULL,
  `hint` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hintformat` smallint NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(1) DEFAULT NULL,
  `clearwrong` tinyint(1) DEFAULT NULL,
  `options` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_queshint_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores the the part of the question definition that gives di';


-- moodle.mdl_question_multianswer definição

CREATE TABLE `mdl_question_multianswer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question` bigint NOT NULL DEFAULT '0',
  `sequence` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quesmult_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Options for multianswer questions';


-- moodle.mdl_question_numerical definição

CREATE TABLE `mdl_question_numerical` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question` bigint NOT NULL DEFAULT '0',
  `answer` bigint NOT NULL DEFAULT '0',
  `tolerance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnume_ans_ix` (`answer`),
  KEY `mdl_quesnume_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Options for numerical questions.';


-- moodle.mdl_question_numerical_options definição

CREATE TABLE `mdl_question_numerical_options` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question` bigint NOT NULL DEFAULT '0',
  `showunits` smallint NOT NULL DEFAULT '0',
  `unitsleft` smallint NOT NULL DEFAULT '0',
  `unitgradingtype` smallint NOT NULL DEFAULT '0',
  `unitpenalty` decimal(12,7) NOT NULL DEFAULT '0.1000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnumeopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Options for questions of type numerical This table is also u';


-- moodle.mdl_question_numerical_units definição

CREATE TABLE `mdl_question_numerical_units` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question` bigint NOT NULL DEFAULT '0',
  `multiplier` decimal(38,19) NOT NULL DEFAULT '1.0000000000000000000',
  `unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesnumeunit_queuni_uix` (`question`,`unit`),
  KEY `mdl_quesnumeunit_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Optional unit options for numerical questions. This table is';


-- moodle.mdl_question_references definição

CREATE TABLE `mdl_question_references` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usingcontextid` bigint NOT NULL DEFAULT '0',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `questionarea` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemid` bigint DEFAULT NULL,
  `questionbankentryid` bigint NOT NULL DEFAULT '0',
  `version` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesrefe_usicomqueite_uix` (`usingcontextid`,`component`,`questionarea`,`itemid`),
  KEY `mdl_quesrefe_usi_ix` (`usingcontextid`),
  KEY `mdl_quesrefe_que_ix` (`questionbankentryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Records where a specific question is used.';


-- moodle.mdl_question_response_analysis definição

CREATE TABLE `mdl_question_response_analysis` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `whichtries` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint NOT NULL,
  `questionid` bigint NOT NULL,
  `variant` bigint DEFAULT NULL,
  `subqid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `aid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `credit` decimal(15,5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quesrespanal_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Analysis of student responses given to questions.';


-- moodle.mdl_question_response_count definição

CREATE TABLE `mdl_question_response_count` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `analysisid` bigint NOT NULL,
  `try` bigint NOT NULL,
  `rcount` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quesrespcoun_ana_ix` (`analysisid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Count for each responses for each try at a question.';


-- moodle.mdl_question_set_references definição

CREATE TABLE `mdl_question_set_references` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usingcontextid` bigint NOT NULL DEFAULT '0',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `questionarea` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemid` bigint DEFAULT NULL,
  `questionscontextid` bigint NOT NULL DEFAULT '0',
  `filtercondition` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quessetrefe_usicomquei_uix` (`usingcontextid`,`component`,`questionarea`,`itemid`),
  KEY `mdl_quessetrefe_usi_ix` (`usingcontextid`),
  KEY `mdl_quessetrefe_que_ix` (`questionscontextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Records where groups of questions are used.';


-- moodle.mdl_question_statistics definição

CREATE TABLE `mdl_question_statistics` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint NOT NULL,
  `questionid` bigint NOT NULL,
  `slot` bigint DEFAULT NULL,
  `subquestion` smallint NOT NULL,
  `variant` bigint DEFAULT NULL,
  `s` bigint NOT NULL DEFAULT '0',
  `effectiveweight` decimal(15,5) DEFAULT NULL,
  `negcovar` tinyint NOT NULL DEFAULT '0',
  `discriminationindex` decimal(15,5) DEFAULT NULL,
  `discriminativeefficiency` decimal(15,5) DEFAULT NULL,
  `sd` decimal(15,10) DEFAULT NULL,
  `facility` decimal(15,10) DEFAULT NULL,
  `subquestions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `maxmark` decimal(12,7) DEFAULT NULL,
  `positions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `randomguessscore` decimal(12,7) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quesstat_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Statistics for individual questions used in an activity.';


-- moodle.mdl_question_truefalse definição

CREATE TABLE `mdl_question_truefalse` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question` bigint NOT NULL DEFAULT '0',
  `trueanswer` bigint NOT NULL DEFAULT '0',
  `falseanswer` bigint NOT NULL DEFAULT '0',
  `showstandardinstruction` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_questrue_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Options for True-False questions';


-- moodle.mdl_question_usages definição

CREATE TABLE `mdl_question_usages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contextid` bigint NOT NULL,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `preferredbehaviour` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesusag_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='This table''s main purpose it to assign a unique id to each a';


-- moodle.mdl_question_versions definição

CREATE TABLE `mdl_question_versions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questionbankentryid` bigint NOT NULL DEFAULT '0',
  `version` bigint NOT NULL DEFAULT '1',
  `questionid` bigint NOT NULL DEFAULT '0',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ready',
  PRIMARY KEY (`id`),
  KEY `mdl_quesvers_que_ix` (`questionbankentryid`),
  KEY `mdl_quesvers_que2_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='A join table linking the different question version definiti';


-- moodle.mdl_quiz definição

CREATE TABLE `mdl_quiz` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL DEFAULT '0',
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `introformat` smallint NOT NULL DEFAULT '0',
  `timeopen` bigint NOT NULL DEFAULT '0',
  `timeclose` bigint NOT NULL DEFAULT '0',
  `timelimit` bigint NOT NULL DEFAULT '0',
  `overduehandling` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'autoabandon',
  `graceperiod` bigint NOT NULL DEFAULT '0',
  `preferredbehaviour` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `canredoquestions` smallint NOT NULL DEFAULT '0',
  `attempts` mediumint NOT NULL DEFAULT '0',
  `attemptonlast` smallint NOT NULL DEFAULT '0',
  `grademethod` smallint NOT NULL DEFAULT '1',
  `decimalpoints` smallint NOT NULL DEFAULT '2',
  `questiondecimalpoints` smallint NOT NULL DEFAULT '-1',
  `reviewattempt` mediumint NOT NULL DEFAULT '0',
  `reviewcorrectness` mediumint NOT NULL DEFAULT '0',
  `reviewmaxmarks` mediumint NOT NULL DEFAULT '0',
  `reviewmarks` mediumint NOT NULL DEFAULT '0',
  `reviewspecificfeedback` mediumint NOT NULL DEFAULT '0',
  `reviewgeneralfeedback` mediumint NOT NULL DEFAULT '0',
  `reviewrightanswer` mediumint NOT NULL DEFAULT '0',
  `reviewoverallfeedback` mediumint NOT NULL DEFAULT '0',
  `questionsperpage` bigint NOT NULL DEFAULT '0',
  `navmethod` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'free',
  `shuffleanswers` smallint NOT NULL DEFAULT '0',
  `sumgrades` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `subnet` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `browsersecurity` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `delay1` bigint NOT NULL DEFAULT '0',
  `delay2` bigint NOT NULL DEFAULT '0',
  `showuserpicture` smallint NOT NULL DEFAULT '0',
  `showblocks` smallint NOT NULL DEFAULT '0',
  `completionattemptsexhausted` tinyint(1) DEFAULT '0',
  `completionminattempts` bigint NOT NULL DEFAULT '0',
  `allowofflineattempts` tinyint(1) DEFAULT '0',
  `precreateattempts` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quiz_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='The settings for each quiz.';


-- moodle.mdl_quiz_attempts definição

CREATE TABLE `mdl_quiz_attempts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quiz` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `attempt` mediumint NOT NULL DEFAULT '0',
  `uniqueid` bigint NOT NULL DEFAULT '0',
  `layout` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currentpage` bigint NOT NULL DEFAULT '0',
  `preview` smallint NOT NULL DEFAULT '0',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inprogress',
  `timestart` bigint NOT NULL DEFAULT '0',
  `timefinish` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `timemodifiedoffline` bigint NOT NULL DEFAULT '0',
  `timecheckstate` bigint DEFAULT '0',
  `sumgrades` decimal(10,5) DEFAULT NULL,
  `gradednotificationsenttime` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizatte_quiuseatt_uix` (`quiz`,`userid`,`attempt`),
  UNIQUE KEY `mdl_quizatte_uni_uix` (`uniqueid`),
  KEY `mdl_quizatte_statim_ix` (`state`,`timecheckstate`),
  KEY `mdl_quizatte_qui_ix` (`quiz`),
  KEY `mdl_quizatte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores users attempts at quizzes.';


-- moodle.mdl_quiz_feedback definição

CREATE TABLE `mdl_quiz_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quizid` bigint NOT NULL DEFAULT '0',
  `feedbacktext` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `feedbacktextformat` tinyint NOT NULL DEFAULT '0',
  `mingrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `maxgrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizfeed_qui_ix` (`quizid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Feedback given to students based on which grade band their o';


-- moodle.mdl_quiz_grade_items definição

CREATE TABLE `mdl_quiz_grade_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quizid` bigint NOT NULL,
  `sortorder` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizgraditem_quisor_uix` (`quizid`,`sortorder`),
  KEY `mdl_quizgraditem_qui_ix` (`quizid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Where a quiz supports mulitple grades, this table stores wha';


-- moodle.mdl_quiz_grades definição

CREATE TABLE `mdl_quiz_grades` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quiz` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quizgrad_use_ix` (`userid`),
  KEY `mdl_quizgrad_qui_ix` (`quiz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores the overall grade for each user on the quiz, based on';


-- moodle.mdl_quiz_overrides definição

CREATE TABLE `mdl_quiz_overrides` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quiz` bigint NOT NULL DEFAULT '0',
  `groupid` bigint DEFAULT NULL,
  `userid` bigint DEFAULT NULL,
  `timeopen` bigint DEFAULT NULL,
  `timeclose` bigint DEFAULT NULL,
  `timelimit` bigint DEFAULT NULL,
  `attempts` mediumint DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quizover_qui_ix` (`quiz`),
  KEY `mdl_quizover_gro_ix` (`groupid`),
  KEY `mdl_quizover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='The overrides to quiz settings on a per-user and per-group b';


-- moodle.mdl_quiz_overview_regrades definição

CREATE TABLE `mdl_quiz_overview_regrades` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint NOT NULL,
  `slot` bigint NOT NULL,
  `newfraction` decimal(12,7) DEFAULT NULL,
  `oldfraction` decimal(12,7) DEFAULT NULL,
  `regraded` smallint NOT NULL,
  `timemodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quizoverregr_queslo_ix` (`questionusageid`,`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='This table records which question attempts need regrading an';


-- moodle.mdl_quiz_reports definição

CREATE TABLE `mdl_quiz_reports` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `displayorder` bigint NOT NULL,
  `capability` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizrepo_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Lists all the installed quiz reports and their display order';


-- moodle.mdl_quiz_sections definição

CREATE TABLE `mdl_quiz_sections` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quizid` bigint NOT NULL,
  `firstslot` bigint NOT NULL,
  `heading` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shufflequestions` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizsect_quifir_uix` (`quizid`,`firstslot`),
  KEY `mdl_quizsect_qui_ix` (`quizid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores sections of a quiz with section name (heading), from ';


-- moodle.mdl_quiz_slots definição

CREATE TABLE `mdl_quiz_slots` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `slot` bigint NOT NULL,
  `quizid` bigint NOT NULL DEFAULT '0',
  `page` bigint NOT NULL,
  `displaynumber` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requireprevious` smallint NOT NULL DEFAULT '0',
  `maxmark` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `quizgradeitemid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizslot_quislo_uix` (`quizid`,`slot`),
  KEY `mdl_quizslot_qui_ix` (`quizid`),
  KEY `mdl_quizslot_qui2_ix` (`quizgradeitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores the question used in a quiz, with the order, and for ';


-- moodle.mdl_quiz_statistics definição

CREATE TABLE `mdl_quiz_statistics` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `whichattempts` smallint NOT NULL,
  `timemodified` bigint NOT NULL,
  `firstattemptscount` bigint NOT NULL,
  `highestattemptscount` bigint NOT NULL,
  `lastattemptscount` bigint NOT NULL,
  `allattemptscount` bigint NOT NULL,
  `firstattemptsavg` decimal(15,5) DEFAULT NULL,
  `highestattemptsavg` decimal(15,5) DEFAULT NULL,
  `lastattemptsavg` decimal(15,5) DEFAULT NULL,
  `allattemptsavg` decimal(15,5) DEFAULT NULL,
  `median` decimal(15,5) DEFAULT NULL,
  `standarddeviation` decimal(15,5) DEFAULT NULL,
  `skewness` decimal(15,10) DEFAULT NULL,
  `kurtosis` decimal(15,5) DEFAULT NULL,
  `cic` decimal(15,10) DEFAULT NULL,
  `errorratio` decimal(15,10) DEFAULT NULL,
  `standarderror` decimal(15,10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='table to cache results from analysis done in statistics repo';


-- moodle.mdl_quizaccess_seb_quizsettings definição

CREATE TABLE `mdl_quizaccess_seb_quizsettings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quizid` bigint NOT NULL,
  `cmid` bigint NOT NULL,
  `templateid` bigint NOT NULL,
  `requiresafeexambrowser` tinyint(1) NOT NULL,
  `showsebtaskbar` tinyint(1) DEFAULT NULL,
  `showwificontrol` tinyint(1) DEFAULT NULL,
  `showreloadbutton` tinyint(1) DEFAULT NULL,
  `showtime` tinyint(1) DEFAULT NULL,
  `showkeyboardlayout` tinyint(1) DEFAULT NULL,
  `allowuserquitseb` tinyint(1) DEFAULT NULL,
  `quitpassword` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `linkquitseb` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `userconfirmquit` tinyint(1) DEFAULT NULL,
  `enableaudiocontrol` tinyint(1) DEFAULT NULL,
  `muteonstartup` tinyint(1) DEFAULT NULL,
  `allowcapturecamera` tinyint(1) DEFAULT NULL,
  `allowcapturemicrophone` tinyint(1) DEFAULT NULL,
  `allowspellchecking` tinyint(1) DEFAULT NULL,
  `allowreloadinexam` tinyint(1) DEFAULT NULL,
  `activateurlfiltering` tinyint(1) DEFAULT NULL,
  `filterembeddedcontent` tinyint(1) DEFAULT NULL,
  `expressionsallowed` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `regexallowed` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `expressionsblocked` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `regexblocked` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `allowedbrowserexamkeys` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `showsebdownloadlink` tinyint(1) DEFAULT NULL,
  `usermodified` bigint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizsebquiz_qui_uix` (`quizid`),
  UNIQUE KEY `mdl_quizsebquiz_cmi_uix` (`cmid`),
  KEY `mdl_quizsebquiz_tem_ix` (`templateid`),
  KEY `mdl_quizsebquiz_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores the quiz level Safe Exam Browser configuration.';


-- moodle.mdl_quizaccess_seb_template definição

CREATE TABLE `mdl_quizaccess_seb_template` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `sortorder` bigint NOT NULL,
  `usermodified` bigint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quizsebtemp_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Templates for Safe Exam Browser configuration.';


-- moodle.mdl_rating definição

CREATE TABLE `mdl_rating` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contextid` bigint NOT NULL,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ratingarea` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint NOT NULL,
  `scaleid` bigint NOT NULL,
  `rating` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_rati_comratconite_ix` (`component`,`ratingarea`,`contextid`,`itemid`),
  KEY `mdl_rati_con_ix` (`contextid`),
  KEY `mdl_rati_use_ix` (`userid`),
  KEY `mdl_rati_sca_ix` (`scaleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='moodle ratings';


-- moodle.mdl_registration_hubs definição

CREATE TABLE `mdl_registration_hubs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hubname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `huburl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='hub where the site is registered on with their associated to';


-- moodle.mdl_reportbuilder_audience definição

CREATE TABLE `mdl_reportbuilder_audience` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reportid` bigint NOT NULL,
  `heading` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `classname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `configdata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `usercreated` bigint NOT NULL DEFAULT '0',
  `usermodified` bigint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_repoaudi_rep_ix` (`reportid`),
  KEY `mdl_repoaudi_use_ix` (`usercreated`),
  KEY `mdl_repoaudi_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Defines report audience';


-- moodle.mdl_reportbuilder_column definição

CREATE TABLE `mdl_reportbuilder_column` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reportid` bigint NOT NULL DEFAULT '0',
  `uniqueidentifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `aggregation` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `heading` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `columnorder` bigint NOT NULL,
  `sortenabled` tinyint(1) NOT NULL DEFAULT '0',
  `sortdirection` tinyint(1) NOT NULL,
  `sortorder` bigint DEFAULT NULL,
  `usercreated` bigint NOT NULL DEFAULT '0',
  `usermodified` bigint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_repocolu_rep_ix` (`reportid`),
  KEY `mdl_repocolu_use_ix` (`usercreated`),
  KEY `mdl_repocolu_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Table to represent a report column';


-- moodle.mdl_reportbuilder_filter definição

CREATE TABLE `mdl_reportbuilder_filter` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reportid` bigint NOT NULL DEFAULT '0',
  `uniqueidentifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `heading` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iscondition` tinyint(1) NOT NULL DEFAULT '0',
  `filterorder` bigint NOT NULL,
  `usercreated` bigint NOT NULL DEFAULT '0',
  `usermodified` bigint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_repofilt_repuniisc_uix` (`reportid`,`uniqueidentifier`,`iscondition`),
  KEY `mdl_repofilt_rep_ix` (`reportid`),
  KEY `mdl_repofilt_use_ix` (`usercreated`),
  KEY `mdl_repofilt_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Table to represent a report filter/condition';


-- moodle.mdl_reportbuilder_report definição

CREATE TABLE `mdl_reportbuilder_report` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` tinyint NOT NULL DEFAULT '0',
  `uniquerows` tinyint(1) NOT NULL DEFAULT '0',
  `conditiondata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `settingsdata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contextid` bigint NOT NULL,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `area` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint NOT NULL DEFAULT '0',
  `usercreated` bigint NOT NULL DEFAULT '0',
  `usermodified` bigint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_reporepo_use_ix` (`usercreated`),
  KEY `mdl_reporepo_use2_ix` (`usermodified`),
  KEY `mdl_reporepo_con_ix` (`contextid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Table to represent a report';


-- moodle.mdl_reportbuilder_schedule definição

CREATE TABLE `mdl_reportbuilder_schedule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reportid` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `audiences` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `classname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `configdata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `userviewas` bigint NOT NULL DEFAULT '0',
  `timescheduled` bigint NOT NULL DEFAULT '0',
  `recurrence` bigint NOT NULL DEFAULT '0',
  `timelastsent` bigint NOT NULL DEFAULT '0',
  `timenextsend` bigint NOT NULL DEFAULT '0',
  `usercreated` bigint NOT NULL DEFAULT '0',
  `usermodified` bigint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_reposche_rep_ix` (`reportid`),
  KEY `mdl_reposche_use_ix` (`userviewas`),
  KEY `mdl_reposche_use2_ix` (`usercreated`),
  KEY `mdl_reposche_use3_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Table to represent a report schedule';


-- moodle.mdl_reportbuilder_user_filter definição

CREATE TABLE `mdl_reportbuilder_user_filter` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reportid` bigint NOT NULL DEFAULT '0',
  `filterdata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `usercreated` bigint NOT NULL DEFAULT '0',
  `usermodified` bigint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_repouserfilt_repuse_uix` (`reportid`,`usercreated`),
  KEY `mdl_repouserfilt_rep_ix` (`reportid`),
  KEY `mdl_repouserfilt_use_ix` (`usercreated`),
  KEY `mdl_repouserfilt_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Defines user report filter';


-- moodle.mdl_repository definição

CREATE TABLE `mdl_repository` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) DEFAULT '1',
  `sortorder` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='This table contains one entry for every configured external ';


-- moodle.mdl_repository_instance_config definição

CREATE TABLE `mdl_repository_instance_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `instanceid` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='The config for intances';


-- moodle.mdl_repository_instances definição

CREATE TABLE `mdl_repository_instances` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `typeid` bigint NOT NULL,
  `userid` bigint NOT NULL DEFAULT '0',
  `contextid` bigint NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timecreated` bigint DEFAULT NULL,
  `timemodified` bigint DEFAULT NULL,
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_repoinst_use_ix` (`userid`),
  KEY `mdl_repoinst_con_ix` (`contextid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='This table contains one entry for every configured external ';


-- moodle.mdl_repository_onedrive_access definição

CREATE TABLE `mdl_repository_onedrive_access` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `timemodified` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `usermodified` bigint NOT NULL,
  `permissionid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `itemid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_repoonedacce_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='List of temporary access grants.';


-- moodle.mdl_resource definição

CREATE TABLE `mdl_resource` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL DEFAULT '0',
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `introformat` smallint NOT NULL DEFAULT '0',
  `tobemigrated` smallint NOT NULL DEFAULT '0',
  `legacyfiles` smallint NOT NULL DEFAULT '0',
  `legacyfileslast` bigint DEFAULT NULL,
  `display` smallint NOT NULL DEFAULT '0',
  `displayoptions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `filterfiles` smallint NOT NULL DEFAULT '0',
  `revision` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_reso_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Each record is one resource and its config data';


-- moodle.mdl_resource_old definição

CREATE TABLE `mdl_resource_old` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `reference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `introformat` smallint NOT NULL DEFAULT '0',
  `alltext` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `popup` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `oldid` bigint NOT NULL,
  `cmid` bigint DEFAULT NULL,
  `newmodule` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `newid` bigint DEFAULT NULL,
  `migrated` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_resoold_old_uix` (`oldid`),
  KEY `mdl_resoold_cmi_ix` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='backup of all old resource instances from 1.9';


-- moodle.mdl_role definição

CREATE TABLE `mdl_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sortorder` bigint NOT NULL DEFAULT '0',
  `archetype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_role_sor_uix` (`sortorder`),
  UNIQUE KEY `mdl_role_sho_uix` (`shortname`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='moodle roles';


-- moodle.mdl_role_allow_assign definição

CREATE TABLE `mdl_role_allow_assign` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `roleid` bigint NOT NULL DEFAULT '0',
  `allowassign` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloassi_rolall_uix` (`roleid`,`allowassign`),
  KEY `mdl_rolealloassi_rol_ix` (`roleid`),
  KEY `mdl_rolealloassi_all_ix` (`allowassign`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='this defines what role can assign what role';


-- moodle.mdl_role_allow_override definição

CREATE TABLE `mdl_role_allow_override` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `roleid` bigint NOT NULL DEFAULT '0',
  `allowoverride` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloover_rolall_uix` (`roleid`,`allowoverride`),
  KEY `mdl_rolealloover_rol_ix` (`roleid`),
  KEY `mdl_rolealloover_all_ix` (`allowoverride`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='this defines what role can override what role';


-- moodle.mdl_role_allow_switch definição

CREATE TABLE `mdl_role_allow_switch` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `roleid` bigint NOT NULL,
  `allowswitch` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloswit_rolall_uix` (`roleid`,`allowswitch`),
  KEY `mdl_rolealloswit_rol_ix` (`roleid`),
  KEY `mdl_rolealloswit_all_ix` (`allowswitch`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='This table stores which which other roles a user is allowed ';


-- moodle.mdl_role_allow_view definição

CREATE TABLE `mdl_role_allow_view` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `roleid` bigint NOT NULL,
  `allowview` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloview_rolall_uix` (`roleid`,`allowview`),
  KEY `mdl_rolealloview_rol_ix` (`roleid`),
  KEY `mdl_rolealloview_all_ix` (`allowview`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='This table stores which which other roles a user is allowed ';


-- moodle.mdl_role_assignments definição

CREATE TABLE `mdl_role_assignments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `roleid` bigint NOT NULL DEFAULT '0',
  `contextid` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `modifierid` bigint NOT NULL DEFAULT '0',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint NOT NULL DEFAULT '0',
  `sortorder` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_roleassi_sor_ix` (`sortorder`),
  KEY `mdl_roleassi_rolcon_ix` (`roleid`,`contextid`),
  KEY `mdl_roleassi_useconrol_ix` (`userid`,`contextid`,`roleid`),
  KEY `mdl_roleassi_comiteuse_ix` (`component`,`itemid`,`userid`),
  KEY `mdl_roleassi_rol_ix` (`roleid`),
  KEY `mdl_roleassi_con_ix` (`contextid`),
  KEY `mdl_roleassi_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='assigning roles in different context';


-- moodle.mdl_role_capabilities definição

CREATE TABLE `mdl_role_capabilities` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contextid` bigint NOT NULL DEFAULT '0',
  `roleid` bigint NOT NULL DEFAULT '0',
  `capability` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `permission` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `modifierid` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecapa_rolconcap_uix` (`roleid`,`contextid`,`capability`),
  KEY `mdl_rolecapa_rol_ix` (`roleid`),
  KEY `mdl_rolecapa_con_ix` (`contextid`),
  KEY `mdl_rolecapa_mod_ix` (`modifierid`),
  KEY `mdl_rolecapa_cap_ix` (`capability`)
) ENGINE=InnoDB AUTO_INCREMENT=1528 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='permission has to be signed, overriding a capability for a p';


-- moodle.mdl_role_context_levels definição

CREATE TABLE `mdl_role_context_levels` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `roleid` bigint NOT NULL,
  `contextlevel` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecontleve_conrol_uix` (`contextlevel`,`roleid`),
  KEY `mdl_rolecontleve_rol_ix` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Lists which roles can be assigned at which context levels. T';


-- moodle.mdl_role_names definição

CREATE TABLE `mdl_role_names` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `roleid` bigint NOT NULL DEFAULT '0',
  `contextid` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolename_rolcon_uix` (`roleid`,`contextid`),
  KEY `mdl_rolename_rol_ix` (`roleid`),
  KEY `mdl_rolename_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='role names in native strings';


-- moodle.mdl_scale definição

CREATE TABLE `mdl_scale` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `courseid` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `scale` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descriptionformat` tinyint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scal_cou_ix` (`courseid`),
  KEY `mdl_scal_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Defines grading scales';


-- moodle.mdl_scale_history definição

CREATE TABLE `mdl_scale_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `action` bigint NOT NULL DEFAULT '0',
  `oldid` bigint NOT NULL,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timemodified` bigint DEFAULT NULL,
  `loggeduser` bigint DEFAULT NULL,
  `courseid` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `scale` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scalhist_act_ix` (`action`),
  KEY `mdl_scalhist_tim_ix` (`timemodified`),
  KEY `mdl_scalhist_old_ix` (`oldid`),
  KEY `mdl_scalhist_cou_ix` (`courseid`),
  KEY `mdl_scalhist_log_ix` (`loggeduser`),
  KEY `mdl_scalhist_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='History table';


-- moodle.mdl_scorm definição

CREATE TABLE `mdl_scorm` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL DEFAULT '0',
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `scormtype` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `reference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `introformat` smallint NOT NULL DEFAULT '0',
  `version` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `maxgrade` double NOT NULL DEFAULT '0',
  `grademethod` tinyint NOT NULL DEFAULT '0',
  `whatgrade` bigint NOT NULL DEFAULT '0',
  `maxattempt` bigint NOT NULL DEFAULT '1',
  `forcecompleted` tinyint(1) NOT NULL DEFAULT '0',
  `forcenewattempt` tinyint(1) NOT NULL DEFAULT '0',
  `lastattemptlock` tinyint(1) NOT NULL DEFAULT '0',
  `masteryoverride` tinyint(1) NOT NULL DEFAULT '1',
  `displayattemptstatus` tinyint(1) NOT NULL DEFAULT '1',
  `displaycoursestructure` tinyint(1) NOT NULL DEFAULT '0',
  `updatefreq` tinyint(1) NOT NULL DEFAULT '0',
  `sha1hash` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `md5hash` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `revision` bigint NOT NULL DEFAULT '0',
  `launch` bigint NOT NULL DEFAULT '0',
  `skipview` tinyint(1) NOT NULL DEFAULT '1',
  `hidebrowse` tinyint(1) NOT NULL DEFAULT '0',
  `hidetoc` tinyint(1) NOT NULL DEFAULT '0',
  `nav` tinyint(1) NOT NULL DEFAULT '1',
  `navpositionleft` bigint DEFAULT '-100',
  `navpositiontop` bigint DEFAULT '-100',
  `auto` tinyint(1) NOT NULL DEFAULT '0',
  `popup` tinyint(1) NOT NULL DEFAULT '0',
  `options` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `width` bigint NOT NULL DEFAULT '100',
  `height` bigint NOT NULL DEFAULT '600',
  `timeopen` bigint NOT NULL DEFAULT '0',
  `timeclose` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `completionstatusrequired` tinyint(1) DEFAULT NULL,
  `completionscorerequired` bigint DEFAULT NULL,
  `completionstatusallscos` tinyint(1) DEFAULT NULL,
  `autocommit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scor_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='each table is one SCORM module and its configuration';


-- moodle.mdl_scorm_aicc_session definição

CREATE TABLE `mdl_scorm_aicc_session` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL DEFAULT '0',
  `scormid` bigint NOT NULL DEFAULT '0',
  `hacpsession` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `scoid` bigint DEFAULT '0',
  `scormmode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scormstatus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempt` bigint DEFAULT NULL,
  `lessonstatus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sessiontime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scoraiccsess_sco_ix` (`scormid`),
  KEY `mdl_scoraiccsess_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Used by AICC HACP to store session information';


-- moodle.mdl_scorm_attempt definição

CREATE TABLE `mdl_scorm_attempt` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL,
  `scormid` bigint NOT NULL,
  `attempt` bigint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_scoratte_use_ix` (`userid`),
  KEY `mdl_scoratte_sco_ix` (`scormid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='List of SCORM attempts made by user.';


-- moodle.mdl_scorm_element definição

CREATE TABLE `mdl_scorm_element` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `element` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorelem_ele_uix` (`element`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='List of scorm elements.';


-- moodle.mdl_scorm_scoes definição

CREATE TABLE `mdl_scorm_scoes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `scorm` bigint NOT NULL DEFAULT '0',
  `manifest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `organization` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `parent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `launch` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `scormtype` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoe_sco_ix` (`scorm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='each SCO part of the SCORM module';


-- moodle.mdl_scorm_scoes_data definição

CREATE TABLE `mdl_scorm_scoes_data` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `scoid` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoedata_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Contains variable data get from packages';


-- moodle.mdl_scorm_scoes_value definição

CREATE TABLE `mdl_scorm_scoes_value` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `scoid` bigint NOT NULL,
  `attemptid` bigint NOT NULL,
  `elementid` bigint NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoevalu_sco_ix` (`scoid`),
  KEY `mdl_scorscoevalu_att_ix` (`attemptid`),
  KEY `mdl_scorscoevalu_ele_ix` (`elementid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Values passed from SCORM package';


-- moodle.mdl_scorm_seq_mapinfo definição

CREATE TABLE `mdl_scorm_seq_mapinfo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `scoid` bigint NOT NULL DEFAULT '0',
  `objectiveid` bigint NOT NULL DEFAULT '0',
  `targetobjectiveid` bigint NOT NULL DEFAULT '0',
  `readsatisfiedstatus` tinyint(1) NOT NULL DEFAULT '1',
  `readnormalizedmeasure` tinyint(1) NOT NULL DEFAULT '1',
  `writesatisfiedstatus` tinyint(1) NOT NULL DEFAULT '0',
  `writenormalizedmeasure` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqmapi_scoidobj_uix` (`scoid`,`id`,`objectiveid`),
  KEY `mdl_scorseqmapi_sco_ix` (`scoid`),
  KEY `mdl_scorseqmapi_obj_ix` (`objectiveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='SCORM2004 objective mapinfo description';


-- moodle.mdl_scorm_seq_objective definição

CREATE TABLE `mdl_scorm_seq_objective` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `scoid` bigint NOT NULL DEFAULT '0',
  `primaryobj` tinyint(1) NOT NULL DEFAULT '0',
  `objectiveid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `satisfiedbymeasure` tinyint(1) NOT NULL DEFAULT '1',
  `minnormalizedmeasure` float(11,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqobje_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqobje_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='SCORM2004 objective description';


-- moodle.mdl_scorm_seq_rolluprule definição

CREATE TABLE `mdl_scorm_seq_rolluprule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `scoid` bigint NOT NULL DEFAULT '0',
  `childactivityset` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `minimumcount` bigint NOT NULL DEFAULT '0',
  `minimumpercent` float(11,4) NOT NULL DEFAULT '0.0000',
  `conditioncombination` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `action` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqroll_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='SCORM2004 sequencing rule';


-- moodle.mdl_scorm_seq_rolluprulecond definição

CREATE TABLE `mdl_scorm_seq_rolluprulecond` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `scoid` bigint NOT NULL DEFAULT '0',
  `rollupruleid` bigint NOT NULL DEFAULT '0',
  `operator` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'noOp',
  `cond` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scorolid_uix` (`scoid`,`rollupruleid`,`id`),
  KEY `mdl_scorseqroll_sco2_ix` (`scoid`),
  KEY `mdl_scorseqroll_rol_ix` (`rollupruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='SCORM2004 sequencing rule';


-- moodle.mdl_scorm_seq_rulecond definição

CREATE TABLE `mdl_scorm_seq_rulecond` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `scoid` bigint NOT NULL DEFAULT '0',
  `ruleconditionsid` bigint NOT NULL DEFAULT '0',
  `refrencedobjective` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `measurethreshold` float(11,4) NOT NULL DEFAULT '0.0000',
  `operator` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'noOp',
  `cond` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'always',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_idscorul_uix` (`id`,`scoid`,`ruleconditionsid`),
  KEY `mdl_scorseqrule_sco2_ix` (`scoid`),
  KEY `mdl_scorseqrule_rul_ix` (`ruleconditionsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='SCORM2004 rule condition';


-- moodle.mdl_scorm_seq_ruleconds definição

CREATE TABLE `mdl_scorm_seq_ruleconds` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `scoid` bigint NOT NULL DEFAULT '0',
  `conditioncombination` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `ruletype` tinyint NOT NULL DEFAULT '0',
  `action` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqrule_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='SCORM2004 rule conditions';


-- moodle.mdl_search_index_requests definição

CREATE TABLE `mdl_search_index_requests` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contextid` bigint NOT NULL,
  `searcharea` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timerequested` bigint NOT NULL,
  `partialarea` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `partialtime` bigint NOT NULL,
  `indexpriority` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_searinderequ_indtim_ix` (`indexpriority`,`timerequested`),
  KEY `mdl_searinderequ_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Records requests for (re)indexing of specific contexts. Entr';


-- moodle.mdl_search_simpledb_index definição

CREATE TABLE `mdl_search_simpledb_index` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `docid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contextid` bigint NOT NULL,
  `areaid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL,
  `courseid` bigint NOT NULL,
  `owneruserid` bigint DEFAULT NULL,
  `modified` bigint NOT NULL,
  `userid` bigint DEFAULT NULL,
  `description1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description2` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_searsimpinde_doc_uix` (`docid`),
  KEY `mdl_searsimpinde_owncon_ix` (`owneruserid`,`contextid`),
  KEY `mdl_searsimpinde_con_ix` (`contextid`),
  KEY `mdl_searsimpinde_cou_ix` (`courseid`),
  KEY `mdl_searsimpinde_are_ix` (`areaid`),
  FULLTEXT KEY `mdl_search_simpledb_index_index` (`title`,`content`,`description1`,`description2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='search_simpledb table containing the index data.';


-- moodle.mdl_sessions definição

CREATE TABLE `mdl_sessions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `state` bigint NOT NULL DEFAULT '0',
  `sid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint NOT NULL,
  `sessdata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `firstip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_sess_sid_uix` (`sid`),
  KEY `mdl_sess_sta_ix` (`state`),
  KEY `mdl_sess_tim_ix` (`timecreated`),
  KEY `mdl_sess_tim2_ix` (`timemodified`),
  KEY `mdl_sess_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Database based session storage - now recommended';


-- moodle.mdl_shortlink definição

CREATE TABLE `mdl_shortlink` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shortcode` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint NOT NULL,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `linktype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `identifier` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_shor_usesho_uix` (`userid`,`shortcode`),
  KEY `mdl_shor_sho_ix` (`shortcode`),
  KEY `mdl_shor_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Short codes for user short links';


-- moodle.mdl_sms_gateways definição

CREATE TABLE `mdl_sms_gateways` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `gateway` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint NOT NULL DEFAULT '1',
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Instances of SMS gateways';


-- moodle.mdl_sms_messages definição

CREATE TABLE `mdl_sms_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `recipientnumber` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `messagetype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `recipientuserid` bigint DEFAULT NULL,
  `issensitive` tinyint NOT NULL DEFAULT '0',
  `gatewayid` bigint DEFAULT NULL,
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timecreated` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_smsmess_gat_ix` (`gatewayid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='SMS Messages sent via the SMS subsystem';


-- moodle.mdl_stats_daily definição

CREATE TABLE `mdl_stats_daily` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `courseid` bigint NOT NULL DEFAULT '0',
  `timeend` bigint NOT NULL DEFAULT '0',
  `roleid` bigint NOT NULL DEFAULT '0',
  `stattype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint NOT NULL DEFAULT '0',
  `stat2` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statdail_cou_ix` (`courseid`),
  KEY `mdl_statdail_tim_ix` (`timeend`),
  KEY `mdl_statdail_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='to accumulate daily stats';


-- moodle.mdl_stats_monthly definição

CREATE TABLE `mdl_stats_monthly` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `courseid` bigint NOT NULL DEFAULT '0',
  `timeend` bigint NOT NULL DEFAULT '0',
  `roleid` bigint NOT NULL DEFAULT '0',
  `stattype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint NOT NULL DEFAULT '0',
  `stat2` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statmont_cou_ix` (`courseid`),
  KEY `mdl_statmont_tim_ix` (`timeend`),
  KEY `mdl_statmont_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='To accumulate monthly stats';


-- moodle.mdl_stats_user_daily definição

CREATE TABLE `mdl_stats_user_daily` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `courseid` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `roleid` bigint NOT NULL DEFAULT '0',
  `timeend` bigint NOT NULL DEFAULT '0',
  `statsreads` bigint NOT NULL DEFAULT '0',
  `statswrites` bigint NOT NULL DEFAULT '0',
  `stattype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserdail_cou_ix` (`courseid`),
  KEY `mdl_statuserdail_use_ix` (`userid`),
  KEY `mdl_statuserdail_rol_ix` (`roleid`),
  KEY `mdl_statuserdail_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='To accumulate daily stats per course/user';


-- moodle.mdl_stats_user_monthly definição

CREATE TABLE `mdl_stats_user_monthly` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `courseid` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `roleid` bigint NOT NULL DEFAULT '0',
  `timeend` bigint NOT NULL DEFAULT '0',
  `statsreads` bigint NOT NULL DEFAULT '0',
  `statswrites` bigint NOT NULL DEFAULT '0',
  `stattype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statusermont_cou_ix` (`courseid`),
  KEY `mdl_statusermont_use_ix` (`userid`),
  KEY `mdl_statusermont_rol_ix` (`roleid`),
  KEY `mdl_statusermont_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='To accumulate monthly stats per course/user';


-- moodle.mdl_stats_user_weekly definição

CREATE TABLE `mdl_stats_user_weekly` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `courseid` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `roleid` bigint NOT NULL DEFAULT '0',
  `timeend` bigint NOT NULL DEFAULT '0',
  `statsreads` bigint NOT NULL DEFAULT '0',
  `statswrites` bigint NOT NULL DEFAULT '0',
  `stattype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserweek_cou_ix` (`courseid`),
  KEY `mdl_statuserweek_use_ix` (`userid`),
  KEY `mdl_statuserweek_rol_ix` (`roleid`),
  KEY `mdl_statuserweek_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='To accumulate weekly stats per course/user';


-- moodle.mdl_stats_weekly definição

CREATE TABLE `mdl_stats_weekly` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `courseid` bigint NOT NULL DEFAULT '0',
  `timeend` bigint NOT NULL DEFAULT '0',
  `roleid` bigint NOT NULL DEFAULT '0',
  `stattype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint NOT NULL DEFAULT '0',
  `stat2` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statweek_cou_ix` (`courseid`),
  KEY `mdl_statweek_tim_ix` (`timeend`),
  KEY `mdl_statweek_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='To accumulate weekly stats';


-- moodle.mdl_stored_progress definição

CREATE TABLE `mdl_stored_progress` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `idnumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timestart` bigint DEFAULT NULL,
  `lastupdate` bigint DEFAULT NULL,
  `percentcompleted` decimal(5,2) DEFAULT '0.00',
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `haserrored` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_storprog_idn_ix` (`idnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Records for any long running tasks we want to poll for progr';


-- moodle.mdl_subsection definição

CREATE TABLE `mdl_subsection` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL DEFAULT '0',
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_subs_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores the delegated subsection instances.';


-- moodle.mdl_tag definição

CREATE TABLE `mdl_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL,
  `tagcollid` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rawname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `isstandard` tinyint(1) NOT NULL DEFAULT '0',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionformat` tinyint NOT NULL DEFAULT '0',
  `flag` smallint DEFAULT '0',
  `timemodified` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tag_tagnam_uix` (`tagcollid`,`name`),
  KEY `mdl_tag_tagiss_ix` (`tagcollid`,`isstandard`),
  KEY `mdl_tag_use_ix` (`userid`),
  KEY `mdl_tag_tag_ix` (`tagcollid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Tag table - this generic table will replace the old "tags" t';


-- moodle.mdl_tag_area definição

CREATE TABLE `mdl_tag_area` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `itemtype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `tagcollid` bigint NOT NULL,
  `callback` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `callbackfile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `showstandard` tinyint(1) NOT NULL DEFAULT '0',
  `multiplecontexts` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tagarea_comite_uix` (`component`,`itemtype`),
  KEY `mdl_tagarea_tag_ix` (`tagcollid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Defines various tag areas, one area is identified by compone';


-- moodle.mdl_tag_coll definição

CREATE TABLE `mdl_tag_coll` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isdefault` tinyint NOT NULL DEFAULT '0',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sortorder` mediumint NOT NULL DEFAULT '0',
  `searchable` tinyint NOT NULL DEFAULT '1',
  `customurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Defines different set of tags';


-- moodle.mdl_tag_correlation definição

CREATE TABLE `mdl_tag_correlation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tagid` bigint NOT NULL,
  `correlatedtags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_tagcorr_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='The rationale for the ''tag_correlation'' table is performance';


-- moodle.mdl_tag_instance definição

CREATE TABLE `mdl_tag_instance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tagid` bigint NOT NULL,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `itemtype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint NOT NULL,
  `contextid` bigint DEFAULT NULL,
  `tiuserid` bigint NOT NULL DEFAULT '0',
  `ordering` bigint DEFAULT NULL,
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_taginst_comiteiteconti_uix` (`component`,`itemtype`,`itemid`,`contextid`,`tiuserid`,`tagid`),
  KEY `mdl_taginst_itecomtagcon_ix` (`itemtype`,`component`,`tagid`,`contextid`),
  KEY `mdl_taginst_tag_ix` (`tagid`),
  KEY `mdl_taginst_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='tag_instance table holds the information of associations bet';


-- moodle.mdl_task_adhoc definição

CREATE TABLE `mdl_task_adhoc` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nextruntime` bigint NOT NULL,
  `faildelay` bigint DEFAULT NULL,
  `customdata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `userid` bigint DEFAULT NULL,
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timestarted` bigint DEFAULT NULL,
  `hostname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pid` bigint DEFAULT NULL,
  `attemptsavailable` tinyint DEFAULT NULL,
  `firststartingtime` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_taskadho_nex_ix` (`nextruntime`),
  KEY `mdl_taskadho_tim_ix` (`timestarted`),
  KEY `mdl_taskadho_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='List of adhoc tasks waiting to run.';


-- moodle.mdl_task_log definição

CREATE TABLE `mdl_task_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` smallint NOT NULL,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint NOT NULL,
  `timestart` decimal(20,10) NOT NULL,
  `timeend` decimal(20,10) NOT NULL,
  `dbreads` bigint NOT NULL,
  `dbwrites` bigint NOT NULL,
  `result` tinyint NOT NULL,
  `output` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hostname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_tasklog_cla_ix` (`classname`),
  KEY `mdl_tasklog_tim_ix` (`timestart`),
  KEY `mdl_tasklog_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='The log table for all tasks';


-- moodle.mdl_task_scheduled definição

CREATE TABLE `mdl_task_scheduled` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lastruntime` bigint DEFAULT NULL,
  `nextruntime` bigint DEFAULT NULL,
  `minute` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hour` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `day` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `month` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dayofweek` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `faildelay` bigint DEFAULT NULL,
  `customised` tinyint NOT NULL DEFAULT '0',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `timestarted` bigint DEFAULT NULL,
  `hostname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tasksche_cla_uix` (`classname`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='List of scheduled tasks to be run by cron.';


-- moodle.mdl_tiny_autosave definição

CREATE TABLE `mdl_tiny_autosave` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `elementid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint NOT NULL,
  `pagehash` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint NOT NULL,
  `drafttext` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `draftid` bigint DEFAULT NULL,
  `pageinstance` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tinyauto_eleconusepag_uix` (`elementid`,`contextid`,`userid`,`pagehash`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='The content of the textarea saved during autosave operations';


-- moodle.mdl_tool_brickfield_areas definição

CREATE TABLE `mdl_tool_brickfield_areas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` tinyint NOT NULL DEFAULT '0',
  `contextid` bigint DEFAULT NULL,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tablename` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fieldorarea` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itemid` bigint DEFAULT NULL,
  `filename` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reftable` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refid` bigint DEFAULT NULL,
  `cmid` bigint DEFAULT NULL,
  `courseid` bigint DEFAULT NULL,
  `categoryid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_toolbricarea_coucmi_ix` (`courseid`,`cmid`),
  KEY `mdl_toolbricarea_typtabitef_ix` (`type`,`tablename`,`itemid`,`fieldorarea`),
  KEY `mdl_toolbricarea_typconcomf_ix` (`type`,`contextid`,`component`,`fieldorarea`,`itemid`),
  KEY `mdl_toolbricarea_refreftyp_ix` (`reftable`,`refid`,`type`),
  KEY `mdl_toolbricarea_cou_ix` (`courseid`),
  KEY `mdl_toolbricarea_cmi_ix` (`cmid`),
  KEY `mdl_toolbricarea_cat_ix` (`categoryid`),
  KEY `mdl_toolbricarea_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Areas that have been checked for accessibility problems';


-- moodle.mdl_tool_brickfield_cache_acts definição

CREATE TABLE `mdl_tool_brickfield_cache_acts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `courseid` bigint NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `component` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalactivities` bigint DEFAULT NULL,
  `failedactivities` bigint DEFAULT NULL,
  `passedactivities` bigint DEFAULT NULL,
  `errorcount` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_toolbriccachacts_sta_ix` (`status`),
  KEY `mdl_toolbriccachacts_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Contains accessibility summary information per activity.';


-- moodle.mdl_tool_brickfield_cache_check definição

CREATE TABLE `mdl_tool_brickfield_cache_check` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `courseid` bigint NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `checkid` bigint DEFAULT NULL,
  `checkcount` bigint DEFAULT NULL,
  `errorcount` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_toolbriccachchec_sta_ix` (`status`),
  KEY `mdl_toolbriccachchec_err_ix` (`errorcount`),
  KEY `mdl_toolbriccachchec_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Contains accessibility summary information per check.';


-- moodle.mdl_tool_brickfield_checks definição

CREATE TABLE `mdl_tool_brickfield_checks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `checktype` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checkgroup` bigint DEFAULT '0',
  `status` smallint NOT NULL,
  `severity` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_toolbricchec_che_ix` (`checktype`),
  KEY `mdl_toolbricchec_che2_ix` (`checkgroup`),
  KEY `mdl_toolbricchec_sta_ix` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Checks details';


-- moodle.mdl_tool_brickfield_content definição

CREATE TABLE `mdl_tool_brickfield_content` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `areaid` bigint NOT NULL,
  `contenthash` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `iscurrent` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL,
  `timechecked` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_toolbriccont_sta_ix` (`status`),
  KEY `mdl_toolbriccont_iscare_ix` (`iscurrent`,`areaid`),
  KEY `mdl_toolbriccont_are_ix` (`areaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Content of an area at a particular time (recognised by a has';


-- moodle.mdl_tool_brickfield_errors definição

CREATE TABLE `mdl_tool_brickfield_errors` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `resultid` bigint NOT NULL,
  `linenumber` bigint NOT NULL DEFAULT '0',
  `errordata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `htmlcode` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_toolbricerro_res_ix` (`resultid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Errors during the accessibility checks';


-- moodle.mdl_tool_brickfield_process definição

CREATE TABLE `mdl_tool_brickfield_process` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `courseid` bigint NOT NULL,
  `item` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contextid` bigint DEFAULT NULL,
  `innercontextid` bigint DEFAULT NULL,
  `timecreated` bigint DEFAULT NULL,
  `timecompleted` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_toolbricproc_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Queued records to initiate new processing of specific target';


-- moodle.mdl_tool_brickfield_results definição

CREATE TABLE `mdl_tool_brickfield_results` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contentid` bigint DEFAULT NULL,
  `checkid` bigint NOT NULL,
  `errorcount` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_toolbricresu_conche_ix` (`contentid`,`checkid`),
  KEY `mdl_toolbricresu_con_ix` (`contentid`),
  KEY `mdl_toolbricresu_che_ix` (`checkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Results of the accessibility checks';


-- moodle.mdl_tool_brickfield_schedule definição

CREATE TABLE `mdl_tool_brickfield_schedule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contextlevel` bigint NOT NULL DEFAULT '50',
  `instanceid` bigint NOT NULL,
  `contextid` bigint DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `timeanalyzed` bigint DEFAULT '0',
  `timemodified` bigint DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolbricsche_conins_uix` (`contextlevel`,`instanceid`),
  KEY `mdl_toolbricsche_sta_ix` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Keeps the per course content analysis schedule.';


-- moodle.mdl_tool_brickfield_summary definição

CREATE TABLE `mdl_tool_brickfield_summary` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `courseid` bigint NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `activities` bigint DEFAULT NULL,
  `activitiespassed` bigint DEFAULT NULL,
  `activitiesfailed` bigint DEFAULT NULL,
  `errorschecktype1` bigint DEFAULT NULL,
  `errorschecktype2` bigint DEFAULT NULL,
  `errorschecktype3` bigint DEFAULT NULL,
  `errorschecktype4` bigint DEFAULT NULL,
  `errorschecktype5` bigint DEFAULT NULL,
  `errorschecktype6` bigint DEFAULT NULL,
  `errorschecktype7` bigint DEFAULT NULL,
  `failedchecktype1` bigint DEFAULT NULL,
  `failedchecktype2` bigint DEFAULT NULL,
  `failedchecktype3` bigint DEFAULT NULL,
  `failedchecktype4` bigint DEFAULT NULL,
  `failedchecktype5` bigint DEFAULT NULL,
  `failedchecktype6` bigint DEFAULT NULL,
  `failedchecktype7` bigint DEFAULT NULL,
  `percentchecktype1` bigint DEFAULT NULL,
  `percentchecktype2` bigint DEFAULT NULL,
  `percentchecktype3` bigint DEFAULT NULL,
  `percentchecktype4` bigint DEFAULT NULL,
  `percentchecktype5` bigint DEFAULT NULL,
  `percentchecktype6` bigint DEFAULT NULL,
  `percentchecktype7` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_toolbricsumm_sta_ix` (`status`),
  KEY `mdl_toolbricsumm_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Contains accessibility check results summary information.';


-- moodle.mdl_tool_cohortroles definição

CREATE TABLE `mdl_tool_cohortroles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cohortid` bigint NOT NULL,
  `roleid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `usermodified` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolcoho_cohroluse_uix` (`cohortid`,`roleid`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Mapping of users to cohort role assignments.';


-- moodle.mdl_tool_customlang definição

CREATE TABLE `mdl_tool_customlang` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `lang` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `componentid` bigint NOT NULL,
  `stringid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `original` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `master` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `local` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `timemodified` bigint NOT NULL,
  `timecustomized` bigint DEFAULT NULL,
  `outdated` smallint DEFAULT '0',
  `modified` smallint DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolcust_lancomstr_uix` (`lang`,`componentid`,`stringid`),
  KEY `mdl_toolcust_com_ix` (`componentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Contains the working checkout of all strings and their custo';


-- moodle.mdl_tool_customlang_components definição

CREATE TABLE `mdl_tool_customlang_components` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Contains the list of all installed plugins that provide thei';


-- moodle.mdl_tool_dataprivacy_category definição

CREATE TABLE `mdl_tool_dataprivacy_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionformat` tinyint(1) DEFAULT NULL,
  `usermodified` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Data categories';


-- moodle.mdl_tool_dataprivacy_contextlist definição

CREATE TABLE `mdl_tool_dataprivacy_contextlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='List of contexts for a component';


-- moodle.mdl_tool_dataprivacy_ctxexpired definição

CREATE TABLE `mdl_tool_dataprivacy_ctxexpired` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contextid` bigint NOT NULL,
  `unexpiredroles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `expiredroles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `defaultexpired` tinyint(1) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `usermodified` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tooldatactxe_con_uix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Default comment for the table, please edit me';


-- moodle.mdl_tool_dataprivacy_ctxinstance definição

CREATE TABLE `mdl_tool_dataprivacy_ctxinstance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contextid` bigint NOT NULL,
  `purposeid` bigint DEFAULT NULL,
  `categoryid` bigint DEFAULT NULL,
  `usermodified` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tooldatactxi_con_uix` (`contextid`),
  KEY `mdl_tooldatactxi_pur_ix` (`purposeid`),
  KEY `mdl_tooldatactxi_cat_ix` (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Default comment for the table, please edit me';


-- moodle.mdl_tool_dataprivacy_ctxlevel definição

CREATE TABLE `mdl_tool_dataprivacy_ctxlevel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contextlevel` smallint NOT NULL,
  `purposeid` bigint DEFAULT NULL,
  `categoryid` bigint DEFAULT NULL,
  `usermodified` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tooldatactxl_con_uix` (`contextlevel`),
  KEY `mdl_tooldatactxl_cat_ix` (`categoryid`),
  KEY `mdl_tooldatactxl_pur_ix` (`purposeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Default comment for the table, please edit me';


-- moodle.mdl_tool_dataprivacy_ctxlst_ctx definição

CREATE TABLE `mdl_tool_dataprivacy_ctxlst_ctx` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contextid` bigint NOT NULL,
  `contextlistid` bigint NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_tooldatactxlctx_con_ix` (`contextlistid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='A contextlist context item';


-- moodle.mdl_tool_dataprivacy_purpose definição

CREATE TABLE `mdl_tool_dataprivacy_purpose` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionformat` tinyint(1) DEFAULT NULL,
  `lawfulbases` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sensitivedatareasons` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `retentionperiod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `protected` tinyint(1) DEFAULT NULL,
  `usermodified` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Data purposes';


-- moodle.mdl_tool_dataprivacy_purposerole definição

CREATE TABLE `mdl_tool_dataprivacy_purposerole` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `purposeid` bigint NOT NULL,
  `roleid` bigint NOT NULL,
  `lawfulbases` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sensitivedatareasons` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `retentionperiod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `protected` tinyint(1) DEFAULT NULL,
  `usermodified` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tooldatapurp_purrol_uix` (`purposeid`,`roleid`),
  KEY `mdl_tooldatapurp_pur_ix` (`purposeid`),
  KEY `mdl_tooldatapurp_rol_ix` (`roleid`),
  KEY `mdl_tooldatapurp_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Data purpose overrides for a specific role';


-- moodle.mdl_tool_dataprivacy_request definição

CREATE TABLE `mdl_tool_dataprivacy_request` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` bigint NOT NULL DEFAULT '0',
  `comments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `commentsformat` tinyint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `requestedby` bigint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  `dpo` bigint DEFAULT '0',
  `dpocomment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dpocommentformat` tinyint NOT NULL DEFAULT '0',
  `systemapproved` smallint NOT NULL DEFAULT '0',
  `usermodified` bigint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `creationmethod` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_tooldatarequ_use_ix` (`userid`),
  KEY `mdl_tooldatarequ_req_ix` (`requestedby`),
  KEY `mdl_tooldatarequ_dpo_ix` (`dpo`),
  KEY `mdl_tooldatarequ_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Table for data requests';


-- moodle.mdl_tool_dataprivacy_rqst_ctxlst definição

CREATE TABLE `mdl_tool_dataprivacy_rqst_ctxlst` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `requestid` bigint NOT NULL,
  `contextlistid` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tooldatarqstctxl_reqco_uix` (`requestid`,`contextlistid`),
  KEY `mdl_tooldatarqstctxl_req_ix` (`requestid`),
  KEY `mdl_tooldatarqstctxl_con_ix` (`contextlistid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Association table joining requests and contextlists';


-- moodle.mdl_tool_mfa definição

CREATE TABLE `mdl_tool_mfa` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL,
  `factor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `secret` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timecreated` bigint DEFAULT NULL,
  `createdfromip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timemodified` bigint DEFAULT NULL,
  `lastverified` bigint DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL DEFAULT '0',
  `lockcounter` mediumint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_toolmfa_use_ix` (`userid`),
  KEY `mdl_toolmfa_fac_ix` (`factor`),
  KEY `mdl_toolmfa_usefacloc_ix` (`userid`,`factor`,`lockcounter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Table to store factor configurations for users';


-- moodle.mdl_tool_mfa_auth definição

CREATE TABLE `mdl_tool_mfa_auth` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL,
  `lastverified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_toolmfaauth_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores the last time a successful MFA auth was registered fo';


-- moodle.mdl_tool_mfa_secrets definição

CREATE TABLE `mdl_tool_mfa_secrets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL,
  `factor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `secret` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint NOT NULL,
  `expiry` bigint NOT NULL,
  `revoked` tinyint(1) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_toolmfasecr_fac_ix` (`factor`),
  KEY `mdl_toolmfasecr_exp_ix` (`expiry`),
  KEY `mdl_toolmfasecr_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Table to store factor secrets';


-- moodle.mdl_tool_monitor_events definição

CREATE TABLE `mdl_tool_monitor_events` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `eventname` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint NOT NULL,
  `contextlevel` bigint NOT NULL,
  `contextinstanceid` bigint NOT NULL,
  `link` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_toolmonieven_cou_ix` (`courseid`),
  KEY `mdl_toolmonieven_con_ix` (`contextid`),
  KEY `mdl_toolmonieven_con2_ix` (`contextinstanceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='A table that keeps a log of events related to subscriptions';


-- moodle.mdl_tool_monitor_history definição

CREATE TABLE `mdl_tool_monitor_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `timesent` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolmonihist_sidusetim_uix` (`sid`,`userid`,`timesent`),
  KEY `mdl_toolmonihist_sid_ix` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Table to store history of message notifications sent';


-- moodle.mdl_tool_monitor_rules definição

CREATE TABLE `mdl_tool_monitor_rules` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionformat` tinyint(1) NOT NULL,
  `name` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint NOT NULL,
  `courseid` bigint NOT NULL,
  `plugin` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `eventname` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `template` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `templateformat` tinyint(1) NOT NULL,
  `frequency` smallint NOT NULL,
  `timewindow` mediumint NOT NULL,
  `timemodified` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_toolmonirule_couuse_ix` (`courseid`,`userid`),
  KEY `mdl_toolmonirule_eve_ix` (`eventname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Table to store rules';


-- moodle.mdl_tool_monitor_subscriptions definição

CREATE TABLE `mdl_tool_monitor_subscriptions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `courseid` bigint NOT NULL,
  `ruleid` bigint NOT NULL,
  `cmid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `lastnotificationsent` bigint NOT NULL DEFAULT '0',
  `inactivedate` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_toolmonisubs_couuse_ix` (`courseid`,`userid`),
  KEY `mdl_toolmonisubs_rul_ix` (`ruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Table to store user subscriptions to various rules';


-- moodle.mdl_tool_policy definição

CREATE TABLE `mdl_tool_policy` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sortorder` mediumint NOT NULL DEFAULT '999',
  `currentversionid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_toolpoli_cur_ix` (`currentversionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Contains the list of policy documents defined on the site.';


-- moodle.mdl_tool_policy_acceptances definição

CREATE TABLE `mdl_tool_policy_acceptances` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `policyversionid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `lang` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `usermodified` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `note` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolpoliacce_poluse_uix` (`policyversionid`,`userid`),
  KEY `mdl_toolpoliacce_pol_ix` (`policyversionid`),
  KEY `mdl_toolpoliacce_use_ix` (`userid`),
  KEY `mdl_toolpoliacce_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Tracks users accepting the policy versions';


-- moodle.mdl_tool_policy_versions definição

CREATE TABLE `mdl_tool_policy_versions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` smallint NOT NULL DEFAULT '0',
  `audience` smallint NOT NULL DEFAULT '0',
  `archived` smallint NOT NULL DEFAULT '0',
  `usermodified` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `policyid` bigint NOT NULL,
  `agreementstyle` smallint NOT NULL DEFAULT '0',
  `optional` smallint NOT NULL DEFAULT '0',
  `revision` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summaryformat` smallint NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contentformat` smallint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_toolpolivers_use_ix` (`usermodified`),
  KEY `mdl_toolpolivers_pol_ix` (`policyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Holds versions of the policy documents';


-- moodle.mdl_tool_recyclebin_category definição

CREATE TABLE `mdl_tool_recyclebin_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `categoryid` bigint NOT NULL,
  `shortname` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `fullname` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_toolrecycate_tim_ix` (`timecreated`),
  KEY `mdl_toolrecycate_cat_ix` (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='A list of items in the category recycle bin';


-- moodle.mdl_tool_recyclebin_course definição

CREATE TABLE `mdl_tool_recyclebin_course` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `courseid` bigint NOT NULL,
  `section` bigint NOT NULL,
  `module` bigint NOT NULL,
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timecreated` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_toolrecycour_tim_ix` (`timecreated`),
  KEY `mdl_toolrecycour_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='A list of items in the course recycle bin';


-- moodle.mdl_tool_usertours_steps definição

CREATE TABLE `mdl_tool_usertours_steps` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tourid` bigint NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentformat` smallint NOT NULL DEFAULT '0',
  `targettype` tinyint NOT NULL,
  `targetvalue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sortorder` bigint NOT NULL DEFAULT '0',
  `configdata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_tooluserstep_tousor_ix` (`tourid`,`sortorder`),
  KEY `mdl_tooluserstep_tou_ix` (`tourid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Steps in an tour';


-- moodle.mdl_tool_usertours_tours definição

CREATE TABLE `mdl_tool_usertours_tours` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `pathmatch` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `sortorder` bigint NOT NULL DEFAULT '0',
  `endtourlabel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `configdata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `displaystepnumbers` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='List of tours';


-- moodle.mdl_upgrade_log definição

CREATE TABLE `mdl_upgrade_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` bigint NOT NULL,
  `plugin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `targetversion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `backtrace` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `userid` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_upgrlog_tim_ix` (`timemodified`),
  KEY `mdl_upgrlog_typtim_ix` (`type`,`timemodified`),
  KEY `mdl_upgrlog_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=1236 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Upgrade logging';


-- moodle.mdl_url definição

CREATE TABLE `mdl_url` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL DEFAULT '0',
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `introformat` smallint NOT NULL DEFAULT '0',
  `externalurl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display` smallint NOT NULL DEFAULT '0',
  `displayoptions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `parameters` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_url_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='each record is one url resource';


-- moodle.mdl_user definição

CREATE TABLE `mdl_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `auth` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'manual',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `policyagreed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `mnethostid` bigint NOT NULL DEFAULT '0',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `firstname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lastname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `emailstop` tinyint(1) NOT NULL DEFAULT '0',
  `phone1` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `institution` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lang` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `calendartype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gregorian',
  `theme` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timezone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '99',
  `firstaccess` bigint NOT NULL DEFAULT '0',
  `lastaccess` bigint NOT NULL DEFAULT '0',
  `lastlogin` bigint NOT NULL DEFAULT '0',
  `currentlogin` bigint NOT NULL DEFAULT '0',
  `lastip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `secret` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `picture` bigint NOT NULL DEFAULT '0',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionformat` tinyint NOT NULL DEFAULT '1',
  `mailformat` tinyint(1) NOT NULL DEFAULT '1',
  `maildigest` tinyint(1) NOT NULL DEFAULT '0',
  `maildisplay` tinyint NOT NULL DEFAULT '2',
  `autosubscribe` tinyint(1) NOT NULL DEFAULT '1',
  `trackforums` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `trustbitmask` bigint NOT NULL DEFAULT '0',
  `imagealt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastnamephonetic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstnamephonetic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middlename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternatename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `moodlenetprofile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_user_mneuse_uix` (`mnethostid`,`username`),
  KEY `mdl_user_del_ix` (`deleted`),
  KEY `mdl_user_con_ix` (`confirmed`),
  KEY `mdl_user_fir_ix` (`firstname`),
  KEY `mdl_user_las_ix` (`lastname`),
  KEY `mdl_user_cit_ix` (`city`),
  KEY `mdl_user_cou_ix` (`country`),
  KEY `mdl_user_las2_ix` (`lastaccess`),
  KEY `mdl_user_ema_ix` (`email`),
  KEY `mdl_user_aut_ix` (`auth`),
  KEY `mdl_user_idn_ix` (`idnumber`),
  KEY `mdl_user_fir2_ix` (`firstnamephonetic`),
  KEY `mdl_user_las3_ix` (`lastnamephonetic`),
  KEY `mdl_user_mid_ix` (`middlename`),
  KEY `mdl_user_alt_ix` (`alternatename`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='One record for each person';


-- moodle.mdl_user_devices definição

CREATE TABLE `mdl_user_devices` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL DEFAULT '0',
  `appid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `model` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `platform` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pushid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `publickey` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userdevi_pususe_uix` (`pushid`,`userid`),
  KEY `mdl_userdevi_uuiuse_ix` (`uuid`,`userid`),
  KEY `mdl_userdevi_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='This table stores user''s mobile devices information in order';


-- moodle.mdl_user_enrolments definição

CREATE TABLE `mdl_user_enrolments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` bigint NOT NULL DEFAULT '0',
  `enrolid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `timestart` bigint NOT NULL DEFAULT '0',
  `timeend` bigint NOT NULL DEFAULT '2147483647',
  `modifierid` bigint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userenro_enruse_uix` (`enrolid`,`userid`),
  KEY `mdl_userenro_enr_ix` (`enrolid`),
  KEY `mdl_userenro_use_ix` (`userid`),
  KEY `mdl_userenro_mod_ix` (`modifierid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Users participating in courses (aka enrolled users) - everyb';


-- moodle.mdl_user_info_category definição

CREATE TABLE `mdl_user_info_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Customisable fields categories';


-- moodle.mdl_user_info_data definição

CREATE TABLE `mdl_user_info_data` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL DEFAULT '0',
  `fieldid` bigint NOT NULL DEFAULT '0',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dataformat` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userinfodata_usefie_uix` (`userid`,`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Data for the customisable user fields';


-- moodle.mdl_user_info_field definição

CREATE TABLE `mdl_user_info_field` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'shortname',
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `datatype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionformat` tinyint NOT NULL DEFAULT '0',
  `categoryid` bigint NOT NULL DEFAULT '0',
  `sortorder` bigint NOT NULL DEFAULT '0',
  `required` tinyint NOT NULL DEFAULT '0',
  `locked` tinyint NOT NULL DEFAULT '0',
  `visible` smallint NOT NULL DEFAULT '0',
  `forceunique` tinyint NOT NULL DEFAULT '0',
  `signup` tinyint NOT NULL DEFAULT '0',
  `defaultdata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `defaultdataformat` tinyint NOT NULL DEFAULT '0',
  `param1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `param2` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `param3` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `param4` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `param5` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Customisable user profile fields';


-- moodle.mdl_user_lastaccess definição

CREATE TABLE `mdl_user_lastaccess` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL DEFAULT '0',
  `courseid` bigint NOT NULL DEFAULT '0',
  `timeaccess` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userlast_usecou_uix` (`userid`,`courseid`),
  KEY `mdl_userlast_use_ix` (`userid`),
  KEY `mdl_userlast_cou_ix` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='To keep track of course page access times, used in online pa';


-- moodle.mdl_user_password_history definição

CREATE TABLE `mdl_user_password_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL,
  `hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_userpasshist_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='A rotating log of hashes of previously used passwords for ea';


-- moodle.mdl_user_password_resets definição

CREATE TABLE `mdl_user_password_resets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL,
  `timerequested` bigint NOT NULL,
  `timererequested` bigint NOT NULL DEFAULT '0',
  `token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_userpassrese_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='table tracking password reset confirmation tokens';


-- moodle.mdl_user_preferences definição

CREATE TABLE `mdl_user_preferences` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` bigint NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userpref_usenam_uix` (`userid`,`name`),
  KEY `mdl_userpref_nam_ix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Allows modules to store arbitrary user preferences';


-- moodle.mdl_user_private_key definição

CREATE TABLE `mdl_user_private_key` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `script` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint NOT NULL,
  `instance` bigint DEFAULT NULL,
  `iprestriction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validuntil` bigint DEFAULT NULL,
  `timecreated` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_userprivkey_scrval_ix` (`script`,`value`),
  KEY `mdl_userprivkey_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='access keys used in cookieless scripts - rss, etc.';


-- moodle.mdl_wiki definição

CREATE TABLE `mdl_wiki` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL DEFAULT '0',
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Wiki',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `introformat` smallint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `firstpagetitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'First Page',
  `wikimode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'collaborative',
  `defaultformat` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'creole',
  `forceformat` tinyint(1) NOT NULL DEFAULT '1',
  `editbegin` bigint NOT NULL DEFAULT '0',
  `editend` bigint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wiki_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores Wiki activity configuration';


-- moodle.mdl_wiki_links definição

CREATE TABLE `mdl_wiki_links` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint NOT NULL DEFAULT '0',
  `frompageid` bigint NOT NULL DEFAULT '0',
  `topageid` bigint NOT NULL DEFAULT '0',
  `tomissingpage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_wikilink_fro_ix` (`frompageid`),
  KEY `mdl_wikilink_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Page wiki links';


-- moodle.mdl_wiki_locks definição

CREATE TABLE `mdl_wiki_locks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pageid` bigint NOT NULL DEFAULT '0',
  `sectionname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userid` bigint NOT NULL DEFAULT '0',
  `lockedat` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Manages page locks';


-- moodle.mdl_wiki_pages definição

CREATE TABLE `mdl_wiki_pages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'title',
  `cachedcontent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timecreated` bigint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL DEFAULT '0',
  `timerendered` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  `pageviews` bigint NOT NULL DEFAULT '0',
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikipage_subtituse_uix` (`subwikiid`,`title`,`userid`),
  KEY `mdl_wikipage_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores wiki pages';


-- moodle.mdl_wiki_subwikis definição

CREATE TABLE `mdl_wiki_subwikis` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `wikiid` bigint NOT NULL DEFAULT '0',
  `groupid` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisubw_wikgrouse_uix` (`wikiid`,`groupid`,`userid`),
  KEY `mdl_wikisubw_wik_ix` (`wikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores subwiki instances';


-- moodle.mdl_wiki_synonyms definição

CREATE TABLE `mdl_wiki_synonyms` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint NOT NULL DEFAULT '0',
  `pageid` bigint NOT NULL DEFAULT '0',
  `pagesynonym` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pagesynonym',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisyno_pagpag_uix` (`pageid`,`pagesynonym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores wiki pages synonyms';


-- moodle.mdl_wiki_versions definição

CREATE TABLE `mdl_wiki_versions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pageid` bigint NOT NULL DEFAULT '0',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contentformat` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'creole',
  `version` mediumint NOT NULL DEFAULT '0',
  `timecreated` bigint NOT NULL DEFAULT '0',
  `userid` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wikivers_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores wiki page history';


-- moodle.mdl_workshop definição

CREATE TABLE `mdl_workshop` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` bigint NOT NULL,
  `name` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `introformat` smallint NOT NULL DEFAULT '0',
  `instructauthors` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `instructauthorsformat` smallint NOT NULL DEFAULT '0',
  `instructreviewers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `instructreviewersformat` smallint NOT NULL DEFAULT '0',
  `timemodified` bigint NOT NULL,
  `phase` smallint DEFAULT '0',
  `useexamples` tinyint DEFAULT '0',
  `usepeerassessment` tinyint DEFAULT '0',
  `useselfassessment` tinyint DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '80.00000',
  `gradinggrade` decimal(10,5) DEFAULT '20.00000',
  `strategy` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `evaluation` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `gradedecimals` smallint DEFAULT '0',
  `submissiontypetext` tinyint(1) NOT NULL DEFAULT '1',
  `submissiontypefile` tinyint(1) NOT NULL DEFAULT '1',
  `nattachments` smallint DEFAULT '1',
  `submissionfiletypes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latesubmissions` tinyint DEFAULT '0',
  `maxbytes` bigint DEFAULT '100000',
  `examplesmode` smallint DEFAULT '0',
  `submissionstart` bigint DEFAULT '0',
  `submissionend` bigint DEFAULT '0',
  `assessmentstart` bigint DEFAULT '0',
  `assessmentend` bigint DEFAULT '0',
  `phaseswitchassessment` tinyint NOT NULL DEFAULT '0',
  `conclusion` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `conclusionformat` smallint NOT NULL DEFAULT '1',
  `overallfeedbackmode` smallint DEFAULT '1',
  `overallfeedbackfiles` smallint DEFAULT '0',
  `overallfeedbackfiletypes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `overallfeedbackmaxbytes` bigint DEFAULT '100000',
  PRIMARY KEY (`id`),
  KEY `mdl_work_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='This table keeps information about the module instances and ';


-- moodle.mdl_workshop_aggregations definição

CREATE TABLE `mdl_workshop_aggregations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workshopid` bigint NOT NULL,
  `userid` bigint NOT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `timegraded` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workaggr_woruse_uix` (`workshopid`,`userid`),
  KEY `mdl_workaggr_wor_ix` (`workshopid`),
  KEY `mdl_workaggr_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Aggregated grades for assessment are stored here. The aggreg';


-- moodle.mdl_workshop_assessments definição

CREATE TABLE `mdl_workshop_assessments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `submissionid` bigint NOT NULL,
  `reviewerid` bigint NOT NULL,
  `weight` bigint NOT NULL DEFAULT '1',
  `timecreated` bigint DEFAULT '0',
  `timemodified` bigint DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `gradinggradeover` decimal(10,5) DEFAULT NULL,
  `gradinggradeoverby` bigint DEFAULT NULL,
  `feedbackauthor` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `feedbackauthorformat` smallint DEFAULT '0',
  `feedbackauthorattachment` smallint DEFAULT '0',
  `feedbackreviewer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `feedbackreviewerformat` smallint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workasse_sub_ix` (`submissionid`),
  KEY `mdl_workasse_gra_ix` (`gradinggradeoverby`),
  KEY `mdl_workasse_rev_ix` (`reviewerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Info about the made assessment and automatically calculated ';


-- moodle.mdl_workshop_grades definição

CREATE TABLE `mdl_workshop_grades` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `assessmentid` bigint NOT NULL,
  `strategy` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dimensionid` bigint NOT NULL,
  `grade` decimal(10,5) DEFAULT NULL,
  `peercomment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `peercommentformat` smallint DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workgrad_assstrdim_uix` (`assessmentid`,`strategy`,`dimensionid`),
  KEY `mdl_workgrad_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='How the reviewers filled-up the grading forms, given grades ';


-- moodle.mdl_workshop_submissions definição

CREATE TABLE `mdl_workshop_submissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workshopid` bigint NOT NULL,
  `example` tinyint DEFAULT '0',
  `authorid` bigint NOT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentformat` smallint NOT NULL DEFAULT '0',
  `contenttrust` smallint NOT NULL DEFAULT '0',
  `attachment` tinyint DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradeover` decimal(10,5) DEFAULT NULL,
  `gradeoverby` bigint DEFAULT NULL,
  `feedbackauthor` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `feedbackauthorformat` smallint DEFAULT '0',
  `timegraded` bigint DEFAULT NULL,
  `published` tinyint DEFAULT '0',
  `late` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_worksubm_wor_ix` (`workshopid`),
  KEY `mdl_worksubm_gra_ix` (`gradeoverby`),
  KEY `mdl_worksubm_aut_ix` (`authorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Info about the submission and the aggregation of the grade f';


-- moodle.mdl_workshopallocation_scheduled definição

CREATE TABLE `mdl_workshopallocation_scheduled` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workshopid` bigint NOT NULL,
  `enabled` tinyint NOT NULL DEFAULT '0',
  `submissionend` bigint NOT NULL,
  `timeallocated` bigint DEFAULT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `resultstatus` bigint DEFAULT NULL,
  `resultmessage` varchar(1333) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resultlog` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worksche_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Stores the allocation settings for the scheduled allocator';


-- moodle.mdl_workshopeval_best_settings definição

CREATE TABLE `mdl_workshopeval_best_settings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workshopid` bigint NOT NULL,
  `comparison` smallint DEFAULT '5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workbestsett_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Settings for the grading evaluation subplugin Comparison wit';


-- moodle.mdl_workshopform_accumulative definição

CREATE TABLE `mdl_workshopform_accumulative` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workshopid` bigint NOT NULL,
  `sort` bigint DEFAULT '0',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionformat` smallint DEFAULT '0',
  `grade` bigint NOT NULL,
  `weight` mediumint DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_workaccu_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='The assessment dimensions definitions of Accumulative gradin';


-- moodle.mdl_workshopform_comments definição

CREATE TABLE `mdl_workshopform_comments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workshopid` bigint NOT NULL,
  `sort` bigint DEFAULT '0',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionformat` smallint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workcomm_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='The assessment dimensions definitions of Comments strategy f';


-- moodle.mdl_workshopform_numerrors definição

CREATE TABLE `mdl_workshopform_numerrors` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workshopid` bigint NOT NULL,
  `sort` bigint DEFAULT '0',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionformat` smallint DEFAULT '0',
  `descriptiontrust` bigint DEFAULT NULL,
  `grade0` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grade1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` mediumint DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_worknume_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='The assessment dimensions definitions of Number of errors gr';


-- moodle.mdl_workshopform_numerrors_map definição

CREATE TABLE `mdl_workshopform_numerrors_map` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workshopid` bigint NOT NULL,
  `nonegative` bigint NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worknumemap_wornon_uix` (`workshopid`,`nonegative`),
  KEY `mdl_worknumemap_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='This maps the number of errors to a percentual grade for sub';


-- moodle.mdl_workshopform_rubric definição

CREATE TABLE `mdl_workshopform_rubric` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workshopid` bigint NOT NULL,
  `sort` bigint DEFAULT '0',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionformat` smallint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubr_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='The assessment dimensions definitions of Rubric grading stra';


-- moodle.mdl_workshopform_rubric_config definição

CREATE TABLE `mdl_workshopform_rubric_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `workshopid` bigint NOT NULL,
  `layout` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'list',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workrubrconf_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='Configuration table for the Rubric grading strategy';


-- moodle.mdl_workshopform_rubric_levels definição

CREATE TABLE `mdl_workshopform_rubric_levels` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dimensionid` bigint NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `definition` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `definitionformat` smallint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrleve_dim_ix` (`dimensionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='The definition of rubric rating scales';


-- moodle.mdl_xapi_states definição

CREATE TABLE `mdl_xapi_states` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint DEFAULT NULL,
  `itemid` bigint NOT NULL,
  `stateid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `statedata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `registration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timecreated` bigint NOT NULL,
  `timemodified` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_xapistat_comite_ix` (`component`,`itemid`),
  KEY `mdl_xapistat_use_ix` (`userid`),
  KEY `mdl_xapistat_tim_ix` (`timemodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED COMMENT='The stored xAPI states';
