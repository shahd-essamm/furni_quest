import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  static const String routeName = 'profile_view';

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final Color textColor = Color(0xFF3A3E39);
  final Color labelColor = Color(0xFF4B5049);
  final Color hintColor = Color(0xFFC3C9C0); //hint txt
  final Color borderInactiveColor = Color(0xFFC3C9C0);
  final Color borderActiveColor = Color(0xFFA7B2A3);
  final Color iconColor = Color(0xFF657660);
  final Color buttonInactiveColor = Color(0xFF657660); //done
  final Color buttonActiveColor = Color(0xFF53634F); //done

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String selectedCountry = 'EG';
  final List<String> countries = ['EG', 'US', 'UK', 'DE', 'FR'];

  bool get allFieldsFilled =>
      firstNameController.text.isNotEmpty &&
      lastNameController.text.isNotEmpty &&
      emailController.text.isNotEmpty &&
      phoneController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Heebo',
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: textColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTextField('First Name', firstNameController),
            _buildTextField('Last Name', lastNameController),
            _buildTextField('Email', emailController),
            _buildPhoneField(),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      allFieldsFilled ? buttonActiveColor : buttonInactiveColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: allFieldsFilled
                    ? () {
                        //  "Done"
                      }
                    : null,
                child: Text(
                  'Done',
                  style: TextStyle(
                    fontFamily: 'Heebo',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Heebo',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: labelColor,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          onChanged: (_) => setState(() {}),
          style: TextStyle(
            fontFamily: 'Heebo',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: textColor,
          ),
          decoration: InputDecoration(
            hintText: label,
            hintStyle: TextStyle(
              fontFamily: 'Heebo',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: hintColor,
            ),
            suffixIcon: Icon(Icons.edit, size: 24, color: iconColor),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: borderInactiveColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: borderActiveColor),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildPhoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone Number',
          style: TextStyle(
            fontFamily: 'Heebo',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: labelColor,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: phoneController,
          onChanged: (_) => setState(() {}),
          style: TextStyle(
            fontFamily: 'Heebo',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: textColor,
          ),
          decoration: InputDecoration(
            prefixIcon: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedCountry,
                icon: Icon(Icons.arrow_drop_down, color: iconColor),
                items: countries
                    .map((country) => DropdownMenuItem(
                          value: country,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              country,
                              style: TextStyle(
                                fontFamily: 'Heebo',
                                fontSize: 14,
                                color: textColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedCountry = value;
                    });
                  }
                },
              ),
            ),
            hintText: '+1 (578) 000-00000',
            hintStyle: TextStyle(
              fontFamily: 'Heebo',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: hintColor,
            ),
            suffixIcon: Icon(Icons.edit, size: 24, color: iconColor),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: borderInactiveColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: borderActiveColor),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
