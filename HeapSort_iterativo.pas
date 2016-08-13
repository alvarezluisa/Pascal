//Luisa Alvarez Valencia

Uses FuncionesLu,sysutils,math, DateUtils;

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

    while (l<= High(H)-1) and (H[c] > H[i]) do

    begin
        aux := H[c];
        H[c]:= H[i];
        H[i]:= aux;

        i:=c;
        l:= 2*i+1;
        r:= 2*i +2;

        if (H[l]> H [r])then 
            c:=l;
        if H[r]> H [l] then 
           c:=r;

    end;

end;

function Pop(var H:LEnteros): int64;
var aux, aux2:int64;
    i:longint;
begin

    Pop:=H[0];
    aux2:= H[high(H)-1];
    H[high(H)]:= H[0];
    H[0]:=aux2;
    {for i:=0 to high(H) do
       write (H[i], ' ');
    writeln(' ');
    
    writeln(Pop);
    }
    H[High(H)] := H[High(H)-1];
    SetLength(H,high(H));
    ExchangeChild(H,0);


    aux:=0;

    Pop:=H[0];
    aux2:= H[high(H)-1];
    H[high(H)]:= H[0];
    H[0]:=aux2;
    {for i:=0 to high(H) do
       write (H[i], ' ');
    writeln(' ');
    }
    //writeln(Pop);
    SetLength(H,high(h));
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

    {for i:=0 to high(H) do
       write (H[i], ' ');
    writeln('ahi ');
    }
    while high(H)>0 do
    begin
         //writeln('tam', high(H));
         SetLength(HeapSort,high(HeapSort)+2);
         //writeln('tamHeap', high(HeapSort));
         HeapSort[high(HeapSort)-1]:=Pop(H);
         //writeln('tam', high(H));

    {bien
    for i:=0 to high(H) do
       write (H[i], ' ');
    writeln('ahi ');
    }
    end; 

end;



//-------------------main

var A,B, C:LEnteros;

    desde, hasta: TDateTime;
    tam,i:longint;
Begin
    tam:=10;

    while tam<11 do
    begin
	    SetLength(A,tam);
	    SetLength(C,tam);
	    //A:=[1,2,10,6,7,3,4,5,8,9];
	    ArregloAleatorio(A,900);
	    
	    for i:=0 to tam-1 do
	      C[i]:=A[i];

	    desde:=now;
	    B:=HeapSort(A);
	    hasta:=now;
	    Write(tam,',',MilliSecondsBetween(desde, hasta), ',');
	    {for i:=0 to high(B)-1 do
	       write (B[i], ' ');
	    writeln('heap ');
            }
	    desde:=now;
	    OrdenarQuick(C, 0, high(C));
	    hasta:=now;
	    Writeln(MilliSecondsBetween(desde, hasta));
	    {for i:=0 to high(C)  do
	       write (C[i], ' ');
	    writeln(' ');
            }

            tam:=tam+10;
    end;
End.


