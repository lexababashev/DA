drop database if exists warehouse;
create database warehouse;

use warehouse;

drop table if exists country_dim;
drop table if exists year_dim;
drop table if exists suicide_fact;

CREATE TABLE country_dim
(
    id                                INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    country_name                      VARCHAR(255),
    region                            VARCHAR(50),
    area                              INT,
    literacy                          FLOAT,
    life_ladder                       FLOAT,
    social_support                    FLOAT,
    healthy_life_expectancy_at_birth  FLOAT,
    freedom_to_make_life_choices      FLOAT,
    perceptions_of_corruption         FLOAT,
    confidence_in_national_government FLOAT,
    democratic_quality                FLOAT
);

CREATE TABLE year_dim
(
    id     INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `year` INT
);

CREATE TABLE suicide_fact
(
    id                     INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_year                INT NOT NULL,
    id_country             INT NOT NULL,
    population             FLOAT,
    gdp_per_capita         FLOAT,
    death_count            FLOAT,
    suicide_count          FLOAT,
    conflict_and_terrorism FLOAT,
    road_injuries          FLOAT,
    alcohol_use_disorders  FLOAT,
    drug_use_disorders     FLOAT,

    FOREIGN KEY (id_year) references year_dim (id),
    FOREIGN KEY (id_country) references country_dim (id)
);

