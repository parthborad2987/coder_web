import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Screen/webviewscreen.dart';
import '../provider/theme changer_provider.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemChanger>(context);

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            title: DefaultTextStyle(
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
              child: AnimatedTextKit(
                totalRepeatCount: 25,
                animatedTexts: [
                  ColorizeAnimatedText(
                    'Coder Web',
                    colors: [Colors.red, Colors.greenAccent],
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  ColorizeAnimatedText(
                    'Coder Web',
                    colors: [Colors.red, Colors.greenAccent],
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.language_outlined, size: 35),
            title: const Text(
              'Coder Web',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WebviewScreen()),
              );
            },
          ),
          Tooltip(
            message: 'ON Dark Mode',
            child: SwitchListTile(
              title: Text(themeChanger.themeMode == ThemeMode.dark
                  ? 'Dark Mode'
                  : 'Light Mode'),
              value: themeChanger.themeMode == ThemeMode.dark,
              onChanged: (bool value) {
                themeChanger.setTheme(value ? ThemeMode.dark : ThemeMode.light);
              },
              secondary: Icon(themeChanger.themeMode == ThemeMode.dark
                  ? Icons.dark_mode
                  : Icons.light_mode),
            ),
          ),
          const Divider(), // Adds a separator
          Tooltip(
            message: 'Go to About Us',
            child: ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About Us'),
              onTap: () {
                Navigator.pop(context);

                // Navigate to About Us screen
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUsScreen()));
              },
            ),
          ),
          Tooltip(
            message: 'Go to Privacy Policy',
            child: ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text('Privacy Policy'),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrivacyPolicyScreen(),
                  ),
                );
              },
            ),
          ),
          Tooltip(
            message: 'View Terms and Conditions',
            child: ListTile(
              leading: const Icon(Icons.article),
              title: const Text('Terms and Conditions'),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TermsAndConditionsScreen(),
                  ),
                );
              },
            ),
          ),
          Tooltip(
            message: 'Share Data',
            child: ListTile(
              leading: const Icon(Icons.share_outlined),
              title: const Text('Share'),
              onTap: () {
                // Share functionality
                Share.share('Check out our app at https://example.com');
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Dummy Screens for Navigation

class AboutUsScreen extends StatelessWidget {
  // Dummy data
  final String aboutUsText =
      "Welcome to Coder Web! We are passionate about providing the best web and mobile app solutions. "
      "Our goal is to create amazing products that enhance user experience. "
      "Visit our website for more information.";
  final String websiteUrl =
      "https://www.searchenginejournal.com/about-us-page-examples/250967/"; // Replace with your actual URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About Us')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              aboutUsText,
              style:
              Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () async {
                if (await canLaunchUrl(Uri.parse(websiteUrl))) {
                  await launchUrl(Uri.parse(websiteUrl));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Could not open the link")),
                  );
                }
              },
              child: Text(
                websiteUrl,
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrivacyPolicyScreen extends StatelessWidget {
  final String privacyPolicyText = """
  Privacy Policy

  This is a dummy Privacy Policy for demonstration purposes. Your data privacy
  and security are our top priorities. We do not collect sensitive information 
  without your consent. For more details, please contact us at support@example.com.
  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Privacy Policy")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            privacyPolicyText,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class TermsAndConditionsScreen extends StatelessWidget {
  final String termsText = """
  Terms and Conditions

  Welcome to our app! By using this app, you agree to the following terms:
  1. Use the app responsibly.
  2. Do not misuse or exploit the services provided.
  3. Adhere to local laws and regulations.
  For any inquiries, contact us at support@example.com.
  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Terms and Conditions")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            termsText,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
