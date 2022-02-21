program smSortlpi;   // Stuents mark sort

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };


procedure BubleSort(var X: array of Integer);
var
  Temp: Integer;
  i: Integer;
  Changed: Boolean;
begin
  repeat
    Changed:= False;
    for i:= 0 to High(X) - 1 do
      if X[i] > X[i + 1] then
      begin
        Temp:= X[i];
        X[i]:= X[i + 1];
        X[i + 1]:= Temp;
        Changed:= True;
      end;
  until not Changed;
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

  BubleSort(Numbers);
  Writeln;
  Writeln('Numbers after Buble sort: ');

  for i:= 0 to High(Numbers) do
  begin
    Writeln(Numbers[i]);
  end;
  Write('Press enterkey to close');
  Readln;
end.

