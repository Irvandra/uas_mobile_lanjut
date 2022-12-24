class Lembaga {
  String nm_jns_sms;
  String nm_lemb;

  Lembaga({
    required this.nm_jns_sms,
    required this.nm_lemb,
  });

  factory Lembaga.fromJson(Map<String, dynamic> json) {
    return Lembaga(
      nm_jns_sms: json['nm_jns_sms'] as String,
      nm_lemb: json['nm_lemb'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map['nm_jns_sms'] = nm_jns_sms;
    map['nm_lemb'] = nm_lemb;

    return map;
  }
}
