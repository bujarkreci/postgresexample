create table if not exists booking_leg
(
    booking_leg_id serial
        constraint booking_leg_pkey
            primary key,
    booking_id     integer not null
        constraint booking_id_fk
            references booking,
    flight_id      integer not null
        constraint flight_id_fk
            references flight,
    leg_num        integer,
    is_returning   boolean,
    update_ts      timestamp with time zone
);

alter table booking_leg
    owner to postgres;

create index if not exists booking_leg_booking_id
    on booking_leg (booking_id);

create index if not exists booking_leg_update_ts
    on booking_leg (update_ts);

create index if not exists booking_leg_flight_id
    on booking_leg (flight_id);

