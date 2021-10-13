PROGRAM Paint(INPUT, OUTPUT);
CONST
  StrLength = 5;
  MaxLength = 25;
  CountLetters = 10;
  KolStr = 5;
TYPE
  TLetter = SET OF 0 .. MaxLength*10; 
VAR
  Ch, Let: CHAR;
  Letter, Matr: TLetter;    
  WordLength, I, K: INTEGER;
  LetterFile: TEXT;


PROCEDURE READLetter(Ch: CHAR);
VAR
  El: INTEGER;
BEGIN
  RESET(LetterFile);
  REPEAT
    IF NOT EOF(LetterFile)
    THEN
      READ(LetterFile, Let)
    ELSE
      Letter := [1 .. MaxLength];
        
    IF Ch = Let
    THEN
      BEGIN 
        WHILE NOT EOLN
        DO
          BEGIN
            READ(El);
            Letter := Letter + [El]
          END
      END
    ELSE
      READLN(LetterFile);
  UNTIL ((Ch = Let) AND (EOF(LetterFile)))
END;


PROCEDURE PrintWord(Matrix: TLetter; WordLength: INTEGER);
VAR
  I, J, K: INTEGER;
BEGIN
  K := 1;
  J := 1;
  WHILE J < MaxLength
  DO
    BEGIN
      K := J;
      WHILE K < WordLength
      DO
        BEGIN
          FOR I := K TO K + 4
          DO
            BEGIN
              IF I IN Matrix
              THEN
                WRITE('#')
              ELSE
                WRITE(' ')
            END;
          WRITE('  ');
          K := K + MaxLength
        END;
      WRITELN;
      J := J + StrLength
    END
END;

BEGIN
  ASSIGN(LetterFile, 'Letters.TXT');
  WordLength := 0;
  Matr := [];
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      READLetter(Ch);
      FOR I := 1 TO MaxLength
      DO
        BEGIN
          IF I IN Letter
          THEN
            BEGIN
              K := I + WordLength;
              Matr := Matr+[I + WordLength];
            END
        END;
        WordLength := WordLength + MaxLength;
    END;
  PrintWord(Matr, WordLength);
  WRITELN
END.

