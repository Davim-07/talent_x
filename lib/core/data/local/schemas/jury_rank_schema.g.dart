// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jury_rank_schema.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetJuryRankSchemaCollection on Isar {
  IsarCollection<JuryRankSchema> get juryRankSchemas => this.collection();
}

const JuryRankSchemaSchema = CollectionSchema(
  name: r'JuryRankSchema',
  id: 6225264717106169682,
  properties: {
    r'artistId': PropertySchema(
      id: 0,
      name: r'artistId',
      type: IsarType.string,
    ),
    r'competitionId': PropertySchema(
      id: 1,
      name: r'competitionId',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 2,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'juryId': PropertySchema(
      id: 3,
      name: r'juryId',
      type: IsarType.string,
    ),
    r'rank': PropertySchema(
      id: 4,
      name: r'rank',
      type: IsarType.long,
    )
  },
  estimateSize: _juryRankSchemaEstimateSize,
  serialize: _juryRankSchemaSerialize,
  deserialize: _juryRankSchemaDeserialize,
  deserializeProp: _juryRankSchemaDeserializeProp,
  idName: r'localId',
  indexes: {
    r'juryId': IndexSchema(
      id: 7158465331207096192,
      name: r'juryId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'juryId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'isSynced': IndexSchema(
      id: -39763503327887510,
      name: r'isSynced',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isSynced',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _juryRankSchemaGetId,
  getLinks: _juryRankSchemaGetLinks,
  attach: _juryRankSchemaAttach,
  version: '3.1.0+1',
);

int _juryRankSchemaEstimateSize(
  JuryRankSchema object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.artistId.length * 3;
  bytesCount += 3 + object.competitionId.length * 3;
  bytesCount += 3 + object.juryId.length * 3;
  return bytesCount;
}

void _juryRankSchemaSerialize(
  JuryRankSchema object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.artistId);
  writer.writeString(offsets[1], object.competitionId);
  writer.writeBool(offsets[2], object.isSynced);
  writer.writeString(offsets[3], object.juryId);
  writer.writeLong(offsets[4], object.rank);
}

JuryRankSchema _juryRankSchemaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = JuryRankSchema();
  object.artistId = reader.readString(offsets[0]);
  object.competitionId = reader.readString(offsets[1]);
  object.isSynced = reader.readBool(offsets[2]);
  object.juryId = reader.readString(offsets[3]);
  object.localId = id;
  object.rank = reader.readLong(offsets[4]);
  return object;
}

P _juryRankSchemaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _juryRankSchemaGetId(JuryRankSchema object) {
  return object.localId;
}

List<IsarLinkBase<dynamic>> _juryRankSchemaGetLinks(JuryRankSchema object) {
  return [];
}

void _juryRankSchemaAttach(
    IsarCollection<dynamic> col, Id id, JuryRankSchema object) {
  object.localId = id;
}

extension JuryRankSchemaByIndex on IsarCollection<JuryRankSchema> {
  Future<JuryRankSchema?> getByJuryId(String juryId) {
    return getByIndex(r'juryId', [juryId]);
  }

  JuryRankSchema? getByJuryIdSync(String juryId) {
    return getByIndexSync(r'juryId', [juryId]);
  }

  Future<bool> deleteByJuryId(String juryId) {
    return deleteByIndex(r'juryId', [juryId]);
  }

  bool deleteByJuryIdSync(String juryId) {
    return deleteByIndexSync(r'juryId', [juryId]);
  }

  Future<List<JuryRankSchema?>> getAllByJuryId(List<String> juryIdValues) {
    final values = juryIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'juryId', values);
  }

  List<JuryRankSchema?> getAllByJuryIdSync(List<String> juryIdValues) {
    final values = juryIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'juryId', values);
  }

  Future<int> deleteAllByJuryId(List<String> juryIdValues) {
    final values = juryIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'juryId', values);
  }

  int deleteAllByJuryIdSync(List<String> juryIdValues) {
    final values = juryIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'juryId', values);
  }

  Future<Id> putByJuryId(JuryRankSchema object) {
    return putByIndex(r'juryId', object);
  }

  Id putByJuryIdSync(JuryRankSchema object, {bool saveLinks = true}) {
    return putByIndexSync(r'juryId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByJuryId(List<JuryRankSchema> objects) {
    return putAllByIndex(r'juryId', objects);
  }

  List<Id> putAllByJuryIdSync(List<JuryRankSchema> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'juryId', objects, saveLinks: saveLinks);
  }
}

extension JuryRankSchemaQueryWhereSort
    on QueryBuilder<JuryRankSchema, JuryRankSchema, QWhere> {
  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterWhere> anyLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterWhere> anyIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isSynced'),
      );
    });
  }
}

