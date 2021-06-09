Testbench for inverter sub-circuit

.GLOBAL vdd gnd
.PARAM vsupply=5.0
* Library model file
.LIB "/project2020/eda/ngspice-32/models/scn4m_subm/scmos_bsim4.lib" nom

* Include the inverter netlist
.INCLUDE Lab9_inv.sp

* Instatiate inverter
Xinv1	in	out	Lab9_inv

* Sources
Vsup  vdd  0  DC  vsupply  
Vin	 in   0  PULSE 0 vsupply 5n 10p 10p 10n 20
Vload 	 out  0  50f

* Analysis
.TRAN 10p 20n

.CONTROL
RUN
PLOT v(out)
.ENDC

.MEASURE TRAN TPLH TRIG v(in) val='0.5*vsupply' FALL=1 TARG v(out) val='0.5*vsupply' RISE=1


.END
 
	
