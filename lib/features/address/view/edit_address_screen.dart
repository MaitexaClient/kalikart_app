
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/primary_button.dart';
import 'package:kalicart/common/widgets/text_bold.dart';
import 'package:kalicart/features/address/widget/max_textfield_widget.dart';
import 'package:kalicart/features/profile/widget/custom_edittext_widget.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({super.key});

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  final List<String> State = ['Kerala', 'Karnataka', 'TamilNadu'];
  String selectedState = 'Kerala'; // Default selected value


  final List<String> City = ['Calicut', 'Karnataka', 'TamilNadu'];
  String selectedCity = 'Calicut'; // Default selected value



  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: BoldTextStyle(size: 20.sp, text: 'Edit Address'),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 20),
                 // CustomEditTextField(labelText: 'Name'),
                  SizedBox(height: 20),
                  //CustomMaxEditTextField(labelText: 'Address'),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: selectedState,
                    decoration: InputDecoration(
                      labelText: 'State',
                      labelStyle: TextStyle(color: AppColor.kblack30),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color:AppColor.kblack30), // Border color when focused
                      ),
                    ),
                    onChanged: (String? value) {
                      if (value != null) {
                        // Update the selected value
                        selectedState = value;
                      }
                    },
                    items: State.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: selectedCity,
                    decoration: InputDecoration(
                      labelText: 'City',
                      labelStyle: TextStyle(color: AppColor.kblack30),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color:AppColor.kblack30), // Border color when focused
                      ),
                    ),
                    onChanged: (String? value) {
                      if (value != null) {
                        // Update the selected value
                        selectedCity = value;
                      }
                    },
                    items: City.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                 // CustomEditTextField(labelText: 'Phone Number'),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: PrimaryButton(
                onPressed: () {
                  // Add functionality for the button here
                },
                buttonText: 'Save Address',
              ),
            ),
          ],
        ),

      ),
    );
  }
}