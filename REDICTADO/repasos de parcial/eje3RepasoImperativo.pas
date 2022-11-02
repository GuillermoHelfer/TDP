program eje3RepasoImp;
type
	venta = record
		cod: integer;
		tipo: integer;
		fecha: string;
		cant: integer;
		monto: real;
	end;
	
	producto = record
		cod: integer;
		tipo: integer;
		cant: integer;
		total: real;
	end;
	
	arbol= ^nodoA
	
	nodoA = record
		data: producto;
		hi: nodoA;
		hd: nodoA;
	end;
	
//modulos
procedure leerData(var v: venta);
begin
	writeln('ingrese la cantidad');
	readln(v.cant);
	if(v.cant <> 0) then begin
		writeln('ingrese el codigo');
		readln(v.cod);
		writeln('ingrese el tipo');
		readln(v.cod);
		writeln('ingrese la fecha');
		readln(v.fecha);
		writeln('ingrese el monto');
		readln(v.monto);
	end;
end;

procedure InsertarArbolActualizandoValor(var a,nue:arbol; dato:venta);
begin
	if(a = nil) then begin
		new(nue);
		nue^.data.cod:= dato.cod;
		nue^.data.tipo:= dato.tipo;
		nue^.data.cant:= dato.cant;
		nue^.data.monto:= dato.monto;
		nue^.hi:= nil;
		nue^.hd:= nil;
		a:=nue;
	end;
	else begin
		if(a^.data.cod = dato.cod) then begin
			a^.data.cant := a^.data.cant + dato.cant;
			a^.data.monto := a^.data.monto + dato.monto;
		end
		else begin
			if(a^.dato.cod < dato.cod)then
				InsertarArbolActualizandoValor(a^.HD, nue, dato)
			else
				InsertarArbolActualizandoValor(a^.HI, nue, dato);
		end;
	end;
end;

procedure CrearAbb(var a:arbol); //A)
var
	d: venta;
begin
	leerData(d)
	while (d.cant <> 0) do begin
		InsertarABB(a,d);
		leerData(d);
	end;
end;

procedure BuscarEnRango1(a:arbol; unMin, unMax: integer); //B)
begin
	if(a <> nil) then begin
		if(a^data.cod >= unMin) then begin
			if(a^.data.cod <= unMax) then begin
				BuscarEnRango1(a^.hi,unMin,unMax);
				writeln(a^.data.tipo);
				BuscarEnRango1(a^.hd,unMin,unMax);
			end
			else
				BuscarEnRango1(a^.hi,unMin,unMax);
		end
		else
			BuscarEnRango1(a^.hd,unMin,unMax);
	end;
end;

function ContarElementos(a: arbol): integer;
begin
	if (a <> nil) then begin
		if ((a^.data.monto >= 10000)and(a^.data.monto <= 50000)) then
			ContarElementos := ContarElementos(a^.hi) + ContarElementos(a^.hd) + 1;
		else
			ContarElementos := ContarElementos(a^.hi) + ContarElementos(a^.hd);
	end;
	else
		ContarElementos:= 0;
end;

//prog ppal
VAR
	a: arbol;
BEGIN
	a:= nil;
	cant:= 0;
	CrearABB(a); //A)
	BuscarEnRango1(a); //B)
	writeln(ContarElementos(a)); //C)
END.



	
