CREATE TABLE Jobs (
  id serial NOT NULL ,
  seq_id numeric NOT NULL ,
  job_name varchar(2000) NOT NULL ,
  contents text  ,
  sites varchar(2000)  ,
  durings varchar(2000)  ,
  price numeric(9,2)  ,
  industry varchar(2000)  ,
  skill_required varchar(2000)  ,
  skill_recommended varchar(2000)  ,
  environment varchar(2000)  ,
  age varchar(2000)  ,
  can_accept_foreigner varchar(2000)  ,
  required_numbers varchar(2000)  ,
  counts_for_interview varchar(2000)  ,
  working_time varchar(2000)  ,
  average_work_hours varchar(2000)  ,
  organization varchar(2000)  ,
  commercial_flow varchar(2000)  ,
  payment_site varchar(2000)  ,
  settlement_to_overhours varchar(2000)  ,
  note text  ,
  file_name varchar(2000) NOT NULL ,
  del_flag varchar(6)  ,
  created_date timestamp NOT NULL ,
  created_user_id varchar(20) NOT NULL ,
  updated_date timestamp  ,
  updated_user_id varchar(20)  ,
  deleted_date timestamp  ,
  deleteed_user_id varchar(20)  ,
PRIMARY KEY(id) )
COMMENT ON COLUMN Jobs.seq_id IS '内部ID' ;
COMMENT ON COLUMN Jobs.job_name IS '案件名' ;
COMMENT ON COLUMN Jobs.contents IS '案件概要' ;
COMMENT ON COLUMN Jobs.sites IS '勤務地' ;
COMMENT ON COLUMN Jobs.durings IS '作業期間' ;
COMMENT ON COLUMN Jobs.price IS '単価' ;
COMMENT ON COLUMN Jobs.industry IS '業界' ;
COMMENT ON COLUMN Jobs.skill_required IS 'スキル（必須条件）' ;
COMMENT ON COLUMN Jobs.skill_recommended IS 'スキル（推奨条件）' ;
COMMENT ON COLUMN Jobs.environment IS '開発環境' ;
COMMENT ON COLUMN Jobs.age IS '年齢制限' ;
COMMENT ON COLUMN Jobs.can_accept_foreigner IS '外国籍可否' ;
COMMENT ON COLUMN Jobs.required_numbers IS '募集人員' ;
COMMENT ON COLUMN Jobs.counts_for_interview IS '面談回数' ;
COMMENT ON COLUMN Jobs.working_time IS '就業時間' ;
COMMENT ON COLUMN Jobs.average_work_hours IS '平均稼働時間' ;
COMMENT ON COLUMN Jobs.organization IS '体制' ;
COMMENT ON COLUMN Jobs.commercial_flow IS '商流' ;
COMMENT ON COLUMN Jobs.payment_site IS '支払サイト' ;
COMMENT ON COLUMN Jobs.settlement_to_overhours IS '清算' ;
COMMENT ON COLUMN Jobs.note IS '備考' ;
COMMENT ON COLUMN Jobs.file_name IS 'メールデータ・ファイル名' ;
COMMENT ON COLUMN Jobs.del_flag IS '削除フラグ' ;
COMMENT ON COLUMN Jobs.created_date IS '作成日' ;
COMMENT ON COLUMN Jobs.created_user_id IS '作成者' ;
COMMENT ON COLUMN Jobs.updated_date IS '更新日' ;
COMMENT ON COLUMN Jobs.updated_user_id IS '更新者' ;
COMMENT ON COLUMN Jobs.deleted_date IS '削除日' ;
COMMENT ON COLUMN Jobs.deleteed_user_id IS '削除者' ;
