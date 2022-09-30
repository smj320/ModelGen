drop table if exists tm_property;
create table tm_property
(
    Field           varchar(50) comment 'フィールド記号' not null,
    MeteoNo         varchar(50) comment '隕石番号'    not null,
    Updated_at      varchar(100) comment '最終更新日',
    Updated_by      varchar(100) comment '最終更新者',
    MeteoType       varchar(100) comment 'MeteoType',
    MeteoName       varchar(100) comment 'MeteoName',
    CChemGrp        varchar(100) comment 'CChemGrp',
    CChemGrpTxt     varchar(100) comment 'CChemGrpTxt',
    SampNum         varchar(100) comment 'SampNum',
    PetroType       varchar(100) comment 'PetroType',
    LocalityE       varchar(100) comment 'LocalityE',
    PetroTypeTxt    varchar(100) comment 'PetroTypeTxt',
    LocalityS       varchar(100) comment 'LocalityS',
    PetroSubType    varchar(100) comment 'PetroSubType',
    FieldNo         varchar(100) comment 'FieldNo',
    PetroSubTypeTxt varchar(100) comment 'PetroSubTypeTxt',
    Weight          varchar(100) comment 'Weight',
    AClass          varchar(100) comment 'AClass',
    DimA            varchar(100) comment 'DimA',
    ASubClass       varchar(100) comment 'ASubClass',
    DimB            varchar(100) comment 'DimB',
    StrClass        varchar(100) comment 'StrClass',
    DimC            varchar(100) comment 'DimC',
    IChemGrp        varchar(100) comment 'IChemGrp',
    ThinSecNum      varchar(100) comment 'ThinSecNum',
    SClass          varchar(100) comment 'SClass',
    ThinSecSizeA    varchar(100) comment 'ThinSecSizeA',
    ClassPerson     varchar(100) comment 'ClassPerson',
    ThinSecSizeB    varchar(100) comment 'ThinSecSizeB',
    TentPair        varchar(100) comment 'TentPair',
    TentPairYes     varchar(200) comment 'TentPairYes',
    BulkComp        varchar(100) comment 'BulkComp',
    MDDegree        varchar(100) comment 'MDDegree',
    MDShape         varchar(100) comment 'MDShape',
    MDFusion        varchar(100) comment 'MDFusion',
    MDEvapo         varchar(100) comment 'MDEvapo',
    MDFrac          varchar(100) comment 'MDFrac',
    MDInterStr      varchar(100) comment 'MDInterStr',
    MDInterCol      varchar(100) comment 'MDInterCol',
    MDXeno          varchar(100) comment 'MDXeno',
    MCOAve          varchar(100) comment 'MCOAve',
    MCORange        varchar(100) comment 'MCORange',
    MCOPMD          varchar(100) comment 'MCOPMD',
    MCONo           varchar(100) comment 'MCONo',
    MCLAve          varchar(100) comment 'MCLAve',
    MCLRange        varchar(100) comment 'MCLRange',
    MCLPMD          varchar(100) comment 'MCLPMD',
    MCLNo           varchar(100) comment 'MCLNo',
    MCPAve          varchar(100) comment 'MCPAve',
    MCPRange        varchar(100) comment 'MCPRange',
    MCPPMD          varchar(100) comment 'MCPPMD',
    MCPNo           varchar(100) comment 'MCPNo',
    CGFine          varchar(100) comment 'CGFine',
    CGChon          varchar(100) comment 'CGChon',
    CGMajor01       varchar(100) comment 'CGMajor01',
    CGMajor02       varchar(100) comment 'CGMajor02',
    CGMajor03       varchar(100) comment 'CGMajor03',
    CGChem          varchar(100) comment 'CGChem',
    CGChemOther     varchar(100) comment 'CGChemOther',
    PTMeta          varchar(100) comment 'PTMeta',
    PTChon          varchar(100) comment 'PTChon',
    PTPetro         varchar(100) comment 'PTPetro',
    SEOlivine       varchar(100) comment 'SEOlivine',
    SECrack         varchar(100) comment 'SECrack',
    SEShock         varchar(100) comment 'SEShock',
    SEDegree        varchar(100) comment 'SEDegree',
    RegoBrec        varchar(100) comment 'RegoBrec',
    CAIAOI          varchar(100) comment 'CAIAOI',
    TWLimo          varchar(100) comment 'TWLimo',
    TWStain         varchar(100) comment 'TWStain',
    TWWeath         varchar(100) comment 'TWWeath',
    FusionCrust     varchar(100) comment 'FusionCrust',
    NoteDesc        text comment 'NoteDesc',
    Comment01       varchar(100) comment 'Comment',
    PRIMARY KEY (Field, MeteoNo)
)