// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grouped_hands.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupedHands _$GroupedHandsFromJson(Map<String, dynamic> json) {
  return _GroupedHands.fromJson(json);
}

/// @nodoc
mixin _$GroupedHands {
  bool get isExpaned => throw _privateConstructorUsedError;
  List<PokerHand> get pokerHands => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupedHandsCopyWith<GroupedHands> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupedHandsCopyWith<$Res> {
  factory $GroupedHandsCopyWith(GroupedHands value, $Res Function(GroupedHands) then) =
      _$GroupedHandsCopyWithImpl<$Res, GroupedHands>;
  @useResult
  $Res call({bool isExpaned, List<PokerHand> pokerHands});
}

/// @nodoc
class _$GroupedHandsCopyWithImpl<$Res, $Val extends GroupedHands> implements $GroupedHandsCopyWith<$Res> {
  _$GroupedHandsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isExpaned = null,
    Object? pokerHands = null,
  }) {
    return _then(_value.copyWith(
      isExpaned: null == isExpaned
          ? _value.isExpaned
          : isExpaned // ignore: cast_nullable_to_non_nullable
              as bool,
      pokerHands: null == pokerHands
          ? _value.pokerHands
          : pokerHands // ignore: cast_nullable_to_non_nullable
              as List<PokerHand>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupedHandsImplCopyWith<$Res> implements $GroupedHandsCopyWith<$Res> {
  factory _$$GroupedHandsImplCopyWith(_$GroupedHandsImpl value, $Res Function(_$GroupedHandsImpl) then) =
      __$$GroupedHandsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isExpaned, List<PokerHand> pokerHands});
}

/// @nodoc
class __$$GroupedHandsImplCopyWithImpl<$Res> extends _$GroupedHandsCopyWithImpl<$Res, _$GroupedHandsImpl>
    implements _$$GroupedHandsImplCopyWith<$Res> {
  __$$GroupedHandsImplCopyWithImpl(_$GroupedHandsImpl _value, $Res Function(_$GroupedHandsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isExpaned = null,
    Object? pokerHands = null,
  }) {
    return _then(_$GroupedHandsImpl(
      isExpaned: null == isExpaned
          ? _value.isExpaned
          : isExpaned // ignore: cast_nullable_to_non_nullable
              as bool,
      pokerHands: null == pokerHands
          ? _value._pokerHands
          : pokerHands // ignore: cast_nullable_to_non_nullable
              as List<PokerHand>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupedHandsImpl implements _GroupedHands {
  _$GroupedHandsImpl({required this.isExpaned, required final List<PokerHand> pokerHands}) : _pokerHands = pokerHands;

  factory _$GroupedHandsImpl.fromJson(Map<String, dynamic> json) => _$$GroupedHandsImplFromJson(json);

  @override
  final bool isExpaned;
  final List<PokerHand> _pokerHands;
  @override
  List<PokerHand> get pokerHands {
    if (_pokerHands is EqualUnmodifiableListView) return _pokerHands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pokerHands);
  }

  @override
  String toString() {
    return 'GroupedHands(isExpaned: $isExpaned, pokerHands: $pokerHands)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupedHandsImpl &&
            (identical(other.isExpaned, isExpaned) || other.isExpaned == isExpaned) &&
            const DeepCollectionEquality().equals(other._pokerHands, _pokerHands));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isExpaned, const DeepCollectionEquality().hash(_pokerHands));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupedHandsImplCopyWith<_$GroupedHandsImpl> get copyWith =>
      __$$GroupedHandsImplCopyWithImpl<_$GroupedHandsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupedHandsImplToJson(
      this,
    );
  }
}

abstract class _GroupedHands implements GroupedHands {
  factory _GroupedHands({required final bool isExpaned, required final List<PokerHand> pokerHands}) =
      _$GroupedHandsImpl;

  factory _GroupedHands.fromJson(Map<String, dynamic> json) = _$GroupedHandsImpl.fromJson;

  @override
  bool get isExpaned;
  @override
  List<PokerHand> get pokerHands;
  @override
  @JsonKey(ignore: true)
  _$$GroupedHandsImplCopyWith<_$GroupedHandsImpl> get copyWith => throw _privateConstructorUsedError;
}
