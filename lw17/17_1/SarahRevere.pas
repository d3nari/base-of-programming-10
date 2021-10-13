PROGRAM SarahRevere(INPUT, OUTPUT); 
VAR
  W1, W2, W3, W4: CHAR;
  Land, Sea: BOOLEAN; 
 
BEGIN {SarahRevere}   
  {Инициализация}
  W1 := '';
  W2 := '';
  W3 := '';
  W4 := '';
  Land := FALSE;
  Sea := FALSE;
  WHILE NOT(EOLN) AND NOT(Land OR Sea)   
  DO
    BEGIN  
      {движение окна}
      W1 := W2;
      W2 := W3;
      W3 := W4;
      READ(W4);     
      {проверка окна на land}
      Land := (W1 = 'l') AND (W2 = 'a') AND (W3 = 'n') AND (W4 = 'd');   
      {проверка окна на sea}
      Sea := (W2 = 's') AND (W3 = 'e') AND (W4 = 'a')
    END;
  {создание сообщения Sarah}
  IF Land
  THEN
    WRITELN('The british are coming by land')
  ELSE
    IF Sea
    THEN
      WRITELN('The British are coming by sea')
    ELSE
      WRITELN('Sarah didnt say')    
END.  {SarahRevere} 

