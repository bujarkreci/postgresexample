create table if not exists account
(
    account_id        serial
        constraint account_pkey
            primary key,
    login             text not null,
    first_name        text not null,
    last_name         text not null,
    frequent_flyer_id integer
        constraint frequent_flyer_id_fk
            references frequent_flyer,
    update_ts         timestamp with time zone
);

alter table account
    owner to postgres;

create index if not exists account_last_name
    on account (last_name);

create index if not exists account_last_name_lower
    on account (lower(last_name));

create index if not exists account_last_name_lower_pattern
    on account (lower(last_name) text_pattern_ops);

create index if not exists account_login
    on account (login);

create index if not exists account_login_lower_pattern
    on account (lower(login) text_pattern_ops);

