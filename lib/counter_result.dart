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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$input',
              style: const TextStyle(fontSize: 40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(40),
                  child: const CircleAvatar(
                    radius: 30,
                    child: Text('x'),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                '$state',
                style: const TextStyle(fontSize: 40),
              ),
            ),
            const Divider(
              thickness: 3,
              indent: 20,
              endIndent: 20,
              color: Colors.black,
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                '${input * state}',
                style: const TextStyle(fontSize: 40),
              ),
            ),
            const Divider(
              thickness: 3,
              indent: 20,
              endIndent: 20,
              color: Colors.black,
              height: 14,
            ),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$input',
              style: const TextStyle(fontSize: 40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(40),
                  child: const CircleAvatar(
                    radius: 30,
                    child: Text('÷'),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                '$state',
                style: const TextStyle(fontSize: 40),
              ),
            ),
            const Divider(
              thickness: 3,
              indent: 20,
              endIndent: 20,
              color: Colors.black,
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                '${input / state}',
                style: const TextStyle(fontSize: 40),
              ),
            ),
            const Divider(
              thickness: 3,
              indent: 20,
              endIndent: 20,
              color: Colors.black,
              height: 14,
            ),
          ],
        ),
      ),
    );
  }
}
