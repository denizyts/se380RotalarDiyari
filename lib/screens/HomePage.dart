import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final List<routes> _allRoutes = [
    routes(name: 'İzmir Turu', likes: 12, dislike: 2, hour: '4s', price: '₺500'),
    routes(name: 'Ankara Kalesi Turu', likes: 88, dislike: 5, hour: '3s', price: '₺250'),
    routes(name: 'Kapadokya Balon Turu', likes: 340, dislike: 2, hour: '1s', price: '₺3500'),
    routes(name: 'Ege Sahil Şeridi Macerası', likes: 215, dislike: 12, hour: '72s', price: '₺4000'),
    routes(name: 'Karadeniz Yaylaları Keşfi', likes: 180, dislike: 7, hour: '48s', price: '₺3200'),
    routes(name: 'Antalya Antik Kentler Rotası', likes: 95, dislike: 4, hour: '8s', price: '₺1200'),
    routes(name: 'Likya Yolu Yürüyüşü', likes: 310, dislike: 25, hour: '120s', price: '₺1500'),
  ];

  List<routes> _foundRoutes = [];

  @override
  void initState() {
    super.initState();
    _allRoutes.sort((a, b) => b.likes.compareTo(a.likes));
    _foundRoutes = _allRoutes;
  }

  void _searchRoute(String query) {
    List<routes> results = [];
    if (query.isEmpty) {
      results = _allRoutes;
    } else {
      results = _allRoutes
          .where((route) => route.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    results.sort((a, b) => b.likes.compareTo(a.likes));

    setState(() {
      _foundRoutes = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ana Sayfa"),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primaryContainer,
        elevation: 0,
      ),
      body: Column(
        children: [
          //  Arama barı
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
                  borderSide: BorderSide.none,
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
            child: _foundRoutes.isEmpty ?
            Center(
              child: Text(
                'Sonuç bulunamadı',
                style: theme.textTheme.bodyMedium!
                    .copyWith(color: theme.hintColor),
              ),
            ):ListView.builder(
                itemCount: _foundRoutes.length,
                itemBuilder: (context, index) {
                final route = _foundRoutes[index];
                return Card(
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
                      route.name,
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Row(
                        children: [
                          Icon(Icons.thumb_up_alt_outlined, size: 16, color: Colors.green),
                          const SizedBox(width: 4),
                          Text(route.likes.toString()),
                          const SizedBox(width: 16),
                          Icon(Icons.thumb_down_alt_outlined, size: 16, color: Colors.red),
                          const SizedBox(width: 4),
                          Text(route.dislike.toString()),
                        ],
                      ),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Saat bilgisi
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.timer_outlined, size: 16, color: theme.colorScheme.secondary),
                            const SizedBox(width: 4),
                            Text(
                              route.hour,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4), // saatle ücret bitişik olmasın diye araya mesafe
                        // Ücret bilgisi
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.sell_outlined, size: 16, color: theme.colorScheme.secondary),
                            const SizedBox(width: 4),
                            Text(
                              route.price,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    onTap: () {
                      debugPrint('${route.name} tıklandı.');
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
