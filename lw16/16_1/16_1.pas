PROGRAM CountReverse(INPUT, OUTPUT);
USES
  Count3;
VAR
  W1, W2, W3, V100, V10, V1: CHAR;
  
BEGIN{CountReverse}
  Start;
  
  IF NOT EOLN(INPUT)
  THEN
    READ(INPUT, W2);
    
  IF NOT EOLN(INPUT)
  THEN
    READ(INPUT, W3); 
  
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      W1 := W2;
      W2 := W3;
      READ(INPUT, W3);
      IF ((W2 > W1) AND (W2 > W3)) OR ((W2 < W1) AND (W2 < W3))
      THEN
        Bump
    END;
                                 
  Value(V100, V10, V1);
  WRITELN(V100, V10, V1)
END.{CountReverse}  
