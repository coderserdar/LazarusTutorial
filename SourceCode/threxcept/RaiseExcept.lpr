program RaiseExcept;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils
  { you can add units after this };


var
  x: Integer;
begin
  Write('Please input a number from 1 to 10: ');
  Readln(X);
  try

    if (x < 1) or (x > 10) then  // rais exception
      raise exception.Create('X is out of range');
    Writeln(' X * 10 = ', x * 10);

  except
  on e: exception do  // Catch my exception
  begin
    Writeln('Error: ' + e.Message);
  end;
  end;
  Write('Press enter to close');
  Readln;

end.

