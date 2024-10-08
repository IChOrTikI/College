﻿unit kr;

interface

type
  NodePtr = ^Node; //Объявляется тип NodePtr, который является указателем на структуру Node.
  Node = record //Структура Node содержит поля:
    data: Integer; //data хранит целочисленное значение элемента списка
    prev, next: NodePtr; //prev указатель на предыдущий элемент и next указатель на следующий элемент
  end;

procedure InitList; // Инициализация списка. 
procedure AddNode(data: Integer); // Добавление нового узла со значением data в конец списка. 
procedure AddNodeAtBeginning(data: Integer);//// Добавление нового узла со значением data в начало списка. 
procedure AddBeforeNumber(data, beforeNum: Integer);//// Добавление нового узла со значением data перед узлом с номером beforeNum в списке. 
procedure RemoveLastNode;//// Удаление последнего узла из списка. 
procedure RemoveFirstNode;//// Удаление первого узла из списка.
procedure RemoveByValue(value: Integer);//// Удаление узла с указанным значением value из списка. 
procedure DisplayList;//// Отображение содержимого списка. 
procedure Menu;// Отображение меню для взаимодействия с функциями списка. 
procedure Main;// Главная процедура, инициализирующая и запускающая работу со списком.

implementation

var
  head, tail, current: NodePtr;
  choice, num, beforeNum: Integer;
  
//Процедкра Инициализации списка
procedure InitList;
begin //Процедура устанавливает указатель head (начало списка) и 
  head := nil; // tail (конец списка) в значение nil, показывая, что список пустой
  tail := nil;
end; // После вызова InitList двусвязный список ГОТОВ к началу использования и добавлению элементов
///////////////////////////////////////////////////////

//Процедура добавления элемента в конец списка
procedure AddNode(data: Integer);
var
  newNode: NodePtr; //Создается новый указатель на узел newNode
begin
  New(newNode); // Выделяется память под новый узел с помощью New(newNode)
  newNode^.data := data; //Присваивается значение data новому узлу: newNode^.data := data.
  newNode^.prev := nil; // Устанавливаются указатели prev и next нового узла на nil.
  newNode^.next := nil;

  if head = nil then //Проверяется, пуст ли список (если head = nil),.... 
    head := newNode // .....то новый узел становится головой списка (head := newNode).
  else//В противном случае новый узел добавляется после текущего хвоста списка,....
  begin
    tail^.next := newNode; // .....обновляются указатели next и prev.
    newNode^.prev := tail; // (то есть указатель tail у head указывает на новый узел, а у нового узла (NewNode) ссылка на предыдущий (NewNode^.prev) указывает на узел  head)
  end;

  tail := newNode;// Обновляется указатель хвоста списка tail на новый узел.

end;
///////////////////////////////////////////////////////

//Процедура добавления элемента в начало списка
procedure AddNodeAtBeginning(data: Integer);
var
  newNode: NodePtr; //Создается новый указатель на узел newNode
begin
  New(newNode); //Выделяется память под новый узел с помощью New(newNode)
  newNode^.data := data; //Присваивается значение data новому узлу: newNode^.data := data.
  newNode^.prev := nil; //Устанавливаются указатели prev нового узла на nil ....
  newNode^.next := head;//.....и next на текущую голову списка.

  if head <> nil then //Проверяется, не пуст ли список (если head <> nil),....
    head^.prev := newNode//.....если, да то указатель prev текущей головы списка указывает на новый узел.
  else
    tail := newNode;//В противном случае, если список пуст, новый узел становится как головой, так и хвостом списка.

  head := newNode;//Обновляется указатель головы списка head на новый узел.
end;
///////////////////////////////////////////////////////

//Процедура добавление элемента перед указанным числом в списке
procedure AddBeforeNumber(data, beforeNum: Integer);
var
  newNode, temp: NodePtr; //Создается новый указатель на узел newNode.
