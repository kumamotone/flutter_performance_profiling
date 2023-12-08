import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  final List<int> items = List<int>.generate(1000, (i) => i);
  final String title = 'Mixed List';

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            // テキスト
            // return ExampleTextTile(
            //   index: item,
            // );

            // 大きな画像
            return ExampleBigImageTile(
              index: item,
            );

            // // 大きくてクリップされた画像
            // return ExampleBigClipImageTile(
            //   index: item,
            // );

            // return ExampleBigClipImageTile(
            //   index: item,
            // );
          },
        ),
      ),
    );
  }
}

class ExampleBigClipImageTileNoConst extends StatelessWidget {
  final int index;
  const ExampleBigClipImageTileNoConst({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    // sleep(const Duration(seconds: 1));

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: SizedBox(
              width: 300,
              height: 300,
              child: Image.asset('assets/10MB-768x512.jpg'),
            ),
          ),
          const Text("helo~~"),
        ],
      ),
    );
  }
}

class ExampleBigClipImageTile extends StatelessWidget {
  final int index;
  const ExampleBigClipImageTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    // sleep(const Duration(seconds: 1));

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: SizedBox(
              width: 300,
              height: 300,
              child: Image.asset('assets/10MB-768x512.jpg'),
            ),
          ),
          Text("hello~~$index"),
        ],
      ),
    );
  }
}

class ExampleBigImageTile extends StatelessWidget {
  final int index;
  const ExampleBigImageTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Image.network(
        'https://picsum.photos/3000/3000?random=$index',
        fit: BoxFit.cover,
      ),
    );
  }
}

class ExampleSmallImageTile extends StatelessWidget {
  final int index;
  const ExampleSmallImageTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Image.network(
        'https://picsum.photos/1000/1000?random=$index',
        fit: BoxFit.cover,
      ),
    );
  }
}

class ExampleTextTile extends StatelessWidget {
  final int index;
  const ExampleTextTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        "cell $index",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
