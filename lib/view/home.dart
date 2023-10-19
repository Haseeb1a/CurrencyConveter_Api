import 'package:currency/model/ratesmodel.dart';
import 'package:currency/view/anytoany.dart';
import 'package:flutter/material.dart';

import '../services/function.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  late Future<RateModel> result;
  late Future<Map> allcurrencies;
  final formkey = GlobalKey<FormState>();

  //Getting RatesModel and All Currencies
  @override
  void initState() {
    super.initState();
    setState(() {
      result = fetchrates();
      allcurrencies = fetchcurrencies();
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          title: Text('Curreny Conveter',style: TextStyle(color:  Color.fromARGB(255, 232, 208, 85), fontSize: 25  ,fontFamily:AutofillHints.countryCode),)),

        //Future Builder for Getting Exchange Rates
        body: Container(
          height: h,
          width: w,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/currecy2.png'),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: FutureBuilder<RateModel>(
                future: result,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Center(
                    child: FutureBuilder<Map>(
                        future: allcurrencies,
                        builder: (context, currSnapshot) {
                          if (currSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AnyToAny(
                                currencies: currSnapshot.data!,
                                rates: snapshot.data!.rates,
                              ),
                            ],
                          );
                        }),
                  );
                },
              ),
            ),
          ),
        ));
  }
}