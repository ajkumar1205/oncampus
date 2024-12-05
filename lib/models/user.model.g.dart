// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as String,
      firstname: fields[1] as String,
      lastname: fields[2] as String,
      email: fields[3] as String,
      dob: fields[4] as DateTime,
      userName: fields[9] as String,
      profileUrl: fields[6] as Uri?,
      roll: fields[7] as String,
    )
      ..isActive = fields[5] as bool
      ..bio = fields[8] as String?;
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstname)
      ..writeByte(2)
      ..write(obj.lastname)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.dob)
      ..writeByte(5)
      ..write(obj.isActive)
      ..writeByte(6)
      ..write(obj.profileUrl)
      ..writeByte(7)
      ..write(obj.roll)
      ..writeByte(8)
      ..write(obj.bio)
      ..writeByte(9)
      ..write(obj.userName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
