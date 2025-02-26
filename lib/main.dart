import 'package:botbusters_scout_app/providers/robots_provider.dart';
import 'package:botbusters_scout_app/providers/scout_data_provider.dart';
import 'package:botbusters_scout_app/screens/qr_screen.dart';
import 'package:botbusters_scout_app/screens/see.dart';
import 'package:botbusters_scout_app/screens/send.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:botbusters_scout_app/models/robot_match.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(RobotMatchAdapter());
  }

  runApp(const BotbustersScoutApp());
}

class BotbustersScoutApp extends StatelessWidget {
  const BotbustersScoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Botbusters Scouting App',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        primarySwatch: Colors.red,
        fontFamily: 'Inter',
        platform: TargetPlatform.iOS,
      ),
      home: const InitializerWidget(),
    );
  }
}

class InitializerWidget extends StatelessWidget {
  const InitializerWidget({super.key});

  Future<List<ChangeNotifierProvider>> _initializeProviders() async {
    final robotsProvider = await RobotsProvider.initialize();

    return [
      ChangeNotifierProvider<ScoutDataProvider>(
        create: (_) => ScoutDataProvider(),
      ),
      ChangeNotifierProvider<RobotsProvider>(
        create: (_) => robotsProvider,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChangeNotifierProvider>>(
      future: _initializeProviders(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return MaterialApp(
            theme: ThemeData(
              colorScheme: const ColorScheme.dark(),
              primarySwatch: Colors.red,
              fontFamily: 'Inter',
              platform: TargetPlatform.iOS,
            ),
            home: const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        if (snapshot.hasError) {
          return MaterialApp(
            theme: ThemeData(
              colorScheme: const ColorScheme.dark(),
              primarySwatch: Colors.red,
              fontFamily: 'Inter',
              platform: TargetPlatform.iOS,
            ),
            home: Scaffold(
              body: Center(
                child: Text('Error: ${snapshot.error}'),
              ),
            ),
          );
        }

        return MultiProvider(
          providers: snapshot.data!,
          child: MaterialApp(
            title: 'Botbusters Scouting App',
            theme: ThemeData(
              colorScheme: const ColorScheme.dark(),
              primarySwatch: Colors.red,
              fontFamily: 'Inter',
              platform: TargetPlatform.iOS,
            ),
            routes: {
              '/': (ctx) => const HomeScreen(),
              SendScreen.routeName: (ctx) => const SendScreen(),
              SeeScreen.routeName: (ctx) => const SeeScreen(),
              QRCodeScreen.routeName: (ctx) => const QRCodeScreen(),
            },
          ),
        );
      },
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/imgs/botbusters_logo.png',
                height: 150,
              ),
              const Text(
                "Scouting App (Mau's Version)",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width > 600
                      ? 600
                      : (MediaQuery.of(context).size.width - 40.0),
                ),
                child: FutureBuilder<void>(
                  future: _scoutUserFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return const CupertinoActivityIndicator();
                    }
                    if (_scoutDataProvider.scoutUser == null) {
                      return Form(
                        key: _signInKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Scout Id',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromARGB(255, 73, 73, 73),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 9,
                                  horizontal: 16,
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
                              const SizedBox(height: 20),
                              const Text(
                                'Scout Name',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromARGB(255, 73, 73, 73),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 9,
                                  horizontal: 16,
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
                              const SizedBox(height: 15),
                              // It gets centered just like wrapping inside a row and setting mainAxisAlignment.center!
                              Center(
                                child: CupertinoButton(
                                  onPressed: () async {
                                    if (_signInKey.currentState!.validate()) {
                                      await _scoutDataProvider.signIn(
                                        _scoutIdController.text,
                                        _scoutNameController.text,
                                      );
                                    }
                                  },
                                  child: Container(
                                    width: 250,
                                    height: 45,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13.0),
                                      color:
                                          const Color.fromRGBO(255, 0, 46, 1.0),
                                    ),
                                    child: const Text(
                                      "LET'S GO!",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 1.1,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
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
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 95,
                              width: 120,
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
                                    color: const Color.fromRGBO(
                                      255,
                                      0,
                                      46,
                                      1.0,
                                    ),
                                  ),
                                  child: const Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.send_rounded,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        'Send/Save',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 30),
                            SizedBox(
                              height: 95,
                              width: 120,
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
                                  child: const Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.manage_search_rounded,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        'Saved',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        const Text('Scout ID'),
                        Text(
                          _scoutDataProvider.scoutUser!.id,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 15),
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () async {
                            await _scoutDataProvider.signOut();
                          },
                          child: Container(
                            width: 125,
                            height: 45,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.0),
                              color: const Color.fromARGB(255, 84, 84, 84),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.arrow_back_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 4.0),
                                Text(
                                  "Sign out",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/imgs/prepatec_garzasada_logo.png',
                    height: 50,
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    'assets/imgs/reefscape.png',
                    height: 70,
                  ),
                  const SizedBox(width: 25),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
