import 'package:flutter/material.dart';

import '../../widgets/pin_tile.dart';
import '../settings/settings_page.dart';
import '../transactions/transactions_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pinnedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finance Controller'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const Row(
              children: [
                Expanded(
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text(
                      'Hugo Alves',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  PinTile(
                    index: 0,
                    title: 'Board Pessoal',
                    icon: Icons.table_chart,
                    isPinned: pinnedIndex == 0,
                    onPinChanged: (isPinned) {
                      if (isPinned) {
                        setState(() {
                          pinnedIndex = 0;
                        });
                      }
                    },
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  PinTile(
                    index: 1,
                    title: 'Board da Empresa',
                    icon: Icons.table_chart,
                    isPinned: pinnedIndex == 1,
                    onPinChanged: (isPinned) {
                      if (isPinned) {
                        setState(() {
                          pinnedIndex = 1;
                        });
                      }
                    },
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey[200], // Define a cor de fundo do rodapé
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Logout'),
                    onTap: () {
                      print('Você saiu do sistema');
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: const TransactionsPage(),
    );
  }
}
