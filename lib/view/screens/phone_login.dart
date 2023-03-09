import 'package:country_pickers/country.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter_dema_app/view/screens/otp_screen.dart';
class PhoneScreen extends StatelessWidget {
  PhoneScreen({Key? key}) : super(key: key);

  final TextEditingController phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  'assets/images/donate1.jpg',
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Welcome To Dema Charity',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Sign in',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: const [
                        Text(
                          'Help',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text(
                            '?',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'phone Number',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.black38),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  obscureText: false,
                  decoration: InputDecoration(
                    prefixIcon: CountryPickerDropdown(
                      dropdownColor: Colors.orange,
                      initialValue: 'sa',
                      itemBuilder: _buildDropdownItem,
                      onValuePicked: (Country country) {
                        if (kDebugMode) {
                          print(country.name);
                        }
                      },

                    ),
                    fillColor: Colors.grey.shade200,
                    hintText: 'Enter number phone',
                    hintStyle: const TextStyle(
                      color: Colors.black45,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height:50,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OTPScreen(phoneController.text)));
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

            ],
          ),
        ));
  }
  Widget _buildDropdownItem(Country country) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CountryPickerUtils.getDefaultFlagImage(country),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text("+${country.isoCode}"),
      //  Text("+${country.phoneCode}(${country.isoCode})"),
      ],
    );
  }
}