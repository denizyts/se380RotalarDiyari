import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> with WidgetsBindingObserver {

  int _selectedpage = 0;

  final List<String> _allRoutes = [
    'İstanbul - İzmir Rotası',
    'Ankara Kalesi Turu',
    'Kapadokya Balon Turu',
    'Ege Sahil Şeridi Macerası',
    'Karadeniz Yaylaları Keşfi',
    'Antalya Antik Kentler Rotası',
    'Likya Yolu Yürüyüşü',
    'Doğu Ekspresi ile Kars',
    'İstanbul Boğaz Turu',
    'Ankara - Eskişehir Hızlı Rota'
  ];
  List <String> founded_routes =[];

  void _updateSelectedPageButton(int index){
    setState(() {
      _selectedpage=index;
    });
  }
  @override
  void initState() {
    super.initState();
    founded_routes=_allRoutes;
  }
  void _searchRoute(String query){
    List <String> results =[];
    if(query.isEmpty){
      results=_allRoutes;
    }else{
      results=_allRoutes.where((route) => route.toLowerCase().contains(query.toLowerCase())).toList();
    }
    setState(() {
      founded_routes=results;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for rotes ...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
                onChanged: (value){
                _searchRoute(value);
                }
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: founded_routes.length, // Liste uzunluğu kadar öğe oluştur
              itemBuilder: (context, index) => Card( // Her öğeyi daha şık bir Card içinde gösterelim
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: ListTile(
                  title: Text(founded_routes[index]),
                  onTap: () {
                    // Kullanıcı bir rotaya tıkladığında ne olacağını buraya yazabilirsin.
                    print('${founded_routes[index]} tıklandı.');
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Rotes'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedpage,
        onTap: _updateSelectedPageButton,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey, // Seçili olmayanlar da gözükebilsin diye
      ),
    );
  }
}