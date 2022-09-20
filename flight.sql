create table if not exists flight
(
    flight_id           serial
        constraint flight_pkey
            primary key,
    flight_no           text                     not null,
    scheduled_departure timestamp with time zone not null,
    scheduled_arrival   timestamp with time zone not null,
    departure_airport   char(3)                  not null
        constraint arrival_airport_fk
            references airport
        constraint departure_airport_fk
            references airport,
    arrival_airport     char(3)                  not null,
    status              text                     not null,
    aircraft_code       char(3)                  not null
        constraint aircraft_code_fk
            references aircraft,
    actual_departure    timestamp with time zone,
    actual_arrival      timestamp with time zone,
    update_ts           timestamp with time zone
);

alter table flight
    owner to postgres;

create index if not exists flight_departure_airport
    on flight (departure_airport);

create index if not exists flight_scheduled_departure
    on flight (scheduled_departure);

create index if not exists flight_update_ts
    on flight (update_ts);

create index if not exists flight_arrival_airport
    on flight (arrival_airport);

create index if not exists flight_actual_departure
    on flight (actual_departure);