extension JuryRankSchemaQueryWhere
    on QueryBuilder<JuryRankSchema, JuryRankSchema, QWhereClause> {
  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterWhereClause>
      localIdEqualTo(Id localId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: localId,
        upper: localId,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterWhereClause>
      localIdNotEqualTo(Id localId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: localId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: localId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: localId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: localId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterWhereClause>
      localIdGreaterThan(Id localId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: localId, includeLower: include),
      );
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterWhereClause>
      localIdLessThan(Id localId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: localId, includeUpper: include),
      );
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterWhereClause>
      localIdBetween(
    Id lowerLocalId,
    Id upperLocalId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerLocalId,
        includeLower: includeLower,
        upper: upperLocalId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterWhereClause> juryIdEqualTo(
      String juryId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'juryId',
        value: [juryId],
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterWhereClause>
      juryIdNotEqualTo(String juryId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'juryId',
              lower: [],
              upper: [juryId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'juryId',
              lower: [juryId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'juryId',
              lower: [juryId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'juryId',
              lower: [],
              upper: [juryId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterWhereClause>
      isSyncedEqualTo(bool isSynced) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isSynced',
        value: [isSynced],
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterWhereClause>
      isSyncedNotEqualTo(bool isSynced) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isSynced',
              lower: [],
              upper: [isSynced],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isSynced',
              lower: [isSynced],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isSynced',
              lower: [isSynced],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isSynced',
              lower: [],
              upper: [isSynced],
              includeUpper: false,
            ));
      }
    });
  }
}

extension JuryRankSchemaQueryFilter
    on QueryBuilder<JuryRankSchema, JuryRankSchema, QFilterCondition> {
  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      artistIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'artistId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      artistIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'artistId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      artistIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'artistId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      artistIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'artistId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      artistIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'artistId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      artistIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'artistId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      artistIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'artistId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      artistIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'artistId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      artistIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'artistId',
        value: '',
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      artistIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'artistId',
        value: '',
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      competitionIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'competitionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      competitionIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'competitionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      competitionIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'competitionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      competitionIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'competitionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      competitionIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'competitionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      competitionIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'competitionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      competitionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'competitionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      competitionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'competitionId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      competitionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'competitionId',
        value: '',
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      competitionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'competitionId',
        value: '',
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      juryIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'juryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      juryIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'juryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      juryIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'juryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      juryIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'juryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      juryIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'juryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      juryIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'juryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      juryIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'juryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      juryIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'juryId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      juryIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'juryId',
        value: '',
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      juryIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'juryId',
        value: '',
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      localIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      localIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      localIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      localIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'localId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      rankEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rank',
        value: value,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      rankGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rank',
        value: value,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      rankLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rank',
        value: value,
      ));
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterFilterCondition>
      rankBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rank',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension JuryRankSchemaQueryObject
    on QueryBuilder<JuryRankSchema, JuryRankSchema, QFilterCondition> {}

extension JuryRankSchemaQueryLinks
    on QueryBuilder<JuryRankSchema, JuryRankSchema, QFilterCondition> {}

extension JuryRankSchemaQuerySortBy
    on QueryBuilder<JuryRankSchema, JuryRankSchema, QSortBy> {
  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterSortBy> sortByArtistId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artistId', Sort.asc);
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterSortBy>
      sortByArtistIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artistId', Sort.desc);
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterSortBy>
      sortByCompetitionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'competitionId', Sort.asc);
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterSortBy>
      sortByCompetitionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'competitionId', Sort.desc);
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterSortBy> sortByJuryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'juryId', Sort.asc);
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterSortBy>
      sortByJuryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'juryId', Sort.desc);
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterSortBy> sortByRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.asc);
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterSortBy> sortByRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.desc);
    });
  }
}

extension JuryRankSchemaQuerySortThenBy
    on QueryBuilder<JuryRankSchema, JuryRankSchema, QSortThenBy> {
  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterSortBy> thenByArtistId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artistId', Sort.asc);
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterSortBy>
      thenByArtistIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artistId', Sort.desc);
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterSortBy>
      thenByCompetitionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'competitionId', Sort.asc);
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterSortBy>
      thenByCompetitionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'competitionId', Sort.desc);
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterSortBy> thenByJuryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'juryId', Sort.asc);
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterSortBy>
      thenByJuryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'juryId', Sort.desc);
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterSortBy> thenByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterSortBy>
      thenByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterSortBy> thenByRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.asc);
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QAfterSortBy> thenByRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.desc);
    });
  }
}

extension JuryRankSchemaQueryWhereDistinct
    on QueryBuilder<JuryRankSchema, JuryRankSchema, QDistinct> {
  QueryBuilder<JuryRankSchema, JuryRankSchema, QDistinct> distinctByArtistId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'artistId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QDistinct>
      distinctByCompetitionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'competitionId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QDistinct> distinctByJuryId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'juryId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<JuryRankSchema, JuryRankSchema, QDistinct> distinctByRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rank');
    });
  }
}

extension JuryRankSchemaQueryProperty
    on QueryBuilder<JuryRankSchema, JuryRankSchema, QQueryProperty> {
  QueryBuilder<JuryRankSchema, int, QQueryOperations> localIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localId');
    });
  }

  QueryBuilder<JuryRankSchema, String, QQueryOperations> artistIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'artistId');
    });
  }

  QueryBuilder<JuryRankSchema, String, QQueryOperations>
      competitionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'competitionId');
    });
  }

  QueryBuilder<JuryRankSchema, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<JuryRankSchema, String, QQueryOperations> juryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'juryId');
    });
  }

  QueryBuilder<JuryRankSchema, int, QQueryOperations> rankProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rank');
    });
  }
}
