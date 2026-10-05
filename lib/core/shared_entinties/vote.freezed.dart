// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Vote {

 String get id; String get competitionId; String get voterId; String get targetEntryId; int get txPoints; DateTime get createdAt;
/// Create a copy of Vote
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoteCopyWith<Vote> get copyWith => _$VoteCopyWithImpl<Vote>(this as Vote, _$identity);

  /// Serializes this Vote to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Vote;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Vote&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.competitionId, _this.competitionId) || other.competitionId == _this.competitionId)&&(identical(other.voterId, _this.voterId) || other.voterId == _this.voterId)&&(identical(other.targetEntryId, _this.targetEntryId) || other.targetEntryId == _this.targetEntryId)&&(identical(other.txPoints, _this.txPoints) || other.txPoints == _this.txPoints)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Vote;
  return Object.hash(runtimeType,_this.id,_this.competitionId,_this.voterId,_this.targetEntryId,_this.txPoints,_this.createdAt);
}

@override
String toString() {
  final _this = this as Vote;
  return 'Vote(id: ${_this.id}, competitionId: ${_this.competitionId}, voterId: ${_this.voterId}, targetEntryId: ${_this.targetEntryId}, txPoints: ${_this.txPoints}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $VoteCopyWith<$Res>  {
  factory $VoteCopyWith(Vote value, $Res Function(Vote) _then) = _$VoteCopyWithImpl;
@useResult
$Res call({
 String id, String competitionId, String voterId, String targetEntryId, int txPoints, DateTime createdAt
});




}
/// @nodoc
class _$VoteCopyWithImpl<$Res>
    implements $VoteCopyWith<$Res> {
  _$VoteCopyWithImpl(this._self, this._then);

  final Vote _self;
  final $Res Function(Vote) _then;

/// Create a copy of Vote
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? competitionId = null,Object? voterId = null,Object? targetEntryId = null,Object? txPoints = null,Object? createdAt = null,}) {
  return _then(Vote(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,competitionId: null == competitionId ? _self.competitionId : competitionId // ignore: cast_nullable_to_non_nullable
as String,voterId: null == voterId ? _self.voterId : voterId // ignore: cast_nullable_to_non_nullable
as String,targetEntryId: null == targetEntryId ? _self.targetEntryId : targetEntryId // ignore: cast_nullable_to_non_nullable
as String,txPoints: null == txPoints ? _self.txPoints : txPoints // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Vote].
extension VotePatterns on Vote {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Vote value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Vote() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Vote value)  $default,){
final _that = this;
switch (_that) {
case _Vote():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Vote value)?  $default,){
final _that = this;
switch (_that) {
case _Vote() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String competitionId,  String voterId,  String targetEntryId,  int txPoints,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Vote() when $default != null:
return $default(_that.id,_that.competitionId,_that.voterId,_that.targetEntryId,_that.txPoints,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String competitionId,  String voterId,  String targetEntryId,  int txPoints,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _Vote():
return $default(_that.id,_that.competitionId,_that.voterId,_that.targetEntryId,_that.txPoints,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String competitionId,  String voterId,  String targetEntryId,  int txPoints,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Vote() when $default != null:
return $default(_that.id,_that.competitionId,_that.voterId,_that.targetEntryId,_that.txPoints,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Vote implements Vote {
  const _Vote({required this.id, required this.competitionId, required this.voterId, required this.targetEntryId, this.txPoints = 2, required this.createdAt});
  factory _Vote.fromJson(Map<String, dynamic> json) => _$VoteFromJson(json);

@override final  String id;
@override final  String competitionId;
@override final  String voterId;
@override final  String targetEntryId;
@override@JsonKey() final  int txPoints;
@override final  DateTime createdAt;

/// Create a copy of Vote
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoteCopyWith<_Vote> get copyWith => __$VoteCopyWithImpl<_Vote>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VoteToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Vote&&(identical(other.id, id) || other.id == id)&&(identical(other.competitionId, competitionId) || other.competitionId == competitionId)&&(identical(other.voterId, voterId) || other.voterId == voterId)&&(identical(other.targetEntryId, targetEntryId) || other.targetEntryId == targetEntryId)&&(identical(other.txPoints, txPoints) || other.txPoints == txPoints)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,competitionId,voterId,targetEntryId,txPoints,createdAt);
}

@override
String toString() {
    return 'Vote(id: $id, competitionId: $competitionId, voterId: $voterId, targetEntryId: $targetEntryId, txPoints: $txPoints, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$VoteCopyWith<$Res> implements $VoteCopyWith<$Res> {
  factory _$VoteCopyWith(_Vote value, $Res Function(_Vote) _then) = __$VoteCopyWithImpl;
@override @useResult
$Res call({
 String id, String competitionId, String voterId, String targetEntryId, int txPoints, DateTime createdAt
});




}
/// @nodoc
class __$VoteCopyWithImpl<$Res>
    implements _$VoteCopyWith<$Res> {
  __$VoteCopyWithImpl(this._self, this._then);

  final _Vote _self;
  final $Res Function(_Vote) _then;

/// Create a copy of Vote
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? competitionId = null,Object? voterId = null,Object? targetEntryId = null,Object? txPoints = null,Object? createdAt = null,}) {
  return _then(_Vote(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,competitionId: null == competitionId ? _self.competitionId : competitionId // ignore: cast_nullable_to_non_nullable
as String,voterId: null == voterId ? _self.voterId : voterId // ignore: cast_nullable_to_non_nullable
as String,targetEntryId: null == targetEntryId ? _self.targetEntryId : targetEntryId // ignore: cast_nullable_to_non_nullable
as String,txPoints: null == txPoints ? _self.txPoints : txPoints // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
