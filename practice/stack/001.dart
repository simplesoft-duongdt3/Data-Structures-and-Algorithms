class Stack<T> {
  final List<T> _stack = [];
  
  void push(T value) {
    _stack.add(value);
  }
  
  T pop() {
    return _stack.removeLast();
  }
  
  T peek() {
    return _stack.last;
  }
  
  bool isEmpty() {
    return _stack.isEmpty;
  }
  
  bool isNotEmpty() {
    return !isEmpty();
  }
}

void main() {
  Stack<int> stack = Stack<int>();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.push(4);
  stack.push(5);
  
  var lastItem = stack.pop();
  print('lastItem: $lastItem');
  
  lastItem = stack.pop();
  print('lastItem: $lastItem');
  
  lastItem = stack.pop();
  print('lastItem: $lastItem');
  
  lastItem = stack.pop();
  print('lastItem: $lastItem');
  
  lastItem = stack.pop();
  print('lastItem: $lastItem');
  
  if(stack.isNotEmpty()) {
    lastItem = stack.pop();
    print('lastItem: $lastItem');
  }
}
