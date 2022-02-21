program sum;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };


function Sum(x, y: Integer): Integer; overload;
begin
  Result:= x + y;
end;

function Sum(x, y: Double): Double; overload;
begin
  Result:= x + y;
end;

var
  j, i: Integer;
  h, g: Double;
begin
  j:= 15;
  i:= 20;
  Writeln(J, ' + ', I, ' = ', Sum(j, i));

  h:= 2.5;
  g:= 7.12;
  Writeln(H, ' + ', G, ' = ', Sum(h, g));

  Write('Press enter key to close');
  Readln;

end.

