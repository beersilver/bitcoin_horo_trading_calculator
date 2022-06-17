import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({required this.positionSize, required this.positionType, required this.stopLossPrice});

  final double positionSize;
  final String positionType;
  final double stopLossPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bitcoin Horo Trading Calculator"),
      ),
      body: Center(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.network(
                  'https://image.makewebeasy.net/makeweb/0/NFGVmFWMN/Crypto_Logo_No_BG/bitcoin_btc_logo.png?v=202012190947',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,

      ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'You should open a ' + positionType + ' position \n with a position size of ' + positionSize.ceil().toString() + ' USD. \n And set the stop loss at the price ' + stopLossPrice.ceil().toString()+ '.',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'GOOD LUCK!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
