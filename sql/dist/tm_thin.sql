drop table if exists tm_thin;
create table tm_thin
(
    Field        varchar(50) comment 'フィールド記号' not null ,
    MeteoNo      varchar(50) comment '隕石番号' not null ,
    Node         varchar(50) comment '世代ノード' not null ,
    Object_id    varchar(50) comment '#(隕石)/ID(薄片)' not null ,
    Updated_at   varchar(50) comment '最終更新日',
    Updated_by   varchar(50) comment '最終更新者',
    Weight       varchar(50) comment '質量',
    Worker       varchar(50) comment '作成者',
    SampForm     varchar(50) comment 'サンプル形態',
    PNickName    varchar(50) comment 'ニックネーム',
    SmpFormNo    varchar(50) comment 'サンプル形態番号',
    Comment01    varchar(50) comment 'コメント1',
    Comment02    varchar(50) comment 'コメント2',
    LastDate     varchar(50) comment '最終更新日',
    RegisterDate varchar(50) comment '登録日',
    primary key (Field, MeteoNo, Node, Object_id)
)