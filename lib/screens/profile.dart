import 'package:deneme/screens/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:deneme/core/widgets/stat_box.dart';
import 'package:deneme/core/widgets/route_cart.dart';

import 'create_route.dart';
import 'likes.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = "HavvanurK77";
  int likes = 42;
  int income = 2800;
  int sharedRoutes = 32;
  int people = 14;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primaryContainer,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🧍 Profil bilgileri
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person, size: 55, color: Colors.white),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              username,
                              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LikesPage(),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.favorite_border, size: 18),
                              label: const Text("Beğeniler"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: theme.colorScheme.primaryContainer,
                                foregroundColor: theme.colorScheme.onPrimaryContainer,
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        width: 75,
                        height: 75,
                        margin: const EdgeInsets.only(right: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: theme.colorScheme.primaryContainer, width: 3),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/badge.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // 📊 İstatistik kutuları
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatBox(title: "Gelir", value: "$income₺"),
                      StatBox(title: "Rota", value: "$sharedRoutes"),
                      StatBox(title: "İnsan", value: "$people"),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Rota kartları
                  RouteCard(
                    title: "İzmir Turu",
                    subtitle: "300₺ · 1200₺ kazanç",
                    onTap: () {},
                  ),
                  const SizedBox(height: 16),
                  RouteCard(
                    title: "Ankara Kalesi Turu",
                    subtitle: "300₺ · 1200₺ kazanç",
                    onTap: () {},
                  ),

                  const SizedBox(height: 140),
                ],
              ),
            ),
          ),

          // 🔸Rota Oluşturma ve Ayarlar
          Positioned(
            left: 16,
            right: 16,
            bottom: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RoutePage()),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Rota Oluştur"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SettingsPage()),
                    );
                  },
                  icon: const Icon(Icons.settings, size: 30),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
