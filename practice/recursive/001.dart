// Check if a number is Palindrome

// Input: 10901
// Output: true

// Input: 109
// Output: false

// 10901
// 1 1 true
// 0 0 true
//  9 true
// => true

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

Stack<int> getNumbersStack(int number) {
  // On
  Stack<int> numbers = Stack<int>();
  int curNum = number;
  while (curNum > 0) {
    int num = curNum % 10;
    numbers.push(num);
    curNum = curNum ~/ 10;
  }

  return numbers;
}

List<int> getNumbers(int number) {
  // On
  List<int> numbers = [];
  int curNum = number;
  while (curNum > 0) {
    int num = curNum % 10;
    numbers.add(num);
    curNum = curNum ~/ 10;
  }

  return numbers;
}

// naive way
bool checkPalindrome(int number) {
  bool result = true;
  List<int> numbers = getNumbers(number);
  int size = numbers.length;
  if (size == 0) {
    result = false;
  } else if (size > 1) {
    int pointerLeft = 0;
    int pointerRight = size - 1;
    while (pointerLeft < pointerRight) {
      if (numbers[pointerLeft] != numbers[pointerRight]) {
        result = false;
        break;
      }

      pointerLeft++;
      pointerRight--;
    }
  }
  return result;
}

bool checkPalindromeStack(int number) {
  bool result = true;
  Stack<int> numbers = getNumbersStack(number);

  int curNumber = number;
  while (curNumber > 0) {
    // 1 0 9
    int num1 = curNumber % 10;
    int num2 = numbers.pop();
    if (num1 != num2) {
      result = false;
      break;
    }

    curNumber = curNumber ~/ 10;
  }
  return result;
}

void main() {
  bool caseStack1 = checkPalindrome(10901);
  print('caseStack1 expect true = $caseStack1');
  bool caseStack2 = checkPalindrome(109901);
  print('caseStack2 expect true = $caseStack2');
  bool caseStack3 = checkPalindrome(109010);
  print('caseStack3 expect false = $caseStack3');
  bool caseStack4 = checkPalindrome(1);
  print('caseStack4 expect true = $caseStack4');

  bool case1 = checkPalindromeStack(10901);
  print('case1 expect true = $case1');
  bool case2 = checkPalindromeStack(109901);
  print('case2 expect true = $case2');
  bool case3 = checkPalindromeStack(109010);
  print('case3 expect false = $case3');
  bool case4 = checkPalindromeStack(1);
  print('case4 expect true = $case4');
}
