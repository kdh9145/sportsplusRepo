create database sportsplus;
use sportsplus;

DROP TABLE IF EXISTS article;
CREATE TABLE IF NOT EXISTS article(
  no INTEGER AUTO_INCREMENT PRIMARY KEY,
  category VARCHAR(50) NOT NULL,
  title VARCHAR(100) NOT NULL,
  thumbnail longtext,
  description longtext NOT NULL,
  content longtext NOT NULL,
  reg_date TIMESTAMP NOT NULL,
  modify_date TIMESTAMP NOT NULL,
  like_count INTEGER DEFAULT 0,
  hate_count INTEGER DEFAULT 0,
  read_count INTEGER DEFAULT 0,
  CONSTRAINT article_category_fk FOREIGN KEY (category) REFERENCES category(name)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS reply;
CREATE TABLE IF NOT EXISTS reply(
  no INTEGER AUTO_INCREMENT PRIMARY KEY,
  bbs_no integer not null,
  writer VARCHAR(10) NOT NULL,
  content VARCHAR(100) NOT NULL,
  reg_date TIMESTAMP NOT NULL,
  CONSTRAINT reply_bbsno_fk FOREIGN KEY(bbs_no) REFERENCES article(no),
  CONSTRAINT reply_writer_fk FOREIGN KEY (writer) REFERENCES member(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS member;
CREATE TABLE IF NOT EXISTS member(
  id VARCHAR(100) PRIMARY KEY,
  pass VARCHAR(100) NOT NULL,
  name VARCHAR(10) NOT NULL,
  email VARCHAR(100) NOT NULL,
  reg_date TIMESTAMP NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS category;
CREATE TABLE IF NOT EXISTS category(
  name VARCHAR(50) primary key
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
insert into category values('baseball');
insert into category values('worldBaseball');
insert into category values('football');
insert into category values('worldFootball');
insert into category values('basketball');
commit;

use sportsplus;
select * from article;
select * from reply;
select * from member;
commit;