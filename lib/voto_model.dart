class Voto {
  final String voto;
  final String email;
  final String nome;
  final String cidade;
  final String estado;

  const Voto({
    required this.voto,
    required this.email,
    required this.nome,
    required this.cidade,
    required this.estado
  });

  static Voto fromJson(json) => Voto(
    voto: json['voto'],
    email: json['email'],
    nome: json['nome'],
    cidade: json['cidade'],
    estado: json['estado']
  );
}