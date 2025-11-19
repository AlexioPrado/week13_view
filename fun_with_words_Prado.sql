
--View 1
CREATE OR REPLACE VIEW WORD_REL (word, syn_col, ant_col) AS
SELECT s.word_term, s.syn_word, a.ant_word
FROM WORD_SYNONYMS s, WORD_ANTONYMS a
WHERE a.word_id = s.word_id;
SELECT * FROM WORD_REL;

--View 2
CREATE OR REPLACE VIEW WORD_ANALYSIS (word, syn_col, ant_col, word_length) AS
SELECT word, syn_col, ant_col, LENGTH(word)
FROM WORD_REL;
SELECT * FROM WORD_ANALYSIS;

--View 3
CREATE OR REPLACE VIEW WORD_SUMMARY (word, syn_col, ant_col) AS
SELECT word, syn_col, ant_col
FROM WORD_REL;
SELECT * FROM WORD_SUMMARY;

--Verify all views
SELECT view_name FROM user_views;


--1
SELECT * FROM WORD_REL;

--2
UPDATE WORD_REL
SET SYN_COL = 'blithe'
WHERE WORD = 'insouciant';

--3
CREATE OR REPLACE VIEW WORD_REL (word, syn_col, ant_col) AS
SELECT s.word_term, s.syn_word, a.ant_word
FROM WORD_SYNONYMS s, WORD_ANTONYMS a
WHERE a.word_id = s.word_id
WITH READ ONLY;

/*
Error at line 3/7: ORA-42399: cannot perform a DML operation on a read-only view

1. UPDATE WORD_REL
2. SET SYN_COL = 'blithe'
3. WHERE WORD = 'insouciant';

*/

--4
SELECT WORD, WORD_LENGTH
FROM WORD_ANALYSIS;

--5
SELECT WORD, SYN_COL
FROM (SELECT WORD, SYN_COL
      FROM WORD_ANALYSIS
      ORDER BY WORD_LENGTH DESC)
WHERE ROWNUM <=2;

--6
DROP VIEW WORD_REL;

CREATE OR REPLACE VIEW WORD_REL (word, syn_col, ant_col) AS
SELECT s.word_term, s.syn_word, a.ant_word
FROM WORD_SYNONYMS s, WORD_ANTONYMS a
WHERE a.word_id = s.word_id;

--7
SELECT * FROM WORD_SUMMARY;

--8
CREATE OR REPLACE VIEW HOMONYMS_VIEW (word_term, meaning) AS
SELECT WORD_TERM, MEANING
FROM HOMONYMS;

SELECT * FROM HOMONYMS_VIEW;