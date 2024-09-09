unit Hilber;

interface

uses
  graphABC;

procedure DrawFigure(i: integer; var x, y, h: integer; d: char);

implementation

procedure DrawFigure(i: integer; var x, y, h: integer; d: char);
begin
  if i > 0 then
  begin
    case d of
      'A':
      begin
        DrawFigure(i - 1, x, y, h, 'D');
        x := x - h;
        LineTo(x, y);
        DrawFigure(i - 1, x, y, h, 'A');
        y := y - h; 
        LineTo(x, y);
        DrawFigure(i - 1, x, y, h, 'A');
        x := x + h;
        LineTo(x, y);
        DrawFigure(i - 1, x, y, h, 'B');
      end;
      
      'B':
      begin
        DrawFigure(i - 1, x, y, h, 'C');
        y := y + h; 
        LineTo(x, y);
        DrawFigure(i - 1, x, y, h, 'B');
        x := x + h; 
        LineTo(x, y);
        DrawFigure(i - 1, x, y, h, 'B');
        y := y - h;
        LineTo(x, y);
        DrawFigure(i - 1, x, y, h, 'A');
      end;
      
      'C':
      begin
        DrawFigure(i - 1, x, y, h, 'B');
        x := x + h;
        LineTo(x, y);
        DrawFigure(i - 1, x, y, h, 'C');
        y := y + h;
        LineTo(x, y);
        DrawFigure(i - 1, x, y, h, 'C');
        x := x - h;
        LineTo(x, y);
        DrawFigure(i - 1, x, y, h, 'D');
      end;
      
      'D':
      begin
        DrawFigure(i - 1, x, y, h, 'A');
        y := y - h;
        LineTo(x, y);
        DrawFigure(i - 1, x, y, h, 'D');
        x := x - h;
        LineTo(x, y);
        DrawFigure(i - 1, x, y, h, 'D');
        y := y + h;
        LineTo(x, y);
        DrawFigure(i - 1, x, y, h, 'C');
      end;
    end;
  end;
end;

end.