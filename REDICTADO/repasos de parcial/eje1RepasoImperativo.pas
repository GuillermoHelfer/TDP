program eje1REPASO;
const
	dias_semana = 7;
	valorGrande = 9999;
type
	subr_semana = 1..dias_semana;
	
	entradaV = record
		dia = subr_semana;
		cod = integer;
		asiento = string;
		monto = real;
	end;
	
	lista = ^nodo;
	
	nodo = record
		data: entradaV
		sig: lista
	end;
	
	vector = array [subr_semana] of lista;

//modulos
procedure inicializarVectorDeListas(var v:vector);
var
	i: integer;
begin
	for i:= 1 to dias_semana do
		v[i]:= nil;
end;

procedure leerData (var e: entradaV);
begin
	writeln('ingrese el codigo');
	readln(e.cod);
	if (e.cod <> 0) then begin
		writeln('ingrese el dia');
		readln(e.dia);
		writeln('ingrese el asiento');
		readln(e.asiento);
		writeln('ingrese el monto');
		readln(e.monto);
	end;
end;

procedure InsertarOrdenado(var l:lista; dato:entradaV);
var
	aux,ant,act:lista;
begin
	new(aux);
	aux^.dato:=dato;
	act:=l;
	while((act<>nil)and(dato.cod > act^.dato.cod)) do
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
	e: entrada;
begin
	inicializarVectorDeListas(v);
	for i:=1 to dias_semana do begin
		writeln('dia= ', i);
		leerData(e);
		while(e.cod <> 0) do begin
			InsertarOrdenado(v[i],e);
			leerData(e);
		end;
	end;
end;

procedure agregarAtras(var l,ult:lista; dato:integer);
var
	aux:lista;
begin
	new(aux);
	aux^.dato:=dato;
	aux^.sig:=nil;
	if(l = nil) then
		l:=aux
	else
		ult^.sig:=aux;
	ult:=aux;
end;

procedure DeterminarMinimo(var v:vector; var min:entradaV);
var
	i,i_min:integer;
begin
	min.cod:=valorGrande;
	for i:=1 to dias_semana do begin
		if(v[i]<>nil)then begin
			if(v[i]^.data.cod<min.cod)then begin
				min:=v[i]^.data;
				i_min:=i;
			end;
		end;
	end;
	if(min.cod<>valorGrande)then
		v[i_min]:=v[i_min]^.sig;	
end;

procedure Merge(v:vector; var l:lista); //b)
var
	min:entradaV;
	ult:lista;
begin
	DeterminarMinimo(v,min);
	while(min <> valorGrande) do begin
		AgregarAtras(l,ult,min);
		DeterminarMinimo(v,min);
	end;
end;

procedure ImprimirLista(l:lista); //c)
begin
	if(l <> nil) do begin
		writeln('dia: ',l^.data.dia);
		writeln('cod: ',l^.data.cod);
		writeln('asinto: ',l^.data.asiento);
		writeln('monto: ',l^.data.monto);
		ImprimirLista(l^.sig);
	end;
end;

//programa ppal
VAR
	v: vector;
	nuevaLista: lista;
BEGIN
	CrearVectorListas(v);
	Merge(v,nuevaLista);
	ImprimirLista(nuevaLista);
END.
