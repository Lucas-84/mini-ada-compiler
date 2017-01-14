-- Adapte de https://rosettacode.org/wiki/Pythagorean_triples
with Ada.Text_IO; use Ada.Text_IO;

procedure Test_Ackermann is
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

   function Ackermann (M, N : Integer) return Integer is
   begin
      if M = 0 then
         return N + 1;
      elsif N = 0 then
         return Ackermann (M - 1, 1);
      else
         return Ackermann (M - 1, Ackermann (M, N - 1));
      end if;
   end Ackermann;
begin
   for M in 0..3 loop
      for N in 0..6 loop
         printsint(Ackermann(M,N));
         put(' ');
      end loop;
      New_Line;
   end loop;
end Test_Ackermann;
