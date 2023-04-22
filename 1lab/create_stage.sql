drop database if exists stage;

create database stage;

use stage;

drop table if exists suicides;
drop table if exists deaths;
drop table if exists happiness;


CREATE TABLE deaths
(
    country                              VARCHAR(255),
    `year`                               INT,
    meningitis                           FLOAT,
    alzheimers_disease                   FLOAT,
    parkinsons_disease                   FLOAT,
    nutritional_deficiency               FLOAT,
    malaria                              FLOAT,
    drowning                             FLOAT,
    interpersonal_violence               FLOAT,
    maternal_disorders                   FLOAT,
    hiv_aids                             FLOAT,
    drug_use_disorders                   FLOAT,
    tuberculosis                         FLOAT,
    cardiovascular_diseases              FLOAT,
    lower_respiratory_infections         FLOAT,
    neonatal_disorders                   FLOAT,
    alcohol_use_disorders                FLOAT,
    self_harm                            FLOAT,
    exposure_to_forces_of_nature         FLOAT,
    diarrheal_diseases                   FLOAT,
    environmental_heat_and_cold_exposure FLOAT,
    neoplasms                            FLOAT,
    conflict_and_terrorism               FLOAT,
    diabetes_mellitus                    FLOAT,
    chronic_kidney_disease               FLOAT,
    poisonings                           FLOAT,
    protein_energy_malnutrition          FLOAT,
    terrorism                            FLOAT,
    road_injuries                        FLOAT,
    chronic_respiratory_diseases         FLOAT,
    chronic_liver_diseases               FLOAT,
    digestive_diseases                   FLOAT,
    fire_heat_hot_substance              FLOAT,
    acute_hepatitis                      FLOAT,
    total FLOAT
);


CREATE TABLE suicides
(
    country        VARCHAR(255),
    `year`         INT,
    gdp_per_capita FLOAT,
    suicides_no    FLOAT,
    population     FLOAT
);


CREATE TABLE happiness
(
    country                                     VARCHAR(255),
    life_ladder                                 FLOAT,
    social_support                              FLOAT,
    healthy_life_expectancy_at_birth            FLOAT,
    freedom_to_make_life_choices                FLOAT,
    generosity                                  FLOAT,
    perceptions_of_corruption                   FLOAT,
    positive_affect                             FLOAT,
    negative_affect                             FLOAT,
    confidence_in_national_government           FLOAT,
    democratic_quality                          FLOAT,
    delivery_quality                            FLOAT
);

CREATE TABLE countries (
  country VARCHAR(100),
  Region VARCHAR(100),
  Population INT,
  Area INT,
  PopDensity FLOAT,
  NetMigration FLOAT,
  InfantMortality FLOAT,
  Literacy FLOAT,
  PhonesPer1000 FLOAT,
  Climate FLOAT,
  Birthrate FLOAT,
  Deathrate FLOAT,
  Agriculture FLOAT,
  Industry FLOAT,
  Service FLOAT
);