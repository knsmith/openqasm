//Bernstein-Vazirani with 5 qubits.
//Hidden string is 1111
OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg meas[5];
h q[0];
h q[1];
h q[2];
h q[3];
x q[4];
h q[4];
barrier q[0],q[1],q[2],q[3],q[4];
cx q[0],q[4];
cx q[1],q[4];
cx q[2],q[4];
cx q[3],q[4];
barrier q[0],q[1],q[2],q[3],q[4];
h q[0];
h q[1];
h q[2];
h q[3];
barrier q[0],q[1],q[2],q[3],q[4];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
