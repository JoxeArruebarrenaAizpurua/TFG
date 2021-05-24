import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'datos_usuario_record.g.dart';

abstract class DatosUsuarioRecord
    implements Built<DatosUsuarioRecord, DatosUsuarioRecordBuilder> {
  static Serializer<DatosUsuarioRecord> get serializer =>
      _$datosUsuarioRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Nombre')
  String get nombre;

  @nullable
  @BuiltValueField(wireName: 'Apellido')
  String get apellido;

  @nullable
  @BuiltValueField(wireName: 'DNI')
  String get dni;

  @nullable
  @BuiltValueField(wireName: 'EntidadBancaria')
  BuiltList<String> get entidadBancaria;

  @nullable
  String get password;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  Timestamp get createdTime;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DatosUsuarioRecordBuilder builder) => builder
    ..nombre = ''
    ..apellido = ''
    ..dni = ''
    ..entidadBancaria = ListBuilder()
    ..password = ''
    ..email = ''
    ..photoUrl = ''
    ..displayName = ''
    ..uid = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('DatosUsuario');

  static Stream<DatosUsuarioRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DatosUsuarioRecord._();
  factory DatosUsuarioRecord(
          [void Function(DatosUsuarioRecordBuilder) updates]) =
      _$DatosUsuarioRecord;
}

Map<String, dynamic> createDatosUsuarioRecordData({
  String nombre,
  String apellido,
  String dni,
  String password,
  String email,
  String photoUrl,
  Timestamp createdTime,
  String displayName,
  String uid,
}) =>
    serializers.serializeWith(
        DatosUsuarioRecord.serializer,
        DatosUsuarioRecord((d) => d
          ..nombre = nombre
          ..apellido = apellido
          ..dni = dni
          ..entidadBancaria = null
          ..password = password
          ..email = email
          ..photoUrl = photoUrl
          ..createdTime = createdTime
          ..displayName = displayName
          ..uid = uid));

DatosUsuarioRecord get dummyDatosUsuarioRecord {
  final builder = DatosUsuarioRecordBuilder()
    ..nombre = dummyString
    ..apellido = dummyString
    ..dni = dummyString
    ..entidadBancaria = ListBuilder([dummyString, dummyString])
    ..password = dummyString
    ..email = dummyString
    ..photoUrl = dummyImagePath
    ..createdTime = dummyTimestamp
    ..displayName = dummyString
    ..uid = dummyString;
  return builder.build();
}

List<DatosUsuarioRecord> createDummyDatosUsuarioRecord({int count}) =>
    List.generate(count, (_) => dummyDatosUsuarioRecord);
