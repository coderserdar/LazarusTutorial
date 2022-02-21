program ShellSort;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };


procedure ShellS(var X: array of Integer);
var
  Done: Boolean;
  Jump, j, i: Integer;
  Temp: Integer;
begin
  Jump:= High(X);
  while (Jump > 0) do // Outer loop
  begin
    Jump:= Jump div 2;
    repeat         // Intermediate loop
      Done:= True;
      for j:= 0 to High(X) - Jump do // Inner loop
      begin
        i:= j + Jump;
        if X[j] > X[i] then // Swap
        begin
          Temp:= X[i];
          X[i]:= X[j];
          X[j]:= Temp;
          Done:= False;
        end;

      end; // inner loop
    until Done; // innermediate loop end
  end; // outer loop end
end;

var
  Numbers: array [0 .. 9] of Integer;
  i: Integer;

begin
  Writeln('Please input 10 random numbers');
  for i:= 0 to High(Numbers) do
  begin
    Write('#', i + 1, ': ');
    Readln(Numbers[i]);
  end;

  ShellS(Numbers);
  Writeln;
  Writeln('Numbers after Selection sort: ');

  for i:= 0 to High(Numbers) do
  begin
    Writeln(Numbers[i]);
  end;
  Write('Press enterkey to close');
  Readln;
end.

