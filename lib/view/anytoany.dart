import 'package:currency/controller/anty_to_any_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnyToAny extends StatelessWidget {
  final rates;
  final Map currencies;
  const AnyToAny({Key? key, @required this.rates, required this.currencies})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    final anytoanycontroller = Provider.of<AnyTOAny>(context);
    return Card(
      child: Container(
        color: const Color.fromARGB(255, 232, 208, 85),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Convert Any Currency',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 20),
            TextFormField(
              key: const ValueKey('amount'),
              controller: anytoanycontroller.amountController,
              decoration: const InputDecoration(hintText: 'Enter Amount'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: anytoanycontroller.dropdownValue1,
                    icon: const Icon(Icons.arrow_drop_down_rounded),
                    iconSize: 24,
                    elevation: 16,
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                    onChanged: (String? newValue) {
                      anytoanycontroller.setDropdownValue(newValue!);
                    },
                    items: currencies.keys
                        .toSet()
                        .toList()
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text('To')),
                Expanded(
                  child: DropdownButton<String>(
                    value: anytoanycontroller.dropdownValue2,
                    icon: const Icon(Icons.arrow_drop_down_rounded),
                    iconSize: 24,
                    elevation: 16,
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      color: Colors.grey.shade400,
                    ),
                    onChanged: (String? newValue) {
                      anytoanycontroller.setDrodewnavalue2(newValue!);
                    },
                    items: currencies.keys
                        .toSet()
                        .toList()
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              child: ElevatedButton(
                onPressed: () {
                anytoanycontroller.convertAndSetAnswer(
                 anytoanycontroller.amountController.text, rates);
              },
                child: const Text(
                  'Convert',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const SizedBox(height: 10),
            Container(child: Text(anytoanycontroller.answer))
          ],
        ),
      ),
    );
  }
}
