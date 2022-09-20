create table if not exists frequent_flyer
(
    frequent_flyer_id serial
        constraint frequent_flyer_pkey
            primary key,
    first_name        text    not null,
    last_name         text    not null,
    title             text    not null,
    card_num          text    not null,
    level             integer not null,
    award_points      integer not null,
    email             text    not null,
    phone             text    not null,
    update_ts         timestamp with time zone
);

alter table frequent_flyer
    owner to postgres;

create index if not exists frequent_fl_last_name_lower_pattern
    on frequent_flyer (lower(last_name) text_pattern_ops);

create index if not exists frequent_fl_last_name_lower
    on frequent_flyer (lower(last_name));

