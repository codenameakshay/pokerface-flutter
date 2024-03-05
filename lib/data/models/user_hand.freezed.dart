// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_hand.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserHand _$UserHandFromJson(Map<String, dynamic> json) {
  return _UserHand.fromJson(json);
}

/// @nodoc
mixin _$UserHand {
  List<Card> get userCards => throw _privateConstructorUsedError;
  List<Card> get houseCards => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserHandCopyWith<UserHand> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserHandCopyWith<$Res> {
  factory $UserHandCopyWith(UserHand value, $Res Function(UserHand) then) = _$UserHandCopyWithImpl<$Res, UserHand>;
  @useResult
  $Res call({List<Card> userCards, List<Card> houseCards});
}

/// @nodoc
class _$UserHandCopyWithImpl<$Res, $Val extends UserHand> implements $UserHandCopyWith<$Res> {
  _$UserHandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userCards = null,
    Object? houseCards = null,
  }) {
    return _then(_value.copyWith(
      userCards: null == userCards
          ? _value.userCards
          : userCards // ignore: cast_nullable_to_non_nullable
              as List<Card>,
      houseCards: null == houseCards
          ? _value.houseCards
          : houseCards // ignore: cast_nullable_to_non_nullable
              as List<Card>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserHandImplCopyWith<$Res> implements $UserHandCopyWith<$Res> {
  factory _$$UserHandImplCopyWith(_$UserHandImpl value, $Res Function(_$UserHandImpl) then) =
      __$$UserHandImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Card> userCards, List<Card> houseCards});
}

/// @nodoc
class __$$UserHandImplCopyWithImpl<$Res> extends _$UserHandCopyWithImpl<$Res, _$UserHandImpl>
    implements _$$UserHandImplCopyWith<$Res> {
  __$$UserHandImplCopyWithImpl(_$UserHandImpl _value, $Res Function(_$UserHandImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userCards = null,
    Object? houseCards = null,
  }) {
    return _then(_$UserHandImpl(
      userCards: null == userCards
          ? _value._userCards
          : userCards // ignore: cast_nullable_to_non_nullable
              as List<Card>,
      houseCards: null == houseCards
          ? _value._houseCards
          : houseCards // ignore: cast_nullable_to_non_nullable
              as List<Card>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserHandImpl implements _UserHand {
  _$UserHandImpl({required final List<Card> userCards, required final List<Card> houseCards})
      : _userCards = userCards,
        _houseCards = houseCards;

  factory _$UserHandImpl.fromJson(Map<String, dynamic> json) => _$$UserHandImplFromJson(json);

  final List<Card> _userCards;
  @override
  List<Card> get userCards {
    if (_userCards is EqualUnmodifiableListView) return _userCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userCards);
  }

  final List<Card> _houseCards;
  @override
  List<Card> get houseCards {
    if (_houseCards is EqualUnmodifiableListView) return _houseCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_houseCards);
  }

  @override
  String toString() {
    return 'UserHand(userCards: $userCards, houseCards: $houseCards)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserHandImpl &&
            const DeepCollectionEquality().equals(other._userCards, _userCards) &&
            const DeepCollectionEquality().equals(other._houseCards, _houseCards));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_userCards), const DeepCollectionEquality().hash(_houseCards));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserHandImplCopyWith<_$UserHandImpl> get copyWith =>
      __$$UserHandImplCopyWithImpl<_$UserHandImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserHandImplToJson(
      this,
    );
  }
}

abstract class _UserHand implements UserHand {
  factory _UserHand({required final List<Card> userCards, required final List<Card> houseCards}) = _$UserHandImpl;

  factory _UserHand.fromJson(Map<String, dynamic> json) = _$UserHandImpl.fromJson;

  @override
  List<Card> get userCards;
  @override
  List<Card> get houseCards;
  @override
  @JsonKey(ignore: true)
  _$$UserHandImplCopyWith<_$UserHandImpl> get copyWith => throw _privateConstructorUsedError;
}
