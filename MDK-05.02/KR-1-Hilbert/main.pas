
program Главная_программа;
uses kr, kr_array;

procedure StaticMemory;
begin
  WriteLn('Используем статическую память');
  DoublyList;
end;

procedure DynamicMemory;
begin
  WriteLn('Используем динамическую память');
  Main;
end;

var
  choice: Integer;

begin
  WriteLn('Выберите тип памяти: ');
  WriteLn('1. Статическая память');
  WriteLn('2. Динамическая память');
  Write('Выш выбор:');
  Read(choice);
  writeln(' ');

  case choice of
    1: StaticMemory;
    2: DynamicMemory;
  end;
end.