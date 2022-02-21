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
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form1: TForm1; 

implementation

uses Second;

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form2.Show;
end;

{ TForm1 }


initialization
  {$I main.lrs}

end.

