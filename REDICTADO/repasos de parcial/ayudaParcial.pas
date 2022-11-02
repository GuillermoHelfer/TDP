program AYUDAPARCIAL;

// Listas
type
	lista=^nodo;
	nodo=record
		dato:integer;
		sig:lista;
	end;
	
procedure agregarAdelante(var l:lista; dato:integer);
var
	aux:lista;
begin
	new(aux);
	aux^.dato:=dato;
	aux^.sig:=l;
	l:=aux;
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

procedure InsertarOrdenado(var l:lista; dato:integer);
var
	aux,ant,act:lista;
begin
	new(aux);
	aux^.dato:=dato;
	act:=l;
	while( (act<>nil) and (dato > act^.dato) ) do
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

procedure EliminarDeLista(var l:lista; dato:integer);
var
	ant,act:lista;
begin
	act:=l;
	while( (act<>nil) and (dato <> act^.dato) ) do
	begin
		ant:=act;
		act:=act^.sig;
	end;
	if(act <> nil) then
	begin
		if(act = l) then
			l:=act^.sig
		else
			ant^.sig:=act^.sig;
		dispose(act);
	end;
end;

procedure ImprimirLista(l:lista);
begin
	while(l<>nil) do begin
		writeln(l^.data);
		l := l^.sig;
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

//Lista con Recursion
procedure ImprimirListaRec(l:lista);
begin
  if(l<>nil)then 
  begin 
    writeln(l^.dato);
    ImprimirLista(l^.sig);
  end;
end;

procedure ImprimirEnOrden(l:lista);
begin
  if(l<>nil) then begin
    writeln(l^.dato);
    ImprimirEnOrden(l^.sig)
  end;
end;

procedure ImprimirEnOrdenInverso(l:lista);
begin
  if(l<>nil) then begin 
    ImprimirEnOrdenInverso(l^.sig);
    writeln(l^.dato);
  end; 
end;

Function maximoRec(l:lista):integer;
var
	x1:integer;
	x2:integer;
begin
	if(l=nil) then
		maximoRec:=-1
	else begin
		x1:=maximoRec(l^.sig);
		x2:=l^.dato;
		if(x1<x2)then
			maximoRec:=x2
		else
			maximoRec:=x1;
    end;
end;

Function minimoRec(l:lista):integer;
var
	x1:integer;
	x2:integer;
begin
	if(l=nil) then
		minimoRec:=9999
	else begin
		x1:=minimoRec(l^.sig);
		x2:=l^.dato;
		if(x1>x2)then
			minimoRec:=x2
		else
			minimoRec:=x1;
    end;
end;

function Buscar(a: arbol; v:integer): arbol;
begin
	if (a = nil) then
		Buscar:= nil
	else begin
		if (v = a^.dato) then
			Buscar:= a
		else begin
			if(v > a^.dato) then
				Buscar:= Buscar(a^.hd,v)
			else 
				Buscar:= Buscar(a^.hi,v)
		end;
	end;
end;

// PP
write('Ingrese valor a buscar ');
  readln(valor);
  while(valor<>-1) do
  begin
	  pude:=false;
	  if(buscar(l,valor,pude)) then
		writeln('el valor ',valor,' se encuentra en la lista')
	  else
		writeln('el valor ',valor,' no se encuentra en la lista');
	  write('Ingrese valor a buscar ');
	  readln(valor);
  end;
  
Function buscar1(l:lista; valor:integer):boolean; //otra forma
begin
	if(l<>nil) then
	begin
		if (valor <> l^.datos) then 
			buscar1:=buscar1(l^.sig,valor)
		else
			if (valor = l^.datos)then
				buscar1:=true;
	end
	else
		buscar1:=false;
end;
//PP
write('Ingrese valor a buscar ');
  readln(valor);
  while(valor<>-1) do
  begin
	  writeln(buscar1(l,valor));
	  write('Ingrese valor a buscar ');
      readln(valor);
  end;
  
