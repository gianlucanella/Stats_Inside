class Player {
  final String name;
  final String position;
  final String? photo;
  final String? nationality;
  final String? id;

  Player({
    required this.name,
    required this.position,
    this.photo,
    this.nationality,
    this.id,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      name: json['player']['name'] ?? 'Nome sconosciuto',
      position: json['player']['position'] ?? 'Posizione sconosciuta',
      photo: json['player']['photo'] ?? '',
      nationality: json['player']['nationality'] ?? 'N/A',
      id: json['player']['id'].toString(),
    );
  }
}

