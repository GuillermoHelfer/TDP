{
Ejercicio 1. Un teatro tiene funciones los 7 días de la semana. Para cada día se tiene una lista con
las entradas vendidas. Se desea procesar la información de una semana. Se pide:
a) Generar 7 listas con las entradas vendidas para cada día. De cada entrada se lee día (de 1 a 7),
código de la obra, asiento, monto. La lectura finaliza con el código de obra igual a 0. Las listas deben
estar ordenadas por código de obra de forma ascendente.
b) Generar una nueva lista que totalice la cantidad de entradas vendidas por obra. Esta lista debe
estar ordenada por código de obra de forma ascendente.
c) Realice un módulo recursivo que informe el contenido de la lista generada en b)
}

program repaso1;
const
	cant_diasSemana = 7;
	ValorMuyAlto = 9999;
type
	subr_diasSemana = 1..cant_diasSemana;
	
	entrada = record
		dia : subr_diasSemana;
		cod : integer;
		asiento : integer;
		monto : real;
	end;
	
	lista = ^nodo;
	
	nodo = record
		data : entrada;
		sig : lista;
	end;
	
	vector = array [subr_diasSemana] of lista;
	
	entradaT = record
		cod : integer;
		cant: integer;
	end;
	
	listaT = ^nodoT;
	
	nodoT = record
		data: entradaT;
		sig: listaT
	end;
	
//modulos
procedure inicializarVector(var v:vector);
var
	i: integer;
begin
	for i:= 1 to cant_diasSemana do
		v[i]:= nil
end;

procedure leerData(var e:entrada);
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

procedure insertarOrdenado(var l:lista; e:entrada);
var
	nue: lista;
	act, ant: lista;
begin
	new(nue);
	nue^.data:= e;
	ant:= l;
	act:= l;
	while((act<>nil)and(e.cod < act^.data.cod)) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = ant) then
		l:= nue
	else
		ant^.sig:= nue;
	nue^.sig:= act;
end;

//a
procedure crearVectorDeListas(var v: vector);
var
	e: entrada;
	i: integer;
begin
	inicializarVector(v);
	for i:= 1 to cant_diasSemana do begin
		writeln('dia ' , i, ' de la semana');
		leerData(e);
		while(e.cod<>0) do begin
			insertarOrdenado(v[i],e);
			leerData(e);
		end;
	end;
end;

//b
procedure determinarMinimo(var v:vector; var eleMin: entrada);
var
	i, estanteMinimo: integer;
begin
	eleMin.cod := ValorMuyAlto;
	for i:= 1 to cant_diasSemana do begin
		if ( v[i] <> nil ) then begin
			if (v[i]^.data.cod < eleMin.cod ) then begin
				eleMin := v[i]^.data;
				estanteMinimo:= i;
			end;
		end;
	end;
	if (eleMin.cod <> valorMuyAlto) then
		v[estanteMinimo]:= v[estanteMinimo]^.sig
end;

procedure agregarAtras (var l2, ult: listaT; cod: integer; total: integer);
var 
	nue:listaT;
begin
	new (nue);
	nue^.data.cod := cod;
	nue^.data.cant := total;
	nue^.sig := nil;
	if (l2 = nil) then
		l2:= nue
    else 
		ult^.sig:= nue;
	ult:= nue;
end;

//b
procedure mergeAcumulador(var l2: listaT; v:vector);
var
	eleMin, eleAct: entrada;
	ult: listaT;
	total: integer;
begin
	determinarMinimo(v,eleMin);
	while (eleMin.cod <> valorMuyAlto) do begin
		eleAct:= eleMin; total:= 0;
		while (eleAct.cod = eleMin.cod)do begin
			total:= total + 1;
			determinarMinimo(v,eleMin);
		end;
		agregarAtras(l2,ult,eleAct.cod,total);
	end;
end;

//c
procedure informarContenidoListaTotal(l2: listaT);
begin
	if(l2<>nil)then begin
		writeln('el codigo de la obra es: ', l2^.data.cod);
		writeln('la cantidad de entradas vendidas fueron: ', l2^.data.cant);
		informarContenidoListaTotal(l2^.sig);
	end;
end;

VAR
	l2: listaT;
	v: vector;
BEGIN
	crearVectorDeListas(v);
	mergeAcumulador(l2,v);
	informarContenidoListaTotal(l2);
END.