// VECTORES
procedure OrdenacionPorInsercion(var v:vector; dimL:integer);
var i,j,actual:integer;
begin
  for i:=2 to dimL do begin
    actual:=v[i];
    j:=i-1;
    while((j>0) and (v[j] > actual)) do begin
  	  v[j+1]:= v[j];
	  j:=j-1
    end;
    v[j+1]:=actual
  end;
end;

procedure BuscarElementoVectorOrdenado(v:vector; dimL:integer);
var valor,pri,ult,medio:integer;
begin
  write('Ingrese valor a buscar: ');
  readln(valor);
  pri:=1;
  ult:=dimL;
  medio:=(pri+ult) div 2;
  while( ((pri < ult) or (pri = ult)) and (v[medio]<>valor)) do begin
	if(valor<v[medio])then
	  ult:=medio-1
	else
	  pri:=medio+1;
	medio:= (pri+ult) div 2
  end;
  if (pri > ult)then
    writeln('0')
  else
    writeln('el valor buscado esta en la posicion: ',medio);
end;

Procedure borrar(var a :vector; var dim:integer; pos:integer;var pude:boolean);
var
	i:integer;
Begin
	pude:= false;
	if ((pos>=1)and (pos<=dim))then begin 
		for i:= pos to (dim-1) do
			a[i]:= a[i+1];  
		pude:= true;
		dim:= dim - 1;
	end; 
end;

//Recursividad
function ContarElementosLista (l: listaNivel): integer;
  var c: integer;
begin
 c:= 0;
 While (l <> nil) do begin
   c:= c+1;
   l:= l^.sig;
 End;
 contarElementosLista := c;
end;

function ContarElementosArbol(a: arbol): integer;
begin
	if (a <> nil) then begin
		if ((a^.data.monto >= 10000)and(a^.data.monto <= 50000)) then
			ContarElementosArbol := ContarElementosArbol(a^.hi) + ContarElementosArbol(a^.hd) + 1;
		else
			ContarElementosArbol := ContarElementosArbol(a^.hi) + ContarElementosArbol(a^.hd);
	end;
	else
		ContarElementosArbol:= 0;
end;

procedure digitoMaximoRec(n: integer;  var max: digito);
var
	dig: integer;
begin
	if (n <> 0) then 
	begin
		dig:= n mod 10;
        if (dig > max) then
			max:= dig;
        n:= n div 10;
        digitoMaximoRec(n, max);
    end;
end;

procedure ImprimirDigitosOrdenInverso(n:integer);
var	
	dig:integer;
begin
	if(n <> 0) then 
	begin
		dig:= n mod 10;
		writeln(dig);
		ImprimirDigitosOrdenInverso(n div 10);
	end;
end;

procedure ImprimirDigitosOrden(n:integer);
var	
	dig:integer;
begin
	if(n <> 0) then begin
		dig:= n mod 10;
		ImprimirDigitosOrden(n div 10 );
		writeln(dig);
	end;
end;

// Merge
procedure inicializarVectorDeListas(var v:vector);
var
	i: integer;
begin
	for i:= 1 to dias_semana do
		v[i]:= nil;
end;

procedure CrearVectorListas(var v:vector);
var
	i,ISBN:integer;
begin
	for i:=1 to dimF do begin
		ISBN:=random(16);
		while(ISBN<>0) do begin
			InsertarOrdenado(v[i],ISBN);
			ISBN:=random(16);
		end;
	end;
end;

procedure DeterminarMinimo(var v:vector; var min:integer);
var
	i,i_min:integer;
begin
	min:=valorGrande;
	for i:=1 to dimF do begin
		if(v[i]<>nil)then begin
			if(v[i]^.ISBN<min)then begin
				min:=v[i]^.ISBN;
				i_min:=i;
			end;
		end;
	end;
	if(min<>valorGrande)then
		v[i_min]:=v[i_min]^.sig;	
end;


procedure merge(v:vector; var l:lista);
var
	min:integer;
	ult:lista;
begin
	DeterminarMinimo(v,min);
	while(min<>valorGrande) do begin
		AgregarAtras(l,ult,min);
		DeterminarMinimo(v,min);
	end;
end;
// Merge acumulador el deteminarMinimo no cambia
procedure DeterminarMinimo(var v:vector; var min:gastos);
var
	i,i_min:integer;
