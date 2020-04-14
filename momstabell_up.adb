with Ada.Float_Text_Io; use Ada.Float_Text_Io;
with Ada.Text_Io; use Ada.Text_Io;



Procedure momstabell_up is
-----------------------------------------------------------------------
   procedure Datainlasning(Nummer : out Float; MinGrans : in Float; MaxGrans : in Float; S : in String; SF : in string) is
      
   begin
      
      Put(S);
      Get(Nummer);
	 while (Nummer <= MinGrans) loop	   
	       Put(SF);
	       New_Line;
	       Get(Nummer);
	 end loop;
--  ;	 New_Line;
--  	 Put(Nummer);
--  	 New_Line;
--  	 while (Nummer < MinGrans) loop
--  	    Put("test");
--  	      Put(SF);
--  	      New_Line;
--  	      Get(Nummer);
--  	 end loop;
	 
	 while (Nummer <= Mingrans) or (Nummer > MaxGrans) loop
	    Put(SF);
	    New_Line;
	    Get(Nummer);
	 end loop;
	 
   end Datainlasning;
   ----------------------------------------------------------------------
   
   
   ----------------------------------------------------------------------
   procedure Tabell(Minpris, Maxpris, Moms, Steg : in float) is
      
      -----------------------------------------------------------------
      procedure Tabelldata(Minpris_old, Maxpris, Moms : in float) is
	 
	 F: Float;
	 Minpris : Float := Minpris_Old;
      begin
	 
	  while Minpris < Maxpris or Minpris = Maxpris loop
	     F := Minpris*(Moms/100.0);
	     Put(Minpris, 6, 2, 0);
	     Put(F, 7, 2, 0);
	     Put(Minpris+F, 7, 2, 0);
	     New_Line;
	     Minpris := (Minpris + Steg);
	  end loop;
	  
      end Tabelldata;
      ----------------------------------------------------------------   
      
   begin
      
   New_Line;   
   Put("=== Momstabell ===");
   New_Line;
   Put("Pris utan moms Moms Pris med moms");
   New_Line;
   Tabelldata(Minpris, Maxpris, Moms);
   New_Line;
   
   end Tabell;
 ---------------------------------------------------------------------  
   
  
  Minpris: Float;
  Maxpris: Float;
  Moms: Float;
  Steg: Float;   
   
Begin
    
   Datainlasning(Minpris, 0.0, 1000000000.0, "Första pris: ", "Siffran är för låg:");
   
   Datainlasning(Maxpris, Minpris, 1000000000.0, "Sista pris: ", "Måste vara mer än första priset:");
   
   Datainlasning(Steg, 0.0, 10000.0, "Steg: ", "Steget måste vara högre än 0");
  
   Datainlasning(Moms, 0.0, 100.0, "Momsprocent: ", "Kan inte vara högre än 100, eller mindre än 0:");   
   
   Tabell(Minpris, Maxpris, Moms, Steg);
   
   
End momstabell_up;
