`default_nettype none

module tt_um_controlador_pwm (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire ena,
    input  wire clk,
    input  wire rst_n
);

reg [11:0] divisor;
reg [3:0] contador;

wire [3:0] velocidad;
wire pwm;
wire estado;

assign velocidad = ui_in[3:0];

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        divisor <= 0;
        contador <= 0;
    end
    else begin
        if (divisor == 12'd3124) begin
            divisor <= 0;
            contador <= contador + 1'b1;
        end
        else begin
            divisor <= divisor + 1'b1;
        end
    end
end

assign pwm = rst_n && ((contador < velocidad) ||
                       (velocidad == 4'd15));

assign estado = rst_n && (velocidad != 0);

assign uo_out = {6'b000000, estado, pwm};

assign uio_out = 8'b00000000;
assign uio_oe  = 8'b00000000;

wire _unused = &{ena, ui_in[7:4], uio_in, 1'b0};

endmodule
