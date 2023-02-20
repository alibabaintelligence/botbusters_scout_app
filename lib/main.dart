import 'package:botbusters_scout_app/providers/robots_provider.dart';
import 'package:botbusters_scout_app/providers/scout_data_provider.dart';
import 'package:botbusters_scout_app/screens/qr_screen.dart';
import 'package:botbusters_scout_app/screens/see.dart';
import 'package:botbusters_scout_app/screens/send.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const BotbustersScoutApp());
}

class BotbustersScoutApp extends StatelessWidget {
  const BotbustersScoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ScoutDataProvider>(
          create: (_) => ScoutDataProvider(),
        ),
        ChangeNotifierProvider<RobotsProvider>(
          create: (_) => RobotsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Botbusters Scouting App',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        routes: {
          '/': (ctx) => const HomeScreen(),
          SendScreen.routeName: (ctx) => const SendScreen(),
          SeeScreen.routeName: (ctx) => const SeeScreen(),
          QRCodeScreen.routeName: (ctx) => const QRCodeScreen(),
        },
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final _scoutDataProvider = Provider.of<ScoutDataProvider>(context);

  late final _scoutUserFuture = _scoutDataProvider.tryToRecoverSavedUser();

  final _scoutIdController = TextEditingController();
  final _scoutNameController = TextEditingController();

  final _signInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/imgs/botbusters_logo.png', height: 150),
            const SizedBox(height: 20),
            FutureBuilder<void>(
              future: _scoutUserFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const CupertinoActivityIndicator();
                }

                if (_scoutDataProvider.scoutUser == null) {
                  return Form(
                    key: _signInKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Scout Id',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: const Color.fromARGB(255, 239, 239, 239),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                            child: TextFormField(
                              controller: _scoutIdController,
                              decoration: const InputDecoration.collapsed(
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
                                color: Colors.black87,
                                fontSize: 16,
                              ),
                              textInputAction: TextInputAction.done,
                              validator: (id) {
                                if (id == null || id.isEmpty) {
                                  return "Write something";
                                }
                                return null;
                              },
                            ),
                          ),
                          const Text(
                            'Scout Name',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: const Color.fromARGB(255, 239, 239, 239),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                            child: TextFormField(
                              controller: _scoutNameController,
                              decoration: const InputDecoration.collapsed(
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
                                color: Colors.black87,
                                fontSize: 16,
                              ),
                              textInputAction: TextInputAction.done,
                              validator: (name) {
                                if (name == null || name.isEmpty) {
                                  return "Write something";
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 30),
                          CupertinoButton(
                            onPressed: () async {
                              if (_signInKey.currentState!.validate()) {
                                await _scoutDataProvider.signIn(
                                  _scoutIdController.text,
                                  _scoutNameController.text,
                                );
                              }
                            },
                            child: Container(
                              width: 100,
                              height: 45,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: const Color.fromRGBO(255, 0, 46, 1.0),
                              ),
                              child: const Text(
                                "LET'S GO!",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Hi ${_scoutDataProvider.scoutUser!.name}!',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 85,
                              child: CupertinoButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                    SendScreen.routeName,
                                  );
                                },
                                borderRadius: BorderRadius.circular(16.0),
                                padding: EdgeInsets.zero,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color:
                                        const Color.fromRGBO(255, 0, 46, 1.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(
                                        Icons.ios_share_rounded,
                                        color: Colors.white,
                                        size: 26,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Send',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 85,
                              child: CupertinoButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                    SeeScreen.routeName,
                                  );
                                },
                                borderRadius: BorderRadius.circular(16.0),
                                padding: EdgeInsets.zero,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color:
                                        const Color.fromRGBO(78, 78, 78, 1.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(
                                        Icons.segment_sharp,
                                        color: Colors.white,
                                        size: 26,
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        'See',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Scout ID: '),
                        Text(_scoutDataProvider.scoutUser!.id),
                      ],
                    ),
                    const SizedBox(height: 30),
                    CupertinoButton(
                      onPressed: () async {
                        await _scoutDataProvider.signOut();
                      },
                      child: Container(
                        width: 100,
                        height: 45,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: const Color.fromARGB(255, 84, 84, 84),
                        ),
                        child: const Text(
                          "Sign out",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
