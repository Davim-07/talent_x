// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfile {

 String get uid; String get email; String get fullName; String get country; String get province; String get district; String get artCategory; String get role; List<String> get medals; String? get assignedCompetitionId;
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileCopyWith<UserProfile> get copyWith => _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserProfile;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfile&&(identical(other.uid, _this.uid) || other.uid == _this.uid)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.fullName, _this.fullName) || other.fullName == _this.fullName)&&(identical(other.country, _this.country) || other.country == _this.country)&&(identical(other.province, _this.province) || other.province == _this.province)&&(identical(other.district, _this.district) || other.district == _this.district)&&(identical(other.artCategory, _this.artCategory) || other.artCategory == _this.artCategory)&&(identical(other.role, _this.role) || other.role == _this.role)&&const DeepCollectionEquality().equals(other.medals, _this.medals)&&(identical(other.assignedCompetitionId, _this.assignedCompetitionId) || other.assignedCompetitionId == _this.assignedCompetitionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserProfile;
  return Object.hash(runtimeType,_this.uid,_this.email,_this.fullName,_this.country,_this.province,_this.district,_this.artCategory,_this.role,const DeepCollectionEquality().hash(_this.medals),_this.assignedCompetitionId);
}

@override
String toString() {
  final _this = this as UserProfile;
  return 'UserProfile(uid: ${_this.uid}, email: ${_this.email}, fullName: ${_this.fullName}, country: ${_this.country}, province: ${_this.province}, district: ${_this.district}, artCategory: ${_this.artCategory}, role: ${_this.role}, medals: ${_this.medals}, assignedCompetitionId: ${_this.assignedCompetitionId})';
}


}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res>  {
  factory $UserProfileCopyWith(UserProfile value, $Res Function(UserProfile) _then) = _$UserProfileCopyWithImpl;
@useResult
$Res call({
 String uid, String email, String fullName, String country, String province, String district, String artCategory, String role, List<String> medals, String? assignedCompetitionId
});




}
/// @nodoc
class _$UserProfileCopyWithImpl<$Res>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? email = null,Object? fullName = null,Object? country = null,Object? province = null,Object? district = null,Object? artCategory = null,Object? role = null,Object? medals = null,Object? assignedCompetitionId = freezed,}) {
  return _then(UserProfile(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,artCategory: null == artCategory ? _self.artCategory : artCategory // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,medals: null == medals ? _self.medals : medals // ignore: cast_nullable_to_non_nullable
as List<String>,assignedCompetitionId: freezed == assignedCompetitionId ? _self.assignedCompetitionId : assignedCompetitionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfile].
extension UserProfilePatterns on UserProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfile value)  $default,){
final _that = this;
switch (_that) {
case _UserProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfile value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  String email,  String fullName,  String country,  String province,  String district,  String artCategory,  String role,  List<String> medals,  String? assignedCompetitionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.uid,_that.email,_that.fullName,_that.country,_that.province,_that.district,_that.artCategory,_that.role,_that.medals,_that.assignedCompetitionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  String email,  String fullName,  String country,  String province,  String district,  String artCategory,  String role,  List<String> medals,  String? assignedCompetitionId)  $default,) {final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that.uid,_that.email,_that.fullName,_that.country,_that.province,_that.district,_that.artCategory,_that.role,_that.medals,_that.assignedCompetitionId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  String email,  String fullName,  String country,  String province,  String district,  String artCategory,  String role,  List<String> medals,  String? assignedCompetitionId)?  $default,) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.uid,_that.email,_that.fullName,_that.country,_that.province,_that.district,_that.artCategory,_that.role,_that.medals,_that.assignedCompetitionId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfile implements UserProfile {
  const _UserProfile({required this.uid, required this.email, required this.fullName, required this.country, required this.province, required this.district, required this.artCategory, required this.role,  List<String> medals = const [], this.assignedCompetitionId}): _medals = medals;
  factory _UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

@override final  String uid;
@override final  String email;
@override final  String fullName;
@override final  String country;
@override final  String province;
@override final  String district;
@override final  String artCategory;
@override final  String role;
 final  List<String> _medals;
@override@JsonKey() List<String> get medals {
  if (_medals is EqualUnmodifiableListView) return _medals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_medals);
}

@override final  String? assignedCompetitionId;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileCopyWith<_UserProfile> get copyWith => __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfile&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.country, country) || other.country == country)&&(identical(other.province, province) || other.province == province)&&(identical(other.district, district) || other.district == district)&&(identical(other.artCategory, artCategory) || other.artCategory == artCategory)&&(identical(other.role, role) || other.role == role)&&const DeepCollectionEquality().equals(other.medals, _medals)&&(identical(other.assignedCompetitionId, assignedCompetitionId) || other.assignedCompetitionId == assignedCompetitionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,uid,email,fullName,country,province,district,artCategory,role,const DeepCollectionEquality().hash(_medals),assignedCompetitionId);
}

@override
String toString() {
    return 'UserProfile(uid: $uid, email: $email, fullName: $fullName, country: $country, province: $province, district: $district, artCategory: $artCategory, role: $role, medals: $medals, assignedCompetitionId: $assignedCompetitionId)';
}


}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(_UserProfile value, $Res Function(_UserProfile) _then) = __$UserProfileCopyWithImpl;
@override @useResult
$Res call({
 String uid, String email, String fullName, String country, String province, String district, String artCategory, String role, List<String> medals, String? assignedCompetitionId
});




}
/// @nodoc
class __$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? email = null,Object? fullName = null,Object? country = null,Object? province = null,Object? district = null,Object? artCategory = null,Object? role = null,Object? medals = null,Object? assignedCompetitionId = freezed,}) {
  return _then(_UserProfile(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,artCategory: null == artCategory ? _self.artCategory : artCategory // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,medals: null == medals ? _self._medals : medals // ignore: cast_nullable_to_non_nullable
as List<String>,assignedCompetitionId: freezed == assignedCompetitionId ? _self.assignedCompetitionId : assignedCompetitionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
