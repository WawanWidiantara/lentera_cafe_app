class Items {
  int? id;
  String? namaItem;
  String? kategori;
  int? harga;
  String? deskripsi;
  String? gambar;
  String? stok;
  int? nilai;
  int? jumlahBintang;
  int? jumlahPenilai;

  Items(
      {this.id,
      this.namaItem,
      this.kategori,
      this.harga,
      this.deskripsi,
      this.gambar,
      this.stok,
      this.nilai,
      this.jumlahBintang,
      this.jumlahPenilai});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaItem = json['nama_item'];
    kategori = json['kategori'];
    harga = json['harga'];
    deskripsi = json['deskripsi'];
    gambar = json['gambar'];
    stok = json['stok'];
    nilai = json['nilai'];
    jumlahBintang = json['jumlah_bintang'];
    jumlahPenilai = json['jumlah_penilai'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nama_item'] = namaItem;
    data['kategori'] = kategori;
    data['harga'] = harga;
    data['deskripsi'] = deskripsi;
    data['gambar'] = gambar;
    data['stok'] = stok;
    data['nilai'] = nilai;
    data['jumlah_bintang'] = jumlahBintang;
    data['jumlah_penilai'] = jumlahPenilai;
    return data;
  }
}
