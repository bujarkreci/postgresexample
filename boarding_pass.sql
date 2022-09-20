create table if not exists boarding_pass
(
    pass_id        integer default nextval('postgres_air.boarding_pass_pass_id_seq'::regclass) not null
        constraint boarding_pass_pkey
            primary key,
    passenger_id   bigint
        constraint passenger_id_fk
            references passenger,
    booking_leg_id bigint
        constraint booking_leg_id_fk
            references booking_leg,
    seat           text,
    boarding_time  timestamp with time zone,
    precheck       boolean,
    update_ts      timestamp with time zone
);

alter table boarding_pass
    owner to postgres;

create index if not exists boarding_pass_booking_leg_id
    on boarding_pass (booking_leg_id);

create index if not exists boarding_pass_update_ts
    on boarding_pass (update_ts);

create index if not exists boarding_pass_passenger_id
    on boarding_pass (passenger_id);

