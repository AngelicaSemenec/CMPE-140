
i
Command: %s
53*	vivadotcl28
$write_bitstream -force mips_fpga.bit2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-349h px� 
x
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px� 
>
IP Catalog is up to date.1232*coregenZ19-1839h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
�
�Missing CFGBVS and CONFIG_VOLTAGE Design Properties: Neither the CFGBVS nor CONFIG_VOLTAGE voltage property is set in the current_design.  Configuration bank voltage select (CFGBVS) must be set to VCCO or GND, and CONFIG_VOLTAGE must be set to the correct configuration voltage, in order to determine the I/O voltage support for the pins in bank 0.  It is suggested to specify these either using the 'Edit Device Properties' function in the GUI or directly in the XDC file using the following syntax:

 set_property CFGBVS value1 [current_design]
 #where value1 is either VCCO or GND

 set_property CONFIG_VOLTAGE value2 [current_design]
 #where value2 is the voltage provided to configuration bank 0

Refer to the device configuration user guide for more information.%s*DRC2(
 DRC|Pin Planning2default:default8ZCFGBVS-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2b
 "L
mips_top/mips/dp/alu/HILO0	mips_top/mips/dp/alu/HILO02default:default2default:default2l
 "V
"mips_top/mips/dp/alu/HILO0/A[29:0]mips_top/mips/dp/alu/HILO0/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2b
 "L
mips_top/mips/dp/alu/HILO0	mips_top/mips/dp/alu/HILO02default:default2default:default2l
 "V
"mips_top/mips/dp/alu/HILO0/B[17:0]mips_top/mips/dp/alu/HILO0/B2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2h
 "R
mips_top/mips/dp/alu/HILO0__0	mips_top/mips/dp/alu/HILO0__02default:default2default:default2r
 "\
%mips_top/mips/dp/alu/HILO0__0/A[29:0]mips_top/mips/dp/alu/HILO0__0/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2h
 "R
mips_top/mips/dp/alu/HILO0__0	mips_top/mips/dp/alu/HILO0__02default:default2default:default2r
 "\
%mips_top/mips/dp/alu/HILO0__0/B[17:0]mips_top/mips/dp/alu/HILO0__0/B2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2h
 "R
mips_top/mips/dp/alu/HILO_reg	mips_top/mips/dp/alu/HILO_reg2default:default2default:default2r
 "\
%mips_top/mips/dp/alu/HILO_reg/A[29:0]mips_top/mips/dp/alu/HILO_reg/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2h
 "R
mips_top/mips/dp/alu/HILO_reg	mips_top/mips/dp/alu/HILO_reg2default:default2default:default2r
 "\
%mips_top/mips/dp/alu/HILO_reg/B[17:0]mips_top/mips/dp/alu/HILO_reg/B2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2n
 "X
 mips_top/mips/dp/alu/HILO_reg__0	 mips_top/mips/dp/alu/HILO_reg__02default:default2default:default2x
 "b
(mips_top/mips/dp/alu/HILO_reg__0/A[29:0]"mips_top/mips/dp/alu/HILO_reg__0/A2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2n
 "X
 mips_top/mips/dp/alu/HILO_reg__0	 mips_top/mips/dp/alu/HILO_reg__02default:default2default:default2x
 "b
(mips_top/mips/dp/alu/HILO_reg__0/B[17:0]"mips_top/mips/dp/alu/HILO_reg__0/B2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPIP-1h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2�
 "|
2mips_top/fact_top/factorial/datapath/multiplier/Z0	2mips_top/fact_top/factorial/datapath/multiplier/Z02default:default2default:default2�
 "�
:mips_top/fact_top/factorial/datapath/multiplier/Z0/P[47:0]4mips_top/fact_top/factorial/datapath/multiplier/Z0/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-1h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2�
 "�
5mips_top/fact_top/factorial/datapath/multiplier/Z0__0	5mips_top/fact_top/factorial/datapath/multiplier/Z0__02default:default2default:default2�
 "�
=mips_top/fact_top/factorial/datapath/multiplier/Z0__0/P[47:0]7mips_top/fact_top/factorial/datapath/multiplier/Z0__0/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-1h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2�
 "�
5mips_top/fact_top/factorial/datapath/multiplier/Z0__1	5mips_top/fact_top/factorial/datapath/multiplier/Z0__12default:default2default:default2�
 "�
=mips_top/fact_top/factorial/datapath/multiplier/Z0__1/P[47:0]7mips_top/fact_top/factorial/datapath/multiplier/Z0__1/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-1h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2b
 "L
mips_top/mips/dp/alu/HILO0	mips_top/mips/dp/alu/HILO02default:default2default:default2l
 "V
"mips_top/mips/dp/alu/HILO0/P[47:0]mips_top/mips/dp/alu/HILO0/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-1h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2h
 "R
mips_top/mips/dp/alu/HILO0__0	mips_top/mips/dp/alu/HILO0__02default:default2default:default2r
 "\
%mips_top/mips/dp/alu/HILO0__0/P[47:0]mips_top/mips/dp/alu/HILO0__0/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-1h px� 
�
�MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2�
 "|
2mips_top/fact_top/factorial/datapath/multiplier/Z0	2mips_top/fact_top/factorial/datapath/multiplier/Z02default:default2default:default2�
 "�
:mips_top/fact_top/factorial/datapath/multiplier/Z0/P[47:0]4mips_top/fact_top/factorial/datapath/multiplier/Z0/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px� 
�
�MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2�
 "�
5mips_top/fact_top/factorial/datapath/multiplier/Z0__0	5mips_top/fact_top/factorial/datapath/multiplier/Z0__02default:default2default:default2�
 "�
=mips_top/fact_top/factorial/datapath/multiplier/Z0__0/P[47:0]7mips_top/fact_top/factorial/datapath/multiplier/Z0__0/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px� 
�
�MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2�
 "�
5mips_top/fact_top/factorial/datapath/multiplier/Z0__1	5mips_top/fact_top/factorial/datapath/multiplier/Z0__12default:default2default:default2�
 "�
=mips_top/fact_top/factorial/datapath/multiplier/Z0__1/P[47:0]7mips_top/fact_top/factorial/datapath/multiplier/Z0__1/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px� 
�
�MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2b
 "L
mips_top/mips/dp/alu/HILO0	mips_top/mips/dp/alu/HILO02default:default2default:default2l
 "V
"mips_top/mips/dp/alu/HILO0/P[47:0]mips_top/mips/dp/alu/HILO0/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px� 
�
�MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2h
 "R
mips_top/mips/dp/alu/HILO0__0	mips_top/mips/dp/alu/HILO0__02default:default2default:default2r
 "\
%mips_top/mips/dp/alu/HILO0__0/P[47:0]mips_top/mips/dp/alu/HILO0__0/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px� 
�
�MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2h
 "R
mips_top/mips/dp/alu/HILO_reg	mips_top/mips/dp/alu/HILO_reg2default:default2default:default2r
 "\
%mips_top/mips/dp/alu/HILO_reg/P[47:0]mips_top/mips/dp/alu/HILO_reg/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px� 
�
�MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2n
 "X
 mips_top/mips/dp/alu/HILO_reg__0	 mips_top/mips/dp/alu/HILO_reg__02default:default2default:default2x
 "b
(mips_top/mips/dp/alu/HILO_reg__0/P[47:0]"mips_top/mips/dp/alu/HILO_reg__0/P2default:default2default:default2=
 %DRC|Netlist|Instance|Pipeline|DSP48E12default:default8ZDPOP-2h px� 
�
�Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2�
 "|
2mips_top/fact_top/fact_reg/FSM_onehot_state_reg[0]2mips_top/fact_top/fact_reg/FSM_onehot_state_reg[0]2default:default2default:default2�
 "l
*mips_top/fact_top/fact_reg/error_reg_i_2/O*mips_top/fact_top/fact_reg/error_reg_i_2/O2default:default2default:default2~
 "h
(mips_top/fact_top/fact_reg/error_reg_i_2	(mips_top/fact_top/fact_reg/error_reg_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px� 
�
�Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2�
 "�
7mips_top/fact_top/factorial/control_unit/en_reg_i_2_n_17mips_top/fact_top/factorial/control_unit/en_reg_i_2_n_12default:default2default:default2�
 "�
5mips_top/fact_top/factorial/control_unit/en_reg_i_2/O5mips_top/fact_top/factorial/control_unit/en_reg_i_2/O2default:default2default:default2�
 "~
3mips_top/fact_top/factorial/control_unit/en_reg_i_2	3mips_top/fact_top/factorial/control_unit/en_reg_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px� 
�
�Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2�
 "~
3mips_top/fact_top/factorial/control_unit/next_state3mips_top/fact_top/factorial/control_unit/next_state2default:default2default:default2�
 "�
Kmips_top/fact_top/factorial/control_unit/FSM_onehot_next_state_reg[2]_i_2/OKmips_top/fact_top/factorial/control_unit/FSM_onehot_next_state_reg[2]_i_2/O2default:default2default:default2�
 "�
Imips_top/fact_top/factorial/control_unit/FSM_onehot_next_state_reg[2]_i_2	Imips_top/fact_top/factorial/control_unit/FSM_onehot_next_state_reg[2]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px� 
�
�Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2�
 "�
9mips_top/fact_top/factorial/control_unit/sel1_reg_i_1_n_19mips_top/fact_top/factorial/control_unit/sel1_reg_i_1_n_12default:default2default:default2�
 "�
7mips_top/fact_top/factorial/control_unit/sel1_reg_i_1/O7mips_top/fact_top/factorial/control_unit/sel1_reg_i_1/O2default:default2default:default2�
 "�
5mips_top/fact_top/factorial/control_unit/sel1_reg_i_1	5mips_top/fact_top/factorial/control_unit/sel1_reg_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px� 
g
DRC finished with %s
1905*	planAhead2)
0 Errors, 25 Warnings2default:defaultZ12-3199h px� 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px� 
i
)Running write_bitstream with %s threads.
1750*designutils2
22default:defaultZ20-2272h px� 
?
Loading data files...
1271*designutilsZ12-1165h px� 
>
Loading site data...
1273*designutilsZ12-1167h px� 
?
Loading route data...
1272*designutilsZ12-1166h px� 
?
Processing options...
1362*designutilsZ12-1514h px� 
<
Creating bitmap...
1249*designutilsZ12-1141h px� 
7
Creating bitstream...
7*	bitstreamZ40-7h px� 
`
Writing bitstream %s...
11*	bitstream2#
./mips_fpga.bit2default:defaultZ40-11h px� 
F
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px� 
�
�WebTalk data collection is mandatory when using a WebPACK part without a full Vivado license. To see the specific WebTalk data collected for your design, open the usage_statistics_webtalk.html or usage_statistics_webtalk.xml file in the implementation directory.
120*projectZ1-120h px� 
�
�'%s' has been successfully sent to Xilinx on %s. For additional details about this file, please refer to the Webtalk help file at %s.
186*common2u
aC:/Users/semen/VivadoAssignments/8Pipe/Lab8Pipe/Lab8Pipe.runs/impl_1/usage_statistics_webtalk.xml2default:default2,
Mon Dec  9 13:49:40 20192default:default2I
5C:/Xilinx/Vivado/2019.1/doc/webtalk_introduction.html2default:defaultZ17-186h px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1022default:default2
252default:default2
02default:default2
02default:defaultZ4-41h px� 
a
%s completed successfully
29*	vivadotcl2#
write_bitstream2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
write_bitstream: 2default:default2
00:00:322default:default2
00:00:412default:default2
1880.0042default:default2
406.2302default:defaultZ17-268h px� 


End Record