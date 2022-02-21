unit Test;

{$mode objfpc}{$H+}

interface


uses
  Classes, SysUtils; 

const
  GalonPrice = 6.5;

  function GetKilometers(Payment, Consumption: Integer): Single;


implementation


function GetKilometers(Payment, Consumption: Integer): Single;
begin
  Result:= (Payment / GalonPrice) * Consumption;
end;

end.

