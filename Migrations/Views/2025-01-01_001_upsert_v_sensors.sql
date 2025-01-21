drop view if exists v_sensors;

create or replace view v_sensors as
    select 'temperature' as code, 'Temperature sensor' as name, now() as created_utc union all
	select 'vibration'  as code, 'Vibration sensor'  as name, now() as created_utc union all
	select 'speed'  as code, 'Speed sensor'  as name, now() as created_utc;