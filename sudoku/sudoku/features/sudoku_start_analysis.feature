Feature: 数独に初期値を与える
  数独の問題をコンストラクタに与えて、#startで問題を表示する
  
  Scenario: start analysis
    Given コンストラクタに問題を与える
	  When #startを呼び出すと
	  Then 問題 "  2   4  \n   28 793\n 4 16728 \n2  73 15 \n 31   97 \n 75 91  2\n 57842 3 \n469 75   \n  8   5  "　が表示される。

