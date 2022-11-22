// Permutations (medium)
// Problem Statement #
// Given a set of distinct numbers, find all of its permutations.

// Permutation is defined as the re-arranging of the elements of the set. For example, {1, 2, 3} has the following six permutations:

// {1, 2, 3}
// {1, 3, 2}
// {2, 1, 3}
// {2, 3, 1}
// {3, 1, 2}
// {3, 2, 1}
// If a set has ‘n’ distinct elements it will have n!n! permutations.

// Time complexity #
// We know that there are a total of N!N! permutations of a set with ‘N’ numbers. In the algorithm above, we are iterating through all of these permutations with the help of the two ‘for’ loops. In each iteration, we go through all the current permutations to insert a new number in them on line 17 (line 23 for C++ solution). To insert a number into a permutation of size ‘N’ will take O(N),O(N), which makes the overall time complexity of our algorithm O(N*N!)O(N∗N!).

// Space complexity #
// All the additional space used by our algorithm is for the result list and the queue to store the intermediate permutations. If you see closely, at any time, we don’t have more than N!N! permutations between the result list and the queue. Therefore the overall space complexity to store N!N! permutations each containing NN elements will be O(N*N!)O(N∗N!).

class Permutation<T> {
  final List<T> items;

  Permutation(this.items);

  List<Permutation<T>> genPermutations(T newItem) {
    List<Permutation<T>> permutations = [];
    for (int index = 0; index <= items.length; index++) {
      List<T> newItems = []..addAll(items);
      newItems.insert(index, newItem);
      Permutation<T> newPermutation = Permutation(newItems);
      permutations.add(newPermutation);
    }

    return permutations;
  }

  @override
  String toString() {
    String itemsStr = '';
    for (var item in items) {
      if (itemsStr.length != 0) {
        itemsStr += ',';
      }
      itemsStr += '$item';
    }

    return 'Permutation=[$itemsStr]';
  }
}

List<Permutation<int>> findPermutations(List<int> items) {
  //improve by using Queue
  List<Permutation<int>> permutations = [];

  permutations.add(Permutation<int>([]));

  for (var item in items) {
    List<Permutation<int>> stepPermutations = [];

    for (var permutation in permutations) {
      var listGenPermutations = permutation.genPermutations(item);
      stepPermutations.addAll(listGenPermutations);
    }

    //improve by using Queue
    permutations.clear();
    permutations.addAll(stepPermutations);

    print('Step $item => $permutations');
  }

  return permutations;
}

void main() {
  var permutations = findPermutations([1, 3, 5]);
  print(permutations);
}

// Recursive Solution #
// Here is the recursive algorithm following a similar approach: