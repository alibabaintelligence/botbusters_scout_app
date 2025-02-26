// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'robot_match.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RobotMatchAdapter extends TypeAdapter<RobotMatch> {
  @override
  final int typeId = 0;

  @override
  RobotMatch read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RobotMatch(
      id: fields[0] as String,
      teamNumber: fields[1] as int,
      matchNumber: fields[2] as int,
      allianceId: fields[3] as String,
      leftCommunity: fields[4] as bool,
      autoCoralL1: fields[5] as int,
      autoCoralL2: fields[6] as int,
      autoCoralL3: fields[7] as int,
      autoCoralL4: fields[8] as int,
      autoAlgaProcessor: fields[9] as int,
      autoAlgaNet: fields[10] as int,
      teleopCoralL1: fields[11] as int,
      teleopCoralL2: fields[12] as int,
      teleopCoralL3: fields[13] as int,
      teleopCoralL4: fields[14] as int,
      teleopAlgaProcessor: fields[15] as int,
      teleopAlgaNet: fields[16] as int,
      coralPickupId: fields[17] as String,
      climbId: fields[18] as String,
      yellowCard: fields[19] as bool,
      redCard: fields[20] as bool,
      yellowCardMotive: fields[21] as String?,
      redCardMotive: fields[22] as String?,
      died: fields[23] as bool,
      tippy: fields[24] as bool,
      mechFail: fields[25] as bool,
      defense: fields[26] as bool,
      comment: fields[27] as String,
      scoutId: fields[28] as String,
      scoutName: fields[29] as String,
      dateTimeCreated: fields[30] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, RobotMatch obj) {
    writer
      ..writeByte(31)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.teamNumber)
      ..writeByte(2)
      ..write(obj.matchNumber)
      ..writeByte(3)
      ..write(obj.allianceId)
      ..writeByte(4)
      ..write(obj.leftCommunity)
      ..writeByte(5)
      ..write(obj.autoCoralL1)
      ..writeByte(6)
      ..write(obj.autoCoralL2)
      ..writeByte(7)
      ..write(obj.autoCoralL3)
      ..writeByte(8)
      ..write(obj.autoCoralL4)
      ..writeByte(9)
      ..write(obj.autoAlgaProcessor)
      ..writeByte(10)
      ..write(obj.autoAlgaNet)
      ..writeByte(11)
      ..write(obj.teleopCoralL1)
      ..writeByte(12)
      ..write(obj.teleopCoralL2)
      ..writeByte(13)
      ..write(obj.teleopCoralL3)
      ..writeByte(14)
      ..write(obj.teleopCoralL4)
      ..writeByte(15)
      ..write(obj.teleopAlgaProcessor)
      ..writeByte(16)
      ..write(obj.teleopAlgaNet)
      ..writeByte(17)
      ..write(obj.coralPickupId)
      ..writeByte(18)
      ..write(obj.climbId)
      ..writeByte(19)
      ..write(obj.yellowCard)
      ..writeByte(20)
      ..write(obj.redCard)
      ..writeByte(21)
      ..write(obj.yellowCardMotive)
      ..writeByte(22)
      ..write(obj.redCardMotive)
      ..writeByte(23)
      ..write(obj.died)
      ..writeByte(24)
      ..write(obj.tippy)
      ..writeByte(25)
      ..write(obj.mechFail)
      ..writeByte(26)
      ..write(obj.defense)
      ..writeByte(27)
      ..write(obj.comment)
      ..writeByte(28)
      ..write(obj.scoutId)
      ..writeByte(29)
      ..write(obj.scoutName)
      ..writeByte(30)
      ..write(obj.dateTimeCreated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RobotMatchAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
