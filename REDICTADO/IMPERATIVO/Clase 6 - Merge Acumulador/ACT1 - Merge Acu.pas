program Actividad1;
const
	ValorMuyAlto = 9999;
	cant_integrantesFamilia = 4;
type
	gasto = record
		tipo: integer;
		monto: real;
	end;
	
	lista = ^nodo;
	
	nodo = record
		data: gasto;
		sig: lista;
	end;
	
	vector = array[1..cant_integrantesFamilia] of lista;
	
//modulos
procedure inicializarVector(var v:vector);
var
	i: integer;
begin
	for i:= 1 to cant_integrantesFamilia do
		v[i]:= nil;
end;

procedure leerData(var g:gasto);
begin
	writeln('ingrese el tipo de gasto ');
	read(g.tipo);
	if (g.tipo <> 0)then begin
		writeln('ingrese el monto ');
		read(g.monto);
	end;
end;

procedure insertarOrdenado(var l:lista; elem: gasto);
var
	nue, act, ant: lista;
begin
	new(nue);
	nue^.data:= elem;
	act:= l;
	while (act <> nil)and(act^.data.tipo < elem.tipo)do begin
		ant := act;
		act := act^.sig;
	end;
	if (act = l)then
		l:= nue
	else
		ant^.sig := nue;
	nue^.sig := act;
end;

procedure crearVectorListas(var v: vector);
var
	g: gasto;
	i: integer;
begin
	for i:= 1 to cant_integrantesFamilia do begin
		writeln('');
		writeln('INTEGRANTE DE FAMILIA NUMERO ', i);
		writeln('');
		leerData(g);
		while(g.tipo <> 0) do begin
			insertarOrdenado(v[i],g);
			leerData(g);
		end;
	end;
end;

procedure imprimirVectorListas(v: vector);
var
	i: integer;
begin
	writeln('');
	for i:= 1 to cant_integrantesFamilia do begin
		writeln('integrante n: ',i);
		while (v[i] <> nil) do begin
			writeln('tipo: ', v[i]^.data.tipo);
			writeln('monto: ', v[i]^.data.monto:0:2);
			writeln('');
			v[i]:= v[i]^.sig;
		end;
	end;
end;

procedure determinarMinimo(var v:vector; var eleMin: gasto);
var
	i, estanteMinimo: integer;
begin
	eleMin.tipo := valorMuyAlto;
	for i:= 1 to cant_integrantesFamilia do begin
		if ( v[i] <> nil ) then
			if (v[i]^.data.tipo < eleMin.tipo ) then begin
				eleMin := v[i]^.data;
				estanteMinimo:= i;
			end;
	end;
	
	if (eleMin.tipo <> valorMuyAlto) then
		v[estanteMinimo]:= v[estanteMinimo]^.sig
end;

procedure agregarAtras (var l, ult: lista; elem: gasto);
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

procedure mergeAcumulador(var l: lista; v:vector);
var
	eleMin, eleAct: gasto;
	ult: lista;
	total: real;
begin
	determinarMinimo(v,eleMin);
	while (eleMin.tipo <> valorMuyAlto) do begin
		eleAct:= eleMin; total:= 0;
		while (eleAct.tipo = eleMin.tipo)do begin
			total:= total + eleMin.monto;
			determinarMinimo(v,eleMin);
		end;
		eleAct.monto:= total;
		agregarAtras(l,ult,eleAct);
	end;
end;

procedure imprimirLista(l: lista);
begin
	writeln('');
	while (l <> nil) do begin
		writeln('tipo: ', l^.data.tipo);
		writeln('monto: ', l^.data.monto:0:2);
		writeln('');
		l:= l^.sig;
	end;
end;

//programa ppal
VAR
	v: vector;
	l: lista;
BEGIN
	inicializarVector(v);
	crearVectorListas(v);
	imprimirVectorListas(v);
	l:= nil;
	mergeAcumulador(l,v);
	imprimirLista(l);
END.
