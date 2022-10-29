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

void main() {
  SinglyLinkedList<String> list = SinglyLinkedList<String>();
  print('List$list');
  list.addHead('1');
  list.addTail('3');
  list.addHead('0');

  int findIndex = 1;
  var node = list.getNode(findIndex);
  print('Node index= $findIndex: ${node.data}');
  list.addAfter('2', node);

  print('List:\n $list');

  list.removeHead();
  print('Remove head List:\n $list');

  list.removeTail();
  print('Remove tail List:\n $list');

  list.removeAt(1);
  print('List after remove at 1:\n $list');

  list.removeAt(0);
  print('List after remove at 0:\n $list');

  list.removeAt(-1);
  print('List after remove at -1:\n $list');

  var nodeNotFound = list.getNode(4);
}
