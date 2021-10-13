PROGRAM IFSort3(INPUT, OUTPUT);
{Сортирует 3-строку из INPUT в OUTPUT}
VAR
  Ch1, Ch2, Ch3: CHAR;
BEGIN {IFSort3}
  READ(Ch1, Ch2, Ch3);
  WRITELN('Входные данные ', Ch1, Ch2, Ch3);
  WRITE('Cортированные данные ');
  {сортируем Ch1, Ch2, Ch3 в OUTPUT }
  IF Ch1 < Ch2
  THEN
    {Ch1 < Ch2:сортируем Ch1, Ch2, Ch3 в OUTPUT}
    IF Ch2 < Ch3
    THEN {Ch1 < Ch2 < Ch3:сортируем Ch1, Ch2, Ch3 в OUTPUT}
      WRITELN(Ch1, Ch2, Ch3)
    ELSE
      {Ch1 < Ch2, Ch3 <= Ch2:сортируем Ch1, Ch2, Ch3 в OUTPUT}
      IF Ch1 < Ch3
      THEN {Ch1 < Ch3 <= Ch2:сортируем Ch1, Ch2, Ch3 в OUTPUT}
        WRITELN(Ch1, Ch3, Ch2)
      ELSE {Ch3 <= Ch1 < Ch2:сортируем Ch1, Ch2, Ch3 в OUTPUT}
        WRITELN(Ch3, Ch1, Ch2)
  ELSE
    {Ch2 <= Ch1:сортируем Ch1, Ch2, Ch3 в OUTPUT}
    IF Ch1 < Ch3
    THEN {Ch2 <= Ch1 < Ch3:сортируем Ch1, Ch2, Ch3 в OUTPUT}
      WRITELN(Ch2, Ch1, Ch3)
    ELSE
      {Ch2 <= Ch1, Ch3 <= Ch1:сортируем Ch1, Ch2, Ch3 в OUTPUT}
      IF Ch2 < Ch3
      THEN {Ch2 < Ch3 <= Ch1:сортируем Ch1, Ch2, Ch3 в OUTPUT}
        WRITELN(Ch2, Ch3, Ch1)
      ELSE {Ch3 <= Ch2 <= Ch1:сортируем Ch1, Ch2, Ch3 в OUTPUT}
        WRITELN(Ch3, Ch2, Ch1)
END. {IFsort3}
