import 'package:flutter/material.dart';
import 'dart:math';

import '../components/base_card.dart';
import '../components/ic_tx_widget.dart';
import 'result_screen.dart';

enum RiskLevel { one, two, three, four, five }

class DataEntryScreen extends StatefulWidget {
  const DataEntryScreen({Key? key}) : super(key: key);

  @override
  State<DataEntryScreen> createState() => _DataEntryScreenState();
}

class _DataEntryScreenState extends State<DataEntryScreen> {
  //Instance variables
  double totalBalance = 0.0;
  RiskLevel? riskLevel;
  double positionSize = 0.0;
  String positionType = '???';
  double currentBitcoinPrice = 100000.0;
  double percentStopLoss = 0.0;
  double stopLossPrice = 0.0;

  TextEditingController _percentStopLossController = TextEditingController();
  TextEditingController _currentPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bitcoin Horo Trading Calculator'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: const Text('How Should I Trade Bitcoin Today?',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
          ),
          Image.network(
              'https://image.makewebeasy.net/makeweb/0/NFGVmFWMN/Crypto_Logo_No_BG/bitcoin_btc_logo.png?v=202012190947',
              width: 100,
              height: 100,
              fit: BoxFit.cover),
          Container(
            child: BaseCard(
                theColor: Color(0xFFEEEEEE),
                theChild: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'Your Wallet Balance (USD)',
                      style: TextStyle(fontSize: 21),
                    ),
                    Text(
                      totalBalance.toString(),
                      style: TextStyle(fontSize: 40),
                    ),
                    Slider(
                        value: totalBalance,
                        min: 0,
                        max: 3000,
                        divisions: 50,
                        onChanged: (double newValue) {
                          setState(() {
                            totalBalance = newValue;
                          });
                        })
                  ],
                ),
                theOnTapFunc: () {
                  print('pressed');
                }),
          ),
          Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: _currentPriceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Current Bitcoin Price',
                ),
                // onChanged: (value) {
                //   setState(() {
                //     currentBitcoinPrice = value as double;
                //     print(currentBitcoinPrice.toString());
                //   });
                // },
              )),
          Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: _percentStopLossController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '% Stop Loss',
                ),
                // onChanged: (value) {
                //   setState(() {
                //     percentStopLoss = value as double;
                //     print(percentStopLoss.toString());
                //   });
                // },
              )),
          Container(
            margin: EdgeInsets.all(10),
            child: const Text('Acceptable Risk Level:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          ),
          Container(
            color: Colors.grey,
            child: Row(
              children: [
                BaseCard(
                  theColor:
                      riskLevel == RiskLevel.one ? Colors.amber : Colors.blue,
                  theChild: IcTxWidget(
                      iconData: Icons.currency_bitcoin,
                      iconSize: 40,
                      gapSize: 7,
                      txt: "1"),
                  theOnTapFunc: () {
                    setState(() {
                      print("1");
                      riskLevel = RiskLevel.one;
                    });
                  },
                ),
                BaseCard(
                  theColor:
                      riskLevel == RiskLevel.two ? Colors.amber : Colors.blue,
                  theChild: IcTxWidget(
                      iconData: Icons.currency_bitcoin_outlined,
                      iconSize: 40,
                      gapSize: 5,
                      txt: "2"),
                  theOnTapFunc: () {
                    setState(() {
                      print("2");
                      riskLevel = RiskLevel.two;
                    });
                  },
                ),
                BaseCard(
                  theColor:
                      riskLevel == RiskLevel.three ? Colors.amber : Colors.blue,
                  theChild: IcTxWidget(
                      iconData: Icons.currency_bitcoin_rounded,
                      iconSize: 40,
                      gapSize: 5,
                      txt: "3"),
                  theOnTapFunc: () {
                    setState(() {
                      print("3");
                      riskLevel = RiskLevel.three;
                    });
                  },
                ),
                BaseCard(
                  theColor:
                      riskLevel == RiskLevel.four ? Colors.amber : Colors.blue,
                  theChild: IcTxWidget(
                      iconData: Icons.currency_bitcoin_sharp,
                      iconSize: 40,
                      gapSize: 5,
                      txt: "4"),
                  theOnTapFunc: () {
                    setState(() {
                      print("4");
                      riskLevel = RiskLevel.four;
                    });
                  },
                ),
                BaseCard(
                  theColor:
                      riskLevel == RiskLevel.five ? Colors.amber : Colors.blue,
                  theChild: IcTxWidget(
                      iconData: Icons.currency_bitcoin,
                      iconSize: 40,
                      gapSize: 5,
                      txt: "5"),
                  theOnTapFunc: () {
                    setState(() {
                      print("5");
                      riskLevel = RiskLevel.five;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            child: BaseCard(
              theColor: Colors.green,
              theChild: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("SHOW RESULT",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              ),
              theOnTapFunc: () {
                switch (riskLevel) {
                  case RiskLevel.one:
                    {
                      positionSize = totalBalance / 10;
                    }
                    break;
                  case RiskLevel.two:
                    {
                      positionSize = totalBalance / 8;
                    }
                    break;
                  case RiskLevel.three:
                    {
                      positionSize = totalBalance / 6;
                    }
                    // print(billPerPerson);
                    break;
                  case RiskLevel.four:
                    {
                      positionSize = totalBalance / 4;
                    }
                    break;
                  case RiskLevel.five:
                    {
                      positionSize = totalBalance / 2;
                    }
                    break;
                  default:
                    {
                      positionSize = totalBalance / 10;
                    }
                }
                print(positionSize.toString());

                positionType = Random().nextBool() ? 'Long' : 'Short';
                print(positionType);

                currentBitcoinPrice =
                    double.parse(_currentPriceController.text);
                percentStopLoss = double.parse(_percentStopLossController.text);
                print(currentBitcoinPrice.toString());
                print(percentStopLoss.toString());

                if (positionType == 'Long') {
                  stopLossPrice =
                      currentBitcoinPrice * (1 - percentStopLoss / 100);
                } else {
                  stopLossPrice =
                      currentBitcoinPrice * (1 + (percentStopLoss / 100));
                }
                ;
                print(stopLossPrice.toString());

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                          positionSize: positionSize,
                          positionType: positionType,
                          stopLossPrice: stopLossPrice),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
