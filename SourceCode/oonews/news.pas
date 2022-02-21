unit news;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils; 

type
  TNewsRec = record
    ATime: TDateTime;
    Title: string[100];
  end;

  { TNews }

  TNews = class
    private
      F: file of TNewsRec;
      fFileName: string;
    public
      constructor Create(FileName: string);
      destructor Destroy; override;
      procedure Add(ATitle: string);
      procedure ReadAll(var NewsList: TStringList);
      function Find(Keyword: string; var ResultList: TStringList): Boolean;
  end;

implementation

{ TNews }

constructor TNews.Create(FileName: string);
begin
  fFileName:= FileName;
end;

destructor TNews.Destroy;
begin
  inherited Destroy;
end;

procedure TNews.Add(ATitle: string);
var
  Rec: TNewsRec;
begin
  AssignFile(F, fFileName);
  if FileExists(fFileName) then
  begin
    FileMode:= 2; // Read/write access
    Reset(F);
    Seek(F, FileSize(F));
  end

  else
    Rewrite(F);

  Rec.ATime:= Now;
  Rec.Title:= ATitle;
  Write(F, Rec);
  CloseFile(F);

end;

procedure TNews.ReadAll(var NewsList: TStringList);
var
  Rec: TNewsRec;
begin
  NewsList.Clear;
  AssignFile(F, fFileName);
  if FileExists(fFileName) then
  begin
    Reset(F);
    while not Eof(F) do
    begin
      Read(F, Rec);
      NewsList.Add(DateTimeToStr(Rec.ATime) + ' : ' + Rec.Title);
    end;
    CloseFile(F);
  end;

end;

function TNews.Find(Keyword: string; var ResultList: TStringList): Boolean;
var
  Rec: TNewsRec;
begin
  ResultList.Clear;
  Result:= False;
  AssignFile(F, fFileName);
  if FileExists(fFileName) then
  begin
    Reset(F);
    while not Eof(F) do
    begin
      Read(F, Rec);
      if Pos(LowerCase(Keyword), LowerCase(Rec.Title)) > 0 then
      begin
        ResultList.Add(DateTimeToStr(Rec.ATime) + ' : ' + Rec.Title);
        Result:= True;
      end;
    end;
    CloseFile(F);
  end;

end;

end.

