PROGRAM Stat(INPUT, OUTPUT);
VAR
  Base, Number, Max, Min, Sum, Count, Average, Av1, Av2: INTEGER;
  F1: TEXT;

PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
VAR
  Ch: CHAR;
BEGIN
  D := -1;
  IF NOT EOLN(F)
  THEN
    BEGIN
      READ(F, Ch);
      IF Ch = '0' THEN D := 0 ELSE
      IF Ch = '1' THEN D := 1 ELSE
      IF Ch = '2' THEN D := 2 ELSE
      IF Ch = '3' THEN D := 3 ELSE
      IF Ch = '4' THEN D := 4 ELSE
      IF Ch = '5' THEN D := 5 ELSE
      IF Ch = '6' THEN D := 6 ELSE
      IF Ch = '7' THEN D := 7 ELSE
      IF Ch = '8' THEN D := 8 ELSE
      IF Ch = '9' THEN D := 9    
    END
END; 
  
PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);
VAR
  Ch: CHAR;
  X: INTEGER;
BEGIN
  N := 0; 
  ReadDigit(F, X);
  WHILE (N <> -1) AND (X <> -1) 
  DO     
    IF N <= (MAXINT - X) DIV 10
    THEN 
      BEGIN
        N := N * Base + X;
        ReadDigit(F, X)
      END   
    ELSE
      N := -1                         
END; 

BEGIN
  Max := 0;
  Min := 0;
  Sum := 0;
  Count := 0;
  Base := 10;
  
  IF NOT EOLN
  THEN
    BEGIN
      ReadNumber(INPUT, Number);
      READLN(INPUT);
      Sum := Sum + Number;
       Count := Count + 1;
      Max := Number;
      Min := Number 
    END;  
   
  WHILE (NOT EOF(INPUT)) AND (Number <> -1)
  DO
    BEGIN
      ReadNumber(INPUT, Number);
      IF Number > Max
      THEN
        Max := Number;
      IF Number < Min 
      THEN
        Min := Number; 
      
      IF (MAXINT - Number) >= Sum
      THEN
        Sum := Sum + Number
      ELSE
        Number := -1;
          
      Count := Count + 1;  
         
      IF EOLN(INPUT)
      THEN
        READLN(INPUT)
    END;
    
    Average := Sum DIV Count;
    
    Av1 := ((Sum MOD Count) * Base) DIV Count;
    Av2 := ((((Sum MOD Count) * Base) MOD Count) * Base) DIV Count;  
    
    IF Number = -1
    THEN
      WRITELN('Ошибка! Произошло переполнение')
    ELSE
      BEGIN
        WRITELN('Минимальное число - ', Min);      
        WRITELN('Максимальное число - ', Max);
        WRITELN('Среднее арифметическое - ', Average, ',', Av1, Av2)
      END;
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
END.

 
