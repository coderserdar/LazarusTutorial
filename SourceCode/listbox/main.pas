unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btAdd: TButton;
    btClear: TButton;
    btDelete: TButton;
    btClose: TButton;
    Edit1: TEdit;
    ListBox1: TListBox;
    procedure btAddClick(Sender: TObject);
    procedure btClearClick(Sender: TObject);
    procedure btDeleteClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form1: TForm1; 

implementation

{ TForm1 }

procedure TForm1.btAddClick(Sender: TObject);
begin
  ListBox1.Items.Add(Edit1.Text);
end;

procedure TForm1.btClearClick(Sender: TObject);
begin
  ListBox1.Clear;
end;

procedure TForm1.btDeleteClick(Sender: TObject);
var
  Index: Integer;
begin
  Index:= ListBox1.ItemIndex;
  if Index <> -1 then
    ListBox1.Items.Delete(Index);
end;

procedure TForm1.btCloseClick(Sender: TObject);
begin
  Close;
end;

initialization
  {$I main.lrs}

end.

