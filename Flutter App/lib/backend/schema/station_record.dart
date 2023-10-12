import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StationRecord extends FirestoreRecord {
  StationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "Location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "Battery1Available" field.
  bool? _battery1Available;
  bool get battery1Available => _battery1Available ?? false;
  bool hasBattery1Available() => _battery1Available != null;

  // "Battery2Available" field.
  bool? _battery2Available;
  bool get battery2Available => _battery2Available ?? false;
  bool hasBattery2Available() => _battery2Available != null;

  // "Battery1Percentage" field.
  String? _battery1Percentage;
  String get battery1Percentage => _battery1Percentage ?? '';
  bool hasBattery1Percentage() => _battery1Percentage != null;

  // "Battery2Percentage" field.
  String? _battery2Percentage;
  String get battery2Percentage => _battery2Percentage ?? '';
  bool hasBattery2Percentage() => _battery2Percentage != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _address = snapshotData['Address'] as String?;
    _location = snapshotData['Location'] as LatLng?;
    _battery1Available = snapshotData['Battery1Available'] as bool?;
    _battery2Available = snapshotData['Battery2Available'] as bool?;
    _battery1Percentage = snapshotData['Battery1Percentage'] as String?;
    _battery2Percentage = snapshotData['Battery2Percentage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Station');

  static Stream<StationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StationRecord.fromSnapshot(s));

  static Future<StationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StationRecord.fromSnapshot(s));

  static StationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStationRecordData({
  String? name,
  String? address,
  LatLng? location,
  bool? battery1Available,
  bool? battery2Available,
  String? battery1Percentage,
  String? battery2Percentage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'Address': address,
      'Location': location,
      'Battery1Available': battery1Available,
      'Battery2Available': battery2Available,
      'Battery1Percentage': battery1Percentage,
      'Battery2Percentage': battery2Percentage,
    }.withoutNulls,
  );

  return firestoreData;
}

class StationRecordDocumentEquality implements Equality<StationRecord> {
  const StationRecordDocumentEquality();

  @override
  bool equals(StationRecord? e1, StationRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.address == e2?.address &&
        e1?.location == e2?.location &&
        e1?.battery1Available == e2?.battery1Available &&
        e1?.battery2Available == e2?.battery2Available &&
        e1?.battery1Percentage == e2?.battery1Percentage &&
        e1?.battery2Percentage == e2?.battery2Percentage;
  }

  @override
  int hash(StationRecord? e) => const ListEquality().hash([
        e?.name,
        e?.address,
        e?.location,
        e?.battery1Available,
        e?.battery2Available,
        e?.battery1Percentage,
        e?.battery2Percentage
      ]);

  @override
  bool isValidKey(Object? o) => o is StationRecord;
}
