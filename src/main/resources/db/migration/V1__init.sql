CREATE TABLE `reservation` (
                               `date` date NOT NULL,
                               `id` bigint NOT NULL AUTO_INCREMENT,
                               `restaurant_id` bigint NOT NULL,
                               `restaurant_time_id` bigint NOT NULL,
                               `nickname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                               `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                               PRIMARY KEY (`id`),
                               KEY `FKc6n2ember9n6kakh7w5tfsewj` (`restaurant_time_id`),
                               KEY `FKbna4xjm3tqln2j6kda3fl2yiy` (`restaurant_id`),
                               CONSTRAINT `FKbna4xjm3tqln2j6kda3fl2yiy` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`),
                               CONSTRAINT `FKc6n2ember9n6kakh7w5tfsewj` FOREIGN KEY (`restaurant_time_id`) REFERENCES `reservation_time` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci


CREATE TABLE `reservation_capacity` (
                                        `id` bigint NOT NULL AUTO_INCREMENT,
                                        `number_of_people` bigint NOT NULL,
                                        `reservation_time` bigint NOT NULL,
                                        PRIMARY KEY (`id`),
                                        KEY `FK3f69vhue5h4tuuqhkl5ouqcyu` (`reservation_time`),
                                        CONSTRAINT `FK3f69vhue5h4tuuqhkl5ouqcyu` FOREIGN KEY (`reservation_time`) REFERENCES `reservation_time` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci

CREATE TABLE `reservation_time` (
                                    `time` time(6) NOT NULL,
                                    `id` bigint NOT NULL AUTO_INCREMENT,
                                    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci


CREATE TABLE `restaurant` (
                              `closing_time` time(6) NOT NULL,
                              `open_time` time(6) NOT NULL,
                              `id` bigint NOT NULL AUTO_INCREMENT,
                              `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci


CREATE TABLE `restaurant_reservation_capacities` (
                                                     `reservation_capacities_id` bigint NOT NULL,
                                                     `restaurant_id` bigint NOT NULL,
                                                     UNIQUE KEY `UK8llsujmd4fw21fm9xlggum1qp` (`reservation_capacities_id`),
                                                     KEY `FKsr7fqo750h6wfaoat3kr2d9bv` (`restaurant_id`),
                                                     CONSTRAINT `FKens287w1lah6yi8rmklvow2ju` FOREIGN KEY (`reservation_capacities_id`) REFERENCES `reservation_capacity` (`id`),
                                                     CONSTRAINT `FKsr7fqo750h6wfaoat3kr2d9bv` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
