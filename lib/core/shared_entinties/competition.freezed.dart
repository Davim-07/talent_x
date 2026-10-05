// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'competition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Competition {

 String get id; String get title; String get subtitle; String get description; String get category; bool get isBigEvent; String get status; DateTime get entryDeadline; DateTime get endDate;
/// Create a copy of Competition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompetitionCopyWith<Competition> get copyWith => _$CompetitionCopyWithImpl<Competition>(this as Competition, _$identity);

  /// Serializes this Competition to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Competition;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Competition&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.subtitle, _this.subtitle) || other.subtitle == _this.subtitle)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.isBigEvent, _this.isBigEvent) || other.isBigEvent == _this.isBigEvent)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.entryDeadline, _this.entryDeadline) || other.entryDeadline == _this.entryDeadline)&&(identical(other.endDate, _this.endDate) || other.endDate == _this.endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Competition;
  return Object.hash(runtimeType,_this.id,_this.title,_this.subtitle,_this.description,_this.category,_this.isBigEvent,_this.status,_this.entryDeadline,_this.endDate);
}

@override
String toString() {
  final _this = this as Competition;
  return 'Competition(id: ${_this.id}, title: ${_this.title}, subtitle: ${_this.subtitle}, description: ${_this.description}, category: ${_this.category}, isBigEvent: ${_this.isBigEvent}, status: ${_this.status}, entryDeadline: ${_this.entryDeadline}, endDate: ${_this.endDate})';
}


}

/// @nodoc
abstract mixin class $CompetitionCopyWith<$Res>  {
  factory $CompetitionCopyWith(Competition value, $Res Function(Competition) _then) = _$CompetitionCopyWithImpl;
@useResult
$Res call({
 String id, String title, String subtitle, String description, String category, bool isBigEvent, String status, DateTime entryDeadline, DateTime endDate
});




}
/// @nodoc
class _$CompetitionCopyWithImpl<$Res>
    implements $CompetitionCopyWith<$Res> {
  _$CompetitionCopyWithImpl(this._self, this._then);

  final Competition _self;
  final $Res Function(Competition) _then;

/// Create a copy of Competition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? subtitle = null,Object? description = null,Object? category = null,Object? isBigEvent = null,Object? status = null,Object? entryDeadline = null,Object? endDate = null,}) {
  return _then(Competition(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,isBigEvent: null == isBigEvent ? _self.isBigEvent : isBigEvent // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,entryDeadline: null == entryDeadline ? _self.entryDeadline : entryDeadline // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Competition].
extension CompetitionPatterns on Competition {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Competition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Competition() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Competition value)  $default,){
final _that = this;
switch (_that) {
case _Competition():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Competition value)?  $default,){
final _that = this;
switch (_that) {
case _Competition() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String subtitle,  String description,  String category,  bool isBigEvent,  String status,  DateTime entryDeadline,  DateTime endDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Competition() when $default != null:
return $default(_that.id,_that.title,_that.subtitle,_that.description,_that.category,_that.isBigEvent,_that.status,_that.entryDeadline,_that.endDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String subtitle,  String description,  String category,  bool isBigEvent,  String status,  DateTime entryDeadline,  DateTime endDate)  $default,) {final _that = this;
switch (_that) {
case _Competition():
return $default(_that.id,_that.title,_that.subtitle,_that.description,_that.category,_that.isBigEvent,_that.status,_that.entryDeadline,_that.endDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String subtitle,  String description,  String category,  bool isBigEvent,  String status,  DateTime entryDeadline,  DateTime endDate)?  $default,) {final _that = this;
switch (_that) {
case _Competition() when $default != null:
return $default(_that.id,_that.title,_that.subtitle,_that.description,_that.category,_that.isBigEvent,_that.status,_that.entryDeadline,_that.endDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Competition implements Competition {
  const _Competition({required this.id, required this.title, required this.subtitle, required this.description, required this.category, required this.isBigEvent, required this.status, required this.entryDeadline, required this.endDate});
  factory _Competition.fromJson(Map<String, dynamic> json) => _$CompetitionFromJson(json);

@override final  String id;
@override final  String title;
@override final  String subtitle;
@override final  String description;
@override final  String category;
@override final  bool isBigEvent;
@override final  String status;
@override final  DateTime entryDeadline;
@override final  DateTime endDate;

/// Create a copy of Competition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompetitionCopyWith<_Competition> get copyWith => __$CompetitionCopyWithImpl<_Competition>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompetitionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Competition&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.isBigEvent, isBigEvent) || other.isBigEvent == isBigEvent)&&(identical(other.status, status) || other.status == status)&&(identical(other.entryDeadline, entryDeadline) || other.entryDeadline == entryDeadline)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,subtitle,description,category,isBigEvent,status,entryDeadline,endDate);
}

@override
String toString() {
    return 'Competition(id: $id, title: $title, subtitle: $subtitle, description: $description, category: $category, isBigEvent: $isBigEvent, status: $status, entryDeadline: $entryDeadline, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$CompetitionCopyWith<$Res> implements $CompetitionCopyWith<$Res> {
  factory _$CompetitionCopyWith(_Competition value, $Res Function(_Competition) _then) = __$CompetitionCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String subtitle, String description, String category, bool isBigEvent, String status, DateTime entryDeadline, DateTime endDate
});




}
/// @nodoc
class __$CompetitionCopyWithImpl<$Res>
    implements _$CompetitionCopyWith<$Res> {
  __$CompetitionCopyWithImpl(this._self, this._then);

  final _Competition _self;
  final $Res Function(_Competition) _then;

/// Create a copy of Competition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? subtitle = null,Object? description = null,Object? category = null,Object? isBigEvent = null,Object? status = null,Object? entryDeadline = null,Object? endDate = null,}) {
  return _then(_Competition(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,isBigEvent: null == isBigEvent ? _self.isBigEvent : isBigEvent // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,entryDeadline: null == entryDeadline ? _self.entryDeadline : entryDeadline // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
