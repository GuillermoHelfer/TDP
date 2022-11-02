program CrearListaAdelante;
type
	lista = ^nodo;
	
	nodo = record
		data : integer;
		sig : lista;
	end;

procedure AgregarAdelante(var l:lista; elem: integer);
var
	nue: lista;
begin
	new(nue);
	nue^.data := elem;
	nue^.sig := l;
	l:= nue;
end;

procedure crearListaAgregarAdelante(var l:lista);
var
	elem: integer;
begin
	Randomize;
	elem := random(16);
	while (elem <> 0)do begin
		AgregarAdelante(l,elem);
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
	crearListaAgregarAdelante(l);
	ImprimirLista(l);
	
END.
