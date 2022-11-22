// Input: [1, 5, 3]
// Output: [], [1], [5], [3], [1,5], [1,3], [5,3], [1,5,3]

class Subset<T> {
  final List<T> items;

  Subset(this.items);

  Subset<T> cloneWith(T newItem) {
    return Subset<T>([]
      ..addAll(items)
      ..add(newItem));
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

    return 'Subset=[$itemsStr]';
  }
}

List<Subset<int>> findSubsets(List<int> items) {
  List<Subset<int>> subsets = [];

  //init add subset empty
  subsets.add(Subset<int>([]));

  for (var item in items) {
    List<Subset<int>> internalSubset = [];

    for (var subset in subsets) {
      var subsetNew = subset.cloneWith(item);
      internalSubset.add(subsetNew);
    }

    subsets.addAll(internalSubset);
  }

  return subsets;
}

void main() {
  var subsets = findSubsets([1, 5, 3]);
  print(subsets);
}


// Time complexity #
// Since, in each step, the number of subsets doubles as we add each element to all the existing subsets, the time complexity of the above algorithm is O(2^N), 
// where ‘N’ is the total number of elements in the input set. This also means that, in the end, we will have a total of O(2^N) subsets.

// Space complexity #
// All the additional space used by our algorithm is for the output list. Since we will have a total of O(2^N) subsets, the space complexity of our algorithm is also O(2^N).