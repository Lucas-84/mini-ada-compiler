-- Adapte de https://rosettacode.org/wiki/Pythagorean_triples
with Ada.Text_IO; use Ada.Text_IO;

procedure Pythagorean_Triples is
   procedure PrintInt(N: Integer) is
      C: Integer := N rem 10;
   begin
      if N > 9 then PrintInt(N / 10); end if;
      Put(Character'Val(48 + C));
   end;
   procedure PrintSInt(N: Integer) is
      C: Integer := N rem 10;
   begin
      if N >= 0 then Printint(N); return; end if;
      Put('-');
      if N < -9 then Printint(- N / 10); end if;
      Put(Character'Val(48 - C));
   end;

   procedure New_Triangle(A, B, C: Integer;
                          Max_Perimeter: Integer;
                          Total_Cnt, Primitive_Cnt: in out Integer) is
      Perimeter: Integer := A + B + C;
   begin
      if Perimeter <= Max_Perimeter then
         Primitive_Cnt := Primitive_Cnt + 1;
         Total_Cnt     := Total_Cnt + Max_Perimeter / Perimeter;
         New_Triangle(A-2*B+2*C,     2*A-B+2*C,    2*A-2*B+3*C,   Max_Perimeter, Total_Cnt, Primitive_Cnt);
         New_Triangle(A+2*B+2*C,     2*A+B+2*C,    2*A+2*B+3*C,   Max_Perimeter, Total_Cnt, Primitive_Cnt);
         New_Triangle(2*B+2*C-A,     B+2*C-2*A,    2*B+3*C-2*A,   Max_Perimeter, Total_Cnt, Primitive_Cnt);
      end if;
   end New_Triangle;
   
   function power(X: integer; N: integer) return integer is
     ans : Integer := 1;
   begin
     for i in 1 .. N loop
       ans := ans * X;
     end loop;
     return ans;
   end;
 
   T_Cnt, P_Cnt: Integer;
 
begin
   for I in 1 .. 7 loop
      T_Cnt := 0;
      P_Cnt := 0;
      New_Triangle(3,4,5, power(10,I), T_Cnt, P_Cnt);
      printsint(I);
      put(' ');
      printsint(T_Cnt);
      put(' ');
      printsint(P_Cnt);
      new_line;
   end loop;
end Pythagorean_Triples;
