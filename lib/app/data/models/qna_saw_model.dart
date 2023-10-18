class QnaSaw {
  String? namaKriteria;
  String? pertanyaan;
  List<String>? subkriteria;

  QnaSaw({this.namaKriteria, this.pertanyaan, this.subkriteria});

  QnaSaw.fromJson(Map<String, dynamic> json) {
    namaKriteria = json['nama_kriteria'];
    pertanyaan = json['pertanyaan'];
    subkriteria = json['subkriteria'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nama_kriteria'] = namaKriteria;
    data['pertanyaan'] = pertanyaan;
    data['subkriteria'] = subkriteria;
    return data;
  }
}
