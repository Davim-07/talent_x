// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Entry {

 String get id; String get competitionId; String get artistId; String get mediaUrl; bool get isAnonymous; bool get aiFlagged; int get artistVotesCount; double? get juryScore;
/// Create a copy of Entry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntryCopyWith<Entry> get copyWith => _$EntryCopyWithImpl<Entry>(this as Entry, _$identity);

  /// Serializes this Entry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Entry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Entry&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.competitionId, _this.competitionId) || other.competitionId == _this.competitionId)&&(identical(other.artistId, _this.artistId) || other.artistId == _this.artistId)&&(identical(other.mediaUrl, _this.mediaUrl) || other.mediaUrl == _this.mediaUrl)&&(identical(other.isAnonymous, _this.isAnonymous) || other.isAnonymous == _this.isAnonymous)&&(identical(other.aiFlagged, _this.aiFlagged) || other.aiFlagged == _this.aiFlagged)&&(identical(other.artistVotesCount, _this.artistVotesCount) || other.artistVotesCount == _this.artistVotesCount)&&(identical(other.juryScore, _this.juryScore) || other.juryScore == _this.juryScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Entry;
  return Object.hash(runtimeType,_this.id,_this.competitionId,_this.artistId,_this.mediaUrl,_this.isAnonymous,_this.aiFlagged,_this.artistVotesCount,_this.juryScore);
}

@override
String toString() {
  final _this = this as Entry;
  return 'Entry(id: ${_this.id}, competitionId: ${_this.competitionId}, artistId: ${_this.artistId}, mediaUrl: ${_this.mediaUrl}, isAnonymous: ${_this.isAnonymous}, aiFlagged: ${_this.aiFlagged}, artistVotesCount: ${_this.artistVotesCount}, juryScore: ${_this.juryScore})';
}


}

