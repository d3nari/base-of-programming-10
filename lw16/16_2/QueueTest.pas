PROGRAM Count3UnitTest(INPUT, OUTPUT);
{Unit Test for the Count3}
USES Queue;

VAR 
  Ch: CHAR;

BEGIN
  EmptyQ;
  Ch := 'a';
  AddQ(Ch);
  AddQ(Ch);
  AddQ(Ch);
  AddQ(Ch);
  AddQ(Ch);
  HeadQ(Ch);
  WRITELN(Ch);
  WriteQ;
  EmptyQ;
  WriteQ;
END.
