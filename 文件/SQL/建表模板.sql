-- 表规范模板
create table xxx_xxx
(
    id          varchar(50)             not null comment 'ID' primary key,
    xxxx        varchar(200)            null comment 'xxx',
    del_flag    char        default '1' null comment '删除标志（0代表删除 1代表存在）',
    create_by   varchar(64) default ''  null comment '创建者',
    create_time datetime                null comment '创建时间',
    update_by   varchar(64) default ''  null comment '更新者',
    update_time datetime                null comment '更新时间',
    ext1        varchar(200)            null comment '扩展字段1',
    ext2        varchar(200)            null comment '扩展字段2',
    ext3        varchar(200)            null comment '扩展字段3',
    ext4        varchar(200)            null comment '扩展字段4',
    ext5        varchar(200)            null comment '扩展字段5',
    ext6        varchar(200)            null comment '扩展字段6',
    ext7        varchar(200)            null comment '扩展字段7',
    ext8        varchar(200)            null comment '扩展字段8',
    ext9        varchar(200)            null comment '扩展字段9',
    ext10       varchar(200)            null comment '扩展字段10'
) comment 'XXXX';
