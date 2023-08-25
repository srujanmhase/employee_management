import 'package:employee_management/constants/colors.dart';
import 'package:employee_management/constants/fontstyles.dart';
import 'package:employee_management/core/edit/view/edit_view.dart';
import 'package:employee_management/core/home/employee_list.dart';
import 'package:employee_management/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String path = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<AppCubit>().initialiseList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: scaffoldBg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: themeBlue,
        title: Text(
          'Employee List',
          style: titleOne,
        ),
      ),
      body: context.watch<AppCubit>().state.employees.isEmpty
          ? Center(
              child: Image.asset('assets/empty.png'),
            )
          : const EmployeeList(),
      floatingActionButton: SizedBox(
        height: 50,
        width: 50,
        child: FloatingActionButton(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          onPressed: () {
            context.pushNamed(EditPage.path);
          },
          child: const Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
