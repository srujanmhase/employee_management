import 'package:employee_management/constants/colors.dart';
import 'package:employee_management/constants/fontstyles.dart';
import 'package:employee_management/core/edit/cubit/edit_cubit.dart';
import 'package:employee_management/cubit/app_cubit.dart';
import 'package:employee_management/models/designation.dart';
import 'package:employee_management/models/employee.dart';
import 'package:employee_management/models/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key, this.employee});

  final Employee? employee;

  static String path = '/details';
  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.employee?.name ?? '';
    if (widget.employee != null) {
      context.read<EditCubit>().updateNameString(widget.employee?.name ?? '');
      context.read<EditCubit>().updateDesignation(widget.employee!.designation);
      context.read<EditCubit>().updateStartDate(widget.employee!.startDate);
      if (widget.employee?.endDate != null) {
        context.read<EditCubit>().updateEndDate(widget.employee!.endDate!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditCubit, EditState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      listenWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: themeBlue,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Text(
              '${widget.employee == null ? 'Add' : 'Edit'} Employee Details',
              style: titleOne,
            ),
            actions: [
              if (widget.employee != null)
                IconButton(
                  onPressed: () {
                    context
                        .read<AppCubit>()
                        .deleteEmployee(employee: widget.employee!);
                    context.pop();
                  },
                  icon: Image.asset('assets/del.png', height: 17),
                ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: TextFormField(
                    controller: _nameController,
                    onChanged: (value) {
                      context.read<EditCubit>().updateNameString(value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Employee name',
                      hintStyle: hintStyle,
                      prefixIcon: const Icon(
                        Icons.person_outline,
                        color: themeBlue,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          color: borderColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Builder(builder: (context) {
                  return InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (modalContext) {
                          return Container(
                            height: 211,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                            ),
                            child: Column(
                              children: [
                                ...Designation.values
                                    .toList()
                                    .asMap()
                                    .entries
                                    .map(
                                      (e) => InkWell(
                                        onTap: () {
                                          context
                                              .read<EditCubit>()
                                              .updateDesignation(e.value);
                                          context.pop();
                                        },
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: Text(
                                                e.value.value,
                                                style: bottomSheetText,
                                              ),
                                            ),
                                            Container(
                                              height: 1,
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList()
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: borderColor,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.work_outline,
                                    color: themeBlue),
                                const SizedBox(width: 12),
                                if (state.designation == null)
                                  Text(
                                    'Select Role',
                                    style: hintStyle,
                                  ),
                                if (state.designation != null)
                                  Text(
                                    state.designation?.value ?? '',
                                    style: formText,
                                  ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              color: themeBlue,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 16),
                Row(
                  children: [Container()],
                )
              ],
            ),
          ),
          floatingActionButton: Transform.translate(
            offset: const Offset(16, 16),
            child: Container(
              height: 64,
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: Color(0xffF2F2F2),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(themeLightBlue),
                    ),
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      'Cancel',
                      style: formSubmitSecondary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  TextButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(themeBlue),
                    ),
                    onPressed: () {
                      if (_nameController.text.isEmpty) return;
                      final employee = Employee(
                        uuid: '',
                        status: Status.active,
                        name: context.read<EditCubit>().state.name!,
                        designation:
                            context.read<EditCubit>().state.designation!,
                        startDate: context.read<EditCubit>().state.startTime!,
                        endDate: context.read<EditCubit>().state.endTime,
                      );

                      if (widget.employee != null) {
                        context.read<AppCubit>().editEmployee(
                              employee: widget.employee!,
                              name: context.read<EditCubit>().state.name,
                              designation:
                                  context.read<EditCubit>().state.designation,
                              startDate:
                                  context.read<EditCubit>().state.startTime,
                              endDate: context.read<EditCubit>().state.endTime,
                            );
                      }

                      if (widget.employee == null) {
                        context
                            .read<AppCubit>()
                            .addEmployee(employee: employee);
                      }
                    },
                    child: Text(
                      'Save',
                      style: formSubmitPrimary,
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
