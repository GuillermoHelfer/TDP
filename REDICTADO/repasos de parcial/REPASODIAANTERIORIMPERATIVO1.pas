program Helfer;
const
	cant_planes = 5;
	cantMax_afiliadosPlan = 500;
type
	subr_plan = 1..cant_planes;
	subr_afiliadosPlan = 1..cantMax_afiliadosPlan;
	
	afiliado = record
		num: integer;
		dni: integer;
		plan: subr_plan;
		anio: integer;
	end;
	
	arbol = ^nodo;
	
	nodo = record
		data : afiliado;
		hi: arbol;
		hd: arbol;
	end;

	
	afiliadoP = record
		num: integer;
		dni: integer;
	end;
	
	vector = array [subr_afiliadosPlan] of afiliadoP;
	
//modulos
procedure inicializarVector(var v:vector);
var
	i: integer;
begin
	for i:= 1 to cantMax_afiliadosPlan do
		v[i].num := -1;
		v[i].dni := -1;
end;

procedure crearAbb(var a:arbol); //se dispone ordenado por num
var
	afi: afiliado;
begin
end;

procedure crearVectorDesdeArbol(a: arbol; var v:vector; dimL: integer; Num1, Num2: integer; plan: subr_plan);
begin
	if (a <> nil) then begin
		if ((a^.data.dni >= Num1)and(a^.data.dni <= Num2)) then begin
			if ((a^.data.plan = plan)and(dimL <= cantMax_afiliadosPlan)) then begin
				v[dimL].num := a^.data.num;
				v[dimL].dni := a^.data.dni;
				dimL:= dimL+1;
			end;
		end;
		crearVectorDesdeArbol(a^.hi, v, dimL, Num1, Num2, plan);
		crearVectorDesdeArbol(a^.hd, v, dimL, Num1, Num2, plan);
	end;
end;


//programa ppal
VAR
	a: arbol;
	v: vector;
	dimL: integer;
	Num1, Num2: integer;
	plan: subr_plan;
BEGIN
	dimL:= 0;
	inicializarVector(v);
	crearAbb(a); //se dispone ordenado por num
	writeln('ingrese el numero minimo');
	readln(Num1);
	writeln('ingrese el numero maximo');
	readln(Num2);
	writeln('ingrese el plan (del 1 al 5)');
	readln(plan);
	crearVectorDesdeArbol(a,v,dimL,Num1,Num2,plan);
END.
