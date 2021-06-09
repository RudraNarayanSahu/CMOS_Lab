Inverter Static characterstics

* Include the Model file
.LIB "/project2020/eda/ngspice-32/models/scn4m_subm/scmos_bsim4.lib" nom
.TEMP 27

.PARAM wn=1u
.PARAM wp=3*wn
.PARAM lc=1u

* Define Supply Voltage
Vsupply		Vd	 0	 DC	 2.5
Vin		in	 0	 DC	 2.5

* Define MOSFET
Mp1	out	in	Vd	Vd	scmosp	w=wp   l=lc	m=1
Mn1	out	in	0	0	scmosn	w=wn   l=lc	m=1

* Sweep Input voltage
.DC	Vin	0	2.5	0.001

* Control Statements
.CONTROL
RUN
PLOT v(out) vs v(in)
.ENDC

.END 
