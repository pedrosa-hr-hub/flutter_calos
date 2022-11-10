class Voto {
  final String voto;
  final int qtd;

  const Voto({
    required this.voto,
    required this.qtd,

  });

  static Voto fromJson(json) => Voto(
    voto: json['voto'],
    qtd: json['qtd'],
  );
}