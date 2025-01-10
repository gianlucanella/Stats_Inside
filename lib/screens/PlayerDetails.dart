import 'package:flutter/material.dart';
import 'package:stats_inside/services/api_service.dart'; // Modifica con il percorso giusto
import 'package:stats_inside/models/player.dart';

class PlayerDetailsScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    final String playerId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text("Dettagli Giocatore")),
      body: FutureBuilder<Player>(
        future: apiService.fetchPlayerDetails(playerId), // Recupera i dettagli usando l'ID
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Caricamento
          } else if (snapshot.hasError) {
            return Center(child: Text('Errore: ${snapshot.error}')); // Gestione errori
          } else if (snapshot.hasData) {
            var player = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(player.name, style: TextStyle(fontSize: 24)),
                  // Text('Squadra: ${player.team}', style: TextStyle(fontSize: 18)),
                  // // Text('Posizione: ${player.position}', style: TextStyle(fontSize: 18)),
                  // Text('Gol: ${player.goals}', style: TextStyle(fontSize: 18)),
                  // Aggiungi altre statistiche dettagliate come vuoi
                ],
              ),
            );
          } else {
            return Center(child: Text('Nessun dato disponibile'));
          }
        },
      ),
    );
  }
}
