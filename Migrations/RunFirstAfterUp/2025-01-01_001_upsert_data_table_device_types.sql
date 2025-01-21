insert into device_types(id, name, created_utc)
values
    ('static', 'static', now()),
    ('dynamic', 'dynamic', now()),
    ('runtime', 'runtime', now()),
    ('alias', 'alias', now()),
    ('command', 'command', now()),
    ('new', 'new', now())
on conflict (id)
do update set
    name = excluded.name,
    created_utc = excluded.created_utc;