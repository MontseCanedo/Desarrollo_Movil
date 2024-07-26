import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:punto_venta/pages/branch_office_selection_page.dart';
import 'package:punto_venta/pages/buttom_nav.dart';
import 'package:punto_venta/pages/home_page.dart';
import 'package:punto_venta/utils/routes.dart';
//import 'package:punto_venta/pages/branch_office_selection_page.dart';
import 'package:punto_venta/pages/login_page.dart';
import 'package:flutter/services.dart';
//import 'package:punto_venta/widgets/card_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      title: 'TTP Consumibles',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const MyHomePage(title: 'TTP CONSUMIBLES'),
      //home: const LoginPage(),
      //home: const BranchOfficeSelectionPage(),
      home: const HomePage(),
      /* routes: {
        LoginPage.routeName: (_) => const LoginPage(),
        //CardView.routeName: (_) => const CardView(),
      }, */
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  BNavigator? myBNB;
  bool _hasInternetConnection = false;
  Timer? _timer;

  void _onMenuItemPressed(int i) {
    setState(() {
      index = i;
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    myBNB = BNavigator(currentIndex: (i) {
      setState(() {
        index = i;
      });
    });
    super.initState();
    _checkInternetConnection();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(
        const Duration(seconds: 5), (timer) => _checkInternetConnection());
  }

  Future<void> _checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        // Hay conexión a internet
        if (!_hasInternetConnection) {
          setState(() => _hasInternetConnection = true);
        }
      } else if (_hasInternetConnection) {
        // No hay conexión a internet
        setState(() => _hasInternetConnection = false);
        _showNoInternetDialog();
      }
    } on SocketException catch (_) {
      // No hay conexión a internet
      if (_hasInternetConnection) {
        setState(() => _hasInternetConnection = false);
        _showNoInternetDialog();
      }
    }
  }

  void _showNoInternetDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sin conexión a Internet'),
        content: const Text(
            'Esta aplicación necesita una conexión a Internet para funcionar correctamente.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_hasInternetConnection) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: 200,
                height: 200,
                margin: const EdgeInsets.only(top: 50, bottom: 20),
                child: const Image(
                  image: AssetImage('assets/ttpconsumibles1.jpg'),
                ),
              ),
              const Text("TTP Consumibles",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              InkWell(
                onTap: () => _onMenuItemPressed(0),
                child: Container(
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  color: Colors.grey[100],
                  child: const Text("Inicio"),
                ),
              ),
              InkWell(
                onTap: () => _onMenuItemPressed(1),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  color: Colors.grey[100],
                  child: const Text("Configuración"),
                ),
              ),
              InkWell(
                onTap: () => _onMenuItemPressed(2),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  color: Colors.grey[100],
                  child: const Text("Cotizaciones"),
                ),
              ),
              InkWell(
                onTap: () => _onMenuItemPressed(3),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  color: Colors.grey[100],
                  child: const Text("Cierre de caja"),
                ),
              ),
              Expanded(child: Container()),
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: Colors.black87,
                alignment: Alignment.center,
                child: const Text("Salir",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(title: const Text('TTP CONSUMIBLES')),
      bottomNavigationBar: myBNB,
      body: Routes(index: index),
    );
  }
}
