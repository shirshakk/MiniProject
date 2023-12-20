import 'package:book_swapping/view/components/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../modelview/firebase/book/bookController.dart';
import '../modelview/firebase/user/deslogarFirebase.dart';

class SignedScreen extends StatefulWidget {
  const SignedScreen({Key? key}) : super(key: key);

  @override
  State<SignedScreen> createState() => _SignedScreenState();
}

class _SignedScreenState extends State<SignedScreen> {
  final BookController bookController = Get.put(BookController());
  bool _isFinish = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Club'),
        actions: [
          GestureDetector(onTap: deslogarFirebase, child: Icon(Icons.logout)),
        ],
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned.fill(
                    child: RiveAnimation.asset(
                  "assets/animations/book.riv",
                  fit: BoxFit.cover,
                )),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.4,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: AnimatedTextKit(
                totalRepeatCount: 1,
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Welcome to your journey towards Learning! '
                    'The Book Club will help you find the best books'
                    'without spending anything out of your pocket. We are a community that likes'
                    'to share knowledge!',
                    textAlign: TextAlign.center,
                    textStyle: const TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 50),
                  ),
                ],
                pause: const Duration(milliseconds: 500),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
                onFinished: () {
                  setState(() {
                    _isFinish = true;
                  });
                },
              ),
            ),
            _isFinish
                ? Container(
                    width: 200,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green)),
                      onPressed: () {
                        Get.toNamed('/listAllUsersBooks');
                      },
                      child: Text('Start Day'),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
