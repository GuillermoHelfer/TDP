program Actividad4;
type

	dispositivo = record
		android : String;
		pantalla : real;
		memoria : integer;
	end;
	
	lista = ^nodo;
	
	nodo = record
		data: dispositivo;
		sig: lista;
	end;
	
	lista2 = ^nodo2;
	
	nodo2 = record
		android: String;
		sig: lista2;
	end;
	
procedure leerData(var d: dispositivo);
begin
	writeln('ingrese el tamanio de la pantalla');
	readln(d.pantalla);
	if (d.pantalla <> 0) then begin
		writeln('ingrese la version de android');
		readln(d.android);
		writeln('ingrese la cantidad de memoria RAM');
		readln(d.memoria);
	end;
end;

procedure insertarOrdenado(var l:lista; d:dispositivo);
var
	nue, ant, act: lista;
begin
	new(nue); nue^.data:= d;
	act:= l; ant:= l;
	while ((act<>nil)and(act^.data.android < d.android))do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = nil)then begin
		l:= nue;
	end
	else begin
		ant^.sig:= nue;
	end;
	nue^.sig:= act;
end;

procedure crearLista(var l:lista);
var
	d: dispositivo;
begin
	leerData(d);
	while(d.pantalla <> 0)do begin
		insertarOrdenado(l,d);
		leerData(d);
	end;
end;

procedure agregarAtras(var l2:lista2; var ult: lista2; andro: String);
var
	nue: lista2;
begin
	new(nue); nue^.android:= andro; nue^.sig:= nil;
	if (l2=nil)then begin
		l2:= nue;
	end
	else begin
		ult^sig:= nue;
	end;
	ult:= nue;
end;

procedure cantDispPorVersion(l:lista; var l2:lista2);
var
	ult: lista;
	vAct: String;
	cant: integer;
begin
	while(l<>nil)do begin
		vAct := l^data.android; cant:= 0;
		while((l<>nil)and(vAct = l^.data.android)) do begin
			agregarAtras(l2,vAct);
		end;
		
end;

VAR

BEGIN

END.
