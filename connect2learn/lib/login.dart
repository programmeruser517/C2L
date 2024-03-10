import 'package:flutter/material.dart';
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Auth0 auth0;
  bool _isLoading = false;
  Credentials? _credentials;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();

    // Initialize dotenv
    dotenv.load().then((_) {
      String? auth0Domain = dotenv.env['AUTH0_DOMAIN'];
      String? auth0ClientId = dotenv.env['AUTH0_CLIENT_ID'];

      if (auth0Domain != null && auth0ClientId != null) {
        setState(() {
          auth0 = Auth0(auth0Domain, auth0ClientId);
          _isInitialized = true; // Mark as initialized
        });
      } else {
        throw Exception(
            "AUTH0_DOMAIN or AUTH0_CLIENT_ID is not defined in .env file");
      }
    }).catchError((error) {
      print('Error loading environment variables: $error');
    });
  }

  Future<void> loginaction() async {
    if (!_isInitialized) {
      print('Auth0 is not initialized');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final credentials = await auth0.webAuthentication().login();
      print('Access Token: ${credentials.accessToken}');
      setState(() {
        _isLoading = false;
      });

      if (_credentials == null) {
        setState(() {
          _credentials = credentials;
        });
      }

      Navigator.pushReplacementNamed(context, '/third');
    } catch (e) {
      print('Login error: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: _isInitialized ? loginaction : null,
                child: const Text('Login with Auth0'),
              ),
      ),
    );
  }
}
