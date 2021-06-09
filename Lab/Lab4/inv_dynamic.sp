Dynamic Characterstics of CMOS inverter

* Include the Library
.LIB "/project2020/eda/ngspice-32/models/scn4m_subm/scmos_bsim4.lib" nom
.TEMP 27

.GLOBAL Vdd gnd
.PARAM wn=0.6u
.PARAM wp=1.71*wn
* Define Supply
Vsupply		Vdd	gnd	DC	2.5
Vin		in	gnd	pulse	0	2.5	10ns	10ps	10ps	5ns	10ns	

* Define MOSFET
Mp1	out	in	Vdd	Vdd	scmosp	w=wp	l=0.4u	m=1
Mn1	out	in	gnd	gnd	scmosn	w=wn	l=0.4u	m=1

* Define Fanout 
Mp2	out1	out	Vdd	Vdd	scmosp	w=2.4u	l=0.4u	m=1
Mn2	out1	out	gnd	gnd	scmosn	w=2.4u	l=0.4u	m=1

* Transient Analysis
.TRAN	5ps	50ns	

.CONTROl	
RUN
PLOT	v(in)+3	v(out)
.ENDC

* Measure Statements
.MEASURE	tran	tdiff	TRIG	v(in)	val=1.25	FALL=1	TARG	v(out)	val=1.25	RISE=1 //Tplh
.MEASURE        tran    tdiff   TRIG    v(in)   val=1.25      RISE=1  TARG    v(out)  val=1.25      FALL=1 //Tphl
.MEASURE        tran    tdiff   TRIG    v(out)   val=0.25     RISE=2  TARG    v(out)  val=2.25      RISE=2 //Trise
.MEASURE        tran    tdiff   TRIG    v(out)   val=2.25     FALL=2  TARG    v(out)  val=0.25     FALL=2  //Tfall

.END
