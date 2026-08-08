`timescale 1ns/1ps

module digital_clock_tb;

    reg clk;
    reg reset;

    wire [4:0] hours;
    wire [5:0] minutes;
    wire [5:0] seconds;

    // Instantiate Digital Clock
    digital_clock #(
        .CLK_FREQ(5)
    ) uut (
        .clk(clk),
        .reset(reset),
        .hours(hours),
        .minutes(minutes),
        .seconds(seconds)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        clk   = 1'b0;
        reset = 1'b1;

        $display("==============================================");
        $display("              DIGITAL CLOCK");
        $display("==============================================");
        $display("Time\t\tHours\tMinutes\tSeconds");
        $display("----------------------------------------------");

        // Reset
        #10;
        reset = 1'b0;

        // Display clock values
        repeat (12) begin
            #50;
            $display("%0t\t\t%02d\t%02d\t%02d",
                     $time, hours, minutes, seconds);
        end

        $display("==============================================");
        $display("          SIMULATION COMPLETED");
        $display("==============================================");

        $finish;
    end

endmodule