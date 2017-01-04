{--------------------------}program TETRIS;{---------------------------}
  uses Crt,Graph;
    label 1,4,123;
      const a=12;b=30;x=14;{razmeri zoni}
            s1=6;s2=3;s3=7;s4=9;s5=12;s6=13;s7=2;{zveta kubov}
        var z:array[1..a,1..b] of integer;{matriza karti}
            i,j,p,g,Gd,Gm,n,m,r,h,t,t1,t11,y,skor:integer;
            q:char;{peremenaia klavi}
            ochki,t1a,t11a,skor1:string;{parametri}
            shet:longint;
            pusk,vniz:real;
{----------------------------------------------------------------------}
{procedure i function}
procedure steranie(i,j:integer);{steranie predidushego}
  begin
    setfillstyle(1,0);
    bar(213+(x*i)+i,x*j+11,213+x+(x*i)+i,x*j+x+10);
  end;
procedure vivod(i,j,zvet:integer);{vivod kubika}
  begin
    setfillstyle(1,zvet);
    bar3d(213+(x*i)+i,x*j+11,213+x+(x*i)+i,x*j+x+10,0,true);
      putpixel(213+(x*i)+i,x*j+11,0);
      putpixel(213+(x*i)+i,x*j+10+x,0);
      putpixel(213+x+(x*i)+i,x*j+11,0);
      putpixel(213+x+(x*i)+i,x*j+10+x,0);
  end;
procedure f1;{dalee idut razlichnie perevoroti kubov}
  begin
    z[i,j]:=2;
      vivod(i,j,s2);
    z[i,j+1]:=2;
      vivod(i,j+1,s2);
    z[i+1,j]:=2;
      vivod(i+1,j,s2);
    z[i+2,j]:=2;
      vivod(i+2,j,s2);
  end;
procedure f11;
  begin
    z[i,j]:=2;
      vivod(i,j,s2);
    z[i+1,j]:=2;
      vivod(i+1,j,s2);
    z[i,j-1]:=2;
      vivod(i,j-1,s2);
    z[i,j-2]:=2;
      vivod(i,j-2,s2);
  end;
procedure f12;
  begin
    z[i,j]:=2;
      vivod(i,j,s2);
    z[i-1,j]:=2;
      vivod(i-1,j,s2);
    z[i-2,j]:=2;
      vivod(i-2,j,s2);
    z[i,j-1]:=2;
      vivod(i,j-1,s2);
  end;
procedure f13;
  begin
    z[i,j]:=2;
      vivod(i,j,s2);
    z[i-1,j]:=2;
      vivod(i-1,j,s2);
    z[i,j+1]:=2;
      vivod(i,j+1,s2);
    z[i,j+2]:=2;
      vivod(i,j+2,s2);
  end;
procedure f2;
  begin
    z[i,j]:=3;
      vivod(i,j,s3);
    z[i-1,j]:=3;
      vivod(i-1,j,s3);
    z[i+1,j]:=3;
      vivod(i+1,j,s3);
    z[i+2,j]:=3;
      vivod(i+2,j,s3);
  end;
procedure f25;
  begin
    z[i,j+2]:=3;
      vivod(i,j+2,s3);
    z[i,j+1]:=3;
      vivod(i,j+1,s3);
    z[i,j]:=3;
      vivod(i,j,s3);
    z[i,j-1]:=3;
      vivod(i,j-1,s3);
  end;
procedure f3;
  begin
    z[i,j]:=4;
      vivod(i,j,s4);
    z[i,j+1]:=4;
      vivod(i,j+1,s4);
    z[i-1,j]:=4;
      vivod(i-1,j,s4);
    z[i-2,j]:=4;
      vivod(i-2,j,s4);
  end;
procedure f31;
  begin
    z[i,j]:=4;
      vivod(i,j,s4);
    z[i+1,j]:=4;
      vivod(i+1,j,s4);
    z[i,j+1]:=4;
      vivod(i,j+1,s4);
    z[i,j+2]:=4;
      vivod(i,j+2,s4);
  end;
procedure f32;
  begin
    z[i,j]:=4;
      vivod(i,j,s4);
    z[i,j-1]:=4;
      vivod(i,j-1,s4);
    z[i+1,j]:=4;
      vivod(i+1,j,s4);
    z[i+2,j]:=4;
      vivod(i+2,j,s4);
  end;
procedure f33;
  begin
    z[i,j]:=4;
      vivod(i,j,s4);
    z[i-1,j]:=4;
      vivod(i-1,j,s4);
    z[i,j-1]:=4;
      vivod(i,j-1,s4);
    z[i,j-2]:=4;
      vivod(i,j-2,s4);
  end;
procedure f4;
  begin
    z[i,j]:=5;
      vivod(i,j,s5);
    z[i,j+1]:=5;
      vivod(i,j+1,s5);
    z[i-1,j]:=5;
      vivod(i-1,j,s5);
    z[i+1,j]:=5;
      vivod(i+1,j,s5);
  end;
procedure f41;
  begin
    z[i,j-1]:=5;
      vivod(i,j-1,s5);
    z[i,j]:=5;
      vivod(i,j,s5);
    z[i,j+1]:=5;
      vivod(i,j+1,s5);
    z[i+1,j]:=5;
      vivod(i+1,j,s5);
  end;
procedure f42;
  begin
    z[i,j]:=5;
      vivod(i,j,s5);
    z[i,j-1]:=5;
      vivod(i,j-1,s5);
    z[i-1,j]:=5;
      vivod(i-1,j,s5);
    z[i+1,j]:=5;
      vivod(i+1,j,s5);
  end;
procedure f43;
  begin
    z[i,j]:=5;
      vivod(i,j,s5);
    z[i,j-1]:=5;
      vivod(i,j-1,s5);
    z[i-1,j]:=5;
      vivod(i-1,j,s5);
    z[i,j+1]:=5;
      vivod(i,j+1,s5);
  end;
procedure f5;
  begin
    z[i-1,j]:=6;
      vivod(i-1,j,s6);
    z[i,j+1]:=6;
      vivod(i,j+1,s6);
    z[i+1,j+1]:=6;
      vivod(i+1,j+1,s6);
    z[i,j]:=6;
      vivod(i,j,s6);
  end;
procedure f55;
  begin
    z[i,j]:=6;
      vivod(i,j,s6);
    z[i-1,j+1]:=6;
      vivod(i-1,j+1,s6);
    z[i,j-1]:=6;
      vivod(i,j-1,s6);
    z[i-1,j]:=6;
      vivod(i-1,j,s6);
  end;
