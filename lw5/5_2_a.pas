PROGRAM MinSort3 (INPUT,OUTPUT);
{������ 3-��ப� �� INPUT � OUTPUT }
VAR
  Ch1, Ch2, Ch3: CHAR;
BEGIN {MinSort3}
  READ(Ch1, Ch2, Ch3);
  WRITELN('�室�� ����� ', Ch1, Ch2, Ch3);
  WRITE('Min in Ch1, Ch2, Ch3 = ');

  {������ ������ �  OUTPUT, ��࠭��� ᮤ�ন��� � Ch1 and }
  IF Ch1 < Ch2
  THEN
    { ������ ������ �� Ch1, Ch3 �  OUTPUT, ��६����� Ch3 � Ch1,�᫨ ����室���}
    IF Ch1 < Ch3
    THEN
      BEGIN
        WRITELN(Ch1);
        Ch1 := Ch3
      END
    ELSE
      WRITELN(Ch3)
  ELSE
     { ������ ������ �� Ch2, Ch3 �  OUTPUT, ��६����� Ch3 � Ch2,�᫨ ����室���}
    IF Ch2 < Ch3
    THEN
      BEGIN
        WRITELN(Ch2);
        Ch2 := Ch3
      END
    ELSE
      WRITELN(Ch3);


  WRITELN('Ch1, Ch2 = ', Ch1, ', ', Ch2);

  { ����஢��� Ch1, Ch2 � OUTPUT }

END.{Minsort3}