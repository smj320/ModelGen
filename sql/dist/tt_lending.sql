drop table if exists tt_lending;
create table tt_lending
(
    Field      varchar(50) comment 'フィールド記号',
    MeteoNo    varchar(50) comment '隕石番号',
    Node       varchar(50) comment '世代ノード',
    Object_id  varchar(50) comment '#(隕石)/ID(薄片)',
    IssueDate  varchar(50) comment '貸出日',
    PlaceName  varchar(50) comment '貸出場所',
    PlaceSName varchar(50) comment '貸出場所詳細',
    PlanNo     varchar(50) comment 'プラン番号',
    SendNo     integer comment '送付番号',
    BWeight    float comment '貸出質量',
    ReturnDate varchar(50) comment '返却日',
    AWeight    float comment '返却重量',
    Comment01  varchar(50) comment 'コメント1',
    Comment02  varchar(50) comment 'コメント2'
);