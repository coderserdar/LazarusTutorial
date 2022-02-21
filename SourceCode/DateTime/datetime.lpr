program DateTime;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes , SysUtils
  { you can add units after this };


var
  Year2010: TDateTime;
  Diff: Double;
begin
  Year2010:= EncodeDate(2010, 1, 1);
  Diff:= Abs(Now - Year2010);

  if Now < Year2010 then
    Writeln('Year 2010 is not coming yet, there are ',
      Format('%0.2f', [Diff]), ' days Remaining ')
  else
    Writeln('First day of January 2010 is passed by ',
      Format('%0.2f', [Diff]), ' Days');
  Write('Press enter key to close');
  Readln;
end.