begin
  New(newNode); // Выделяется память под новый узел с помощью New(newNode).

  newNode^.data := data; //Присваивается значение data новому узлу: newNode^.data := data.

  current := head; //Устанавливается указатель current на голову списка.

  while current <> nil do // Проход по списку: пока current не равен nil, выполняются следующие действия:
  begin
    if current^.data = beforeNum then //Если значение текущего узла равно beforeNum, то новый узел вставляется перед текущим узлом.
    begin
      temp := current^.prev;// Создается временный указатель temp, который указывает на предыдущий узел относительно текущего узла current.
      temp^.next := newNode;//(Следующий элемент у временного указателя (Temp) является новый узел (NewNode)). Устанавливается связь между временным узлом temp и новым узлом newNode: temp^.next := newNode.
      newNode^.prev := temp;//(У нового узла (NewNode) указатель на предедущий узел устанавливаем на временный узел (temp)). Устанавливается связь между новым узлом и временным узлом: newNode^.prev := temp.
      newNode^.next := current;//(У нового узла (NewNode), указатель на следующий элемент, указывает на узел current (current этот узел равен узлу перед которым мы хотм вставить новый узел)). Устанавливаются связи между новым узлом и текущим узлом: newNode^.next := current..... 
      current^.prev := newNode;//(У узла (currnet перед котрым мы хотим вствить новый узел) ставим указатель на предыдущий элемент, указывает на наш новый узел(NewNode).  ....и current^.prev := newNode.
      Exit; // Выходим из цикла после вставки элемента перед указанным числом
    end;

    current := current^.next; // переходи по узлам
  end;

  WriteLn('Число ', beforeNum, ' не найдено в списке.');// Если мы не нашли узел (перед котрым нужно вставить новыф узел) выводим ошибку
end;
///////////////////////////////////////////////////////

//Процедура удаления последнего элемента из списка
procedure RemoveLastNode;
var
  temp: NodePtr; //Создается временный указатель temp, который будет указывать на предыдущий узел относительно текущего хвоста списка tail.
begin
  if tail <> nil then //Проверяется, не является ли хвост tail пустым (не равен nil).
  begin // Если хвост не пуст, то:
    temp := tail^.prev; //Устанавливается временный указатель temp на узел, предшествующий текущему хвосту: temp := tail^.prev.
    Dispose(tail); // Освобождается память, занимаемая текущим хвостом: Dispose(tail).
    tail := temp; // Обновляется указатель хвоста tail на предыдущий узел temp.

    if tail <> nil then// Проверяется, не является ли новый хвост tail пустым, и обновляются соответствующие указатели
      //После удаления текущего хвоста, проверяет, не стал ли новый хвост tail пустым.
      tail^.next := nil
    else
      head := nil; //Если новый хвост пустой, обновляется указатель головы head на nil, так как список теперь пуст.
  end;
end;
///////////////////////////////////////////////////////

//Процедура удаления первого элемента из списка 
procedure RemoveFirstNode;
var
  temp: NodePtr; //Создается временный указатель temp, который будет указывать на следующий узел относительно текущей головы списка head
begin
  if head <> nil then // Проверяется, не является ли голова head пустой (не равна nil).
  begin // Если голова не пуста, то:
    temp := head^.next; //Устанавливается временный указатель temp на узел, следующий за текущей головой: temp := head^.next.
    Dispose(head);//Освобождается память, занимаемая текущей головой: Dispose(head).
    head := temp;//Обновляется указатель головы head на следующий узел temp.

    if head <> nil then // не является ли голова списка head пустой (не равна nil). Если голова не пуста, то выполняются следующие действия:
      head^.prev := nil // Устанавливается указатель prev для новой головы списка на nil, так как новая голова не имеет предыдущего элемента
    else
      tail := nil; // В случае, если новая голова стала пустой (равна nil), обновляется указатель хвоста списка tail на nil, так как список теперь пустой и не имеет ни головы, ни хвоста.
  end;
end;
///////////////////////////////////////////////////////

//Процедура удаление элемента по значению из списка 
procedure RemoveByValue(value: Integer);
var
  temp, toDelete: NodePtr;
