***Interconnection parasitic capacitance***



* Pulse input
Vin	in	0	pulse	0	2.5	2ns	1ps	1ps	5ns	30ns

* Lumped model defination
Rl in outl 15k
Cl outl 0 192f

* T model defination
Rt1	in	n1	7.5k
Rt2	n1	outt	7.5k
Ct1	n1	0	192f

* PI model defination
Rp	in	outp	15k
Cp1	in	0	96f
cp2	outp	0	96f

* Distributive model defination 
Rd1	in	nd1	1.5k
Rd2     nd1     nd2     1.5k
Rd3     nd2     nd3     1.5k
Rd4     nd3     nd4     1.5k
Rd5     nd4     nd5     1.5k
Rd6     nd5     nd6     1.5k
Rd7     nd6     nd7     1.5k
Rd8     nd7     nd8     1.5k
Rd9     nd8     nd9     1.5k
Rd10    nd9     outd    1.5k

Cd1     nd1	0     19.2f
Cd2     nd2     0     19.2f
Cd3     nd3     0     19.2f
Cd4     nd4     0     19.2f
Cd5     nd5     0     19.2f
Cd6     nd6     0     19.2f
Cd7     nd7     0     19.2f
Cd8     nd8     0     19.2f
Cd9     nd9     0     19.2f
Cd10    outd     0     19.2f

* Transient analysis
.TRAN	5p	35n

.CONTROL
RUN
PLOT	v(in) 	v(outl)   v(outt)  v(outp)   v(outd)
.ENDC

* Measure statements
.MEASURE tran tdiff TRIG v(in) val=1.25 RISE=1 TARG v(outl) val=1.25 RISE=1
.MEASURE tran tdiff TRIG v(in) val=1.25 RISE=1 TARG v(outd) val=1.25 RISE=1

.END
