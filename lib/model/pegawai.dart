class Pegawai {
  int? id;
  String nip;
  String nama;
  DateTime tgl;
  String tlp;
  String email;


  Pegawai(
      {this.id,
      required this.nip,
      required this.nama,
      required this.tgl,
      required this.tlp,
      required this.email});

  factory Pegawai.fromJson(Map<String, dynamic> json) => Pegawai(
        id: json["id"],
        nip: json["nip"],
        nama: json["nama"],
       tgl: DateTime.parse(json["tanggal_lahir"]),
        tlp: json["nomor_telepon"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "nip": nip,
        "nama": nama,
        "tanggal_lahir":tgl.toIso8601String(),
        "nomor_telepon": tlp,
        "email": email,
        
      };
}