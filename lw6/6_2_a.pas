PROGRAM Split(INPUT, OUTPUT);
VAR
  Ch, Next: CHAR;
  Odds, Evens: TEXT;
BEGIN
  {Разбить INPUT на Odds и Evens}
  ASSIGN(Odds, 'H:\tests\odds.txt');
  ASSIGN(Evens, 'H:\tests\evens.txt');
  REWRITE(Odds);
  REWRITE(Evens);
  Next := 'O';
  READ(INPUT, Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      {Запись Ch в соответствии с Next, менем значение Next}
      WRITE('Next = ', Next, ' ');
      WRITELN(Ch);
      IF Next = 'O'
      THEN
        BEGIN
          WRITE(Odds, Ch);
          Next := 'E'
        END
      ELSE
        BEGIN
          WRITE(Evens, Ch);
          Next := 'O'
        END;
      READ(INPUT, Ch)
    END;
  WRITE(Odds, '#');
  WRITE(Evens, '#')
  {Вывести Odds в OUTPUT}
  {Вывести Evens в OUTPUT}
END.
