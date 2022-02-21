unit queue;

// This unit contains TQueue class, which is suitable for any string queue

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils; 

type

  { TQueue }

  TQueue = class
    private
      fArray: array of string;
      fTop: Integer;
    public
      constructor Create;
      destructor Destroy; override;
      function Put(AValue: string): Integer;
      function Get(var AValue: string): Boolean;
      function Count: Integer;
      function ReOrganize: Boolean;
  end;

implementation

{ TQueue }

constructor TQueue.create;
begin
  fTop:= 0;
end;

destructor TQueue.destroy;
begin
  SetLength(fArray, 0); // Erase queue array from memory
  inherited destroy;
end;

function TQueue.Put(AValue: string): Integer;
begin
  if fTop >= 100 then
    ReOrganize;

  SetLength(fArray, Length(fArray) + 1);
  fArray[High(fArray)]:= AValue;
  Result:= High(fArray) - fTop;
end;

function TQueue.Get(var AValue: string): Boolean;
begin
  AValue:= '';
  if fTop <= High(fArray) then
  begin
    AValue:= fArray[fTop];
    Inc(fTop);
    Result:= True;
  end
  else // empty
  begin
    Result:= False;

    // Erase array
    SetLength(fArray, 0);
    fTop:= 0;
  end;
end;

function TQueue.Count: Integer;
begin
  Result:= Length(fArray) - fTop;
end;

function TQueue.ReOrganize: Boolean;
var
  i: Integer;
  PCount: Integer;
begin
  if fTop > 0 then
  begin
    PCount:= Count;
    for i:= fTop to High(fArray) do
      fArray[i - fTop]:= fArray[i];

    // Truncate unused data
    setLength(fArray, PCount);
    fTop:= 0;
    Result:= True; // Re Organize is done

  end
  else
    Result:= False;  // Nothing is done
end;

end.

