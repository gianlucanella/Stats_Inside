import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../models/player.dart';

class ApiService {
  final String apiKey = "197109040a39bb4eb5524614103a294d";
  final String baseUrl = "https://v3.football.api-sports.io";

  // Funzione per gestire le chiamate API in modo più sicuro
  Future<Response> _getRequest(String endpoint) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      final response = await http.get(uri, headers: {
        'x-rapidapi-key': apiKey,
        'x-rapidapi-host': 'v3.football.api-sports.io',
      }).timeout(const Duration(seconds: 10));

      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      return response;
    } catch (e) {
      rethrow; // Rilancia l'errore per la gestione in un punto superiore
    }
  }

  // All players of Serie A
  Future<List<Player>> fetchPlayers() async {
  // Delay tra le richieste
  await Future.delayed(Duration(seconds: 1)); 
  final response = await _getRequest('/players/profiles');
  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body)['response'];
    return data.map((player) => Player.fromJson(player)).toList();
  } else {
    throw _handleError(response);
  }
}


  // Ottieni statistiche dettagliate di un giocatore
  Future<Player> fetchPlayerDetails(String playerId) async {
    final response = await _getRequest('/players/$playerId');

    if (response.statusCode == 200) {
      var data = json.decode(response.body)['response'][0];
      return Player.fromJson(data);
    } else {
      throw _handleError(response);
    }
  }

  Exception _handleError(Response response) {
    switch (response.statusCode) {
      case 400:
        return Exception('Bad Request: ${response.body}');
      case 401:
        return Exception('Unauthorized: API Key potrebbe essere errata');
      case 404:
        return Exception('Dati non trovati');
      case 500:
        return Exception('Errore del server. Riprova più tardi.');
      default:
        return Exception('Errore sconosciuto: ${response.statusCode}');
    }
  }
}
