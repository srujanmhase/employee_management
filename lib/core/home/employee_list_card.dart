import 'package:employee_management/constants/fontstyles.dart';
import 'package:employee_management/core/edit/view/edit_view.dart';
import 'package:employee_management/cubit/app_cubit.dart';
import 'package:employee_management/models/employee.dart';
import 'package:employee_management/utils/month_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:go_router/go_router.dart';

class EmployeeCard extends StatefulWidget {
  const EmployeeCard({super.key, required this.employee});

  final Employee employee;

  @override
  State<EmployeeCard> createState() => _EmployeeCardState();
}

class _EmployeeCardState extends State<EmployeeCard> {
  @override
  Widget build(BuildContext context) {
    final fromDate =
        '${widget.employee.startDate.day} ${monthFromInt(widget.employee.startDate.month)}, ${widget.employee.startDate.year}';
    final endDate =
        '${widget.employee.endDate?.day ?? ''} ${monthFromInt(widget.employee.endDate?.month ?? 0)}, ${widget.employee.endDate?.year ?? ''}';
    return SwipeActionCell(
      key: ObjectKey(widget.employee),
      trailingActions: <SwipeAction>[
        SwipeAction(
          icon: Image.asset('assets/del.png', height: 18),
          onTap: (CompletionHandler handler) {
            context.read<AppCubit>().deleteEmployee(employee: widget.employee);
          },
          color: Colors.red,
        ),
      ],
      child: InkWell(
        onTap: () => context.pushNamed(EditPage.path, extra: widget.employee),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border.symmetric(
              horizontal: BorderSide(
                width: 0.1,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.employee.name,
                  style: employeeCardName,
                ),
                const SizedBox(height: 8),
                Text(
                  widget.employee.designation.value,
                  style: employeeCardDesignation,
                ),
                const SizedBox(height: 8),
                Text(
                  '${endDate.length > 5 ? '' : 'From'} $fromDate ${endDate.length > 5 ? '- $endDate' : ''}',
                  style: employeeCardDates,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
