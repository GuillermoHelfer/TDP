program repaso3;
procedure BuscarEnRango(abb:ABB; unMin, unMax: integer);
begin
	if(abb <> nil) then begin
		if(abb^dato.orden >= unMin) then begin
			if(abb^.dato.orden <= unMax) then begin
				moverIzquierda
				//procesar
				moverDerecha
			end
			else
				moverIzquierda
		else
			moverDerecha
	end;
end;

procedure crearYActualizarArbol (var a, nue:abb; dato:registro)
begin
	if (a = nil) then begin
		new(nue);s
		nue^.dato:= dato;
		a:= nue;
	end
	else begin
		if(a^.dato.codProd = dato.codProd) then begin
			a^.dato.cantVentas := a^.dato.cantVentas + dato.cantVentas;
			a^.dato.montoTotal := a^.dato.montoTotal + dato.montoTotal;
		end
		else begin
			if(a^.dato.codProd < dato.codProd)
				crearArbol(a^.hd, nue, dato)
			else
				crearArbol(a^.hi, nue, dato)
		end;
	end;
end;
