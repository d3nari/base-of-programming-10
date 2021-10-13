PROGRAM SarahRevere (INPUT, OUTPUT);

PROCEDURE Init(VAR Letter1, Letter2, Letter3, Letter4: CHAR);
BEGIN
  Letter1 := ' ';
  Letter2 := ' ';
  Letter3 := ' ';
  Letter4 := ' '
END;

PROCEDURE WindowMovement(VAR Letter1, Letter2, Letter3, Letter4: CHAR);
BEGIN
  Letter1 := Letter2;
  Letter2 := Letter3;
  Letter3 := Letter4;
END;

PROCEDURE ReadNewLetter(VAR Letter4, State: CHAR; VAR InputFile: TEXT);
BEGIN
  IF NOT EOLN(InputFile)
  THEN
    READ(Letter4)
  ELSE
    State := 'N'
END;

PROCEDURE FindLand(VAR Letter1, Letter2, Letter3, Letter4, State: CHAR);
BEGIN
  IF (Letter1 = 'l') AND (Letter2 = 'a') AND (Letter3 = 'n') AND (Letter4 = 'd')
  THEN
    State := 'L'
END;

PROCEDURE FindSea(VAR Letter1, Letter2, Letter3, Letter4, State: CHAR);
BEGIN
  IF (Letter1 = 's') AND (Letter2 = 'e') AND (Letter3 = 'a')
  THEN
    State := 'S'
END;

PROCEDURE PrintWord(VAR State: CHAR);
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

PROCEDURE SaraRevere(VAR InputFile: TEXT);
VAR
  W1, W2, W3, W4, Looking: CHAR;
BEGIN
  Init(W1, W2, W3, W4);
  Looking := 'Y';
  WHILE Looking = 'Y'
  DO
    BEGIN
      WindowMovement(W1, W2, W3, W4);
      ReadNewLetter(W4, Looking, InputFile);
      FindSea(W1, W2, W3, W4, Looking);
      FindLand(W1, W2, W3, W4, Looking)
    END;
  PrintWord(Looking)
END;

BEGIN
  SaraRevere(INPUT)
END.
