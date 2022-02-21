unit intqueue;

// This unit contains TIntQueue class, which is inherits TQueue class and adds PutInt, GetInt methods to be used with Integer queue

{$mode objfpc}{$H+}

interface


uses
  Classes, SysUtils, Queue;

type

  { TIntQueue }

  TIntQueue = class(TQueue)

  public
    function PutInt(AValue: Integer): Integer;
    function GetInt(var AValue: Integer): Boolean;

  end;

implementation

{ TIntQueue }

function TIntQueue.PutInt(AValue: Integer): Integer;
begin
  Result:= Put(IntToStr(AValue));
end;

function TIntQueue.GetInt(var AValue: Integer): Boolean;
var
  StrValue: string;
begin
  Result:= Get(StrValue);
  if Result then
    AValue:= StrToInt(StrValue);

end;

end.

