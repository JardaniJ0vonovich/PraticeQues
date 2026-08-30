class sample;
        rand int arr[20];

	//value shoudnt repeat for 3 values
        constraint a{foreach (arr[i])
                        foreach (arr[j])
                                if((i<j) && ((j-i)<=3))
                                        arr[j] != arr[i];}

        constraint b{foreach (arr[i])
                        arr[i] inside {[0:9]};}

        function void post_randomize();
                foreach (arr[i])
                        $display("%d",arr[i]);
        endfunction
endclass

sample s1;

module test;
        initial begin
                s1 = new();
                assert(s1.randomize());
        end
endmodule
