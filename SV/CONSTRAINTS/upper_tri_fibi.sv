class sample;
        rand int  matrix[5][5];

        constraint a{foreach (matrix[i,j])
                                if (i>j) matrix[i][j] == 0;}

        constraint b {matrix[0][0] == 1; matrix[1][1] == 1;}

        constraint c{
                foreach (matrix[i,j])
                        if((i == j) && (i>=2))
                                matrix[i][j] == matrix[i-1][j-1] + matrix[i-2][j-2];}

        constraint d{foreach (matrix[i,j]) matrix[i][j] inside {[0:10]};}

        function void post_randomize();
                foreach (matrix[i])
                begin
                        foreach(matrix[i][j])
                                $write("%0d ",matrix[i][j]);
                        $display("");
                end
        endfunction
endclass

sample s1;

module test;

        initial begin
                s1=new;
                s1.randomize();
        end
endmodule
