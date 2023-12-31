part of 'edit_cubit.dart';

@freezed
class EditState with _$EditState {
  const factory EditState({
    Employee? employee,
    String? name,
    Designation? designation,
    DateTime? startTime,
    DateTime? endTime,
    Selectors? selector,
    DateTime? startTimeTemp,
    DateTime? endTimeTemp,
  }) = _EditState;
}
