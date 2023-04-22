use warehouse;

drop procedure if exists slow_change_country;

delimiter //
create procedure slow_change_country(old_name varchar(50), new_name varchar(50))
begin
    declare old_id int default null;
    declare old_region VARCHAR(50);
    declare old_area INT;
    declare old_literacy FLOAT;
    declare old_life_ladder FLOAT;
    declare old_social_support FLOAT;
    declare old_healthy_life_expectancy_at_birth FLOAT;
    declare old_freedom_to_make_life_choices FLOAT;
    declare old_perceptions_of_corruption FLOAT;
    declare old_confidence_in_national_government FLOAT;
    declare old_democratic_quality FLOAT;


    select id,
           region,
           area,
           literacy,
           life_ladder,
           social_support,
           healthy_life_expectancy_at_birth,
           freedom_to_make_life_choices,
           perceptions_of_corruption,
           confidence_in_national_government,
           democratic_quality
    into old_id,old_region,old_area,old_literacy,old_life_ladder,old_social_support,old_healthy_life_expectancy_at_birth,
        old_freedom_to_make_life_choices,old_perceptions_of_corruption,old_confidence_in_national_government,old_democratic_quality
    from country_dim
    where country_name = old_name;


    if old_name is null then
        signal sqlstate '45000' set message_text = 'Check country name. This country is not in database.';
    else
        insert into country_dim (country_name, region, area, literacy, life_ladder, social_support,
                                 healthy_life_expectancy_at_birth, freedom_to_make_life_choices,
                                 perceptions_of_corruption, confidence_in_national_government, democratic_quality,
                                 source_id, start_date)
            value (new_name, old_region, old_area, old_literacy, old_life_ladder, old_social_support,
                   old_healthy_life_expectancy_at_birth,
                   old_freedom_to_make_life_choices, old_perceptions_of_corruption,
                   old_confidence_in_national_government,
                   old_democratic_quality, old_id, CURRENT_DATE);

        update country_dim
        set end_date = CURRENT_DATE
        where id = old_id;

    end if;
end //
delimiter ;

call slow_change_country('Albania', 'CHECK');
call slow_change_country('CHECK', 'Albania');