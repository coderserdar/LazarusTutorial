unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  IntQueue, StdCtrls;

type

  { TfmMain }

  TfmMain = class(TForm)
    bbAdd: TButton;
    bbCount: TButton;
    bbGet: TButton;
    edCustomerID: TEdit;
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
    MyQueue: TIntQueue;
    { public declarations }
  end; 

var
  fmMain: TfmMain;

implementation


{ TfmMain }

procedure TfmMain.FormCreate(Sender: TObject);
begin
  MyQueue:= TIntQueue.Create;
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
  APosition:= MyQueue.PutInt(StrToInt(edCustomerID.Text));
  Memo1.Lines.Add(edCustomerID.Text + ' has been added as # ' + IntToStr(APosition + 1));
end;

procedure TfmMain.bbGetClick(Sender: TObject);
var
  ACustomerID: Integer;
begin
  if MyQueue.GetInt(ACustomerID) then
  begin
    Memo1.Lines.Add('Got: Customer ID : ' + IntToStr(ACustomerID) + ' from the queue');
  end
  else
    Memo1.Lines.Add('Queue is empty');
end;

initialization
  {$I main.lrs}

end.

