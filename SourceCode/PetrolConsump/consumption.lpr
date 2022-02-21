program PetrolConsumption;

{$mode objfpc}{$H+}


uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils
  { you can add units after this }, Test;



var
  Payment: Integer;
  Consumption: Integer;
  Kilos: Single;
begin
  Write('How much did you pay for your car''s petrol: ');
  Readln(Payment);
  Write('How much your car go in kilometters for one galon: ');
  Readln(Consumption);

  Kilos:= GetKilometers(Payment , Consumption);

  Writeln('This petrol will keep your car running for: ',
    Format('%0.1f', [Kilos]), ' Kilometters');
  Write('Press enter');
  Readln;
end.

