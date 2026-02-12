class Exercise1;
	
		rand bit[7:0] data ;
		rand bit[3:0] address;
		
		constraint c{data == 5;}
		constraint c1{ address dist{ [1:14]:=80, 0:=10};}
		 
		 covergroup cg;
			coverpoint data{ bins a={5};}
			coverpoint address{bins b={[1:14]};}
			
		 endgroup
		 
		 function new();
			cg=new();
		 endfunction
		 
	endclass

	module test;
		Exercise1 obj;
	
		initial begin
			repeat(10) begin
			obj =new();
			assert(obj.randomize());
			obj.cg.sample();
			$display(" data is: %0d and address :%0d",obj.data,obj.address);
			$display("coverage %0.2f",obj.cg.get_coverage);
			
			end
			end
		
		
	endmodule 
