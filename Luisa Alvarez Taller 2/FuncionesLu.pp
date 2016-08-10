//Crea una unidad para que pueda ser llamada desde otro programa
//Luisa Alvarez Valencia
// La unidad se llama listas, crea una lista de numeros aletorios enteros
// utiliza una libreria
// Indica el nombre del procedimiento y luego lo implementa
// Contiene los diferentes algoritmos de ordenación
Unit FuncionesLu;
Interface
Uses sysutils,math;
 Type
   LEnteros=array of int64;

Procedure ArregloAleatorio(A:LEnteros;n:int64);
Procedure Imprimir (A:LEnteros);
Procedure OrdenarShell(A:LEnteros);
procedure OrdenarQuick(var A: LEnteros; Izq,Der: int64) ;
procedure OrdenarMerge (Var t :LEnteros; g, d : integer);
Procedure ArregloOrdenadoAscendente(A:LEnteros; cantidad:int64);
Procedure ArregloOrdenadoDescendente(A:LEnteros; cantidad:int64);

Implementation
Procedure ArregloOrdenadoAscendente(A:LEnteros; cantidad:int64);
var i :longint;
begin
    for i := 1 to cantidad do
    begin
      A[i] := i;
    end;
end;

Procedure ArregloOrdenadoDescendente(A:LEnteros; cantidad:int64);
var i ,aux:longint;
begin
    aux := cantidad;
    for i := 1 to cantidad do
    begin
      A[i] := cantidad;
      cantidad:=cantidad-1;
    end;
end;
Procedure OrdenarMerge (Var t :LEnteros; g, d : integer);
Var
   m, i, j, k,tam : integer;
   s : LEnteros;
Begin
     tam:=high(t);
     SetLength(s,tam);
     If d > g Then
     Begin
          m := (g + d) Div 2;
          OrdenarMerge (t, g, m);
          OrdenarMerge (t, m + 1, d);

     For i := m DownTo g Do
              s[i] := t[i];

     For j := m + 1 To d Do
              s[d + m + 1 - j] := t[j];

     i := g; j := d;
          For k := g To d Do
          Begin
               If s[i] < s[j] Then
               Begin
                    t[k] := s[i];
                    i := i + 1;
               End
               Else
                   Begin
                         t[k] := s[j];
                         j := j - 1;
                   End;
          End;
     End;
End;



Procedure ArregloAleatorio(A:LEnteros;n:int64);
 Var i:longint;
       cifras,j:byte;
       m:qword;
Begin
   Randomize;
   cifras:=length(IntToStr(n))-1;
   for i:=low(A) to High(A) do
      Begin
         A[i]:=random(n);
         m:=1;
         for j:=1 to random(cifras) do m:=m*10;
         A[i]:=A[i] div m;
         if random(2)=0 then A[i]:=A[i]*-1;
      End;
End;

Procedure Imprimir (A:LEnteros);
Var i: longint;
Begin
for i:=0 to high(A) do
	Begin
	Write (A[i], ' ');
 	End;
Writeln;
end;

Procedure OrdenarShell(A:LEnteros);
Var i,j:longint;
      aux:int64;
      intv:longword;
 Begin
     intv:=length(A) div 2;
     While intv>0 do
       Begin
          for i:=intv to high(A) do
             Begin
                j:=i-intv;
                aux:=A[i];
                while ((j>=0) and (aux<A[j])) do
                   Begin
                      A[j+intv]:=A[j];
                      j:=j-intv
                   End;
                 A[j+intv]:=aux
             End;
           intv:=intv div 2
       End;
 End;


procedure OrdenarQuick(var A: LEnteros; Izq,Der: int64) ;
 var
   auxIzq,auxDer:int64;
   Pivote,aux:int64;
Begin
   auxIzq:=Izq;
   auxDer:=Der;
   Pivote := A[(auxIzq + auxDer) div 2];
   repeat
   //Ascendente
     while A[auxIzq] < Pivote do Inc(auxIzq) ;
     while A[auxDer] > Pivote do Dec(auxDer) ;
     if auxIzq <= auxDer then
     begin
       //intercambio
       aux := A[auxIzq];
       A[auxIzq] := A[auxDer];
       A[auxDer] := aux;

       Inc(auxIzq) ;
       Dec(auxDer) ;
     end;
   until auxIzq > auxDer;
   if auxDer > Izq then OrdenarQuick(A, Izq,auxDer) ;
   if auxIzq < Der then OrdenarQuick(A,auxIzq,Der) ;
End;

Begin
End.
