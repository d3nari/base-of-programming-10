PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper 
  и печатает новые символы в OUTPUT}
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
  TextFile: TEXT;

PROCEDURE Initialize(VAR Code: Chiper);
{Присвоить Code шифр замены}
VAR
  Ch1, Ch2: CHAR;
BEGIN {Initialize}
  RESET(TextFile);
  WHILE NOT EOF(TextFile)
  DO
    BEGIN
      READ(TextFile, Ch1);
      WRITE(Ch1, ' ');
      READ(TextFile, Ch2);
      WRITELN(Ch2);
      IF (Ch1 IN ['A' .. 'Z', ' ']) AND (Ch2 IN ['A' .. 'Z', ' '])
      THEN
        Code[Ch1] := Ch2;
      IF NOT EOF(TextFile)
      THEN
        READLN(TextFile)
    END 
END;  {Initialize}

PROCEDURE Encode(VAR S: Str; WordL: StrLength);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: 1 .. Len;
BEGIN {Encode}
  FOR Index := 1 TO WordL - 1
  DO
    IF S[Index] IN ['A' .. 'Z', ' ']
    THEN
      WRITE(Code[S[Index]])
    ELSE
      WRITE(S[Index]);
    WRITELN
END;  {Encode}

BEGIN {Encryption}
  {Инициализировать Code}
  ASSIGN(TextFile, 'Key.txt');
  Initialize(Code);
  WHILE NOT EOF
  DO
    BEGIN
      {читать строку в Msg и распечатать ее}
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
      {распечатать кодированное сообщение}
      IF WordL <> 1 
      THEN
        Encode(Msg, WordL)
    END
END.  {Encryption}
