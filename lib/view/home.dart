import 'package:currency/controller/homepagecontroller.dart';
import 'package:currency/model/ratesmodel.dart';
import 'package:currency/view/anytoany.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formkey = GlobalKey<FormState>();

  //Getting RatesModel and All Currencies
  @override
  // void initState() {
  //   super.initState();
  //   final Fetchs = Provider.of<Homecontroller>(context, listen: false);
  //   Fetchs.fetchs();
  // }

  @override
  Widget build(BuildContext context) {
    final Fetchs = Provider.of<Homecontroller>(context, listen: false);
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            title: const Text(
              'Curreny Conveter',
              style: TextStyle(
                  color: Color.fromARGB(255, 232, 208, 85),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true),

        //Future Builder for Getting Exchange Rates
        body: Container(
          height: h,
          width: w,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/currecy2.png'), fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: FutureBuilder<RateModel>(
                future:Fetchs. result,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Center(
                    child: FutureBuilder<Map>(
                        future:Fetchs. allcurrencies,
                        builder: (context, currSnapshot) {
                          if (currSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
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
