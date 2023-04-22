use stage;

insert into warehouse.year_dim(`year`)
select distinct deaths.year
from deaths
         join suicides on deaths.year = suicides.year;

insert into warehouse.country_dim(country_name, region, area, literacy, life_ladder, social_support,
                                  healthy_life_expectancy_at_birth, freedom_to_make_life_choices,
                                  perceptions_of_corruption, confidence_in_national_government, democratic_quality)
select distinct deaths.country,
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
from deaths
         join suicides on suicides.country = deaths.country
         join happiness on happiness.country = deaths.country
         join countries on countries.country = deaths.country;


insert into warehouse.suicide_fact(id_year, id_country, population, gdp_per_capita, death_count,
                                   suicide_count, conflict_and_terrorism, road_injuries,
                                   alcohol_use_disorders, drug_use_disorders)
select warehouse.year_dim.id,
       warehouse.country_dim.id,
       suicides.population,
       suicides.gdp_per_capita,
       deaths.total,
       suicides.suicides_no,
       deaths.conflict_and_terrorism,
       deaths.road_injuries,
       deaths.alcohol_use_disorders,
       deaths.drug_use_disorders
from suicides
         join warehouse.country_dim on suicides.country = warehouse.country_dim.country_name
         join warehouse.year_dim on suicides.year = warehouse.year_dim.year
         join deaths on deaths.country = suicides.country and deaths.year = suicides.year;


