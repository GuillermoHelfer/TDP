program ACT2;
const
	cant_sucursales = 4;
	valor_muy_alto = 9999;
type
	subr_sucursales = 1..cant_sucursales;
	
	venta = record
		codV: integer;
		codP: integer;
		cantV: integer;
	end;
	
	lista = ^nodo;
	
	nodo = record
		data: venta;
		sig: lista;
	end;
	
	vector = array [subr_sucursales] of lista;
	
//
procedure leerData(var elem: venta);
begin
	writeln('ingrese el codigo de venta');
	readln(elem.codV);
	if (elem.codV <> 0) then begin
		writeln('ingrese el codigo de producto');
		readln(elem.codP);
		writeln('ingrese la cantidad vendida');
		readln(elem.cantV);
	end;
end;

procedure insertarOrdenado(var l:lista; elem: venta);
var
	nue, act, ant: lista;
begin
	new(nue);
	nue^.data := elem;
	nue^.sig := nil;
	act:= l;
	ant := l;
	while ((act <> nil)and(act^.data.codP < elem.codP))do begin
		ant := act;
		act := act^.sig;
	end;
	if (act = nil)then
		nue:= act
	else
		ant^.sig := nue;
	nue^.sig := act;
end;

procedure crearLista(var l:lista);
var
	elem: venta;
begin
	leerData(elem);
	while (elem.codV <> 0)do begin
		insertarOrdenado(l,elem);
		leerData(elem);
	end;
end;

procedure inicializarVector(var v:vector);
var
	i: integer;
begin
	for i:= 1 to cant_sucursales do
		v[i]:= nil;
end;

procedure crearVectorListas(var v:vector);
var
	i: integer;
begin
	for i:= 1 to cant_sucursales do
		crearLista(v[i])
end;

procedure imprimirVectorListas(v: vector);
var
	i: integer;
begin
	for i:= 1 to cant_sucursales do begin
		while (v[i] <> nil) do begin
			writeln('codP: ',v[i]^.data.codP);
			writeln('codV: ',v[i]^.data.codV);
			writeln('cantV: ',v[i]^.data.cantV);
			v[i]:= v[i]^.sig;
		end;
	end;
end;

procedure determinarMinimo(var v:vector; var eleMin: venta);
var
	i, estanteMinimo: integer;
begin
	eleMin.codP := valor_muy_alto;
	for i:= 1 to cant_sucursales do begin
		if ( v[i] <> nil ) then
			if (v[i]^.data.codP < eleMin.codP ) then begin
				eleMin := v[i]^.data;
				estanteMinimo:= i;
			end;
	end;
	
	if (eleMin.codP <> valor_muy_alto) then
		v[estanteMinimo]:= v[estanteMinimo]^.sig
end;

procedure agregarAtras (var l, ult: lista; elem: venta);
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
	eleMin: venta;
	ult: lista;
begin
	determinarMinimo(v,eleMin);
	while (eleMin.codP <> valor_muy_alto) do begin
		agregarAtras(l,ult,eleMin);
		determinarMinimo(v,eleMin);
	end;
end;

procedure imprimirLista(l: lista);
begin
	while (l<>nil) do begin
		writeln('LISTA codP: ',l^.data.codP);
		writeln('LISTA codV: ',l^.data.codV);
		writeln('LISTA cantV: ',l^.data.cantV);
	end;
end;

VAR
	l: lista;
	v: vector;
BEGIN
	inicializarVector(v);
	crearVectorListas(v);
	imprimirVectorListas(v);
	l:= nil;
	merge(l,v);
	imprimirLista(l);
END.
