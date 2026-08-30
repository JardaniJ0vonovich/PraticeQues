class sample;
  rand int sudoku[9][9];

  //for setting value between 1-9
  constraint a {foreach (sudoku[i,j])
                        sudoku[i][j] inside {[1:9]};}
                        
  //for setting unique values for row
  constraint b{ foreach (sudoku[i,j])
                        foreach (sudoku[i,k])
                                if(j!=k)
                                sudoku[i][j] != sudoku [i][k];}

  //for setting unique values for column
  constraint c{ foreach (sudoku[i,j])
                        foreach (sudoku[k,j])
                                if(i!=k)
                                sudoku[i][j] != sudoku [k][j];}

  //for setting unique 3x3 matrix inside 9x9
  constraint d{foreach (sudoku [i,j])
                        foreach (sudoku[a,b])
                                if((i/3 == a/3) && (j/3 == b/3))
                                        if((i!=a) || (j!=b))
                                                sudoku[i][j] != sudoku[a][b];}

  function void post_randomize();
        foreach (sudoku[i])
        begin
                foreach (sudoku[i][j])
                        $write("%0d ", sudoku[i][j]);
                $display("");
        end
  endfunction
endclass

sample s1;

  module test;
    initial begin
      s1=new();
      s1.randomize();
    end
  endmodule
