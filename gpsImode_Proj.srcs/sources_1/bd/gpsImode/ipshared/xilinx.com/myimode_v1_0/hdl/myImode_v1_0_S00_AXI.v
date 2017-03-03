`timescale 1 ns / 1 ps

module myImode_v1_0_S00_AXI #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line

		// Width of S_AXI data bus
		parameter integer C_S_AXI_DATA_WIDTH	= 32,
		// Width of S_AXI address bus
		parameter integer C_S_AXI_ADDR_WIDTH	= 7
	)
	(
		// Users to add ports here
		input wire StartTrigger,
		input wire StopTrigger1,
		input wire StopTrigger2,
		output wire StopDis1,
		output wire StopDis2,
		output wire StopDis3,
		output wire StopDis4,
		output wire StartDis,
		output wire[3:0] addr,
		inout wire [27:0] data,
		output wire wrn,
		output wire rdn,
		output wire csn,
		output wire oen,
		output wire AluTrigger,
		input wire IrFlag,
		input wire EF1,
		input wire EF2,
		input wire ErrFlag,
		output wire Tstart,
		output  wire Tstop1,
		output wire Tstop2,
		output wire set_zero,
        output wire [C_S_AXI_DATA_WIDTH-1:0] Tstart_counter,
        output wire [21:0] ch1_data,
        output wire [21:0] ch2_data,
        output wire dataCanBeRd_out,
		// User ports ends
		// Do not modify the ports beyond this line

		// Global Clock Signal
		input wire  S_AXI_ACLK,
		// Global Reset Signal. This Signal is Active LOW
		input wire  S_AXI_ARESETN,
		// Write address (issued by master, acceped by Slave)
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
		// Write channel Protection type. This signal indicates the
		// privilege and security level of the transaction, and whether
		// the transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_AWPROT,
		// Write address valid. This signal indicates that the master signaling
		// valid write address and control information.
		input wire  S_AXI_AWVALID,
		// Write address ready. This signal indicates that the slave is ready
		// to accept an address and associated control signals.
		output wire  S_AXI_AWREADY,
		// Write data (issued by master, acceped by Slave) 
		input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
		// Write strobes. This signal indicates which byte lanes hold
		// valid data. There is one write strobe bit for each eight
		// bits of the write data bus.    
		input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
		// Write valid. This signal indicates that valid write
		// data and strobes are available.
		input wire  S_AXI_WVALID,
		// Write ready. This signal indicates that the slave
		// can accept the write data.
		output wire  S_AXI_WREADY,
		// Write response. This signal indicates the status
		// of the write transaction.
		output wire [1 : 0] S_AXI_BRESP,
		// Write response valid. This signal indicates that the channel
		// is signaling a valid write response.
		output wire  S_AXI_BVALID,
		// Response ready. This signal indicates that the master
		// can accept a write response.
		input wire  S_AXI_BREADY,
		// Read address (issued by master, acceped by Slave)
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
		// Protection type. This signal indicates the privilege
    		// and security level of the transaction, and whether the
    		// transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_ARPROT,
		// Read address valid. This signal indicates that the channel
    		// is signaling valid read address and control information.
		input wire  S_AXI_ARVALID,
		// Read address ready. This signal indicates that the slave is
    		// ready to accept an address and associated control signals.
		output wire  S_AXI_ARREADY,
		// Read data (issued by slave)
		output wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,
		// Read response. This signal indicates the status of the
    		// read transfer.
		output wire [1 : 0] S_AXI_RRESP,
		// Read valid. This signal indicates that the channel is
    		// signaling the required read data.
		output wire  S_AXI_RVALID,
		// Read ready. This signal indicates that the master can
    		// accept the read data and response information.
		input wire  S_AXI_RREADY
	);

	// AXI4LITE signals
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
	reg  	axi_awready;
	reg  	axi_wready;
	reg [1 : 0] 	axi_bresp;
	reg  	axi_bvalid;
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
	reg  	axi_arready;
	reg [C_S_AXI_DATA_WIDTH-1 : 0] 	axi_rdata;
	reg [1 : 0] 	axi_rresp;
	reg  	axi_rvalid;
	// Example-specific design signals
	// local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
	// ADDR_LSB is used for addressing 32/64 bit registers/memories
	// ADDR_LSB = 2 for 32 bits (n downto 2)
	// ADDR_LSB = 3 for 64 bits (n downto 3)
	localparam integer ADDR_LSB = (C_S_AXI_DATA_WIDTH/32) + 1;
	localparam integer OPT_MEM_ADDR_BITS = 4;
	//----------------------------------------------
	//-- Signals for user logic register space example
    reg  m_csn;
    reg  m_wrn;
    reg  m_rdn;
    reg m_oen;
    reg[27:0]  m_data;
    wire [27:0] data_in;
    reg[3:0]   m_addr;     
    wire [31:0] timeData;
    wire saveDataFlag;
	//------------------------------------------------
	//-- Number of Slave Registers 26
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg0;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg1;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg2;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg3;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg4;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg5;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg6;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg7;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg8;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg9;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg10;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg11;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg12;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg13;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg14;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg15;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg16;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg17;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg18;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg19;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg20;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg21;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg22;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg23;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg24;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg25;
	wire	 slv_reg_rden;
	wire	 slv_reg_wren;
	reg [C_S_AXI_DATA_WIDTH-1:0]	 reg_data_out;
	integer	 byte_index;

	// I/O Connections assignments

	assign S_AXI_AWREADY	= axi_awready;
	assign S_AXI_WREADY	= axi_wready;
	assign S_AXI_BRESP	= axi_bresp;
	assign S_AXI_BVALID	= axi_bvalid;
	assign S_AXI_ARREADY	= axi_arready;
	assign S_AXI_RDATA	= axi_rdata;
	assign S_AXI_RRESP	= axi_rresp;
	assign S_AXI_RVALID	= axi_rvalid;
	// Implement axi_awready generation
	// axi_awready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
	// de-asserted when reset is low.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awready <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID)
	        begin
	          // slave is ready to accept write address when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          axi_awready <= 1'b1;
	        end
	      else           
	        begin
	          axi_awready <= 1'b0;
	        end
	    end 
	end       

	// Implement axi_awaddr latching
	// This process is used to latch the address when both 
	// S_AXI_AWVALID and S_AXI_WVALID are valid. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awaddr <= 0;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID)
	        begin
	          // Write Address latching 
	          axi_awaddr <= S_AXI_AWADDR;
	        end
	    end 
	end       

	// Implement axi_wready generation
	// axi_wready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
	// de-asserted when reset is low. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_wready <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_wready && S_AXI_WVALID && S_AXI_AWVALID)
	        begin
	          // slave is ready to accept write data when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          axi_wready <= 1'b1;
	        end
	      else
	        begin
	          axi_wready <= 1'b0;
	        end
	    end 
	end       

	// Implement memory mapped register select and write logic generation
	// The write data is accepted and written to memory mapped registers when
	// axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
	// select byte enables of slave registers while writing.
	// These registers are cleared when reset (active low) is applied.
	// Slave register write enable is asserted when valid address and data are available
	// and the slave is ready to accept the write address and write data.
	assign slv_reg_wren = axi_wready && S_AXI_WVALID && axi_awready && S_AXI_AWVALID;

//	always @( posedge S_AXI_ACLK )
	
	// Implement write response logic generation
	// The write response and response valid signals are asserted by the slave 
	// when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
	// This marks the acceptance of address and indicates the status of 
	// write transaction.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_bvalid  <= 0;
	      axi_bresp   <= 2'b0;
	    end 
	  else
	    begin    
	      if (axi_awready && S_AXI_AWVALID && ~axi_bvalid && axi_wready && S_AXI_WVALID)
	        begin
	          // indicates a valid write response is available
	          axi_bvalid <= 1'b1;
	          axi_bresp  <= 2'b0; // 'OKAY' response 
	        end                   // work error responses in future
	      else
	        begin
	          if (S_AXI_BREADY && axi_bvalid) 
	            //check if bready is asserted while bvalid is high) 
	            //(there is a possibility that bready is always asserted high)   
	            begin
	              axi_bvalid <= 1'b0; 
	            end  
	        end
	    end
	end   

	// Implement axi_arready generation
	// axi_arready is asserted for one S_AXI_ACLK clock cycle when
	// S_AXI_ARVALID is asserted. axi_awready is 
	// de-asserted when reset (active low) is asserted. 
	// The read address is also latched when S_AXI_ARVALID is 
	// asserted. axi_araddr is reset to zero on reset assertion.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_arready <= 1'b0;
	      axi_araddr  <= 32'b0;
	    end 
	  else
	    begin    
	      if (~axi_arready && S_AXI_ARVALID)
	        begin
	          // indicates that the slave has acceped the valid read address
	          axi_arready <= 1'b1;
	          // Read address latching
	          axi_araddr  <= S_AXI_ARADDR;
	        end
	      else
	        begin
	          axi_arready <= 1'b0;
	        end
	    end 
	end       

	// Implement axi_arvalid generation
	// axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
	// S_AXI_ARVALID and axi_arready are asserted. The slave registers 
	// data are available on the axi_rdata bus at this instance. The 
	// assertion of axi_rvalid marks the validity of read data on the 
	// bus and axi_rresp indicates the status of read transaction.axi_rvalid 
	// is deasserted on reset (active low). axi_rresp and axi_rdata are 
	// cleared to zero on reset (active low).  
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rvalid <= 0;
	      axi_rresp  <= 0;
	    end 
	  else
	    begin    
	      if (axi_arready && S_AXI_ARVALID && ~axi_rvalid)
	        begin
	          // Valid read data is available at the read data bus
	          axi_rvalid <= 1'b1;
	          axi_rresp  <= 2'b0; // 'OKAY' response
	        end   
	      else if (axi_rvalid && S_AXI_RREADY)
	        begin
	          // Read data is accepted by the master
	          axi_rvalid <= 1'b0;
	        end                
	    end
	end    

	// Implement memory mapped register select and read logic generation
	// Slave register read enable is asserted when valid address is available
	// and the slave is ready to accept the read address.
	assign slv_reg_rden = axi_arready & S_AXI_ARVALID & ~axi_rvalid;
	always@(posedge S_AXI_ACLK)
    begin
          if ( S_AXI_ARESETN == 1'b0 )
            begin
              slv_reg0 <= 0;
              slv_reg1 <= 0;
              slv_reg2 <= 0;
              slv_reg3 <= 0;
              slv_reg4 <= 0;
              slv_reg5 <= 0;
              slv_reg6 <= 0;
              slv_reg7 <= 0;
              slv_reg8 <= 0;
              slv_reg9 <= 0;
              slv_reg10 <= 0;
              slv_reg11 <= 0;
              slv_reg12 <= 0;
              slv_reg13 <= 0;
              slv_reg14 <= 0;
              slv_reg15 <= 0;
              slv_reg16 <= 0;
              slv_reg17 <= 0;
              slv_reg18 <= 0;
              slv_reg19 <= 0;
              slv_reg20 <= 0;
              slv_reg21 <= 0;
              slv_reg22 <= 0;
              slv_reg23 <= 0;
              slv_reg24 <= 0;
              slv_reg25 <= 0;
            end 
          else begin
            if (slv_reg_wren)
              begin
                case ( axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
                  5'h00:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                        // Respective byte enables are asserted as per write strobes 
                        // Slave register 0
                        slv_reg0[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end  
                  5'h01:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                        // Respective byte enables are asserted as per write strobes 
                        // Slave register 1
                        slv_reg1[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end  
                  5'h02:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                        // Respective byte enables are asserted as per write strobes 
                        // Slave register 2
                        slv_reg2[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end  
                  5'h03:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                        // Respective byte enables are asserted as per write strobes 
                        // Slave register 3
                        slv_reg3[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end  
                  5'h04:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                        // Respective byte enables are asserted as per write strobes 
                        // Slave register 4
                        slv_reg4[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end  
                  5'h05:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                        // Respective byte enables are asserted as per write strobes 
                        // Slave register 5
                        slv_reg5[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end  
                  5'h06:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                        // Respective byte enables are asserted as per write strobes 
                        // Slave register 6
                        slv_reg6[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end  
                  5'h07:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                        // Respective byte enables are asserted as per write strobes 
                        // Slave register 7
                        slv_reg7[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end  
                  5'h08:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                        // Respective byte enables are asserted as per write strobes 
                        // Slave register 8
                        slv_reg8[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end  
                  5'h09:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                        // Respective byte enables are asserted as per write strobes 
                        // Slave register 9
                        slv_reg9[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end  
                  5'h0A:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                        // Respective byte enables are asserted as per write strobes 
                        // Slave register 10
                        slv_reg10[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end  
                  5'h0B:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                        // Respective byte enables are asserted as per write strobes 
                        // Slave register 11
                        slv_reg11[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end  
                  5'h0C:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                        // Respective byte enables are asserted as per write strobes 
                        // Slave register 12
                        slv_reg12[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end  
                  5'h0D:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                        // Respective byte enables are asserted as per write strobes 
                        // Slave register 13
                        slv_reg13[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end  
                  5'h0E:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                        // Respective byte enables are asserted as per write strobes 
                        // Slave register 14
                        slv_reg14[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end  
                  5'h0F:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                        // Respective byte enables are asserted as per write strobes 
                        // Slave register 15
                        slv_reg15[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end  
                  5'h10:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                        // Respective byte enables are asserted as per write strobes 
                        // Slave register 16
                        slv_reg16[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end  
                  5'h11:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                        // Respective byte enables are asserted as per write strobes 
                        // Slave register 17
                        slv_reg17[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end  
                  5'h12:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                        // Respective byte enables are asserted as per write strobes 
                        // Slave register 18
                        slv_reg18[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end  
                  5'h13:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                        // Respective byte enables are asserted as per write strobes 
                        // Slave register 19
                        slv_reg19[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end  
                  5'h14:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                        // Respective byte enables are asserted as per write strobes 
                        // Slave register 20
                        slv_reg20[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end  
                  5'h15:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                        // Respective byte enables are asserted as per write strobes 
                        // Slave register 21
                        slv_reg21[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end  
                  5'h16:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                        // Respective byte enables are asserted as per write strobes 
                        // Slave register 22
                        slv_reg22[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end  
                  5'h17:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                        // Respective byte enables are asserted as per write strobes 
                        // Slave register 23
                        slv_reg23[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end  
                  5'h18:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                        // Respective byte enables are asserted as per write strobes 
                        // Slave register 24
                        slv_reg24[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end  
                  5'h19:
                    for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
                      if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                        // Respective byte enables are asserted as per write strobes 
                        // Slave register 25
                        slv_reg25[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
                      end  
                  default : begin
                              slv_reg0 <= slv_reg0;
                              slv_reg1 <= slv_reg1;
                              slv_reg2 <= slv_reg2;
                              slv_reg3 <= slv_reg3;
                              slv_reg4 <= slv_reg4;
                              slv_reg5 <= slv_reg5;
                              slv_reg6 <= slv_reg6;
                              slv_reg7 <= slv_reg7;
                              slv_reg8 <= slv_reg8;
                              slv_reg9 <= slv_reg9;
                              slv_reg10 <= slv_reg10;
                              slv_reg11 <= slv_reg11;
                              slv_reg12 <= slv_reg12;
                              slv_reg13 <= slv_reg13;
                              slv_reg14 <= slv_reg14;
                              slv_reg15 <= slv_reg15;
                              slv_reg16 <= slv_reg16;
                              slv_reg17 <= slv_reg17;
                              slv_reg18 <= slv_reg18;
                              slv_reg19 <= slv_reg19;
                              slv_reg20 <= slv_reg20;
                              slv_reg21 <= slv_reg21;
                              slv_reg22 <= slv_reg22;
                              slv_reg23 <= slv_reg23;
                              slv_reg24 <= slv_reg24;
                              slv_reg25 <= slv_reg25;
                            end
                endcase
              end
          end    
    end
    
	always @(*)
	begin
	      // Address decoding for reading registers
	      case ( axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
	        5'h00   : reg_data_out <= StopDis1;
            5'h01   : reg_data_out <= slv_reg1;
            5'h02   : reg_data_out <= Tstart_counter;
            5'h03   : reg_data_out <= slv_reg3;
            5'h04   : reg_data_out <= data_in; // modified by lynn;
            5'h05   : reg_data_out <= EF1;
            5'h06   : reg_data_out <= EF2;
            5'h07   : reg_data_out <= ErrFlag;
            5'h08   : reg_data_out <=  IrFlag;
            5'h09   : reg_data_out <= ch1_data;
            5'h0A   : reg_data_out <= ch2_data;
            5'h0B   : reg_data_out <= slv_reg11;
            5'h0C   : reg_data_out <= slv_reg12;
            5'h0D   : reg_data_out <= slv_reg13;
            5'h0E   : reg_data_out <= slv_reg14;
            5'h0F   : reg_data_out <= slv_reg15;
            5'h10   : reg_data_out <= slv_reg16;
            5'h11   : reg_data_out <= slv_reg17;
            5'h12   : reg_data_out <= slv_reg18;
            5'h13   : reg_data_out <= slv_reg19;
            5'h14   : reg_data_out <= slv_reg20;
	        5'h15   : reg_data_out <= slv_reg21;
	        5'h16   : reg_data_out <= slv_reg22;
	        5'h17   : reg_data_out <= slv_reg23;
	        5'h18   : reg_data_out <= slv_reg24;
	        5'h19   : reg_data_out <= slv_reg25;
	        default : reg_data_out <= 0;
	      endcase
	end

	// Output register or memory read data
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rdata  <= 0;
	    end 
	  else
	    begin    
	      // When there is a valid read address (S_AXI_ARVALID) with 
	      // acceptance of read address by the slave (axi_arready), 
	      // output the read dada 
	      if (slv_reg_rden)
	        begin
	          axi_rdata <= reg_data_out;     // register read data
	        end   
	    end
	end    

	// Add user logic here

    always@(posedge S_AXI_ACLK )
    begin
      if (!S_AXI_ARESETN) 
        begin       
          m_oen<=1;
          m_csn<=1;
          m_wrn<=1;
          m_rdn<=1;
          m_data<=0;
          m_addr<=0;     
          end
      else begin
         m_oen<=1;
         {m_csn, m_wrn, m_rdn, m_addr}<=slv_reg0;
         m_data<=slv_reg4;
         end
     end
     
    assign Tstart=StartTrigger;
    assign Tstop1=StopTrigger1;
    assign Tstop2=StopTrigger2;
    //bylk

    TstartCounter tstart_counter(.clk(S_AXI_ACLK), .resetn(S_AXI_ARESETN), 
        .plusSignal(set_zero), .out_reg(Tstart_counter));

    //-- use alutrigger to reset tdc,
    //-- this function should be companied with reg5[23] == 1.
    //-- and it is better to set reg[21] == 1 to set stopDisStart.
    TdcCtrl(.clk(S_AXI_ACLK), .resetn(S_AXI_ARESETN), 
        .tstartTri(set_zero),
        .stopDis1(StopDis1), .stopDis2(StopDis2), .stopDis3(StopDis3), .stopDis4(StopDis4),
        .masterRst(AluTrigger), .dataCanBeSave(saveDataFlag));

    TIME_DECODER decoder(.clk(S_AXI_ACLK), .resetn(S_AXI_ARESETN), 
        .data_in(timeData), .setFlag(rdOverFlag_out), .saveFlag(saveDataFlag),
        .data1_out(ch1_data), .data2_out(ch2_data), .dataCanBeRd_out(dataCanBeRd_out));

    TdcRegReadAndWrite tdcRegReadAndWrite(.clk(S_AXI_ACLK), .resetn(S_AXI_ARESETN), 
        .sfWrFlag_in(m_wrn), .sfRdFlag_in(m_rdn), .addr_in(m_addr), .sfData_in(m_data), .tdcDataReg_inout(data),
        .EF1_in(!EF1), .EF2_in(!EF2), 
        .sfData_out(data_in), .csn_out(csn), .wrn_out(wrn), .rdn_out(rdn), .addr_out(addr),
        .timeData_out(timeData), .rdOverFlag_out(rdOverFlag_out)); 

    GetSyncSignal_Async  getTstartTrigger(.clk(S_AXI_ACLK), .resetn(S_AXI_ARESETN),
        .signal_in(StartTrigger), .signal_out(set_zero)); 
endmodule
	
module TdcRegReadAndWrite(input clk, input resetn, 
        input sfWrFlag_in, input sfRdFlag_in, input [3:0] addr_in, 
        input EF1_in, input EF2_in,
        input [27:0] sfData_in, inout [27:0] tdcDataReg_inout,
        output csn_out, output wrn_out, output rdn_out, output [3:0] addr_out,
        output [31:0]timeData_out, output [31:0] sfData_out, output rdOverFlag_out);
    
        wire [27:0] dataWriteOut;
        wire csn_rd, csn_wr;
        wire [3:0] rd_addr;
        wire [3:0] wr_addr;
        wire EF1_toRead, rdLockFlag, efRdFlag;
        wire [1:0] rdStep;
    
        assign tdcDataReg_inout = dataWriteOut;
        assign csn_out =  sfWrFlag_in? csn_wr: csn_rd;
        assign addr_out =  sfWrFlag_in? wr_addr: rd_addr;
    
        RdAndWrSequenceCtrl rdAndWrCtrl(.clk(clk), .resetn(resetn),
            .sfRdFlag_in(sfRdFlag_in), .sfWrFlag_in(sfWrFlag_in),
            .EF1_in(EF1_in), .EF2_in(EF2_in), 
            .rdStep_in(rdStep), .rdLockFlag_in(rdLockFlag), 
            .EF1_out(EF1_toRead), .efRdFlag_out(efRdFlag));
    
        TdcRegRead tdcRegRead(.clk(clk), .resetn(resetn), 
            .EF1_in(EF1_toRead), .efFlag_in(efRdFlag), .sfRdFlag_in(sfRdFlag_in),
            .addr_in(addr_in), .data_in(tdcDataReg_inout),//addr_in[3:0], data_in[27:0] 
            .sfRdData_out(sfData_out), .timeData_out(timeData_out),//sfRdData_out[31:0], timeData_out[27:0] 
            .lockFlag_out(rdLockFlag), .step_out(rdStep),//step_out[1:0]
            .csn_out(csn_rd), .rdn_out(rdn_out), .addr_out(rd_addr),//addr_out[3:0] 
            .rdOverFlag_out(rdOverFlag_out));
    
        TdcRegWrite    tdcRegWrite(.clk(clk), .resetn(resetn),
            .sfWrFlag_in(sfWrFlag_in), .addr_in(addr_in), .data_in(sfData_in),
            .wrData_out(dataWriteOut), .csn_out(csn_wr), 
            .wrn_out(wrn_out), .addr_out(wr_addr));
endmodule
    
    
`define IS_TIME_DATA   (addr_out == 8) | (addr_out == 9)
`define RESET      4'b1xxx
`define READ_STEP1 4'b0100
`define READ_STEP2 4'b0101
`define READ_STEP3 4'b0110
`define READ_STEP4 4'b0111
module TdcRegRead (input clk, input resetn, 
        input EF1_in, input efFlag_in, input sfRdFlag_in, 
        input [3:0] addr_in, input [27:0]data_in,
        output reg[31:0] sfRdData_out, output reg [31:0]timeData_out, 
        output reg csn_out, output lockFlag_out, output [1:0]step_out,
        output reg rdn_out, output reg [3:0] addr_out, output reg rdOverFlag_out);
    
        wire sfRdTrig, efTrig, lockFlag, rdTrig;
        wire [1:0] step;
    
        assign lockFlag_out = lockFlag;
        assign step_out = step;
        assign rdTrig = (sfRdTrig | efTrig)? 1'b1: 1'b0; 
     
        always@(posedge clk) begin
            casex({!resetn, lockFlag, step}) 
                `RESET: begin
                    csn_out <= 1'b1;
                    rdn_out <= 1'b1;
                    addr_out <= 4'b1111;
                    sfRdData_out <= 32'b0;
                    timeData_out <= 32'b0;
                    rdOverFlag_out <= 1'b0;
                    end
                `READ_STEP1: begin
                    if(sfRdFlag_in)
                      addr_out <= addr_in;
                    else begin
                      if(EF1_in)
                        addr_out <= 4'h8;
                      else
                        addr_out <= 4'h9;
                    end
                  end
                `READ_STEP2: begin
                    csn_out <= 1'b0;
                    rdn_out <= 1'b0;
                    end
                `READ_STEP3: begin
                    csn_out <= 1'b0;
                    rdn_out <= 1'b0;
                    end
                `READ_STEP4: begin
                    csn_out <= 1'b1;
                    rdn_out <= 1'b1;
                    if(sfRdFlag_in) 
                        sfRdData_out <= {addr_out, data_in};
                    if(`IS_TIME_DATA) begin
                        timeData_out <= {addr_out, data_in};
                        rdOverFlag_out <= 1'b1;
                    end                   
                    else begin
                        timeData_out <= timeData_out;
                    end
                    addr_out <= 4'hf;
                   end
                default : begin
                    csn_out <= csn_out;
                    rdn_out <= rdn_out;
                    addr_out <= addr_out;
                    timeData_out <= timeData_out;
                    rdOverFlag_out <= 1'b0;
                    if(sfRdFlag_in)
                        sfRdData_out <= sfRdData_out;
                    else
                        sfRdData_out <= 32'b0;
                end
            endcase
        end
    
        GetSyncSignal_Sync  getEfTrigger(.clk(clk), .resetn(resetn), 
            .signal_in(efFlag_in), .signal_out(efTrig));
    
        GetSyncSignal_Sync  getsfRdTrigger(.clk(clk), .resetn(resetn), 
            .signal_in(sfRdFlag_in), .signal_out(sfRdTrig));
    
        TimingStepGenerator    getTimingStep(.clk(clk), .resetn(resetn), 
            .trigger(rdTrig), .step_out(step));
    
        TimingFlagGenerator getTimingFlag(.clk(clk), .resetn(resetn), 
            .trigger(rdTrig), .step(step), .flag_out(lockFlag));
endmodule
    
module TimingStepGenerator(input clk, input resetn, input trigger, output reg [1:0] step_out);
        always@(posedge clk)
            if(!resetn| trigger| (step_out == 2'b11)) 
                step_out <= 2'b00;
            else
                step_out <= step_out + 1;
endmodule
        
module TimingFlagGenerator(input clk, input resetn, input trigger, input [1:0] step, output reg flag_out);
        always@(posedge clk) begin
            if(!resetn)
                flag_out <= 1'b0;
            else if(trigger == 1'b1)
                    flag_out <= 1'b1;
                else if (step == 2'b11)
                        flag_out <= 1'b0;
                     else
                        flag_out <= flag_out;
        end
endmodule
    
    
module GetSyncSignal_Sync(input clk, input resetn, input signal_in, output signal_out);
        reg signal_temp1;
        always@(posedge clk) begin
            if(!resetn) 
                signal_temp1 <= 1'b0;
            else 
                signal_temp1 <= signal_in;
        end
    
        assign signal_out = signal_in &(~signal_temp1);
endmodule
    
module GetSyncSignal_Async(input clk, input resetn, input signal_in, output signal_out);
        reg signal_temp1;
        reg signal_temp2;
        reg signal_temp3;
    
        always@(posedge clk) begin
            if(!resetn) begin
                signal_temp1 <=0;
                signal_temp2 <=0;
                signal_temp3 <=0;
            end
            else begin
                signal_temp1 <= signal_in;
                signal_temp2 <= signal_temp1;
                signal_temp3 <= signal_temp2;
            end
        end
    
        assign signal_out = signal_temp2 &(~signal_temp3);
endmodule
    
`define WRITE_STEP1 4'b0100
`define WRITE_STEP2 4'b0101
`define WRITE_STEP3 4'b0110
`define WRITE_STEP4 4'b0111
`define HIGH_Z        28'hzzzz

module TdcRegWrite (input clk, input resetn, input sfWrFlag_in, input [3:0] addr_in, input [27:0]data_in,
    output [27:0] wrData_out, output reg csn_out, output reg wrn_out, output reg [3:0] addr_out);

    reg [27:0] data_out;
    wire [1:0] step;
    wire wrFlag;
    wire wrTrig;

    always@(posedge clk) begin
        casex({!resetn, wrFlag, step}) 
            `RESET: begin
                csn_out <= 1'b1;
                wrn_out <= 1'b1;
                addr_out <= 4'b1111;
                data_out <= 28'b0;
            end
            `WRITE_STEP1: begin
                addr_out <= addr_in;
                data_out <= data_in;
            end
            `WRITE_STEP2: begin
                csn_out <= 1'b0;
                wrn_out <= 1'b0;
            end
            `WRITE_STEP3: begin
                csn_out <= 1'b1;
                wrn_out <= 1'b1;
            end
            `WRITE_STEP4: data_out <= 28'b0;
            default : begin
                csn_out <= csn_out;
                wrn_out <= wrn_out;
                addr_out <= addr_out;
                data_out <= data_in;
            end
        endcase
    end

    assign wrData_out = wrFlag? data_out:`HIGH_Z;//TDC data reg is a inout pin, so if write is no use, keep it in high_z

    GetSyncSignal_Sync  getWrTrigger(.clk(clk), .resetn(resetn), .signal_in(sfWrFlag_in), .signal_out(wrTrig));
    TimingStepGenerator    getTimingStep(.clk(clk), .resetn(resetn), .trigger(wrTrig), .step_out(step));
    TimingFlagGenerator getTimingFlag(.clk(clk), .resetn(resetn), .trigger(wrTrig), .step(step), .flag_out(wrFlag));

endmodule
    
`define IS_IN_READ_STEP4  rdLockFlag_in& (rdStep_in == 2'b11) 
module RdAndWrSequenceCtrl(input clk, input resetn,
    input sfRdFlag_in, input sfWrFlag_in,
    input EF1_in, input EF2_in,  input [1:0] rdStep_in, input rdLockFlag_in, 
    output reg EF1_out, output reg efRdFlag_out);
    
    reg EF2;
        
        /*********************************************************
        * Handle with the EF1_out and EF2 signal.
        * It get these two signal in one time, after read the FIFO1(FIFO2)data,
        * the EF1_out(EF2) should be reset. 
        * The sfRdFlag has the highest priority, so when it come, 
        * EF1_out and EF2 will be ignored. 
        * The handle in (`IS_IN_READ_STEP4) is because
        * the EF1_out and EF2 should be read sequencely(when EF1_out and EF2 were both set) ,
        * so the data in both two fifo can't be lost.This is 
        * very important so it should be handled like this.
        * *********************************************************/   
        always@(posedge clk) begin
            if(!resetn | sfRdFlag_in | sfWrFlag_in) begin
                EF1_out <= 1'b0;
                EF2 <= 1'b0;
            end
            else begin
                if(!rdLockFlag_in & !EF1_out & !EF2) begin
                    EF1_out <= EF1_in;
                    EF2 <= EF2_in;
                end
                else begin
                    if(`IS_IN_READ_STEP4) begin
                        if(EF1_out) 
                            EF1_out <= 1'b0;
                        else 
                            EF2 <= 1'b0;
                    end
                    else begin
                        EF1_out <= EF1_out;
                        EF2 <= EF2;     
                    end           
                end
            end
        end 
        /************************ END ***************************/
    
        /*********************************************************
        * Get the efRdFlag_out to trigger the Read timing sequence.
        * The handle in (`IS_IN_READ_STEP4& EF1_out& EF2) is because
        * the EF1_out and EF2 should be read sequencely(when EF1_out and EF2 were both set) ,
        * so the data in both two fifo can't be lost.
        * *********************************************************/
        always@(posedge clk)begin
           if(!resetn)
               efRdFlag_out <= 1'b0;
           else begin
               if(!rdLockFlag_in)begin
                   efRdFlag_out <= (EF1_out|EF2);
               end
               else begin
                   if(`IS_IN_READ_STEP4& EF1_out& EF2)
                       efRdFlag_out <= 1'b1;
                   else
                       efRdFlag_out <= 0;
               end
           end
       end
        /************************ END ***************************/
    
       assign rdFlag_out = sfRdFlag_in;
       assign wrFlag_out = sfWrFlag_in;
    
endmodule

`define TDC_DATA_WIDTH   22 
module TIME_DECODER (input clk, input resetn,  
    input [31:0] data_in, input setFlag, input saveFlag,
    output reg [`TDC_DATA_WIDTH-1:0]data1_out, output reg [`TDC_DATA_WIDTH-1:0]data2_out, 
    output dataCanBeRd_out);

    wire clearFlag;
    reg [`TDC_DATA_WIDTH-1:0] data1_temp;
    reg [`TDC_DATA_WIDTH-1:0] data2_temp;

    assign dataCanBeRd_out = clearFlag;

    always@(posedge clk) begin
        if(!resetn | clearFlag) begin
            data1_temp <= `TDC_DATA_WIDTH'b0;
            data2_temp <= `TDC_DATA_WIDTH'b0;
        end
        else begin
            if(setFlag) begin
                case(data_in[31:28])
                    8: data1_temp <= data_in[`TDC_DATA_WIDTH-1:0];
                    9: data2_temp <= data_in[`TDC_DATA_WIDTH-1:0];
                endcase
            end
            else begin
                data1_temp <= data1_temp;
                data2_temp <= data2_temp;
            end
        end
    end

    always@(posedge clk) begin
        if(!resetn) begin
            data1_out <= `TDC_DATA_WIDTH'b0;
            data2_out <= `TDC_DATA_WIDTH'b0;
        end
        else begin
            if(saveFlag) begin
                data1_out <= data1_temp;
                data2_out <= data2_temp;
            end
            else begin
                data1_out <= data1_out;
                data2_out <= data2_out;
            end
        end
    end

    NegEdgeGet_Sync negGet(.clk(clk), .resetn(resetn), 
        .signal_in(saveFlag), .signal_out(clearFlag));
endmodule

`define TEST_TIME 100_00 
`define TEST_PERIOD 200_00 
module TdcCtrl(input clk, input resetn, input tstartTri,
    output stopDis1, output stopDis2, output stopDis3, output stopDis4,
    output masterRst, output dataCanBeSave);

    wire [31:0] timeCount;

    TimeCounter timeCounter(.clk(clk), .resetn(resetn), 
        .triSignal(tstartTri), .out_reg(timeCount));

    assign stopDis1 = ((timeCount > `TEST_TIME) && (timeCount <= `TEST_PERIOD))? 1'b1: 1'b0;
    assign stopDis2 = ((timeCount > `TEST_TIME) && (timeCount <= `TEST_PERIOD))? 1'b1: 1'b0;
    assign stopDis3 = ((timeCount > `TEST_TIME) && (timeCount <= `TEST_PERIOD))? 1'b1: 1'b0;
    assign stopDis4 = ((timeCount > `TEST_TIME) && (timeCount <= `TEST_PERIOD))? 1'b1: 1'b0;
    assign dataCanBeSave = (timeCount == `TEST_TIME + 1_00)? 1'b1: 1'b0;
    assign masterRst = ((timeCount >= 150_00) && (timeCount < 150_30))? 1'b1: 1'b0;
    
endmodule


`define FIFO_SIZE 8192
module TstartCounter(input clk, input resetn, 
    input plusSignal, 
    output reg [31:0] out_reg);
  
    wire overSignal;

    always@(posedge clk) begin
        casex({!resetn, plusSignal, overSignal}) 
            3'b1xx: out_reg <= 31'b0;
            3'b011: out_reg <= 31'b0;
            3'b010: out_reg <= out_reg + 1'b1;
            3'b00x: out_reg <= out_reg;
        endcase
    end
    assign overSignal = (out_reg ==  `FIFO_SIZE - 1)? 1'b1: 1'b0;
endmodule

//tested.
module TimeCounter(input clk, input resetn, 
    input triSignal, output reg [31:0] out_reg);
    always@(posedge clk) begin
        if(!resetn)
            out_reg <= 0;
        else begin
            if(triSignal)
                out_reg <= 1;
            else if(out_reg == `TEST_PERIOD)
                out_reg <= 0;
            else if(out_reg == 0)
                out_reg <= out_reg;
            else 
                out_reg <= out_reg + 1;
        end
    end
endmodule

/********************************************************************************
* call type:
NegEdgeGet_Sync negGet(.clk(), .resetn(), .signal_in(), .signal_out());
*********************************************************************************/
module NegEdgeGet_Sync(input clk, input resetn, input signal_in, output signal_out);
    reg signal_tem1;

    always@(posedge clk) begin
        if(!resetn)
            signal_tem1 <= 1'b0;
        else
            signal_tem1 <= signal_in;
    end
    assign signal_out = (~signal_in)&signal_tem1;
endmodule
