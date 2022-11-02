program actividad5;
type
	participante = record
		codP: integer;
		codC: integer;
		edad: integer;
	end;
	
	abb = ^arbol;
	
	arbol = record
		hi: abb;
		hd: abb;
		data: participante;
	end;
	
	lista = ^nodo;
	
	nodo = record
		data: participante;
		sig: lista;
	end;
	
//procedimientos
procedure leerData(var p:participante);
begin
	writeln('ingrese el codigo de ciudad de origen');
	readln(p.codC);
	if (p.codC <> -1) then begin
		writeln('ingrese el codigo de participante');
		readln(p.codP);
		writeln('ingrese la edad');
		readln(p.edad);
	end;
end;

procedure insertarABB(var a:abb; p: participante);
begin
	if (a=nil)then begin
		new(a); a^.data:= p;
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else begin
		if (p.codP < a^.data.codP)then
			insertarABB(a^.hi,p)
		else begin
			if (p.codP > a^.data.codP)then
				insertarABB(a^.hd,p)
		end;
	end;
end;

procedure crearArbol(var a:abb);
var
	p: participante;
begin
	leerData(p);
	while (p.codC <> -1)do begin
		insertarABB(a,p);
		leerData(p);
	end;
end;

procedure agregarAdelante(var l:lista; p:participante);
var
	nue: lista;
begin
	new(nue); nue^.data:= p; nue^.sig:= nil;
	if (l = nil)then
		l:= nue
	else
		nue^.sig:=l;
	l:= nue;
end;

procedure crearLista(a:abb; var l:lista; unCod:integer);
begin
	if (a <> nil)then begin
		crearLista(a^.hi, l, unCod);
		if (unCod = a^.data.codC) then
			agregarAdelante(l,a^.data);
		crearLista(a^.hd, l, unCod);
	end;
end;

procedure informarLista(l:lista);
begin
	while (l <> nil) do begin
		writeln('participante cod: ', l^.data.codP);
		writeln('ciudad cod: ', l^.data.codC);
		writeln('edad: ', l^.data.edad);
		l:= l^.sig;
	end;
end;

function calcularPromedioEdad(a:abb; totalEdad, cantP:integer):real;
begin
	if(a<>nil) then begin
		totalEdad:= totalEdad + a^.data.edad;
		cantP:= cantP+1;
		calcularPromedioEdad:= calcularPromedioEdad(a^.hi, totalEdad, cantP);
		calcularPromedioEdad:= calcularPromedioEdad(a^.hd, totalEdad, cantP);
	end
	else begin
		if(cantP <> 0)then
			calcularPromedioEdad:= totalEdad / cantP
	end;
end;

//programa principal
VAR
	a: abb;
	l: lista;
	unCod, totalEdad, cantP: integer;
BEGIN
	a:= nil; l:= nil;
	crearArbol(a);
	
	writeln('ingrese un codigo de ciudad de origen');
	readln(unCod);
	crearLista(a,l,unCod);
	informarLista(l);
	
	totalEdad:= 0;
	cantP:= 0;
	writeln('el promedio de edad es de : ', calcularPromedioEdad(a,totalEdad,cantP));
	
	
END.
