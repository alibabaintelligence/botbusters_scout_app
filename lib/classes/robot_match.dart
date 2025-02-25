class RobotMatch {
  final String id;
  final int teamNumber;
  final int matchNumber;
  final String allianceId;
  final bool leftCommunity;
  final int autoCoralL1; // !
  final int autoCoralL2; // !
  final int autoCoralL3; // !
  final int autoCoralL4; // !
  final int autoAlgaeProcessor; // !
  final int autoAlgaeNet; // !
  final int teleopCoralL1; // !
  final int teleopCoralL2; // !
  final int teleopCoralL3; // !
  final int teleopCoralL4; // !
  final int teleopAlgaeProcessor; // !
  final int teleopAlgaeNet; // !
  final String bargeId;
  final bool yellowCard;
  final bool redCard;
  final String? yellowCardMotive;
  final String? redCardMotive;
  final String coralPickupId; // !
  final bool died;
  final bool tippy;
  final bool mechFail;
  final bool defense;
  final String comment;
  final String scoutId;
  final String scoutName;
  final DateTime dateTimeCreated;

  RobotMatch({
    required this.id,
    required this.teamNumber,
    required this.matchNumber,
    required this.allianceId,
    required this.leftCommunity,
    required this.autoCoralL1, // !
    required this.autoCoralL2, // !
    required this.autoCoralL3, // !
    required this.autoCoralL4, // !
    required this.autoAlgaeProcessor, // !
    required this.autoAlgaeNet, // !
    required this.teleopCoralL1, // !
    required this.teleopCoralL2, // !
    required this.teleopCoralL3, // !
    required this.teleopCoralL4, // !
    required this.teleopAlgaeProcessor, // !
    required this.teleopAlgaeNet, // !
    required this.bargeId,
    required this.yellowCard,
    required this.redCard,
    required this.yellowCardMotive,
    required this.redCardMotive,
    required this.coralPickupId, // !
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
      'autoCoralL1': autoCoralL1, // !
      'autoCoralL2': autoCoralL2, // !
      'autoCoralL3': autoCoralL3, // !
      'autoCoralL4': autoCoralL4, // !
      'autoAlgaeProcessor': autoAlgaeProcessor, // !
      'autoAlgaeNet': autoAlgaeNet, // !
      'teleopCoralL1': teleopCoralL1, // !
      'teleopCoralL2': teleopCoralL2, // !
      'teleopCoralL3': teleopCoralL3, // !
      'teleopCoralL4': teleopCoralL4, // !
      'teleopAlgaeProcessor': teleopAlgaeProcessor, // !
      'teleopAlgaeNet': teleopAlgaeNet, // !
      'bargeId': bargeId,
      'yellowCard': yellowCard ? 1 : 0,
      'redCard': redCard ? 1 : 0,
      'yellowCardMotive': yellowCardMotive,
      'redCardMotive': redCardMotive,
      'coralPickupId': coralPickupId, // !
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
