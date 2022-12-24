class MataKuliah {
  String kode_mk;
  String nm_mk;
  String status;
  String sks_mk;

  MataKuliah({
    required this.kode_mk,
    required this.nm_mk,
    required this.status,
    required this.sks_mk,
  });

  factory MataKuliah.fromJson(Map<String, dynamic> json) {
    return MataKuliah(
      kode_mk: json['kode_mk'] as String,
      nm_mk: json['nm_mk'] as String,
      status: json['status'] as String,
      sks_mk: json['sks_mk'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map['kode_mk'] = kode_mk;
    map['nm_mk'] = nm_mk;
    map['status'] = status;
    map['sks_mk'] = sks_mk;

    return map;
  }
}
