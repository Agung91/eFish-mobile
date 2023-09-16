import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app/modules/budidaya/model/model_budidaya.dart';

class PaginatedOrder {
  final String? findBy;
  final String? keyword;
  final int limit;
  final int page;
  final String sort;
  final String? direction;
  final int totalRows;
  final int totalPage;
  final List<OrderModel> rows;
  PaginatedOrder({
    required this.findBy,
    required this.keyword,
    required this.limit,
    required this.page,
    required this.sort,
    this.direction,
    required this.totalRows,
    required this.totalPage,
    required this.rows,
  });

  PaginatedOrder copyWith({
    String? findBy,
    String? keyword,
    int? limit,
    int? page,
    String? sort,
    String? direction,
    int? totalRows,
    int? totalPage,
    List<OrderModel>? rows,
  }) {
    return PaginatedOrder(
      findBy: findBy ?? this.findBy,
      keyword: keyword ?? this.keyword,
      limit: limit ?? this.limit,
      page: page ?? this.page,
      sort: sort ?? this.sort,
      direction: direction ?? this.direction,
      totalRows: totalRows ?? this.totalRows,
      totalPage: totalPage ?? this.totalPage,
      rows: rows ?? this.rows,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'findBy': findBy,
      'keyword': keyword,
      'limit': limit,
      'page': page,
      'sort': sort,
      'direction': direction,
      'totalRows': totalRows,
      'totalPage': totalPage,
      'rows': rows.map((x) => x.toMap()).toList(),
    };
  }

  factory PaginatedOrder.fromMap(Map<String, dynamic> map) {
    return PaginatedOrder(
      findBy: map['findBy'] ?? '',
      keyword: map['keyword'] ?? '',
      limit: map['limit']?.toInt() ?? 0,
      page: map['page']?.toInt() ?? 0,
      sort: map['sort'] ?? '',
      direction: map['direction'],
      totalRows: map['totalRows']?.toInt() ?? 0,
      totalPage: map['totalPage']?.toInt() ?? 0,
      rows:
          List<OrderModel>.from(map['rows']?.map((x) => OrderModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PaginatedOrder.fromJson(String source) =>
      PaginatedOrder.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PaginatedOrder(findBy: $findBy, keyword: $keyword, limit: $limit, page: $page, sort: $sort, direction: $direction, totalRows: $totalRows, totalPage: $totalPage, rows: $rows)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PaginatedOrder &&
        other.findBy == findBy &&
        other.keyword == keyword &&
        other.limit == limit &&
        other.page == page &&
        other.sort == sort &&
        other.direction == direction &&
        other.totalRows == totalRows &&
        other.totalPage == totalPage &&
        listEquals(other.rows, rows);
  }

  @override
  int get hashCode {
    return findBy.hashCode ^
        keyword.hashCode ^
        limit.hashCode ^
        page.hashCode ^
        sort.hashCode ^
        direction.hashCode ^
        totalRows.hashCode ^
        totalPage.hashCode ^
        rows.hashCode;
  }
}

class OrderModel {
  final String id;
  final String code;
  final String budidayaID;
  final BudidayaModel budidaya;
// final String user;
  final int qty;
  final DateTime bookingDate;
  final String pricelistID;
  final String pricelist;
  final int price;
  final int ammout;
  final String status;
  OrderModel({
    required this.id,
    required this.code,
    required this.budidayaID,
    required this.budidaya,
    required this.qty,
    required this.bookingDate,
    required this.pricelistID,
    required this.pricelist,
    required this.price,
    required this.ammout,
    required this.status,
  });
// final String createdAt;

  OrderModel copyWith({
    String? id,
    String? code,
    String? budidayaID,
    BudidayaModel? budidaya,
    int? qty,
    DateTime? bookingDate,
    String? pricelistID,
    String? pricelist,
    int? price,
    int? ammout,
    String? status,
  }) {
    return OrderModel(
      id: id ?? this.id,
      code: code ?? this.code,
      budidayaID: budidayaID ?? this.budidayaID,
      budidaya: budidaya ?? this.budidaya,
      qty: qty ?? this.qty,
      bookingDate: bookingDate ?? this.bookingDate,
      pricelistID: pricelistID ?? this.pricelistID,
      pricelist: pricelist ?? this.pricelist,
      price: price ?? this.price,
      ammout: ammout ?? this.ammout,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'code': code,
      'budidayaID': budidayaID,
      'budidaya': budidaya.toMap(),
      'qty': qty,
      'bookingDate': bookingDate.millisecondsSinceEpoch,
      'pricelistID': pricelistID,
      'pricelist': pricelist,
      'price': price,
      'ammout': ammout,
      'status': status,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] ?? '',
      code: map['code'] ?? '',
      budidayaID: map['budidayaID'] ?? '',
      budidaya: BudidayaModel.fromMap(map['budidaya']),
      qty: map['qty']?.toInt() ?? 0,
      bookingDate: DateTime.parse(map['bookingDate']),
      pricelistID: map['pricelistID'] ?? '',
      pricelist: map['pricelist'] ?? '',
      price: map['price']?.toInt() ?? 0,
      ammout: map['ammout']?.toInt() ?? 0,
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderModel(id: $id, code: $code, budidayaID: $budidayaID, budidaya: $budidaya, qty: $qty, bookingDate: $bookingDate, pricelistID: $pricelistID, pricelist: $pricelist, price: $price, ammout: $ammout, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderModel &&
        other.id == id &&
        other.code == code &&
        other.budidayaID == budidayaID &&
        other.budidaya == budidaya &&
        other.qty == qty &&
        other.bookingDate == bookingDate &&
        other.pricelistID == pricelistID &&
        other.pricelist == pricelist &&
        other.price == price &&
        other.ammout == ammout &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        code.hashCode ^
        budidayaID.hashCode ^
        budidaya.hashCode ^
        qty.hashCode ^
        bookingDate.hashCode ^
        pricelistID.hashCode ^
        pricelist.hashCode ^
        price.hashCode ^
        ammout.hashCode ^
        status.hashCode;
  }
}