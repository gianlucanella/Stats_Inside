import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../provider/players_provider.dart';
// import '../screens/PlayerDetails.dart';
import 'package:stats_inside/utils/localization_service.dart';
import 'package:stats_inside/models/player.dart';
import 'package:stats_inside/services/api_service.dart';

class PlayersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationService().getString('players'))),
      body: FutureBuilder<List<Player>>(
        future: ApiService().fetchPlayers(), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); 
          } else if (snapshot.hasError) {
            return Center(child: Text('Errore: ${snapshot.error}')); 
          } else if (snapshot.hasData) {
            var players = snapshot.data!;
            return ListView.builder(
              itemCount: players.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(players[index].name),
                  // subtitle: Text(players[index].team),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/PlayerDetails',
                      arguments: players[index].id, // Passa l'ID del giocatore
                    );
                  },
                );
              },
            );
          } else {
            return Center(child: Text('Nessun dato disponibile'));
          }
        },
      ),
    );
  }
}