program Structured;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };


procedure Menu;
begin
  Writeln('Welcome to Pascal Resturant. Please select your order');
  Writeln('1 - Chicken      (10 Geneh)');
  Writeln('2 - Fish         (7 Geneh)');
  Writeln('3 - Meat         (8 Geneh)');
  Writeln('4 – Salad        (2 Geneh)');
  Writeln('5 - Orange Juice (1 Geneh)');
  Writeln('6 - Milk         (1 Geneh)');
  Writeln('X - nothing');
  Writeln;
end;

function GetOrder(AName: string; Minutes, Price: Integer): Integer;
begin
  Writeln('You have ordered: ', AName, ' this will take ',
    Minutes, ' minutes');
  Result:= Price;
end;

var
  Selection: Char;
  Price: Integer;
  Total: Integer;
begin
  Total:= 0;
  repeat
    Menu;
    Write('Please enter your selection: ');
    Readln(Selection);

    case Selection of
      '1': Price:= GetOrder('Checken', 15, 10);
      '2': Price:= GetOrder('Fish', 12, 7);
      '3': Price:= GetOrder('Meat', 18, 8);
      '4': Price:= GetOrder('Salad', 5, 2);
      '5': Price:= GetOrder('Orange juice', 2, 1);
      '6': Price:= GetOrder('Milk', 1, 1);
      'x', 'X': Writeln('Thanks');
      else
      begin
        Writeln('Wrong entry');
        Price:= 0;
      end;
    end;

    Total:= Total + Price;

  until (Selection = 'x') or (Selection = 'X');
  Writeln('Total price            = ', Total);
  Write('Press enter key to close');
  Readln;
end.