begin
  current := head; // Устанавливается указатель current на голову списка

  while current <> nil do // Проход по списку: пока current не равен nil, выполняются следующие действия:
  begin
    if current^.data = value then // Если значение текущего узла равно заданному value, то:
    begin
      toDelete := current; // Указатель toDelete устанавливается на текущий узел для последующего удаления

      if toDelete = head then // Проверяется, является ли удаляемый узел головой списка:
      begin
        head := toDelete^.next; // Если да, обновляется указатель головы head на следующий узел
        if head <> nil then 
          head^.prev := nil  // Устанавливается указатель prev для новой головы списка на nil, так как новая голова не имеет предыдущего элемента.
        else 
          tail := nil; // В случае, если новая голова стала пустой (равна nil), обновляется указатель хвоста списка tail на nil, так как список теперь пустой и не имеет ни головы, ни хвоста.
      end 
      else if toDelete = tail then // Проверяется, является ли удаляемый узел хвостом списка:
      begin 
        tail := toDelete^.prev;  // Если да, обновляется указатель хвоста tail на предыдущий узел.
        tail^.next := nil; // Обновляется связь между новым хвостом и следующим за ним узлом.
      end 
      else // В остальных случаях (удаляемый узел не голова и не хвост):
      begin 
        temp := toDelete^.prev; // Устанавливается временный указатель temp на предыдущий узел относительно удаляемого.
        temp^.next := toDelete^.next; //(Ссылка на следующий узел (у узла перед удаляем) указывает на следующий узел котрый стоит (поселе удоляемого)). (устанавливается связь между предыдущим узлом temp и следующим узлом после удаляемого узла toDelete.) //Обновляются связи между соседними узлами для исключения удаляемого из списка.
        toDelete^.next^.prev := temp; //устанавливает для узла, следующего за удаляемым узлом, ссылку на узел temp. Таким образом, после удаления узла toDelete, узел, который ранее указывал на toDelete в качестве следующего, теперь указывает на temp как на свой предыдущий узел, правильно корректируя связи в списке после удаления узла.
      end; 

      Dispose(toDelete); //Освобождается память, занимаемая удаляемым узлом.
      WriteLn('Элемент со значением ', value, ' удален из списка.'); 
      Exit; // выходим из цикла после удаления элемента по значению 
    end; 

    current := current^.next;  // Переход к следующему узлу
  end; 

  WriteLn('Элемент со значением ', value, ' не найден в списке.'); //Если элемент с заданным значением не найден в списке, выводится сообщение об этом.
end;
///////////////////////////////////////////////////////

//Процедура отображения содержимого списка 
procedure DisplayList;
begin
  current := head; // Устанавливается указатель current на голову списка.0

  Write('Содержимое списка: ');
  Write('nil <- ');//Выводится начальная часть списка: nil <-  (пусто, так как голова не имеет предыдущего элемента).

  while current <> nil do// Пока указатель current не равен nil, выполняются следующие действия:
  begin
    Write(current^.data, ' ');// Выводится значение данных текущего узла: Write(current^.data, ' ').
    current := current^.next;//Указатель current переходит к следующему узлу: current := current^.next.
    if current <> nil then//Если следующий узел не равен nil, выводится разделитель <- -> для обозначения связи между узлами.
      Write('<- -> ');
  end;
  write('-> nil');//После завершения цикла выводится конечная часть списка: -> nil.
  WriteLn;
end;
///////////////////////////////////////////////////////

// Меню действий для пользователя и основной цикл программы
procedure Menu;
begin
  WriteLn('Выберите действие:');
  WriteLn('1. Добавить элемент в конец списка');
  WriteLn('2. Добавить элемент перед указанным числом');
  WriteLn('3. Добавить элемент в начало списка');
  WriteLn('4. Удалить последний элемент');
  WriteLn('5. Удалить первый элемент');
  WriteLn('6. Удалить элемент по значению');
  WriteLn('7. Отобразить список');
  WriteLn('8. Выход');
end;
///////////////////////////////////////////////////////

//Основная проццедура программы
procedure Main;
begin
  InitList;

  repeat
    Menu;
    ReadLn(choice);

    case choice of
      1:
      begin
        Write('Введите число для добавления в конец списка: ');
        ReadLn(num);
        AddNode(num);
      end;

      2:
      begin
        Write('Введите число для добавления: ');
        ReadLn(num);
        Write('Введите число, перед которым нужно добавить: ');
        ReadLn(beforeNum);
        AddBeforeNumber(num, beforeNum);
      end;

      3:
      begin
        Write('Введите число для добавления в начало списка: ');
        ReadLn(num);
        AddNodeAtBeginning(num);
      end;

      4: RemoveLastNode;

      5: RemoveFirstNode;

      6:
      begin
        Write('Введите значение элемента для удаления: ');
        ReadLn(num);
        RemoveByValue(num);
      end;

      7: DisplayList;

      8: WriteLn('Программа завершена.');

      else WriteLn('Некорректный выбор.');
    end;

    ReadLn; // Ждем нажатия клавиши перед отображением меню снова

  until choice = 8;
end;
///////////////////////////////////////////////////////


end.