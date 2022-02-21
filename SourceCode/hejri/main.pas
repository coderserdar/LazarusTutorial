unit main;

{$mode objfpc}{$H+}

interface


uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Calendar, ExtCtrls, Spin, HejriUtils;



type

  { TfmMain }

  TfmMain = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Calendar1: TCalendar;
    cbMonth: TComboBox;
    imMoon: TImage;
    imMoon1: TImage;
    imMoon10: TImage;
    imMoon11: TImage;
    imMoon12: TImage;
    imMoon13: TImage;
    imMoon14: TImage;
    imMoon15: TImage;
    imMoon16: TImage;
    imMoon17: TImage;
    imMoon18: TImage;
    imMoon19: TImage;
    imMoon2: TImage;
    imMoon20: TImage;
    imMoon21: TImage;
    imMoon22: TImage;
    imMoon23: TImage;
    imMoon24: TImage;
    imMoon25: TImage;
    imMoon26: TImage;
    imMoon27: TImage;
    imMoon28: TImage;
    imMoon29: TImage;
    imMoon3: TImage;
    imMoon30: TImage;
    imMoon4: TImage;
    imMoon5: TImage;
    imMoon6: TImage;
    imMoon7: TImage;
    imMoon8: TImage;
    imMoon9: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    Panel1: TPanel;
    seYear: TSpinEdit;
    seDay: TSpinEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure cbDayChange(Sender: TObject);
    procedure cbMonthChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure seDayChange(Sender: TObject);
  private
    { private declarations }
  public
    procedure UpdateMoon(ADay: Integer);
    { public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{ TfmMain }



procedure TfmMain.Button1Click(Sender: TObject);
var
  Year, Month, Day: Word;
begin
  DateToHejri(Calendar1.DateTime, Year, Month, Day);
  Memo1.Lines.Add(DateToStr(Calendar1.DateTime) + '  =  ' + Format('%d.%s.%d',
    [Day, HejriMonthsAr[Month], Year]));
  seYear.Value:= Year;
  cbMonth.ItemIndex:= Month - 1;
  cbMonthChange(nil);
  seDay.Value:= Day;
  UpdateMoon(Day);

end;

procedure TfmMain.Button2Click(Sender: TObject);
var
  ADate: TDateTime;
  CYear, CMonth, CDay: Word;
  YearD, MonthD, DayD: Word;

begin
  ADate:= HejriToDate(seYear.Value, cbMonth.ItemIndex + 1, seDay.Value);
  Memo1.Lines.Add(FormatDateTime('yyyy-mm-dd ddd', ADate));

  DateToHejri(Now, CYear, CMonth, CDay);
  HejriDifference(seYear.Value, cbMonth.ItemIndex + 1, seDay.Value, CYear, CMonth,
    CDay, YearD, MonthD, DayD);
  Memo1.Lines.Add('Difference = ' + Format('%d year, %d month, %d day ', [YearD, MonthD, DayD]));
  Calendar1.DateTime:= ADate;

end;

procedure TfmMain.cbDayChange(Sender: TObject);
begin
end;

procedure TfmMain.cbMonthChange(Sender: TObject);
begin
  seDay.MaxValue:= GetHejriMonthDays(seYear.Value, cbMonth.ItemIndex + 1);
end;

procedure TfmMain.FormCreate(Sender: TObject);
var
  i: Integer;
  Year, Month, Day: Word;
begin
  Calendar1.DateTime:= Now;
  cbMonth.Clear;
  for i:= 1 to 12 do
    cbMonth.Items.Add(HejriMonthsAr[i]);
  DateToHejri(Now, Year, Month, Day);
  seDay.Value:= Day;
  UpdateMoon(Day);
  cbMonth.ItemIndex:= Month - 1;
  seYear.Value:= Year;
  Memo1.Height:= 300;
  cbMonthChange(nil);
end;

procedure TfmMain.seDayChange(Sender: TObject);
begin
  UpdateMoon(seDay.Value);
end;

procedure TfmMain.UpdateMoon(ADay: Integer);
begin
  imMoon.Picture.Assign((FindComponent('imMoon' + IntToStr(ADay)) as TImage).Picture);
end;

initialization
  {$I main.lrs}

end.

