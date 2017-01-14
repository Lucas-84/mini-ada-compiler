-- From https://rosettacode.org/wiki/Evaluate_binomial_coefficients#Ada
with Ada.Text_IO; use Ada.Text_IO;

procedure Test_Binomial is
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

   function Binomial (N, K : Integer) return Integer is
      Result : Integer := 1;
      M      : Integer;
   begin
      if K > N/2 then -- Use symmetry
         M := N - K;
      else
         M := K;
      end if;
      for I in 1..M loop
         Result := Result * (N - M + I) / I;
      end loop;
      return Result;
   end Binomial;
begin
   for N in 0..17 loop
      for K in 0..N loop
         printsint(Binomial (N, K));
         put(' ');
      end loop;
      New_Line;
   end loop;
end Test_Binomial;
