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
    edName: TEdit;
    Label1: TLabel;
    laYourName: TLabel;
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
begin
  laYourName.Caption:= 'Hello ' + edName.Text;
end;

initialization
  {$I main.lrs}

end.

