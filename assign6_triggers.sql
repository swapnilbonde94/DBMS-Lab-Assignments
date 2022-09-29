/*
CREATE TABLE lib_tab(book_name VARCHAR2(25),status VARCHAR2(15));
CREATE TABLE library_audit(date_modified DATE, book_name VARCHAR2(25),old_status VARCHAR(15),new_status VARCHAR2(15),action VARCHAR2(25));


INSERT INTO lib_tab VALUES('Attack on Titan','AVAILABLE');
INSERT INTO lib_tab VALUES('365 DAYS','UNAVAILABLE');
INSERT INTO lib_tab VALUES('Narcos','AVAILABLE');
INSERT INTO lib_tab VALUES('Fifty Shades','UNAVAILABLE');
INSERT INTO lib_tab VALUES('Breeze','AVAILABLE');
*/

CREATE OR REPLACE TRIGGER trigger_1 
AFTER UPDATE OR DELETE ON lib_tab FOR EACH ROW
ENABLE
	DECLARE
		aud_bookname lib_tab.book_name%TYPE;
	BEGIN
		IF UPDATING THEN
			aud_bookname := :OLD.book_name;
			dbms_output.put_line(:OLD.status);
			INSERT INTO library_audit VALUES (SYSDATE,aud_bookname,:OLD.status,:NEW.status,'UPDATE');
		ELSE
			dbms_output.put_line(:OLD.book_name||'deleting');
			INSERT INTO library_audit VALUES(SYSDATE,:OLD.book_name,:OLD.status,NULL,'DELETE');
		END IF;
	END;
/