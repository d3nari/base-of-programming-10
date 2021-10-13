PROGRAM ReverseFile(INPUT, OUTPUT);

PROCEDURE Reverse(VAR OutFile, InFile: TEXT);
VAR
  Ch: CHAR;
BEGIN 
  IF NOT EOLN(OutFile)
  THEN
    BEGIN
      READ(OutFile, Ch);
      Reverse(OutFile, InFile);
      WRITE(InFile, Ch)
    END
END;

BEGIN
  Reverse(INPUT, OUTPUT);
  WRITELN
END.

