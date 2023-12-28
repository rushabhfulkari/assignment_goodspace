// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class InactiveProductsModel extends Equatable {
  final String displayName;
  final String productName;

  const InactiveProductsModel(this.displayName, this.productName);

  @override
  List<Object?> get props => [
        displayName,
        productName,
      ];

  InactiveProductsModel copyWith({
    String? displayName,
    String? productName,
  }) {
    return InactiveProductsModel(
      displayName ?? this.displayName,
      productName ?? this.productName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'displayName': displayName,
      'productName': productName,
    };
  }

  factory InactiveProductsModel.fromMap(Map<String, dynamic> map) {
    return InactiveProductsModel(
      map['displayName'] as String,
      map['productName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory InactiveProductsModel.fromJson(String source) =>
      InactiveProductsModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
