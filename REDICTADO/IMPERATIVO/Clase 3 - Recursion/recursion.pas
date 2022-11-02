program CalculoDigitoMaximoRec;
type digito=-1..9;

var num: integer;
    max: digito;

procedure digitoMaximoRec(n: integer; var max: digito);
var
  dig: integer;
begin
  if (n <> 0) then begin
                dig:= n mod 10;
                if (dig > max) then
                                max:= dig;
                n:= n div 10;
                digitoMaximoRec(n, max);
              end;
end;

//actividad 7
procedure ImprimirDigitos1(n:integer);
var
	dig: integer;
begin
	if(n<>0)then begin
		dig:= n mod 10;
		n:= n div 10;
		ImprimirDigitos1(n);
		writeln(dig);
	end;
end;

procedure ImprimirDigitos2(n:integer);
var
	dig: integer;
begin
	if(n<>0)then begin
		dig:= n mod 10;
		ImprimirDigitos1(n);
		n:= n div 10;
		writeln(dig);
	end;
end;



begin
  read (num);
  max := -1;
  digitoMaximoRec(num, max);
  write ('El digito maximo de ', num, ' es: ', max);
  readln(num);
  ImprimirDigitos1(num);
  readln(num);
  ImprimirDigitos2(num);
end.
