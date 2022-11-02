program repaso2;
const
	cant_integrantes = 4;
	valorMuyAlto = 9999;
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

	vector = array [1..cant_integrantes] of lista;
	
	ABB = ^nodoABB;
	
	nodoABB = record
		hi: nodoABB;
		hd: nodoABB;
		data: gasto;
	end;
	
//MODULOS

procedure leerGasto (var g: gasto);
begin
	writeln("ingrese el tipo de gasto");
	readln(g.tipo);
	if(g.tipo <> 0) then begin
		writeln("ingrese el monto del gasto");
		readln(g.monto);
	end;
end;

procedure insertarOrdenado(var l:lista; g:gasto);
var
	nue: lista;
	act, ant: lista;
begin
	new(nue);
	nue^.data:= g;
	ant:= l;
	act:= l;
	while((act<>nil)and(g.tipo < act^.data.tipo)) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = ant) then
		l:= nue;
	else
		ant^.sig:= nue;
	nue^.sig:= act;
end;

//A)
procedure crearVectorDeListas(var v: vector);
var
	g: gasto;
	i: integer;
begin
	for i:= 1 to cant_integrantes do begin
		writeln("integrante ", i, " de la familia");
		leerGasto(g);
		while(g.tipo<>0) do begin
			insertarOrdenado(v[i],g);
			leerGasto(g);
		end;
	end;
end;

//B)
procedure imprimirVectorListas(v: vector);
var
	i: integer;
begin
	writeln('');
	for i:= 1 to cant_integrantes do begin
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
	for i:= 1 to cant_integrantes do begin
		if ( v[i] <> nil ) then
			if (v[i]^.data.tipo < eleMin.tipo ) then begin
				eleMin := v[i]^.data;
				estanteMinimo:= i;
			end;
	end;
	
	if (eleMin.tipo <> valorMuyAlto) then
		v[estanteMinimo]:= v[estanteMinimo]^.sig
end;

procedure insertarABB(var a:abb; g:gasto);
begin
	if (a=nil)then begin
		new(a); a^.data:= g;
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else begin
		if (p.codP < a^.data.monto)then
			insertarABB(a^.hi,g)
		else begin
			if (p.codP > a^.data.monto)then
				insertarABB(a^.hd,g)
		end;
	end;
end;


//C)
procedure mergeAcumulador(var abb: ABB; v:vector);
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
		insertarABB(abb,eleAct);
	end;
end;

procedure imprimirMontoMax(abb:ABB);
begin
	if(abb <> nil) then begin
		if(abb^.hd <> nil)
			imprimirMontoMax(abb^.hd);
		else
			writeln(abb^.data);
	end;  
end;

VAR
	
BEGIN
	
END.
