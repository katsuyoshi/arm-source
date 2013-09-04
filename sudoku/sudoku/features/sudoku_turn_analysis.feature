Feature: 数独の現在の状態を与える
  数独の現在の状態を与えて#analizeで状態を進める
  
  Scenario Outline: analyze left 3 columns
    Given 現在の状態"<before>"を与える
    When #analize_left_columns"<number>" を呼び出すと
    Then 次の状態"<after>"にになること。
    
    Scenarios: analyze left 3 columns with 2
      # ' 'を含む文字の与え方が分らないので'*'にして' 'に置き換える
      | before | number | after |
      | **2***4*****28*793*4*16728*2**73*15**31***97**75*91**2*57842*3*469*75*****8***5** | 2 | **2***4*****28*793*4*16728*2**73*15**31***97**75*91**2*57842*3*469*75****28***5** |
      
      