// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  List<InactiveProductsModel>? inactiveProducts = [];
  List<DashboardJobFeedModel>? dashboardJobs = [];
  DashboardState({this.inactiveProducts, this.dashboardJobs});

  @override
  List<Object> get props => [];

  DashboardState copyWith({
    List<InactiveProductsModel> Function()? inactiveProducts,
    List<DashboardJobFeedModel> Function()? dashboardJobs,
  }) {
    return DashboardState(
      inactiveProducts:
          inactiveProducts != null ? inactiveProducts() : this.inactiveProducts,
      dashboardJobs:
          dashboardJobs != null ? dashboardJobs() : this.dashboardJobs,
    );
  }
}

final class DashboardInitial extends DashboardState {}

abstract class DashboardActionState extends DashboardState {}

class DashboardLoadingState extends DashboardState {}

class DashboardErrorState extends DashboardState {}

class DashboardSuccessState extends DashboardState {}
