class RobotMatch {
  final String id;
  final int teamNumber;
  final int matchNumber;
  final String allianceId;
  final String autoPositionId;
  final int autoTopScored;
  final int autoMiddleScored;
  final int autoBottomScored;
  final bool leftCommunity;
  final bool docked;
  final bool engaged;
  final int teleopTopScored;
  final int teleopMiddleScored;
  final int teleopBottomScored;
  final bool takingMoreFromDoubleSubstation;
  final bool coopBonus;
  final bool wasDefended;
  final String floorPickupId;
  final String finalStatusId;
  final int? dockingTimer;
  final int? allianceRobots;
  final String driverSkillId;
  final int speedRating;
  final int missedPieces;
  final bool died;
  final bool tippy;
  final bool errorFoul;
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
    required this.autoPositionId,
    required this.autoTopScored,
    required this.autoMiddleScored,
    required this.autoBottomScored,
    required this.leftCommunity,
    required this.docked,
    required this.engaged,
    required this.teleopTopScored,
    required this.teleopMiddleScored,
    required this.teleopBottomScored,
    required this.takingMoreFromDoubleSubstation,
    required this.coopBonus,
    required this.wasDefended,
    required this.floorPickupId,
    required this.finalStatusId,
    required this.dockingTimer,
    required this.allianceRobots,
    required this.driverSkillId,
    required this.speedRating,
    required this.missedPieces,
    required this.died,
    required this.tippy,
    required this.errorFoul,
    required this.mechFail,
    required this.defense,
    required this.comment,
    required this.scoutId,
    required this.scoutName,
    required this.dateTimeCreated,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'teamNumber': teamNumber,
      'matchNumber': matchNumber,
      'allianceId': allianceId,
      'autoPositionId': autoPositionId,
      'autoTopScored': autoTopScored,
      'autoMiddleScored': autoMiddleScored,
      'autoBottomScored': autoBottomScored,
      'leftCommunity': leftCommunity ? 1 : 0,
      'docked': docked ? 1 : 0,
      'engaged': engaged ? 1 : 0,
      'teleopTopScored': teleopTopScored,
      'teleopMiddleScored': teleopMiddleScored,
      'teleopBottomScored': teleopBottomScored,
      'takingMoreFromDoubleSubstation': takingMoreFromDoubleSubstation ? 1 : 0,
      'coopBonus': coopBonus ? 1 : 0,
      'wasDefended': wasDefended ? 1 : 0,
      'floorPickupId': floorPickupId,
      'finalStatusId': finalStatusId,
      'dockingTimer': dockingTimer,
      'allianceRobots': allianceRobots,
      'driverSkillId': driverSkillId,
      'speedRating': speedRating,
      'missedPieces': missedPieces,
      'died': died ? 1 : 0,
      'tippy': tippy ? 1 : 0,
      'errorFoul': errorFoul ? 1 : 0,
      'mechFail': mechFail ? 1 : 0,
      'defense': defense ? 1 : 0,
      'comment': comment,
      'scoutId': scoutId,
      'scoutName': scoutName,
      'dateTimeCreated': dateTimeCreated.toIso8601String(),
    };
  }
}
