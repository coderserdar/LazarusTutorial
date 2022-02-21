unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs, News,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btAdd: TButton;
    btShowAll: TButton;
    btSearch: TButton;
    cbType: TComboBox;
    edTitle: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure btAddClick(Sender: TObject);
    procedure btSearchClick(Sender: TObject);
    procedure btShowAllClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    NewsObj: array of TNews;
    { public declarations }
  end; 

var
  Form1: TForm1; 

implementation

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  SetLength(NewsObj, cbType.Items.Count);
  for i:= 0 to High(NewsObj) do
    NewsObj[i]:= TNews.Create(cbType.Items[i] + '.news');

end;

procedure TForm1.btAddClick(Sender: TObject);
begin
  NewsObj[cbType.ItemIndex].Add(edTitle.Text);
end;

procedure TForm1.btSearchClick(Sender: TObject);
var
  SearchStr: string;
  ResultList: TStringList;
begin
  ResultList:= TStringList.Create;
  if InputQuery('Search News', 'Please input keyword', SearchStr) then
    if NewsObj[cbType.ItemIndex].Find(SearchStr, ResultList) then
    begin
      Memo1.Lines.Clear;
      Memo1.Lines.Add(cbType.Text + ' News');
      Memo1.Lines.Add('---------------------------------------------------------------');
      Memo1.Lines.Add(ResultList.Text);
    end
    else
      Memo1.Lines.Text:= SearchStr + ' not found in ' + cbType.Text + ' news';
  ResultList.Free;
end;

procedure TForm1.btShowAllClick(Sender: TObject);
var
  List: TStringList;
begin
  List:= TStringList.Create;
  NewsObj[cbType.ItemIndex].ReadAll(List);
  Memo1.Lines.Clear;
  Memo1.Lines.Add(cbType.Text + ' News');
  Memo1.Lines.Add('-------------------------------------------------------------------');
  Memo1.Lines.Add(List.Text);
  List.Free;


end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
  i: Integer;
begin
  for i:= 0 to High(NewsObj) do
    NewsObj[i].Free;

  NewsObj:= nil;

end;

initialization
  {$I main.lrs}

end.

