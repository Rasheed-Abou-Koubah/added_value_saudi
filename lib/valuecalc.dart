// ignore_for_file: non_constant_identifier_names

import 'package:added_value_saudi/components/customlisttile.dart';
import 'package:added_value_saudi/components/customtextfeild.dart';
import 'package:flutter/material.dart';

class Valuecalc extends StatefulWidget {
  const Valuecalc({super.key});

  @override
  State<Valuecalc> createState() => _Valuecalc();
}

class _Valuecalc extends State<Valuecalc> {
  final TextEditingController myAmountwithTax = TextEditingController();
  final TextEditingController percentage_2 = TextEditingController();
  String amountwithTax = "";
  String Tax = "";
  double tax_2 = 0.0;
  String tax_2_str = "";
  double totalAmount = 0.0;
  double addedValue2 = 0;
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
                          child: Text("المبلغ المالي شامل الضريبة",
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
              height: 15,
            ),
            SizedBox(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Customtextfeild(
                    mycontroller: myAmountwithTax,
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
                          mycontroller: percentage_2,
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
              theTitle: "المبلغ بدون القيمة المضافة",
              subtitle: Tax,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomListTile(theTitle: "  القيمة المضافة", subtitle: tax_2_str),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  try {
                    totalAmount = double.parse(myAmountwithTax.text);
                    tax_2 = totalAmount;
                    totalAmount = totalAmount / 1.15;
                    tax_2 = tax_2 - totalAmount;
                    tax_2_str = tax_2.toStringAsFixed(3).toString();
                    Tax = totalAmount.toStringAsFixed(3).toString();
                  } catch (e) {
                    amountwithTax = "الرجاء ادخال رقم صحيح";
                    tax_2_str = "الرجاء ادخال رقم صحيح";
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
                  myAmountwithTax.text = "";
                  Tax = "";
                  tax_2_str = "";
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
