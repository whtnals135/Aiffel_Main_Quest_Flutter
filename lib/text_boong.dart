import 'package:flutter/material.dart';

void main() {
  runApp(TextClassificationApp());
}

class TextClassificationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Classification App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TextClassificationPage(),
    );
  }
}

class TextClassificationPage extends StatefulWidget {
  @override
  _TextClassificationPageState createState() => _TextClassificationPageState();
}

class _TextClassificationPageState extends State<TextClassificationPage> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Classification'),
        centerTitle: true,
        // 왼쪽에 뒤로가기 버튼 추가
        leading: IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 텍스트 입력 필드
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Enter text...',
              ),
            ),
            SizedBox(height: 20),
            // 예측 버튼
            ElevatedButton(
              onPressed: () async {
                // Predict 버튼을 눌렀을 때 비동기적으로 카테고리를 예측하고 결과 페이지로 이동
                String predictionResult = await predictCategory(_textController.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompletedTodoPage(predictionResult: predictionResult),
                  ),
                );
              },
              child: Text('Predict'),
            ),
          ],
        ),
      ),
    );
  }

  // 텍스트 카테고리를 비동기적으로 예측하는 함수
  Future<String> predictCategory(String text) async {
    // 데모 모델을 사용하여 입력된 텍스트의 카테고리를 예측하는 코드
    // 여기서는 간단한 분류 모델을 가정하고, 텍스트를 각 카테고리에 할당합니다.
    // 이 함수는 예측된 카테고리를 반환합니다.
    // 실제로는 더 복잡한 모델을 사용할 수 있습니다.
    List<String> categories = ['Politics', 'Economy', 'Sports', 'Entertainment', 'Other'];
    // 예시로 각 카테고리에 대한 확률을 랜덤으로 생성합니다.
    await Future.delayed(Duration(seconds: 1)); // 예시로 1초의 딜레이를 줍니다.
    return categories[text.length % categories.length];
  }
}

class CompletedTodoPage extends StatelessWidget {
  final String predictionResult;

  CompletedTodoPage({required this.predictionResult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prediction Result'),
        centerTitle: true,
        // 왼쪽에 뒤로가기 버튼 추가
        leading: IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 예측 결과 출력
          Center(
            child: Text(
              'Prediction Result: $predictionResult',
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(height: 20),
          // 홈 버튼
          ElevatedButton(
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
            child: Text('Home'),
          ),
        ],
      ),
    );
  }
}
