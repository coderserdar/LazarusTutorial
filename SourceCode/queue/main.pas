unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs, Queue,
  StdCtrls;

type

  { TfmMain }

  TfmMain = class(TForm)
    bbAdd: TButton;
    bbCount: TButton;
    bbGet: TButton;
    edCustomer: TEdit;
    Label1: TLabel;
    Memo1: TMemo;
    procedure bbAddClick(Sender: TObject);
    procedure bbCountClick(Sender: TObject);
    procedure bbGetClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    MyQueue: TQueue;
    { public declarations }
  end; 

var
  fmMain: TfmMain;

implementation


{ TfmMain }

procedure TfmMain.FormCreate(Sender: TObject);
begin
  MyQueue:= TQueue.Create;
end;

procedure TfmMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  MyQueue.Free;
end;

procedure TfmMain.bbCountClick(Sender: TObject);
begin
  Memo1.Lines.Add('Queue length is: ' + IntToStr(MyQueue.Count));
end;

procedure TfmMain.bbAddClick(Sender: TObject);
var
  APosition: Integer;
begin
  APosition:= MyQueue.Put(edCustomer.Text);
  Memo1.Lines.Add(edCustomer.Text + ' has been added as # ' + IntToStr(APosition + 1));
end;

procedure TfmMain.bbGetClick(Sender: TObject);
var
  ACustomer: string;
begin
  if MyQueue.Get(ACustomer) then
  begin
    Memo1.Lines.Add('Got: ' + ACustomer + ' from the queue');
  end
  else
    Memo1.Lines.Add('Queue is empty');
end;

initialization
  {$I main.lrs}

end.

