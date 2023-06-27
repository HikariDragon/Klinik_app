class Pasien {
  int? id;
  String nip;
  String nama;
  DateTime tgl;
  String tlp;
  String alamat;

  Pasien(
      {this.id,
      required this.nip,
      required this.nama,
      required this.tgl,
      required this.tlp,
      required this.alamat});

  factory Pasien.fromJson(Map<String, dynamic> json) => Pasien(
        id: json["id"],
        nip: json["nip"],
        nama: json["nama"],
        tgl: DateTime.parse(json["tanggal_lahir"]),
        tlp: json["nomor_telepon"],
        alamat: json["alamat"],
      );

  Map<String, dynamic> toJson() => {
        "nip": nip,
        "nama": nama,
        "tanggal_lahir": tgl.toIso8601String(),
        "nomor_telepon": tlp,
        "alamat": alamat,
      };
}
