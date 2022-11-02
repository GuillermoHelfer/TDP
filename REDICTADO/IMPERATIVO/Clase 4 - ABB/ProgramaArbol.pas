Program arboles;
Type

  // Arbol de enteros
  arbol= ^nodoA;
  nodoA = Record
    dato: integer;
    HI: arbol;
    HD: arbol;
  End;

  // Lista de Arboles PARA IMPRIMIRPORNIVEL
  listaNivel = ^nodoN;
  nodoN = record
    info: arbol;
    sig: listaNivel;
  end;




{-------------------MODULOS PARA IMPRIMIRPORNIVEL------------------------------}

// CONTARELEMENTOS - Devuelve la cantidad de elementos de una lista l

function ContarElementos (l: listaNivel): integer;
  var c: integer;
begin
 c:= 0;
 While (l <> nil) do begin
   c:= c+1;
   l:= l^.sig;
 End;
 contarElementos := c;
end;

//  AGREGARATRAS - Agrega un elemento atr�s en l

Procedure AgregarAtras (var l, ult: listaNivel; a:arbol);
 var nue:listaNivel;

 begin
 new (nue);
 nue^.info := a;
 nue^.sig := nil;
 if l= nil then l:= nue
           else ult^.sig:= nue;
 ult:= nue;
 end;


// IMPRIMIRPORNIVEL - Muestra los datos del �rbol a por niveles

Procedure imprimirpornivel(a: arbol);
var
   l, aux, ult: listaNivel;
   nivel, cant, i: integer;
begin
   l:= nil;
   if(a <> nil)then begin
                 nivel:= 0;
                 agregarAtras (l,ult,a);
                 while (l<> nil) do begin
                    nivel := nivel + 1;
                    cant:= contarElementos(l);
                    write ('Nivel ', nivel, ': ');
                    for i:= 1 to cant do begin
                      write (l^.info^.dato, ' - ');
                      if (l^.info^.HI <> nil) then agregarAtras (l,ult,l^.info^.HI);
                      if (l^.info^.HD <> nil) then agregarAtras (l,ult,l^.info^.HD);
                      aux:= l;
                      l:= l^.sig;
                      dispose (aux);
                     end;
                     writeln;
                 end;
               end;
end;
{-------------------FIN MODULOS PARA IMPRIMIRPORNIVEL-------------------------}
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
	d: integer;
begin
	writeln('ingrese el valor a insertar en el arbol');
	readln(d);
	while (d <> 0) do begin
		InsertarABB(a,d);
		writeln('ingrese el valor a insertar en el arbol');
		readln(d);
	end;
end;

procedure enOrden (a:arbol);
begin
	if (a <> nil) then begin
		enOrden(a^.hi);
		writeln(a^.dato);
		enOrden(a^.hd);
	end;
end;

procedure preOrden (a:arbol);
begin
	if (a <> nil) then begin
		writeln(a^.dato);
		preOrden(a^.hi);
		preOrden(a^.hd);
	end;
end;

procedure postOrden (a:arbol);
begin
	if (a <> nil) then begin
		postOrden(a^.hi);
		postOrden(a^.hd);
		writeln(a^.dato);
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

{PROGRAMA PRINCIPAL}
var
	a: arbol;
	v: integer;
begin
	Randomize;
	a:= nil;
	
	CrearAbb(a);
	imprimirpornivel(a);
	writeln(' ');
	
	enOrden(a);
	writeln(' ');
	preOrden(a);
	writeln(' ');
	postOrden(a);
	writeln(' ');
	
	writeln('ingrese un valor a buscar');
	readln(v);
	if (Buscar(a,v)= nil) then
		writeln('no se encontro el elemento en el arbol')
	else
		writeln('el elemento fue encontrado dentro del arbol');
	writeln(' ');
	
	writeln('el minimno valor dentro del arbol es: ', verMin(a));
	writeln('el maximo valor dentro del arbol es: ', verMax(a));
end.
