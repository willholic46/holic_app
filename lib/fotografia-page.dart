// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holic_app/desing-page.dart';
import 'package:holic_app/model/locale.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FotografiaPage extends StatelessWidget {
  const FotografiaPage({super.key});

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
                                    Text(t
                                        .header_texts_name_person_fotografia_page),
                                    Text(t.header_texts_station_fotografia_page)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(t.header_texts_job_fotografia_page),
                                    Text(t.header_texts_year_fotografia_page)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.4,
                          left: 10,
                          child: Image.asset('assets/images/ellipse-2.png'),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.5,
                          left: 20,
                          child: Image.asset('assets/images/ellipse-1.png'),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.3,
                          right: 0,
                          child: Container(
                            color: const Color.fromRGBO(255, 81, 47, 1),
                            height: 240,
                            width: MediaQuery.of(context).size.width * 0.8,
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.267,
                          right: MediaQuery.of(context).size.width * 0.208,
                          child: Image.asset("assets/images/person-2.png"),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.22,
                          right: 40,
                          child: RotatedBox(
                              quarterTurns: 3,
                              child: Container(
                                color: const Color.fromRGBO(32, 33, 37, 1),
                                height: 70,
                                padding: const EdgeInsets.only(right: 20),
                                width: MediaQuery.of(context).size.width * 0.6,
                                alignment: Alignment.centerRight,
                                child: Text(t.name_page_fotografia_page,
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.normal,
                                        color:
                                            Color.fromRGBO(255, 255, 255, 1))),
                              )),
                        ),
                        Positioned(
                            top: MediaQuery.of(context).size.height * 0.72,
                            left: 20,
                            child: Text(t.title_home,
                                style: const TextStyle(
                                    fontSize: 55,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(32, 33, 37, 1)))),
                        Positioned(
                            top: MediaQuery.of(context).size.height * 0.79,
                            right: 0,
                            bottom: 0,
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: Container(
                                color: const Color.fromRGBO(255, 81, 47, 1),
                                height: 60,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          _createRouteAnimationSliderBottom(
                                              const DesingPage()));
                                    },
                                    child: const Icon(Icons.arrow_forward,
                                        color: Color.fromRGBO(32, 33, 37, 1))),
                              ),
                            )),
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

Route _createRouteAnimationSliderBottom(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.1, 1.0);
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
