// Subsets With Duplicates (easy)

// Problem Statement #
// Given a set of numbers that might contain duplicates, find all of its distinct subsets.

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
  // sort asc
  items.sort((a, b) => a.compareTo(b));

  print(items);

  List<Subset<int>> subsets = [];

  //init add subset empty
  subsets.add(Subset<int>([]));

  List<Subset<int>> prevSubset = [];
  for (int i = 0; i < items.length; i++) {
    var item = items[i];
    List<Subset<int>> internalSubset = [];

    bool isDuplicateItem = i > 0 && items[i - 1] == item;

    if (isDuplicateItem) {
      for (var subset in prevSubset) {
        var subsetNew = subset.cloneWith(item);
        internalSubset.add(subsetNew);
      }
    } else {
      for (var subset in subsets) {
        var subsetNew = subset.cloneWith(item);
        internalSubset.add(subsetNew);
      }
    }

    subsets.addAll(internalSubset);

    prevSubset = []..addAll(internalSubset);
  }

  return subsets;
}

void main() {
  var subsets = findSubsets([1, 3, 3]);
  print(subsets);
}
