//QAOA with 7 qubits
//beta: 0.2
//gamma: 0.35
//topology: ring
OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
creg c[7];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
cu1(-0.7) q[0],q[1];
u1(0.35) q[0];
u1(0.35) q[1];
cu1(-0.7) q[1],q[2];
u1(0.35) q[1];
u1(0.35) q[2];
cu1(-0.7) q[2],q[3];
u1(0.35) q[2];
u1(0.35) q[3];
cu1(-0.7) q[3],q[4];
u1(0.35) q[3];
u1(0.35) q[4];
cu1(-0.7) q[4],q[5];
u1(0.35) q[4];
u1(0.35) q[5];
cu1(-0.7) q[5],q[6];
u1(0.35) q[5];
u1(0.35) q[6];
cu1(-0.7) q[6],q[0];
u1(0.35) q[6];
u1(0.35) q[0];
rx(0.4) q[0];
rx(0.4) q[1];
rx(0.4) q[2];
rx(0.4) q[3];
rx(0.4) q[4];
rx(0.4) q[5];
rx(0.4) q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
measure q[3] -> c[3];
measure q[4] -> c[4];
measure q[5] -> c[5];
measure q[6] -> c[6];
