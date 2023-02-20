import 'package:botbusters_scout_app/screens/send.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/robots_provider.dart';

class SeeScreen extends StatefulWidget {
  const SeeScreen({super.key});

  static const routeName = '/see-screen';

  @override
  State<SeeScreen> createState() => _SeeScreenState();
}

class _SeeScreenState extends State<SeeScreen> {
  late final robotsProvider = Provider.of<RobotsProvider>(context);

// ! We set the future before the build() method, because
// ! it calls notifiyListeners(), and therefore it calls itself
// ! infinitely :p
  late final fetchAndSetRobots = robotsProvider.fetchAndSetRobots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('See'),
      ),
      body: SafeArea(
        child: FutureBuilder<void>(
            future: fetchAndSetRobots,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              }

              return ListView.builder(
                itemCount: robotsProvider.robots.length,
                itemBuilder: (ctx, i) {
                  final robot = robotsProvider.robots[i];

                  final color = robot.allianceId.characters.first == 'r'
                      ? Colors.red
                      : robot.allianceId.characters.first == 'b'
                          ? Colors.blue
                          : Colors.grey;
                  final colorName = robot.allianceId.characters.first == 'r'
                      ? 'Red'
                      : robot.allianceId.characters.first == 'b'
                          ? 'Blue'
                          : 'None';

                  return CupertinoButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        SendScreen.routeName,
                        arguments: robot,
                      );
                    },
                    padding: EdgeInsets.zero,
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      padding: const EdgeInsets.all(22.0),
                      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Match ${robot.matchNumber}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                '$colorName ${robot.allianceId.characters.last}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(
                            '#' + robot.teamNumber.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
