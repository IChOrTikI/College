//unit kr_array;
//
//interface
//
//const
//  MAX_SIZE = 100; // Максимальный размер списка MAX_SIZE - константа, определяющая максимальный размер списка (100 в данном случае).
//
//type
//  Node = record
//    data: Integer;
//  end;
//
//var
//  list: array[1..MAX_SIZE] of Node;
//  size, tailIndex: Integer;
//
//procedure InsertAtEnd(value: Integer);
//procedure DisplayList;
//procedure DeleteByValue(value: Integer);
//procedure DeleteList;
//procedure DoublyList;
//
//implementation
//
//procedure InsertAtEnd(value: Integer);
//begin
//  if size >= MAX_SIZE then
//  begin
//    WriteLn('Список полон');
//    Exit;
//  end;
//
//  Inc(size);
//  list[size].data := value;
//end;
//
//procedure DisplayList;
//var
//  i: Integer;
//begin
//  writeln('');
//  writeln('Список:');
//  for i := 1 to size do
//    Write(list[i].data, ' ');
//  writeln('');
//end;
//
//procedure DeleteByValue(value: Integer);
//var
//  i: Integer;
//begin
//  i := 1;
//  
//  while i <= size do
//  begin
//    if list[i].data = value then
//    begin
//      for i := i to size - 1 do
//        list[i] := list[i + 1];
//      
//      Dec(size);
//      WriteLn('Элемент с значением ', value, ' был удален.');
//      Exit;
//    end;
//    
//    Inc(i);
//  end;
//
//  WriteLn('Элемент с значением ', value, ' не найден.');
//end;
//
//procedure DeleteList;
//begin
//  size := 0;
//  
//  WriteLn('Список удален.');
//end;
//
//procedure DoublyList;
//var
//  choice, value: Integer;
//begin
//
//size := 0;
//
//repeat
//
//WriteLn('1. Добавить элемент');
//WriteLn('2. Отобразить список');
//WriteLn('3. Удалить элемент по значению');
//WriteLn('4. Очистить список');
//WriteLn('5. Выход');
//Write('Введите ваш выбор: ');
//ReadLn(choice);
//
//case choice of 
//1:
//begin 
//Write('Введите значение которое хотите добавить: ');
//ReadLn(value);
//InsertAtEnd(value);
//end; 
//2:
//DisplayList; 
//3:
//begin 
//Write('Введите значение для удаления: ');
//ReadLn(value);
//DeleteByValue(value);
//end; 
//4:
//DeleteList; 
//5:
//WriteLn('Выход из программы.');
//else 
//WriteLn('Ошибка выбора. Попробуйте снова');
//end; 
//
//until choice =5 ;
//
//end;
//
//end.

unit kr_array;

interface

const
  MAX_SIZE = 100; // Максимальный размер списка

type
  Node = record
    data: Integer; // Хранит данные узла списка
    prev: Integer; // Индекс предыдущего узла
    next: Integer; // Индекс следующего узла
  end;

var
  head, tail: Integer; // Индексы начала и конца списка
  size: Integer; // Переменная для хранения размера списка
  list: array[1..MAX_SIZE] of Node; // Массив узлов (Каждый элемент массива является типом дынных Node с соответствующими полями)

procedure InsertAtEnd(value: Integer); // Процедура для добавления элемента в конец списка
procedure DisplayList; // Процедура для отображения списка
procedure DeleteByValue(value: Integer); // Процедура для удаления элемента по значению
procedure DeleteList; // Процедура для удаления всего списка
procedure DoublyList; // Процедура для управления списком через case-menu

implementation

// Процедура добавления элемента в конец списка
procedure InsertAtEnd(value: Integer);
var
  newIndex: Integer; // Индекс нового узла
begin
  if size >= MAX_SIZE then // Проверка, что список не переполнен
  begin
    WriteLn('Список полон'); // Вывод сообщения об ошибке
    Exit; // Выход из процедуры
  end;

  newIndex := size + 1; // Увеличиваем индекс для нового узла
  list[newIndex].data := value; // Присвоение значению нового узла переданного значения

  if size = 0 then // Если список пуст
  begin
    list[newIndex].prev := 0; // Устанавливаем предыдущий узел как 0
    head := newIndex; // Устанавливаем начало списка на новый узел
    tail := newIndex; // Устанавливаем конец списка на новый узел
  end
  else // Если список не пуст
  begin
    list[newIndex].prev := tail; // Устанавливаем предыдущий узел как текущий конец списка
    list[tail].next := newIndex; // Устанавливаем следующий узел для текущего конца списка
    tail := newIndex; // Обновляем конец списка
  end;

  Inc(size); // Увеличиваем размер списка
