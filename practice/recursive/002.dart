// Print all possible combinations of r elements in a given array of size n

// Given an array of size n, generate and print all possible combinations of r elements in array.
// For example, if input array is {1, 2, 3, 4} and r is 2, then output should be {1, 2}, {1, 3}, {1, 4}, {2, 3}, {2, 4} and {3, 4}.

// 1 2 3 4 5 , r = 3

// 1: 1 2: 1 2 3, 1 2 4, 1 2 5
// 1: 1 3: 1 3 4, 1 3 5
// 1: 1 4: 1 4 5
// 1: 1 5:

// init digits
// 1
// 2
// 3
// 4
// 5

// combines
// [1] size = 1
// [2] size = 1
// [3] size = 1
// [4] size = 1
// [5] size = 1

// [1] size = 1 < 3

// [1, 2]
// [1, 3]
// [1, 4]
// [1, 5]
// size = 2

class Queue<T> {
  final List<T> _stack = [];

  void enqueue(T value) {
    _stack.insert(0, value);
  }

  T dequeue() {
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

class Num {
  final int number;
  final int index;

  Num({required this.number, required this.index});

  String toString() {
    return 'Num: $number';
  }
}

// 1 2 3 4 5 , r = 3
// curCombine: [(1, index=0)]
// initDigits: [(1, index=0), (2, index=1) ... 5, index=4]

// curCombine: [(1, index=0), (2, index=1)]
// initDigits: [(1, index=0), (2, index=1) ... 5, index=4]

List<List<Num>> buildCombines(List<Num> curCombine, List<Num> initDigits) {
//   print('buildCombines \ncurCombine: $curCombine\ninitDigits: $initDigits');
  List<List<Num>> combines = [];
  int lastIndex = curCombine.last.index;

  for (Num numDigit in initDigits) {
    if (numDigit.index > lastIndex) {
      //create combine
      // curCombine + numDigit

      List<Num> combine = []
        ..addAll(curCombine)
        ..add(numDigit);
      combines.add(combine);
    }
  }

//   print('buildCombines \ncombines: $combines');
  return combines;
}

//naive
List<List<Num>> getPossibleCombinations(List<int> numbers, int sizeCombine) {
  List<List<Num>> result = [];

  List<Num> initDigits = [];
  int index = 0;
  for (int num in numbers) {
    initDigits.add(Num(number: num, index: index));
    index++;
  }

  Queue<List<Num>> queue = Queue();
  for (Num num in initDigits) {
    queue.enqueue([num]);
  }

  int times = 0;

  while (queue.isNotEmpty() && queue.peek().length < sizeCombine) {
    times++;
    List<Num> curCombine = queue.dequeue();
    List<List<Num>> combines = buildCombines(curCombine, initDigits);
    for (var combine in combines) {
      queue.enqueue(combine);
    }
  }

  //get resule
  while (queue.isNotEmpty()) {
    List<Num> combine = queue.dequeue();
    result.add(combine);
  }

  print('getPossibleCombinations $numbers $sizeCombine times = $times');

  return result;
}

void main() {
  var combines1 = getPossibleCombinations([5, 4, 3, 2, 1], 2);

  print('[5, 4, 3, 2, 1], 2 => size = ${combines1.length}\n');
  for (var combine in combines1) {
    print('combine $combine\n');
  }

  var combines2 = getPossibleCombinations([5, 4, 3, 2, 1], 3);
  print('[5, 4, 3, 2, 1], 3 => size = ${combines2.length}\n');
  for (var combine in combines2) {
    print('combine $combine\n');
  }

  var combines3 = getPossibleCombinations([5, 4, 3, 2, 1], 4);
  print('[5, 4, 3, 2, 1], 4 => size = ${combines3.length}\n');
  for (var combine in combines3) {
    print('combine $combine\n');
  }

  var combines4 = getPossibleCombinations([5, 4, 3, 2, 1], 5);
  print('[5, 4, 3, 2, 1], 5 => size = ${combines4.length}\n');
  for (var combine in combines4) {
    print('combine $combine\n');
  }

  var combines5 = getPossibleCombinations([5, 4, 3, 2, 1], 6);
  print('[5, 4, 3, 2, 1], 6 => size = ${combines5.length}\n');
  for (var combine in combines5) {
    print('combine $combine\n');
  }
}
