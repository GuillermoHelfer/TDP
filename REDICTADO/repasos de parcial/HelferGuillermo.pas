program HelferGuillermo;
const
	cantMaxUsuariosEntreDosValores = 20;
type
	subrMaxUsuarios = 1..cantMaxUsuariosEntreDosValores;

	impresion = record
		nomDoc: string;
		paginas: integer;
		tamanio: integer;
		nomUsu: string;
	end;
	
	estadistica = record
		nomUsu: string;
		totalDoc: integer;
		totalPag: integer;
		nomDoc: string;
	end;
	
	arbol = ^nodo;
	
	nodo = record
		data: estadistica;
		hi: arbol;
		hd: arbol;
	end;
	
	ultimoDoc = record
		nomUsu: string;
		nomDoc: string;
	end;
	
	vector = array [subrMaxUsuarios] of ultimoDoc;
	
//modulos
procedure leerData(var d: impresion);
begin
	writeln('ingrese el tamanio');
	readln(d.tamanio);
	if (d.tamanio <> 0) then begin
		writeln('ingrese el nombre del doc');
		readln(d.nomDoc);
		writeln('ingrese la cant de paginas ');
		readln(d.paginas);
		writeln('ingrese el nombre del usuario');
		readln(d.nomUsu);
	end;
end;

procedure InsertarArbolActualizandoValor(var a:arbol; dato:impresion);
begin
	if(a = nil) then begin
		new(a);
		a^.data.nomDoc:= dato.nomDoc;
		a^.data.totalPag:= dato.paginas;
		a^.data.totalDoc:= 1;
		a^.data.nomUsu:= dato.nomUsu;
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else begin
		if(a^.data.nomUsu = dato.nomUsu) then begin
			a^.data.nomDoc := dato.nomDoc;
			a^.data.totalPag := a^.data.totalPag + dato.paginas;
			a^.data.totalDoc := a^.data.totalDoc + 1;
		end
		else begin
			if(a^.data.nomUsu < dato.nomUsu)then
				InsertarArbolActualizandoValor(a^.hd, dato)
			else
				InsertarArbolActualizandoValor(a^.hi, dato);
		end;
	end;
end;

procedure CrearAbb(var a:arbol); //a)
var
	d: impresion;
begin
	leerData(d);
	while (d.tamanio <> 0) do begin
		InsertarArbolActualizandoValor(a,d);
		leerData(d);
	end;
end;

procedure obtenerUsuMaxDoc(a: arbol; max:integer; var infoUsuMaxDoc:estadistica); //b)
begin
	if (a<>nil) then begin
		if(a^.data.totalDoc > max) then begin
			infoUsuMaxDoc:= a^.data;
			max:= a^.data.totalDoc;
			obtenerUsuMaxDoc(a^.hi, max, infoUsuMaxDoc);
			obtenerUsuMaxDoc(a^.hd, max, infoUsuMaxDoc);
		end
		else begin
			obtenerUsuMaxDoc(a^.hi, max, infoUsuMaxDoc);
			obtenerUsuMaxDoc(a^.hd, max, infoUsuMaxDoc);
		end;
	end;
end;

procedure inicializarVector(var v:vector);
var
	i: integer;
begin
	for i:= 1 to cantMaxUsuariosEntreDosValores do begin
		v[i].nomUsu:= 'vacio';
		v[i].nomDoc:= 'vacio';
	end;
end;

procedure BuscarEnRango(a:arbol; unMin, unMax: string; var dimL: integer; var v:vector); //c
begin
	if(a <> nil) then begin
		if(a^.data.nomUsu >= unMin) then begin
			if(a^.data.nomUsu <= unMax) then begin
				BuscarEnRango(a^.hi,unMin,unMax,dimL,v);
				v[dimL].nomUsu:= a^.data.nomUsu;  //agrego un elemento al vector
				v[dimL].nomDoc:= a^.data.nomDoc;
				dimL:= dimL + 1;
				BuscarEnRango(a^.hd,unMin,unMax,dimL,v);
			end
			else
				BuscarEnRango(a^.hi,unMin,unMax,dimL,v);
		end
		else
			BuscarEnRango(a^.hd,unMin,unMax,dimL,v);
	end;
end;

procedure enOrden(a:arbol);
begin
	if(a<>nil)then begin
		enOrden(a^.hi);
		writeln ('nombre de usuario =', a^.data.nomUsu);
		writeln ('total de paginas =', a^.data.totalPag);
		writeln ('total de documentos =', a^.data.totalDoc);
		writeln ('nombre del ultimo documento =', a^.data.nomDoc);
		enOrden(a^.hd)
	end;
end;

procedure imprimirInfoUsuMaxDoc(infoUsuMaxDoc: estadistica);
begin
	writeln('nombre del usuario que imprimio mas documentos = ', infoUsuMaxDoc.nomUsu);
	writeln('nombre del ultimo documento que imprimio = ', infoUsuMaxDoc.nomDoc);
	writeln('cantidad de paginas que imprimio = ', infoUsuMaxDoc.totalPag);
	writeln('cantidad de documentos que imprimio = ', infoUsuMaxDoc.totalDoc);
end;

procedure pedirDatosMinYMax(var unMin,unMax: string);
begin
	writeln('ingrese el minimo a buscar =');
	readln(unMin);
	writeln('ingrese el maximo a buscar =');
	readln(unMax);
end;

procedure imprimirVector (v: vector; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL-1 do begin //dimL - 1 porque queda en una posicion adelantada
		writeln('nombre de usuario = ', v[i].nomUsu);
		writeln('nombre del ultimo documento impreso = ', v[i].nomDoc);
	end;
end;

//programa PPAL
VAR
	a: arbol;
	max: integer;
	infoUsuMaxDoc: estadistica;
	unMin, unMax: string; //rangos
	v: vector;
	dimL: integer;
BEGIN
	a:= nil;
	dimL:= 1;
	max:= -1;
	inicializarVector(v);
	crearAbb(a);//a) creo y actualizo un abb ordenado por nombre de usuario;
	EnOrden(a); //mostrar elementos del arbol en orden ascendiente segun nombre de usuario (a-Z)
	obtenerUsuMaxDoc(a,max,infoUsuMaxDoc);//b) (podria haber sido una funcion pero considere emplear un procedimiento);
	imprimirInfoUsuMaxDoc(infoUsuMaxDoc); //mostrar la informacion del usuario con mas documentos impresos
	pedirDatosMinYMax(unMin,unMax); //pido y almaceno por teclado el rango de nombres para buscar
	BuscarEnRango(a,unMin,unMax,dimL,v);//c) (queda con el mismo orden que el arbol);
	imprimirVector(v,dimL); //mostrar todos los elementos del vector
END.
