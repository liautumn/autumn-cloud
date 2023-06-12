-- 表规范模板
create table xxx_xxx
(
    id          varchar(50)             not null comment 'ID' primary key,
    xxxx        varchar(30)             null comment 'xxx',
    del_flag    char        default '1' null comment '删除标志（0代表删除 1代表存在）',
    create_by   varchar(64) default ''  null comment '创建者',
    create_time datetime                null comment '创建时间',
    update_by   varchar(64) default ''  null comment '更新者',
    update_time datetime                null comment '更新时间'
) comment 'XXXX';
