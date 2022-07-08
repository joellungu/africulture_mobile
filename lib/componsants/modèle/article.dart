class Article {
  String? id;
  String? titre;
  int? quantite;
  double? prix;
  Map<String, dynamic> toJson() =>
      {"id": id, "titre": titre, "quantite": quantite, "prix": prix};
}
