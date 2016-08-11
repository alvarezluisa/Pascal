//Luisa Alvarez Valencia
Uses FuncionesLu,sysutils,math;

procedure ExchangeParent(var H:LEnteros;i:longint);
var p, aux :longint;
begin
    p:= floor((i-1) div 2);
    while (H[i] > H[p]) and (i>p) do
    begin 
       aux:=H[i];
       H[i]:=H[p];
       H[p]:=aux;
       i:=p;
       p:=floor((i-1) div 2);
    end;
end;

procedure Push (var H:LEnteros;c:int64);
var i:longint;
begin

    SetLength(H,high(H)+2);
    H[high(H)-1]:=c;
    //writeln(c);
    {for i:=0 to high(H) do
       write (H[i], ' ');
    writeln(' ');
    }
    ExchangeParent (H, high(H)-1);
end;

procedure ExchangeChild(var H:LEnteros;i:longint);
var l,r,c,aux,tam:longint;
begin
    l:= 2*i+1;
    r:= 2*i +2;
    tam:=high(H);

    if (H[l]> H [r])then 
        c:=l;
    if H[r]> H [l] then 
        c:=r;
    while (l<= tam) and (H[c] > H[i]) do
    begin
        aux := H[c];
        H[c]:= H[i];
        H[i]:= aux;

        if (H[l]> H [r])then 
            c:=l;
        if H[r]> H [l] then 
           c:=r;

        l:= 2*i+1;
        r:= 2*i +2;
        tam:=high(H);
    end;

end;

function Pop(var H:LEnteros): int64;
var aux, aux2:int64;
    i:longint;
begin
    aux:=0;

    Pop:=H[0];
    aux2:= H[high(H)-1];
    H[high(H)-1]:= H[0];
    H[0]:=aux2;
    for i:=0 to high(H) do
       write (H[i], ' ');
    writeln(' ');
    //writeln(Pop);
    SetLength(H,high(h)-1);
    ExchangeChild(H,aux);
      
end;



function HeapSort(var A:LEnteros):LEnteros;
var H:LEnteros;
var i:longint;
begin
    SetLength(HeapSort,1);
    SetLength(H, 1);

    for i:=0 to high(A) do
    begin
        Push(H, A[i]);
        //write (H[i], ' ');
    end;
    //SetLength(H,High(h)-1);
    //writeln(' ');
    for i:=0 to high(H) do
       write (H[i], ' ');
    writeln('ahi ');

    while high(H)>0 do
    begin
         SetLength(HeapSort,high(HeapSort)+2);
         HeapSort[high(HeapSort)-1]:=Pop(H);
    end; 

end;



//-------------------main
var A,B:LEnteros;
    desde, hasta: TDateTime;
    tam,i:longint;
Begin
    tam:=10;
    SetLength(A,tam);
    //A:=[1,2,10,6,7,3,4,5,8,9];
    ArregloAleatorio(A,900);

    for i:=0 to tam-1 do
       write (A[i], ' ');
    writeln(' ');

    desde:=now;
    B:=HeapSort(A);
    hasta:=now;
    Writeln(tam,',',(hasta-desde)/1000);
    for i:=0 to high(B) do
       write (B[i], ' ');
    writeln(' ');

End.


