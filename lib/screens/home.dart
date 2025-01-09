import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stats Inside'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Statistiche Giocatori'),
              onTap: () {
                Navigator.pushNamed(context, '/player-stats');
              },
            ),
            ListTile(
              leading: Icon(Icons.groups),
              title: Text('Statistiche Squadre'),
              onTap: () {
                Navigator.pushNamed(context, '/team-stats');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Titolo introduttivo
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

              // Card principali
              Text(
                'Esplora le sezioni:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCategoryCard(
                    context,
                    title: 'Giocatori',
                    icon: Icons.person,
                    onTap: () => Navigator.pushNamed(context, '/player-stats'),
                  ),
                  _buildCategoryCard(
                    context,
                    title: 'Squadre',
                    icon: Icons.groups,
                    onTap: () => Navigator.pushNamed(context, '/team-stats'),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Classifiche rapide
              Text(
                'Classifiche Top Giocatori:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildQuickStat('Maggior numero di gol: Lionel Messi - 12'),
              _buildQuickStat('Maggior numero di assist: Kevin De Bruyne - 8'),
              _buildQuickStat('Maggior numero di tiri: Erling Haaland - 25'),

              SizedBox(height: 20),

              // Grafico o visualizzazioni dinamiche
              Text(
                'Performance settimanale:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                height: 200,
                color: Colors.blue.shade100, // Placeholder per il grafico
                child: Center(child: Text('Grafico in arrivo...')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context,
      {required String title, required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        child: Container(
          width: 120,
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.blue),
              SizedBox(height: 10),
              Text(title, style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickStat(String stat) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(Icons.star, color: Colors.orange),
          SizedBox(width: 10),
          Text(stat, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
