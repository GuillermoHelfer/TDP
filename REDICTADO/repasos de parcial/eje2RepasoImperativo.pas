program eje2repaso;
const
	cant_integrantes = 4;
	valorGrande = 9999;
type
	subr_integrantes = 1..4;
	
	gasto = record
		tipo: integer;
		monto: real;
	end;
	
	nodo = record
		data: gasto;
		sig: lista;
	end;
	
	lista = ^nodo;
	
	nodoA = record
		data: gasto;
		hi: arbol;
		hd: arbol;
	end;
	
	arbol = ^nodoA;
	
	vector = array [subr_integrantes] of lista;

//modulos
procedure inicializarVectorDeListas(var v:vector);
var
	i: integer;
begin
	for i:= 1 to dias_semana do
		v[i]:= nil;
end;

procedure leerData (var g: gasto);
begin
	writeln('ingrese el tipo de gasto');
	readln(g.tipo);
	if (e.cod <> 0) then begin
		writeln('ingrese el monto');
		readln(e.monto);
	end;
end;

procedure InsertarOrdenado(var l:lista; dato:gasto);
var
	aux,ant,act:lista;
begin
	new(aux);
	aux^.dato:=dato;
	act:=l;
	while((act<>nil)and(dato.tipo > act^.dato.tipo)) do
	begin
		ant:=act;
		act:=act^.sig;
	end;
	if(act = l) then
		l:=aux
	else
		ant^.sig:=aux;
	aux^.sig:=act;
end;

procedure CrearVectorListas(var v:vector); //a)
var
	i:integer;
	g: gasto;
begin
	inicializarVectorDeListas(v);
	for i:=1 to cant_integrantes do begin
		writeln('integrante= ', i);
		leerData(g);
		while(e.tipo <> 0) do begin
			InsertarOrdenado(v[i],g);
			leerData(g);
		end;
	end;
end;

procedure ImprimirVectorListas(v: vector); //b)
var
	i:integer;
begin
	for i:= 1 to cant_integrantes do begin
		while(v[i]<>nil) do begin
			writeln('tipo= ', v[i]^.data.tipo);
			writeln('monto= ', v[i]^.data.monto);
			v[i] := v[i]^.sig;
		end;
	end;
end;

procedure CrearArbol(var a: arbol; dato: gasto);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:= dato;
		a^.HI:= nil;
		a^.HD:= nil;
	end;
	else begin
		if (a^.dato.monto > dato.monto) then
			CrearArbol(a^.HI, dato)
		else
			CrearArbol(a^.HD, dato)
	end;
end;


procedure DeterminarMinimo(var v:vector; var min:gasto);
var
	i,i_min:integer;
begin
	min.tipo:=valorGrande;
	for i:=1 to camt_integrantes do begin
		if(v[i]<>nil)then begin
			if(v[i]^.data.tipo<min.tipo)then begin
				min:=v[i]^.data;
				i_min:=i;
			end;
		end;
	end;
	if(min.tipo<>valorGrande)then
		v[i_min]:=v[i_min]^.sig;
end;

procedure mergeAcumulador(v:vector; var abb:arbol); //c)
var
	min,act:gasto;
	total:real;
begin
	DeterminarMinimo(v,min);
	while(min.tipo<>valorGrande) do begin
		act:=min;
		total:=0;
		while(min.tipo=act.tipo) do begin
			total:=total+min.monto;
			DeterminarMinimo(v,min);
		end;
		act.monto:=total;
		crearArbol(abb,act);
	end;
end;

procedure ImprimirTipoMayorMonto(abb: arbol); //d)
begin
	if (abb <> nil) then begin
		if (abb^.HD <> nil)
			ImprimirTipoMayorMonto(abb^HD)
		else
			writeln('tipo de mayor monto= ', abb^.data.tipo)
	end;
end;

VAR
	v: vector;
	abb: arbol;
BEGIN
	CrearVectorListas(v);
	ImprimirVectorListas(v);
	mergeAcumulador(v,abb);
	ImprimirTipoMayorMonto(abb);
END.
