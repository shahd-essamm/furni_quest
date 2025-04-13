import 'package:flutter/material.dart';
import 'package:furni_quest/features/auth/forgot_password.dart/presentation/views/widgets/verify_view.dart';

class SignupBusinessView extends StatefulWidget {
  const SignupBusinessView({super.key});

  static const String routeName = 'signup-business';

  @override
  State<SignupBusinessView> createState() => _SignupBusinessViewState();
}

class _SignupBusinessViewState extends State<SignupBusinessView> {
  final _formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreeTerms = false;
  bool _agreePrivacy = false;
  bool _allFieldsFilled = false;

  final Map<String, TextEditingController> _controllers = {
    'brandName': TextEditingController(),
    'brandEmail': TextEditingController(),
    'phone': TextEditingController(),
    'companyAddress': TextEditingController(),
    'brandDocument': TextEditingController(),
    'password': TextEditingController(),
    'confirmPassword': TextEditingController(),
  };

  void _checkFieldsFilled() {
    bool allFilled =
        _controllers.values.every((controller) => controller.text.isNotEmpty);
    setState(() {
      _allFieldsFilled = allFilled && _agreeTerms && _agreePrivacy;
    });
  }

  @override
  void initState() {
    super.initState();
    _controllers.forEach((key, controller) {
      controller.addListener(_checkFieldsFilled);
    });
  }

  @override
  void dispose() {
    _controllers.forEach((key, controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              size: 24, color: Color(0xFF3A3E39)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Create Business Account',
                style: TextStyle(
                  fontFamily: 'Heebo',
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Color(0xFF3A3E39),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Fill your information below',
                style: TextStyle(
                  fontFamily: 'Heebo',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF646B62),
                ),
              ),
              const SizedBox(height: 24),
              _buildTextField('Brand Name', _controllers['brandName']!),
              _buildTextField('Brand Email', _controllers['brandEmail']!,
                  prefixIcon: Icons.email_outlined),
              _buildPhoneField(),
              _buildTextField(
                  'Company Address', _controllers['companyAddress']!),
              _buildTextField(
                'Brand Document',
                _controllers['brandDocument']!,
                suffixIcon: Icons.push_pin,
                isDocument: true,
              ),
              _buildTextField(
                'Password',
                _controllers['password']!,
                obscureText: _obscurePassword,
                suffixIcon: Icons.visibility,
                toggleVisibility: () =>
                    setState(() => _obscurePassword = !_obscurePassword),
              ),
              _buildTextField(
                'Confirm Password',
                _controllers['confirmPassword']!,
                obscureText: _obscureConfirmPassword,
                suffixIcon: Icons.visibility,
                toggleVisibility: () => setState(
                    () => _obscureConfirmPassword = !_obscureConfirmPassword),
              ),
              const SizedBox(height: 12),
              _buildCheckbox(
                  'Agree with Terms & Conditions',
                  _agreeTerms,
                  (val) => setState(() {
                        _agreeTerms = val!;
                        _checkFieldsFilled();
                      })),
              _buildCheckbox(
                  'Agree to The Privacy Policy',
                  _agreePrivacy,
                  (val) => setState(() {
                        _agreePrivacy = val!;
                        _checkFieldsFilled();
                      })),
              const SizedBox(height: 20),
              SizedBox(
                height: 44,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _allFieldsFilled
                      ? () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerifyView(
                                isNewPassword: false,
                              ),
                            ),
                          )
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _allFieldsFilled
                        ? const Color(0xFF657660)
                        : const Color(0xFF53634F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Sign in',
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
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    IconData? prefixIcon,
    IconData? suffixIcon,
    bool obscureText = false,
    VoidCallback? toggleVisibility,
    bool isDocument = false,
  }) {
    bool isFilled = controller.text.isNotEmpty;
    double height = isDocument && isFilled ? 105 : 44;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Heebo',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color(0xFF4B5049),
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: height,
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              maxLines: isDocument && isFilled ? null : 1,
              keyboardType: label == 'Phone Number'
                  ? TextInputType.number
                  : TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Enter here',
                hintStyle: const TextStyle(
                  fontFamily: 'Heebo',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xFFC3C9C0),
                ),
                prefixIcon: prefixIcon != null
                    ? Icon(prefixIcon, size: 24, color: Color(0xFF657660))
                    : null,
                suffixIcon: suffixIcon != null
                    ? GestureDetector(
                        onTap: toggleVisibility,
                        child: Icon(suffixIcon,
                            size: 24, color: Color(0xFF657660)),
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: isFilled ? Color(0xFFA7B2A3) : Color(0xFFC3C9C0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: isFilled ? Color(0xFFA7B2A3) : Color(0xFFC3C9C0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFFA7B2A3)),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Phone Number',
            style: TextStyle(
              fontFamily: 'Heebo',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color(0xFF4B5049),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            height: 44,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFC3C9C0)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const SizedBox(width: 12),
                const Text('Eg', style: TextStyle(fontFamily: 'Heebo')),
                const Icon(Icons.arrow_drop_down),
                const SizedBox(width: 12),
                const VerticalDivider(width: 1),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _controllers['phone'],
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '+1 (251) 000-0000',
                      hintStyle: TextStyle(
                        fontFamily: 'Heebo',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFFC3C9C0),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCheckbox(String label, bool value, Function(bool?)? onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            activeColor: Colors.transparent,
            checkColor: const Color(0xFF657660),
            side: const BorderSide(color: Color(0xFF657660)),
          ),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontFamily: 'Heebo',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF3A3E39),
              ),
            ),
          )
        ],
      ),
    );
  }
}
