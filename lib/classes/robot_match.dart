class RobotMatch {
  final String id;
  final int teamNumber;
  final int matchNumber;
  final String allianceId;
  final bool leftCommunity;
  final int autoAmpNotes; // !
  final int autoSpeakerNotes; // !
  final int teleopAmpNotes; // !
  final int teleopSpeakerNotesX2; // !
  final int teleopSpeakerNotes; // !
  final bool parked; // !
  final bool onstage; // !
  final String notePickupId; // !
  final String spotlight1Id; // !
  final String spotlight2Id; // !
  final String spotlight3Id; // !
  final bool noteInTrap; // !
  final bool yellowCard;
  final bool redCard;
  final String? yellowCardMotive;
  final String? redCardMotive;
  final String driverSkillId;
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
    required this.autoAmpNotes, // !
    required this.autoSpeakerNotes, // !
    required this.teleopAmpNotes, // !
    required this.teleopSpeakerNotesX2, // !
    required this.teleopSpeakerNotes, // !
    required this.parked, // !
    required this.onstage, // !
    required this.notePickupId, // !
    required this.spotlight1Id, // !
    required this.spotlight2Id, // !
    required this.spotlight3Id, // !
    required this.noteInTrap, // !
    required this.yellowCard,
    required this.redCard,
    required this.yellowCardMotive,
    required this.redCardMotive,
    required this.driverSkillId,
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
      'autoAmpNotes': autoAmpNotes, // !
      'autoSpeakerNotes': autoSpeakerNotes, // !
      'teleopSpeakerNotes': teleopSpeakerNotes, // !
      'teleopSpeakerNotesX2': teleopSpeakerNotesX2, // !
      'teleopAmpNotes': teleopAmpNotes, // !
      'parked': parked ? 1 : 0, // !
      'onstage': onstage ? 1 : 0, // !
      'notePickupId': notePickupId, // !
      'spotlight1Id': spotlight1Id, // !
      'spotlight2Id': spotlight2Id, // !
      'spotlight3Id': spotlight3Id, // !
      'noteInTrap': noteInTrap ? 1 : 0, // !
      'yellowCard': yellowCard ? 1 : 0,
      'redCard': redCard ? 1 : 0,
      'yellowCardMotive': yellowCardMotive,
      'redCardMotive': redCardMotive,
      'driverSkillId': driverSkillId,
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
