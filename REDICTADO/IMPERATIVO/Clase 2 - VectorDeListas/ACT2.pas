program ACT2;
const
	cant_MayorAltura = 20;
type
	subr_MayorAltura = 1..cant_MayorAltura;
	
	jugador = record
		dni: String;
		nombre: String;
		altura: real;
	end;
	
	lista = ^nodo;
	
	nodo = record
		data: jugador;
		sig: lista;
	end;
	
	vector = array[subr_MayorAltura] of jugador;
	
procedure leerData(var j:jugador);
begin
	writeln('ingrese el dni');
	readln(j.dni);
	if (j.dni <> '0')then begin
		writeln('ingrese el nombre');
		readln(j.nombre);
		writeln('ingrese la altura en mts');
		readln(j.altura);
	end;
end;

procedure agregarAtras(var l:lista; var ult:lista; j:jugador);
var
	nue: lista;
begin
	new(nue); nue^.data:= j; nue^.sig:= nil;
	if (l = nil)then begin
		l:= nue;
	end
	else begin
		ult^.sig:= nue;
	end;
	ult:= nue;
end;

procedure crearLista(var l:lista);
var
	ult: lista;
	j: jugador;
begin
	leerData(j);
	while(j.dni <> '0') do begin
		agregarAtras(l,ult,j);
		leerData(j);
	end;
end;

procedure imprimirElementosLista(l:lista);
begin
	while (l<>nil) do begin
		writeln(l^.data.dni);
		writeln(l^.data.nombre);
		writeln(l^.data.altura);
		writeln('');
		l:= l^.sig;
	end;
end;

function calcularPromedioAltura(l:lista): real;
var
	cant: integer;
	total: real;
begin
	cant:= 0; total:= 0.0;
	while(l<>nil)do begin
		total:= total + l^.data.altura;
		cant:= cant + 1;
		l:=l^.sig;
	end;
	calcularPromedioAltura:= (total/cant);
end;

procedure inicializarVector(var v:vector);
var
	i: integer;
begin
	for i:= 1 to cant_MayorAltura do begin
		v[i].dni:= '0';
		v[i].nombre:= ' ';
		v[i].altura:= 0.0;
	end;
end;

procedure generarVectorMayorAltura(var v:vector; l:lista);
var
	i: integer;
	promedio: real;
begin
	promedio:= calcularPromedioAltura(l); i:= 0;
	while (l<>nil)do begin
		if (l^.data.altura > promedio) then begin
			i:= i+1;
			v[i]:= l^.data;
		end;
		l:= l^.sig;
	end;
end;

procedure imprimirVector(v: vector);
var
	i: integer;
begin
	for i:= 1 to cant_MayorAltura do begin
		writeln(v[i].dni);
		writeln(v[i].nombre);
		writeln(v[i].altura);
		writeln(' ');
	end;
end;

procedure ordenarVectorPorDni(var v:vector);
var
	i, j: integer;
	act: jugador;
begin
	for i:= 2 to cant_MayorAltura do begin
		act:= v[i];
		j:= i-1;
		while ((j>0)and(v[j].altura > act.altura)) do begin
			v[j+1]:= v[j];
			j:= j-1;
		end;
		v[j+1]:= act;
	end;
end;

procedure buscarJugadorImprimir(v: vector; dniJugador: String);
var
	i: integer;
begin
	i:= 1;
	while(v[i].dni <> dniJugador) do
		i:= i+1;
	writeln('la altura del jugador buscado es :', v[i].altura);		
end;

VAR
	l:lista;
	v:vector;
	dniJugador: String;
BEGIN
	crearLista(l);
	imprimirElementosLista(l);
	generarVectorMayorAltura(v,l);
	imprimirVector(v);
	ordenarVectorPorDni(v);
	imprimirVector(v);
	writeln('ingrese el dni del jugador a buscar ');
	readln(dniJugador);
	buscarJugadorImprimir(v,dniJugador);
END.
