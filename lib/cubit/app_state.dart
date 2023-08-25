part of 'app_cubit.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(<Employee>[]) List<Employee> employees,
    @Default(<Employee>[]) List<Employee> currentEmployees,
    @Default(<Employee>[]) List<Employee> previousEmployees,
    required bool onDelete,
    required bool isLoading,
    String? lastDeletedUuid,
  }) = _AppState;
}
