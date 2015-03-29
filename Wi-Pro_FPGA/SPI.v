`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:58:14 03/10/2015 
// Design Name: 
// Module Name:    SPI 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Spi (SCK, MOSI, CS, WR, MIC0, MIC1, MIC2, MIC3, MIC4, MIC5, MIC6, MIC7, MIC8, MIC9, MIC10,
MIC11, MIC12, MIC13, MIC14, MIC15, MIC16, MIC17, MIC18, MIC19, MIC20,
MIC21, MIC22, MIC23, MIC24, MIC25, MIC26, MIC27, MIC28, MIC29, MIC30,
MIC31, MIC32, MIC33, MIC34, MIC35, MIC36, MIC37, MIC38, MIC39, 
ZIF0, ZIF1, ZIF2, ZIF3, ZIF4, ZIF5, ZIF6, ZIF7, ZIF8, ZIF9, ZIF10,
ZIF11, ZIF12, ZIF13, ZIF14, ZIF15, ZIF16, ZIF17, ZIF18, ZIF19, ZIF20,
ZIF21, ZIF22, ZIF23, ZIF24, ZIF25, ZIF26, ZIF27, ZIF28, ZIF29, ZIF30,
ZIF31, ZIF32, ZIF33, ZIF34, ZIF35, ZIF36, ZIF37, ZIF38, ZIF39);

input SCK, MOSI, CS, WR;

inout MIC0, MIC1, MIC2, MIC3, MIC4, MIC5, MIC6, MIC7, MIC8, MIC9, MIC10,
MIC11, MIC12, MIC13, MIC14, MIC15, MIC16, MIC17, MIC18, MIC19, MIC20,
MIC21, MIC22, MIC23, MIC24, MIC25, MIC26, MIC27, MIC28, MIC29, MIC30,
MIC31, MIC32, MIC33, MIC34, MIC35, MIC36, MIC37, MIC38, MIC39;

inout ZIF0, ZIF1, ZIF2, ZIF3, ZIF4, ZIF5, ZIF6, ZIF7, ZIF8, ZIF9, ZIF10,
ZIF11, ZIF12, ZIF13, ZIF14, ZIF15, ZIF16, ZIF17, ZIF18, ZIF19, ZIF20,
ZIF21, ZIF22, ZIF23, ZIF24, ZIF25, ZIF26, ZIF27, ZIF28, ZIF29, ZIF30,
ZIF31, ZIF32, ZIF33, ZIF34, ZIF35, ZIF36, ZIF37, ZIF38, ZIF39;

reg [7:0] SPIData0;
reg [7:0] SPIData1;
reg [7:0] SPIData2;
reg [7:0] SPIData3;
reg [7:0] SPIData4;
reg [7:0] SPIData5;
reg [7:0] SPIData6;
reg [7:0] SPIData7;
reg [7:0] SPIData8;
reg [7:0] SPIData9;
reg [7:0] SPIData10;
reg [7:0] SPIData11;
reg [7:0] SPIData12;
reg [7:0] SPIData13;
reg [7:0] SPIData14;
reg [7:0] SPIData15;
reg [7:0] SPIData16;
reg [7:0] SPIData17;
reg [7:0] SPIData18;
reg [7:0] SPIData19;
reg [7:0] SPIData20;
reg [7:0] SPIData21;
reg [7:0] SPIData22;
reg [7:0] SPIData23;
reg [7:0] SPIData24;
reg [7:0] SPIData25;
reg [7:0] SPIData26;
reg [7:0] SPIData27;
reg [7:0] SPIData28;
reg [7:0] SPIData29;
reg [7:0] SPIData30;
reg [7:0] SPIData31;
reg [7:0] SPIData32;
reg [7:0] SPIData33;
reg [7:0] SPIData34;
reg [7:0] SPIData35;
reg [7:0] SPIData36;
reg [7:0] SPIData37;
reg [7:0] SPIData38;
reg [7:0] SPIData39;


reg [6:0] i;
reg [3:0] count = 0;


reg A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10,
A11, A12, A13, A14, A15, A16, A17, A18, A19, A20,
A21, A22, A23, A24, A25, A26, A27, A28, A29, A30,
A31, A32, A33, A34, A35, A36, A37, A38, A39;

reg B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10,
B11, B12, B13, B14, B15, B16, B17, B18, B19, B20,
B21, B22, B23, B24, B25, B26, B27, B28, B29, B30,
B31, B32, B33, B34, B35, B36, B37, B38, B39;


assign MIC0 = ( (WR && (SPIData0[7:6] == 2)) || (SPIData0[7:6] == 0) ) ? B0 : 'bz;
assign MIC1 = ( (WR && (SPIData1[7:6] == 2)) || (SPIData1[7:6] == 0) ) ? B1 : 'bz;
assign MIC2 = ( (WR && (SPIData2[7:6] == 2)) || (SPIData2[7:6] == 0) ) ? B2 : 'bz;
assign MIC3 = ( (WR && (SPIData3[7:6] == 2)) || (SPIData3[7:6] == 0) ) ? B3 : 'bz;
assign MIC4 = ( (WR && (SPIData4[7:6] == 2)) || (SPIData4[7:6] == 0) ) ? B4 : 'bz;
assign MIC5 = ( (WR && (SPIData5[7:6] == 2)) || (SPIData5[7:6] == 0) ) ? B5 : 'bz;
assign MIC6 = ( (WR && (SPIData6[7:6] == 2)) || (SPIData6[7:6] == 0) ) ? B6 : 'bz;
assign MIC7 = ( (WR && (SPIData7[7:6] == 2)) || (SPIData7[7:6] == 0) ) ? B7 : 'bz;
assign MIC8 = ( (WR && (SPIData8[7:6] == 2)) || (SPIData8[7:6] == 0) ) ? B8 : 'bz;
assign MIC9 = ( (WR && (SPIData9[7:6] == 2)) || (SPIData9[7:6] == 0) ) ? B9 : 'bz;
assign MIC10 = ( (WR && (SPIData10[7:6] == 2)) || (SPIData10[7:6] == 0) ) ? B10 : 'bz;
assign MIC11 = ( (WR && (SPIData11[7:6] == 2)) || (SPIData11[7:6] == 0) ) ? B11 : 'bz;
assign MIC12 = ( (WR && (SPIData12[7:6] == 2)) || (SPIData12[7:6] == 0) ) ? B12 : 'bz;
assign MIC13 = ( (WR && (SPIData13[7:6] == 2)) || (SPIData13[7:6] == 0) ) ? B13 : 'bz;
assign MIC14 = ( (WR && (SPIData14[7:6] == 2)) || (SPIData14[7:6] == 0) ) ? B14 : 'bz;
assign MIC15 = ( (WR && (SPIData15[7:6] == 2)) || (SPIData15[7:6] == 0) ) ? B15 : 'bz;
assign MIC16 = ( (WR && (SPIData16[7:6] == 2)) || (SPIData16[7:6] == 0) ) ? B16 : 'bz;
assign MIC17 = ( (WR && (SPIData17[7:6] == 2)) || (SPIData17[7:6] == 0) ) ? B17 : 'bz;
assign MIC18 = ( (WR && (SPIData18[7:6] == 2)) || (SPIData18[7:6] == 0) ) ? B18 : 'bz;
assign MIC19 = ( (WR && (SPIData19[7:6] == 2)) || (SPIData19[7:6] == 0) ) ? B19 : 'bz;
assign MIC20 = ( (WR && (SPIData20[7:6] == 2)) || (SPIData20[7:6] == 0) ) ? B20 : 'bz;
assign MIC21 = ( (WR && (SPIData21[7:6] == 2)) || (SPIData21[7:6] == 0) ) ? B21 : 'bz;
assign MIC22 = ( (WR && (SPIData22[7:6] == 2)) || (SPIData22[7:6] == 0) ) ? B22 : 'bz;
assign MIC23 = ( (WR && (SPIData23[7:6] == 2)) || (SPIData23[7:6] == 0) ) ? B23 : 'bz;
assign MIC24 = ( (WR && (SPIData24[7:6] == 2)) || (SPIData24[7:6] == 0) ) ? B24 : 'bz;
assign MIC25 = ( (WR && (SPIData25[7:6] == 2)) || (SPIData25[7:6] == 0) ) ? B25 : 'bz;
assign MIC26 = ( (WR && (SPIData26[7:6] == 2)) || (SPIData26[7:6] == 0) ) ? B26 : 'bz;
assign MIC27 = ( (WR && (SPIData27[7:6] == 2)) || (SPIData27[7:6] == 0) ) ? B27 : 'bz;
assign MIC28 = ( (WR && (SPIData28[7:6] == 2)) || (SPIData28[7:6] == 0) ) ? B28 : 'bz;
assign MIC29 = ( (WR && (SPIData29[7:6] == 2)) || (SPIData29[7:6] == 0) ) ? B29 : 'bz;
assign MIC30 = ( (WR && (SPIData30[7:6] == 2)) || (SPIData30[7:6] == 0) ) ? B30 : 'bz;
assign MIC31 = ( (WR && (SPIData31[7:6] == 2)) || (SPIData31[7:6] == 0) ) ? B31 : 'bz;
assign MIC32 = ( (WR && (SPIData32[7:6] == 2)) || (SPIData32[7:6] == 0) ) ? B32 : 'bz;
assign MIC33 = ( (WR && (SPIData33[7:6] == 2)) || (SPIData33[7:6] == 0) ) ? B33 : 'bz;
assign MIC34 = ( (WR && (SPIData34[7:6] == 2)) || (SPIData34[7:6] == 0) ) ? B34 : 'bz;
assign MIC35 = ( (WR && (SPIData35[7:6] == 2)) || (SPIData35[7:6] == 0) ) ? B35 : 'bz;
assign MIC36 = ( (WR && (SPIData36[7:6] == 2)) || (SPIData36[7:6] == 0) ) ? B36 : 'bz;
assign MIC37 = ( (WR && (SPIData37[7:6] == 2)) || (SPIData37[7:6] == 0) ) ? B37 : 'bz;
assign MIC38 = ( (WR && (SPIData38[7:6] == 2)) || (SPIData38[7:6] == 0) ) ? B38 : 'bz;
assign MIC39 = ( (WR && (SPIData39[7:6] == 2)) || (SPIData39[7:6] == 0) ) ? B39 : 'bz;


assign ZIF0 = ( (!WR && (SPIData0[1:0] == 2)) || (SPIData0[1:0] == 1) ) ? A0 : 'bz;
assign ZIF1 = ( (!WR && (SPIData1[1:0] == 2)) || (SPIData1[1:0] == 1) ) ? A1 : 'bz;
assign ZIF2 = ( (!WR && (SPIData2[1:0] == 2)) || (SPIData2[1:0] == 1) ) ? A2 : 'bz;
assign ZIF3 = ( (!WR && (SPIData3[1:0] == 2)) || (SPIData3[1:0] == 1) ) ? A3 : 'bz;
assign ZIF4 = ( (!WR && (SPIData4[1:0] == 2)) || (SPIData4[1:0] == 1) ) ? A4 : 'bz;
assign ZIF5 = ( (!WR && (SPIData5[1:0] == 2)) || (SPIData5[1:0] == 1) ) ? A5 : 'bz;
assign ZIF6 = ( (!WR && (SPIData6[1:0] == 2)) || (SPIData6[1:0] == 1) ) ? A6 : 'bz;
assign ZIF7 = ( (!WR && (SPIData7[1:0] == 2)) || (SPIData7[1:0] == 1) ) ? A7 : 'bz;
assign ZIF8 = ( (!WR && (SPIData8[1:0] == 2)) || (SPIData8[1:0] == 1) ) ? A8 : 'bz;
assign ZIF9 = ( (!WR && (SPIData9[1:0] == 2)) || (SPIData9[1:0] == 1) ) ? A9 : 'bz;
assign ZIF10 = ( (!WR && (SPIData10[1:0] == 2)) || (SPIData10[1:0] == 1) ) ? A10 : 'bz;
assign ZIF11 = ( (!WR && (SPIData11[1:0] == 2)) || (SPIData11[1:0] == 1) ) ? A11 : 'bz;
assign ZIF12 = ( (!WR && (SPIData12[1:0] == 2)) || (SPIData12[1:0] == 1) ) ? A12 : 'bz;
assign ZIF13 = ( (!WR && (SPIData13[1:0] == 2)) || (SPIData13[1:0] == 1) ) ? A13 : 'bz;
assign ZIF14 = ( (!WR && (SPIData14[1:0] == 2)) || (SPIData14[1:0] == 1) ) ? A14 : 'bz;
assign ZIF15 = ( (!WR && (SPIData15[1:0] == 2)) || (SPIData15[1:0] == 1) ) ? A15 : 'bz;
assign ZIF16 = ( (!WR && (SPIData16[1:0] == 2)) || (SPIData16[1:0] == 1) ) ? A16 : 'bz;
assign ZIF17 = ( (!WR && (SPIData17[1:0] == 2)) || (SPIData17[1:0] == 1) ) ? A17 : 'bz;
assign ZIF18 = ( (!WR && (SPIData18[1:0] == 2)) || (SPIData18[1:0] == 1) ) ? A18 : 'bz;
assign ZIF19 = ( (!WR && (SPIData19[1:0] == 2)) || (SPIData19[1:0] == 1) ) ? A19 : 'bz;
assign ZIF20 = ( (!WR && (SPIData20[1:0] == 2)) || (SPIData20[1:0] == 1) ) ? A20 : 'bz;
assign ZIF21 = ( (!WR && (SPIData21[1:0] == 2)) || (SPIData21[1:0] == 1) ) ? A21 : 'bz;
assign ZIF22 = ( (!WR && (SPIData22[1:0] == 2)) || (SPIData22[1:0] == 1) ) ? A22 : 'bz;
assign ZIF23 = ( (!WR && (SPIData23[1:0] == 2)) || (SPIData23[1:0] == 1) ) ? A23 : 'bz;
assign ZIF24 = ( (!WR && (SPIData24[1:0] == 2)) || (SPIData24[1:0] == 1) ) ? A24 : 'bz;
assign ZIF25 = ( (!WR && (SPIData25[1:0] == 2)) || (SPIData25[1:0] == 1) ) ? A25 : 'bz;
assign ZIF26 = ( (!WR && (SPIData26[1:0] == 2)) || (SPIData26[1:0] == 1) ) ? A26 : 'bz;
assign ZIF27 = ( (!WR && (SPIData27[1:0] == 2)) || (SPIData27[1:0] == 1) ) ? A27 : 'bz;
assign ZIF28 = ( (!WR && (SPIData28[1:0] == 2)) || (SPIData28[1:0] == 1) ) ? A28 : 'bz;
assign ZIF29 = ( (!WR && (SPIData29[1:0] == 2)) || (SPIData29[1:0] == 1) ) ? A29 : 'bz;
assign ZIF30 = ( (!WR && (SPIData30[1:0] == 2)) || (SPIData30[1:0] == 1) ) ? A30 : 'bz;
assign ZIF31 = ( (!WR && (SPIData31[1:0] == 2)) || (SPIData31[1:0] == 1) ) ? A31 : 'bz;
assign ZIF32 = ( (!WR && (SPIData32[1:0] == 2)) || (SPIData32[1:0] == 1) ) ? A32 : 'bz;
assign ZIF33 = ( (!WR && (SPIData33[1:0] == 2)) || (SPIData33[1:0] == 1) ) ? A33 : 'bz;
assign ZIF34 = ( (!WR && (SPIData34[1:0] == 2)) || (SPIData34[1:0] == 1) ) ? A34 : 'bz;
assign ZIF35 = ( (!WR && (SPIData35[1:0] == 2)) || (SPIData35[1:0] == 1) ) ? A35 : 'bz;
assign ZIF36 = ( (!WR && (SPIData36[1:0] == 2)) || (SPIData36[1:0] == 1) ) ? A36 : 'bz;
assign ZIF37 = ( (!WR && (SPIData37[1:0] == 2)) || (SPIData37[1:0] == 1) ) ? A37 : 'bz;
assign ZIF38 = ( (!WR && (SPIData38[1:0] == 2)) || (SPIData38[1:0] == 1) ) ? A38 : 'bz;
assign ZIF39 = ( (!WR && (SPIData39[1:0] == 2)) || (SPIData39[1:0] == 1) ) ? A39 : 'bz;

always@(posedge SCK)
	begin
		if(CS == 0)
			begin
				if (MOSI == 1)
					begin
						case(i)								
							0 : 
								begin
									SPIData0 = ((SPIData0 >> 1) | 128) ;
								end
							1 : 
								begin
									SPIData1 = ((SPIData1 >> 1) | 128) ;
								end
							2 : 
								begin
									SPIData2 = ((SPIData2 >> 1) | 128) ;
								end
							3 : 
								begin
									SPIData3 = ((SPIData3 >> 1) | 128) ;
								end
							4 : 
								begin
									SPIData4 = ((SPIData4 >> 1) | 128) ;
								end
							5 : 
								begin
									SPIData5 = ((SPIData5 >> 1) | 128) ;
								end
							6 : 
								begin
									SPIData6 = ((SPIData6 >> 1) | 128) ;
								end
							7 : 
								begin
									SPIData7 = ((SPIData7 >> 1) | 128) ;
								end
							8 : 
								begin
									SPIData8 = ((SPIData8 >> 1) | 128) ;
								end
							9 : 
								begin
									SPIData9 = ((SPIData9 >> 1) | 128) ;
								end
							10 : 
								begin
									SPIData10 = ((SPIData10 >> 1) | 128) ;
								end
							11 : 
								begin
									SPIData11 = ((SPIData11 >> 1) | 128) ;
								end
							12 : 
								begin
									SPIData12 = ((SPIData12 >> 1) | 128) ;
								end
							13 : 
								begin
									SPIData13 = ((SPIData13 >> 1) | 128) ;
								end
							14 : 
								begin
									SPIData14 = ((SPIData14 >> 1) | 128) ;
								end
							15 : 
								begin
									SPIData15 = ((SPIData15 >> 1) | 128) ;
								end
							16 : 
								begin
									SPIData16 = ((SPIData16 >> 1) | 128) ;
								end
							17 : 
								begin
									SPIData17 = ((SPIData17 >> 1) | 128) ;
								end
							18 : 
								begin
									SPIData18 = ((SPIData18 >> 1) | 128) ;
								end
							19 : 
								begin
									SPIData19 = ((SPIData19 >> 1) | 128) ;
								end
							20 : 
								begin
									SPIData20 = ((SPIData20 >> 1) | 128) ;
								end
							21 : 
								begin
									SPIData21 = ((SPIData21 >> 1) | 128) ;
								end
							22 : 
								begin
									SPIData22 = ((SPIData22 >> 1) | 128) ;
								end
							23 : 
								begin
									SPIData23 = ((SPIData23 >> 1) | 128) ;
								end
							24 : 
								begin
									SPIData24 = ((SPIData24 >> 1) | 128) ;
								end
							25 : 
								begin
									SPIData25 = ((SPIData25 >> 1) | 128) ;
								end
							26 : 
								begin
									SPIData26 = ((SPIData26 >> 1) | 128) ;
								end
							27 : 
								begin
									SPIData27 = ((SPIData27 >> 1) | 128) ;
								end
							28 : 
								begin
									SPIData28 = ((SPIData28 >> 1) | 128) ;
								end
							29 : 
								begin
									SPIData29 = ((SPIData29 >> 1) | 128) ;
								end
							30 : 
								begin
									SPIData30 = ((SPIData30 >> 1) | 128) ;
								end
							31 : 
								begin
									SPIData31 = ((SPIData31 >> 1) | 128) ;
								end
							32 : 
								begin
									SPIData32 = ((SPIData32 >> 1) | 128) ;
								end
							33 : 
								begin
									SPIData33 = ((SPIData33 >> 1) | 128) ;
								end
							34 : 
								begin
									SPIData34 = ((SPIData34 >> 1) | 128) ;
								end
							35 : 
								begin
									SPIData35 = ((SPIData35 >> 1) | 128) ;
								end
							36 : 
								begin
									SPIData36 = ((SPIData36 >> 1) | 128) ;
								end
							37 : 
								begin
									SPIData37 = ((SPIData37 >> 1) | 128) ;
								end
							38 : 
								begin
									SPIData38 = ((SPIData38 >> 1) | 128) ;
								end
							39 : 
								begin
									SPIData39 = ((SPIData39 >> 1) | 128) ;
								end
						endcase
					end
				else if (MOSI == 0)
					begin
						case(i)								
							0 : 
								begin
									SPIData0 = ((SPIData0 >> 1)) ;
								end
							1 : 
								begin
									SPIData1 = ((SPIData1 >> 1)) ;
								end
							2 : 
								begin
									SPIData2 = ((SPIData2 >> 1)) ;
								end
							3 : 
								begin
									SPIData3 = ((SPIData3 >> 1)) ;
								end
							4 : 
								begin
									SPIData4 = ((SPIData4 >> 1)) ;
								end
							5 : 
								begin
									SPIData5 = ((SPIData5 >> 1)) ;
								end
							6 : 
								begin
									SPIData6 = ((SPIData6 >> 1)) ;
								end
							7 : 
								begin
									SPIData7 = ((SPIData7 >> 1)) ;
								end
							8 : 
								begin
									SPIData8 = ((SPIData8 >> 1)) ;
								end
							9 : 
								begin
									SPIData9 = ((SPIData9 >> 1)) ;
								end
							10 : 
								begin
									SPIData10 = ((SPIData10 >> 1)) ;
								end
							11 : 
								begin
									SPIData11 = ((SPIData11 >> 1)) ;
								end
							12 : 
								begin
									SPIData12 = ((SPIData12 >> 1)) ;
								end
							13 : 
								begin
									SPIData13 = ((SPIData13 >> 1)) ;
								end
							14 : 
								begin
									SPIData14 = ((SPIData14 >> 1)) ;
								end
							15 : 
								begin
									SPIData15 = ((SPIData15 >> 1)) ;
								end
							16 : 
								begin
									SPIData16 = ((SPIData16 >> 1)) ;
								end
							17 : 
								begin
									SPIData17 = ((SPIData17 >> 1)) ;
								end
							18 : 
								begin
									SPIData18 = ((SPIData18 >> 1)) ;
								end
							19 : 
								begin
									SPIData19 = ((SPIData19 >> 1)) ;
								end
							20 : 
								begin
									SPIData20 = ((SPIData20 >> 1)) ;
								end
							21 : 
								begin
									SPIData21 = ((SPIData21 >> 1)) ;
								end
							22 : 
								begin
									SPIData22 = ((SPIData22 >> 1)) ;
								end
							23 : 
								begin
									SPIData23 = ((SPIData23 >> 1)) ;
								end
							24 : 
								begin
									SPIData24 = ((SPIData24 >> 1)) ;
								end
							25 : 
								begin
									SPIData25 = ((SPIData25 >> 1)) ;
								end
							26 : 
								begin
									SPIData26 = ((SPIData26 >> 1)) ;
								end
							27 : 
								begin
									SPIData27 = ((SPIData27 >> 1)) ;
								end
							28 : 
								begin
									SPIData28 = ((SPIData28 >> 1)) ;
								end
							29 : 
								begin
									SPIData29 = ((SPIData29 >> 1)) ;
								end
							30 : 
								begin
									SPIData30 = ((SPIData30 >> 1)) ;
								end
							31 : 
								begin
									SPIData31 = ((SPIData31 >> 1)) ;
								end
							32 : 
								begin
									SPIData32 = ((SPIData32 >> 1)) ;
								end
							33 : 
								begin
									SPIData33 = ((SPIData33 >> 1)) ;
								end
							34 : 
								begin
									SPIData34 = ((SPIData34 >> 1)) ;
								end
							35 : 
								begin
									SPIData35 = ((SPIData35 >> 1)) ;
								end
							36 : 
								begin
									SPIData36 = ((SPIData36 >> 1)) ;
								end
							37 : 
								begin
									SPIData37 = ((SPIData37 >> 1)) ;
								end
							38 : 
								begin
									SPIData38 = ((SPIData38 >> 1)) ;
								end
							39 : 
								begin
									SPIData39 = ((SPIData39 >> 1)) ;
								end
						endcase
					end	
					
					if(count == 7)
						begin
							i = i + 1;
						end
						
					if(i == 40)
						begin
							i = 0;
						end
						
					count = count + 1;
			end
	end
	
	
	
	
	
always@(posedge CS)
	begin
		case(SPIData0[6:0])								
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData1[6:0])									
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData2[6:0])										
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData3[6:0])									
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData4[6:0])										
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData5[6:0])										
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData6[6:0])									
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData7[6:0])										
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData8[6:0])									
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData9[6:0])										
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData10[6:0])										
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		

	
	case(SPIData11[6:0])									
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData12[6:0])										
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData13[6:0])									
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData14[6:0])										
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData15[6:0])										
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData16[6:0])									
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData17[6:0])										
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData18[6:0])									
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData19[6:0])										
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData20[6:0])										
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData21[6:0])									
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData22[6:0])										
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData23[6:0])									
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData24[6:0])										
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData25[6:0])										
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData26[6:0])									
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData27[6:0])										
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData28[6:0])									
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData29[6:0])										
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData30[6:0])										
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
	
	
	case(SPIData31[6:0])									
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData32[6:0])										
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData33[6:0])									
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData34[6:0])										
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData35[6:0])										
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData36[6:0])									
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData37[6:0])										
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData38[6:0])									
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
		case(SPIData39[6:0])										
			0 : 
				begin
					A0 = MIC0;
					B0 = ZIF0;
				end
			1 : 
				begin
					A1 = MIC0;
					B0 = ZIF1;
				end
			2 : 
				begin
					A2 = MIC0;
					B0 = ZIF2;
				end
			3 : 
				begin
					A3 = MIC0;
					B0 = ZIF3;
				end
			4 : 
				begin
					A4 = MIC0;
					B0 = ZIF4;
				end
			5 : 
				begin
					A5 = MIC0;
					B0 = ZIF5;
				end
			6 : 
				begin
					A6 = MIC0;
					B0 = ZIF6;
				end
			7 : 
				begin
					A7 = MIC0;
					B0 = ZIF7;
				end
			8 : 
				begin
					A8 = MIC0;
					B0 = ZIF8;
				end
			9 : 
				begin
					A9 = MIC0;
					B0 = ZIF9;
				end
			10 : 
				begin
					A10 = MIC0;
					B0 = ZIF10;
				end
			11 : 
				begin
					A11 = MIC0;
					B0 = ZIF11;
				end
			12 : 
				begin
					A12 = MIC0;
					B0 = ZIF12;
				end
			13 : 
				begin
					A13 = MIC0;
					B0 = ZIF13;
				end
			14 : 
				begin
					A14 = MIC0;
					B0 = ZIF14;
				end
			15 : 
				begin
					A15 = MIC0;
					B0 = ZIF15;
				end
			16 : 
				begin
					A16 = MIC0;
					B0 = ZIF16;
				end
			17 : 
				begin
					A17 = MIC0;
					B0 = ZIF17;
				end
			18 : 
				begin
					A18 = MIC0;
					B0 = ZIF18;
				end
			19 : 
				begin
					A19 = MIC0;
					B0 = ZIF19;
				end
			20 : 
				begin
					A20 = MIC0;
					B0 = ZIF20;
				end
			21 : 
				begin
					A21 = MIC0;
					B0 = ZIF21;
				end
			22 : 
				begin
					A22 = MIC0;
					B0 = ZIF22;
				end
			23 : 
				begin
					A23 = MIC0;
					B0 = ZIF23;
				end
			24 : 
				begin
					A24 = MIC0;
					B0 = ZIF24;
				end
			25 : 
				begin
					A25 = MIC0;
					B0 = ZIF25;
				end
			26 : 
				begin
					A26 = MIC0;
					B0 = ZIF26;
				end
			27 : 
				begin
					A27 = MIC0;
					B0 = ZIF27;
				end
			28 : 
				begin
					A28 = MIC0;
					B0 = ZIF28;
				end
			29 : 
				begin
					A29 = MIC0;
					B0 = ZIF29;
				end
			30 : 
				begin
					A30 = MIC0;
					B0 = ZIF30;
				end
			31 : 
				begin
					A31 = MIC0;
					B0 = ZIF31;
				end
			32 : 
				begin
					A32 = MIC0;
					B0 = ZIF32;
				end
			33 : 
				begin
					A33 = MIC0;
					B0 = ZIF33;
				end
			34 : 
				begin
					A34 = MIC0;
					B0 = ZIF34;
				end
			35 : 
				begin
					A35 = MIC0;
					B0 = ZIF35;
				end
			36 : 
				begin
					A36 = MIC0;
					B0 = ZIF36;
				end
			37 : 
				begin
					A37 = MIC0;
					B0 = ZIF37;
				end
			38 : 
				begin
					A38 = MIC0;
					B0 = ZIF38;
				end
			39 : 
				begin
					A39 = MIC0;
					B0 = ZIF39;
				end
		endcase
		
	end
	
endmodule

/*
for (i = 0; i < 16; i = i +1) begin
  	  	
end

module Spi (SCK, MIC, ZIF, WR, CN);

input SCK;
input MOSI, CS;
output dataout;
reg dataout;
reg [7:0] regs;
input [1:0] CN;
input WR;
inout MIC;
inout ZIF;
reg A;
reg B;

assign MIC = ( (WR && (CN[1:0] == 2)) || (CN[1:0] == 0) ) ? B : 'bz;

assign ZIF = ( (!WR && (CN[1:0] == 2)) || (CN[1:0] == 1) ) ? A : 'bz;


always @ (SCK)
	begin
			A = MIC;
			B = ZIF;
	end

initial 
	begin
		regs = 0;
		dataout = 0;
	end
	
assign inout_bus_a = (en_a) ? 'bz : inout_bus_a_reg;
	
if (CS == 0)
	begin
		assign Test1 = Test2;
	end
else
	begin
		assign Test2 = Test1;
	end

always@(posedge SCK)
	begin

		Test1 = Test2;
	
		if (CS == 0)
			begin
				if ((regs & 1) == 1)
					begin
						dataout = 1;
					end
				else
					begin
						dataout = 0;
					end
			end
		else 
			begin
				dataout = 0;
			end
		if (CS == 0 && MOSI == 1)
			begin
				regs = ((regs >> 1) | 128) ;
			end
		else if (CS == 0 && MOSI == 0)
			begin
				regs = (regs >> 1) ;
			end	
	end
endmodule
*/