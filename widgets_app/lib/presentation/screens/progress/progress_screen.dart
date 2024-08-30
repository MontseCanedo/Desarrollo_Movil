import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  _ProgressView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          SizedBox(height: 30),
          Text('Circular progress indicator'),
          SizedBox(height: 30),
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Color.fromARGB(35, 105, 165, 215),
          ),
          SizedBox(height: 30),
          Text('Progress indicator controlado'),
          SizedBox(height: 10),
          _ControllerProgresIndicator()
        ],
      ),
    );
  }
}

class _ControllerProgresIndicator extends StatelessWidget {
  const _ControllerProgresIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
          return (value * 2) / 100;
        }).takeWhile((value) => value < 100),
        builder: (context, snapshot) {
          final progresValue = snapshot.data ?? 0;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  value: progresValue,
                  strokeWidth: 2,
                  backgroundColor: Color.fromARGB(50, 10, 245, 20),
                ),
                const SizedBox(width: 20),
                Expanded(child: LinearProgressIndicator(value: progresValue))
              ],
            ),
          );
        });
  }
}
