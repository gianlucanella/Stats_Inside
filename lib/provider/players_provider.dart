import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/player.dart';

class PlayersProvider with ChangeNotifier {
  final ApiService apiService = ApiService();
  List<Player> _players = [];
  bool isLoading = false;
  String error = '';

  List<Player> get players => _players;

  // Funzione per caricare i giocatori
  Future<void> loadPlayers() async {
    isLoading = true;
    notifyListeners();
    try {
      _players = await apiService.fetchPlayers();
      error = '';
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // // function to sort players by goals
  // void sortPlayersByGoals() {
  //   _players.sort((a, b) => b.goals.compareTo(a.goals));
  //   notifyListeners();
  // }

  // Function to sort players by name
  void sortPlayersByName() {
    _players.sort((a, b) => a.name.compareTo(b.name));
    notifyListeners();
  }

  // Function to sort players by rating
  Future<Player?> getPlayerDetails(String playerId) async {
    try {
      return await apiService.fetchPlayerDetails(playerId);
    } catch (e) {
      error = e.toString();
      notifyListeners();
      return null;
    }
  }
}
