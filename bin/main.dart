// Challenge 1
// Write Test cases for given challenges

// Challenge 2
// Sudoku Validation
// Write a sudoku validator. This function should return true if the 2-D array represents a valid sudoku and false otherwise. To be a valid sudoku:
//
// - Each row must have the digits from 1 to 9 exactly once.
// - Each column must have the digits from 1 to 9 exactly once.
// - Each 3x3 box must have the digits from 1 to 9 exactly once.
// Examples
//  sudokuValidator([
//  [ 1, 5, 2, 4, 8, 9, 3, 7, 6 ],
//  [ 7, 3, 9, 2, 5, 6, 8, 4, 1 ],
//  [ 4, 6, 8, 3, 7, 1, 2, 9, 5 ],
//  [ 3, 8, 7, 1, 2, 4, 6, 5, 9 ],
//  [ 5, 9, 1, 7, 6, 3, 4, 2, 8 ],
//  [ 2, 4, 6, 8, 9, 5, 7, 1, 3 ],
//  [ 9, 1, 4, 6, 3, 7, 5, 8, 2 ],
//  [ 6, 2, 5, 9, 4, 8, 1, 3, 7 ],
//  [ 8, 7, 3, 5, 1, 2, 9, 6, 4 ]
//  ]) ➞ true
sudokuValidator(List<List> board) {
  valid(List list) {
    for(int i = 0; i < list.length; i++){
      if(list[i] > 9 || list[i] < 0){
        return false;
      }
    }
    return list.toSet().length == 9;
  }

  bool checkRowsAndCols(List<List> board) {
    List colList = [];
    for (int i = 0; i < 9; i++) {
      if(valid(board[i])) {
        for (int j = 0; j < 9; j++) {
          colList.add(board[j][i]);
        }
        if(valid(colList)){
          colList.clear();
        }
        else{
          return false;
        };
      }
      else{
        return false;
      }
    }
    return true;
  }

  bool checkBlock(List<List> board) {
    List block = List();
    for (int i = 0; i < 9; i += 3) {
      for (int j = 0; j < 9; j += 3) {
        for (int a = i; a < i + 3; a++) {
          for (int b = j; b < j + 3; b++) {
            block.add(board[a][b]);
          }
        }
        if(valid(block)){
          block.clear();
        }
        else{
          return false;
        }
      }
    }
    return true;
  }

  return checkRowsAndCols(board) && checkBlock(board);
}
// Challenge 3
// Sort by Factor Length
// A numbers factor length is simply its total number of factors.
// Create a function that sorts an array by factor length in descending order.
// If multiple numbers have the same factor length, sort these numbers in descending order, with the largest first.
//
// In the example below, since 13 and 7 both have only 2 factors, we put 13 ahead of 7.
//
// factorSort([9, 7, 13, 12]) ➞ [12, 9, 13, 7]

// Sort an array of numbers according
// to number of factors.

List factorSort(List<int> numbers) {
  numbers.sort(comparator);
  return numbers;
}

int comparator(int a, int b) {
  int aFactorCount = 0;
  int bFactorCount = 0;
  for (int i = 1; i < a; i++) {
    if (a % i == 0) {
      aFactorCount++;
    }
  }
  for (int i = 1; i < b; i++) {
    if (b % i == 0) {
      bFactorCount++;
    }
  }
  if (aFactorCount < bFactorCount) return 1;
  if (aFactorCount > bFactorCount) return -1;
  if (aFactorCount == bFactorCount) {
    if (a < b) return 1;
    if (a == b) return 0;
    if (a > b) return -1;
  }
}


main() {

print (sudokuValidator([
  [ 1, 5, 2, 4, 8, 9, 3, 7, 6 ],
  [ 7, 3, 9, 2, 5, 6, 8, 4, 1 ],
  [ 4, 6, 8, 3, 7, 1, 2, 9, 5 ],
  [ 3, 8, 7, 1, 2, 4, 6, 5, 9 ],
  [ 5, 9, 1, 7, 6, 3, 4, 2, 8 ],
  [ 2, 4, 6, 8, 9, 5, 7, 1, 3 ],
  [ 9, 1, 4, 6, 3, 7, 5, 8, 2 ],
  [ 6, 2, 5, 9, 4, 8, 1, 3, 7 ],
  [ 8, 7, 3, 5, 1, 2, 9, 6, 4 ]
]));
print(factorSort([9, 7, 13, 12]));

}
