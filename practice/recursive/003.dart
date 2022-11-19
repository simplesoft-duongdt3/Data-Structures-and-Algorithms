https://www.geeksforgeeks.org/print-all-possible-combinations-of-r-elements-in-a-given-array-of-size-n/

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

void combinationUtil(List<int> arr, List<int> data, int start,
                                int end, int index, int r)
    {
        // Current combination is ready to be printed, print it
        if (index == r)
        {
            for (int j=0; j<r; j++)
                print("${data[j]} ");
            print('\n');
            return;
        }
 
        // replace index with all possible elements. The condition
        // "end-i+1 >= r-index" makes sure that including one element
        // at index will make a combination with remaining elements
        // at remaining positions
        for (int i=start; i<=end && end-i+1 >= r-index; i++)
        {
            data[index] = arr[i];
            combinationUtil(arr, data, i+1, end, index+1, r);
        }
    }
 
    // The main function that prints all combinations of size r
    // in arr[] of size n. This function mainly uses combinationUtil()
    void printCombination(List<int> arr, int n, int r)
    {
        // A temporary array to store all combination one by one
        List<int> data=[];
      
        for(int i = 0; i< r; i++) {
          data.add(-1);
        }
 
        // Print all combination using temporary array 'data[]'
        combinationUtil(arr, data, 0, n-1, 0, r);
    }


void main() {
  printCombination([5, 4, 3, 2, 1], 5, 2);
}