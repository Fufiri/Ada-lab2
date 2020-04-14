with Ada.Text_IO;			use Ada.Text_IO;
with Ada.Integer_Text_IO;		use Ada.Integer_Text_IO;

with Ada.Numerics.Discrete_Random;

procedure Rolldie is
   -------------------------------------
   procedure Tarning(AS : out Integer) is

   begin
      
     Put("Mata in antal slag: ");
     Get(AS);
     
  end Tarning;
  ------------------------------------  
  ------------------------------------
  procedure Rad1(N : in Integer) is    
    begin
      if N = 1 then
       Put_line("|     |");
       elsif N = 2 then
       Put_line("| *   |");
       elsif N = 3 then
       Put_line("|*   *|");	  
       elsif N = 4 then
       Put_line("| * * |");
       elsif N = 5 or N = 6 then
       Put_line("|* * *|");
      end if;
 end Rad1;
 ------------------------------------
 ------------------------------------
 procedure Rad2(N : in Integer) is            
 begin
   if N = 1 or N = 3 then
    Put_line("|  *  |");
    elsif N = 2 then
    Put_line("|   * |");
    elsif N = 4 or N = 5 then
    Put_line("| * * |");
    elsif N = 6 then
    Put_line("|* * *|");
   end if;
 end Rad2;
 -------------------------------------
 ------------------------------------
  procedure Utseende(N : in Integer) is
  begin
     New_Line;
     Put_Line("+-----+");
     Rad1(N);
     Rad2(N);
     Put_Line("+-----+");
   end Utseende;
 ---------------------------------------  
         		
   subtype One_To_Six is
     Integer range 1..6;
   
   package My_Random_Package is
      new Ada.Numerics.Discrete_Random(One_To_Six);
   
   use My_Random_Package;
     
   G : Generator;
   N, AS, Sum : Integer := 0;
begin
   Reset(G); 
   Tarning(AS);
   
      for I in 1..AS loop
	 N := Random(G);
	 Utseende(N);
	 Sum := N + Sum;
      end loop;
      
      New_Line;
      Put("Din summa blev: ");
      Put(Sum, Width => 0);
     
   
end Rolldie;
