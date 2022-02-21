program streamcopy;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, main, LResources
  { you can add units after this };


begin
  {$I streamcopy.lrs}
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.

