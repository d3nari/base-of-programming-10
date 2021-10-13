PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 2;
  ClassSize = 2;
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 1 .. NumberOfScores;
  Student: 1 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal, CountOfGroup, StudentsAll: INTEGER;
  
BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Enter the number of groups:');
  READLN(CountOfGroup);
  WRITELN('Student averages:');
  WHILE CountOfGroup <> 0
  DO
    BEGIN
      Student := 1;
      WHILE Student < ClassSize
      DO
        BEGIN
          TotalScore := 0;
          WhichScore := 1;
          WHILE WhichScore <= NumberOfScores
          DO
            BEGIN
              READ(NextScore);
              TotalScore := TotalScore + NextScore;
              WhichScore := WhichScore + 1
            END;

          READLN;
          TotalScore := TotalScore * 10; //?
          Ave := TotalScore DIV NumberOfScores;
          IF Ave MOD 10 >= 5
          THEN
            WRITE(Ave DIV 10 + 1)
          ELSE
            WRITE(Ave DIV 10);
        
          ClassTotal := ClassTotal + TotalScore;
          Student := Student + 1;
          StudentsAll := StudentsAll + 1
        END;
      CountOfGroup := CountOfGroup - 1     
    END;
  WRITELN;
  WRITELN ('Class average:');
  WRITELN(ClassTotal);
  ClassTotal := ClassTotal DIV (StudentsAll *NumberOfScores);
  WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10)

END. {AverageScore}
