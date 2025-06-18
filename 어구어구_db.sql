CREATE TABLE `seller` (
  `seller_id` varchar(45) NOT NULL,
  `seller_name` varchar(45) NOT NULL,
  `seller_ph` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  PRIMARY KEY (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `fishing_gear` (
  `gear_id` varchar(20) NOT NULL,
  `seller_id` varchar(45) NOT NULL,
  `buyer_id` int NOT NULL,
  `type` varchar(45) NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`gear_id`),
  KEY `buyer_id_idx` (`buyer_id`),
  KEY `seller_id_idx` (`seller_id`),
  CONSTRAINT `buyer_id` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`buyer_id`),
  CONSTRAINT `seller_id` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `gear_info` (
  `gear_id` varchar(20) NOT NULL,
  `gear_length` int NOT NULL,
  `gear_weight` int NOT NULL,
  `gear_depth` int NOT NULL,
  `gear_material` varchar(45) NOT NULL,
  PRIMARY KEY (`gear_id`),
  CONSTRAINT `gear_id` FOREIGN KEY (`gear_id`) REFERENCES `fishing_gear` (`gear_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `buyer` (
  `buyer_id` int NOT NULL,
  `buyer_name` varchar(45) NOT NULL,
  `buyer_ph` varchar(20) NOT NULL,
  `boat_name` varchar(45) NOT NULL,
  `boat_weight` float NOT NULL,
  PRIMARY KEY (`buyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `fishing_activity` (
  `fa_number` int NOT NULL,
  `fa_buyer_id` int NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `cast_latitude` decimal(9,6) NOT NULL,
  `cast_longitude` decimal(9,6) NOT NULL,
  `haul_latitude` decimal(9,6) DEFAULT NULL,
  `haul_longitude` decimal(9,6) DEFAULT NULL,
  PRIMARY KEY (`fa_number`),
  KEY `buyer_id_idx` (`fa_buyer_id`),
  CONSTRAINT `fa_buyer_id` FOREIGN KEY (`fa_buyer_id`) REFERENCES `buyer` (`buyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `losting_gear` (
  `report_id` int NOT NULL,
  `lg_buyer_id` int NOT NULL,
  `lg_admin_id` int NOT NULL,
  `cast_latitude` decimal(9,6) NOT NULL,
  `cast_longitude` decimal(9,6) NOT NULL,
  `cast_time` datetime NOT NULL,
  `report_time` datetime NOT NULL,
  PRIMARY KEY (`report_id`),
  KEY `lg_buyer_id_idx` (`lg_buyer_id`),
  KEY `admin_id` (`lg_admin_id`),
  CONSTRAINT `lg_admin_id` FOREIGN KEY (`lg_admin_id`) REFERENCES `admin` (`admin_id`),
  CONSTRAINT `lg_buyer_id` FOREIGN KEY (`lg_buyer_id`) REFERENCES `fishing_activity` (`fa_buyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `admin` (
  `admin_id` int NOT NULL,
  `admin_pw` varchar(45) DEFAULT NULL,
  `admin_area` varchar(45) DEFAULT NULL,
  `admin_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `assignment` (
  `Assignment_id` int NOT NULL,
  `as_admin_id` int NOT NULL,
  `as_boat_id` int NOT NULL,
  PRIMARY KEY (`Assignment_id`),
  KEY `as_admin_id_idx` (`as_admin_id`),
  KEY `as_boat_id_idx` (`as_boat_id`),
  CONSTRAINT `as_admin_id` FOREIGN KEY (`as_admin_id`) REFERENCES `admin` (`admin_id`),
  CONSTRAINT `as_boat_id` FOREIGN KEY (`as_boat_id`) REFERENCES `retrieval_boat` (`boat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `retrieval_boat` (
  `boat_id` int NOT NULL,
  `retrieval_company` varchar(45) NOT NULL,
  `company_adrress` varchar(25) NOT NULL,
  `boat_weight` int NOT NULL,
  `boat_ph` varchar(20) NOT NULL,
  `off_date` datetime DEFAULT NULL,
  PRIMARY KEY (`boat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
