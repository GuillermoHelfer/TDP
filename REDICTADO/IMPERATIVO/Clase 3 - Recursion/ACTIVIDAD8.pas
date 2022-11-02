program ListaConRecursion;
type
	lista = ^nodo;
	
	nodo= record
		sig: lista;
		data: integer;
	end;
	
	
procedure leerData (var i : integer);
begin
	readln(i);
end;

procedure agregarAtras(var l: lista; var ult:lista; i: integer);
var
	nue: lista;
begin
	new(nue); nue^.data:= i; nue^.sig:= nil;
	if (l = nil)then
		l:= nue
	else
		ult^.sig:= nue;
	ult:= nue;
end;

procedure crearLista(var l:lista);
var
	i: integer;
	ult: lista;
begin
	leerData(i);
	while (i <> -1) do begin
		agregarAtras(l,ult,i);
		leerData(i);
	end;
end;

procedure imprimirEnOrden(l: lista);
begin
	if (l<>nil) then begin
		writeln(l^.data);
		imprimirEnOrden(l);
	end;
end;

procedure imprimirOrdenInverso(l: lista);
begin
	if (l<>nil) then begin
		imprimirEnOrden(l);
		writeln(l^.data);
	end;
end;

function maximo(l: lista; max: integer): integer;
begin
	if (l<>nil)then begin
		if (l^.data > max)then
			max:= l^.data;
		maximo:= maximo(l^.sig,max);
	end
	else
		maximo:= max
end;

function minimo(l: lista; min: integer): integer;
begin
	if (l<>nil)then begin
		if (l^.data < min)then
			min:= l^.data;
		minimo:= minimo(l^.sig,min);
	end
	else
		minimo:= min
end;

function Buscar(l:lista; valor: integer): boolean;
begin
	if (l<>nil)then begin
		if(l^.data <> valor)then
			Buscar:= Buscar(l^.sig, valor)
		else
			Buscar:= true;
	end
	else
		Buscar:= false;
end;

var
	l: lista;
	max, min, valor: integer;
begin
	l:= nil; max:= -1; min:= 9999;
	crearLista(l);
	imprimirEnOrden(l);
	imprimirOrdenInverso(l);
	writeln(maximo(l,max));
	writeln(minimo(l,min));
	writeln('ingrese el valor a buscar');
	readln(valor);
	writeln(Buscar(l,valor));
end.