begin
	min.tipo:=valorGrande;
	for i:=1 to dimF do begin
		if(v[i]<>nil)then begin
			if(v[i]^.dato.tipo<min.tipo)then begin
				min:=v[i]^.dato;
				i_min:=i;
			end;
		end;
	end;
	if(min.tipo<>valorGrande)then
		v[i_min]:=v[i_min]^.sig;
end;

procedure mergeAcumulador(v:vector; var l:lista);
var
	ven,act:gastos;
	ult:lista;
	total:real;
begin
	DeterminarMinimo(v,ven);
	
	while(ven.tipo<>valorGrande) do begin
		act:=ven;
		total:=0;
		while(ven.tipo=act.tipo) do begin
			total:=total+ven.monto;
			DeterminarMinimo(v,ven);
		end;
		act.monto:=total;
		AgregarAtras(l,ult,act);
	end;
end;

//Arboles
Type

  // Arbol de enteros
  arbol= ^nodoA;
  nodoA = Record
    dato: integer;
    HI: arbol;
    HD: arbol;
  End;

procedure enOrden(a:arbol);	//( subárbol izquierdo; raíz; subárbol derecho)
begin
	if(a<>nil)then begin
		enOrden(a^.HI);
		writeln (a^.dato);
		enOrden(a^.HD)
	end;
end;

procedure preOrden(a:arbol); //( raíz; subárbol izquierdo; subárbol derecho)
begin
	if (a <> nil) then begin
		writeln (a^.dato);
		preOrden(a^.HI);
		preOrden(a^.HD);
	end;
end;

procedure postOrden(a:arbol); //( subárbol izquierdo; subárbol derecho ; raíz)
begin
	if (a <> nil) then begin
		postOrden(a^.HI);
		postOrden(a^.HD)
		writeln (a^.dato);
	end;
end;

procedure EnOrden(a:arbol);
begin
	if (a <> nil) then begin
		EnOrden(a^.HI);
		writeln (a^.dato);
		EnOrden(a^.HD);
	end;
end;

function Buscar (a:arbol; dato: integer):arbol;
begin
	if (a=nil) then
		Buscar:=nil
	else
		if (dato= a^.dato) then 
			Buscar:=a
		else
			if (dato < a^.dato) then
				Buscar:=Buscar(a^.HI ,dato)
			else
				Buscar:=Buscar(a^.HD ,dato);
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

function verMin(a:arbol): integer;
begin
	if (a = nil)then
		verMin:= -1
	else begin
		if(a^.hi <> nil)then
			verMin:= verMin(a^.hi)
		else
			verMin:= a^.dato
	end;
end;

function verMax(a: arbol): integer;
begin
	if(a=nil)then
		verMax:= -1
	else begin
		if(a^.hd <> nil)then
			verMax:= verMax(a^.hd)
		else
			verMax:= a^.dato
	end;
end;

procedure InsertarABB (var a:arbol; d:integer);
begin
	if (a = nil) then begin
		new(a); a^.dato:= d;
		a^.hi:= nil; a^.hd:= nil;
	end
	else begin
		if(d < a^.dato) then
			InsertarABB(a^.hi,d)
		else begin
			if (d > a^.dato) then
				InsertarABB(a^.hd,d)
		end;
	end;
end;


procedure CrearAbb(var a:arbol);
var
	d: tipoDato;
begin
	leerData(d)
	while (d <> corte) do begin
		InsertarABB(a,d);
		leerData(d);
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
			a^.data.tipo := dato.tipo;
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

procedure BuscarEnRango1(a:arbol; unMin, unMax: integer);
begin
	if(a <> nil) then begin
		if(a^data.orden >= unMin) then begin
			if(a^.data.orden <= unMax) then begin
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

////////////////////////////////////////
programa eje1

procesos {modulos}
  proceso {nombre}
  comenzar

  fin

areas
  area1: Area{tipo}() {delimitar area}

robots
  robot {nombre robot}
  comenzar

  fin

variables

comenzar
  AsignarArea() {robots Area}
  Iniciar() {robots Pos}
fin

