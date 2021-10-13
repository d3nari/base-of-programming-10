PROGRAM WordsSort(INPUT, OUTPUT);
VAR
  F1, F2: TEXT;
  Ch, State, Auto: CHAR;
  St1, St2: STRING;

PROCEDURE Find_St1();
BEGIN
  WHILE NOT EOLN
  DO
    BEGIN
      READ(INPUT, Ch);
      IF NOT(Ch IN[',', ' ', ';', ':'])
      THEN
        St1 := St1 + Ch   
    END  
END;

PROCEDURE Copy_F2_F1();
VAR
  St: STRING;
BEGIN
  RESET(F2);
  REWRITE(F1);
  WHILE NOT(EOF(F2))
  DO
    BEGIN
      READLN(F2, St);
      WRITELN(F1, St)
    END;
  CLOSE(F2);
  CLOSE(F1);  
END;    
  
PROCEDURE Copy_F1_Output();
VAR
  St: STRING;
BEGIN
  RESET(F1);
  WHILE NOT(EOF(F1))
  DO
    BEGIN
      READLN(F1, St);
      WRITELN(OUTPUT, St)
    END;
  CLOSE(F1)
END;  

PROCEDURE Insert();

BEGIN
  State := 'F';
  WHILE NOT (EOF(F1))  
  DO
    BEGIN
      READLN(F1, St2);
      IF St1 < St2
      THEN
        WRITELN(F2, St2)
      ELSE
        BEGIN
          IF State = 'F'
          THEN
            WRITELN(F2, St1);
          WRITELN(F2, St2);
          State := 'T'  
        END;  
    
    END
      IF State = 'F'
      THEN  
        WRITELN(F2, St1)      
END;
  
BEGIN 
  WHILE NOT(EOF(INPUT))
  DO
    BEGIN
    
      WHILE (St1 = '') AND NOT(EOF(INPUT))
      DO
        Find_St1();
        
      RESET(F1);
      REWRITE(F2);
        
      Insert();
               
      CLOSE(F1);
      CLOSE(F2);   
      Copy_F2_F1();
      St1 := ''       
    END;
  Copy_F1_Output()        
END.

