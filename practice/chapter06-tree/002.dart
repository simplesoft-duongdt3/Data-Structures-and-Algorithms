import 'dart:collection';

class Tree<T> {
  TreeNode<T>? root;
  
  Tree({this.root});
  
  void _visitDepthFirst(TreeNode<T> node) {
    print('Node: ${node.value}');
    
    for(var child in node.children) {
      _visitDepthFirst(child);
    }
  }
  
  void visitDepthFirst() {
    var _root = root;
    if(_root != null) {
      _visitDepthFirst(_root);
    }
  }
  
  void _visitDepthFirstStack(TreeNode<T> node) {
    Queue<TreeNode<T>> stack = Queue<TreeNode<T>>();
      
      
      TreeNode<T>? currentNode = node;
      while(currentNode != null) {
        print('Node: ${currentNode.value}');
        
        for(var child in currentNode.children) {
          stack.addLast(child);
        }
        
        if(stack.isNotEmpty) {
          currentNode = stack.removeLast();
        } else {
          currentNode = null;
        }      
      }
  }
  
  void visitDepthFirstStack() {
    var _root = root;
    if(_root != null) {
      _visitDepthFirstStack(_root);
    }
   
  }
  
  void _visitLevelOrder(TreeNode<T> node) {
    Queue<TreeNode<T>> queue = Queue<TreeNode<T>>();
      
      
      TreeNode<T>? currentNode = node;
      while(currentNode != null) {
        print('Node: ${currentNode.value}');
        
        for(var child in currentNode.children) {
          queue.addLast(child);
        }
        
        if(queue.isNotEmpty) {
          currentNode = queue.removeFirst();
        } else {
          currentNode = null;
        }      
      }
    
  }
  
  //root node is level 0
  void visitLevelOrder() {
    var _root = root;
    if(_root != null) {
      _visitLevelOrder(_root);
    }
  }
}


class TreeNode<T> {
  T value;
  List<TreeNode<T>> children = [];
  
  TreeNode({required this.value});
  
  void addChildNode(TreeNode<T> node) {
    children.add(node);
  }
}

void main() {
  TreeNode<String> root = TreeNode<String>(value: 'beverages');
  
  Tree<String> tree = Tree<String>(root: root);
  
  
  TreeNode<String> hot = TreeNode<String>(value: 'hot');
  root.addChildNode(hot);
  TreeNode<String> tea = TreeNode<String>(value: 'tea');
  TreeNode<String> black = TreeNode<String>(value: 'black');
  TreeNode<String> green = TreeNode<String>(value: 'green');
  TreeNode<String> chai = TreeNode<String>(value: 'chai');
  tea.addChildNode(black);
  tea.addChildNode(green);
  tea.addChildNode(chai);
  TreeNode<String> coffee = TreeNode<String>(value: 'coffee');
  TreeNode<String> cocoa = TreeNode<String>(value: 'cocoa');
  hot.addChildNode(tea);
  hot.addChildNode(coffee);
  hot.addChildNode(cocoa);
    
    
    
  TreeNode<String> cold = TreeNode<String>(value: 'cold'); 
  root.addChildNode(cold);
  TreeNode<String> soda = TreeNode<String>(value: 'soda'); 
  TreeNode<String> ginger = TreeNode<String>(value: 'ginger ale'); 
  TreeNode<String> lemon = TreeNode<String>(value: 'bitter lemon'); 
  soda.addChildNode(ginger);
  soda.addChildNode(lemon);
  
  TreeNode<String> milk = TreeNode<String>(value: 'milk'); 
  cold.addChildNode(soda);
  cold.addChildNode(milk);
  
  print('visitDepthFirst\n');
  tree.visitDepthFirst();
  
  print('visitDepthFirstStack - something wrong here\n');
  tree.visitDepthFirstStack();
  
  
  print('visitLevelOrder\n');
  tree.visitLevelOrder();
  
}
