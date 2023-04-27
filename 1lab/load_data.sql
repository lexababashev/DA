use stage;

truncate table suicides;
truncate table deaths;
truncate table happiness;
truncate table countries;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned-dataset/deaths1990-2019.csv' INTO TABLE deaths
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned-dataset/suicides1985-2016GROUPED.csv' INTO TABLE suicides
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned-dataset/happiness.csv' INTO TABLE happiness
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS
    (country, life_ladder, @skip, social_support, healthy_life_expectancy_at_birth, freedom_to_make_life_choices,
     generosity, perceptions_of_corruption, positive_affect, negative_affect, confidence_in_national_government,
     democratic_quality, delivery_quality, @skip, @skip, @skip, @skip, @skip, @skip, @skip, @skip, @skip, @skip,
     @skip, @skip);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned-dataset/countries.csv' INTO TABLE countries
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS
    (country, Region, Population, Area, PopDensity, @skip, NetMigration, InfantMortality, @skip, Literacy,
     PhonesPer1000,
     @skip, @skip, @skip, Climate, Birthrate, Deathrate, Agriculture, Industry, Service);

