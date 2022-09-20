create table if not exists aircraft
(
    model    text,
    range    numeric not null,
    class    integer not null,
    velocity numeric not null,
    code     text    not null
        constraint aircraft_pkey
            primary key
);

alter table aircraft
    owner to postgres;

