PROGRAM Less(INPUT, OUTPUT);
VAR
  Ch: CHAR;
BEGIN
  READ(Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      IF Ch <> ' '
      THEN
        WRITE(Ch);
      READ(Ch)
    END;
  WRITE(' - It is your text without spaces')
END.
