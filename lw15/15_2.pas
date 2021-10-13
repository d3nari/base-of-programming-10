PROGRAM SarahRevere(INPUT, OUTPUT);

PROCEDURE Identificate(VAR Letter1, Letter2, Letter3, Letter4, State: CHAR);
BEGIN
  Letter1 := ' ';
  Letter2 := ' ';
  Letter3 := ' ';
  Letter4 := ' ';
  State := 'Y';
END;

PROCEDURE MoveWindow(VAR Letter1, Letter2, Letter3, Letter4, State: CHAR; VAR ReadFile: TEXT);
BEGIN        
  Letter1 := Letter2;
  Letter2 := Letter3;
  Letter3 := Letter4;
  IF NOT EOLN(ReadFile)
  THEN
    READ(Letter4)
  ELSE
    State := 'N';
END;

PROCEDURE SearchAnswer(VAR Letter1, Letter2, Letter3, Letter4, State: CHAR);
BEGIN
  IF (Letter1 = 'l') and (Letter2 = 'a') and (Letter3 = 'n') and (Letter4 = 'd')
  THEN
    State := 'L';
  IF (Letter2 = 's') and (Letter3 = 'e') and (Letter4 = 'a')
  THEN 
    State := 'S'
END;

PROCEDURE PrintAnswer(VAR State: CHAR);
BEGIN
  IF State = 'L'
    THEN
      WRITELN('The British are coming by land.')
    ELSE
      IF State = 'S'
      THEN
        WRITELN('The British are coming by sea.')
      ELSE
        WRITELN('Sarah didn''t say')
END;

PROCEDURE SarahRevere(VAR InFile: TEXT);
VAR
  W1, W2, W3, W4, Looking: CHAR;
BEGIN
  Identificate(W1, W2, W3, W4, Looking); 
  WHILE Looking = 'Y'
  DO
    BEGIN
      MoveWindow(W1, W2, W3, W4, Looking, InFile);
      SearchAnswer(W1, W2, W3, W4, Looking)
    END;
  PrintAnswer(Looking)
END;

BEGIN
  SarahRevere(INPUT);
END. 

