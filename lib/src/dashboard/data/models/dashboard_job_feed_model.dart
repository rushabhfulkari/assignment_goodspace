// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class DashboardJobFeedModel extends Equatable {
  final String title;
  final String location_city;
  final String is_remote;
  final String lowerworkex;
  final String upperworkex;
  final String displayCompensation;
  final String name;
  final String image_id;
  final String companyName;

  const DashboardJobFeedModel(
      {required this.title,
      required this.location_city,
      required this.is_remote,
      required this.lowerworkex,
      required this.upperworkex,
      required this.displayCompensation,
      required this.name,
      required this.image_id,
      required this.companyName});

  @override
  List<Object?> get props => [
        title,
        location_city,
        is_remote,
        lowerworkex,
        upperworkex,
        displayCompensation,
        name,
        image_id,
        companyName
      ];
}
