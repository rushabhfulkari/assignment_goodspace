import 'package:assignment_goodspace/src/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication/presentation/widgets/build_loading_widget.dart';
import '../widgets/dashboard_state_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DashboardBloc _dashboardBloc = DashboardBloc();

  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    _dashboardBloc.add(DashboardInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return BlocConsumer<DashboardBloc, DashboardState>(
      bloc: _dashboardBloc,
      listener: (context, state) {},
      listenWhen: (previous, current) => current is DashboardActionState,
      buildWhen: (previous, current) => current is! DashboardActionState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case DashboardLoadingState:
            return const LoadingStateWidget();
          case DashboardErrorState:
            return const ErrorStateWidget();
          default:
            return DashboardScreenDefaultState(
              height: height,
              width: width,
              size: size,
              searchController: searchController,
              searchFocusNode: searchFocusNode,
              inactiveProducts: state.inactiveProducts ?? [],
              dashboardJobs: state.dashboardJobs ?? [],
            );
        }
      },
    );
  }
}
