program crearVector;
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
	while((aux <> 0)and(dimL
	 < dimF)) do begin
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

VAR
	dimL : integer;
	v: vector;
BEGIN
	inicializarVector(v);
	crearVector(v,dimL);
	imprimirVector(v,dimL);
END.
