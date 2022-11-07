class BinaryTree<T> {
  BinaryTreeNode<T>? root;

  BinaryTree({this.root});

  // Traversal: naming with order of root node

  //Pre-Order Traversal -> pre-order root node, left, right
  //In-Order Traversal  -> in-order left, root node, right
  //Post-Order Traversal -> post-order left, right, root node

  // • traverseInOrder: left → action → right
  // • traversePreOrder: action → left → right
  // • traversePostOrder: left → right → action

  void traverseInOrder(void Function(T value) action) {
    var _rootNode = root;
    if (_rootNode != null) {
      _rootNode.traverseInOrder(action);
    }
  }

  void traversePreOrder(void Function(T value) action) {
    var _rootNode = root;
    if (_rootNode != null) {
      _rootNode.traversePreOrder(action);
    }
  }

  void traversePostOrder(void Function(T value) action) {
    var _rootNode = root;
    if (_rootNode != null) {
      _rootNode.traversePostOrder(action);
    }
  }
}

class BinaryTreeNode<T> {
  T value;

  BinaryTreeNode<T>? left;
  BinaryTreeNode<T>? right;

  BinaryTreeNode({required this.value, this.left, this.right});

  void traverseInOrder(void Function(T value) action) {
    left?.traverseInOrder(action);
    action(value);
    right?.traverseInOrder(action);
  }

  void traversePreOrder(void Function(T value) action) {
    action(value);
    left?.traversePreOrder(action);
    right?.traversePreOrder(action);
  }

  void traversePostOrder(void Function(T value) action) {
    left?.traversePostOrder(action);
    right?.traversePostOrder(action);
    action(value);
  }
}

void main() {
  final zero = BinaryTreeNode(value: 0);
  final one = BinaryTreeNode(value: 1);
  final five = BinaryTreeNode(value: 5);
  final seven = BinaryTreeNode(value: 7);
  final eight = BinaryTreeNode(value: 8);
  final nine = BinaryTreeNode(value: 9);
  seven.left = one;
  one.left = zero;
  one.right = five;
  seven.right = nine;
  nine.left = eight;

  BinaryTree tree = BinaryTree(root: seven);
  print('traversePreOrder\n');
  tree.traversePreOrder(print);

  print('traverseInOrder\n');
  tree.traverseInOrder(print);

  print('traversePostOrder\n');
  tree.traversePostOrder(print);
}
