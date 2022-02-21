unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form1: TForm1; 

implementation

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  Memo1.Lines.Insert(0,
    FormatDateTime('yyyy-mm-dd hh:nn', Now) + ': ' + Edit1.Text);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo1.Lines.SaveToFile('news.txt');
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  Memo1.Lines.SaveToFile('news.txt');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if FileExists('news.txt') then
    Memo1.Lines.LoadFromFile('news.txt');
end;

initialization
  {$I main.lrs}

end.

