import 'dart:convert';

import 'package:botbusters_scout_app/providers/robots_provider.dart';
import 'package:botbusters_scout_app/widgets/notes_pickup_buttons.dart';
import 'package:botbusters_scout_app/widgets/spotlight_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'package:botbusters_scout_app/classes/robot_match.dart';
import 'package:botbusters_scout_app/providers/scout_data_provider.dart';
import 'package:botbusters_scout_app/screens/qr_screen.dart';
import 'package:botbusters_scout_app/widgets/alliance_buttons.dart';
import 'package:botbusters_scout_app/widgets/counter_field.dart';
import 'package:botbusters_scout_app/widgets/driver_skill_buttons.dart';
import 'package:botbusters_scout_app/widgets/int_field.dart';

enum Tabs {
  initialData,
  auto,
  teleop,
  extras,
}

class SendScreen extends StatefulWidget {
  const SendScreen({super.key});

  static const routeName = '/send';

  @override
  State<SendScreen> createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  final _formKey = GlobalKey<FormState>();

  // Basic Data
  final _teamNumberController = TextEditingController();
  final _matchNumberController = TextEditingController();

  String _allianceId = 'blue1';

  // Autonomous
  bool _leftCommunity = false;
  int _autoAmpNotes = 0;
  int _autoSpeakerNotes = 0;

  // Teleop
  int _teleopAmpNotes = 0;
  int _teleopSpeakerNotesX2 = 0;
  int _teleopSpeakerNotes = 0;
  bool _parked = false;
  bool _onstage = false;
  String _notesPickupId = 'source';
  String _spotlight1Id = 'notAttempted';
  String _spotlight2Id = 'notAttempted';
  String _spotlight3Id = 'notAttempted';
  bool _noteInTrap = false;

  // Extras
  bool _yellowCard = false;
  bool _redCard = false;
  // * These two depend on _redCard & _yellowCard
  final _yellowCardMotiveController = TextEditingController();
  final _redCardMotiveController = TextEditingController();

  String _driverSkillId = 'notObs';

  bool _died = false;
  bool _tippy = false;
  bool _mechFail = false;
  bool _defense = false;

  final _commentController = TextEditingController();

  // State variables
  bool _isLoading = false;
  bool _isEditing = false;
  String _previousId = '';

  // Running for once only...
  bool _firstTimeRunning = true;

  @override
  void didChangeDependencies() {
    if (_firstTimeRunning) {
      final editRobotData =
          ModalRoute.of(context)?.settings.arguments as RobotMatch?;

      if (editRobotData != null) {
        // General Data
        _teamNumberController.text = editRobotData.teamNumber.toString();
        _matchNumberController.text = editRobotData.matchNumber.toString();
        _allianceId = editRobotData.allianceId;

        // Autonomous
        _leftCommunity = editRobotData.leftCommunity;
        _autoAmpNotes = editRobotData.autoAmpNotes;
        _autoSpeakerNotes = editRobotData.autoSpeakerNotes;

        // Tele-Op
        _teleopAmpNotes = editRobotData.teleopAmpNotes;
        _teleopSpeakerNotesX2 = editRobotData.teleopSpeakerNotesX2;
        _teleopSpeakerNotes = editRobotData.teleopSpeakerNotes;
        _parked = editRobotData.parked;
        _onstage = editRobotData.onstage;
        _notesPickupId = editRobotData.notePickupId;
        _spotlight1Id = editRobotData.spotlight1Id;
        _spotlight2Id = editRobotData.spotlight2Id;
        _spotlight3Id = editRobotData.spotlight3Id;
        _noteInTrap = editRobotData.noteInTrap;

        // Extras
        _yellowCard = editRobotData.yellowCard;
        _redCard = editRobotData.redCard;
        _yellowCardMotiveController.text = editRobotData.yellowCardMotive ?? '';
        _redCardMotiveController.text = editRobotData.redCardMotive ?? '';
        _driverSkillId = editRobotData.driverSkillId;
        _died = editRobotData.died;
        _tippy = editRobotData.tippy;
        _mechFail = editRobotData.mechFail;
        _defense = editRobotData.defense;

        _commentController.text = editRobotData.comment;

        _previousId = editRobotData.id;

        _isEditing = true;
      }
      _firstTimeRunning = false;
    }
    super.didChangeDependencies();
  }

