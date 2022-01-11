import 'package:bitcoin/coin_data.dart' as constant;
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  List<Text> iosScrollerItems = [];
  String selectedCurrency = 'USD';

  DropdownButton<String> getDropDownButton() {
    return DropdownButton<String>(
      value: selectedCurrency,
      items: getAndroidScroller(),
      onChanged: (value) {
        setState(() {
          selectedCurrency = value!;
        });
      },
    );
  }

  List<DropdownMenuItem<String>> getAndroidScroller() {
    List<DropdownMenuItem<String>> androidScrollerItems = [];
    for (String currencies in constant.currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currencies),
        value: currencies,
      );
      androidScrollerItems.add(newItem);
    }
    return androidScrollerItems;
  }

  CupertinoPicker iosScroller() {
    List<Text> iosScrollerItems = [];
    for (String items in constant.currenciesList) {
      iosScrollerItems.add(Text(items));
    }
    return CupertinoPicker(
        backgroundColor: Colors.lightBlue,
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedIndex) {
          print(selectedIndex);
        },
        children: iosScrollerItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iosScroller() : getDropDownButton(),
          ),
        ],
      ),
    );
  }
}
