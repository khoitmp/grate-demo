drop view if exists v_devices;

create or replace view v_devices as
    select
    	d.id, 
    	d.name,
    	dt.name as type
    from devices as d
        join device_types as dt on dt.id = d.type_id;