import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

List<String> devices = <String>["EURO", "RIEL", "DONG"];

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  final TextEditingController _textController = TextEditingController();
  String? _selectedDevice;
  double _result = 0;

  void _convertToDevices() {
    setState(() {
      double amount = double.parse(_textController.text);
      if (_selectedDevice == "EURO") {
        _result = amount * 0.95;
      } else if (_selectedDevice == "RIEL") {
        _result = amount * 4100;
      } else {
        _result = amount * 25400;
      }
    });
  }

  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.money,
            size: 60,
            color: Colors.white,
          ),
          const Center(
            child: Text(
              "Converter",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          const SizedBox(height: 50),
          const Text("Amount in dollars:"),
          const SizedBox(height: 10),
          TextField(
              controller: _textController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                  prefix: const Text('\$ '),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Enter an amount in dollar',
                  hintStyle: const TextStyle(color: Colors.white)),
              style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 30),
          Text("Device:"),
          DropdownButton<String>(
              value: _selectedDevice,
              onChanged: (String? value) => setState(() {
                    _selectedDevice = value;
                    _convertToDevices();
                  }),
              items: devices.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem(value: value, child: Text(value));
              }).toList()),
          const SizedBox(height: 30),
          const Text("Amount in selected device:"),
          const SizedBox(height: 10),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: Text("$_result")),
          // Padding(
          //   padding: EdgeInsets.all(8),
          //   child: ElevatedButton(
          //       onPressed: _convertToDevices,
          //       child: Text("Let's convert!!!!!")),
          // )
        ],
      )),
    );
  }
}
