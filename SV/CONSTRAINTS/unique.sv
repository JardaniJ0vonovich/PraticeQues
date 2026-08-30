class sample;
  rand int arr[5][5];

  // Values between 0 and 25
  constraint a {foreach(arr[i,j]) arr[i][j] inside {[0:25]};}

  // Unique values in each row
  constraint b {foreach(arr[i,j])
      			foreach(arr[i,k])
        			if(j != k)
          			arr[i][j] != arr[i][k];}

  // Unique values in each column
  constraint c {foreach(arr[i,j])
      			foreach(arr[k,j])
        			if(i != k)
          			arr[i][j] != arr[k][j];}

  function void post_randomize();
    foreach(arr[i]) begin
      foreach(arr[i][j])
        $write("%0d  ", arr[i][j]);
      $display("");
    end
  endfunction

endclass

sample s1;

module test;
  initial begin
    s1 = new();
    s1.randomize();
  end
endmodule
