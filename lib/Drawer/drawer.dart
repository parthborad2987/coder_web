import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppBar(
            title: DefaultTextStyle(
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ), child: AnimatedTextKit(totalRepeatCount: 25,
              animatedTexts: [
                ColorizeAnimatedText('Coder Web', colors: [Colors.red,Colors.greenAccent,], textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                ColorizeAnimatedText('Coder Web', colors: [Colors.red,Colors.greenAccent,], textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              ],
            ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.language_outlined,size: 35),
            title: const Text('Coder Web',style: TextStyle(fontSize: 20),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => WebviewScreen()));
            },
          ),
         RadioListTile<ThemeMode>(
           title: const Text('Light Mode'),
             value: ThemeMode.light,
             groupValue: themeChanger.themeMode,
             onChanged: themeChanger.setTheme,
         ),
          RadioListTile<ThemeMode>(
            title: const Text('Dark Mode'),
            value: ThemeMode.dark,
            groupValue: themeChanger.themeMode,
            onChanged: themeChanger.setTheme,
          ),
        ],
      ),
    );
  }
}
