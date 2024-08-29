// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holic_app/model/locale.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Scaffold(
        body: Scaffold(
            backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
            body: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.32,
                    right: 25,
                    child: Image.asset('assets/images/ellipse-2.png'),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.5,
                    right: 50,
                    child: Image.asset('assets/images/ellipse-1.png'),
                  ),
                  Positioned(
                      top: MediaQuery.of(context).size.height * 0.71,
                      right: 0,
                      child: Container(
                        color: const Color.fromRGBO(255, 81, 47, 1),
                        height: 70,
                        width: MediaQuery.of(context).size.width * 0.4,
                      )),
                  Positioned(
                      top: MediaQuery.of(context).size.height * 0.65,
                      left: 0,
                      child: Container(
                        color: const Color.fromRGBO(32, 33, 37, 1),
                        height: 200,
                        width: 15,
                      )),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const HeaderHolic(),
                        Container(
                            height: MediaQuery.of(context).size.height * 0.8,
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      color:
                                          const Color.fromRGBO(32, 33, 37, 1),
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(t
                                            .header_texts_description_galery_page),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Text(t.form_text_input_email_contact_page,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(0, 0, 0, 1))),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: t
                                        .form_text_placeholder_email_contact_page,
                                    filled: true,
                                    border: const OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Text(t.form_text_checkbox_interest,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(0, 0, 0, 1))),
                                Container(
                                  color: const Color.fromRGBO(32, 33, 37, 1),
                                  width: MediaQuery.of(context).size.width,
                                  height: 1,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        const CheckboxExample(),
                                        Text(t.form_checkbox_interest_1,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                            ))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const CheckboxExample(),
                                        Text(t.form_checkbox_interest_2,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Text(t.form_Text_input_message_contact_page,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(0, 0, 0, 1))),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: t
                                        .form_text_placeholder_message_contact_page,
                                    filled: true,
                                    border: const OutlineInputBorder(),
                                  ),
                                  minLines:
                                      6, // any number you need (It works as the rows for the textarea)
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                              ],
                            )),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 12, bottom: 10),
                          color: const Color.fromRGBO(255, 81, 47, 1),
                          // height: 100,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    // Open modal confirm
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            const ModalConfirm());
                                  },
                                  child: Text(
                                      t.footer_texts_description_contact_page,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(
                                              255, 255, 255, 1))),
                                ),
                                TextButton(
                                    onPressed: () {
                                      // Open modal confirm
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              const ModalConfirm());
                                    },
                                    child: const Icon(Icons.arrow_forward,
                                        color: Color.fromRGBO(32, 33, 37, 1)))
                              ]),
                        ),
                      ]),
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

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor() {
      if (isChecked) {
        return Colors.red;
      }
      return Colors.grey;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: WidgetStateProperty.all(getColor()),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

class ModalConfirm extends StatelessWidget {
  const ModalConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Valeu!',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w800,
                color: Color.fromRGBO(255, 81, 47, 1),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Text(
              'Enviamos um email com mais informações.',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
