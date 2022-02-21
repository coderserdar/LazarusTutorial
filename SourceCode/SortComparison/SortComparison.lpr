program SortComparison;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils;

//  Bubble sort

procedure BubbleSort(var X: array of Integer);
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


// Selection Sort

procedure SelectionSort(var X: array of Integer);
var
  i: Integer;
  j: Integer;
  SmallPos: Integer;
  Smallest: Integer;
begin
  for i:= 0 to High(X) -1 do // Outer loop
  begin
    SmallPos:= i;
    Smallest:= X[SmallPos];
    for j:= i + 1 to High(X) do // Inner loop
      if X[j] < Smallest then
      begin
        SmallPos:= j;
        Smallest:= X[SmallPos];
      end;
      X[SmallPos]:= X[i];
      X[i]:= Smallest;
  end;
end;

// Shell Sort

procedure ShellSort(var X: array of Integer);
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

// Randomize Data

procedure RandomizeData(var X: array of Integer);
var
  i: Integer;
begin
  Randomize;
  for i:= 0 to High(X) do
    X[i]:= Random(10000000);
end;

var
  Numbers: array [0 .. 59999] of Integer;
  i: Integer;
  StartTime: TDateTime;

begin

  Writeln('----------------- Full random data');
  RandomizeData(Numbers);
  StartTime:= Now;
  Writeln('Sorting.. Bubble');
  BubbleSort(Numbers);
  Writeln('Bubble sort tooks (mm:ss): ', FormatDateTime('nn:ss', Now - StartTime));
  Writeln;

  RandomizeData(Numbers);
  Writeln('Sorting.. Selection');
  StartTime:= Now;
  SelectionSort(Numbers);
  Writeln('Selection sort tooks (mm:ss): ', FormatDateTime('nn:ss', Now - StartTime));
  Writeln;

  RandomizeData(Numbers);
  Writeln('Sorting.. Shell');
  StartTime:= Now;
  ShellSort(Numbers);
  Writeln('Shell sort tooks (mm:ss): ', FormatDateTime('nn:ss', Now - StartTime));

  Writeln;
  Writeln('----------------- Nearly sorted data');
  Numbers[0]:= Random(10000);
  Numbers[High(Numbers)]:= Random(10000);
  StartTime:= Now;
  Writeln('Sorting.. Bubble');
  BubbleSort(Numbers);
  Writeln('Bubble sort tooks (mm:ss): ', FormatDateTime('nn:ss', Now - StartTime));
  Writeln;

  Numbers[0]:= Random(10000);
  Numbers[High(Numbers)]:= Random(10000);
  Writeln('Sorting.. Selection');
  StartTime:= Now;
  SelectionSort(Numbers);
  Writeln('Selection sort tooks (mm:ss): ', FormatDateTime('nn:ss', Now - StartTime));
  Writeln;

  Numbers[0]:= Random(10000);
  Numbers[High(Numbers)]:= Random(10000);
  Writeln('Sorting.. Shell');
  StartTime:= Now;
  ShellSort(Numbers);
  Writeln('Shell sort tooks (mm:ss): ', FormatDateTime('nn:ss', Now - StartTime));

  Write('Press enterkey to close');
  Readln;
end.

