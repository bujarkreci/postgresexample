create table if not exists booking
(
    booking_id   bigint not null
        constraint booking_pkey
            primary key,
    booking_ref  text   not null
        constraint booking_booking_ref_key
            unique,
    booking_name text,
    account_id   integer
        constraint booking_account_id_fk
            references account,
    email        text   not null,
    phone        text   not null,
    update_ts    timestamp with time zone,
    price        numeric(7, 2)
);

alter table booking
    owner to postgres;

create index if not exists booking_account_id
    on booking (account_id);

