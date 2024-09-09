unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button2: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Label1: TLabel;
    Shape1: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    procedure Button14Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Click(Sender: TObject);
    procedure ClickMove(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Shape10ChangeBounds(Sender: TObject);
    procedure StaticText2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  num1, num2, res : real;
  move: string;


implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ClickMove(Sender: TObject);
begin
  num1:=StrToFloat(Edit1.text); //В перменную num1 записываем число которое пользователь ввел в Edit1 (Это первое число)
  Edit1.Clear; // Очищаем Edit1
  move:= (Sender as TButton).Caption; //Сохронение выбранного знака в переменную move

end;

procedure TForm1.Image2Click(Sender: TObject);
begin

end;

procedure TForm1.Image3Click(Sender: TObject);
begin

end;

procedure TForm1.Shape10ChangeBounds(Sender: TObject);
begin

end;

procedure TForm1.StaticText2Click(Sender: TObject);
begin

end;

procedure TForm1.Click(Sender: TObject);
var
  str, sumb: string;
begin
  sumb := (Sender as TButton).Caption; // Считываем какю цыфру от 0 до 9 (или знак ",") выбрал пользователь
  Image2.Visible:= False; // Убираем Илона
  Image3.Visible:= False; // Убираем Илона
  Edit2.visible:= False;
  Image4.Visible:= False; // Выводим илона с сообщением
  Image5.Visible:= False; // Выводим илона с сообщением

  str := Edit1.Text; //Записываем в str что что находится в Edit1

  if sumb = ',' then // Проверяем ввел ли пользователь знак "," первым
  begin
    if str = '' then
     begin
      Image3.Visible:= True; // Выводим илона с сообщением
      ShowMessage('Число не может начинаться с "," ');
     end
    else
    begin
      if Pos(',', str) = 0 then // Если пользователь ввел знак "," и о не первое.....
        Edit1.Text := Edit1.Text + sumb;// .....добовляем знак "," в Edit1
    end;
  end
  else
  begin
    if ((sumb >= '0') and (sumb <= '9')) or (sumb = '-') then // Проверяем что пользователь ввел число от 0 до 9
      Edit1.Text := Edit1.Text + sumb; //Записываем число
  end;
end;

procedure TForm1.Button10Click(Sender: TObject);
var
  str:string;
begin
     str:=Edit1.text; // В переменную str записываем текст который находится в Edit1
     if str <> '' then  //Если строка не пустая.....
      Delete(str, Length(str), 1);// .....то удаляем последний элемент в строке.....
     Edit1.text:= str;// .....и зписываем измененную строку обратно в Edit1

end;

procedure TForm1.Button14Click(Sender: TObject);
begin
  num1:=StrToFloat(Edit1.text); // В перменную num1  записываем число которое находится в Edit1
  num1:=1/num1; //Переменной num1 передаем значение равное 1 деленное на переменную num1
  Edit1.text:=FloatToStr(num1); //Записываем получившееся число обратно в Edit1
  num1:=0;// Обнуляем переменную num1

end;

procedure TForm1.Button21Click(Sender: TObject);
begin
  num2:= StrToFloat(Edit1.text); //Записываем в переменную num2 значение котрое находится в Edit1
  Edit1.clear;// Очищаем Edit1
  case move of
  '+' : res := num1 + num2; // Если пользователь выбрал "+" то складываем перменные num1 и num2
  '-' : res := num1 - num2; // Если пользователь выбрал "-" то вычитаем перменную num2 из переменной num1
  '*' : res := num1 * num2; // Если пользователь выбрал "*" то умножаем число num1 на число num2
  '/':      //Если пользватель выбрал "/" .....
      begin             // .....то проверяем.....
        if num2 = 0 then// .....если значение num2 равно 0 то....
        begin
          Image2.Visible:= True; // Выводим илона с сообщением
          ShowMessage('Деление на ноль недопустимо!');// .....выводим сообщение о том, что делить на ноль нельзя.....

          Exit;//.....и выходим из процедуры
        end; // Если же num2 не равно нулю, то.....
        res := num1 / num2; // .....то переменной res присваиваем значение равное num1 делить на num2
      end;
  end;
  Edit2.visible:= True;
  Edit2.text:=('УТЕБЯ ПОЛУЧИЛОСЬ: ' + FloatToStr(res));
  Image4.Visible:= True; // Выводим илона с сообщением
  Edit1.text:=FloatToStr(res);//Записываем в Edit1 получившееся значение (res)
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
  Edit1.clear; // Очищаем Edit1
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Edit1.clear; //Очищаем Edit1
  num1:=0;    //Очищаем перменные для того, чтобы сбросить значения
  num2:=0;
  res:=0;
end;

procedure TForm1.Button4Click(Sender: TObject);

begin
  num1:=StrToFloat(Edit1.text); // В переменную num1 записываем число которое находится в Edit1
  if num1 < 0 then
     begin
       Image5.Visible:= True; // Выводим илона с сообщением
       ShowMessage('Корень из отрицательного числа нельзя найти');
       Edit1.text:=''; // Очищаем Edit1
       Exit;
    end;
  num1:=sqrt(num1);// Переменной num1 присваем значение равное квадратному корню из num1
  Edit1.text:=FloatToStr(num1); //Получившееся значение записываем в Edit1
  num1:=0;//Обнуляем  переменную num1


end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  num1:=StrToFloat(Edit1.text);// В переменную num1 записываем число которое находится в Edit1
  num1:=sqr(num1);// Переменной num1 присваем значение равное квадрату числа num1
  Edit1.text:=FloatToStr(num1);//Получившееся значение записываем в Edit1
  num1:=0;//Обнуляем  переменную num1

end;

end.

