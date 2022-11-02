program ACTIVIDAD1;
const
	dimF = 16;
type
	vector = array[1..dimF{no se cuantos elementos eran}]of integer;
	
procedure inicializarVector(var v:vector);
var
	i: integer;
begin
	for i:= 1 to 16 do
		v[i]:= 0;
end;

procedure crearVector(var v:vector; var dimL:integer);
var
	aux : integer;
begin
	Randomize;
	aux := random(16);
	dimL:= 0;
	while((aux <> 0)and(dimL < dimF)) do begin
		v[dimL]:= aux;
		aux := random(16);
		dimL := dimL + 1;
	end;
end;
	
procedure imprimirVector(v:vector; dimL:integer);
var
	i : integer;
begin
	for i:= 1 to dimL do
		writeln('el numero almacenado es: ', v[i]);
end;

procedure ordenacionPorInsercion(var v:vector; dimL:integer);
var
	i, j, actual: integer;
begin
	for i:=2 to dimL do begin
		actual:= v[i]; // Guardo elemento a ordenar
		j:= i-1;
		while((j > 0) and (v[j] > actual)) do begin
			v[j+1]:= v[j];
			j:= j - 1;
		end;
		v[j+1]:= actual; // Guardar elemento en v[j+1]
	end;
end;

function BuscarElementoVectorOrdenado(v:vector; x:integer; dimL: integer): integer;
var
	pri, ult, medio: integer;
begin
	pri:= 1;
	ult:= dimL;
	medio:= ((ult-pri) DIV 2) + pri;
	while ((pri <= ult) and (x <> v[medio])) do begin
		if(x < v[medio]) then begin
			ult:= medio-1;
		end
		else begin
			pri:= medio+1;
		end;
		medio:= ((ult-pri) DIV 2) + pri;
	end;
	if (pri <= ult)then begin
		BuscarElementoVectorOrdenado := medio;
	end
	else begin
		BuscarElementoVectorOrdenado := 0;
	end;
end;

VAR
	dimL, X : integer;
	v: vector;
BEGIN
	inicializarVector(v);
	crearVector(v,dimL);
	imprimirVector(v,dimL);
	OrdenacionPorInsercion(v,dimL);
	imprimirVector(v,dimL);
	writeln('ingrese el elemento que quiere buscar en el vector');
	readln(X);
	writeln(BuscarElementoVectorOrdenado(v,dimL,X));
END.
