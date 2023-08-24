import 'package:employee_management/core/edit/view/calendar_view.dart';
import 'package:employee_management/utils/app_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:employee_management/models/designation.dart';
import 'package:employee_management/models/employee.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_state.dart';
part 'edit_cubit.freezed.dart';

class EditCubit extends Cubit<EditState> {
  EditCubit() : super(const EditState());

  void updateNameString(String val) => emit(state.copyWith(name: val));

  void updateDesignation(Designation val) =>
      emit(state.copyWith(designation: val));

  void updateStartDateTemp(DateTime val) {
    //check if date fullfils selector criterion & emit
    Selectors? selector;

    if (AppUtils.isNextMonday(val)) {
      selector = Selectors.nextMonday;
    }

    if (AppUtils.isNextTuesday(val)) {
      selector = Selectors.nextTuesday;
    }

    if (AppUtils.isAfterOneWeek(val)) {
      selector = Selectors.afterOneWeek;
    }

    if (AppUtils.isToday(val)) {
      selector = Selectors.today;
    }

    emit(state.copyWith(startTimeTemp: val, selector: selector));
  }

  void updateStartDate(DateTime val) => emit(state.copyWith(startTime: val));

  void updateEndDateTemp(DateTime val) {
    Selectors? selector;
    if (AppUtils.isToday(val)) {
      selector = Selectors.today;
    }
    emit(state.copyWith(endTimeTemp: val, selector: selector));
  }

  void updateEndDate(DateTime? val) => emit(state.copyWith(endTime: val));

  void updateSelector(Selectors selector, Type type) {
    //switch selector and emit new date

    final date = AppUtils.afterSome(selector: selector);

    emit(
      state.copyWith(
        selector: selector,
        startTimeTemp: type == Type.start ? date : state.startTime,
        endTimeTemp: type == Type.end ? date : state.endTime,
      ),
    );
  }
}
