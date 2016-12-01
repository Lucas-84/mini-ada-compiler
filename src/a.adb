with Ada.Text_IO; use Ada.Text_IO;

procedure Fact is

   f : integer;

   procedure fact(n : integer) is
   begin
      if n <= 1 then f := 1; else fact(n-1); f := n * F; end if;
   end;

begin fact(10); New_Line; End;
