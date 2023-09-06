import 'package:flutter/material.dart';

class ButtonTheme1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('버튼 테마1'),
      ),
      body: Center(
        child: MyTossButton(
          onPressed: () {
            // 버튼 클릭 시 수행할 작업 추가
          },
          text: '버튼 테마1',
        ),
      ),
    );
  }
}

class MyTossButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;

  MyTossButton({required this.onPressed, required this.text});

  @override
  _MyTossButtonState createState() => _MyTossButtonState();
}

class _MyTossButtonState extends State<MyTossButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      onTap: widget.onPressed,
      child: Container(
        padding: EdgeInsets.all(16),
        // decoration: BoxDecoration(
        //   color: _isPressed ? Colors.blue.withOpacity(0.9) : Colors.blue,
        //   borderRadius: BorderRadius.circular(10),

        //   boxShadow: _isPressed
        //       ? [
        //           BoxShadow(
        //               color: Colors.grey, blurRadius: 5, offset: Offset(3, 6))
        //         ]
        //       : [
        //           BoxShadow(
        //             color: Colors.grey.withOpacity(0.5),
        //             spreadRadius: 2,
        //             blurRadius: 5,
        //             offset: Offset(3, 5),
        //           )
        //         ],
        // ),
        decoration: BoxDecoration(
          color: _isPressed ? Colors.blue.withOpacity(0.9) : Colors.blue,
          borderRadius: BorderRadius.circular(10),
          boxShadow: _isPressed
              ? [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(2.0, 2.0))
                ]
              : [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(4.0, 6.0))
                ],
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: 1.2, // 글자 사이 간격을 조정하여 입체감을 부여
          ),
        ),
      ),
    );
  }
}
