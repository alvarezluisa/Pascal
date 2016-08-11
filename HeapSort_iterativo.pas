//Luisa Alvarez Valencia
Uses FuncionesLu,sysutils;

procedure ExchangeParent(var H:LEnteros;i:longint);
var p, aux :longint;
begin
    p:= (i-1) div 2;
    while (H[i] > H[p]) and (i>p) do
    begin 
       aux:=H[i];
       H[i]:=H[p];
       H[p]:=aux;
       i:=p;
       p:=(i-1) div 2;
    end;
end;

procedure Push (var H:LEnteros;c:int64);
var i, cont:longint;
begin
    cont:=0;
    for i:=0 to high(H) do
    begin
         if (H[i]=0) then 
            H[i]:=c
         else
             cont:=cont+1;
    end;
    ExchangeParent (H, cont);
end;

procedure ExchangeChild(var H:LEnteros;i:longint);
var l,r,c, cont,aux,a:longint;
begin
    cont:=0;
    l:= 2*i;
    r:= 2*i +1;

    for a:=0 to high(h) do
    begin
        if H[a]>0 then
           cont:=cont+1; 
    end;
    if H[l]> H [r] then 
       c:=l;
    if H[r]> H [l] then 
       c:=r;

    while (l<=cont) and (H[c] > H[i]) do
    begin
        aux := H[c];
        H[c]:= H[i];
        H[i]:= aux;

        if (H[l]> H [r])then 
            c:=l;
        if H[r]> H [l] then 
           c:=r;
     
    end;

end;

function Pop(var H:LEnteros): int64;
var i,cont:longint;
    aux:int64;
begin
    cont:=0;
    aux:=0;
    for i:=0 to high(H) do
    begin
         if H[i]>0 then 
         cont:=cont+1;
    end;
    Pop:= H[cont-1];
    H[cont-1]:= H[0];
    H[0]:=Pop;
    H[cont-1]:=0;
    ExchangeChild(H,aux);
      
end;



procedure HeapSort(var A:LEnteros);
var aa, h:LEnteros;
var i, cont:longint;
begin
    cont:=0;
    SetLength(aa,high(A));
    SetLength(h, high(A));
    For i:=0 to high(A) do
    begin
        aa[i]:=0;
        h[i]:=0;
    end;

    for i:=0 to high(A) do
    begin
        Push(h, A[i]);
    end;
    
    for i:=0 to high(h) do
    begin
        if h[i]>0 then
           cont:=cont+1; 
    end;

    while cont>0 do
    begin
        for i:=0 to high(aa) do
        begin
           if aa[i] =0 then
              aa[i]:=Pop(h);
        end;
    end; 

end;



//-------------------main
var A:LEnteros;
    desde, hasta: TDateTime;
    tam,i:longint;
Begin
    tam:=10;
    SetLength(A,tam);
    ArregloAleatorio(A,900);

    for i:=0 to tam-1 do
       write (A[i], ' ');
    writeln('Tiempo');

    desde:=time;
    HeapSort(A);
    hasta:=time;
    Writeln(tam,',',(hasta-desde)/1000);
    for i:=0 to tam-1 do
       write (A[i], ' ');

End.


