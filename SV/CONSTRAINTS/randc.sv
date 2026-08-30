class sample;
        rand int arr[11];

        constraint a{foreach (arr[i])
                        foreach(arr[j])
                                if (i!=j)
                                        arr[i]!=arr[j];}

        constraint b{foreach(arr[i]) arr[i] inside {[0:10]};}

        function void post_randomize;
                foreach(arr[i])
                        $display("%0d",arr[i]);
        endfunction
endclass

sample h;

module test;
        initial begin
                h = new;
                h.randomize;
        end
endmodule

