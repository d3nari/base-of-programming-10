PROGRAM RecursiveSort(INPUT, OUTPUT);

PROCEDURE Split(VAR F1, F2, F3: TEXT);
VAR 
  Ch, Switch: CHAR;
BEGIN {Split}
  RESET(F1);
  REWRITE(F2);
  REWRITE(F3);  
  WRITELN('ONE'); 
  Switch := '2';

  WHILE NOT EOLN(F1)      {Копировать F1 попеременно в F2 и F3}
  DO
    BEGIN
      READ(F1, Ch);
      IF Switch = '2'
      THEN
        BEGIN
          WRITE(F2, Ch);
          Switch := '3';
          WRITELN('TWO');     
        END
      ELSE
        BEGIN
          WRITE(F3, Ch);
          Switch := '2';
          WRITELN('THREE');
        END
    END;
  WRITELN('FOUR');
  WRITELN(F2);
  WRITELN(F3);
  RESET(F2);
  RESET(F3);
END; {Split}


PROCEDURE RecursSort(VAR FILE1: TEXT);
VAR 
  FILE2, FILE3: TEXT;
  Ch: CHAR;
BEGIN {RecursiveSort}
  RESET(FILE1);
  IF NOT EOLN(FILE1)
  THEN
    BEGIN
      IF NOT EOLN(FILE1)
      THEN {Файл имеет как минимум 2 символа}
        BEGIN
          Split(FILE1, FILE2, FILE3);
          
          WHILE NOT EOLN(FILE2)
          DO
            BEGIN
              READ(FILE2, Ch);
              WRITE(Ch);
            END;
          WRITELN;
          WHILE NOT EOLN(FILE3)
          DO
            BEGIN
              READ(FILE3, Ch);
              WRITE(Ch);
            END;
          WRITELN;
          {RecursiveSort(F2);
          RecursiveSort(F3);  
          Merge(F1, F2, F3); }
        END
    END
END;   {RecursiveSort}

BEGIN
  RecursSort(INPUT);
END.
