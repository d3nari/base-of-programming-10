PROGRAM PrintOfFive(INPUT, OUTPUT);
CONST
  MAX = 25;

TYPE
  IntSet = SET OF 1..MAX;

VAR
  Ch: CHAR;
  Matrix: IntSet; 

  

PROCEDURE LoadChar(VAR M: IntSet; VAR Symbol: CHAR);
BEGIN
  CASE Ch OF
    'S': M := [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 15, 20, 21, 22, 23, 24, 25];
    'Z': M := [1, 2, 3, 4, 5, 9, 13, 17, 21, 22, 23, 24, 25];
    'X': M := [1, 5, 7, 9, 13, 17, 19, 21, 25];
    'C': M := [1, 2, 3, 4, 5, 6, 11, 16, 21, 22, 23, 24, 25]
      ELSE
        M := [1..Max] 
  END
END;  
  
PROCEDURE PrintChar(VAR M: IntSet);
VAR
  I: INTEGER;
BEGIN
  WRITELN;
  
  FOR I := 1 TO MAX
  DO
    BEGIN
      IF I IN M
      THEN
        WRITE('X')
      ELSE
        WRITE(' ');
      IF I MOD 5 = 0
      THEN
        WRITELN   
         
    END
END;

BEGIN
  WRITELN('Введите ваш символ');
  READLN(Ch);
  LoadChar(Matrix, Ch);
  PrintChar(Matrix) 
END.

 
