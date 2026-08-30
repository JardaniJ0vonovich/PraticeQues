class sample;
        rand bit[9:0] num;
        rand bit[9:0] min;
        rand bit[9:0] max;

        constraint a{min inside {[0:10]};
                     max inside {[90:100]};
                     solve min,max before num;
                     num inside {[min:max]};}

//      constraint b{if (prime) num = no;}

        function int prime(int num);
                if (num < 2)
                        return 0;
                else
                        begin
                                for(int i=2; i <= (num -1); i++)
                                begin
                                        if (num % i == 0)
                                                return 0;
                                end
                        end
                return 1;
        endfunction


        function void post_randomize;
                $display("min range = %0d",min);
                $display("max range = %0d",max);
                for (int i = min; i<max;i++)
                        if(prime(i) == 1)
                                $write("%0d  ",i);
        endfunction

endclass

sample h;

module test;
        initial begin
                h=new;
                h.randomize;
        end
endmodule

