from Queue import Queue


class Graph(object):
    """A minimal graph using adjacency lists."""

    def __init__(self, nodes=[], edges=[]):
        self.nodes = nodes
        self.adjacency_list = {n: [tail for (head, tail) in edges if head == n] for n in nodes}

    def __str__(self):
        return "<Graph object {}>".format(self.adjacency_list)

    def successors(self, node):
        """Return a list of successors."""
        return self.adjacency_list[node]

    def predecessor(self, node):
        """Return a list of predecessors."""
        # shown for completeness. If this function is called often, this is the wrong data structure.
        return [head for head in self.nodes if node in self.successors(head)]

    def add_node(self, node):
        self.nodes.append(node)
        self.adjacency_list[node] = []

    def add_edge(self, edge):
        head, tail = edge
        self.adjacency_list[head].append(tail)


def bfs(graph, start):
    remaining_nodes = Queue()
    visited = set()

    def visit(node):
        print(node)
        visited.add(node)
        for tail in graph.successors(node):
            if tail not in visited:
                remaining_nodes.put(tail)

    remaining_nodes.put(start)
    while not remaining_nodes.empty():
        n = remaining_nodes.get()
        visit(n)

def st(graph, start):
    """ generates a spanning tree subgraph of a graph """
    remaining_nodes = Queue()
    visited = set()
    tree = Graph()

    def visit(node):
        print(node)
        visited.add(node)
        for tail in graph.successors(node):
            if tail not in visited:
                remaining_nodes.put(tail)
                tree.add_node(tail)
                tree.add_edge((node, tail))

    remaining_nodes.put(start)
    tree.add_node(start)
    while not remaining_nodes.empty():
        n = remaining_nodes.get()
        visit(n)

    return tree

def stwd(graph, start):
    """ generates a spanning tree subgraph of a graph, and records depth """
    remaining_nodes = Queue()
    visited = set()
    tree = Graph()
    depths = {}

    def visit(node):
        print(node)
        visited.add(node)
        for tail in graph.successors(node):
            if tail not in visited:
                remaining_nodes.put(tail)
                tree.add_node(tail)
                tree.add_edge((node, tail))
                depths[tail] = depths[node] + 1

    remaining_nodes.put(start)
    tree.add_node(start)
    depths[start] = 0
    while not remaining_nodes.empty():
        n = remaining_nodes.get()
        visit(n)

    return tree, depths

g = Graph(['a', 'b', 'c', 'd', 'e'], [('a', 'b'), ('a', 'c'), ('b', 'd'), ('b', 'e'), ('e', 'a')])

bfs(g, 'a')
print g
print st(g, 'a')
print stwd(g, 'a')
