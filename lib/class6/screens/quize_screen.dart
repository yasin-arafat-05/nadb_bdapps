import 'package:flutter/material.dart';

class QuizeScreen extends StatelessWidget {
  const QuizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quize")),
      body: Column(
        children: [
          Text("Question Text"),
          Row(
            children: List.generate(4, (index) {
              return Container(
                child: Row(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.green),
                      child: Text("Option $index"),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
