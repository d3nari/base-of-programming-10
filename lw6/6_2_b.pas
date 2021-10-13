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
      {Запись Ch в соответствии с Next, меням значение Next}
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
  WRITE(Evens, '#');

  {Вывод Odds в OUTPUT}
  RESET(Odds);
  READ(Odds, Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      WRITE(OUTPUT, Ch);
      READ(Odds, Ch)
    END;

  {Вывод Evens в OUTPUT}
  RESET(Evens);
  READ(Evens, Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      WRITE(OUTPUT, Ch);
      READ(Evens, Ch)
    END
END.
