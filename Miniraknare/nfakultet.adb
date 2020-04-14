--with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
-------------------------------------
   function Nfakultet(A : in Integer)
		     return Integer is
		     
     Tal : Integer;
   begin
      
      Tal := 1;
      for I in Integer range 1..A loop
	 Tal  := Tal*I;
      end loop;
      return(Tal);
      
   end Nfakultet;
 ---------------------------------------
