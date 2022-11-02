program ACTIVIDAD1;
const
	cant_ISBN = 15;
	cant_estantes = 4;
	valor_muy_alto = 9999;
type
	subr_ISBN = 0..15;

	lista = ^nodo;
	
	nodo = record
		sig: lista;
		data: subr_ISBN;
	end;
	
	vector = array[1..4] of lista;
	
//A

procedure insertarOrdenado(var l:lista; elem: integer);
var
	nue, act, ant: lista;
begin
	new(nue);
	nue^.data := elem;
	nue^.sig := nil;
	act:= l;
	ant := l;
	while ((act <> nil)and(act^.data < elem))do begin
		ant := act;
		act := act^.sig;
	end;
	if (act = nil)then
		l:= act
	else
		ant^.sig := nue;
	nue^.sig := act;
end;

procedure crearLista(var l:lista);
var
	elem: subr_ISBN;
begin
	writeln('ingrese el codigo del libro');
	readln(elem);
	while (elem <> 0)do begin
		insertarOrdenado(l,elem);
		writeln('ingrese el codigo del libro');
		readln(elem);
	end;
end;

procedure inicializarVector(var v:vector);
var
	i: integer;
begin
	for i:= 1 to cant_estantes do
		v[i]:= nil;
end;

procedure crearVectorListas(var v:vector);
var
	i: integer;
begin
	for i:= 1 to cant_estantes do
		crearLista(v[i])
end;

procedure imprimirVectorListas(v: vector);
var
	i: integer;
begin
	for i:= 1 to cant_estantes do begin
		while (v[i] <> nil) do begin
			writeln(v[i]^.data);
			v[i]:= v[i]^.sig;
		end;
	end;
end;

procedure determinarMinimo(var v:vector; var eleMin: integer);
var
	i, estanteMinimo: integer;
begin
	eleMin := valor_muy_alto;
	for i:= 1 to cant_estantes do begin
		if ( v[i] <> nil ) then
			if (v[i]^.data < eleMin ) then begin
				eleMin := v[i]^.data;
				estanteMinimo:= i;
			end;
	end;
	
	if (eleMin <> valor_muy_alto) then
		v[estanteMinimo]:= v[estanteMinimo]^.sig
end;

procedure agregarAtras (var l, ult: lista; elem: integer);
var 
	nue:lista;
begin
	new (nue);
	nue^.data := elem;
	nue^.sig := nil;
	if (l = nil) then
		l:= nue
    else 
		ult^.sig:= nue;
	ult:= nue;
end;

procedure merge(var l: lista; v:vector);
var
	eleMin: integer;
	ult: lista;
begin
	determinarMinimo(v,eleMin);
	while (eleMin <> valor_muy_alto) do begin
		agregarAtras(l,ult,eleMin);
		determinarMinimo(v,eleMin);
	end;
end;

VAR
	v: vector;
	l:lista;
BEGIN
	inicializarVector(v);
	crearVectorListas(v); //a
	imprimirVectorListas(v); //b
	l:= nil;
	merge(l,v) //c
END.

