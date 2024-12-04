import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  TextEditingController tfControl = TextEditingController();
  String alinanVeri = "";
  bool switchButton = false;
  bool checkBoxiButton = false;
  String selectedOption = "Option 1";
  bool ilerleme = false;
  double currentValue = 0.0;
  TextEditingController tfSaat = TextEditingController();
  TextEditingController tfTarih = TextEditingController();
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Widgets"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(alinanVeri),
              TextField(
                controller: tfControl,
                decoration: const InputDecoration(
                  hintText: "veri",
                ),
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      alinanVeri = tfControl.text;
                    });
                  },
                  child: const Text("veriyi al")),
              Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: Expanded(
                      child: SwitchListTile(
                        title: const Text('Dart'),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: switchButton,
                        onChanged: (bool value) {
                          setState(() {
                            switchButton = value;
                          });
                        },
                        activeColor: Colors.blue,
                      ),
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text('Flutter'),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: checkBoxiButton,
                      onChanged: (bool? value) {
                        setState(() {
                          checkBoxiButton = value!;
                        });
                      },
                      activeColor: Colors.blue,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: RadioListTile(
                        title: const Text("A"),
                        value: "A seçildi",
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                          });
                        }),
                  ),
                  Expanded(
                    child: RadioListTile(
                        title: const Text("B"),
                        value: "B seçildi ",
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                          });
                        }),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          ilerleme = true;
                        });
                      },
                      child: const Text("Başla")),
                  Visibility(
                      visible: ilerleme,
                      child: const CircularProgressIndicator()),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          ilerleme = false;
                        });
                      },
                      child: const Text("Dur"))
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    print("Switch durum : $switchButton");
                    print("Checkbox durum : $checkBoxiButton");
                    print("Radio buton durum : $selectedOption");
                  },
                  child: const Text("Göster")),
              Text(currentValue.toString()),
              Slider(
                  min: 0,
                  max: 100,
                  label: "Sayı",
                  value: currentValue,
                  onChanged: (value) {
                    setState(() {
                      currentValue = value;
                    });
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 120,
                    child: TextField(
                      controller: tfSaat,
                      decoration: const InputDecoration(hintText: "Saat"),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showTimePicker(
                                context: context,
                                initialTime:
                                    TimeOfDay.fromDateTime(DateTime.now()))
                            .then((value) {
                          tfSaat.text = "${value!.hour}:${value.minute}";
                        });
                      },
                      icon: const Icon(Icons.access_time)),
                  SizedBox(
                    width: 120,
                    child: TextField(
                      controller: tfTarih,
                      decoration: const InputDecoration(hintText: "Tarih"),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2030))
                            .then((value) {
                          tfTarih.text =
                              "${value!.day}.${value.month}.${value.year}";
                        });
                      },
                      icon: const Icon(Icons.date_range)),
                ],
              ),
              DropdownButton<String>(
                  hint: const Text("Select a gender"),
                  value: selectedValue,
                  items: ['Female', 'Male', 'Other'].map((String value) {
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue;
                    });
                  }),
              Container(
                width: 300,
                height: 300,
                color: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}
