import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/routes.dart';

class LikesPage extends StatefulWidget {
  const LikesPage({super.key});

  @override
  State<LikesPage> createState() => _LikesPageState();
}

class _LikesPageState extends State<LikesPage> {

  final List<routes> _likedRoutes = [
    routes(name: 'Ege Sahil Şeridi Macerası', likes: 215, dislike: 12, hour: '72s', price: '₺4000'),
    routes(name: 'Karadeniz Yaylaları Keşfi', likes: 180, dislike: 7, hour: '48s', price: '₺3200'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beğenilerim"),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primaryContainer,
        elevation: 0,
      ),

      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _likedRoutes.isEmpty
                  ? Center(
                child: Text(
                  'Henüz beğendiğiniz bir rota yok.',
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: theme.hintColor),
                ),
              )
                  : ListView.builder(
                itemCount: _likedRoutes.length,
                itemBuilder: (context, index) {
                  final route = _likedRoutes[index];
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 6),
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
                          Icons.favorite,
                          color: Colors.pink,
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
                          const SizedBox(height: 4),
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
          ),
        ],
      ),
    );
  }
}
