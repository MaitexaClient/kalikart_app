import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalicart/common/models/address_model.dart';
import 'package:kalicart/common/utils/app_color.dart';
import 'package:kalicart/common/widgets/primary_button.dart';
import 'package:kalicart/common/widgets/text_bold.dart';
import 'package:kalicart/features/address/controller/address_controller.dart';
import 'package:kalicart/features/address/widget/max_textfield_widget.dart';
import 'package:kalicart/features/profile/widget/custom_edittext_widget.dart';
import 'package:provider/provider.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({super.key, required this.data});

  final AddressModel data;

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  final List<String> State = ['Kerala', 'Karnataka', 'TamilNadu'];
  String selectedState = 'Kerala'; // Default selected value

  final List<String> City = ['Calicut', 'Karnataka', 'TamilNadu'];
  String selectedCity = 'Calicut'; // Default selected value

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.data.name!;
    phoneController.text = widget.data.phone!;
    addressController.text = widget.data.address!;
    pinCodeController.text = widget.data.pincode!;
    stateController.text = widget.data.state!;
    cityController.text = widget.data.city!;
    landmarkController.text = widget.data.landmark!;

    super.initState();
  }

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
                  const SizedBox(height: 20),
                  CustomEditTextField(
                    labelText: 'Name',
                    textEditingController: nameController,
                  ),
                  const SizedBox(height: 20),
                  CustomMaxEditTextField(
                    labelText: 'Address',
                    controller: addressController,
                  ),
                  const SizedBox(height: 20),
                  CustomEditTextField(
                    labelText: 'phone',
                    textEditingController: phoneController,
                  ),
                  const SizedBox(height: 20),
                  CustomEditTextField(
                    labelText: 'pincode',
                    textEditingController: pinCodeController,
                  ),

                  const SizedBox(height: 20),

                  DropdownButtonFormField<String>(
                    value: selectedState,
                    decoration: InputDecoration(
                      labelText: 'State',
                      labelStyle: const TextStyle(color: AppColor.kblack30),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(
                            color:
                                AppColor.kblack30), // Border color when focused
                      ),
                    ),
                    onChanged: (String? value) {
                      if (value != null) {
                        // Update the selected value
                        selectedState = value;
                        stateController.text = selectedState;
                      }
                    },
                    items: State.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: selectedCity,
                    decoration: InputDecoration(
                      labelText: 'City',
                      labelStyle: const TextStyle(color: AppColor.kblack30),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(
                            color:
                                AppColor.kblack30), // Border color when focused
                      ),
                    ),
                    onChanged: (String? value) {
                      if (value != null) {
                       
                        selectedCity = value;
                        cityController.text = selectedCity;

                      }
                    },
                    items: City.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  // CustomEditTextField(labelText: 'Phone Number'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Consumer<AddressController>(
                builder: (context,controller,child) {
                  return controller.loading ? 
                  const  Center(child: CircularProgressIndicator(color: AppColor.kGreenColor,),) 
                  :
                  PrimaryButton(
                    onPressed: () {

                      controller.updateAddress(
                        name: nameController.text, 
                        phone: phoneController.text, 
                        address: addressController.text, 
                        pinCode: pinCodeController.text, 
                        state: stateController.text, 
                        city: cityController.text, 
                        landmark: landmarkController.text, 
                        addressId: widget.data.sId!, 
                        context: context,
                        );
                     
                    },
                    buttonText: 'Save Address',
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
