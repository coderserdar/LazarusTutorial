program MultTableWithForLoop;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };


var
  Marks: array [1 .. 10] of Integer;
  i: Integer;
  Max, Min: Integer;
begin

  for i:= 1 to 10 do
  begin
    Write('Input student number ', i, ' mark: ');
    Readln(Marks[i]);
  end;

  Max:= Marks[1];
  Min:= Marks[1];

  for i:= 1 to 10 do
  begin
    { Get if current Mark is maximum mark or not
      check if Mark is greater than Max then put
      it in Max }
    if Marks[i] > Max then
      Max:= Marks[i];

    (* Check if current value is minimum mark or not
       if Min is less than Mark then put Mark value in Min
    *)
    if Marks[i] < Min then
      Min:= Marks[i];

    Write('Student number ', i, ' mark is : ', Marks[i]);
    if Marks[i] >= 40 then
      Writeln(' Pass')
    else
      Writeln(' Fail');
  end;

  Writeln('Max mark is: ', Max);
  Writeln('Min mark is: ', Min);
  Writeln('Press enter key to close');
  Readln;
end.

