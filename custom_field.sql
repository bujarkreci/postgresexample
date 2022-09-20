create table if not exists custom_field
(
    custom_field_id    serial
        constraint custom_field_pk
            primary key,
    passenger_id       integer,
    custom_field_name  text,
    custom_field_value text
);

alter table custom_field
    owner to postgres;

