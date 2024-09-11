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
      title: 'Stepper with PageView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StepperPageViewExample(),
    );
  }
}

class StepperPageViewExample extends StatefulWidget {
  const StepperPageViewExample({super.key});

  @override
  _StepperPageViewExampleState createState() => _StepperPageViewExampleState();
}

class _StepperPageViewExampleState extends State<StepperPageViewExample> {
  final PageController _pageController = PageController();
  int _currentPage = 0;


  final List<Widget> _pages = [
    const Center(child: Text('Page 1', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Page 2', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Page 3', style: TextStyle(fontSize: 24))),
  ];

  void _onContinue() {
    if (_currentPage < _pages.length - 1) {
      setState(() {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  void _onBack() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView with Stepper'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: _pages,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: _currentPage > 0 ? _onBack : null,
                child: const Text('Back'),
              ),
              TextButton(
                onPressed: _currentPage < _pages.length - 1 ? _onContinue : null,
                child: const Text('Continue'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
