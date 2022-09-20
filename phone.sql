create table if not exists phone
(
    phone_id      serial
        constraint phone_pkey
            primary key,
    account_id    integer
        constraint phone_account_id_fk
            references account,
    phone         text,
    phone_type    text,
    primary_phone boolean,
    update_ts     timestamp with time zone
);

alter table phone
    owner to postgres;

