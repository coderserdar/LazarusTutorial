program defaultparam;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };


function SumAll(a, b: Integer; c: Integer = 0; d: Integer = 0): Integer;
begin
  result:= a + b + c + d;
end;

begin
  Writeln(SumAll(1, 2));
  Writeln(SumAll(1, 2, 3));
  Writeln(SumAll(1, 2, 3, 4));
  Write('Press enter key to close');
  Readln;
end.

