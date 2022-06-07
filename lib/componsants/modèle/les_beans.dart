class Person {
  var id;
  late String? nom;
  late String? postnom;
  late String? prenom;
  late String? numero;
  late String? email;
  late DateTime? dateNaissance;
  late String? mdp;

  Person({
    this.dateNaissance,
    this.email,
    this.id,
    this.mdp,
    this.nom,
    this.numero,
    this.postnom,
    this.prenom,
  });
}