/// @nodoc
abstract mixin class $EntryCopyWith<$Res>  {
  factory $EntryCopyWith(Entry value, $Res Function(Entry) _then) = _$EntryCopyWithImpl;
@useResult
$Res call({
 String id, String competitionId, String artistId, String mediaUrl, bool isAnonymous, bool aiFlagged, int artistVotesCount, double? juryScore
});




}
/// @nodoc
class _$EntryCopyWithImpl<$Res>
    implements $EntryCopyWith<$Res> {
  _$EntryCopyWithImpl(this._self, this._then);

  final Entry _self;
  final $Res Function(Entry) _then;

/// Create a copy of Entry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? competitionId = null,Object? artistId = null,Object? mediaUrl = null,Object? isAnonymous = null,Object? aiFlagged = null,Object? artistVotesCount = null,Object? juryScore = freezed,}) {
  return _then(Entry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,competitionId: null == competitionId ? _self.competitionId : competitionId // ignore: cast_nullable_to_non_nullable
as String,artistId: null == artistId ? _self.artistId : artistId // ignore: cast_nullable_to_non_nullable
as String,mediaUrl: null == mediaUrl ? _self.mediaUrl : mediaUrl // ignore: cast_nullable_to_non_nullable
as String,isAnonymous: null == isAnonymous ? _self.isAnonymous : isAnonymous // ignore: cast_nullable_to_non_nullable
as bool,aiFlagged: null == aiFlagged ? _self.aiFlagged : aiFlagged // ignore: cast_nullable_to_non_nullable
as bool,artistVotesCount: null == artistVotesCount ? _self.artistVotesCount : artistVotesCount // ignore: cast_nullable_to_non_nullable
as int,juryScore: freezed == juryScore ? _self.juryScore : juryScore // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [Entry].
extension EntryPatterns on Entry {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Entry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Entry() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Entry value)  $default,){
final _that = this;
switch (_that) {
case _Entry():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Entry value)?  $default,){
final _that = this;
switch (_that) {
case _Entry() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String competitionId,  String artistId,  String mediaUrl,  bool isAnonymous,  bool aiFlagged,  int artistVotesCount,  double? juryScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Entry() when $default != null:
return $default(_that.id,_that.competitionId,_that.artistId,_that.mediaUrl,_that.isAnonymous,_that.aiFlagged,_that.artistVotesCount,_that.juryScore);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String competitionId,  String artistId,  String mediaUrl,  bool isAnonymous,  bool aiFlagged,  int artistVotesCount,  double? juryScore)  $default,) {final _that = this;
switch (_that) {
case _Entry():
return $default(_that.id,_that.competitionId,_that.artistId,_that.mediaUrl,_that.isAnonymous,_that.aiFlagged,_that.artistVotesCount,_that.juryScore);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String competitionId,  String artistId,  String mediaUrl,  bool isAnonymous,  bool aiFlagged,  int artistVotesCount,  double? juryScore)?  $default,) {final _that = this;
switch (_that) {
case _Entry() when $default != null:
return $default(_that.id,_that.competitionId,_that.artistId,_that.mediaUrl,_that.isAnonymous,_that.aiFlagged,_that.artistVotesCount,_that.juryScore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Entry implements Entry {
  const _Entry({required this.id, required this.competitionId, required this.artistId, required this.mediaUrl, this.isAnonymous = true, this.aiFlagged = false, this.artistVotesCount = 0, this.juryScore});
  factory _Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);

@override final  String id;
@override final  String competitionId;
@override final  String artistId;
@override final  String mediaUrl;
@override@JsonKey() final  bool isAnonymous;
@override@JsonKey() final  bool aiFlagged;
@override@JsonKey() final  int artistVotesCount;
@override final  double? juryScore;

/// Create a copy of Entry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EntryCopyWith<_Entry> get copyWith => __$EntryCopyWithImpl<_Entry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EntryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Entry&&(identical(other.id, id) || other.id == id)&&(identical(other.competitionId, competitionId) || other.competitionId == competitionId)&&(identical(other.artistId, artistId) || other.artistId == artistId)&&(identical(other.mediaUrl, mediaUrl) || other.mediaUrl == mediaUrl)&&(identical(other.isAnonymous, isAnonymous) || other.isAnonymous == isAnonymous)&&(identical(other.aiFlagged, aiFlagged) || other.aiFlagged == aiFlagged)&&(identical(other.artistVotesCount, artistVotesCount) || other.artistVotesCount == artistVotesCount)&&(identical(other.juryScore, juryScore) || other.juryScore == juryScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,competitionId,artistId,mediaUrl,isAnonymous,aiFlagged,artistVotesCount,juryScore);
}

@override
String toString() {
    return 'Entry(id: $id, competitionId: $competitionId, artistId: $artistId, mediaUrl: $mediaUrl, isAnonymous: $isAnonymous, aiFlagged: $aiFlagged, artistVotesCount: $artistVotesCount, juryScore: $juryScore)';
}


}

/// @nodoc
abstract mixin class _$EntryCopyWith<$Res> implements $EntryCopyWith<$Res> {
  factory _$EntryCopyWith(_Entry value, $Res Function(_Entry) _then) = __$EntryCopyWithImpl;
@override @useResult
$Res call({
 String id, String competitionId, String artistId, String mediaUrl, bool isAnonymous, bool aiFlagged, int artistVotesCount, double? juryScore
});




}
/// @nodoc
class __$EntryCopyWithImpl<$Res>
    implements _$EntryCopyWith<$Res> {
  __$EntryCopyWithImpl(this._self, this._then);

  final _Entry _self;
  final $Res Function(_Entry) _then;

/// Create a copy of Entry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? competitionId = null,Object? artistId = null,Object? mediaUrl = null,Object? isAnonymous = null,Object? aiFlagged = null,Object? artistVotesCount = null,Object? juryScore = freezed,}) {
  return _then(_Entry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,competitionId: null == competitionId ? _self.competitionId : competitionId // ignore: cast_nullable_to_non_nullable
as String,artistId: null == artistId ? _self.artistId : artistId // ignore: cast_nullable_to_non_nullable
as String,mediaUrl: null == mediaUrl ? _self.mediaUrl : mediaUrl // ignore: cast_nullable_to_non_nullable
as String,isAnonymous: null == isAnonymous ? _self.isAnonymous : isAnonymous // ignore: cast_nullable_to_non_nullable
as bool,aiFlagged: null == aiFlagged ? _self.aiFlagged : aiFlagged // ignore: cast_nullable_to_non_nullable
as bool,artistVotesCount: null == artistVotesCount ? _self.artistVotesCount : artistVotesCount // ignore: cast_nullable_to_non_nullable
as int,juryScore: freezed == juryScore ? _self.juryScore : juryScore // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