end;

// Процедура для отображения списка
procedure DisplayList; 
var
  current: Integer; // Индекс текущего узла
begin
  writeln('');
  writeln('Список:');

  current := head; // Устанавливаем текущий индекс на начало списка
  while current <> 0 do // Пока не конец списка
  begin
    Write(list[current].data, ' '); // Выводим данные текущего узла
    current := list[current].next; // Перемещаемся к следующему узлу
  end;

  writeln('');
end;

 // Процедура для удаления элемента по значению
procedure DeleteByValue(value: Integer);
var
  current, temp: Integer; // Индекс текущего узла и временный индекс
begin
  current := head; // Устанавливаем текущий индекс на начало списка

  while current <> 0 do // Пока не конец списка
  begin
    if list[current].data = value then // Если данные текущего узла равны переданному значению
    begin
      if current = head then // Если текущий узел - начало списка
        head := list[current].next // Обновляем индекс начала списка (head := list[current].next -  происходит присваивание переменной head значения list[current].next)
      else
        list[list[current].prev].next := list[current].next; // Связываем предыдущий узел текущего с последующим (list[list[current].prev].next обращается к полю next предыдущего узла и устанавливает его значение равным индексу следующего узла текущего узла.
//list[current].next обращается к полю next текущего узла, которое содержит индекс следующего узла в списке.)

      if current = tail then // Если текущий узел - конец списка
        tail := list[current].prev // присваивает переменной tail значение индекса узла, который является предыдущим узлом относительно текущего узла в списке.
      else
        list[list[current].next].prev := list[current].prev; // Связываем следующий узел текущего с предыдущим

      temp := current; // Сохраняем текущий индекс во временной переменной
      current := list[current].next; // Перемещаемся к следующему узлу
      size := size - 1; // Уменьшаем размер списка
      WriteLn('Элемент со значением ', value, ' был удален.'); // Выводим сообщение об успешном удалении
      Exit; // Выход из процедуры
    end;

    current := list[current].next; // Переходим к следующему узлу
  end;

  WriteLn('Элемент со значением ', value, ' не найден.'); // Если элемент не найден
end;

// Процедура для удаления всего списка
procedure DeleteList; 
begin
  head := 0; // Обнуляем индекс начала списка
  tail := 0; // Обнуляем индекс конца списка
  size := 0; // Обнуляем размер списка

  WriteLn('Список удален.'); // Выводим сообщение об успешном удалении списка
end;

procedure DoublyList; // Процедура для управления списком через консольное меню выбора
var
  choice, value: Integer; // Переменные для выбора и значения
begin
  head := 0; // Обнуляем индекс начала списка
  tail := 0; // Обнуляем индекс конца списка
  size := 0; // Обнуляем размер списка

  repeat
    WriteLn('1. Добавить элемент');
    WriteLn('2. Отобразить список');
    WriteLn('3. Удалить элемент по значению');
    WriteLn('4. Очистить список');
    WriteLn('5. Выход');
    Write('Введите ваш выбор: ');
    ReadLn(choice); // Считываем выбор

    case choice of
      1:
        begin
          Write('Введите значение, которое хотите добавить: ');
          ReadLn(value); // Считываем значение для добавления
          InsertAtEnd(value); // Вызываем процедуру добавления элемента
        end;
      2:
        DisplayList; // Вызываем процедуру отображения списка
      3:
        begin
          Write('Введите значение для удаления: ');
          ReadLn(value); // Считываем значение для удаления
          DeleteByValue(value); // Вызываем процедуру удаления элемента по значению
        end;
      4:
        DeleteList; // Вызываем процедуру удаления всего списка
      5:
        WriteLn('Выход из программы.'); // Выводим сообщение о выходе
      else
        WriteLn('Ошибка выбора. Попробуйте снова'); // Выводим сообщение об ошибке выбора
    end;

  until choice = 5; // Повторяем цикл до выбора выхода
end;

end.