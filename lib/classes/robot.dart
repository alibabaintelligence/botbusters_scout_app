class Robot {
  final String id;
  final int teamNumber;
  final int matchNumber;
  final String allianceId;
  final int autoTopScored;
  final int autoMiddleScored;
  final int autoBottomScored;
  final bool leftCommunity;
  final bool docked;
  final bool engaged;
  final int teleopTopScored;
  final int teleopMiddleScored;
  final int teleopBottomScored;
  final int teleopLinksScored;
  final bool coopBonus;
  final bool wasDefended;
  final String floorPickupId;
  final int dockingTimer;
  final String finalStatusId;
  final int allianceRobots;
  final String driverSkillId;
  final int speedRating;
  final bool missedPieces;
  final bool died;
  final bool tippy;
  final bool errorFoul;
  final bool mechFail;
  final bool defense;
  final String comment;
  final String scoutId;
  final String scoutName;
  final DateTime dateTimeCreated;

  Robot({
    required this.id,
    required this.teamNumber,
    required this.matchNumber,
    required this.allianceId,
    required this.autoTopScored,
    required this.autoMiddleScored,
    required this.autoBottomScored,
    required this.leftCommunity,
    required this.docked,
    required this.engaged,
    required this.teleopTopScored,
    required this.teleopMiddleScored,
    required this.teleopBottomScored,
    required this.teleopLinksScored,
    required this.coopBonus,
    required this.wasDefended,
    required this.floorPickupId,
    required this.dockingTimer,
    required this.finalStatusId,
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
      'autoTopScored': autoTopScored,
      'autoMiddleScored': autoMiddleScored,
      'autoBottomScored': autoBottomScored,
      'leftCommunity': leftCommunity ? 1 : 0,
      'docked': docked ? 1 : 0,
      'engaged': engaged ? 1 : 0,
      'teleopTopScored': teleopTopScored,
      'teleopMiddleScored': teleopMiddleScored,
      'teleopBottomScored': teleopBottomScored,
      'teleopLinksScored': teleopLinksScored,
      'coopBonus': coopBonus ? 1 : 0,
      'wasDefended': wasDefended ? 1 : 0,
      'floorPickupId': floorPickupId,
      'dockingTimer': dockingTimer,
      'finalStatusId': finalStatusId,
      'allianceRobots': allianceRobots,
      'driverSkillId': driverSkillId,
      'speedRating': speedRating,
      'missedPieces': missedPieces ? 1 : 0,
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
