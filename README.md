# [Excel VBA] appSpecDef : 設計書から設計情報をJSON形式で抽出するツール

## overveiw :

- Excelで作成した表形式の設計書や仕様書から、設計情報を抽出する設計補助ツール(VBA Excel)。
- 設計書や仕様書のセルや表から取得する値を、マッピング表(_mapXXX.xlsm)で定義し、その定義をもとに、マッピング定義jsonを生成する。マッピング表をもとに、設計情報を抽出する。  
    - マッピング定義jsonは、マクロにより生成可能。

### 機能 :
- Excelにて、設計書・仕様書を作成し、指定フォルダ（input folder)に配置する。  
    + マッピング表より、マッピング定義(_mapXXX.def.json)を生成し、`DEF_FOLDER`に配置する。  

- メニューより、以下の機能を利用する。
    + 【Output JSON (TRANSFORM_DEF_VD)】変数定義書(Variable Design)から設計情報をJSON出力する（サンプル）。  
    + 【Output JSON (TRANSFORM_DEF_TD)】テーブル定義書(Table Design)から設計情報をJSON出力する（サンプル）。  
        - 【Output Table DDL(Postgres)】テーブル定義書からDDLを出力する（サンプル）
        - 【Output Django Model】テーブル定義書からDjango FrameworkのModelを出力する（サンプル）

- マッピング表より、マッピング定義を生成する。(_mapTableDesign.xlsm等）

## Installation :

- GitHubより、Cloneする。  
    + https://github.com/sakai-memoru/appSpecDef  

- 参照設定が必要。  

![referto](https://gyazo.com/7d30f2387e7818067fd7596a82e507e9.png) 


## Usage :
- アプリは以下。
    - アプリ本体  ：appSpecDef.xlsm  
        + Batch   : SpecDefMain.bas  
            + SpecDefModule.bas  
                - GetValueByDefinition
                - CreateDdl  
                - GenerateDjangoModelCode  
  - アプリconfig：config.json  
  - 取得マッピング定義form：  
      + forms/_mapTableDesign.xlsm  Table設計書用Sample  
      + forms/_mapVariableDesign.xlsm  Variable設計書用Sample  
          - TransSpecMain.bas  
              + Batch - GetDefinition
              + Dump  - GetData 

- appSpecDef.xlsmを開く。Menuより起動する。 

![menu](https://gyazo.com/583ef3cb38a37a6efcca067aca669127.png)  



### 初期コンフィグ設定 :
   
```
{
    "BASE_FOLDER": "",
    "INPUT_FOLDER": "input",
    "OUTPUT_FOLDER": "output",
    "TEMP_FOLDER": "input/temp",
    "BACKUP_FOLDER": "input/backup",
    "FORM_FOLDER": "forms",
    "DEF_FOLDER": "defs",
    "TRANSFORM_DEF_VD": {
        "SHEET_TYPE": "DEFINITION",
        "MACRO_GET_METHOD": "GetValueByDefinition",
        "INPUT_LIKE": "SSE_VD*.xlsx",
        "DEF_FILE": "_mapVariableDesign_200622114915.def.json"
    },
    "TRANSFORM_DEF_TD": {
        "SHEET_TYPE": "DEFINITION",
        "MACRO_GET_METHOD": "GetValueByDefinition",
        "INPUT_LIKE": "SSE_TD*.xlsx",
        "DEF_FILE": "_mapTableDesign_200622114846.def.json"
    },
    "CONTROL_PREFIX": "__",
    "SOURCE_FROM": "_source",
    "APP_NAME" : "appSpecDef"
}
```
### Environment

![env](https://gyazo.com/fadab95b24c0b0b118cfb38efe07bd25.png)


## Execution sample

- マッピング定義 : forms/_mapTableDesign.xlsm  
![map](https://gyazo.com/01b892d861cdf309cb2767a62682a48b.png)  

- テーブル定義書：input/SSE_TD_Jobs.xlsx  
![spec](https://gyazo.com/c625d31d01b922584cc737401ab3fbb5.png)
  
- 出力例  
```sql
CREATE TABLE Jobs (
  id serial NOT NULL ,
  seq_id numeric NOT NULL ,
  job_name varchar(2000) NOT NULL ,
  contents text  ,
  sites varchar(2000)  ,
    :
    :
  deleted_user_id varchar(20)  ,
PRIMARY KEY(id) )
COMMENT ON COLUMN Jobs.seq_id IS '内部ID' ;
COMMENT ON COLUMN Jobs.job_name IS '案件名' ;
COMMENT ON COLUMN Jobs.contents IS '案件概要' ;
COMMENT ON COLUMN Jobs.sites IS '勤務地' ;
    :
    :
COMMENT ON COLUMN Jobs.deleted_user_id IS '削除者' ;

```

## application I/F
```vb
'''' **********************************************
'' @file SpecDefMain.bas
'' @parent appSpecDef.xlsm
''

Public Function Batch( _
        ByVal datatype As String, _
        Optional ByVal ddlOn As Variant = False, _
        Optional ByVal codeOn As Variant = False, _
        Optional ByVal moveOn As Variant = False _
    ) As Variant
'''' **********************************************
'''' @function batch
'''' @param datatype {String} 処理データタイプ
''''        config.jsonのキー
''''                  "TRANSFORM_DEF_VD"
''''                  "TRANSFORM_DEF_TD"
'''' @param ddlOn  {Variant<boolean>}
'''' @param codeOn  {Variant<boolean>}
'''' @param moveOn  {Variant<boolean>}
''''            Inputファイル移動flag
''
```
## note :
- 落ち着いたら、もう少し記述を追加します。  

## reference :

- 以下の外部ライブラリを使用しています。  
  + VBA-JSON : JsonConverter.bas  
    - https://github.com/VBA-tools/VBA-JSON  
  + MiniTemplator  
    - https://www.source-code.biz/MiniTemplator/  

// --- end of README.md