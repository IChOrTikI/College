unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfMain }    // Класс окна где объявлены все компоненты окна

  TfMain = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    procedure MyPrivate; // предварительное объявление процедуры
    procedure MyDouble;

  public

  end;

var
  fMain: TfMain;
  number: real;
  MyNum: real;   // Объявляем глобальную перемнную

implementation

{$R *.lfm}

{ TfMain }

procedure Udvoenie(st: string); // Создаем процедуру кторая принимает перменную типа строка
var
  r: real; // Инициализируем локальную переменную r с типом real
begin
  r:=StrToFloat(st);  // Записываем в перемнную r преобразованное число из типа string в float (real)
  r:=r*2; //Умножаемлокальную перемнную r
  ShowMessage(FloatToStr(r)); //Выводим сообщение
end;

function MyFunc(i: string):real;   //Объявлвем функцию MyFunc кторая принимает челочисленную переменную i
                                   // И указываем что фукнция возвразает число типа real
var
  r:real; // Создаем локальную перменную r с типом real
begin
  r:=StrToFloat(i); //Меняем и записываем число кторое передали в функцию
  Result:= r * 2;  //Возвращаем число
  //Можно весто result писать имя функции (Result:=i * 2;)
end;

procedure UdvoeniePoSsilke(var r: real);   // Создаем процедуру  кторая принимает переменную с типом r
//Использование ключевого слова var для параметра r в процедуре UdvoeniePoSsilke
//позволяет ей напрямую изменять значение переданной ей переменной
begin
  r:= r * 2;    // Удваивет не копию, а сам аргумент
end;

procedure TfMain.Button2Click(Sender: TObject);            // Кнопка 2
begin
  number:=MyFunc(Edit1.text);
  ShowMessage(FloatToStr(number));
end;

procedure TfMain.Button3Click(Sender: TObject);                 // Кнопка 3
var
  myReal: real;
begin
  myReal:= StrToFloat(Edit1.Text);
  UdvoeniePoSsilke(myReal);   // Меняем переменную myReal в процедуре
  ShowMessage(FloatToStr(myReal));
end;

procedure TfMain.Button4Click(Sender: TObject);                // Кнопка 4
begin
  MyPrivate;  //Вызываем предворительно объявоенную процедуру
end;

procedure TfMain.Button5Click(Sender: TObject);             // Кнопка 5
begin
  MyNum:= StrToFloat(Edit1.Text); // Записываем в переменную, то число, которое ввел пользователь
  //теперь удвоим его (вызываем процедуру)
  MyDouble;
  //выводим глобальную перменную на экран:
  ShowMessage(FloatToStr(MyNum));
end;

procedure TfMain.MyPrivate;   //Данная процедура кторая обявлена  предворительно
//Само значение данная процедура не меняет
var
  r: real;
begin
  //преобразуем в число то, что ввел пользователь
  r:= StrToFloat(Edit1.Text);
  //теперь удвоим его
  r:= r * 2;
  //теперь выведем результат в сообщении
  ShowMessage(FloatToStr(r));
end;

procedure TfMain.MyDouble;
begin
  MyNum:=MyNum * 2; // Удваиваем глобальную переменную
end;

procedure TfMain.Button1Click(Sender: TObject);           // Кнопка 1
begin
  Udvoenie(Edit1.text);
end;

end.

