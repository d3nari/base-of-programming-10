PROGRAM BubbleSort(INPUT, OUTPUT);
{Сортируем первую eeстроку INPUT в OUTPUT}
VAR
  Sorted, Ch, Ch1, Ch2: CHAR;
  F1, F2: TEXT;
BEGIN {BubbleSort}
  { Копируем INPUT в F1 }
  REWRITE(F1);
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(Ch);
      WRITE(F1, Ch);
    END;
  WRITELN(F1);
  
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO
    BEGIN 
      { Копируем F1 в F2,проверяя отсортированность и переставляя первые соседние символы по порядку}
      Sorted := 'Y';
      RESET(F1);
      REWRITE(F2);
      IF NOT EOLN(F1)
      THEN
        BEGIN
          READ(F1,Ch1);
          WHILE NOT EOLN(F1)
          DO { По крайней мере два символа остается для Ch1,Ch2} 
            BEGIN
              READ(F1, Ch2);
              {Выводим   min(Ch1,Ch2) в  F2, записывая отсортированные символы} 
              IF Ch1 <= Ch2
              THEN
                BEGIN
                  WRITE(F2, Ch1);
                  WRITELN('Min in ', Ch1, ' and ', Ch2, ' that ', Ch1);
                  Ch1 := Ch2
                END
              ELSE
                BEGIN
                  WRITE(F2, Ch2);
                  WRITELN('Min in ', Ch1, ' and ', Ch2, ' that ', Ch2);
                  {Sorted := 'N'}
                END;
            END;
          WRITELN(F2, Ch1) { Выводим последний символ в F2} 
        END;
      { Копируем F2 в F1} 
    END;
    
  { Копируем F1 в OUTPUT }
  RESET(F1);
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(OUTPUT, Ch);
    END;
  WRITELN(OUTPUT)

END. {BubbleSort}
