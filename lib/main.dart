import 'package:added_value_saudi/addvalue.dart';
import 'package:added_value_saudi/valuecalc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'القيمة المضافة',
        home: TaxCalculationPage());
  }
}

class TaxCalculationPage extends StatefulWidget {
  const TaxCalculationPage({super.key});

  @override
  State<TaxCalculationPage> createState() => _TaxCalculationPage();
}

class _TaxCalculationPage extends State<TaxCalculationPage> {
  bool isEnglish = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("القيمة المضافة"),
            centerTitle: true,
            bottom: const TabBar(
                indicatorColor: Colors.blue,
                indicatorWeight: 3.0,
                labelColor: Colors.blue,
                labelStyle: TextStyle(fontWeight: FontWeight.w900),
                tabs: [Text("اضافة الضريبة"), Text("حساب الضريبة")]),
          ),
          body: const TabBarView(
            children: [
              Addvalue(),
              Valuecalc(),
            ],
          ),
        ));
  }
}
