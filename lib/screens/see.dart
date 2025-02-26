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
  late final matchesProvider = Provider.of<RobotsProvider>(context);

// ! We set the future before the build() method, because
// ! it calls notifiyListeners(), and therefore it calls itself
// ! infinitely :p
  late final fetchAndSetRobots = matchesProvider.fetchAndSetRobots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'See',
          style: TextStyle(fontWeight: FontWeight.bold),
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
        actions: [
          CupertinoButton(
            child: const Icon(
              Icons.delete_forever_rounded,
              color: Colors.redAccent,
            ),
            padding: EdgeInsets.zero,
            onPressed: () async {
              final bool? deleteEverything = await showCupertinoDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    insetPadding: const EdgeInsets.fromLTRB(20, 80, 20, 15),
                    alignment: Alignment.center,
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 400,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              const Icon(
                                Icons.warning_rounded,
                                color: Colors.amber,
                                size: 40,
                              ),
                              const SizedBox(height: 7),
                              const Text(
                                'Delete ALL DATA?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'This action can not be undone.',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  const Spacer(),
                                  CupertinoButton(
                                    padding: const EdgeInsets.all(5.0),
                                    child: const Text(
                                      'Yes',
                                      style: TextStyle(
                                        color: Color.fromARGB(
                                          255,
                                          255,
                                          117,
                                          117,
                                        ),
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    onPressed: () async {
                                      // ! The user can press the button twice
                                      // ! Prevent it with some variable _isLoading
                                      Navigator.of(context).pop(true);
                                    },
                                  ),
                                  const Spacer(),
                                  CupertinoButton(
                                    padding: const EdgeInsets.all(5.0),
                                    child: const Text(
                                      'No',
                                      style: TextStyle(
                                        color: Colors.lightBlueAccent,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop(false);
                                    },
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );

              if (deleteEverything == true) {
                await matchesProvider.deleteEverything();
              }
            },
          ),
        ],
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

            final sortedRobots = matchesProvider.matches
              ..sort(
                (a, b) => a.matchNumber.compareTo(b.matchNumber),
              );

            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16.0),
              itemCount: sortedRobots.length,
              itemBuilder: (ctx, i) {
                final match = sortedRobots[i];

                final color = match.allianceId.characters.first == 'r'
                    ? const Color.fromARGB(255, 255, 0, 51)
                    : match.allianceId.characters.first == 'b'
                        ? const Color.fromARGB(255, 16, 68, 211)
                        : Colors.grey;
                final colorName = match.allianceId.characters.first == 'r'
                    ? 'Red'
                    : match.allianceId.characters.first == 'b'
                        ? 'Blue'
                        : 'None';

                return Dismissible(
                  key: Key(match.id),
                  direction: DismissDirection.endToStart,
                  confirmDismiss: (_) {
                    return showCupertinoDialog(
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
                            child: SizedBox(
                              width: 400,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    const Icon(
                                      Icons.warning_rounded,
                                      color: Colors.amber,
                                      size: 40,
                                    ),
                                    const SizedBox(height: 7),
                                    const Text(
                                      'Delete this match?',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      'This action can not be undone.',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      children: [
                                        const Spacer(),
                                        CupertinoButton(
                                          padding: const EdgeInsets.all(5.0),
                                          child: const Text(
                                            'Yes',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                255,
                                                255,
                                                117,
                                                117,
                                              ),
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          onPressed: () async {
                                            // ! The user can press the button twice
                                            // ! Prevent it with some variable _isLoading
                                            matchesProvider.deleteMatch(
                                              match,
                                            );

                                            Navigator.of(context).pop(true);
                                          },
                                        ),
                                        const Spacer(),
                                        CupertinoButton(
                                          padding: const EdgeInsets.all(5.0),
                                          child: const Text(
                                            'No',
                                            style: TextStyle(
                                              color: Colors.lightBlueAccent,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop(false);
                                          },
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: (MediaQuery.of(context).size.width - 40.0) > 500
                          ? 500
                          : (MediaQuery.of(context).size.width - 40.0),
                    ),
                    child: CupertinoButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          SendScreen.routeName,
                          arguments: match,
                        );
                      },
                      padding: EdgeInsets.zero,
                      child: Container(
                        height: 100,
                        width: 500,
                        padding: const EdgeInsets.all(22.0),
                        margin: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
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
                                  'Match ${match.matchNumber}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    fontFamily: 'Inter',
                                  ),
                                ),
                                Text(
                                  '$colorName ${match.allianceId.characters.last}',
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
                              '#' + match.teamNumber.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'IBM Plex Mono',
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
