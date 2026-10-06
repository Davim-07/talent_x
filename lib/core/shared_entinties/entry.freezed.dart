// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Entry _$EntryFromJson(Map<String, dynamic> json) {
  return _Entry.fromJson(json);
}

/// @nodoc
mixin _$Entry {
  String get id => throw _privateConstructorUsedError;
  String get competitionId => throw _privateConstructorUsedError;
  String get artistId => throw _privateConstructorUsedError;
  String get mediaUrl => throw _privateConstructorUsedError;
  bool get isAnonymous => throw _privateConstructorUsedError;
  bool get aiFlagged => throw _privateConstructorUsedError;
  int get artistVotesCount => throw _privateConstructorUsedError;
  double? get juryScore => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EntryCopyWith<Entry> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntryCopyWith<$Res> {
  factory $EntryCopyWith(Entry value, $Res Function(Entry) then) =
      _$EntryCopyWithImpl<$Res, Entry>;
  @useResult
  $Res call(
      {String id,
      String competitionId,
      String artistId,
      String mediaUrl,
      bool isAnonymous,
      bool aiFlagged,
      int artistVotesCount,
      double? juryScore});
}

/// @nodoc
class _$EntryCopyWithImpl<$Res, $Val extends Entry>
    implements $EntryCopyWith<$Res> {
  _$EntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? competitionId = null,
    Object? artistId = null,
    Object? mediaUrl = null,
    Object? isAnonymous = null,
    Object? aiFlagged = null,
    Object? artistVotesCount = null,
    Object? juryScore = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      competitionId: null == competitionId
          ? _value.competitionId
          : competitionId // ignore: cast_nullable_to_non_nullable
              as String,
      artistId: null == artistId
          ? _value.artistId
          : artistId // ignore: cast_nullable_to_non_nullable
              as String,
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isAnonymous: null == isAnonymous
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      aiFlagged: null == aiFlagged
          ? _value.aiFlagged
          : aiFlagged // ignore: cast_nullable_to_non_nullable
              as bool,
      artistVotesCount: null == artistVotesCount
          ? _value.artistVotesCount
          : artistVotesCount // ignore: cast_nullable_to_non_nullable
              as int,
      juryScore: freezed == juryScore
          ? _value.juryScore
          : juryScore // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EntryImplCopyWith<$Res> implements $EntryCopyWith<$Res> {
  factory _$$EntryImplCopyWith(
          _$EntryImpl value, $Res Function(_$EntryImpl) then) =
      __$$EntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String competitionId,
      String artistId,
      String mediaUrl,
      bool isAnonymous,
      bool aiFlagged,
      int artistVotesCount,
      double? juryScore});
}

/// @nodoc
class __$$EntryImplCopyWithImpl<$Res>
    extends _$EntryCopyWithImpl<$Res, _$EntryImpl>
    implements _$$EntryImplCopyWith<$Res> {
  __$$EntryImplCopyWithImpl(
      _$EntryImpl _value, $Res Function(_$EntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? competitionId = null,
    Object? artistId = null,
    Object? mediaUrl = null,
    Object? isAnonymous = null,
    Object? aiFlagged = null,
    Object? artistVotesCount = null,
    Object? juryScore = freezed,
  }) {
    return _then(_$EntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      competitionId: null == competitionId
          ? _value.competitionId
          : competitionId // ignore: cast_nullable_to_non_nullable
              as String,
      artistId: null == artistId
          ? _value.artistId
          : artistId // ignore: cast_nullable_to_non_nullable
              as String,
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isAnonymous: null == isAnonymous
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      aiFlagged: null == aiFlagged
          ? _value.aiFlagged
          : aiFlagged // ignore: cast_nullable_to_non_nullable
              as bool,
      artistVotesCount: null == artistVotesCount
          ? _value.artistVotesCount
          : artistVotesCount // ignore: cast_nullable_to_non_nullable
              as int,
      juryScore: freezed == juryScore
          ? _value.juryScore
          : juryScore // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EntryImpl implements _Entry {
  const _$EntryImpl(
      {required this.id,
      required this.competitionId,
      required this.artistId,
      required this.mediaUrl,
      this.isAnonymous = true,
      this.aiFlagged = false,
      this.artistVotesCount = 0,
      this.juryScore});

  factory _$EntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$EntryImplFromJson(json);

  @override
  final String id;
  @override
  final String competitionId;
  @override
  final String artistId;
  @override
  final String mediaUrl;
  @override
  @JsonKey()
  final bool isAnonymous;
  @override
  @JsonKey()
  final bool aiFlagged;
  @override
  @JsonKey()
  final int artistVotesCount;
  @override
  final double? juryScore;

  @override
  String toString() {
    return 'Entry(id: $id, competitionId: $competitionId, artistId: $artistId, mediaUrl: $mediaUrl, isAnonymous: $isAnonymous, aiFlagged: $aiFlagged, artistVotesCount: $artistVotesCount, juryScore: $juryScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.competitionId, competitionId) ||
                other.competitionId == competitionId) &&
            (identical(other.artistId, artistId) ||
                other.artistId == artistId) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.isAnonymous, isAnonymous) ||
                other.isAnonymous == isAnonymous) &&
            (identical(other.aiFlagged, aiFlagged) ||
                other.aiFlagged == aiFlagged) &&
            (identical(other.artistVotesCount, artistVotesCount) ||
                other.artistVotesCount == artistVotesCount) &&
            (identical(other.juryScore, juryScore) ||
                other.juryScore == juryScore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, competitionId, artistId,
      mediaUrl, isAnonymous, aiFlagged, artistVotesCount, juryScore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EntryImplCopyWith<_$EntryImpl> get copyWith =>
      __$$EntryImplCopyWithImpl<_$EntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EntryImplToJson(
      this,
    );
  }
}

abstract class _Entry implements Entry {
  const factory _Entry(
      {required final String id,
      required final String competitionId,
      required final String artistId,
      required final String mediaUrl,
      final bool isAnonymous,
      final bool aiFlagged,
      final int artistVotesCount,
      final double? juryScore}) = _$EntryImpl;

  factory _Entry.fromJson(Map<String, dynamic> json) = _$EntryImpl.fromJson;

  @override
  String get id;
  @override
  String get competitionId;
  @override
  String get artistId;
  @override
  String get mediaUrl;
  @override
  bool get isAnonymous;
  @override
  bool get aiFlagged;
  @override
  int get artistVotesCount;
  @override
  double? get juryScore;
  @override
  @JsonKey(ignore: true)
  _$$EntryImplCopyWith<_$EntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
