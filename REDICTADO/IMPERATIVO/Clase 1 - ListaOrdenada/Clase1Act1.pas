program NumAleatorio;

var num: integer;

begin
	Randomize;
	num:= random(100);
	writeln('el numero aleatorio generado es: ', num);
	readln;
end.

{B. el programa elige un numero aleatorio del 0 al 99 y lo 
* imprime en pantalla}
