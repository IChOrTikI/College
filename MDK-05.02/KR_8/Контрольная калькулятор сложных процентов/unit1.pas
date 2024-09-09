unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  ExtCtrls, TAGraph, TASeries;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Chart1: TChart;
    Chart1LineSeries1: TLineSeries;
    Chart2: TChart;
    Chart2LineSeries1: TLineSeries;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Memo5: TMemo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  i, age, count, procent, money:integer;
  kapit, year, stavk, beginsum, procmoney, poform1, momnokapit, poform1_2, pofrom2, moneyrel, procentrel,  dohod, final: real;
  reonvestir: boolean;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.Button1Click(Sender: TObject);
begin
  Memo5.Clear;
  Memo4.Clear;
  Chart1LineSeries1.Clear;
  if TryStrToInt(Edit1.Text, money) and TryStrToInt(Edit2.Text, procent) and TryStrToInt(Edit3.Text, age) and (Edit1.Text <> '0') and (Edit2.Text <> '0') and (Edit3.Text <> '0')then
  begin
      money:= StrToInt(Edit1.Text);
      age:= StrToInt(Edit3.Text);
      procent:= StrToInt(Edit2.Text);
      moneyrel:= StrToFloat(Edit1.Text);
      procentrel:=StrToFloat(Edit2.Text);
  end
  else
  begin
    ShowMessage('Пожалуйста, введите только цифры и не 0');
    Exit;
  end;


  count := 0;
  pofrom2:=moneyrel / 100 * procentrel * age ;
  final:=pofrom2 + moneyrel;
  Memo5.Lines.Add('Весь доход составит: ' + FloatToStr(pofrom2) + '  Конечная сумма: ' + FloatToStr(final));
  dohod:=moneyrel * procentrel / 100;


  for i := 1 to age do
  begin
    count := count + 1;
    moneyrel := moneyrel + dohod;
    Memo4.Lines.Add('Год: ' + FloatToStr(count) + 'Доход: ' + FloatToStr(dohod) + ' Сумма денег: ' + FloatToStr(moneyrel));

    Chart1LineSeries1.AddXY(Trunc(count), Trunc(moneyrel));
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo1.Clear;
  Memo2.Clear;

  //kapit, year, stavk, beginsum, procmoney: integer;
  //reonvestir: boolean;

  if TryStrToFloat(Edit4.Text, kapit) and TryStrToFloat(Edit5.Text, year) and TryStrToFloat(Edit6.Text, stavk) and (Edit4.Text <> '0') and (Edit5.Text <> '0') and (Edit6.Text <> '0')then
  begin
      kapit:= StrToFloat(Edit4.Text);
      year:= StrToFloat(Edit5.Text);
      stavk:= StrToFloat(Edit6.Text);
      momnokapit:=kapit;
  end
  else
  begin
    ShowMessage('Пожалуйста, введите только цифры и не 0');
    Exit;
  end;
  for i:= 1 to Round(year) do begin
    beginsum:= kapit;
    procmoney:= kapit * (stavk / 100);
    kapit:=kapit + procmoney;
    beginsum:=Round(beginsum);
    procmoney:=Round(procmoney);
    kapit:=Round(kapit);
    poform1:=momnokapit * exp(i * ln(1 + (stavk / 100)));
    poform1:=Round(poform1);
    poform1_2:=momnokapit * exp(Round(year) * 1 * ln(1 + ((stavk / 100) / 1)));

    //Chart2LineSeries2.AddXY(Trunc(i), Trunc(momnokapit));
    Chart2LineSeries1.AddXY(Trunc(i), Trunc(kapit));

    Memo3.Clear;
    Memo3.Lines.Add(FloatToStr(poform1_2));
    Memo2.Lines.Add(FloatToStr(poform1));
    Memo1.Lines.Add('Год: ' + FloatToStr(i) + '  Начальная сумма: ' + FloatToStr(beginsum) + '  Процентный даход: ' + FloatToStr(procmoney) + '   Конечная сумма: ' + FloatToStr(kapit))
  end;

end;

procedure TForm1.Edit2Change(Sender: TObject);
begin

end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin

end;

end.

