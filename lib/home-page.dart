// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holic_app/fotografia-page.dart';
import 'package:holic_app/model/locale.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Scaffold(
        body: Scaffold(
            backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const HeaderHolic(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.78,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 50,
                          left: 20,
                          child: Text(t.title_home,
                              style: const TextStyle(
                                  fontSize: 55,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(32, 33, 37, 1))),
                        ),
                        Positioned(
                          top: 40,
                          right: 0,
                          child: Image.asset("assets/images/person-1.png"),
                        ),
                        Positioned(
                          top: 160,
                          left: 20,
                          child: RotatedBox(
                              quarterTurns: 3,
                              child: Text(t.vertical_description_home,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(32, 33, 37, 1)))),
                        ),
                        Positioned(
                          top: 440,
                          right: 0,
                          child: Container(
                            color: const Color.fromRGBO(255, 81, 47, 1),
                            height: 240,
                            width: MediaQuery.of(context).size.width * 0.9,
                          ),
                        ),
                        Positioned(
                          top: 460,
                          left: 0,
                          child: Container(
                            color: const Color.fromRGBO(32, 33, 37, 1),
                            height: 60,
                            width: MediaQuery.of(context).size.width * 0.5,
                          ),
                        ),
                        Positioned(
                          top: 595,
                          right: 0,
                          child: Container(
                            color: const Color.fromRGBO(32, 33, 37, 1),
                            height: 60,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                      _createRouteAnimationSliderLeft(
                                          const FotografiaPage()));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(t.button_next_pafe_home,
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(
                                                250, 250, 250, 1))),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    const Icon(Icons.arrow_forward,
                                        color: Color.fromRGBO(255, 81, 47, 1))
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    constraints: const BoxConstraints(maxHeight: 200),
                    width: double.infinity,
                    color: const Color.fromRGBO(32, 33, 37, 1),
                    child: Text(t.foter_description_home,
                        style: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1))),
                  )
                ],
              ),
            )));
  }
}

class HeaderHolic extends StatelessWidget {
  const HeaderHolic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
      decoration: const BoxDecoration(color: Color.fromRGBO(240, 240, 240, 1)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SvgPicture.asset('assets/svg/logo-holic.svg'),
        Consumer<LocaleModel>(
            builder: (context, localeModel, child) => Row(children: [
                  TextButton(
                      onPressed: () {
                        localeModel.set(const Locale('pt'));
                      },
                      child: const Text(
                        'PT',
                        style: TextStyle(color: Color.fromRGBO(32, 33, 37, 1)),
                      )),
                  TextButton(
                      onPressed: () {
                        localeModel.set(const Locale('en'));
                      },
                      child: const Text(
                        'EN',
                        style: TextStyle(color: Color.fromRGBO(32, 33, 37, 1)),
                      ))
                ]))
      ]),
    );
  }
}

Route _createRouteAnimationSliderLeft(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
