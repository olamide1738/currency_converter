import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  State<CurrencyConverterPage> createState() => _CurrencyConverterPageState();
}

final TextEditingController textEditingController = TextEditingController();
double usdToNaira = 0;

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Currency Converter"),
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "₦ $usdToNaira",
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              borderRadius: BorderRadius.circular(20)),
          child: Container(
            padding: EdgeInsets.only(left: 10),
            child: TextField(
              controller: textEditingController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                constraints: BoxConstraints(maxWidth: 800),
                hintText: "Please enter the amount in USD",
                border: InputBorder.none,
                icon: Icon(Icons.currency_exchange_rounded),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        TextButton(
            style: TextButton.styleFrom(
              maximumSize: Size(500, 100),
              minimumSize: Size(200, 50),
              backgroundColor: Theme.of(context).primaryColorLight,
            ),
            onPressed: () {
              setState(() {
                usdToNaira = double.parse(textEditingController.text) * 820;
              });
            },
            child: Text(
              "Convert",
              style: TextStyle(color: Colors.grey.shade800),
            ))
      ]),
    );
  }
}
