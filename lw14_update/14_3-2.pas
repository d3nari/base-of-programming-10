PROGRAM RecursiveSort(INPUT, OUTPUT);
VAR 
  Ch: CHAR;
PROCEDURE Split(VAR F1, F2, F3: TEXT);
VAR 
  Ch, Switch: CHAR;
BEGIN {Split}
  RESET(F1);
  REWRITE(F2);
  REWRITE(F3);  
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
  RESET(F3);
END; {Split}

PROCEDURE Merge(VAR F1, F2, F3: TEXT);
VAR 
  Ch2, Ch3: CHAR;
BEGIN {Merge}
  RESET(F2);
  RESET(F3);
  REWRITE(F1);
  READ(F2, Ch2);
  READ(F3, Ch3);
  WHILE (NOT EOLN(F2)) AND (NOT EOLN(F3))
  DO
    BEGIN
      IF Ch2 < CH3
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
  WHILE NOT EOLN(F2)
  DO
    BEGIN
      WRITE(F1, Ch2);
      READ(F2, Ch2);
    END;
  WHILE NOT EOLN(F3)
  DO
    BEGIN
      WRITE(F1, Ch3);
      READ(F3, Ch3);
    END;
  WRITELN(F1);
  RESET(F1);
END; {Merge}

PROCEDURE RecursSort(VAR F1: TEXT);
VAR 
  F2, F3: TEXT;
  Ch: CHAR;
BEGIN {RecursiveSort}
  RESET(F1);
  IF NOT EOLN(F1)
  THEN
    BEGIN
      IF NOT EOLN(F1)
      THEN {Файл имеет как минимум 2 символа}
        BEGIN
          Split(F1, F2, F3);
          RecursSort(F2);
          RecursSort(F3);  
          Merge(F1, F2, F3);
          WHILE NOT EOLN
          DO
            BEGIN
              READ(F1, Ch);
              WRITE(Ch)
            END  
        END
    END
END;   {RecursiveSort}

BEGIN
  RecursSort(INPUT);
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      WRITE(Ch)
    END 
END.
