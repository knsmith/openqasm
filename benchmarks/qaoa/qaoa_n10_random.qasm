//QAOA with 10 qubits
//beta: 0.2
//gamma: 0.35
//topology: random
//prob. of graph edge: 0.5
OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
creg c[10];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
cu1(-0.7) q[0],q[4];
u1(0.35) q[0];
u1(0.35) q[4];
cu1(-0.7) q[0],q[8];
u1(0.35) q[0];
u1(0.35) q[8];
cu1(-0.7) q[1],q[6];
u1(0.35) q[1];
u1(0.35) q[6];
cu1(-0.7) q[1],q[7];
u1(0.35) q[1];
u1(0.35) q[7];
cu1(-0.7) q[1],q[8];
u1(0.35) q[1];
u1(0.35) q[8];
cu1(-0.7) q[2],q[3];
u1(0.35) q[2];
u1(0.35) q[3];
cu1(-0.7) q[2],q[4];
u1(0.35) q[2];
u1(0.35) q[4];
cu1(-0.7) q[2],q[5];
u1(0.35) q[2];
u1(0.35) q[5];
cu1(-0.7) q[2],q[6];
u1(0.35) q[2];
u1(0.35) q[6];
cu1(-0.7) q[2],q[9];
u1(0.35) q[2];
u1(0.35) q[9];
cu1(-0.7) q[3],q[4];
u1(0.35) q[3];
u1(0.35) q[4];
cu1(-0.7) q[3],q[5];
u1(0.35) q[3];
u1(0.35) q[5];
cu1(-0.7) q[3],q[6];
u1(0.35) q[3];
u1(0.35) q[6];
cu1(-0.7) q[3],q[7];
u1(0.35) q[3];
u1(0.35) q[7];
cu1(-0.7) q[4],q[5];
u1(0.35) q[4];
u1(0.35) q[5];
cu1(-0.7) q[4],q[7];
u1(0.35) q[4];
u1(0.35) q[7];
cu1(-0.7) q[4],q[9];
u1(0.35) q[4];
u1(0.35) q[9];
cu1(-0.7) q[5],q[6];
u1(0.35) q[5];
u1(0.35) q[6];
cu1(-0.7) q[5],q[9];
u1(0.35) q[5];
u1(0.35) q[9];
cu1(-0.7) q[6],q[7];
u1(0.35) q[6];
u1(0.35) q[7];
cu1(-0.7) q[7],q[8];
u1(0.35) q[7];
u1(0.35) q[8];
cu1(-0.7) q[7],q[9];
u1(0.35) q[7];
u1(0.35) q[9];
cu1(-0.7) q[8],q[9];
u1(0.35) q[8];
u1(0.35) q[9];
rx(0.4) q[0];
rx(0.4) q[1];
rx(0.4) q[2];
rx(0.4) q[3];
rx(0.4) q[4];
rx(0.4) q[5];
rx(0.4) q[6];
rx(0.4) q[7];
rx(0.4) q[8];
rx(0.4) q[9];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
measure q[3] -> c[3];
measure q[4] -> c[4];
measure q[5] -> c[5];
measure q[6] -> c[6];
measure q[7] -> c[7];
measure q[8] -> c[8];
measure q[9] -> c[9];
