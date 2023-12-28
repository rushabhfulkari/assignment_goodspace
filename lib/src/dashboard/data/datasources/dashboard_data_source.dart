import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/utils/constants.dart';
import '../models/dashboard_job_feed_model.dart';
import '../models/inactive_products_model.dart';

abstract class DashboardDataSource {
  const DashboardDataSource();

  Future<List<InactiveProductsModel>> getInActiveProducts({
    required String token,
  });

  Future<List<DashboardJobFeedModel>> getDashboardJobFeeds({
    required String token,
  });
}

const kGetInActiveProducts = '/api/d2/manage_products/getInActiveProducts';
const kGetDashboardJobs = '/api/d2/member/dashboard/feed';
const kBaseUrl = 'https://api.ourgoodspace.com';

class DashboardDataSourceImplementation implements DashboardDataSource {
  const DashboardDataSourceImplementation(this._client);

  final http.Client _client;

  @override
  Future<List<InactiveProductsModel>> getInActiveProducts({
    required String token,
  }) async {
    try {
      final response = await _client
          .get(Uri.parse(kBaseUrl + kGetInActiveProducts), headers: {
        'Content-Type': 'application/json',
        "device-id": deviceId,
        "device-type": deviceType,
        "Authorization": token
      });

      if (response.statusCode != 200 && response.statusCode != 201) {
        return [];
      }

      return (jsonDecode(response.body)['data'] as List)
          .map((e) => InactiveProductsModel.fromMap(e))
          .toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<DashboardJobFeedModel>> getDashboardJobFeeds({
    required String token,
  }) async {
    try {
      final response =
          await _client.get(Uri.parse(kBaseUrl + kGetDashboardJobs), headers: {
        'Content-Type': 'application/json',
        "device-id": deviceId,
        "device-type": deviceType,
        "Authorization": token
      });

      if (response.statusCode != 200 && response.statusCode != 201) {
        return [];
      } else {
        return returnListOfDashboardJobFeedModel(response.body);
      }
    } catch (e) {
      return [];
    }
  }

  List<DashboardJobFeedModel> returnListOfDashboardJobFeedModel(String body) {
    final List<DashboardJobFeedModel> dashboardJobFeedModelList = [];

    final List<dynamic> tempDashboardJobFeedModelList =
        jsonDecode(body)['data'];

    for (var element in tempDashboardJobFeedModelList) {
      if (element['cardData'].toString() != 'null') {
        dashboardJobFeedModelList.add(DashboardJobFeedModel(
            title: element['cardData']['title'].toString(),
            location_city: element['cardData']['location_city'].toString(),
            is_remote: element['cardData']['is_remote'].toString(),
            lowerworkex: element['cardData']['lowerworkex'].toString(),
            upperworkex: element['cardData']['upperworkex'].toString(),
            displayCompensation:
                element['cardData']['displayCompensation'].toString(),
            name: element['cardData']['userInfo']['name'].toString(),
            image_id: element['cardData']['userInfo']['image_id'].toString(),
            companyName: element['cardData']['companyName'].toString()));
      }
    }

    return dashboardJobFeedModelList;
  }
}
