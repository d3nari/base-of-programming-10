PROGRAM Copy(INPUT, OUTPUT);
  
PROCEDURE RCopy(VAR InputFile, OutputFile: TEXT);
VAR
  Ch: CHAR;
BEGIN
  IF NOT EOLN(INPUT)
  THEN
    BEGIN
      READ(InputFile, Ch);
      WRITE(OutputFile, Ch);
      RCopy(InputFile, OutputFile)
    END 
  ELSE
    WRITELN   
END;

BEGIN
  RCopy(INPUT, OUTPUT)
  
END. 
