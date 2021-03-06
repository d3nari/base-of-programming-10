PROGRAM RecursiveSort(INPUT, OUTPUT);
VAR
  F: TEXT;

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
 
PROCEDURE Split(VAR F1, F2, F3: TEXT);
{????????? F1 ?? F2, F3}
VAR 
  Ch, Switch: CHAR;
BEGIN {Split}
  RESET(F1);
  REWRITE(F2);
  REWRITE(F3);
  {?????????? F1 ??????????? ? F2 ? F3}
  Switch := '2';
  WHILE NOT (EOLN(F1))
  DO
    BEGIN
      READ(F1, Ch);
      IF Switch = '2'
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
  WRITELN(F3);
  RESET(F2);
  RESET(F3)
END; {Split} 

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
    
  {?????????? ??????? F2 ? F1}
  WHILE NOT (EOLN(F2))
  DO
    BEGIN
      READ(F2, Ch2); 
      WRITE(F1, Ch2)          
    END;
      
  {?????????? ??????? F3 ? F1}
  WHILE NOT (EOLN(F3))
  DO
    BEGIN
      READ(F3, Ch3);
      WRITE(F1, Ch3)              
    END; 
    
  WRITELN(F1);
  RESET(F1);
  WRITE('Merge: ');
  CopyFile(F1, OUTPUT)
END; {Merge}

PROCEDURE RecursiveSort(VAR F1: TEXT);
VAR 
  F2, F3: TEXT;
  Ch: CHAR;
BEGIN {RecursiveSort}
  RESET(F1);
  IF NOT (EOLN(F1))
  THEN
    BEGIN
      READ(F1, Ch);
      IF NOT (EOLN(F1))
      THEN {???? ????? ??? ??????? 2 ???????}
        BEGIN
          RESET(F1);
          Split(F1, F2, F3);
          RecursiveSort(F2);    
          RecursiveSort(F3); 
          Merge(F1, F2, F3);
        END
    END
END;   {RecursiveSort}

BEGIN 
  REWRITE(F);
  CopyFile(INPUT, F);
  RecursiveSort(F);
  WRITELN('Recursive done!');
  RESET(F);
  CopyFile(F, OUTPUT);
END.
