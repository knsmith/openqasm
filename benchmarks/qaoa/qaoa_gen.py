"""
To generate a QAOA circuit algorithm using:
- 5 qubits
- beta = 0.2
- gamma = 0.35
- ring topology for MAXCUT

python qaoa_gen.py -q 5 -b 0.2 -g 0.35 -t "ring" -o qaoa5

The resulting circuit is stored at qaoa5.qasm 

For more details, run the above command with -h or --help argument.


@author Kate Smith kns@uchicago.edu
"""


import sys
import numpy as np
import networkx as nx
import argparse
import random
from qiskit import QuantumCircuit

if sys.version_info < (3, 5):
    raise Exception("Please use Python 3.5 or later")


def print_qasm(circ_qasm,comments=[], outname=None):
    """
        print qasm string with comments
    """
    if outname is None:
        for item in comments:
            print("//" + item)
        print(circ_qasm)
    else:
        if not outname.endswith(".qasm"):
            outfilename = outname + ".qasm"
        
        outfile = open(outfilename, "w")
        
        for item in comments:
            outfile.write("//" + item)
            outfile.write("\n")
        outfile.write(circ_qasm)
        outfile.close()

def create_mesh(n):
    """
        create graph with full mesh topology
    """
    V = np.arange(0,n,1)
    E = []
    d = 1.0
    for i in range(0,n):
        for j in range(0,n):
            if i != j:
                if ((i,j,d) not in E) and ((j,i,d) not in E):
                    E.append((i,j,d))
    return V, E
            
def create_ring(n):
    """
        create graph with full ring topology
    """
    V = np.arange(0,n,1)
    E = []
    d = 1.0
    for i in range(0,n):
        E.append((i,(i+1)%n,d))

    return V, E

def create_imbalance(n,n_dense):
    """
        create graph with imbalanced topology
    """
    #n = number of nodes
    #n_dense = number that are densely connected. Range from 0 (creates ring) to n (creates full mesh)
    V = np.arange(0,n,1)
    E = []
    d = 1.0
    for i in range(0,n):
        E.append((i,(i+1)%n,d))
    for i in range(0,n_dense):
        for j in range(0,n):
            if i != j:
                if ((i,j,d) not in E) and ((j,i,d) not in E):
                    E.append((i,j,d))
                
    return V, E

def create_random_graph(n,p):
    """
        create graph with random topology
    """
    G = nx.gnp_random_graph(n,p)
    V = G.nodes
    E = G.edges.data('weight', default=1.0)
    
    return V, E

def qaoa_circ_from_graph(V, E, G, gamma, beta):

    QAOA = QuantumCircuit(len(V), len(V))
    QAOA.h(range(len(V)))
    for edge in E:
        k = edge[0]
        l = edge[1]
        QAOA.cu1(-2*gamma, k, l)
        QAOA.u1(gamma, k)
        QAOA.u1(gamma, l)
    QAOA.rx(2*beta, range(len(V)))
    QAOA.measure(range(len(V)),range(len(V)))
    
    return QAOA

def main(n_qubits, beta, gamma, t_type, prob, out_name):

    comments = ["QAOA with " + str(n_qubits) + " qubits",
                "beta: " + str(beta),
                "gamma: " + str(gamma),
                "topology: " + str(t_type)]
    
    if t_type == "ring":
        V, E = create_ring(n_qubits)

    elif t_type == "mesh":
        V, E = create_mesh(n_qubits)

    elif t_type == "random":
        V, E = create_random_graph(n_qubits, prob)
        comments.append("prob. of graph edge: " +str(prob))

    else:
        raise Exception("Invalid type selected.")

    G = nx.Graph()
    G.add_nodes_from(V)
    G.add_weighted_edges_from(E)
    
    
    QAOA = qaoa_circ_from_graph( V, E, G, gamma, beta)

    if out_name is None:
        out_name = "qaoa_n" + str(n_qubits) + "_" + str(t_type)


    print_qasm(QAOA.qasm(), comments, out_name)

    



if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Generate qasm of \
                                                  the QAOA \
                                                  algorithm.")
    parser.add_argument("-q", "--qubits", type=int, default=16,
                        help="number of qubits")
    parser.add_argument("-b", "--beta", type=float, default=0.5,
                        help="beta value for QAOA")
    parser.add_argument("-g", "--gamma", default=0.5,
                        help="gamma value for QAOA")
    parser.add_argument("-t", "--t_type", default="ring",
                        help="graph topology either ring, mesh, or random")
    parser.add_argument("-p", "--prob", default=0.0,
                        help="probability of edge between node on random graph")
    parser.add_argument("-o", "--output", default=None, type=str,
                        help="output filename")
    args = parser.parse_args()
    main(args.qubits, float(args.beta), float(args.gamma), args.t_type, float(args.prob), args.output)