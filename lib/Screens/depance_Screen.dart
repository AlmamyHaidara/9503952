import 'package:flutter/material.dart';

class DepanceScreen extends StatefulWidget {
  const DepanceScreen({super.key});

  @override
  State<DepanceScreen> createState() => _DepanceScreenState();
}

class _DepanceScreenState extends State<DepanceScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController montanController = TextEditingController();
  final TextEditingController categorieController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  List<String> optionList = ['Option 1', 'Option 2', 'Option 3'];
  String? currentValue = 'Option 1';
  bool _isLoading = false;

  DateTime? selectedDate;

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2021, 7, 25),
      firstDate: DateTime(2021),
      lastDate: DateTime(2022),
    );

    setState(() {
      selectedDate = pickedDate;
      selectedDate = DateTime.now();
    });
  }

  void login() {
    print(montanController.text);
    print(descriptionController.text);
    print(currentValue);
    print(selectedDate);
    print(DateTime(2020, 12, 12));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          "Gestion des depenses",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15.5)),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15.5)),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15.5)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => showDialog<String>(
              context: context,
              builder:
                  (BuildContext context) => Dialog(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: formKey,

                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text('This is a typical dialog.'),
                            const SizedBox(height: 15),
                            TextField(
                              controller: montanController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Montant',
                              ),
                            ),
                            SizedBox(height: 20),
                            TextField(
                              controller: descriptionController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Description',
                              ),
                            ),
                            SizedBox(height: 20),
                            SizedBox(height: 10.0),
                            InputDatePickerFormField(
                              firstDate: DateTime(2019),
                              lastDate: DateTime(2020, 12, 12),
                              initialDate: selectedDate,
                              selectableDayPredicate: (day) => true,
                              onDateSubmitted: (date) {
                                print("gegwdfdgv${date}");
                                setState(() {
                                  selectedDate = date;
                                });
                              },
                            ),
                            SizedBox(height: 20),

                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: 'Select an option',
                                border: OutlineInputBorder(),
                              ),
                              value: currentValue,
                              items:
                                  optionList
                                      .map(
                                        (option) => DropdownMenuItem(
                                          value: option,
                                          child: Text(option),
                                        ),
                                      )
                                      .toList(),
                              onChanged: (value) {
                                setState(() {
                                  currentValue = value!;
                                });
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select an option';
                                }
                                return null;
                              },
                            ),
                            // DropdownButton<String>(
                            //   hint: Text("Select an option"),
                            //   icon: Icon(Icons.arrow_drop_down),
                            //   elevation: 16,
                            //   style: TextStyle(color: Colors.amber),
                            //   underline: Container(
                            //     height: 2,
                            //     color: Colors.amber,
                            //   ),
                            //   menuWidth: double.infinity,
                            //   value: currentValue,
                            //   onChanged: (String? value) {
                            //     setState(() {
                            //       currentValue = value!;
                            //     });
                            //   },
                            //   items:
                            //       optionList.map<DropdownMenuItem<String>>((
                            //         String value,
                            //       ) {
                            //         return DropdownMenuItem<String>(
                            //           value: value,
                            //           child: Text(value),
                            //         );
                            //       }).toList(),
                            // ),
                            SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                // onPressed: _isLoading ? null : login,
                                onPressed:
                                    () => {login(), Navigator.pop(context)},

                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.amber,
                                  foregroundColor: Colors.white,
                                ),

                                child:
                                    _isLoading
                                        ? const CircularProgressIndicator()
                                        : const Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Text('Se connecter'),
                                        ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            ),
        backgroundColor: Colors.amber,

        tooltip: 'Increment',
        child: const Icon(color: Colors.white, Icons.add),
      ),
    );
    ;
  }
}
