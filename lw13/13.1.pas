PROGRAM BubbleSort(INPUT, OUTPUT);
VAR
  F1, F2: TEXT;
  Sorted, Ch1, Ch2: CHAR;

PROCEDURE CopyFile(VAR InputFile, OutputFile: TEXT);
VAR
  Ch: CHAR;
BEGIN
  WHILE NOT EOLN(InputFile)
  DO
    BEGIN
      READ(InputFile, Ch);
      WRITE(OutputFile, Ch)
    END;
  WRITELN(OutputFile)  
END;
  
BEGIN
  REWRITE(F1);
  CopyFile(INPUT, F1);
  
  
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO
    BEGIN 
      { �������� F1 � F2,�������� ����������������� � ����������� ������ �������� ������� �� �������}
      Sorted := 'Y';
      RESET(F1);
      REWRITE(F2);
      IF NOT EOLN(F1)
      THEN
        BEGIN
          READ(F1,Ch1);
          WHILE NOT EOLN(F1)
          DO { �� ������� ���� ��� ������� �������� ��� Ch1,Ch2 }
            BEGIN
              READ(F1, Ch2);
              {�������   min(Ch1,Ch2) �  F2, ��������� ��������������� ������� }
              IF Ch1 <= Ch2
              THEN
                BEGIN
                  WRITE(F2, Ch1);
                  Ch1 := Ch2
                END
              ELSE
                BEGIN
                  WRITE(F2, Ch2);
                  Sorted := 'N'
                END
            END;

          WRITELN(F2, Ch1); { ������� ��������� ������ � F2 }
    
          RESET(F2);
          REWRITE(F1);
          CopyFile(F2, F1) 
        END
    END;      
          
  RESET(F1);
  CopyFile(F1, OUTPUT)
  
END.  
