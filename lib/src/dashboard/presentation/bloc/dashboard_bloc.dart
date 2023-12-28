import 'package:assignment_goodspace/src/dashboard/data/datasources/dashboard_data_source.dart';
import 'package:assignment_goodspace/src/dashboard/data/models/inactive_products_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:http/http.dart' as http;

import '../../../../services/user_signed_in_check.dart';
import '../../data/models/dashboard_job_feed_model.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<DashboardInitialEvent>((event, emit) async {
      emit(DashboardLoadingState());

      final resultGetInactiveProducts =
          await DashboardDataSourceImplementation(http.Client())
              .getInActiveProducts(token: token);
      final resultDashboardJobs =
          await DashboardDataSourceImplementation(http.Client())
              .getDashboardJobFeeds(token: token);

      if (resultGetInactiveProducts.toString() != '[]' &&
          resultDashboardJobs.toString() != '[]') {
        emit(state.copyWith(
          inactiveProducts: () => resultGetInactiveProducts,
          dashboardJobs: () => resultDashboardJobs,
        ));
      } else {
        emit(DashboardErrorState());
      }
    });
  }
}