procedure f6;
  begin
    z[i-1,j+1]:=7;
      vivod(i-1,j+1,s7);
    z[i,j+1]:=7;
      vivod(i,j+1,s7);
    z[i,j]:=7;
      vivod(i,j,s7);
    z[i+1,j]:=7;
      vivod(i+1,j,s7);
  end;
procedure f66;
  begin
    z[i,j]:=7;
      vivod(i,j,s7);
    z[i,j-1]:=7;
      vivod(i,j-1,s7);
    z[i+1,j]:=7;
      vivod(i+1,j,s7);
    z[i+1,j+1]:=7;
      vivod(i+1,j+1,s7);
  end;
procedure proverka;{vivod vsei karti na ekran}
  var L,K,p:integer;
  begin
    L:=0;
      repeat
        L:=L+1;
        k:=0;
          for p:=1 to a do
            begin
              k:=k+1;
                if z[k,L]=1 then
                  vivod(k,L,s1)
                else
                if z[k,L]=2 then
                  vivod(k,L,s2)
                else
                if z[k,L]=3 then
                  vivod(k,L,s3)
                else
                if z[k,L]=4 then
                  vivod(k,L,s4)
                else
                if z[k,L]=5 then
                  vivod(k,L,s5)
                else
                if z[k,L]=6 then
                  vivod(k,L,s6)
                else
                if z[k,L]=7 then
                  vivod(k,L,s7)
                else
                  steranie(k,L);
            end;
      until L=b;
  end;
procedure merzanie;{kogda zarobotano ochko}
  var n:integer;
  begin
    n:=0;
      repeat
        n:=n+1;
          setfillstyle(8,14);
            bar(228,x*h+11,407,x*h+x+10);
          setfillstyle(8,0);
            bar(228,x*h+11,407,x*h+x+10);
            {sound(300);
            delay(10);
            nosound;}{esli eto otkrit to budet muzika}
      until n=500;
  end;
procedure sled(t01:integer);{izobrochenie sleduichego kubika}
  begin
    setfillstyle(1,0);
    bar(216-4*x-7,x+11,216,x+10+2*x);
      if t01=0 then begin vivod(-4,1,s1);vivod(-3,1,s1);vivod(-4,2,s1);vivod(-3,2,s1);end;
      if t01=1 then begin vivod(-4,1,s2);vivod(-4,2,s2);vivod(-3,1,s2);vivod(-2,1,s2);end;
      if t01=2 then begin vivod(-4,1,s3);vivod(-3,1,s3);vivod(-2,1,s3);vivod(-1,1,s3);end;
      if t01=3 then begin vivod(-4,1,s4);vivod(-3,1,s4);vivod(-2,1,s4);vivod(-2,2,s4);end;
      if t01=4 then begin vivod(-4,1,s5);vivod(-3,1,s5);vivod(-2,1,s5);vivod(-3,2,s5);end;
      if t01=5 then begin vivod(-4,1,s6);vivod(-3,1,s6);vivod(-3,2,s6);vivod(-2,2,s6);end;
      if t01=6 then begin vivod(-4,2,s7);vivod(-3,2,s7);vivod(-3,1,s7);vivod(-2,1,s7);end;
  end;
procedure zikl;{proverka na ochko}
  begin
    h:=0;
      for p:=1 to b do
        begin
          h:=h+1;
            if (z[1,h]<>0) and (z[2,h]<>0) and (z[3,h]<>0) and
               (z[4,h]<>0) and (z[5,h]<>0) and (z[6,h]<>0) and
               (z[7,h]<>0) and (z[8,h]<>0) and (z[9,h]<>0) and
               (z[10,h]<>0) and (z[11,h]<>0) and (z[12,h]<>0) then
              begin
                merzanie;
                    m:=h+1;
                    y:=y+1;
                      setfillstyle(1,0);
                      bar(290,2,375,9);
                        str(y,ochki);
                          setcolor(12);
                          outtextxy(290,2,ochki);
            if y mod 30=0 then
              begin
                pusk:=pusk-(pusk/10);
                skor:=skor+1;
                str(skor,skor1);
                  setfillstyle(1,0);
                  bar(290,12,375,19);
                    setcolor(12);
                    outtextxy(290,12,skor1);
              end;
      for g:=b-h to b-2 do
        begin
          m:=m-1;
          r:=0;
      for n:=1 to a do
        begin
           r:=r+1;
           z[r,m]:=z[r,m-1];
        end;
        end;
              end;
        end;
          i:=6;
          j:=2;
          shet:=shet+1;
            if shet mod 2=1 then
              begin
                t:=t11;
                  t1:=random(7);
                    sled(t1);
              end
            else
              begin
                t:=t1;
                  t11:=random(7);
                    sled(t11);
              end;
                proverka;
                  vniz:=pusk-1;
  end;
procedure help;
begin
setfillstyle(1,12);
  bar(237,200,400,300);
setcolor(2);
outtextxy(240,203,'F1-"HELP"');
outtextxy(240,213,'Esc-"vixod"');
outtextxy(240,223,'Tab-"perevorot"');
outtextxy(240,233,'Enter"prodolshenia"');
outtextxy(240,283,'master-sheff@mail.ru');
readln;
setcolor(12);
setfillstyle(1,0);
  bar(237,200,400,300);
proverka;
end;
procedure nachalo;{vvod nachalnix danix}
  begin
help;
    for i:=1 to a do
      begin
    for j:=1 to b do
        z[i,j]:=0;
      end;
      pusk:=1000000;
      shet:=0;
      t11:=random(7);
        setfillstyle(1,3);
        bar(217,100,227,445);
        bar(408,100,418,445);
        bar(217,445,418,455);
          setcolor(9);
          line(227,445,217,455);
          line(408,445,418,455);
               line(243,10,376,10);
                 setcolor(12);
                 outtextxy(244,1,'score');
                 outtextxy(244,12,'speed');
      y:=0;
      skor:=0;
        setcolor(12);
          str(y,ochki);
          str(skor,skor1);
            outtextxy(290,2,ochki);
            outtextxy(290,12,skor1);
  end;
