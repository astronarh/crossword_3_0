DROP TABLE IF EXISTS cell;
CREATE TABLE cell (
  id               INT AUTO_INCREMENT,   -- id
  letter           VARCHAR(1),           -- символ
  arrow            INT,                  -- номер стрелки
  question         VARCHAR(256),         -- вопрос
  theLetter        BOOLEAN,              -- ячейка символ
  theArrow         BOOLEAN,              -- ячейка стрелка
  theQuestion      BOOLEAN,              -- ячейка вопрос
  PRIMARY KEY (id)
);
insert into cell(letter, arrow, question, theLetter, theArrow, theQuestion) values(' ',0,' ',FALSE ,FALSE ,FALSE )