PROGRAM DeleteSpaces(INPUT, OUTPUT);
VAR
  Ch, State: CHAR;
BEGIN
  State := 'B'; //B - ����� ������ ����� � �������� ���� �������� ����� S - ����� ����� P - ��� ���������� ������� �������, ���� ��������� ������  - ������, �� ������� ��� ������� � ���� �����, ���� �����, �� ��������� � ��������� S
  WHILE NOT EOF
  DO
    BEGIN
      READ(Ch);

      IF (State = 'B') AND (Ch <> ' ')
      THEN  
        State := 'S';

      IF State = 'S'
      THEN
        BEGIN
          IF Ch = ' '
          THEN
            BEGIN
              State := 'F'
            END
          ELSE
            WRITE(Ch)
        END;

      IF State = 'F'
      THEN
        IF (Ch <> ' ') AND (NOT EOLN)
        THEN
          BEGIN
            WRITE(' ');
            WRITE(Ch);
            State := 'S'
          END;  

      IF (EOLN) AND (NOT EOF)
      THEN
        BEGIN
          State := 'B';
          WRITELN(OUTPUT);
          READLN(INPUT)
        END
    END;
END.
