import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> with WidgetsBindingObserver {
  int _selectedPage = 0;

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

  List<String> _foundRoutes = [];

  void _updateSelectedPageButton(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _foundRoutes = _allRoutes;
  }

  void _searchRoute(String query) {
    List<String> results = [];
    if (query.isEmpty) {
      results = _allRoutes;
    } else {
      results = _allRoutes
          .where((route) => route.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundRoutes = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Keşfet"),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primaryContainer,
        elevation: 0,
      ),
      body: Column(
        children: [
          // 🔍 Arama kutusu
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: _searchRoute,
              decoration: InputDecoration(
                hintText: 'Rota ara...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: theme.inputDecorationTheme.fillColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      BorderSide(color: theme.colorScheme.primary, width: 2),
                ),
              ),
            ),
          ),

          // 📜 Liste
          Expanded(
            child: _foundRoutes.isEmpty
                ? Center(
                    child: Text(
                      'Sonuç bulunamadı 😕',
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: theme.hintColor),
                    ),
                  )
                : ListView.builder(
                    itemCount: _foundRoutes.length,
                    itemBuilder: (context, index) => Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      color: theme.cardColor,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        leading: CircleAvatar(
                          backgroundColor: theme.colorScheme.primaryContainer,
                          child: Icon(
                            Icons.directions,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                        title: Text(
                          _foundRoutes[index],
                          style: theme.textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          debugPrint('${_foundRoutes[index]} tıklandı.');
                        },
                      ),
                    ),
                  ),
          ),
        ],
      ),

      // 🔽 Alt menü
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Ana Sayfa'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Rotalar'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        currentIndex: _selectedPage,
        onTap: _updateSelectedPageButton,
        selectedItemColor: theme.colorScheme.primary,
        unselectedItemColor: theme.disabledColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
    );
  }
}
