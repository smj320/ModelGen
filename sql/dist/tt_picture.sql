drop table if exists tt_picture;
create table tt_picture
(
    Field        varchar(50) comment 'フィールド記号',
    MeteoNo      varchar(50) comment '隕石番号',
    Node         varchar(50) comment '世代ノード',
    Object_id    varchar(50) comment '#(隕石)/ID(薄片)',
    Image_no     varchar(50) comment '画像番号',
    ImagePath    varchar(50) comment '画像パス',
    Updated_at   varchar(50) comment '最終更新日',
    Updated_by   varchar(50) comment '最終更新者',
    ImagePathOrg varchar(50) comment 'オリジナル画像パス'
)