drop table if exists tm_meteorite;
create table tm_meteorite
(
    Field       varchar(50) comment 'フィールド記号' not null,
    MeteoNo     varchar(50) comment '隕石番号'    not null,
    Node        varchar(50) comment '世代ノード'   not null,
    Object_cd   varchar(50) comment '#(隕石)/ID(薄片)',
    Node_parent varchar(50) comment '親ノード',
    Generation  varchar(50) comment '世代',
    Updated_at  varchar(50) comment '最終更新日',
    Updated_by  varchar(50) comment '最終更新者',
    primary key (Field, MeteoNo, Node)
)