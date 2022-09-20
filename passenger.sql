create table if not exists passenger
(
    passenger_id serial
        constraint passenger_pkey
            primary key,
    booking_id   integer not null
        constraint pass_booking_id_fk
            references booking,
    booking_ref  text,
    passenger_no integer,
    first_name   text    not null,
    last_name    text    not null,
    account_id   integer
        constraint pass_account_id_fk
            references account
        constraint pass_frequent_flyer_id_fk
            references account,
    update_ts    timestamp with time zone,
    age          integer
);

alter table passenger
    owner to postgres;

create index if not exists passenger_last_name
    on passenger (last_name);

create index if not exists passenger_last_name_lower_pattern
    on passenger (lower(last_name) text_pattern_ops);

create index if not exists passenger_booking_id
    on passenger (booking_id);

