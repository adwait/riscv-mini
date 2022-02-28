import os
import pydot

graph = pydot.Dot("my_graph", graph_type="digraph", bgcolor="white")
label = ''
prev_nodequeue = []
nodequeue = []
time = 0
ic = 0

def clock_step(modulename, time):
    pass

def write(signal, value, mask=0):
    global label
    label += '{} <= {}{}\n'.format(signal, hex(value), (', mask=' + str(hex(mask))) if (mask != 0) else '')

def read(signal, value):
    global label
    label += '{} -> {}\n'.format(signal, hex(value))

def uop_begin(modulename, uopname, **args):
    global label, time, nodequeue, prev_nodequeue, ic
    if args.get('t') > time:
        if nodequeue != []:
            prev_nodequeue = nodequeue
        nodequeue = []
        time = args.get('t')
    ic = args.get('ic')
    label = '{}:{}@{}\n'.format(modulename, uopname, time)
    
def uop_end():
    global graph, prev_nodequeue, nodequeue
    if ic in [512, 516]:
        newnode = pydot.Node(label, shape="rectangle")
        graph.add_node(newnode)
        for node in prev_nodequeue:
            graph.add_edge(pydot.Edge(node, label))
        # print(label)
        nodequeue.append(label)

def anno():
    pass

def finish(pathname='outfile.png'):
    global graph
    basename = os.path.basename(pathname)
    filename = os.path.splitext(basename)[0]
    graph.write_png(filename + '.png')