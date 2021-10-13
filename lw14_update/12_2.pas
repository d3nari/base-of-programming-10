PROGRAM Copy(INPUT, OUTPUT);

PROCEDURE RCopy(VAR OutFile, InFile: TEXT);
VAR
  Ch: CHAR;
BEGIN 
  IF NOT EOLN(OutFile)
  THEN
    BEGIN
      READ(OutFile, Ch);
      WRITE(InFile, Ch);
      RCopy(OutFile, InFile)      
    END
  ELSE
    WRITELN(InFile)
END;

BEGIN
  RCopy(INPUT, OUTPUT);
END.
