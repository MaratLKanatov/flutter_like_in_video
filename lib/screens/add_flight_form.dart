import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class AddFlightForm extends StatefulWidget {
  const AddFlightForm({Key? key}) : super(key: key);

  @override
  State<AddFlightForm> createState() => _AddFlightFormState();
}

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

List<TextEditingController> textControllers = <TextEditingController>[];

class _AddFlightFormState extends State<AddFlightForm> {
  DateTime date1 = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: [
            myTextField("Город Отправления", Icons.place),
            const SizedBox(height: 10),
            myTextField("Город Прибытия", Icons.place_outlined),
            const SizedBox(height: 10),
            myTextField("Модель Авто", Icons.model_training),
            const SizedBox(height: 10),
            myTextField("Номер Авто", Icons.format_list_numbered),
            const SizedBox(height: 10),
            myTextField("Количество мест", Icons.satellite),
            const SizedBox(height: 10),
            DateTimePickerFormField(
              inputType: InputType.both,
              format: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
              editable: false,
              decoration: const InputDecoration(
                  labelText: 'DateTime',
                  floatingLabelBehavior: FloatingLabelBehavior.never),
              onChanged: (dt) {
                setState(() => date1 = dt);
                debugPrint('Selected date: $date1');
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  debugPrint("Valid");
                }
              },
              child: const Text("Submit"),
            )
          ],
        ),
      ),
    );
  }

  Widget myTextField(String title, IconData icon) {
    TextEditingController curController = TextEditingController();
    textControllers.add(curController);

    return TextFormField(
      controller: curController,
      validator: (value) {
        if (value == null) return 'it is null';
        if (value.isEmpty) return 'Please enter "$title"';
        return null;
      },
      decoration: InputDecoration(
        labelText: title,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
        prefixIcon: Icon(icon),
        suffixIcon: IconButton(
          icon: const Icon(Icons.delete_outline),
          color: Colors.red,
          onPressed: () {
            curController.clear();
            // _formKey.currentState!.reset();
          },
        ),
      ),
    );
  }
}
