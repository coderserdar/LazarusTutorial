unit DateTimeUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils; 

type
  { TMyDateTime }

  TMyDateTime = class
  private
    fDateTime: TDateTime;
  public
    function GetDateTime: TDateTime;
    procedure SetDateTime(ADateTime: TDateTime);
    procedure AddDays(Days: Integer);
    procedure AddHours(Hours: Single);
    function GetDateTimeAsString: string;
    function GetTimeAsString: string;
    function GetDateAsString: string;
    constructor Create(ADateTime: TDateTime);
    destructor Destroy; override;
  end;

implementation

{ TMyDateTime }

function TMyDateTime.GetDateTime: TDateTime;
begin
  Result:= fDateTime;
end;

procedure TMyDateTime.SetDateTime(ADateTime: TDateTime);
begin
  fDateTime:= ADateTime;
end;

procedure TMyDateTime.AddDays(Days: Integer);
begin
  fDateTime:= fDateTime + Days;
end;

procedure TMyDateTime.AddHours(Hours: Single);
begin
  fDateTime:= fDateTime + Hours / 24;
end;


function TMyDateTime.GetDateTimeAsString: string;
begin
  Result:= DateTimeToStr(fDateTime);
end;

function TMyDateTime.GetTimeAsString: string;
begin
  Result:= TimeToStr(fDateTime);
end;

function TMyDateTime.GetDateAsString: string;
begin
  Result:= DateToStr(fDateTime);
end;

constructor TMyDateTime.Create(ADateTime: TDateTime);
begin
  fDateTime:= ADateTime;
end;

destructor TMyDateTime.Destroy;
begin
  inherited Destroy;
end;

end.

