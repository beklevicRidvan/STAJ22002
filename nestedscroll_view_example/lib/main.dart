import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NestedScrollView Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 200.0,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: innerBoxIsScrolled ? Text('NestedScrollView Example') : null,
                  background: Image.network(
                    'https://www.batterycentralbrisbane.com.au/wp-content/uploads/elementor/thumbs/placeholder-2-1-qdeuu9kexipvmw060ky5xplfoa726kskpwml322y74.png',
                    fit: BoxFit.cover,
                  ),
                ),
                bottom: const TabBar(
                  tabs: [
                    Tab(text: 'Home'),
                    Tab(text: 'Search'),
                    Tab(text: 'Marketing'),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              Center(child: Text('Home')),
              Center(child: Text('Search')),
              Center(child: Text('Market')),
            ],
          ),
        ),
      ),
    );
  }
}
