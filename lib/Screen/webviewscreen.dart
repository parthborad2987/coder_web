// ignore_for_file: unused_local_variable, use_build_context_synchronously, prefer_interpolation_to_compose_strings, prefer_typing_uninitialized_variables, must_be_immutable
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../Drawer/drawer.dart';
import '../provider/theme changer_provider.dart';
import 'mywebvie.dart';

class WebviewScreen extends StatefulWidget {
   WebviewScreen( {super.key});
  WebViewController? controller;

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  var url;
  final _formKey = GlobalKey<FormState>();
  final loadingPercentage = 0.0;
  final bool _urlExists = false;
  late final WebViewController controller;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller = WebViewController();
  }

  _onSearch() async {
    url = _searchController.text;
     await Navigator.push(context, MaterialPageRoute(builder: (context) => MyWebView(controller: controller,url: url)));
  }

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemChanger>(context);

    return Scaffold(
      backgroundColor: themeChanger.themeMode == ThemeMode.light ? Colors.grey.shade100 : Colors.black,
       drawer: const AppDrawer(),
        appBar: AppBar(
          title: DefaultTextStyle(
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ), child: AnimatedTextKit(totalRepeatCount: 25,
              animatedTexts: [
                ColorizeAnimatedText('Coder Web', colors: [Colors.red,Colors.greenAccent,], textStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                ColorizeAnimatedText('Coder Web', colors: [Colors.red,Colors.greenAccent,], textStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              ],
             ),
          ),
        ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                const SizedBox(height: 10,),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.9,
                  color:themeChanger.themeMode == ThemeMode.light ? Colors.white : Colors.grey.shade800,
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      autofocus: false,
                      controller: _searchController..text = "https://",
                      onChanged: (text) => {},
                      decoration: InputDecoration(
                        border:  const OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        prefixIcon: const Icon(Icons.language_outlined,size: 35,color: Colors.purpleAccent,),
                        suffixIcon: FloatingActionButton(
                          backgroundColor: Colors.purpleAccent,
                          shape: const CircleBorder(
                            side: BorderSide(
                                color: Colors.purpleAccent,
                                width: 10.5,
                                strokeAlign: BorderSide.strokeAlignOutside
                            ),
                          ),
                          onPressed: _onSearch,
                          child: const Icon(Icons.arrow_right_alt_outlined,color: Colors.white,size: 35,),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Divider(),
                const SizedBox(height: 16.0),
                const Text('Check this out',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                const SizedBox(height: 10.0),
                if (_urlExists)
                  _onSearch(),

                InkWell(
                  onTap: () {
                     url = 'https:/dribbble.com';
                     Navigator.push(context, MaterialPageRoute(builder: (context) => MyWebView(controller: controller,url: url)));
                  },
                  child: Container(
                    height: 40,
                    width: 200,
                    color: themeChanger.themeMode == ThemeMode.light ? Colors.white : Colors.grey.shade800,
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Image.network('https://cdn-icons-png.flaticon.com/128/733/733544.png', height: 30,width: 30,),
                        const SizedBox(width: 10),
                        const Text('Dribbble',),
                        const Spacer(),
                        const Icon(Icons.chevron_right),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),),
                const SizedBox(height: 10,),
                InkWell(
                  onTap: ()  {
                    const url = 'https://codecanyon.net/';

                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyWebView(controller: controller,url: url)));
                  },

                  child: Container(
                    height: 40,
                    width: 200,
                    color: themeChanger.themeMode == ThemeMode.light ? Colors.white : Colors.grey.shade800,
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Image.network('https://cdn-icons-png.flaticon.com/128/24/24429.png', height: 30,width: 30,),
                        const SizedBox(width: 10),
                        const Text('CodeCanyon',),
                        const Spacer(),
                        const Icon(Icons.chevron_right,),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),),
                const SizedBox(height: 10,),
                InkWell(
                  onTap: () {
                    const url = 'https://in.pinterest.com/';

                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyWebView(controller: controller,url: url)));
                  },

                  child: Container(
                    height: 40,
                    width: 200,
                    color: themeChanger.themeMode == ThemeMode.light ? Colors.white : Colors.grey.shade800,
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Image.network('https://cdn-icons-png.flaticon.com/128/3536/3536559.png', height: 30,width: 30,),
                        const SizedBox(width: 10),
                        const Text('Pinterest',),
                        const Spacer(),
                        const Icon(Icons.chevron_right,),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),),
                const SizedBox(height: 10,),
                InkWell(
                  onTap: () {
                    const url = 'https://codersquad.co.in/';

                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyWebView(controller: controller,url: url)));
                  },
                  child: Container(
                      width: 200,
                      color: themeChanger.themeMode == ThemeMode.light ? Colors.white : Colors.grey.shade800,
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTN4zrIAn34eAd45iVLauklsa7eSbyLLQEzlKIGnmhY6mK1xEiQOE-RCOxXYHmkeTxGcQ&usqp=CAU',
                            height: 40,width: 40,),
                          const SizedBox(width: 10),
                          const Text('CoderSquad',),
                          const Spacer(),
                          const Icon(Icons.chevron_right,),
                          const SizedBox(width: 10),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
