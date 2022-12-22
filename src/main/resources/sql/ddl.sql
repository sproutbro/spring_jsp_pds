create table plan
(
    plan_id       int auto_increment
        primary key,
    plan_title    varchar(255)                         not null,
    plan_memo     varchar(1024)                        null,
    plan_reg_date datetime default current_timestamp() not null,
    plan_end_date datetime default current_timestamp() not null,
    username      varchar(255)                         null,
    plan_category varchar(255)                         null,
    plan_password varchar(255)                         null,
    plan_private  varchar(255)                         not null
);

create table do
(
    do_id    int auto_increment
        primary key,
    plan_id  int                                    not null,
    do_date  datetime   default current_timestamp() not null,
    do_state varchar(1) default 'N'                 not null,
    constraint do_FK
        foreign key (plan_id) references plan (plan_id)
);

create index plan_FK
    on plan (username);

create table reply
(
    reply_id        int auto_increment
        primary key,
    plan_id         int           not null,
    username        varchar(255)  null,
    reply_memo      varchar(1024) not null,
    reply_date      datetime      not null,
    replay_password varchar(255)  null,
    constraint reply_FK_1
        foreign key (plan_id) references plan (plan_id)
);

create index reply_FK
    on reply (username);

create table see
(
    see_id   int auto_increment
        primary key,
    do_id    int                              not null,
    see_memo varchar(1024)                    not null,
    see_date date default current_timestamp() not null,
    constraint see_FK
        foreign key (do_id) references do (do_id)
);

create table test
(
    id      int auto_increment
        primary key,
    title   varchar(255) null,
    content varchar(255) null
);

create table user
(
    username      varchar(255)                             not null
        primary key,
    password      varchar(255)                             not null,
    user_nickname varchar(255)                             null,
    user_reg_date datetime     default current_timestamp() null,
    user_role     varchar(255) default 'USER'              not null
);