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

  void updateStartDate(DateTime val) => emit(state.copyWith(startTime: val));

  void updateEndDate(DateTime val) => emit(state.copyWith(endTime: val));
}