  Tabs currentTab = Tabs.initialData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Send',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(
            CupertinoIcons.back,
            color: Colors.red,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: const Color.fromARGB(255, 45, 45, 45),
        elevation: 5,
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 64, 64, 64),
        elevation: 5,
        padding: const EdgeInsets.all(10.0),
        height: 70.0,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CupertinoButton(
                onPressed: () {
                  setState(() {
                    currentTab = Tabs.initialData;
                  });
                },
                padding: EdgeInsets.zero,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.0),
                    color: currentTab == Tabs.initialData
                        ? Colors.blue.shade800
                        : const Color.fromARGB(255, 45, 45, 45),
                  ),
                  width: 50.0,
                  height: 40.0,
                  padding: const EdgeInsets.all(7.0),
                  child: const FittedBox(
                    child: Text(
                      'DATA',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CupertinoButton(
                onPressed: () {
                  setState(() {
                    currentTab = Tabs.auto;
                  });
                },
                padding: EdgeInsets.zero,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.0),
                    color: currentTab == Tabs.auto
                        ? Colors.blue.shade800
                        : const Color.fromARGB(255, 45, 45, 45),
                  ),
                  width: 50.0,
                  height: 40.0,
                  padding: const EdgeInsets.all(7.0),
                  child: const FittedBox(
                    child: Text(
                      'AUTO',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CupertinoButton(
                onPressed: () {
                  setState(() {
                    currentTab = Tabs.teleop;
                  });
                },
                padding: EdgeInsets.zero,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.0),
                    color: currentTab == Tabs.teleop
                        ? Colors.blue.shade800
                        : const Color.fromARGB(255, 45, 45, 45),
                  ),
                  padding: const EdgeInsets.all(7.0),
                  width: 50.0,
                  height: 40.0,
                  child: const FittedBox(
                    child: Text(
                      'TELE',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CupertinoButton(
                onPressed: () {
                  setState(() {
                    currentTab = Tabs.extras;
                  });
                },
                padding: EdgeInsets.zero,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.0),
                    color: currentTab == Tabs.extras
                        ? Colors.blue.shade800
                        : const Color.fromARGB(255, 45, 45, 45),
                  ),
                  width: 50.0,
                  height: 40.0,
                  padding: const EdgeInsets.all(7.0),
                  child: const FittedBox(
                    child: Text(
                      'EXTR',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: CupertinoButton(
                onPressed: _isLoading
                    ? null
                    : () async {
                        try {
                          setState(() {
                            _isLoading = true;
                          });

                          const encoder = JsonEncoder();

                          final scoutDataProvider =
                              Provider.of<ScoutDataProvider>(
                            context,
                            listen: false,
                          );

                          final teamNumber =
                              int.tryParse(_teamNumberController.text);

                          if (teamNumber == null) {
                            throw 'Invalid Team Number';
                          }

                          final matchNumber =
                              int.tryParse(_matchNumberController.text);

                          if (matchNumber == null) {
                            throw 'Invalid Match Number';
                          }

                          final robot = RobotMatch(
                            // id: '${scoutDataProvider.scoutUser!.id}$_allianceId$_finalStatusId$_driverSkillId$_autoTopScored${DateTime.now().toString()}',
                            id: const Uuid().v8(),
                            teamNumber: teamNumber,
                            matchNumber: matchNumber,
                            allianceId: _allianceId,
                            leftCommunity: _leftCommunity,
                            autoAmpNotes: _autoAmpNotes,
                            autoSpeakerNotes: _autoSpeakerNotes,
                            teleopAmpNotes: _teleopAmpNotes,
                            teleopSpeakerNotesX2: _teleopSpeakerNotesX2,
                            teleopSpeakerNotes: _teleopSpeakerNotes,
                            parked: _parked,
                            onstage: _onstage,
                            notePickupId: _notesPickupId,
                            spotlight1Id: _spotlight1Id,
                            spotlight2Id: _spotlight2Id,
                            spotlight3Id: _spotlight3Id,
                            noteInTrap: _noteInTrap,
                            yellowCard: _yellowCard,
                            redCard: _redCard,
                            yellowCardMotive: _yellowCard
                                ? _yellowCardMotiveController.text
                                : null,
                            redCardMotive:
                                _redCard ? _redCardMotiveController.text : null,
                            driverSkillId: _driverSkillId,
                            died: _died,
                            tippy: _tippy,
                            mechFail: _mechFail,
                            defense: _defense,
                            comment: _commentController.text,
                            scoutId: scoutDataProvider.scoutUser!.id,
                            scoutName: scoutDataProvider.scoutUser!.name,
                            dateTimeCreated: DateTime.now(),
                          );

                          // Saving robot in-state and locally
                          final robotsProvider = Provider.of<RobotsProvider>(
                            context,
                            listen: false,
                          );

                          if (_isEditing) {
                            await robotsProvider.editMatch(robot, _previousId);
                          } else {
                            await robotsProvider.addMatch(robot);
                          }

                          setState(() {
                            _isLoading = false;
                          });

                          final String jsonRobot =
                              encoder.convert(robot.toSQLMap());

                          print(jsonRobot);

                          if (context.mounted) {
                            Navigator.of(context).popAndPushNamed(
                              QRCodeScreen.routeName,
                              arguments: jsonRobot,
                            );
                          }
                        } catch (err) {
                          debugPrint(err.toString());

                          showCupertinoDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                insetPadding:
                                    const EdgeInsets.fromLTRB(20, 80, 20, 15),
                                alignment: Alignment.center,
                                elevation: 8,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 10),
                                        const Icon(
                                          Icons.error_rounded,
                                          color: Color.fromARGB(
                                            255,
                                            255,
                                            65,
                                            65,
                                          ),
                                          size: 40,
                                        ),
                                        const SizedBox(height: 7),
                                        const Text(
                                          'Error',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          err.toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                        Row(
                                          children: [
                                            const Spacer(),
                                            CupertinoButton(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: const Text(
                                                'OK',
                                                style: TextStyle(
                                                  color: Colors.lightBlueAccent,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }

                        setState(() {
                          _isLoading = false;
                        });
                      },
                padding: EdgeInsets.zero,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17.0),
                    color: const Color.fromARGB(255, 255, 0, 43),
                  ),
                  child: _isLoading
                      ? const CupertinoActivityIndicator()
                      : const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'QR >',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                currentTab == Tabs.initialData
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Initial Data',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          IntField(
                            controller: _teamNumberController,
                            text: 'Team Number',
                          ),
                          const SizedBox(height: 15),
                          IntField(
                            controller: _matchNumberController,
                            text: 'Match Number',
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            'Robot Alliance',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 15),
                          AllianceButtons(
                            allianceId: _allianceId,
                            onButtonPressed: (newId) {
                              _allianceId = newId;
                            },
                          ),
                        ],
                      )
                    : currentTab == Tabs.auto
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Autonomous',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 25),
                              Row(
                                children: [
                                  FlutterSwitch(
                                    value: _leftCommunity,
                                    onToggle: (newValue) {
                                      setState(() {
                                        _leftCommunity = newValue;
                                      });
                                    },
                                    activeColor:
                                        const Color.fromRGBO(0, 180, 140, 1.0),
                                    inactiveColor: const Color.fromRGBO(
                                        100, 100, 100, 1.0),
                                    borderRadius: 12,
                                    width: 47,
                                    height: 27,
                                    toggleSize: 16,
                                    // iq 150 papu, pa que no se corra el toggle del switch le pongo
                                    // un border del color verde, y así se ve más pequeño
                                    activeToggleBorder: Border.all(
                                      color: const Color.fromRGBO(
                                          0, 220, 167, 1.0),
                                      width: 1,
                                      strokeAlign: BorderSide.strokeAlignInside,
                                    ),
                                    inactiveToggleBorder: Border.all(
                                      color: const Color.fromRGBO(
                                          200, 200, 200, 1.0),
                                      width: 1,
                                      strokeAlign: BorderSide.strokeAlignInside,
                                    ),
                                  ),
                                  const SizedBox(width: 25),
                                  const Text(
                                    'Leave',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  const Text(
                                    'Amp Notes',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  CounterField(
                                    max: 9999,
                                    min: 0,
                                    value: _autoAmpNotes,
                                    whenChanged: (newValue) {
                                      _autoAmpNotes = newValue;
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  const Text(
                                    'Speaker Notes',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  CounterField(
                                    max: 9999,
                                    min: 0,
                                    value: _autoSpeakerNotes,
                                    whenChanged: (newValue) {
                                      _autoSpeakerNotes = newValue;
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                            ],
                          )
                        : currentTab == Tabs.teleop
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Tele-Op',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    children: [
                                      FlutterSwitch(
                                        value: _parked,
                                        onToggle: (newValue) {
                                          setState(() {
                                            if (newValue == true) {
                                              _onstage = false;
                                            }
                                            _parked = newValue;
                                          });
                                        },
                                        activeColor: const Color.fromRGBO(
                                            0, 180, 140, 1.0),
                                        inactiveColor: const Color.fromRGBO(
                                            100, 100, 100, 1.0),
                                        borderRadius: 12,
                                        width: 47,
                                        height: 27,
                                        toggleSize: 16,
                                        // iq 150 papu, pa que no se corra el toggle del switch le pongo
                                        // un border del color verde, y así se ve más pequeño
                                        activeToggleBorder: Border.all(
                                          color: const Color.fromRGBO(
                                              0, 220, 167, 1.0),
                                          width: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignInside,
                                        ),
                                        inactiveToggleBorder: Border.all(
                                          color: const Color.fromRGBO(
                                              200, 200, 200, 1.0),
                                          width: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignInside,
                                        ),
                                      ),
                                      const SizedBox(width: 25),
                                      const Text(
                                        'Parked',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    children: [
                                      FlutterSwitch(
                                        value: _onstage,
                                        onToggle: (newValue) {
                                          setState(() {
                                            if (newValue == true) {
                                              _parked = false;
                                            }
                                            _onstage = newValue;
                                          });
                                        },
                                        activeColor: const Color.fromRGBO(
                                            0, 180, 140, 1.0),
                                        inactiveColor: const Color.fromRGBO(
                                            100, 100, 100, 1.0),
                                        borderRadius: 12,
                                        width: 47,
                                        height: 27,
                                        toggleSize: 16,
                                        // iq 150 papu, pa que no se corra el toggle del switch le pongo
                                        // un border del color verde, y así se ve más pequeño
                                        activeToggleBorder: Border.all(
                                          color: const Color.fromRGBO(
                                              0, 220, 167, 1.0),
                                          width: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignInside,
                                        ),
                                        inactiveToggleBorder: Border.all(
                                          color: const Color.fromRGBO(
                                              200, 200, 200, 1.0),
                                          width: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignInside,
                                        ),
                                      ),
                                      const SizedBox(width: 25),
                                      const Text(
                                        'Onstage',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 30),
                                  const Text(
                                    'Notes Pickup',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  NotesPickupButtons(
                                    notesPickupId: _notesPickupId,
                                    onButtonPressed: (newNotePickup) {
                                      setState(() {
                                        _notesPickupId = newNotePickup;
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 20.0),
                                  Row(
                                    children: [
                                      const Text(
                                        'Speaker Notes',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const Spacer(),
                                      CounterField(
                                        max: 9999,
                                        min: 0,
                                        value: _teleopSpeakerNotes,
                                        whenChanged: (newValue) {
                                          _teleopSpeakerNotes = newValue;
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15.0),
                                  Row(
                                    children: [
                                      const Text(
                                        'Speaker Notes X2',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const Spacer(),
                                      CounterField(
                                        max: 9999,
                                        min: 0,
                                        value: _teleopSpeakerNotesX2,
                                        whenChanged: (newValue) {
                                          _teleopSpeakerNotesX2 = newValue;
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15.0),
                                  Row(
                                    children: [
                                      const Text(
                                        'Amp Notes',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const Spacer(),
                                      CounterField(
                                        max: 9999,
                                        min: 0,
                                        value: _teleopAmpNotes,
                                        whenChanged: (newValue) {
                                          _teleopAmpNotes = newValue;
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 30),
                                  const Text(
                                    'Spotlights (click to change)',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 25),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SpotlightButton(
                                            initialSpotlightButtonId:
                                                _spotlight1Id,
                                            onButtonPressed: (newId) {
                                              _spotlight1Id = newId;
                                            },
                                          ),
                                          const SizedBox(width: 15.0),
                                          SvgPicture.asset(
                                            'assets/svgs/spotlights.svg',
                                          ),
                                          const SizedBox(width: 15.0),
                                          SpotlightButton(
                                            initialSpotlightButtonId:
                                                _spotlight2Id,
                                            onButtonPressed: (newId) {
                                              _spotlight2Id = newId;
                                            },
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 15.0),
                                      SpotlightButton(
                                        initialSpotlightButtonId: _spotlight3Id,
                                        onButtonPressed: (newId) {
                                          _spotlight3Id = newId;
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 30),
                                  Row(
                                    children: [
                                      FlutterSwitch(
                                        value: _noteInTrap,
                                        onToggle: (newValue) {
                                          setState(() {
                                            _noteInTrap = newValue;
                                          });
                                        },
                                        activeColor: const Color.fromRGBO(
                                            0, 180, 140, 1.0),
                                        inactiveColor: const Color.fromRGBO(
                                            100, 100, 100, 1.0),
                                        borderRadius: 12,
                                        width: 47,
                                        height: 27,
                                        toggleSize: 16,
                                        // iq 150 papu, pa que no se corra el toggle del switch le pongo
                                        // un border del color verde, y así se ve más pequeño
                                        activeToggleBorder: Border.all(
                                          color: const Color.fromRGBO(
                                              0, 220, 167, 1.0),
                                          width: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignInside,
                                        ),
                                        inactiveToggleBorder: Border.all(
                                          color: const Color.fromRGBO(
                                              200, 200, 200, 1.0),
                                          width: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignInside,
                                        ),
                                      ),
                                      const SizedBox(width: 25),
                                      const Text(
                                        'Note In Trap',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Extras',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 25),
                                  Row(
                                    children: [
                                      FlutterSwitch(
                                        value: _yellowCard,
                                        onToggle: (newValue) {
                                          setState(() {
                                            _yellowCard = newValue;
                                          });
                                        },
                                        activeColor: const Color.fromARGB(
                                            255, 241, 217, 0),
                                        inactiveColor: const Color.fromRGBO(
                                            100, 100, 100, 1.0),
                                        borderRadius: 12,
                                        width: 47,
                                        height: 27,
                                        toggleSize: 16,
                                        // iq 150 papu, pa que no se corra el toggle del switch le pongo
                                        // un border del color verde, y así se ve más pequeño
                                        activeToggleBorder: Border.all(
                                          color: const Color.fromARGB(
                                              255, 209, 188, 0),
                                          width: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignInside,
                                        ),
                                        inactiveToggleBorder: Border.all(
                                          color: const Color.fromRGBO(
                                              200, 200, 200, 1.0),
                                          width: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignInside,
                                        ),
                                      ),
                                      const SizedBox(width: 25),
                                      const Text(
                                        'Yellow Card',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  if (_yellowCard)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          'Yellow Card Motive (max. 50 chars)',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(13),
                                            color: const Color.fromARGB(
                                                255, 64, 64, 64),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: 15,
                                          ),
                                          child: TextFormField(
                                            controller:
                                                _yellowCardMotiveController,
                                            decoration:
                                                const InputDecoration.collapsed(
                                              hintText: 'Type here...',
                                            ),
                                            buildCounter: (
                                              context, {
                                              required int currentLength,
                                              required bool isFocused,
                                              required int? maxLength,
                                            }) =>
                                                null,
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                            // Comment max characters
                                            maxLength: 50,
                                          ),
                                        ),
                                        const SizedBox(height: 25),
                                      ],
                                    ),
                                  Row(
                                    children: [
                                      FlutterSwitch(
                                        value: _redCard,
                                        onToggle: (newValue) {
                                          setState(() {
                                            _redCard = newValue;
                                          });
                                        },
                                        activeColor: const Color.fromARGB(
                                            255, 231, 40, 40),
                                        inactiveColor: const Color.fromRGBO(
                                            100, 100, 100, 1.0),
                                        borderRadius: 12,
                                        width: 47,
                                        height: 27,
                                        toggleSize: 16,
                                        // iq 150 papu, pa que no se corra el toggle del switch le pongo
                                        // un border del color verde, y así se ve más pequeño
                                        activeToggleBorder: Border.all(
                                          color: const Color.fromARGB(
                                              255, 175, 40, 40),
                                          width: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignInside,
                                        ),
                                        inactiveToggleBorder: Border.all(
                                          color: const Color.fromRGBO(
                                              200, 200, 200, 1.0),
                                          width: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignInside,
                                        ),
                                      ),
                                      const SizedBox(width: 25),
                                      const Text(
                                        'Red Card',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (_redCard)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(height: 20),
                                        const Text(
                                          'Red Card Motive (max. 50 chars)',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(13),
                                            color: const Color.fromARGB(
                                                255, 64, 64, 64),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: 15,
                                          ),
                                          child: TextFormField(
                                            controller:
                                                _redCardMotiveController,
                                            decoration:
                                                const InputDecoration.collapsed(
                                              hintText: 'Type here...',
                                            ),
                                            buildCounter: (
                                              context, {
                                              required int currentLength,
                                              required bool isFocused,
                                              required int? maxLength,
                                            }) =>
                                                null,
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                            // Comment max characters
                                            maxLength: 50,
                                          ),
                                        ),
                                        const SizedBox(height: 25),
                                      ],
                                    ),
                                  const SizedBox(height: 30),
                                  const Text(
                                    'Driver Skill',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  DriverSkillButtons(
                                    driverSkillId: _driverSkillId,
                                    onButtonPressed: (newId) {
                                      _driverSkillId = newId;
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                  Row(
                                    children: [
                                      FlutterSwitch(
                                        value: _died,
                                        onToggle: (newValue) {
                                          setState(() {
                                            _died = newValue;
                                          });
                                        },
                                        activeColor: const Color.fromRGBO(
                                            0, 180, 140, 1.0),
                                        inactiveColor: const Color.fromRGBO(
                                            100, 100, 100, 1.0),
                                        borderRadius: 12,
                                        width: 47,
                                        height: 27,
                                        toggleSize: 16,
                                        // iq 150 papu, pa que no se corra el toggle del switch le pongo
                                        // un border del color verde, y así se ve más pequeño
                                        activeToggleBorder: Border.all(
                                          color: const Color.fromRGBO(
                                              0, 220, 167, 1.0),
                                          width: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignInside,
                                        ),
                                        inactiveToggleBorder: Border.all(
                                          color: const Color.fromRGBO(
                                              200, 200, 200, 1.0),
                                          width: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignInside,
                                        ),
                                      ),
                                      const SizedBox(width: 25),
                                      const Text(
                                        'Died/Immobilized',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    children: [
                                      FlutterSwitch(
                                        value: _tippy,
                                        onToggle: (newValue) {
                                          setState(() {
                                            _tippy = newValue;
                                          });
                                        },
                                        activeColor: const Color.fromRGBO(
                                            0, 180, 140, 1.0),
                                        inactiveColor: const Color.fromRGBO(
                                            100, 100, 100, 1.0),
                                        borderRadius: 12,
                                        width: 47,
                                        height: 27,
                                        toggleSize: 16,
                                        // iq 150 papu, pa que no se corra el toggle del switch le pongo
                                        // un border del color verde, y así se ve más pequeño
                                        activeToggleBorder: Border.all(
                                          color: const Color.fromRGBO(
                                              0, 220, 167, 1.0),
                                          width: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignInside,
                                        ),
                                        inactiveToggleBorder: Border.all(
                                          color: const Color.fromRGBO(
                                              200, 200, 200, 1.0),
                                          width: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignInside,
                                        ),
                                      ),
                                      const SizedBox(width: 25),
                                      const Text(
                                        'Tippy (Almost tipped over)',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    children: [
                                      FlutterSwitch(
                                        value: _mechFail,
                                        onToggle: (newValue) {
                                          setState(() {
                                            _mechFail = newValue;
                                          });
                                        },
                                        activeColor: const Color.fromRGBO(
                                            0, 180, 140, 1.0),
                                        inactiveColor: const Color.fromRGBO(
                                            100, 100, 100, 1.0),
                                        borderRadius: 12,
                                        width: 47,
                                        height: 27,
                                        toggleSize: 16,
                                        // iq 150 papu, pa que no se corra el toggle del switch le pongo
                                        // un border del color verde, y así se ve más pequeño
                                        activeToggleBorder: Border.all(
                                          color: const Color.fromRGBO(
                                              0, 220, 167, 1.0),
                                          width: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignInside,
                                        ),
                                        inactiveToggleBorder: Border.all(
                                          color: const Color.fromRGBO(
                                              200, 200, 200, 1.0),
                                          width: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignInside,
                                        ),
                                      ),
                                      const SizedBox(width: 25),
                                      const Text(
                                        'Mechanical Failures',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    children: [
                                      FlutterSwitch(
                                        value: _defense,
                                        onToggle: (newValue) {
                                          setState(() {
                                            _defense = newValue;
                                          });
                                        },
                                        activeColor: const Color.fromRGBO(
                                            0, 180, 140, 1.0),
                                        inactiveColor: const Color.fromRGBO(
                                            100, 100, 100, 1.0),
                                        borderRadius: 12,
                                        width: 47,
                                        height: 27,
                                        toggleSize: 16,
                                        // iq 150 papu, pa que no se corra el toggle del switch le pongo
                                        // un border del color verde, y así se ve más pequeño
                                        activeToggleBorder: Border.all(
                                          color: const Color.fromRGBO(
                                              0, 220, 167, 1.0),
                                          width: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignInside,
                                        ),
                                        inactiveToggleBorder: Border.all(
                                          color: const Color.fromRGBO(
                                              200, 200, 200, 1.0),
                                          width: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignInside,
                                        ),
                                      ),
                                      const SizedBox(width: 25),
                                      const Text(
                                        'Played Defense',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 30),
                                  const Text(
                                    'Comments',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13),
                                      color:
                                          const Color.fromARGB(255, 64, 64, 64),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 15,
                                    ),
                                    child: TextFormField(
                                      controller: _commentController,
                                      decoration:
                                          const InputDecoration.collapsed(
                                        hintText: 'Type here...',
                                      ),
                                      buildCounter: (
                                        context, {
                                        required int currentLength,
                                        required bool isFocused,
                                        required int? maxLength,
                                      }) =>
                                          null,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                      // Comment max characters
                                      maxLength: 170,
                                      maxLines: 5,
                                    ),
                                  ),
                                ],
                              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
