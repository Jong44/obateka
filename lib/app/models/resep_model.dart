class ResepModel {
  // "id": "001",
  // "nama_obat": "Paracetamol",
  // "nama_rumah_sakit": "RS. Jantung Harapan",
  // "tanggal": "2024-10-01",
  // "status": "pending"

  final String id;
  final String nama_obat;
  final String nama_rumah_sakit;
  final String tanggal;
  final String status;

  ResepModel({
    required this.id,
    required this.nama_obat,
    required this.nama_rumah_sakit,
    required this.tanggal,
    required this.status,
  });

  factory ResepModel.fromJson(Map<String, dynamic> json) {
    return ResepModel(
      id: json['id'],
      nama_obat: json['nama_obat'],
      nama_rumah_sakit: json['nama_rumah_sakit'],
      tanggal: json['tanggal'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_obat': nama_obat,
      'nama_rumah_sakit': nama_rumah_sakit,
      'tanggal': tanggal,
      'status': status,
    };
  }
}
