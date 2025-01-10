import 'package:flutter/material.dart';
import 'package:stats_inside/utils/localization_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black), // Icona del menu nera
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black),
          ),
          child: TextField(
            onChanged: (value) {
              setState(() {
                query = value;
              });
            },
            decoration: InputDecoration(
              hintText: LocalizationService().getString('find'),
              prefixIcon: Icon(Icons.search, color: Colors.black),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 8),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey[500]),
              child: Text(
                LocalizationService().getString('menu'),
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(LocalizationService().getString('stats_player')),
              onTap: () {
                Navigator.pushNamed(context, '/PlayerStats');
              },
            ),
            ListTile(
              leading: Icon(Icons.groups),
              title: Text(LocalizationService().getString('stats_team')),
              onTap: () {
                Navigator.pushNamed(context, '/TeamStats');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(LocalizationService().getString('settings')),
              onTap: () {
                Navigator.pushNamed(context, '/Settings');
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text(LocalizationService().getString('about')),
              onTap: () {
                Navigator.pushNamed(context, '/About');
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Benvenuto su Stats Inside!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Analizza le statistiche di giocatori e squadre per costruire la tua squadra perfetta di fantacalcio!',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  // Altre sezioni della home
                  // Puoi aggiungere contenuto qui
                ],
              ),
            ),
          ),
          // Risultati della ricerca
          if (query.isNotEmpty)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    query = "";
                  });
                },
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      color: Colors.white,
                      padding: EdgeInsets.all(16),
                      child: ListView.builder(
                        itemCount: 5, // Numero di risultati di esempio
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('Risultato $index per "$query"'),
                            onTap: () {
                              // Azione quando tocchi un risultato
                              print('Navigazione al risultato $index');
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
