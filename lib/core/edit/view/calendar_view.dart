import 'package:employee_management/constants/colors.dart';
import 'package:employee_management/constants/fontstyles.dart';
import 'package:employee_management/core/edit/cubit/edit_cubit.dart';
import 'package:employee_management/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarSelectionView extends StatefulWidget {
  const CalendarSelectionView({
    super.key,
    required this.selectors,
    required this.type,
  });
  final List<Selectors> selectors;
  final Type type;
  @override
  State<CalendarSelectionView> createState() => _CalendarSelectionViewState();
}

class _CalendarSelectionViewState extends State<CalendarSelectionView> {
  @override
  void initState() {
    super.initState();
    final start = context.read<EditCubit>().state.startTime;
    final end = context.read<EditCubit>().state.endTime;
    if (start != null && widget.type == Type.start) {
      context.read<EditCubit>().updateStartDateTemp(start);
    }
    if (end != null && widget.type == Type.end) {
      context.read<EditCubit>().updateEndDateTemp(end);
    }
    if (end == null && widget.type == Type.end) {
      context.read<EditCubit>().updateSelector(Selectors.noDate, Type.end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.only(top: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.selectors.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: CalendarSelectorWidget(
                        selector: widget.selectors[0],
                        isSelected: context.watch<EditCubit>().state.selector ==
                            widget.selectors[0],
                        type: widget.type,
                      ),
                    ),
                    Expanded(
                      child: CalendarSelectorWidget(
                        selector: widget.selectors[1],
                        isSelected: context.watch<EditCubit>().state.selector ==
                            widget.selectors[1],
                        type: widget.type,
                      ),
                    )
                  ],
                ),
              ),
            if (widget.selectors.length > 2)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: CalendarSelectorWidget(
                        selector: widget.selectors[2],
                        isSelected: context.watch<EditCubit>().state.selector ==
                            widget.selectors[2],
                        type: widget.type,
                      ),
                    ),
                    Expanded(
                      child: CalendarSelectorWidget(
                        selector: widget.selectors[3],
                        isSelected: context.watch<EditCubit>().state.selector ==
                            widget.selectors[3],
                        type: widget.type,
                      ),
                    )
                  ],
                ),
              ),
            TableCalendar(
              focusedDay: widget.type == Type.start
                  ? (context.watch<EditCubit>().state.startTimeTemp ??
                      DateTime.now())
                  : (context.watch<EditCubit>().state.endTimeTemp ??
                      DateTime.now()),
              onDaySelected: (selectedDay, focusedDay) {
                if (widget.type == Type.start) {
                  context.read<EditCubit>().updateStartDateTemp(selectedDay);
                }

                if (widget.type == Type.end) {
                  print('//update end date');
                  context.read<EditCubit>().updateEndDateTemp(selectedDay);
                }
              },
              firstDay: DateTime(2010, 1, 1),
              lastDay: widget.type == Type.end
                  ? DateTime.now()
                  : DateTime(2028, 12, 31),
              headerStyle: const HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                leftChevronMargin: EdgeInsets.only(left: 35),
                rightChevronMargin: EdgeInsets.only(right: 35),
                leftChevronIcon: Icon(
                  Icons.arrow_left,
                  color: themeGrey,
                  size: 30,
                ),
                rightChevronIcon: Icon(
                  Icons.arrow_right,
                  color: themeGrey,
                  size: 30,
                ),
              ),
              calendarBuilders: CalendarBuilders(
                headerTitleBuilder: (context, day) {
                  return Center(
                    child: Text(
                      '${AppUtils.monthFromInt(day.month)} ${day.year}',
                      style: titleOne.copyWith(color: themeDark),
                    ),
                  );
                },
                selectedBuilder: (context, day, focusedDay) {
                  return Center(
                    child: Container(
                      height: 28,
                      width: 28,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: themeBlue,
                      ),
                      child: Center(
                        child: Text(
                          day.day.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
                todayBuilder: (context, day, focusedDay) {
                  if (day == focusedDay) {
                    if (widget.type == Type.end &&
                        context.read<EditCubit>().state.endTimeTemp == null) {
                      return Center(
                        child: Container(
                          height: 28,
                          width: 28,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: themeBlue),
                          ),
                          child: Center(
                            child: Text(
                              day.day.toString(),
                              style: const TextStyle(color: themeBlue),
                            ),
                          ),
                        ),
                      );
                    }
                    return Center(
                      child: Container(
                        height: 28,
                        width: 28,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: themeBlue,
                        ),
                        child: Center(
                          child: Text(
                            day.day.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  }
                  return Center(
                    child: Container(
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: themeBlue),
                      ),
                      child: Center(
                        child: Text(
                          day.day.toString(),
                          style: const TextStyle(color: themeBlue),
                        ),
                      ),
                    ),
                  );
                },
                defaultBuilder: (context, day, focusedDay) {
                  if (day == focusedDay) {
                    return Center(
                      child: Container(
                        height: 28,
                        width: 28,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: themeBlue,
                        ),
                        child: Center(
                          child: Text(
                            day.day.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  }

                  return Center(
                    child: SizedBox(
                      height: 28,
                      width: 28,
                      child: Center(
                        child: Text(
                          day.day.toString(),
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 0.2,
              color: themeGrey,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.event, color: themeBlue),
                            const SizedBox(width: 8),
                            if (widget.type == Type.start)
                              context.watch<EditCubit>().state.startTimeTemp ==
                                      null
                                  ? Text(
                                      'No Date',
                                      style: formText,
                                    )
                                  : Text(
                                      AppUtils.isToday(context
                                              .watch<EditCubit>()
                                              .state
                                              .startTimeTemp)
                                          ? 'Today'
                                          : AppUtils.formatDate(context
                                              .watch<EditCubit>()
                                              .state
                                              .startTimeTemp),
                                      style: formText,
                                    ),
                            if (widget.type == Type.end)
                              context.watch<EditCubit>().state.endTimeTemp ==
                                      null
                                  ? Text(
                                      'No Date',
                                      style: formText,
                                    )
                                  : Text(
                                      AppUtils.isToday(context
                                              .watch<EditCubit>()
                                              .state
                                              .endTimeTemp)
                                          ? 'Today'
                                          : AppUtils.formatDate(context
                                              .watch<EditCubit>()
                                              .state
                                              .endTimeTemp),
                                      style: formText,
                                    ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(themeLightBlue),
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
                          if (widget.type == Type.start) {
                            context.read<EditCubit>().updateStartDate(
                                  context
                                          .read<EditCubit>()
                                          .state
                                          .startTimeTemp ??
                                      DateTime.now(),
                                );
                          }
                          if (widget.type == Type.end) {
                            context.read<EditCubit>().updateEndDate(
                                  context.read<EditCubit>().state.endTimeTemp,
                                );
                          }
                          context.pop();
                        },
                        child: Text(
                          'Save',
                          style: formSubmitPrimary,
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum Selectors {
  today(text: 'Today', val: 0),
  nextMonday(text: 'Next Monday', val: 8),
  nextTuesday(text: 'Next Tuesday', val: 9),
  afterOneWeek(text: 'After 1 Week', val: 7),
  noDate(text: 'No date', val: -1);

  const Selectors({required this.text, required this.val});
  final String text;
  final int val;
}

enum Type {
  start,
  end;
}

class CalendarSelectorWidget extends StatefulWidget {
  const CalendarSelectorWidget({
    super.key,
    required this.selector,
    required this.isSelected,
    required this.type,
  });

  final Selectors selector;
  final bool isSelected;
  final Type type;

  @override
  State<CalendarSelectorWidget> createState() =>
      _CalendarSelectorWidgetWidgetState();
}

class _CalendarSelectorWidgetWidgetState extends State<CalendarSelectorWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context
          .read<EditCubit>()
          .updateSelector(widget.selector, widget.type),
      child: Container(
        height: 36,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: widget.isSelected ? themeBlue : themeLightBlue,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            widget.selector.text,
            style: formText.copyWith(
              color: widget.isSelected ? Colors.white : themeBlue,
            ),
          ),
        ),
      ),
    );
  }
}
