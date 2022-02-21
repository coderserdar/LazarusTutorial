{
*******************************************************************************************************************

  HejriUtils:   Hejri Calnder converter, for FreePascal and Delphi
  Author:       Motaz Abdel Azeem
  email:        motaz@code.sd
  Home page:    http://code.sd/
  License:      LGPL
  Created on:   26.Sept.2009
  Last modifie: 21.July.2012

*******************************************************************************************************************

}

unit HejriUtils;

{$IFDEF FPC}
{$mode objfpc}{$H+}
{$ENDIF}

interface

uses
  Classes, SysUtils, dateutils;

const
  HejriMonthsEn: array [1 .. 12] of string = ('Moharram', 'Safar', 'Rabie Awal', 'Rabie Thani', 'Jumada Awal',
    'Jumada Thani', 'Rajab', 'Shaban', 'Ramadan', 'Shawal', 'Thi-Alqaida', 'Thi-Elhajah');

  HejriMonthsAr: array [1 .. 12] of string = ('محرم', 'صفر', 'ربيع أول', 'ربيع ثاني', 'جمادى اﻷول',
    'جمادى اﻵخر', 'رجب', 'شعبان', 'رمضان', 'شوال', 'ذي القعدة','ذي الحجة');

  HejriYearDays = 354.367056;
  HejriMonthDays = 29.530588;

  procedure DateToHejri(ADateTime: TDateTime; var Year, Month, Day: Word);
  function HejriToDate(Year, Month, Day: Word): TDateTime;

  procedure HejriDifference(Year1, Month1, Day1, Year2, Month2, Day2: Word; var YearD, MonthD, DayD: Word);
  function GetHejriMonthDays(Year, Month: Word): Byte;



implementation

var
  HejriStart : TDateTime;

procedure DateToHejri(ADateTime: TDateTime; var Year, Month, Day: Word);
var
  HejriY: Double;
  Days: Double;
  HejriMonth: Double;
  RDay: Double;
begin
  HejriY:= ((Trunc(ADateTime) - HejriStart) / HejriYearDays);
  Days:= Frac(HejriY);
  Year:= Trunc(HejriY) + 1;
  HejriMonth:= ((Days * HejriYearDays) / HejriMonthDays);
  Month:= Trunc(HejriMonth) + 1;
  RDay:= (Frac(HejriMonth) * HejriMonthDays) + 1;
  Day:= Trunc(RDay);
end;

function HejriToDate(Year, Month, Day: Word): TDateTime;
begin
  Result:= (Year - 1) * HejriYearDays + (HejriStart) + (Month - 1) * HejriMonthDays + Day;
  Result:= Trunc(Result);
end;

procedure HejriDifference(Year1, Month1, Day1, Year2, Month2, Day2: Word; var YearD, MonthD, DayD: Word);
var
  Days1: Double;
  Days2: Double;
  DDays: Double;
  RYear, RMonth: Double;
begin
  Days1:= Year1 * HejriYearDays + (Month1 - 1) * HejriMonthDays + Day1 - 1;
  Days2:= Year2 * HejriYearDays + (Month2 - 1) * HejriMonthDays + Day2 - 1;
  DDays:= Abs(Days2 - Days1);

  RYear:= DDays / HejriYearDays;
  RMonth:= (Frac(RYear) * HejriYearDays) / HejriMonthDays;
  DayD:= Round(Frac(RMonth) * HejriMonthDays);

  YearD:= Trunc(RYear);
  MonthD:= Trunc(RMonth);

end;


function GetHejriMonthDays(Year, Month: Word): Byte;
var
  HYear, HMonth, HDay: Word;
begin
  DateToHejri(HejriToDate(Year, Month, 29) + 1, HYear, HMonth, HDay);
  if HDay = 30 then
    Result:= 30
  else
    Result:= 29;
end;

initialization

  HejriStart:= EncodeDate(622, 7, 17) + 0.5;

end.