procedure vpravo;
  begin
    i:=i+1;
      if t=0 then
        begin
      if (z[i+1,j+1]<>0) or (z[i+1,j]<>0) or (i>a-1) then
        i:=i-1
      else begin
          z[i+1,j]:=1;
            vivod(i+1,j,s1);
          z[i+1,j+1]:=1;
            vivod(i+1,j+1,s1);
          z[i-1,j]:=0;
            steranie(i-1,j);
          z[i-1,j+1]:=0;
            steranie(i-1,j+1);
             end;
        end;
      if t=1 then
        begin
      if (z[i+2,j]<>0) or (z[i,j+1]<>0) or (i>a-2)then
        i:=i-1
      else begin
        z[i+2,j]:=2;
          vivod(i+2,j,s2);
        z[i,j+1]:=2;
          vivod(i,j+1,s2);
        z[i-1,j]:=0;
          steranie(i-1,j);
        z[i-1,j+1]:=0;
          steranie(i-1,j+1);
           end;
        end;
      if t=11 then
        begin
      if (z[i+1,j]<>0) or (z[i,j-1]<>0) or (z[i,j-2]<>0) or (i>a-1) then
      i:=i-1
      else begin
        z[i+1,j]:=2;
          vivod(i+1,j,s2);
        z[i,j-1]:=2;
          vivod(i,j-1,s2);
        z[i,j-2]:=2;
          vivod(i,j-2,s2);
        z[i-1,j]:=0;
          steranie(i-1,j);
        z[i-1,j-1]:=0;
          steranie(i-1,j-1);
        z[i-1,j-2]:=0;
          steranie(i-1,j-2);
           end;
        end;
      if t=12 then
        begin
      if (z[i,j]<>0) or (z[i,j-1]<>0) or (i>a) then
        i:=i-1
      else begin
        z[i,j]:=2;
          vivod(i,j,s2);
        z[i,j-1]:=2;
          vivod(i,j-1,s2);
        z[i-3,j]:=0;
          steranie(i-3,j);
        z[i-1,j-1]:=0;
          steranie(i-1,j-1);
           end;
        end;
               if t=13 then begin
            if i>a then
            i:=a else begin
     if (z[i,j]<>0) or (z[i,j+1]<>0) or (z[i,j+2]<>0) then
      i:=i-1 else begin
       z[i,j]:=2;
       vivod(i,j,s2);
       z[i,j+1]:=2;
       vivod(i,j+1,s2);
       z[i,j+2]:=2;
       vivod(i,j+2,s2);
       z[i-2,j]:=0;
       steranie(i-2,j);
       z[i-1,j+1]:=0;
       steranie(i-1,j+1);
       z[i-1,j+2]:=0;steranie(i-1,j+2);end;
            end;
                     end;
            if t=25 then begin
            if i>a then i:=a else begin
     if (z[i,j-1]<>0) or (z[i,j]<>0) or (z[i,j+1]<>0) or (z[i,j+2]<>0) then
      i:=i-1 else begin
       z[i,j]:=3;
       vivod(i,j,s3);
       z[i,j-1]:=3;
       vivod(i,j-1,s3);
       z[i,j+1]:=3;
       vivod(i,j+1,s3);
       z[i,j+2]:=3;
       vivod(i,j+2,s3);
         z[i-1,j]:=0;
         steranie(i-1,j);
         z[i-1,j-1]:=0;
         steranie(i-1,j-1);
         z[i-1,j+1]:=0;
         steranie(i-1,j+1);
         z[i-1,j+2]:=0;steranie(i-1,j+2);end;
                                    end;
                        end;
               if t=2 then begin
            if i>a-2 then i:=a-2 else begin
     if (z[i+2,j]<>0) then
      i:=i-1 else begin
       z[i+2,j]:=3;
       vivod(i+2,j,s3);
       z[i-2,j]:=0;steranie(i-2,j);end;
                                    end;
                        end;
               if t=3 then begin
            if i>a then
            i:=a else begin
     if (z[i,j]<>0) or (z[i,j+1]<>0) then
      i:=i-1 else begin
       z[i,j]:=4;
       vivod(i,j,s4);
       z[i,j+1]:=4;
       vivod(i,j+1,s4);
       z[i-3,j]:=0;
       steranie(i-3,j);
       z[i-1,j+1]:=0;steranie(i-1,j+1);end;
                       end;
                     end;
                 if t=31 then begin
            if i>a-1 then
            i:=a-1 else begin
     if (z[i+1,j]<>0) or (z[i,j+1]<>0) or (z[i,j+2]<>0) then
      i:=i-1 else begin
       z[i+1,j]:=4;
       vivod(i+1,j,s4);
       z[i,j+1]:=4;
       vivod(i,j+1,s4);
       z[i,j+2]:=4;
       vivod(i,j+2,s4);
       z[i-1,j]:=0;
       vivod(i-1,j,s4);
       steranie(i-1,j);
       z[i-1,j+1]:=0;
       steranie(i-1,j+1);
       z[i-1,j+2]:=0;steranie(i-1,j+2);end;
                       end;
                     end;
                   if t=32 then begin
            if i>a-2 then
            i:=a-2 else begin
     if (z[i+2,j]<>0) or (z[i,j-1]<>0) then
      i:=i-1 else begin
       z[i+2,j]:=4;
       vivod(i+2,j,s4);
       z[i,j-1]:=4;
       vivod(i,j-1,s4);
       z[i-1,j]:=0;
       vivod(i-1,j,s4);
       steranie(i-1,j);
       z[i-1,j-1]:=0;steranie(i-1,j-1);end;
                       end;
                     end;
                     if t=33 then begin
            if i>a then
            i:=a else begin
     if (z[i,j]<>0) or (z[i,j-1]<>0) or (z[i,j-2]<>0) then
      i:=i-1 else begin
       z[i,j]:=4;
       vivod(i,j,s4);
       z[i,j-1]:=4;
       vivod(i,j-1,s4);
       z[i,j-2]:=4;
       vivod(i,j-2,s4);
       z[i-2,j]:=0;
       vivod(i-2,j,s4);
       steranie(i-2,j);
       z[i-1,j-1]:=0;
       steranie(i-1,j-1);
       z[i-1,j-2]:=0;steranie(i-1,j-2);end;
                       end;
                     end;
                  if t=4 then begin
            if i>a-1 then
            i:=a-1 else begin
     if (z[i+1,j]<>0) or (z[i,j+1]<>0) then
      i:=i-1 else begin
       z[i+1,j]:=5;
       vivod(i+1,j,s5);
       z[i,j+1]:=5;
       vivod(i,j+1,s5);
       z[i-2,j]:=0;
       steranie(i-2,j);
       z[i-1,j+1]:=0;steranie(i-1,j+1);end;
                       end;
                     end;
                    if t=41 then begin
            if i>a-1 then
            i:=a-1 else begin
     if (z[i+1,j]<>0) or (z[i,j+1]<>0) or (z[i,j-1]<>0) then
      i:=i-1 else begin
       z[i+1,j]:=5;
       vivod(i+1,j,s5);
       z[i,j+1]:=5;
       vivod(i,j+1,s5);
       z[i,j-1]:=5;
       vivod(i,j-1,s5);
       z[i-1,j]:=0;
       steranie(i-1,j);
       z[i-1,j+1]:=0;
       steranie(i-1,j+1);
       z[i-1,j-1]:=0;steranie(i-1,j-1);end;
                       end;
                     end;
                      if t=42 then begin
            if i>a-1 then
            i:=a-1 else begin
     if (z[i+1,j]<>0) or (z[i,j-1]<>0) then
      i:=i-1 else begin
       z[i+1,j]:=5;
       vivod(i+1,j,s5);
       z[i,j-1]:=5;
       vivod(i,j-1,s5);
       z[i-1,j-1]:=0;
       steranie(i-1,j-1);
       z[i-2,j]:=0;steranie(i-2,j);end;
                       end;
                     end;
                     if t=43 then begin
            if i>a then
            i:=a else begin
     if (z[i,j]<>0) or (z[i,j-1]<>0) or (z[i,j+1]<>0) then
      i:=i-1 else begin
       z[i,j]:=5;
       vivod(i,j,s5);
       z[i,j-1]:=5;
       vivod(i,j-1,s5);
       z[i,j+1]:=5;
       vivod(i,j+1,s5);
       z[i-1,j-1]:=0;
       steranie(i-1,j-1);
       z[i-1,j+1]:=0;
       steranie(i-1,j+1);
       z[i-2,j]:=0;steranie(i-2,j);end;
                       end;
                     end;
                     if t=5 then begin
            if i>a-1 then
            i:=a-1 else begin
     if (z[i+1,j+1]<>0) or (z[i,j]<>0) then
      i:=i-1 else begin
       z[i,j]:=6;
       vivod(i,j,s6);
       z[i+1,j+1]:=6;
       vivod(i+1,j+1,s6);
       z[i-2,j]:=0;
       steranie(i-2,j);
       z[i-1,j+1]:=0;steranie(i-1,j+1);end;
                       end;
                     end;
                       if t=55 then begin
            if i>a then
            i:=a else begin
     if (z[i,j]<>0) or (z[i,j-1]<>0) or (z[i-1,j+1]<>0) then
      i:=i-1 else begin
       z[i,j]:=6;
       vivod(i,j,s6);
       z[i,j-1]:=6;
       vivod(i,j-1,s6);
       z[i-1,j+1]:=6;
       vivod(i-1,j+1,s6);
       z[i-2,j]:=0;
       steranie(i-2,j);
       z[i-1,j-1]:=0;
       steranie(i-1,j-1);
       z[i-2,j+1]:=0;steranie(i-2,j+1);end;
                       end;
                     end;
                       if t=6 then begin
            if i>a-1 then
            i:=a-1 else begin
     if (z[i+1,j]<>0) or (z[i,j+1]<>0) then
      i:=i-1 else begin
       z[i+1,j]:=7;
       vivod(i+1,j,s7);
       z[i,j+1]:=7;
       vivod(i,j+1,s7);
       z[i-1,j]:=0;
       steranie(i-1,j);
       z[i-2,j+1]:=0;steranie(i-2,j+1);end;
                       end;
                     end;
                         if t=66 then begin
            if i>a-1 then
            i:=a-1 else begin
     if (z[i+1,j]<>0) or (z[i,j-1]<>0) or (z[i+1,j+1]<>0) then
      i:=i-1 else begin
       z[i+1,j]:=7;
       vivod(i+1,j,s7);
       z[i,j-1]:=7;
       vivod(i,j-1,s7);
       z[i+1,j+1]:=7;
       vivod(i+1,j+1,s7);
       z[i,j+1]:=0;
       steranie(i,j+1);
       z[i-1,j]:=0;
       steranie(i-1,j);
       z[i-1,j-1]:=0;steranie(i-1,j-1);end;
                       end;
                     end;
  end;
