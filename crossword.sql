DROP TABLE IF EXISTS crosswords;
CREATE TABLE crosswords (
  ID              INT AUTO_INCREMENT,   -- id
  ROW             INT,                  -- строк
  COLUMNS         INT,                  -- колонок
  IDBEGIN         INT,                  -- начало сканворда
  IDEND           INT,                  -- конец сканворда
  PRIMARY KEY (id)
);