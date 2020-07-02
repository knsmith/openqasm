//@author Raymond Harry Rudy rudyhar@jp.ibm.com
//Counterfeit coin finding with 12 coins.
//The false coin is 6
OPENQASM 2.0;
include "qelib1.inc";
qreg qr[13];
creg cr[13];
h qr[0];
h qr[1];
h qr[2];
h qr[3];
h qr[4];
h qr[5];
h qr[6];
h qr[7];
h qr[8];
h qr[9];
h qr[10];
h qr[11];
cx qr[0],qr[12];
cx qr[1],qr[12];
cx qr[2],qr[12];
cx qr[3],qr[12];
cx qr[4],qr[12];
cx qr[5],qr[12];
cx qr[6],qr[12];
cx qr[7],qr[12];
cx qr[8],qr[12];
cx qr[9],qr[12];
cx qr[10],qr[12];
cx qr[11],qr[12];
measure qr[12] -> cr[12];
if(cr==0) x qr[12];
if(cr==0) h qr[12];
if(cr==4096) h qr[0];
if(cr==4096) h qr[1];
if(cr==4096) h qr[2];
if(cr==4096) h qr[3];
if(cr==4096) h qr[4];
if(cr==4096) h qr[5];
if(cr==4096) h qr[6];
if(cr==4096) h qr[7];
if(cr==4096) h qr[8];
if(cr==4096) h qr[9];
if(cr==4096) h qr[10];
if(cr==4096) h qr[11];
barrier qr[0],qr[1],qr[2],qr[3],qr[4],qr[5],qr[6],qr[7],qr[8],qr[9],qr[10],qr[11],qr[12];
if(cr==0) cx qr[6],qr[12];
barrier qr[0],qr[1],qr[2],qr[3],qr[4],qr[5],qr[6],qr[7],qr[8],qr[9],qr[10],qr[11],qr[12];
if(cr==0) h qr[0];
if(cr==0) h qr[1];
if(cr==0) h qr[2];
if(cr==0) h qr[3];
if(cr==0) h qr[4];
if(cr==0) h qr[5];
if(cr==0) h qr[6];
if(cr==0) h qr[7];
if(cr==0) h qr[8];
if(cr==0) h qr[9];
if(cr==0) h qr[10];
if(cr==0) h qr[11];
measure qr[0] -> cr[0];
measure qr[1] -> cr[1];
measure qr[2] -> cr[2];
measure qr[3] -> cr[3];
measure qr[4] -> cr[4];
measure qr[5] -> cr[5];
measure qr[6] -> cr[6];
measure qr[7] -> cr[7];
measure qr[8] -> cr[8];
measure qr[9] -> cr[9];
measure qr[10] -> cr[10];
measure qr[11] -> cr[11];
