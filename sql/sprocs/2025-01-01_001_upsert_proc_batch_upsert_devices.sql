create or replace procedure batch_upsert_devices(
    in devices_data json
)
language plpgsql as $$
declare
    device record;
begin
    for device in select * from json_to_recordset(devices_data) as (
        id varchar(255),
        name varchar(255),
        type_id varchar(255),
        deleted boolean
    )
    loop
        insert into devices (id, name, type_id, created_utc, updated_utc, deleted)
        values (device.id, device.name, device.type_id, now(), now(), coalesce(device.deleted, false))
        on conflict (id)
        do update set
            name = excluded.name,
            type_id = excluded.type_id,
            updated_utc = now(),
            deleted = excluded.deleted;
    end loop;
end;
$$;