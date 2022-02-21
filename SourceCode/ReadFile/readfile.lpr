program ReadContents;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils
  { you can add units after this };


type
  TBlock = array [0 .. 1023] of Byte;
var
  FileName: string;
  F: file;
  PBlock: ^TBlock;
  i, NumRead: Integer;
begin
  Write('Input source file name: ');
  Readln(FileName);

  if FileExists(FileName) then
  begin
    AssignFile(F, FileName);

    FileMode:= 0;   // open for read only
    Reset(F, 1);

    New(PBlock);    // Allocate memory space for PBlock (size = 1k)

    while not Eof(F) do
    begin
      BlockRead(F, PBlock^, SizeOf(PBlock^), NumRead);
      // display contents in screen
      for i:= 0 to NumRead - 1 do
        Writeln(PBlock^[i], ':', Chr(PBlock^[i]));
    end;

    Dispose(PBlock);    /// Free/Release memory allocated by PBlock (The 1k)
    CloseFile(F);

  end
  else // File does not found
    Writeln('Source File does not exist');

  Write('press enter key to close..');
  Readln;
end.

