import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'List without ListView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListScreen(),
    );
  }
}

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isSearchEnabled = false;
  final List<String> items = List<String>.generate(50, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // çözüm 1
      appBar: AppBar(
        title: _isSearchEnabled
            ? TextField(
          controller: _controller,
          decoration: const InputDecoration(
            hintText: 'Search...',
          ),
          autofocus: true,
        )
            : const Text('List with Search'),
        actions: [
          IconButton(
            icon: Icon(_isSearchEnabled ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                _isSearchEnabled = !_isSearchEnabled;
                if (!_isSearchEnabled) {
                  _controller.clear();
                }
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView( // çözüm 2
        child: Column(
          children: [
            for (var i = 0; i < items.length; i++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  items[i],
                  style: const TextStyle(fontSize: 18),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