procedure vlevo;
  begin
    i:=i-1;
    if t=0 then begin
    if i<1 then i:=1
    else begin
     if (z[i,j]<>0) or (z[i,j+1]<>0) then
      i:=i+1 else begin
      z[i,j]:=1;
      vivod(i,j,s1);
      z[i,j+1]:=1;
      vivod(i,j+1,s1);
      z[i+2,j]:=0;
      steranie(i+2,j);
      z[i+2,j+1]:=0;steranie(i+2,j+1);end;
         end;
                end;
        if t=1 then begin
           if i<1 then  i:=1
           else begin
     if (z[i,j]<>0) or (z[i,j+1]<>0) then
      i:=i+1 else begin
      z[i,j]:=2;
      vivod(i,j,s2);
      z[i,j+1]:=2;
      vivod(i,j+1,s2);
      z[i+3,j]:=0;
      steranie(i+3,j);
      z[i+1,j+1]:=0;steranie(i+1,j+1);end;
           end;
                    end;
          if t=11 then begin
           if i<1 then  i:=1
           else begin
     if (z[i,j]<>0) or (z[i,j-1]<>0) or (z[i,j-2]<>0) then
      i:=i+1 else begin
      z[i,j]:=2;
      vivod(i,j,s2);
      z[i,j-1]:=2;
      vivod(i,j-1,s2);
      z[i,j-2]:=2;
      vivod(i,j-2,s2);
      z[i+2,j]:=0;
      steranie(i+2,j);
      z[i+1,j-1]:=0;
      steranie(i+1,j-1);
      z[i+1,j-2]:=0;steranie(i+1,j-2);end;
           end;
                    end;
            if t=12 then begin
           if i<3 then  i:=3
           else begin
     if (z[i-2,j]<>0) or (z[i,j-1]<>0) then
      i:=i+1 else begin
      z[i-2,j]:=2;
      vivod(i-2,j,s2);
      z[i,j-1]:=2;
      vivod(i,j-1,s2);
      z[i+1,j]:=0;
      steranie(i+1,j);
      z[i+1,j-1]:=0;steranie(i+1,j-1);end;
           end;
                    end;
              if t=13 then begin
           if i<2 then  i:=2
           else begin
     if (z[i-1,j]<>0) or (z[i,j+1]<>0) or (z[i,j+2]<>0) then
      i:=i+1 else begin
      z[i-1,j]:=2;
      vivod(i-1,j,s2);
      z[i,j+1]:=2;
      vivod(i,j+1,s2);
      z[i,j+2]:=2;
      vivod(i,j+2,s2);
      z[i+1,j]:=0;
      steranie(i+1,j);
      z[i+1,j+1]:=0;
      steranie(i+1,j+1);
      z[i+1,j+2]:=0;steranie(i+1,j+2);end;
           end;
                    end;
                    if t=25 then begin
            if i<1 then i:=1
            else begin
     if (z[i,j]<>0) or (z[i,j-1]<>0) or (z[i,j+1]<>0) or (z[i,j+2]<>0) then
      i:=i+1 else begin
       z[i,j]:=3;
       vivod(i,j,s3);
       z[i,j-1]:=3;
       vivod(i,j-1,s3);
       z[i,j+1]:=3;
       vivod(i,j+1,s3);
       z[i,j+2]:=3;
       vivod(i,j+2,s3);
         z[i+1,j]:=0;
         steranie(i+1,j);
         z[i+1,j-1]:=0;
         steranie(i+1,j-1);
         z[i+1,j+1]:=0;
         steranie(i+1,j+1);
         z[i+1,j+2]:=0;steranie(i+1,j+2);end;
             end;
                        end;
                       if t=2 then begin
            if i<2 then i:=2
            else begin
     if (z[i-1,j]<>0) then
      i:=i+1 else begin
       z[i-1,j]:=3;
       vivod(i-1,j,s3);
       z[i+3,j]:=0;steranie(i+3,j);end;
             end;
                        end;
               if t=3 then begin
           if i<3 then  i:=3
           else begin
     if (z[i-2,j]<>0) or (z[i,j+1]<>0) then
      i:=i+1 else begin
      z[i-2,j]:=4;
      vivod(i-2,j,s4);
      z[i,j+1]:=4;
      vivod(i,j+1,s4);
      z[i+1,j]:=0;
      steranie(i+1,j);
      z[i+1,j+1]:=0;steranie(i+1,j+1);end;
           end;
                    end;
                 if t=31 then begin
           if i<1 then  i:=1
           else begin
     if (z[i,j]<>0) or (z[i,j+1]<>0) or (z[i,j+2]<>0) then
      i:=i+1 else begin
      z[i,j]:=4;
      vivod(i,j,s4);
      z[i,j+1]:=4;
      vivod(i,j+1,s4);
      z[i,j+2]:=4;
      vivod(i,j+2,s4);
      z[i+2,j]:=0;
      steranie(i+2,j);
      z[i+1,j+1]:=0;
      steranie(i+1,j+1);
      z[i+1,j+2]:=0;steranie(i+1,j+2);end;
           end;
                    end;
                   if t=32 then begin
           if i<1 then  i:=1
           else begin
     if (z[i,j]<>0) or (z[i,j-1]<>0) then
      i:=i+1 else begin
      z[i,j]:=4;
      vivod(i,j,s4);
      z[i,j-1]:=4;
      vivod(i,j-1,s4);
      z[i+3,j]:=0;
      steranie(i+3,j);
      z[i+1,j-1]:=0;steranie(i+1,j-1);end;
           end;
                    end;
                     if t=33 then begin
           if i<2 then i:=2
           else begin
     if (z[i-1,j]<>0) or (z[i,j-1]<>0) or (z[i,j-2]<>0) then
      i:=i+1 else begin
      z[i-1,j]:=4;
      vivod(i-1,j,s4);
      z[i,j-1]:=4;
      vivod(i,j-1,s4);
      z[i,j-2]:=4;
      vivod(i,j-2,s4);
      z[i+1,j]:=0;
      steranie(i+1,j);
      z[i+1,j-1]:=0;
      steranie(i+1,j-1);
      z[i+1,j-2]:=0;steranie(i+1,j-2);end;
           end;
                    end;
                 if t=4 then begin
           if i<2 then  i:=2
           else begin
     if (z[i-1,j]<>0) or (z[i,j+1]<>0) then
      i:=i+1 else begin
      z[i-1,j]:=5;
      vivod(i-1,j,s5);
      z[i,j+1]:=5;
      vivod(i,j+1,s5);
      z[i+2,j]:=0;
      steranie(i+2,j);
      z[i+1,j+1]:=0;steranie(i+1,j+1);end;
           end;
                    end;
                   if t=41 then begin
           if i<1 then  i:=1
           else begin
     if (z[i,j]<>0) or (z[i,j+1]<>0) or (z[i,j-1]<>0) then
      i:=i+1 else begin
      z[i,j]:=5;
      vivod(i,j,s5);
      z[i,j+1]:=5;
      vivod(i,j+1,s5);
      z[i,j-1]:=5;
      vivod(i,j-1,s5);
      z[i+2,j]:=0;
      steranie(i+2,j);
      z[i+1,j+1]:=0;
      steranie(i+1,j+1);
      z[i+1,j-1]:=0;steranie(i+1,j-1);end;
           end;
                    end;
                     if t=42 then begin
           if i<2 then  i:=2
           else begin
     if (z[i-1,j]<>0) or (z[i,j-1]<>0) then
      i:=i+1 else begin
      z[i,j-1]:=5;
      vivod(i,j-1,s5);
      z[i-1,j]:=5;
      vivod(i-1,j,s5);
      z[i+2,j]:=0;
      steranie(i+2,j);
      z[i+1,j-1]:=0;steranie(i+1,j-1);end;
           end;
                    end;
                       if t=43 then begin
           if i<2 then  i:=2
           else begin
     if (z[i-1,j]<>0) or (z[i,j-1]<>0) or (z[i,j+1]<>0) then
      i:=i+1 else begin
      z[i-1,j]:=5;
      vivod(i-1,j,s5);
      z[i,j-1]:=5;
      vivod(i,j-1,s5);
      z[i,j+1]:=5;
      vivod(i,j+1,s5);
      z[i+1,j]:=0;
      steranie(i+1,j);
      z[i+1,j-1]:=0;
      steranie(i+1,j-1);
      z[i+1,j+1]:=0;steranie(i+1,j+1);end;
           end;
                    end;
                   if t=5 then begin
           if i<2 then  i:=2
           else begin
     if (z[i-1,j]<>0) or (z[i,j+1]<>0) then
      i:=i+1 else begin
      z[i-1,j]:=6;
      vivod(i-1,j,s6);
      z[i,j+1]:=6;
      vivod(i,j+1,s6);
      z[i+1,j]:=0;
      steranie(i+1,j);
      z[i+2,j+1]:=0;steranie(i+2,j+1);end;
           end;
                    end;
                     if t=55 then begin
           if i<2 then  i:=2
           else begin
     if (z[i-1,j]<>0) or (z[i-1,j+1]<>0) or (z[i,j-1]<>0) then
      i:=i+1 else begin
      z[i-1,j]:=6;
      vivod(i-1,j,s6);
      z[i-1,j+1]:=6;
      vivod(i-1,j+1,s6);
      z[i,j-1]:=6;
      vivod(i,j-1,s6);
      z[i+1,j]:=0;
      steranie(i+1,j);
      z[i,j+1]:=0;
      steranie(i,j+1);
      z[i+1,j-1]:=0;steranie(i+1,j-1);end;
           end;
                    end;
                     if t=6 then begin
           if i<2 then  i:=2
           else begin
     if (z[i,j]<>0) or (z[i-1,j+1]<>0) then
      i:=i+1 else begin
      z[i,j]:=7;
      vivod(i,j,s7);
      z[i-1,j+1]:=7;
      vivod(i-1,j+1,s7);
      z[i+2,j]:=0;
      steranie(i+2,j);
      z[i+1,j+1]:=0;steranie(i+1,j+1);end;
           end;
                    end;
                       if t=66 then begin
           if i<1 then  i:=1
           else begin
     if (z[i,j]<>0) or (z[i,j-1]<>0) or (z[i+1,j+1]<>0) then
      i:=i+1 else begin
      z[i,j]:=7;
      vivod(i,j,s7);
      z[i,j-1]:=7;
      vivod(i,j-1,s7);
      z[i+1,j+1]:=7;
      vivod(i+1,j+1,s7);
      z[i+1,j-1]:=0;
      steranie(i+1,j-1);
      z[i+2,j]:=0;
      steranie(i+2,j);
      z[i+2,j+1]:=0;steranie(i+2,j+1);end;
           end;
                    end;
  end;
{-------------------------------------------------------------}
{nachalo osnavnoi programi}
begin
    Gd := Detect;
    InitGraph(Gd, Gm, '');
    if GraphResult <> grOk then
    Halt(1);
    Randomize;
