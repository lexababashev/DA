use stage;

INSERT INTO warehouse.year_dim(`year`)
SELECT DISTINCT deaths.year
FROM deaths
JOIN suicides ON deaths.year = suicides.year
WHERE NOT EXISTS (
    SELECT 1 FROM warehouse.year_dim y
    WHERE y.year = deaths.year
);


INSERT INTO warehouse.country_dim(country_name, region, area, literacy, life_ladder, social_support,
                                  healthy_life_expectancy_at_birth, freedom_to_make_life_choices,
                                  perceptions_of_corruption, confidence_in_national_government, democratic_quality)
SELECT DISTINCT deaths.country,
                countries.Region,
                countries.Area,
                countries.Literacy,
                happiness.life_ladder,
                happiness.social_support,
                happiness.healthy_life_expectancy_at_birth,
                happiness.freedom_to_make_life_choices,
                happiness.perceptions_of_corruption,
                happiness.confidence_in_national_government,
                happiness.democratic_quality
FROM deaths
JOIN suicides ON suicides.country = deaths.country
JOIN happiness ON happiness.country = deaths.country
JOIN countries ON countries.country = deaths.country
WHERE NOT EXISTS (
    SELECT 1
    FROM warehouse.country_dim c
    WHERE c.country_name = deaths.country
);

INSERT INTO warehouse.suicide_fact(id_year, id_country, population, gdp_per_capita, death_count,
                                   suicide_count, conflict_and_terrorism, road_injuries,
                                   alcohol_use_disorders, drug_use_disorders)
SELECT warehouse.year_dim.id,
       warehouse.country_dim.id,
       suicides.population,
       suicides.gdp_per_capita,
       deaths.total,
       suicides.suicides_no,
       deaths.conflict_and_terrorism,
       deaths.road_injuries,
       deaths.alcohol_use_disorders,
       deaths.drug_use_disorders
FROM suicides
JOIN warehouse.country_dim ON suicides.country = warehouse.country_dim.country_name
JOIN warehouse.year_dim ON suicides.year = warehouse.year_dim.year
JOIN deaths ON deaths.country = suicides.country AND deaths.year = suicides.year
WHERE NOT EXISTS (
    SELECT 1
    FROM warehouse.suicide_fact s
    WHERE s.id_year = warehouse.year_dim.id
        AND s.id_country = warehouse.country_dim.id
);