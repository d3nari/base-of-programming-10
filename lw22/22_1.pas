PROGRAM Encryption(INPUT, OUTPUT);
{��������� ������� �� INPUT � ��� �������� Chiper 
  � �������� ����� ������� � OUTPUT}
CONST
  Len = 20;
TYPE
  Str = ARRAY [1 .. Len] OF ' ' .. 'Z' ;
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
  StrLength = 1 .. Len;
VAR
  Msg: Str;
  Code: Chiper;
  WordL: StrLength;
  I: INTEGER;

PROCEDURE Initialize(VAR Code: Chiper);
{��������� Code ���� ������}
BEGIN {Initialize}
  Code[' '] := '0';
  Code['A'] := 'Z';
  Code['B'] := 'Y';
  Code['C'] := 'X';
  Code['D'] := '#';
  Code['E'] := 'V';
  Code['F'] := 'U';
  Code['G'] := 'T';
  Code['H'] := 'S';
  Code['I'] := 'I';
  Code['J'] := 'Q';
  Code['K'] := 'P';
  Code['L'] := '!';
  Code['M'] := 'N';
  Code['N'] := 'M';
  Code['O'] := '2';
  Code['P'] := 'K';
  Code['Q'] := '$';
  Code['R'] := 'D';
  Code['S'] := 'H';
  Code['T'] := '*';
  Code['U'] := 'F';
  Code['V'] := 'E';
  Code['W'] := 'T';
  Code['X'] := 'C';
  Code['Y'] := 'B';
  Code['Z'] := 'A'
END;  {Initialize}

PROCEDURE Encode(VAR S: Str; WordL: StrLength);
{������� ������� �� Code, ��������������� �������� �� S}
VAR
  Index: 1 .. Len;
BEGIN {Encode}
  FOR Index := 1 TO WordL
  DO
    IF (S[Index] IN ['A' .. 'Z', ' '])
    THEN
      WRITE(Code[S[Index]])
    ELSE
      WRITE(S[Index]);
    WRITELN
END;  {Encode}

BEGIN {Encryption}
  {���������������� Code}
  Initialize(Code);
  WHILE NOT EOF
  DO
    BEGIN
      {������ ������ � Msg � ����������� ��}
      I := 0;
      WordL := 1;
      WHILE (NOT EOLN) AND (I < Len)
      DO
        BEGIN
          I := I + 1;
          READ(Msg[I]);
          WRITE(Msg[I]);
          WordL := WordL + 1;
        END;
      READLN;
      WRITELN; 
      {����������� ������������ ���������}
      IF WordL <> 1 
      THEN
        Encode(Msg, WordL)
    END
END.  {Encryption}





