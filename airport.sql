create table if not exists airport
(
    airport_code char(3) not null
        constraint airport_pkey
            primary key,
    airport_name text    not null,
    city         text    not null,
    airport_tz   text    not null,
    continent    text,
    iso_country  text,
    iso_region   text,
    intnl        boolean not null,
    update_ts    timestamp with time zone
);

alter table airport
    owner to postgres;

