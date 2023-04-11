import 'word_list.dart';
import 'dart:math';
import 'dart:io';

void quizes1(int n){
  print("----chapter $n ----");
  for (var entry in chapter(n)!.entries) {
    var question = entry.key;
    List answers = entry.value;
    print(question);
    String? user_answer = stdin.readLineSync();
    for (int i = 0; i < answers.length; i++){
      if (user_answer == answers[i]){
        print("정답!");
        break;
      }
      if (i == answers.length-1){
        print("정답은 : $answers");
        break;
      }
    }
  }
}

void quizes2(int n){
  print("----chapter $n ----");
  var remainingKeys = chapter(n)!.keys.toList(); // 모든 key를 저장
  var random = Random();
  
  while (remainingKeys.isNotEmpty) { // 남은 key가 없을 때까지 반복
    var randomIndex = random.nextInt(remainingKeys.length); // 남은 key 중에서 무작위 인덱스 선택
    var randomKey = remainingKeys[randomIndex];
    var randomValue = chapter(n)![randomKey];
    
    // 선택된 key와 value 출력
    var question = randomKey;
    List? answers = randomValue;
    print(question);
    String? user_answer = stdin.readLineSync();
    for (int i = 0; i < answers!.length; i++){
      if (user_answer == answers[i]){
        print("정답!");
        break;
      }
      if (i == answers.length-1){
        print("정답은 : $answers");
        break;
      }
    }
    remainingKeys.removeAt(randomIndex); // 사용된 key 삭제
  }
}
