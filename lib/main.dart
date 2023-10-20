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
      title: 'Soammer Payback',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _counter = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          // Tab 1 content (Home)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Olá Sobrukai',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          // Tab 2 content (Search)
          Center(
            child: const Text(
              'Search Tab Content',
            ),
          ),
          // Tab 3 content (Favorites)
          Center(
            child: const Text(
              'Favorites Tab Content',
            ),
          ),
          // Tab 4 content (Profile)
          Center(
            child: const Text(
              'Profile Tab Content',
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF001380),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
        foregroundColor: Color(0xFFFFFFFF),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xA00F1F5B),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _tabController.index,
        onTap: (index) {
          setState(() {
            _tabController.index = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_rounded),
            label: 'Resgate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Ranking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: '+ Funcionalidades',
          ),
        ],
      ),
    );
  }
}
