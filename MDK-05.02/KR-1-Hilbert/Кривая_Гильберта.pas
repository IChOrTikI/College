program Hilbert;
uses graphABC, Hilber;
var 
  i, h, x, y, y_move, x_move, x0, y0, n, h0,  moveStep: integer;

//Procedure text;
//begin
//  textout(350,10,'Z - увеличение глубины фигуры');
//  textout(350,30,'X - уменьшение глубины фигуры');
//  textout(350,50,'E - уменьшение фигуры');
//  textout(350,70,'Q - увеличение фигуры');
//  textout(350,90,'"Up", "Down", "Left", "Right" - перемещение');
//  textout(350,110,'фигуры');
//end;

//Procedure DrawFigure(i: integer; d: char);
//begin
//  if i > 0 then
//  begin
//    case d of
//      'A':
//      begin
//        DrawFigure(i - 1, 'D');
//        x := x - h;
//        LineTo(x, y);
//        DrawFigure(i - 1, 'A');
//        y := y - h; 
//        LineTo(x, y);
//        DrawFigure(i - 1, 'A');
//        x := x + h;
//        LineTo(x, y);
//        DrawFigure(i - 1, 'B');
//      end;
//      
//      'B':
//      begin
//        DrawFigure(i - 1, 'C');
//        y := y + h; 
//        LineTo(x, y);
//        DrawFigure(i - 1, 'B');
//        x := x + h; 
//        LineTo(x, y);
//        DrawFigure(i - 1, 'B');
//        y := y - h;
//        LineTo(x, y);
//        DrawFigure(i - 1, 'A');
//      end;
//      
//      'C':
//      begin
//        DrawFigure(i - 1, 'B');
//        x := x + h;
//        LineTo(x, y);
//        DrawFigure(i - 1, 'C');
//        y := y + h;
//        LineTo(x, y);
//        DrawFigure(i - 1, 'C');
//        x := x - h;
//        LineTo(x, y);
//        DrawFigure(i - 1, 'D');
//      end;
//      
//      'D':
//      begin
//        DrawFigure(i - 1, 'A');
//        y := y - h;
//        LineTo(x, y);
//        DrawFigure(i - 1, 'D');
//        x := x - h;
//        LineTo(x, y);
//        DrawFigure(i - 1, 'D');
//        y := y + h;
//        LineTo(x, y);
//        DrawFigure(i - 1, 'C');
//      end;
//    end;
//  end;
//end;

begin
  h0 := 256;
  moveStep := 10;

  writeln('');
  readln(n);
  
  i := 0; 
  h := h0; 
  x0 := h div 2;
  y0 := x0;
  
  repeat
    i := i + 1;
    h := h div 2;
    x0 := x0 + (h div 2); 
    y0 := y0 + (h div 2);
    x := x0;
    y := y0;
    ClearWindow;
    MoveTo(x, y);
    DrawFigure(i, x, y, h, 'A');
  until i = n;
  //text;
 OnKeyDown := procedure(key: integer) ->
begin
  case key of
    VK_UP: y_move := y_move - 15; 
    VK_DOWN: y_move := y_move + 15;
    VK_LEFT: x_move := x_move - 15; 
    VK_RIGHT: x_move := x_move + 15; 
    VK_Q: h0 := h0 * 2;
    VK_E: h0 := h0 div 2; 
    VK_Z: n := n + 1;
    VK_X: n := n - 1;
    VK_U: CloseWindow;
  end;
  
  MoveTo(x, y);
  ClearWindow;
  i := 0;
  h := h0;
  x0 := h div 2;
  y0 := x0;

  repeat
    i := i + 1;
    h := h div 2;
    x0 := x0 + (h div 2); 
    y0 := y0 + (h div 2);
    x := x0 + x_move;
    y := y0 + y_move;
    ClearWindow;
    //text;
    MoveTo(x, y);
    DrawFigure(i, x, y, h, 'A');
    
  until i = n;
end;
  readln;
end.