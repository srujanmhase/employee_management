// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppState {
  List<Employee> get employees => throw _privateConstructorUsedError;
  List<Employee> get currentEmployees => throw _privateConstructorUsedError;
  List<Employee> get previousEmployees => throw _privateConstructorUsedError;
  bool get onDelete => throw _privateConstructorUsedError;
  String? get lastDeletedUuid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {List<Employee> employees,
      List<Employee> currentEmployees,
      List<Employee> previousEmployees,
      bool onDelete,
      String? lastDeletedUuid});
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employees = null,
    Object? currentEmployees = null,
    Object? previousEmployees = null,
    Object? onDelete = null,
    Object? lastDeletedUuid = freezed,
  }) {
    return _then(_value.copyWith(
      employees: null == employees
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as List<Employee>,
      currentEmployees: null == currentEmployees
          ? _value.currentEmployees
          : currentEmployees // ignore: cast_nullable_to_non_nullable
              as List<Employee>,
      previousEmployees: null == previousEmployees
          ? _value.previousEmployees
          : previousEmployees // ignore: cast_nullable_to_non_nullable
              as List<Employee>,
      onDelete: null == onDelete
          ? _value.onDelete
          : onDelete // ignore: cast_nullable_to_non_nullable
              as bool,
      lastDeletedUuid: freezed == lastDeletedUuid
          ? _value.lastDeletedUuid
          : lastDeletedUuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$$_AppStateCopyWith(
          _$_AppState value, $Res Function(_$_AppState) then) =
      __$$_AppStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Employee> employees,
      List<Employee> currentEmployees,
      List<Employee> previousEmployees,
      bool onDelete,
      String? lastDeletedUuid});
}

/// @nodoc
class __$$_AppStateCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$_AppState>
    implements _$$_AppStateCopyWith<$Res> {
  __$$_AppStateCopyWithImpl(
      _$_AppState _value, $Res Function(_$_AppState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employees = null,
    Object? currentEmployees = null,
    Object? previousEmployees = null,
    Object? onDelete = null,
    Object? lastDeletedUuid = freezed,
  }) {
    return _then(_$_AppState(
      employees: null == employees
          ? _value._employees
          : employees // ignore: cast_nullable_to_non_nullable
              as List<Employee>,
      currentEmployees: null == currentEmployees
          ? _value._currentEmployees
          : currentEmployees // ignore: cast_nullable_to_non_nullable
              as List<Employee>,
      previousEmployees: null == previousEmployees
          ? _value._previousEmployees
          : previousEmployees // ignore: cast_nullable_to_non_nullable
              as List<Employee>,
      onDelete: null == onDelete
          ? _value.onDelete
          : onDelete // ignore: cast_nullable_to_non_nullable
              as bool,
      lastDeletedUuid: freezed == lastDeletedUuid
          ? _value.lastDeletedUuid
          : lastDeletedUuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AppState implements _AppState {
  const _$_AppState(
      {final List<Employee> employees = const <Employee>[],
      final List<Employee> currentEmployees = const <Employee>[],
      final List<Employee> previousEmployees = const <Employee>[],
      required this.onDelete,
      this.lastDeletedUuid})
      : _employees = employees,
        _currentEmployees = currentEmployees,
        _previousEmployees = previousEmployees;

  final List<Employee> _employees;
  @override
  @JsonKey()
  List<Employee> get employees {
    if (_employees is EqualUnmodifiableListView) return _employees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_employees);
  }

  final List<Employee> _currentEmployees;
  @override
  @JsonKey()
  List<Employee> get currentEmployees {
    if (_currentEmployees is EqualUnmodifiableListView)
      return _currentEmployees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currentEmployees);
  }

  final List<Employee> _previousEmployees;
  @override
  @JsonKey()
  List<Employee> get previousEmployees {
    if (_previousEmployees is EqualUnmodifiableListView)
      return _previousEmployees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_previousEmployees);
  }

  @override
  final bool onDelete;
  @override
  final String? lastDeletedUuid;

  @override
  String toString() {
    return 'AppState(employees: $employees, currentEmployees: $currentEmployees, previousEmployees: $previousEmployees, onDelete: $onDelete, lastDeletedUuid: $lastDeletedUuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppState &&
            const DeepCollectionEquality()
                .equals(other._employees, _employees) &&
            const DeepCollectionEquality()
                .equals(other._currentEmployees, _currentEmployees) &&
            const DeepCollectionEquality()
                .equals(other._previousEmployees, _previousEmployees) &&
            (identical(other.onDelete, onDelete) ||
                other.onDelete == onDelete) &&
            (identical(other.lastDeletedUuid, lastDeletedUuid) ||
                other.lastDeletedUuid == lastDeletedUuid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_employees),
      const DeepCollectionEquality().hash(_currentEmployees),
      const DeepCollectionEquality().hash(_previousEmployees),
      onDelete,
      lastDeletedUuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      __$$_AppStateCopyWithImpl<_$_AppState>(this, _$identity);
}

abstract class _AppState implements AppState {
  const factory _AppState(
      {final List<Employee> employees,
      final List<Employee> currentEmployees,
      final List<Employee> previousEmployees,
      required final bool onDelete,
      final String? lastDeletedUuid}) = _$_AppState;

  @override
  List<Employee> get employees;
  @override
  List<Employee> get currentEmployees;
  @override
  List<Employee> get previousEmployees;
  @override
  bool get onDelete;
  @override
  String? get lastDeletedUuid;
  @override
  @JsonKey(ignore: true)
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      throw _privateConstructorUsedError;
}
