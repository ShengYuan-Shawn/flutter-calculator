import 'package:flutter/material.dart';

class Multiplication extends StatelessWidget {
  final int input;
  final int state;

  Multiplication({required this.input, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Results'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('$input'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  child: Text('x'),
                ),
                Text('$state'),
              ],
            ),
            const Divider(
              thickness: 4,
              indent: 20,
              endIndent: 20,
              color: Colors.black,
              height: 14,
            ),
            Text('${input * state}'),
          ],
        ),
      ),
    );
  }
}

class Division extends StatelessWidget {
  final int input;
  final int state;

  Division({required this.input, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Results'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('$input'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  child: Text('÷'),
                ),
                Text('$state'),
              ],
            ),
            const Divider(
              thickness: 4,
              indent: 20,
              endIndent: 20,
              color: Colors.black,
              height: 14,
            ),
            Text('${input * state}'),
          ],
        ),
      ),
    );
  }
}
