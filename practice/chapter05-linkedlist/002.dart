class SinglyNode<T> {
  // data T
  // next

  T _data;
  SinglyNode<T>? _next;

  SinglyNode({required T data, required SinglyNode<T>? next})
      : _data = data,
        _next = next;

  T get data {
    return _data;
  }

  SinglyNode<T>? get next {
    return _next;
  }

  set next(SinglyNode<T>? next) {
    _next = next;
  }

  set data(T data) {
    _data = data;
  }
}

class SinglyLinkedList<T> {
  // node head
  // node tail
  SinglyNode<T>? _head;
  SinglyNode<T>? _tail;

  SinglyLinkedList();

  SinglyNode<T>? get head {
    return _head;
  }

  //addTail
  void addTail(T value) {
    SinglyNode<T> node = SinglyNode<T>(data: value, next: null);

    //case 1: isEmpty
    if (isEmpty()) {
      _head = node;
    } else {
      _tail?.next = node;
    }

    _tail = node;
  }

  //getNode(index)
  SinglyNode<T> getNode(int index) {
    int i = 0;
    SinglyNode<T>? node = _head;

    while (node != null) {
      if (i == index) {
        return node;
      }

      i++;
      node = node.next;
    }

    throw Exception('Invalid index = ${index}');
  }

  int getSize() {
    if (_head == null) {
      return 0;
    }

    int i = 0;
    SinglyNode<T>? node = _head;

    while (node != null) {
      i++;
      node = node.next;
    }
    return i;
  }

  @override
  String toString() {
    String value = '';
    SinglyNode<T>? node = _head;

    while (node != null) {
      value += '\nNode: ${node.data}';
      node = node.next;
    }
    return value;
  }

  //addHead
  void addHead(T value) {
    SinglyNode<T> node = SinglyNode<T>(data: value, next: null);

    //case 1: isEmpty
    if (isEmpty()) {
      _tail = node;
    } else {
      node.next = _head;
    }

    _head = node;
  }

  void addAfter(T value, SinglyNode<T> nodeBefore) {
    if (nodeBefore == _tail) {
      addTail(value);
    } else {
      SinglyNode<T> node = SinglyNode<T>(data: value, next: nodeBefore.next);
      nodeBefore.next = node;
    }
  }

  SinglyNode<T>? removeHead() {
    SinglyNode<T>? node = _head;
    if (_head == _tail) {
      _head = null;
      _tail = null;
    } else {
      _head = _head?.next;
    }
    return node;
  }

  SinglyNode<T>? removeTail() {
    SinglyNode<T>? node = _tail;
    if (_head == _tail) {
      _head = null;
      _tail = null;
    } else {
      SinglyNode<T>? node = _head;

      while (node != null) {
        if (node.next == _tail) {
          node.next = null;
          _tail = node;
          break;
        }

        node = node.next;
      }
    }

    return node;
  }

  SinglyNode<T>? removeAt(int index) {
    SinglyNode<T>? node;
    if (index == 0) {
      removeHead();
    } else {
      var nodeBefore = getNode(index - 1);
      node = nodeBefore.next;

      if (node == _tail) {
        removeTail();
      } else {
        nodeBefore.next = node?.next;
      }
    }

    return node;
  }

  //isEmpty
  bool isEmpty() {
    return _head == null;
  }

  //isNotEmpty
  bool isNotEmpty() {
    return !isEmpty();
  }
}

// 1. naive approach = O(n)
T? findMiddleNode<T>(SinglyLinkedList<T> list) {
  int size = list.getSize(); // O(n)
  int? index = size == 0 ? null : (size ~/ 2);
  if (index != null) {
    return list.getNode(index).data; // O(n)
  }
  return null;
}

// 2. better approach: two-pointers => O(n)
T? findMiddleNodeBetterApproach<T>(SinglyLinkedList<T> list) {
  var head = list.head;
  if (head == null) {
    return null;
  }

  SinglyNode<T>? fastPointer = head;
  SinglyNode<T>? slowPointer = head;

  // stop when fastPointer is tail
  while (fastPointer?.next != null) {
    // O(n/2) = O(n)
    slowPointer = slowPointer?.next;
    fastPointer = fastPointer?.next?.next;
  }

  return slowPointer?.data;
}

// Delete middle of linked list
void deleteMiddleNodeBetterApproach<T>(SinglyLinkedList<T> list) {
  var head = list.head;
  if (head == null) {
    return null;
  }

  SinglyNode<T>? fastPointer = head;
  SinglyNode<T>? slowPointer = head;
  SinglyNode<T>? beforeSlowPointer = null;

  // stop when fastPointer is tail
  while (fastPointer?.next != null) {
    beforeSlowPointer = slowPointer;
    slowPointer = slowPointer?.next;
    fastPointer = fastPointer?.next?.next;
  }

  if (slowPointer == head) {
    list.removeHead();
  } else if (beforeSlowPointer != null) {
    beforeSlowPointer.next = slowPointer?.next;
  }
}

void main() {
  SinglyLinkedList<String> list = SinglyLinkedList<String>();
  print('List:\n $list');

  var middleValue1 = findMiddleNodeBetterApproach(list);
  print('middleValueBetterApproach1: $middleValue1');

  list.addTail('1');

  print('List:\n $list');

  deleteMiddleNodeBetterApproach(list);
  print('deleteMiddleNodeBetterApproach: $list');

  var middleValue2 = findMiddleNodeBetterApproach(list);
  print('middleValueBetterApproach2: $middleValue2');

  list.addTail('2');
  list.addTail('3');
  list.addTail('4');

  print('List:\n $list');
  var middleValue3 = findMiddleNodeBetterApproach(list);
  print('middleValueBetterApproach3: $middleValue3');
  list.addTail('5');

  print('List:\n $list');

  var middleValue4 = findMiddleNodeBetterApproach(list);
  print('middleValueBetterApproach4: $middleValue4');

  deleteMiddleNodeBetterApproach(list);
  print('deleteMiddleNodeBetterApproach: $list');
}


// NP-complete
// https://www.geeksforgeeks.org/subset-sum-problem-dp-25/