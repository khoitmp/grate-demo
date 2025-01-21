create table if not exists system_settings
(
    key varchar(100) not null,
    value varchar(255) not null,
	created_utc timestamp without time zone not null default now(),
    updated_utc timestamp without time zone not null default now(),
	deleted boolean not null default false,
    constraint pk_system_settings primary key(key)
);