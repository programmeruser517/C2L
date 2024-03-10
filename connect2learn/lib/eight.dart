import 'package:flutter/material.dart';
import 'nine.dart';

class EightPage extends StatefulWidget {
  const EightPage({super.key});

  @override
  _EightPageState createState() => _EightPageState();
}

class _EightPageState extends State<EightPage> {
  TextEditingController emailController = TextEditingController();
  String? _sentEmail;
  bool _sending = false;
  bool _emailValid = true; // Add email validation state

  final List<String> _pendingRequests = ['John Doe', 'Alice Smith']; // Sample pending requests

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friend Invites'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Invite Friends:',
                style: TextStyle(fontSize: 20.0),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Enter Email',
                    border: const OutlineInputBorder(),
                    errorText: !_emailValid ? 'Email not valid!' : null, // Display error message
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  onPressed: _sending ? null : () => _sendInvite(emailController.text),
                  child: _sending ? const CircularProgressIndicator() : const Text('Send Friend Request'),
                ),
              ),
              const SizedBox(height: 20.0),
              if (_sentEmail != null)
                Text(
                  'Invite sent successfully to $_sentEmail\nContent: Be my friend!',
                  style: const TextStyle(color: Colors.green, fontSize: 15.0),
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: 20.0),
              const Text(
                'Friend Requests : ',
                style: TextStyle(color: Colors.red ,fontSize: 20.0),
              ),
              const SizedBox(height: 10.0),
              if (_pendingRequests.isNotEmpty)
                Column(
                  children: _pendingRequests.map((request) => _buildPendingRequest(request)).toList(),
                )
              else
                const Text(
                  'No Friend Requests pending',
                  style: TextStyle(color: Colors.black),
                ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NinePage()),
                  );
                },
                child: const Text('Go to Ninth Page'),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPendingRequest(String request) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 44, 67, 217), // Blue color for the box
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            request,
            style: const TextStyle(color: Colors.white),

          ),
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              _acceptRequest(request);
            },
            color: Colors.green,
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              _rejectRequest(request);
            },
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  void _sendInvite(String email) {
    // Clear the error message if "@" is found in the email
    if (email.contains('@')) {
      setState(() {
        _emailValid = true;
      });
    }

    // Check if email is valid
    if (email.contains('@')) {
      // Simulate sending invite
      setState(() {
        _sending = true;
      });

      // Simulate delay for sending invite
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _sentEmail = email;
          _sending = false;
        });
      });

      // Clear the email field after sending invite
      emailController.clear();
    } else {
      // Display error message if email is not valid
      setState(() {
        _emailValid = false;
      });
    }
  }

  void _acceptRequest(String name) {
    setState(() {
      _pendingRequests.remove(name);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You accepted an invitation from $name'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _rejectRequest(String name) {
    setState(() {
      _pendingRequests.remove(name);
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
