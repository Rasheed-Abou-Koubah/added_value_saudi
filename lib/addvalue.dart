// ignore_for_file: non_constant_identifier_names

import 'package:added_value_saudi/components/customlisttile.dart';
import 'package:added_value_saudi/components/customtextfeild.dart';
import 'package:flutter/material.dart';

class Addvalue extends StatefulWidget {
  const Addvalue({super.key});

  @override
  State<Addvalue> createState() => _Addvalue();
}

class _Addvalue extends State<Addvalue> {
  final TextEditingController myAmountwithNoTax = TextEditingController();
  final TextEditingController percentage_1 = TextEditingController();
  String amountwithTax = "";
  double amountwithoutTax = 0.0;
  double tax_1 = 0.0;
  String tax_1_str = "";
  double totalAmount = 0.0;
  double addedValue1 = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      padding: const EdgeInsets.all(20),
      children: <Widget>[
        const SizedBox(
          height: 15,
        ),
        Column(
          children: [
            const SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Center(
                          child: Text(
                              // isEnglish ? "hhhh" :
                              "المبلغ المالي",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue)))),
                  Expanded(
                      child: Center(
                          child: Text(
                    " نسبة الضريبة",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  )))
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Customtextfeild(
                    mycontroller: myAmountwithNoTax,
                  )),
                  const SizedBox(
                    width: 60,
                  ),
                  SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Customtextfeild(
                          mycontroller: percentage_1,
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "%",
                          style: TextStyle(fontSize: 35),
                        ),
                        const SizedBox(width: 15)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            CustomListTile(
                theTitle: "المبلغ مع القيمة المضافة", subtitle: amountwithTax),
            const SizedBox(
              height: 25,
            ),
            CustomListTile(
              theTitle: "  القيمة المضافة",
              subtitle: tax_1_str,
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  try {
                    amountwithoutTax = double.parse(myAmountwithNoTax.text);
                    addedValue1 = int.parse(percentage_1.text) / 100;
                    tax_1 = addedValue1 * amountwithoutTax;
                    tax_1_str = tax_1.toStringAsFixed(3).toString();
                    amountwithoutTax =
                        amountwithoutTax + addedValue1 * amountwithoutTax;
                    amountwithTax =
                        amountwithoutTax.toStringAsFixed(3).toString();
                  } catch (e) {
                    amountwithTax = " الرجاء ادخال رقم صحيح";
                  }
                });
              },
              child: Container(
                color: Colors.blue,
                height: 40,
                width: size.width,
                child: const Center(
                  child: Text(
                    "حساب",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  myAmountwithNoTax.text = "";
                  amountwithTax = "";
                  tax_1_str = "";
                });
              },
              child: const Text('مسح النتائج'),
            ),
          ],
        )
      ],
    );
  }
}
