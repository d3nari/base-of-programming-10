UNIT ReadWord;

INTERFACE

VAR
  InputFile: TEXT;
   
FUNCTION ReadWordFunc(VAR InputFile: TEXT): STRING;


IMPLEMENTATION

FUNCTION LowerRegisterFunc(Ch: CHAR): CHAR;
CONST
  Lowercase = 'abcdefghijklmnopqrstuvwxyzàáâãäå¸æçèéêëìíîïðñòóôõö÷øùúûüýþÿ';
  Uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÄÅ¨ÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞß';  

VAR
  I: INTEGER;
BEGIN
  IF Ch IN ['A'..'Z', 'À'..'ß']
  THEN
  BEGIN
    I := Pos(Ch, Uppercase);
    Ch := Copy(Lowercase, I) 
  END;
  LowerRegisterFunc := Ch
END;


FUNCTION DeleteHephenFunc(VAR Word: STRING): STRING;
VAR
  I: INTEGER;
  State, Ch: CHAR;
  EditWord: STRING;
BEGIN 
  EditWord := '';  
  State := 'B';
  FOR I := 1 TO LENGTH(Word)
  DO
    BEGIN
      Ch := COPY(Word, I, 1);
      IF (State = 'B') AND (Ch <> '-')
      THEN  
        State := 'S';

      IF State = 'S'
      THEN
        BEGIN
          IF Ch = '-'
          THEN
            BEGIN
              State := 'F'
            END
          ELSE
            EditWord := EditWord + Ch 
        END;

      IF State = 'F'
      THEN
        IF Ch <> '-'
        THEN
          BEGIN
            EditWord := EditWord + '-';
            EditWord := EditWord + Ch;
            State := 'S'
          END  
    END; 
  DeleteHephenFunc := EditWord
  
END;  
    
FUNCTION ReadWordFunc(VAR InputFile: TEXT): STRING;
CONST
  AcceptableValue = ['A'..'Z', 'a'..'z', 'À'..'ß', 'à'..'ÿ', '-']; 

VAR
  Ch: CHAR;
  Word: STRING;
BEGIN
  Word := '';  
  
  READ(InputFile, Ch);
  WHILE (Ch IN AcceptableValue) AND ((NOT EOF(InputFile)) OR (NOT EOLN(InputFile)))
  DO
    BEGIN
      Word := Word + LowerRegisterFunc(Ch);
      READ(InputFile, Ch)
    END;
  
  IF (Ch IN AcceptableValue) AND ((EOLN(InputFile)) OR (EOF(InputFile)))
  THEN 
    BEGIN
      Word := Word + LowerRegisterFunc(Ch)  
    END;
           
  ReadWordFunc := DeleteHephenFunc(Word);
END;

     
  

BEGIN

  ASSIGN(InputFile, 'Input.txt');
  RESET(InputFile);  
END.
