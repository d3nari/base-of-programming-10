PROGRAM SelectSort(INPUT, OUTPUT);
{��������� �������, �������������� #, �� INPUT � OUTPUT.
 ��������� ������ ������, ���� � INPUT ����������� #}
VAR
  Ch, Min: CHAR;
  F1, F2: TEXT;
BEGIN {SelectSort}
  {���������� INPUT � F1 � ��� � OUTPUT}
  REWRITE(F1);
  READ(INPUT, Ch);
  WRITE(OUTPUT, 'OUTPUT: ');
  WHILE Ch <> '#'
  DO
    BEGIN
      WRITE(F1, Ch);
      WRITE(OUTPUT, Ch);
      READ(INPUT, Ch)
    END;
  WRITELN(OUTPUT);
  WRITELN(F1, '#'); 
  
  {��������, ������� F1}
  WRITE(OUTPUT, 'F1: ');
  RESET(F1);
  READ(F1, Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      WRITE(OUTPUT, Ch);
      READ(F1, Ch)
    END;
    
  {����������� F1 � OUTPUT, ��������� ��������� SelectSort}
END. {SelectSort}
