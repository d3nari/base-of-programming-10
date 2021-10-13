PROGRAM SelectSort(INPUT, OUTPUT);
{—ортирует символы, предшествующие #, из INPUT в OUTPUT.
 ѕрограмма выдаст ошибку, если в INPUT отсутствует #}
VAR
  Ch, Min: CHAR;
  F1, F2: TEXT;
BEGIN {SelectSort}
  { опировать INPUT в F1 и эхо в OUTPUT}
  REWRITE(F1);
  READ(INPUT, Ch);
  WRITE(OUTPUT, 'INPUT DATA: ');
  WHILE Ch <> '#'
  DO
    BEGIN
      WRITE(F1, Ch);
      WRITE(OUTPUT, Ch);
      READ(INPUT, Ch)
    END;
  WRITELN(OUTPUT);
  WRITELN(F1, '#');
 
  {—ортировать F1 в OUTPUT, использу€ стратегию SelectSort}
  WRITE(OUTPUT, 'SORTED DATA: ');
  RESET(F1);
  READ(F1, Ch);
  WHILE Ch <> '#'
  DO { Ch <> С#Т и Ch1 Ц первый символ F1}
    BEGIN
      {¬ыбираем минимальный из F1 b копируем остаток F1 в F2}
      REWRITE(F2);
      Min := Ch;
      READ(F1, Ch);
      WHILE Ch <> '#'
      DO  { Ch <> С#Т и Ch1 Ц первый символ F1}
        BEGIN
          {¬ыбираем минимальный из (Ch, Min) копируем второй символ в F2} 
          IF Ch < Min
          THEN  {Ch Ц минимальный из (Ch, Min)}
            BEGIN
              WRITE(F2, Min);
              Min := Ch;	   
            END  
          ELSE  {Min Ц минимальный из (Ch, Min)}
            WRITE(F2, Ch);
          READ(F1, Ch)  
        END;
      WRITELN(F2, '#');
      WRITE(OUTPUT, Min);
      { опируем F2 в F1}
      RESET(F2);       
      REWRITE(F1);
      READ(F2, Ch);
      WHILE Ch <> '#'
      DO
        BEGIN
          WRITE(F1, Ch);
          READ(F2, Ch)  
        END; 
      WRITELN(F1, '#');
      RESET(F1);
      READ(F1, Ch)   
    END;
  WRITELN(OUTPUT); 
END. {SelectSort}
