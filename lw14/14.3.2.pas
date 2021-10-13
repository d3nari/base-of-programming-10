PROGRAM RecursiveSort(INPUT, OUTPUT);
VAR
  F2, F3: TEXT;
 
PROCEDURE Split(VAR F1, F2, F3: TEXT);
{Разбивает F1 на F2, F3}
VAR 
  Ch, Switch: CHAR;
BEGIN {Split}
  RESET(F1);
  REWRITE(F2);
  REWRITE(F3);
  {Копировать F1 попеременно в F2 и F3}
  Switch := '2';
  WHILE NOT (EOLN(F1))
  DO
    BEGIN
      READ(F1, Ch);
      IF (Switch = '2')
      THEN
        BEGIN
          WRITE(F2, Ch);
          Switch := '3';
        END
      ELSE
        BEGIN
          WRITE(F3, Ch);
          Switch := '2';
        END
    END;
  WRITELN(F2);
  WRITELN(F3)
END; {Split} 

PROCEDURE CopyFile(VAR InputFile, OutputFile: TEXT);
VAR
  Ch: CHAR;
BEGIN
  WHILE NOT EOLN(InputFile)
  DO
    BEGIN
      READ(InputFile, Ch);
      WRITE(OutputFile, Ch)
    END;
  WRITELN(OutputFile)  
END;

PROCEDURE Merge(VAR F1, F2, F3: TEXT);
VAR 
  Ch2, Ch3, A: CHAR;

BEGIN {Merge}
  RESET(F2);
  RESET(F3);
  REWRITE(F1);
  
  READ(F2, Ch2);
  READ(F3, Ch3);   
    
  WHILE (NOT(EOLN(F2))) AND (NOT(EOLN(F3)))
  DO
    BEGIN
      IF Ch2 < Ch3
      THEN 
        BEGIN
          WRITE(F1, Ch2);
          READ(F2, Ch2);
        END
      ELSE
        BEGIN
          WRITE(F1, Ch3);
          READ(F3, Ch3);
        END
    END; 


  IF EOLN(F2) AND EOLN(F3)
  THEN
    IF Ch2 > Ch3
    THEN
      BEGIN
        WRITE(F1, Ch3);
        WRITE(F1, Ch2)
      END 
    ELSE
      BEGIN
        WRITE(F1, Ch2);
        WRITE(F1, Ch3)
      END
     
  ELSE
  
    IF EOLN(F2)
    THEN
      IF Ch2 > Ch3
      THEN
        BEGIN 
          WRITE(F1, Ch3);
          READ(F3, Ch3);   
          IF Ch2 > Ch3
          THEN
            BEGIN
              WRITE(F1, Ch3);
              WRITE(F1, Ch2)               
            END
          ELSE
            BEGIN
              WRITE(F1, Ch2);
              WRITE(F1, Ch3)
            END    
        END
      ELSE  
        BEGIN
          WRITE(F1, Ch2); 
          WRITE(F1, Ch3) 
        END
    ELSE  
      IF EOLN(F3)
      THEN
        IF Ch3 > Ch2
        THEN
          BEGIN
            WRITE(F1, Ch2);
            READ(F2, Ch2);    
            IF Ch3 > Ch2
            THEN
              BEGIN
                WRITE(F1, Ch2);
                WRITE(F1, Ch3)               
              END
            ELSE
              BEGIN
                WRITE(F1, Ch3);
                WRITE(F1, Ch2)
              END    
          END
      ELSE  
        BEGIN
          WRITE(F1, Ch3); 
          WRITE(F1, Ch2) 
        END;    
    
  {Копировать остаток F2 в F1}
  WHILE NOT (EOLN(F2))
  DO
    BEGIN
      READ(F2, Ch2); 
      WRITE(F1, Ch2)          
    END;
      
  {Копировать остаток F3 в F1}
  WHILE NOT (EOLN(F3))
  DO
    BEGIN
      READ(F3, Ch3);
      WRITE(F1, Ch3)              
    END; 
    
  WRITELN(F1);
  RESET(F1);
  CopyFile(F1, OUTPUT)
END; {Merge}

 
BEGIN
  Split(INPUT, F2, F3);
  Merge(OUTPUT, F2, F3) 
END.
