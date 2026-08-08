module digital_clock #(
    parameter CLK_FREQ = 10
)(
    input  wire clk,
    input  wire reset,

    output reg [4:0] hours,
    output reg [5:0] minutes,
    output reg [5:0] seconds
);

    reg [31:0] counter;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 0;
            hours   <= 0;
            minutes <= 0;
            seconds <= 0;
        end
        else begin

            if (counter == CLK_FREQ - 1) begin
                counter <= 0;

                // One second elapsed
                if (seconds == 59) begin
                    seconds <= 0;

                    if (minutes == 59) begin
                        minutes <= 0;

                        if (hours == 23)
                            hours <= 0;
                        else
                            hours <= hours + 1'b1;

                    end
                    else begin
                        minutes <= minutes + 1'b1;
                    end

                end
                else begin
                    seconds <= seconds + 1'b1;
                end

            end
            else begin
                counter <= counter + 1'b1;
            end

        end
    end

endmodule