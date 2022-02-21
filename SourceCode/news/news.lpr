program news;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils
  { you can add units after this };

type
  TNews = record
    ATime: TDateTime;
    Title: string[100];
  end;

procedure AddTitle;
var
  F: file of TNews;
  News: TNews;
begin
  AssignFile(F, 'news.dat');
  Write('Input current news title: ');
  Readln(News.Title);
  News.ATime:= Now;
  if FileExists('news.dat') then
  begin
    FileMode:= 2; // Read/Write
    Reset(F);
    Seek(F, System.FileSize(F)); // Go to last record to append
  end
  else
    Rewrite(F);
  Write(F, News);
  CloseFile(F);

end;

procedure ReadAllNews;
var
  F: file of TNews;
  News: TNews;
begin
  AssignFile(F, 'news.dat');
  if FileExists('news.dat') then
  begin
    Reset(F);
    while not Eof(F) do
    begin
      Read(F, News);
      Writeln('------------------------------');
      Writeln('Title: ', News.Title);
      Writeln('Time : ', DateTimeToStr(News.ATime));
    end;
    CloseFile(F);
  end
  else
    Writeln('Empty database');
end;

procedure Search;
var
  F: file of TNews;
  News: TNews;
  Keyword: string;
  Found: Boolean;
begin
  AssignFile(F, 'news.dat');
  Write('Input keyword to search for: ');
  Readln(Keyword);
  Found:= False;
  if FileExists('news.dat') then
  begin
    Reset(F);
    while not Eof(F) do
    begin
      Read(F, News);
      if Pos(LowerCase(Keyword), LowerCase(News.Title)) > 0 then
      begin
        Found:= True;
        Writeln('------------------------------');
        Writeln('Title: ', News.Title);
        Writeln('Time : ', DateTimeToStr(News.ATime));
      end;
    end;
    CloseFile(F);
    if not Found then
      Writeln(Keyword, ' Not found');
  end
  else
    Writeln('Empty database');
end;

function Menu: char;
begin
  Writeln;
  Writeln('...........News database..........');
  Writeln('1. Add news title');
  Writeln('2. Display all news');
  Writeln('3. Search');
  Writeln('x. Exit');
  Write('Please input a selection : ');
  Readln(Result);
end;

var
  Selection: Char;

begin // Main application

  repeat
    Selection:= Menu;
    case Selection of
      '1': AddTitle;
      '2': ReadAllNews;
      '3': Search;
    end;
  until LowerCase(Selection) = 'x';
end.