nachalo;
{proverka na konez i na steranie linii}
1:if (z[1,4]<>0) or (z[2,4]<>0) or (z[3,4]<>0) or
     (z[4,4]<>0) or (z[5,4]<>0) or (z[6,4]<>0) or
     (z[7,4]<>0) or (z[8,4]<>0) or (z[9,4]<>0) or
     (z[10,4]<>0) or (z[11,4]<>0) or (z[12,4]<>0) then
       goto 4;
         zikl;
{---------------------------------------------------------------}
repeat
  vniz:=vniz+1;
    if vniz>=pusk then{opredeliaetsia intervali}
      begin
        vniz:=0;
        j:=j+1;
     if t=0 then begin{kubik}
   if (z[i,j+1]<>0) or (z[i+1,j+1]<>0) or (j=b) then goto 1;
       z[i,j+1]:=1;
       vivod(i,j+1,s1);
       z[i+1,j+1]:=1;
       vivod(i+1,j+1,s1);
       z[i,j-1]:=0;
       steranie(i,j-1);
       z[i+1,j-1]:=0;
       steranie(i+1,j-1);
                   end;
         if t=1 then begin{ge/-}
           if (z[i,j+1]<>0) or (z[i+1,j]<>0) or (z[i+2,j]<>0) or (j=b) then goto 1;
             f1;
             z[i,j-1]:=0;
             steranie(i,j-1);
             z[i+1,j-1]:=0;
             steranie(i+1,j-1);
             z[i+2,j-1]:=0;
             steranie(i+2,j-1);
                     end;
           if t=11 then begin{ge/-}
           if (z[i,j]<>0) or (z[i+1,j]<>0) or (j=b+1) then goto 1;
             f11;
             z[i,j-3]:=0;
             steranie(i,j-3);
             z[i+1,j-1]:=0;
             steranie(i+1,j-1);
                     end;
             if t=12 then begin{ge/-}
           if (z[i,j]<>0) or (z[i-1,j]<>0) or (z[i-2,j]<>0) or (j=b+1) then goto 1;
             f12;
             z[i,j-2]:=0;
             steranie(i,j-2);
             z[i-1,j-1]:=0;
             steranie(i-1,j-1);
             z[i-2,j-1]:=0;
             steranie(i-2,j-1);
                     end;
               if t=13 then begin{ge/-}
           if (z[i-1,j]<>0) or (z[i,j+2]<>0) or (j=b-1) then goto 1;
             f13;
             z[i,j-1]:=0;
             steranie(i,j-1);
             z[i-1,j-1]:=0;
             steranie(i-1,j-1);
                     end;
           if t=25 then begin{palka\}
             if (z[i,j+2]<>0) or (j=b-1) then goto 1;
               z[i,j-2]:=0;
               steranie(i,j-2);
               f25;
                       end;
              if t=2 then begin{palka-}
             if (z[i,j]<>0) or (z[i-1,j]<>0) or (z[i+1,j]<>0) or (z[i+2,j]<>0) or (j=b+1) then goto 1;
               f2;
                z[i,j-1]:=0;
                steranie(i,j-1);
               z[i-1,j-1]:=0;
               steranie(i-1,j-1);
               z[i+1,j-1]:=0;
               steranie(i+1,j-1);
               z[i+2,j-1]:=0;
               steranie(i+2,j-1);
                       end;
              if t=3 then begin{ge/-}
           if (z[i,j+1]<>0) or (z[i-1,j]<>0) or (z[i-2,j]<>0) or (j=b) then goto 1;
             f3;
             z[i,j-1]:=0;
             steranie(i,j-1);
             z[i-1,j-1]:=0;
             steranie(i-1,j-1);
             z[i-2,j-1]:=0;
             steranie(i-2,j-1);
                     end;
                if t=31 then begin{ge/-}
           if (z[i,j+2]<>0) or (z[i+1,j]<>0) or (j=b-1) then goto 1;
             f31;
             z[i,j-1]:=0;
             steranie(i,j-1);
             z[i+1,j-1]:=0;
             steranie(i+1,j-1);
                     end;
                  if t=32 then begin{ge/-}
           if (z[i,j]<>0) or (z[i+1,j]<>0) or (z[i+2,j]<>0) or (j=b+1) then goto 1;
             f32;
             z[i,j-2]:=0;
             steranie(i,j-2);
             z[i+1,j-1]:=0;
             steranie(i+1,j-1);
             z[i+2,j-1]:=0;
             steranie(i+2,j-1);
                     end;
                    if t=33 then begin{ge/-}
           if (z[i,j]<>0) or (z[i-1,j]<>0) or (j=b+1) then goto 1;
             f33;
             z[i-1,j-1]:=0;
             steranie(i-1,j-1);
             z[i,j-3]:=0;
             steranie(i,j-3);
                     end;
                    if t=4 then begin{x-\-}
           if (z[i,j+1]<>0) or (z[i-1,j]<>0) or (z[i+1,j]<>0) or (j=b) then goto 1;
             f4;
             z[i,j-1]:=0;
             steranie(i,j-1);
             z[i-1,j-1]:=0;
             steranie(i-1,j-1);
             z[i+1,j-1]:=0;
             steranie(i+1,j-1);
                     end;
                      if t=41 then begin{x-\-}
           if (z[i,j+1]<>0) or (z[i+1,j]<>0) or (j=b) then goto 1;
             f41;
             z[i,j-2]:=0;
             steranie(i,j-2);
             z[i+1,j-1]:=0;
             steranie(i+1,j-1);
                        end;
                        if t=42 then begin{x-\-}
           if (z[i,j]<>0) or (z[i-1,j]<>0) or (z[i+1,j]<>0) or (j=b+1) then goto 1;
             f42;
             z[i,j-2]:=0;
             steranie(i,j-2);
             z[i-1,j-1]:=0;
             steranie(i-1,j-1);
             z[i+1,j-1]:=0;
             steranie(i+1,j-1);
                     end;
                          if t=43 then begin{x-\-}
           if (z[i,j+1]<>0) or (z[i-1,j]<>0) or (j=b) then goto 1;
             f43;
             z[i,j-2]:=0;
             steranie(i,j-2);
             z[i-1,j-1]:=0;
             steranie(i-1,j-1);
                     end;
                      if t=5 then begin{z-\_}
           if (z[i,j+1]<>0) or (z[i+1,j+1]<>0) or (z[i-1,j]<>0) or (j=b) then goto 1;
             f5;
             z[i,j-1]:=0;
             steranie(i,j-1);
             z[i-1,j-1]:=0;
             steranie(i-1,j-1);
             z[i+1,j]:=0;
             steranie(i+1,j);
                     end;
                        if t=55 then begin{z/-/}
           if (z[i,j]<>0) or (z[i-1,j+1]<>0) or (j=b) then goto 1;
             f55;
             z[i,j-2]:=0;
             steranie(i,j-2);
             z[i-1,j-1]:=0;
             steranie(i-1,j-1);
                     end;
                        if t=6 then begin{z_/-}
           if (z[i,j+1]<>0) or (z[i-1,j+1]<>0) or (z[i+1,j]<>0) or (j=b) then goto 1;
             f6;
             z[i,j-1]:=0;
             steranie(i,j-1);
             z[i-1,j]:=0;
             steranie(i-1,j);
             z[i+1,j-1]:=0;
             steranie(i+1,j-1);
                     end;
                          if t=66 then begin{z\-\}
           if (z[i,j]<>0) or (z[i+1,j+1]<>0) or (j=b) then goto 1;
             f66;
             z[i,j-2]:=0;
             steranie(i,j-2);
             z[i+1,j-1]:=0;
             steranie(i+1,j-1);
                     end;
           end;
