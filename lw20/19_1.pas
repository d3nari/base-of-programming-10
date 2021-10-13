PROGRAM Prime(INPUT, OUTPUT);
CONST
  Max = 100;
TYPE 
  TSet = SET OF 2..Max;
VAR
  Sieve: TSet;
  X, O: INTEGER;
BEGIN
  Sieve := [2 .. Max];
  X := 2;
  
  WRITE('Простые числа - ');
  
  WHILE X < Max  
  DO
    BEGIN
      O := X;
      WRITE(O, ', ');
      WHILE O <= Max
      DO
        BEGIN
          IF O IN Sieve
          THEN
            Sieve := Sieve - [O];
          O := O + X                             
        END;
      WHILE NOT(X IN Sieve) AND (X <= Max)
      DO
        BEGIN
          X := X + 1
        END    
    END     
END.      
