PROGRAM SelectSort(INPUT, OUTPUT);
{Сортирует символы, предшествующие #, из INPUT в OUTPUT.
 Программа выдаст ошибку, если в INPUT отсутствует #}
VAR
  Ch, Min: CHAR;
  F1, F2: TEXT;
BEGIN {SelectSort}
  {Копировать INPUT в F1 и эхо в OUTPUT}
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
  
  {Проверка, выводим F1}
  WRITE(OUTPUT, 'F1: ');
  RESET(F1);
  READ(F1, Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      WRITE(OUTPUT, Ch);
      READ(F1, Ch)
    END;
    
  {Сортировать F1 в OUTPUT, используя стратегию SelectSort}
END. {SelectSort}
