program CalculoDePotencia;

function potencia (x,n: integer): real;
begin
	if (n = 0) then
		potencia:= 1
	else
		potencia := x * potencia(x,n-1);
end;

var
	x,n : integer;
begin
	read(x,n);
	write(potencia(x,n));
end.
