import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the package for launching URLs

class PrivacyPolicyCheckbox extends StatefulWidget {
  @override
  _PrivacyPolicyCheckboxState createState() => _PrivacyPolicyCheckboxState();
}

class _PrivacyPolicyCheckboxState extends State<PrivacyPolicyCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        'I agree to the Privacy Policy',
        style: TextStyle(fontSize: 16.0),
      ),
      value: _isChecked,
      onChanged: (bool? value) {
        setState(() {
          _isChecked = value!;
          if (_isChecked) {
            _launchURL(); // Launch the URL when the checkbox is checked
          }
        });
      },
    );
  }

  // Function to launch the URL
  Future<void> _launchURL() async {
    const url = 'https://www.blogger.com/blog/post/edit/5080575995368649972/2987113674948225182?hl=en'; // Replace with your privacy policy URL
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy Checkbox'),
      ),
      body: Center(
        child: PrivacyPolicyCheckbox(),
      ),
    ),
  ));
}

// Example usage:
// Use this PrivacyPolicyPage widget in your SignUp screen.
