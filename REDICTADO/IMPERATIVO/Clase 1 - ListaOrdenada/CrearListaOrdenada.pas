program CrearListaOrdenada;
type
	lista = ^nodo;
	
	nodo = record
		data : integer;
		sig : lista;
	end;

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
		nue:= act;
	else
		ant^.sig := nue;
	nue^.sig := act;
end;

procedure crearLista(var l:lista);
var
	elem: integer;
	ult: lista;
begin
	Randomize;
	elem := random(16);
	while (elem <> 0)do begin
		insertarOrdenado(l,elem);
		elem := random(16);
	end;
end;

procedure ImprimirLista(l:lista);
begin
	while(l<>nil)do begin
		writeln(l^.data);
		l:= l^.sig;
	end;
end;

VAR
	l:lista;
BEGIN
	l:= nil;
	crearLista(l);
	ImprimirLista(l);
END.
