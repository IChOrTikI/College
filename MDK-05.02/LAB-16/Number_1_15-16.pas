﻿Program Lab_15_1;


var
  i: integer; 
  i_ptr: ^integer; // указатель на целочисленную переменную
  
begin
  New(i_ptr); // выделяем память для указателя i_ptr
  i := 2; // присваиваем переменной i значение 2
  i_ptr^ := i; // записываем значение переменной i в место, на которое указывает i_ptr
  writeln('i = ', i); // вывод переменной i
  writeln('i_ptr = ', i_ptr); // выводим адрес переменной i_ptr
  writeln('i_ptr^ = ', i_ptr^); // выводим значение, на которое указывает i_ptr
  dispose(i_ptr); // освобождаем память, выделенную под указатель i_ptr
end.


//Program Lab_15_1;
//var
//  i: integer;
//  i_ptr: ^integer;
//begin
//  i:=2;
//  i_ptr:=@i;
//  writeln('i_ptr = ', i_ptr);
//  writeln('i_ptr^ = ',i_ptr^);
//  writeln('i = ', i);
//end.