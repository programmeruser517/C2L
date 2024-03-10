import 'package:flutter/material.dart';
import 'skills.dart';

class SchedPage extends StatefulWidget {
  const SchedPage({super.key});

  @override
  State<SchedPage> createState() => _SchedPageState();
}

class _SchedPageState extends State<SchedPage> {
  final List<TextEditingController> _controllers = List.generate(14, (_) => TextEditingController());
  List<String> _controllers_real = [];
  bool _isContinueButtonVisible = false;

  bool _isValidTime(String time) {
    final RegExp timeRegExp = RegExp(r'^([01]?[0-9]|2[0-3]):([0-5][0-9])$');
    return timeRegExp.hasMatch(time);
  }

  void _updateContinueButtonVisibility() {
    setState(() {
      _isContinueButtonVisible = _controllers.every((controller) => _isValidTime(controller.text));
    });
  }

  @override
  void initState() {
    super.initState();
    for (final controller in _controllers) {
      controller.addListener(_updateContinueButtonVisibility);
    }
    _controllers[0].text = '';
    _controllers[1].text = '';
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Center(
                child: Text(
                  "What's your free time look like?\n (including desired group homework\n time, etc.)",
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Military Time',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              ...List.generate(7, (index) {
                final day = ['Monday      ', 'Tuesday     ', 'Wednesday','Thursday   ','Friday        ', 'Saturday   ', 'Sunday     '][index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(day, style: const TextStyle(fontSize: 18.0)),
                      const SizedBox(width: 20.0),
                      SizedBox(
                        width: 80.0,
                        child: TextField(
                          controller: _controllers[index * 2],
                          decoration: const InputDecoration(hintText: '08:00'),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      SizedBox(
                        width: 80.0,
                        child: TextField(
                          controller: _controllers[index * 2 + 1],
                          decoration: const InputDecoration(hintText: '19:00'),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 20.0),
              Visibility(
                visible: _isContinueButtonVisible,
                child: ElevatedButton(
                  onPressed: () {
                    _controllers_real = [];
                    for (final controller in _controllers) {
                      _controllers_real.add(controller.text);
                    }
                    print(_controllers_real);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SkillsPage()), // Navigate to SkillsPage
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 44, 67, 217),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: const Text('Continue')
                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
