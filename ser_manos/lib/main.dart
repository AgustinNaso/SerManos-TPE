import 'package:flutter/material.dart';
import 'package:ser_manos/config/tokens/sermanos_colors.dart';

void main() {runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: SermanosColors.primary),
        useMaterial3: true,
      ),
      home: LoginScreen()
    );
  }
}

class LoginScreen extends StatelessWidget {
  bool hasFocus = false;
  FocusNode myFocusNode = FocusNode();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/images/logo.png', height: 150.0),
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0), // Set horizontal margin
                      child: const TextFieldCustom(
                        hintText: 'Email',
                        labelText: 'Email'
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0), // Set horizontal margin
                      child: const TextFieldCustom(
                        hintText: 'Password',
                        labelText: 'Password'
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Navigate to login screen
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                    ),
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Navigate to register screen
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                    ),
                    child: const Text('Register'),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// InputCustom
class TextFieldCustom extends StatefulWidget {
  final String hintText;
  final String labelText;


  const TextFieldCustom({super.key, required this.hintText, required this.labelText});

  @override
  State createState() {
    return _TextFieldCustom();
  }
}

class _TextFieldCustom extends State<TextFieldCustom> {
  final TextEditingController _textEditingController = TextEditingController();
  FocusNode myFocusNode = FocusNode();
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    myFocusNode.addListener(() => setState(() {
      _hasFocus = myFocusNode.hasFocus;
    })
    );
    _textEditingController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  void _clearText() {
    setState(() {
      _textEditingController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: myFocusNode,
      controller: _textEditingController,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        floatingLabelStyle: TextStyle(color: _hasFocus ? SermanosColors.secondary : SermanosColors.grey),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: SermanosColors.secondary),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: SermanosColors.grey),
        ),
        suffixIcon: _textEditingController.text.isNotEmpty && _hasFocus
            ? IconButton(
          icon: const Icon(Icons.clear, color: SermanosColors.grey),
          onPressed: _clearText,
        )
            : null,
      ),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/logo.png', height: 150.0), // Replace with your logo
                  const SizedBox(height: 20),
                  const Text(
                    '"El esfuerzo desitnteresado para llevar alegria a los demas sera el comienzo de una vida mas feliz para nosotros"',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic                      
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // TODO: Navigate to login screen
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                  ),
                  child: const Text('Login'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Navigate to register screen
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                  ),
                  child: const Text('Register'),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}