if keypressed then begin
{-------------------------------------------------------}
{Schitovanie dannix s klaviaturi}
  q:=readkey;
  case q of
  #59:help;
  #77:begin
        vpravo;
      end;
  #75:begin
        vlevo;
      end;
  #80:vniz:=pusk-1;
  #9:begin
     case t of
     3: begin if (z[i+1,j]<>0) or (j>b-2) or (i>a-1) or (z[i+1,j+1]<>0)
                 or (z[i,j+2]<>0) or (z[i-1,j+1]<>0) or (z[i-1,j+2]<>0)
                 or (z[i-2,j+1]<>0) or (z[i-2,j+2]<>0) then goto 123;
       z[i,j]:=0;
       steranie(i,j);
       z[i,j+1]:=0;
       steranie(i,j+1);
       z[i-1,j]:=0;
       steranie(i-1,j);
       z[i-2,j]:=0;
       steranie(i-2,j);
       f31;
         t:=31;
         end;
     31: begin if (z[i,j-1]<>0) or (i>a-2) or (z[i+1,j-1]<>0)
                 or (z[i+1,j+1]<>0) or (z[i+1,j+2]<>0) or (z[i+2,j]<>0)
                 or (z[i+2,j+1]<>0) or (z[i+2,j+2]<>0) then goto 123;
       z[i,j]:=0;
       steranie(i,j);
       z[i,j+1]:=0;
       steranie(i,j+1);
       z[i+1,j]:=0;
       steranie(i+1,j);
       z[i,j+2]:=0;
       steranie(i,j+2);
       f32;
         t:=32;
         end;
     32: begin if (z[i-1,j]<>0) or (i<2) or (z[i-1,j-1]<>0)
                 or (z[i,j-2]<>0) or (z[i+1,j-1]<>0) or (z[i+1,j-2]<>0)
                 or (z[i+2,j-1]<>0) or (z[i+2,j-2]<>0) then goto 123;
       z[i,j]:=0;
       steranie(i,j);
       z[i,j-1]:=0;
       steranie(i,j-1);
       z[i+1,j]:=0;
       steranie(i+1,j);
       z[i+2,j]:=0;
       steranie(i+2,j);
       f33;
         t:=33;
         end;
     33: begin if (z[i,j+1]<>0) or (j>b-1) or (i<3)or (z[i-1,j+1]<>0)
                 or (z[i-1,j-1]<>0) or (z[i-1,j-2]<>0) or (z[i-2,j]<>0)
                 or (z[i-2,j-1]<>0) or (z[i-2,j-2]<>0) then goto 123;
       z[i,j]:=0;
       steranie(i,j);
       z[i-1,j]:=0;
       steranie(i-1,j);
       z[i,j-1]:=0;
       steranie(i,j-1);
       z[i,j-2]:=0;
       steranie(i,j-2);
       f3;
         t:=3;
         end;
     1: begin if (z[i,j-1]<>0) or (z[i,j-2]<>0)
                 or (z[i+1,j-1]<>0) or (z[i+1,j-2]<>0) or (z[i+1,j+1]<>0)
                 or (z[i+2,j-1]<>0) or (z[i+2,j-2]<>0) then goto 123;
       z[i,j]:=0;
       steranie(i,j);
       z[i,j+1]:=0;
       steranie(i,j+1);
       z[i+1,j]:=0;
       steranie(i+1,j);
       z[i+2,j]:=0;
       steranie(i+2,j);
       f11;
         t:=11;
         end;
     11: begin if (z[i-1,j]<>0) or (i<3) or (z[i-2,j]<>0)
                 or (z[i-1,j-1]<>0) or (z[i-2,j-1]<>0) or (z[i-1,j-2]<>0)
                 or (z[i-2,j-2]<>0) or (z[i+1,j-1]<>0) then goto 123;
       z[i,j]:=0;
       steranie(i,j);
       z[i,j-1]:=0;
       steranie(i,j-1);
       z[i,j-2]:=0;
       steranie(i,j-2);
       z[i+1,j]:=0;
       steranie(i+1,j);
       f12;
         t:=12;
         end;
     12: begin if (z[i-1,j-1]<>0) or (j>b-2) or (z[i,j+1]<>0)
                 or (z[i,j+2]<>0) or (z[i-1,j+1]<>0) or (z[i-1,j+2]<>0)
                 or (z[i-2,j+1]<>0) or (z[i-2,j+2]<>0) then goto 123;
       z[i,j]:=0;
       steranie(i,j);
       z[i,j-1]:=0;
       steranie(i,j-1);
       z[i-1,j]:=0;
       steranie(i-1,j);
       z[i-2,j]:=0;
       steranie(i-2,j);
       f13;
         t:=13;
         end;
     13: begin if (z[i+1,j]<>0) or (i>a-2) or (z[i+2,j]<>0)
                 or (z[i-1,j+1]<>0) or (z[i+1,j+1]<>0) or (z[i+2,j+1]<>0)
                 or (z[i+1,j+2]<>0) or (z[i+2,j+2]<>0) then goto 123;
       z[i,j]:=0;
       steranie(i,j);
       z[i-1,j]:=0;
       steranie(i-1,j);
       z[i,j+1]:=0;
       steranie(i,j+1);
       z[i,j+2]:=0;
       steranie(i,j+2);
       f1;
         t:=1;
         end;
     5: begin if (z[i-1,j+1]<>0) or (z[i-1,j+2]<>0)
                 or (z[i,j-1]<>0) or (z[i+1,j]<>0) or (z[i+1,j-1]<>0) then goto 123;
       z[i,j]:=0;
       steranie(i,j);
       z[i-1,j]:=0;
       steranie(i-1,j);
       z[i,j+1]:=0;
       steranie(i,j+1);
       z[i+1,j+1]:=0;
       steranie(i+1,j+1);
       f55;
         t:=55;
         end;
     55: begin if (i>a-1) or (z[i+1,j-1]<>0) or (z[i+1,j]<>0)
                 or (z[i+1,j+1]<>0) or (z[i,j+1]<>0) or (z[i+1,j+2]<>0) or
                 (z[i,j+2]<>0) then goto 123;
       z[i,j]:=0;
       steranie(i,j);
       z[i,j-1]:=0;
       steranie(i,j-1);
       z[i-1,j]:=0;
       steranie(i-1,j);
       z[i-1,j+1]:=0;
       steranie(i-1,j+1);
       f5;
         t:=5;
        end;
     6: begin if (z[i-1,j]<>0) or (z[i-1,j-1]<>0)
                 or (z[i,j-1]<>0) or (z[i+1,j+1]<>0) or (z[i+1,j+2]<>0) then goto 123;
       z[i,j]:=0;
       steranie(i,j);
       z[i-1,j+1]:=0;
       steranie(i-1,j+1);
       z[i,j+1]:=0;
       steranie(i,j+1);
       z[i+1,j]:=0;
       steranie(i+1,j);
       f66;
         t:=66;
         end;
     66: begin if (i<2) or (z[i-1,j-1]<>0) or (z[i-1,j]<>0)
                 or (z[i-1,j+1]<>0) or (z[i-1,j+2]<>0) or (z[i,j+1]<>0) or
                 (z[i,j+2]<>0) then goto 123;
       z[i,j]:=0;
       steranie(i,j);
       z[i,j-1]:=0;
       steranie(i,j-1);
       z[i+1,j]:=0;
       steranie(i+1,j);
       z[i+1,j+1]:=0;
       steranie(i+1,j+1);
       f6;
         t:=6;
        end;
     4: begin if (z[i,j-1]<>0) or (z[i+1,j-1]<>0)
                 or (z[i+1,j+1]<>0) or (z[i-1,j+1]<>0) then goto 123;
       z[i,j]:=0;
       steranie(i,j);
       z[i-1,j]:=0;
       steranie(i-1,j);
       z[i+1,j]:=0;
       steranie(i+1,j);
       z[i,j+1]:=0;
       steranie(i,j+1);
       f41;
         t:=41;
         end;
     41: begin if (z[i-1,j-1]<>0) or (i<2) or (z[i-1,j]<>0)
                 or (z[i+1,j+1]<>0) or (z[i+1,j-1]<>0) then goto 123;
       z[i,j]:=0;
       steranie(i,j);
       z[i+1,j]:=0;
       steranie(i+1,j);
       z[i,j-1]:=0;
       steranie(i,j-1);
       z[i,j+1]:=0;
       steranie(i,j+1);
       f42;
         t:=42;
         end;
      42: begin if (z[i-1,j-1]<>0) or (j>b-1) or (z[i-1,j+1]<>0)
                 or (z[i,j+1]<>0) or (z[i+1,j-1]<>0) then goto 123;
       z[i,j]:=0;
       steranie(i,j);
       z[i+1,j]:=0;
       steranie(i+1,j);
       z[i-1,j]:=0;
       steranie(i-1,j);
       z[i,j-1]:=0;
       steranie(i,j-1);
       f43;
         t:=43;
         end;
      43: begin if (z[i-1,j-1]<>0) or (i>a-1) or (z[i-1,j+1]<>0)
                 or (z[i+1,j]<>0) or (z[i+1,j+1]<>0) then goto 123;
       z[i,j]:=0;
       steranie(i,j);
       z[i,j-1]:=0;
       steranie(i,j-1);
       z[i,j+1]:=0;
       steranie(i,j+1);
       z[i-1,j]:=0;
       steranie(i-1,j);
       f4;
         t:=4;
         end;
     25: begin if (i>a-2) or (i<2) or (z[i-1,j-1]<>0) or (z[i-1,j]<>0)
     or (z[i-1,j+1]<>0) or (z[i+1,j]<>0) or (z[i+2,j]<>0) or (z[i+1,j+1]<>0)
     or (z[i+2,j+1]<>0) or (z[i+1,j+2]<>0) or (z[i+2,j+2]<>0) then goto 123;
       z[i,j]:=0;
       steranie(i,j);
       z[i,j-1]:=0;
       steranie(i,j-1);
       z[i,j+1]:=0;
       steranie(i,j+1);
       z[i,j+2]:=0;
       steranie(i,j+2);
       f2;
         t:=2;
        end;
     2: begin if (j>b-2) or (z[i-1,j-1]<>0) or (z[i,j-1]<>0)
                 or (z[i,j+1]<>0) or (z[i,j+2]<>0) or (z[i+1,j+1]<>0)
                 or (z[i+1,j+2]<>0) or (z[i+2,j+1]<>0) or (z[i+2,j+2]<>0) then goto 123;
     z[i,j]:=0;
     steranie(i,j);
     z[i-1,j]:=0;
     steranie(i-1,j);
     z[i+1,j]:=0;
     steranie(i+1,j);
     z[i+2,j]:=0;
     steranie(i+2,j);
     f25;
     t:=25;
123:     end;
     else end;
     end;
      else end;
      end;
  until q=#27;
{----------------------------------------------------------}
{konez igri}
4:setfillstyle(1,13);
  bar(257,200,377,300);
setcolor(2);
  settextstyle(1,0,2);
outtextxy(281,235,'GAME OVER');
readln;
CloseGraph;
end.