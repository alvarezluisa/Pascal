{Codepage utf8}
Uses FuncionesLu,sysutils;
Var A, B, C :LEnteros;
      t1,t2:double;
      desde, hasta: TDateTime;
      //Diff:Integer;
      i,largo:integer;

Begin
   // Da una longitud a la lista
   largo:=0;
<<<<<<< HEAD
 while largo< 100 do
  begin
=======
while largo< 100000 do
 begin
>>>>>>> 01fb8b8d4a95ded638145cec8872a375aca2d2a9
   largo:=largo+10;
   SetLength(A,largo);
   SetLength(B,largo);
   SetLength(C,largo);

    write ('hola');
   {
   arreglo muy grande
   SetLength(A,1000000);
   ArregloAleatorio(A,9223372036854775807);
   }

   // Asigna numeros aletorios a la lista A con el limite indicado
   ArregloAleatorio(A,900);
   //ArregloOrdenadoDescendente(A,900);
   //ArregloOrdenadoAscendente(A,900);


   for i:=0 to high(A) do Begin B[i]:=A[i]; C[i]:=A[i]; End;
   //Write('A Quick-->  ');
   t1:=time;
   desde:=Now;
   //Imprimir(A);
   OrdenarQuick(A,0, high(A));
   //Write ( 'Lista Ordenada ');
   //Imprimir(A);
   hasta:=Now;
   t2:=time;
   //Write ('El tiempo que toma en ordenar (Para que el tiempo se vea debe ser una lista muy grande) ');
   Write(largo,',',(t2-t1)/1000, ',');
   SetLength(A,0);
   //Writeln(desde- hasta);
   //Write('B Shell-->  ');
   t1:=time;

   //Imprimir(B);
   OrdenarShell(B);
   //Write ( 'Lista Ordenada ');
   //Imprimir(B);
   t2:=time;
   //Write ('El tiempo que toma en ordenar (Para que el tiempo se vea debe ser una lista muy grande) ');
   Write((t2-t1)/1000, ',');
   SetLength(B,0);

   //Write('C Merge-->  ');
   t1:=time;

   //Imprimir(C);
   OrdenarMerge(C,0, high(C));
   //Write ( 'Lista Ordenada ');
   //Imprimir(C);
   t2:=time;
   //Write ('El tiempo que toma en ordenar (Para que el tiempo se vea debe ser una lista muy grande) ');
   Writeln((t2-t1)/1000);
   SetLength(C,0);

 end;
 readln

End.
