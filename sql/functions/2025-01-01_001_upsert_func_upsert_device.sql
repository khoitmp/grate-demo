create or replace function upsert_device(
    p_id varchar(255),
    p_name varchar(255),
    p_type_id varchar(255),
    p_deleted boolean default false
)
returns text as $$
begin
    insert into devices (id, name, type_id, created_utc, updated_utc, deleted)
    values (p_id, p_name, p_type_id, now(), now(), p_deleted)
    on conflict (id)
    do update set
        name = excluded.name,
        type_id = excluded.type_id,
        updated_utc = now(),
        deleted = excluded.deleted;

    return 'Successful';
end;
$$ language plpgsql;