-- 1) Abra uma nova janela de script vazio no Oracle SQL Developer.

-- 2) Crie o primeiro programa em PL/SQL:

SET SERVEROUTPUT ON;
DECLARE
   v_ID NUMBER(5) := 1;
BEGIN 
   dbms_output.put_line(v_ID);
   v_ID := 2 ;
   dbms_output.put_line(v_ID);
END;

-- 3) Acompanhe as explicações dos vídeos da aula.