PROGRAM PrintOfFive(INPUT, OUTPUT);
CONST
  MAX = 25;
  WIDTH = 5;

TYPE
  IntSet = SET OF 1..MAX*10;
VAR
  Ch: CHAR;
  Matrix, Letter: IntSet;
  LetterFile: TEXT; 
  WordLength, I: INTEGER;

  

PROCEDURE LoadLetter(Ch: CHAR);
VAR
  Symbol: CHAR;
  E: INTEGER;
BEGIN
  Symbol := ' ';
  Letter := [];
  RESET(LetterFile);
  WHILE (Ch <> Symbol) AND (NOT(EOF(LetterFile)))
  DO
    BEGIN
      READ(LetterFile, Symbol);       
      IF Ch = Symbol
      THEN
        BEGIN 
          WHILE NOT EOLN(LetterFile)
          DO
            BEGIN
              READ(LetterFile, E);
              Letter := Letter + [E]
            END
        END
      ELSE
        READLN(LetterFile)
    END;
    
  IF Symbol <> Ch
  THEN
    Letter := [1 .. MAX];   
END;

PROCEDURE LoadMatrix(VAR WordLength: INTEGER; VAR M: IntSet);
VAR
  I: INTEGER;
BEGIN
  FOR I := 1 TO MAX
  DO
    BEGIN
      IF I IN Letter
      THEN
        M := M + [I + WordLength]  
    END;
  WordLength := WordLength + MAX  
END;


PROCEDURE PrintMatrix();
VAR
  I, K, J, T: INTEGER;
BEGIN
  J := 0;
  T := 1;
  WHILE T <= 5
  DO
    BEGIN
      J := T * 5;
      WHILE J <= WordLength
      DO
        BEGIN
          FOR K := J - 4 TO J
          DO
            BEGIN
              IF K IN Matrix
              THEN
                WRITE('#')
              ELSE
                WRITE(' ')   
            END;
          WRITE(' ');  
          J := J + MAX 
        END; 
      WRITELN; 
      T := T + 1;            
    END 
END;


BEGIN
  ASSIGN(LetterFile, 'FileOfChars.txt');
  WRITELN('Введите вашу строку символов');
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      LoadLetter(Ch);
      LoadMatrix(WordLength, Matrix)
    END;
  WRITELN('Ваша матрица - ');
  PrintMatrix();     
END.

 
