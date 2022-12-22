class Lembaga {
  String nm_prodi;

  Lembaga({
    required this.nm_prodi,
  });

  factory Lembaga.fromJson(Map<String, dynamic> json) {
    return Lembaga(
      nm_prodi: json['nm_prodi'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map['nm_prodi'] = nm_prodi;

    return map;
  }
}
