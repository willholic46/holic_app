// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holic_app/contact-page.dart';
import 'package:holic_app/model/locale.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GaleryPage extends StatelessWidget {
  const GaleryPage({super.key});

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
                    height: MediaQuery.of(context).size.height * 0.88,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 10,
                          left: 20,
                          child: SizedBox(
                            width: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: const Color.fromRGBO(32, 33, 37, 1),
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        t.header_texts_description_galery_page),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 60,
                          right: 0,
                          child: Container(
                            color: const Color.fromRGBO(32, 33, 37, 1),
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.45,
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.width * 1,
                          left: 0,
                          child: Container(
                            color: const Color.fromRGBO(32, 33, 37, 1),
                            height: 60,
                            width: MediaQuery.of(context).size.width * 0.6,
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.width * 1.3,
                          right: 50,
                          child: Container(
                            color: const Color.fromRGBO(32, 33, 37, 1),
                            height: 60,
                            width: MediaQuery.of(context).size.width * 0.6,
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.5,
                          right: 0,
                          child: Container(
                            color: const Color.fromRGBO(255, 81, 47, 1),
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.16,
                          ),
                        ),
                        Positioned(
                            top: MediaQuery.of(context).size.height * 0.1,
                            left: 20,
                            child: Image.asset("assets/images/person-3.png")),
                        Positioned(
                            top: MediaQuery.of(context).size.height * 0.14,
                            right: 10,
                            child: Image.asset("assets/images/object-2.png")),
                        Positioned(
                            top: MediaQuery.of(context).size.height * 0.4,
                            left: 20,
                            child: Image.asset(
                              "assets/images/person-4.png",
                              scale: 0.95,
                            )),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.4,
                          right: 10,
                          child: Image.asset(
                            "assets/images/person-5.png",
                            scale: 0.92,
                          ),
                        ),
                        Positioned(
                            top: MediaQuery.of(context).size.height * 0.635,
                            left: 20,
                            child: Image.asset("assets/images/object-3.png")),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.79,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            color: const Color.fromRGBO(255, 81, 47, 1),
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(t.footer_texts_description_galery_page,
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(
                                              255, 255, 255, 1))),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            _createRouteAnimationSliderLeft(
                                                const ContactPage()));
                                      },
                                      child: const Icon(Icons.arrow_forward,
                                          color: Color.fromRGBO(32, 33, 37, 1)))
                                ]),
                          ),
                        ),
                      ],
                    ),
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
