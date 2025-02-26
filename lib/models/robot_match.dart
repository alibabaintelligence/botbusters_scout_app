import 'package:hive/hive.dart';

part 'robot_match.g.dart';

@HiveType(typeId: 0)
class RobotMatch {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final int teamNumber;

  @HiveField(2)
  final int matchNumber;

  @HiveField(3)
  final String allianceId;

  @HiveField(4)
  final bool leftCommunity;

  @HiveField(5)
  final int autoCoralL1;

  @HiveField(6)
  final int autoCoralL2;

  @HiveField(7)
  final int autoCoralL3;

  @HiveField(8)
  final int autoCoralL4;

  @HiveField(9)
  final int autoAlgaProcessor;

  @HiveField(10)
  final int autoAlgaNet;

  @HiveField(11)
  final int teleopCoralL1;

  @HiveField(12)
  final int teleopCoralL2;

  @HiveField(13)
  final int teleopCoralL3;

  @HiveField(14)
  final int teleopCoralL4;

  @HiveField(15)
  final int teleopAlgaProcessor;

  @HiveField(16)
  final int teleopAlgaNet;

  @HiveField(17)
  final String coralPickupId;

  @HiveField(18)
  final String climbId;

  @HiveField(19)
  final bool yellowCard;

  @HiveField(20)
  final bool redCard;

  @HiveField(21)
  final String? yellowCardMotive;

  @HiveField(22)
  final String? redCardMotive;

  @HiveField(23)
  final bool died;

  @HiveField(24)
  final bool tippy;

  @HiveField(25)
  final bool mechFail;

  @HiveField(26)
  final bool defense;

  @HiveField(27)
  final String comment;

  @HiveField(28)
  final String scoutId;

  @HiveField(29)
  final String scoutName;

  @HiveField(30)
  final DateTime dateTimeCreated;

  RobotMatch({
    required this.id,
    required this.teamNumber,
    required this.matchNumber,
    required this.allianceId,
    required this.leftCommunity,
    required this.autoCoralL1,
    required this.autoCoralL2,
    required this.autoCoralL3,
    required this.autoCoralL4,
    required this.autoAlgaProcessor,
    required this.autoAlgaNet,
    required this.teleopCoralL1,
    required this.teleopCoralL2,
    required this.teleopCoralL3,
    required this.teleopCoralL4,
    required this.teleopAlgaProcessor,
    required this.teleopAlgaNet,
    required this.coralPickupId,
    required this.climbId,
    required this.yellowCard,
    required this.redCard,
    required this.yellowCardMotive,
    required this.redCardMotive,
    required this.died,
    required this.tippy,
    required this.mechFail,
    required this.defense,
    required this.comment,
    required this.scoutId,
    required this.scoutName,
    required this.dateTimeCreated,
  });

  Map<String, dynamic> toSQLMap() {
    return {
      'id': id,
      'teamNumber': teamNumber,
      'matchNumber': matchNumber,
      'allianceId': allianceId,
      'leftCommunity': leftCommunity ? 1 : 0,
      'autoCoralL1': autoCoralL1,
      'autoCoralL2': autoCoralL2,
      'autoCoralL3': autoCoralL3,
      'autoCoralL4': autoCoralL4,
      'autoAlgaProcessor': autoAlgaProcessor,
      'autoAlgaNet': autoAlgaNet,
      'teleopCoralL1': teleopCoralL1,
      'teleopCoralL2': teleopCoralL2,
      'teleopCoralL3': teleopCoralL3,
      'teleopCoralL4': teleopCoralL4,
      'teleopAlgaProcessor': teleopAlgaProcessor,
      'teleopAlgaNet': teleopAlgaNet,
      'coralPickupId': coralPickupId,
      'climbId': climbId,
      'yellowCard': yellowCard ? 1 : 0,
      'redCard': redCard ? 1 : 0,
      'yellowCardMotive': yellowCardMotive,
      'redCardMotive': redCardMotive,
      'died': died ? 1 : 0,
      'tippy': tippy ? 1 : 0,
      'mechFail': mechFail ? 1 : 0,
      'defense': defense ? 1 : 0,
      'comment': comment,
      'scoutId': scoutId,
      'scoutName': scoutName,
      'dateTimeCreated': dateTimeCreated.toIso8601String(),
    };
  }
} 