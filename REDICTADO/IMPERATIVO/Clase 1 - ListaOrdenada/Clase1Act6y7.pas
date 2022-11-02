program CrearListaAtras;
type
	lista = ^nodo;
	
	nodo = record
		data : integer;
		sig : lista;
	end;

procedure AgregarAtras(var l:lista; var ult:lista; elem: integer);
var
	nue: lista;
begin
	new(nue);
	nue^.data := elem;
	nue^.sig := nil;
	if (l = nil)then begin
		l:= nue;
	end
	else begin
		ult^.sig:= nue;
	ult:= nue;
end;

procedure crearLista(var l:lista);
var
	elem: integer;
	ult: lista;
begin
	Randomize;
	elem := random(16);
	while (elem <> 0)do begin
		AgregarAtras(l,ult,elem);
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
