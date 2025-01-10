import 'package:flutter/material.dart';

class TeamStatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistiche Squadre'),
        backgroundColor: Color(0xFF616161), // Grigio scuro
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Titolo sezione
              Text(
                'Le statistiche delle squadre di Fantacalcio:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              // Lista delle squadre
              _buildTeamCard('Juventus', 1, 18, 15, 8, 40),
              _buildTeamCard('Inter Milan', 2, 17, 14, 10, 35),
              _buildTeamCard('AC Milan', 3, 16, 12, 9, 31),
              _buildTeamCard('Roma', 4, 15, 12, 11, 30),

              SizedBox(height: 20),

              // Un altro gruppo di statistiche se necessario
              Text(
                'Classifica Generale (Aggiornata):',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildQuickStat('Maggior numero di gol: Juventus - 56'),
              _buildQuickStat('Miglior difesa: Inter Milan - 22 gol subiti'),
              _buildQuickStat('Squadra con più vittorie: AC Milan - 14 vittorie'),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Card per le squadre
  Widget _buildTeamCard(String teamName, int rank, int played, int wins, int losses, int goals) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Aggiunge angoli arrotondati
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Posizione: #$rank',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Partite giocate: $played', style: TextStyle(fontSize: 14)),
            Text('Vittorie: $wins', style: TextStyle(fontSize: 14)),
            Text('Sconfitte: $losses', style: TextStyle(fontSize: 14)),
            Text('Gol segnati: $goals', style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }

  // Statistiche rapide (se vuoi aggiungere ulteriori dettagli)
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
