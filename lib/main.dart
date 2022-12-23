import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Random random = Random();
  int x = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Lottery App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Lottery winning number is 26',
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.2),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.1),
                    blurRadius: 3,
                    offset: const Offset(4, 8), // Shadow position
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: x == 2
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.done_outline_outlined,
                            size: 40,
                            color: Colors.green,
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Condition Matched',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Sans',
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.warning,
                            size: 40,
                            color: Colors.redAccent,
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Better luck next time, your number is:\n$x',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'Sans',
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              x = random.nextInt(5);
            });
          },
          child: x == 2 ? const Icon(Icons.refresh_sharp) : const Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}
