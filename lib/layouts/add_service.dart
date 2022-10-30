import 'package:bride_night/model/service.dart';
import 'package:bride_night/service/auth.dart';
import 'package:bride_night/service/services.dart';
import 'package:bride_night/shared/alert_dialog.dart';
import 'package:flutter/material.dart';

class AddServiceDialog extends StatefulWidget {
  const AddServiceDialog({Key? key}) : super(key: key);

  @override
  State<AddServiceDialog> createState() => _AddServiceDialogState();
}

class _AddServiceDialogState extends State<AddServiceDialog> {
  TextEditingController categoryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController fullAddressController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  saveData() async {
    if (_formKey.currentState!.validate()) {
      await addService(Service(
          id: '',
          description: descriptionController.text,
          category: categoryController.text,
          providerID: currentUser!.id,
          hasOffer: false,
          city: cityController.text,
          fullAddress: fullAddressController.text,
          price: double.parse(priceController.text)));
      showAlertDialog(context, 'Saved Successfully');
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //category
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: categoryController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required data !";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: "Category",
                  prefixIcon: Icon(
                    Icons.category,
                    color: Color(0xFF2661FA),
                  ),
                ),
              ),
            ),
            //description
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: descriptionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required data !";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: "Description",
                  prefixIcon: Icon(
                    Icons.description,
                    color: Color(0xFF2661FA),
                  ),
                ),
              ),
            ),
            //City
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: cityController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required data !";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: "City",
                  prefixIcon: Icon(
                    Icons.location_city,
                    color: Color(0xFF2661FA),
                  ),
                ),
              ),
            ),
            //address
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: fullAddressController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required data !";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: "Full Address",
                  prefixIcon: Icon(
                    Icons.location_pin,
                    color: Color(0xFF2661FA),
                  ),
                ),
              ),
            ),
            //price
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: priceController,
                keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required data !";
                  } else if (int.parse(value) <= 0) {
                    return "You should enter a positive value !";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: "Price",
                  prefixIcon: Icon(
                    Icons.attach_money,
                    color: Color(0xFF2661FA),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () => saveData(),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text("Save"),
                ))
          ],
        ),
      ),
    );
  }
}
