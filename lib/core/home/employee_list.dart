import 'package:employee_management/constants/fontstyles.dart';
import 'package:employee_management/core/home/employee_list_card.dart';
import 'package:employee_management/core/home/home.dart';
import 'package:employee_management/cubit/app_cubit.dart';
import 'package:employee_management/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({super.key});

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state.onDelete) {
          AppUtils.showSnackbar(
            context: scaffoldKey.currentContext!,
            message: 'Employee data has been deleted',
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                scaffoldKey.currentContext!
                    .read<AppCubit>()
                    .undoDelete(uuid: state.lastDeletedUuid ?? '');
              },
            ),
          );
          context.read<AppCubit>().resetDeleteFlag();
        }
      },
      listenWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            if (state.currentEmployees.isNotEmpty)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Text(
                        'Current Employees',
                        style: homePageHeader,
                      )
                    ],
                  ),
                ),
              ),
            if (state.currentEmployees.isNotEmpty)
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return EmployeeCard(
                      employee: state.currentEmployees[index],
                    );
                  },
                  childCount: state.currentEmployees.length,
                ),
              ),
            if (state.previousEmployees.isNotEmpty)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Text(
                        'Previous Employees',
                        style: homePageHeader,
                      )
                    ],
                  ),
                ),
              ),
            if (state.previousEmployees.isNotEmpty)
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return EmployeeCard(
                      employee: state.previousEmployees[index],
                    );
                  },
                  childCount: state.previousEmployees.length,
                ),
              ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Text(
                      'Swipe left to delete',
                      style: employeeCardDesignation.copyWith(fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
