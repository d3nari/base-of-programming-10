PROGRAM ReverseLine(INPUT, OUTPUT);
  
PROCEDURE Reverse(VAR InputFile, OutputFile: TEXT);
VAR
  Ch: CHAR;
BEGIN
  IF NOT EOLN(INPUT)
  THEN
    BEGIN
      READ(InputFile, Ch);
      Reverse(InputFile, OutputFile);
      WRITE(OutputFile, Ch)
    END  
END;

BEGIN
  Reverse(INPUT, OUTPUT);
  WRITELN
END. 
