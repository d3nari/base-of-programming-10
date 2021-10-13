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


BEGIN
  Split(INPUT, F2, F3);
  RESET(F2);
  CopyFile(F2, OUTPUT);
  RESET(F3);
  CopyFile(F3, OUTPUT)
END.
