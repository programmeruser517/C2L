import 'package:flutter/material.dart';
import 'onoroff.dart';

class SkillsPage extends StatefulWidget {
  @override
  _SkillsPageState createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  List<String> skills = [];
  TextEditingController skillController = TextEditingController();

  void addSkill() {
    if (skillController.text.isNotEmpty) {
      setState(() {
        skills.add(skillController.text);
        skillController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skill Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'What skills are you good at?',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: skillController,
                decoration: InputDecoration(
                  hintText: 'e.g. Calculus I, Python',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: addSkill,
                  ),
                ),
                onSubmitted: (value) => addSkill(),
                maxLines: 1,
              ),
            ),
            SizedBox(height: 20.0),
            Wrap(
              spacing: 8.0,
              children: [
                for (int i = 0; i < skills.length; i++)
                  Chip(
                    label: Text(skills[i]),
                    onDeleted: () {
                      setState(() {
                        skills.removeAt(i);
                      });
                    },
                  ),
              ],
            ),
            if (skills.isNotEmpty)
              SizedBox(height: 20.0),
            if (skills.isNotEmpty)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            OnorOffPage()), // Navigate to OnorOffPage
                  );
                },
                child: Text('Continue'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 44, 67, 217),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 44, 67, 217),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
