class Cart {
  int? id;
  List<OrderItem>? orderItem;
  String? waktuPemesanan;
  int? totalPembayaran;
  bool? isNotified;
  String? status;
  int? user;

  Cart(
      {this.id,
      this.orderItem,
      this.waktuPemesanan,
      this.totalPembayaran,
      this.isNotified,
      this.status,
      this.user});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['order_item'] != null) {
      orderItem = <OrderItem>[];
      json['order_item'].forEach((v) {
        orderItem?.add(OrderItem.fromJson(v));
      });
    }
    waktuPemesanan = json['waktu_pemesanan'];
    totalPembayaran = json['total_pembayaran'];
    isNotified = json['is_notified'];
    status = json['status'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    if (orderItem != null) {
      data['order_item'] = orderItem?.map((v) => v.toJson()).toList();
    }
    data['waktu_pemesanan'] = waktuPemesanan;
    data['total_pembayaran'] = totalPembayaran;
    data['is_notified'] = isNotified;
    data['status'] = status;
    data['user'] = user;
    return data;
  }
}

class OrderItem {
  int? id;
  String? namaItem;
  String? gambar;
  String? catatan;
  int? jumlahPesanan;
  int? totalHarga;
  int? order;
  int? item;

  OrderItem(
      {this.id,
      this.namaItem,
      this.gambar,
      this.catatan,
      this.jumlahPesanan,
      this.totalHarga,
      this.order,
      this.item});

  OrderItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaItem = json['nama_item'];
    gambar = json['gambar'];
    catatan = json['catatan'];
    jumlahPesanan = json['jumlah_pesanan'];
    totalHarga = json['total_harga'];
    order = json['order'];
    item = json['item'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nama_item'] = namaItem;
    data['gambar'] = gambar;
    data['catatan'] = catatan;
    data['jumlah_pesanan'] = jumlahPesanan;
    data['total_harga'] = totalHarga;
    data['order'] = order;
    data['item'] = item;
    return data;
  }
}
