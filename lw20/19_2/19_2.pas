PROGRAM SortDate(INPUT, OUTPUT);
TYPE
  Month = (NoMonth, Jan, Feb, Mar, Apr, May, Jun,
                    Jul, Aug, Sep, Oct, Nov, Dec);
  DayNum = 1..31;
  Date   = RECORD
             Mo : Month;
             Day: DayNum
           END;
  FileOfDate = FILE OF Date;
VAR
  Copying: BOOLEAN;
  D, VarDate: Date;
  TFile, DateFile: FileOfDate;
  FInput: TEXT;

BEGIN{SortDate}
  ASSIGN(DateFile, 'DF.DAT');
  ASSIGN(TFile, 'TF.DAT');
  ASSIGN(FInput, 'FI.TXT');
  REWRITE(DateFile);
  RESET(FInput);
  ReadDate(FInput, VarDate);
  READLN(FInput);
  WRITE(DateFile, VarDate);
  RESET(DateFile);
  WHILE NOT EOF(FInput)
  DO
    {ѕоместить новую дату в DateFile в соответствующее место}
    BEGIN
      ReadDate(FInput,D);
      READLN(FInput);
      IF (D.Mo <> NoMonth)
      THEN
        BEGIN
          {копируем элементы меньшие,чем D из DateFile в TFile}
          {копируем D в TFile}
          WRITE(TFile, D);
          {копируем остаток DateFile в TFile}
          {копируем TFile в DateFile}
        END;
    END;

  { опируем DateFile в OUTPUT}
END.{SortDate}

