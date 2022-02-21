unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls;

type

  { TfmMain }

  TfmMain = class(TForm)
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  fmMain: TfmMain;

implementation

{ TfmMain }

procedure TfmMain.Button1Click(Sender: TObject);
var
  SourceF, DestF: TFileStream;
  Buf: array [0 .. 1023] of Byte;
  NumRead: Integer;
begin
  if OpenDialog1.Execute and SaveDialog1.Execute then
  begin
    SourceF:= TFileStream.Create(OpenDialog1.FileName, fmOpenRead);
    DestF:= TFileStream.Create(SaveDialog1.FileName, fmCreate);
    while SourceF.Position < SourceF.Size do
    begin
      NumRead:= SourceF.Read(Buf, SizeOf(Buf));
      DestF.Write(Buf, NumRead);
    end;
    //DestF.CopyFrom(SourceF, SourceF.Size);
    SourceF.Free;
    DestF.Free;
    ShowMessage('Copy finished');
  end;
end;

initialization
  {$I main.lrs}

end.

