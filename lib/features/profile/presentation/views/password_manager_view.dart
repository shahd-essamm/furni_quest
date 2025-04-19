import 'package:flutter/material.dart';

class PasswordMangerPage extends StatefulWidget {
  const PasswordMangerPage({super.key});

  @override
  State<PasswordMangerPage> createState() => _PasswordMangerPageState();
}

class _PasswordMangerPageState extends State<PasswordMangerPage> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _showOldPassword = false;
  bool _showNewPassword = false;
  bool _showConfirmPassword = false;

  bool get _isValid =>
      _newPasswordController.text.isNotEmpty &&
      _confirmPasswordController.text == _newPasswordController.text &&
      _oldPasswordController.text.isNotEmpty;

  bool get _passwordsMismatch =>
      _confirmPasswordController.text.isNotEmpty &&
      _confirmPasswordController.text != _newPasswordController.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back, size: 24, color: Color(0xFF3A3E39)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Change Password',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Color(0xFF3A3E39),
            fontFamily: 'Heebo',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildPasswordField(
              label: 'Old Password',
              controller: _oldPasswordController,
              showPassword: _showOldPassword,
              onToggle: () =>
                  setState(() => _showOldPassword = !_showOldPassword),
              isError: false,
            ),
            const SizedBox(height: 16),
            _buildPasswordField(
              label: 'Choose a new Password',
              controller: _newPasswordController,
              showPassword: _showNewPassword,
              onToggle: () =>
                  setState(() => _showNewPassword = !_showNewPassword),
              isError: false,
            ),
            const SizedBox(height: 16),
            _buildPasswordField(
              label: 'Confirm Password',
              controller: _confirmPasswordController,
              showPassword: _showConfirmPassword,
              onToggle: () =>
                  setState(() => _showConfirmPassword = !_showConfirmPassword),
              isError: _passwordsMismatch,
              isConfirm: true,
            ),
            if (_passwordsMismatch)
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Is not the same password.',
                    style: TextStyle(
                      color: Color(0xFFD73F2C),
                      fontFamily: 'Heebo',
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _isValid
                    ? const Color(0xFF53634F)
                    : const Color(0xFFE5E8E3),
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: _isValid ? () {} : null,
              child: Text(
                'Done',
                style: TextStyle(
                  color: _isValid ? Colors.white : const Color(0xFF889584),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: 'Heebo',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required bool showPassword,
    required VoidCallback onToggle,
    required bool isError,
    bool isConfirm = false,
  }) {
    final bool isFilled = controller.text.isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Color(0xFF4B5049),
            fontFamily: 'Heebo',
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: !showPassword,
          onChanged: (_) => setState(() {}),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: isError
                    ? const Color(0xFFFDA29B)
                    : isFilled
                        ? const Color(0xFFA7B2A3)
                        : const Color(0xFFC3C9C0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color:
                    isError ? const Color(0xFFFDA29B) : const Color(0xFFA7B2A3),
              ),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                isError && isConfirm
                    ? Icons.error_outline
                    : Icons.visibility_off_outlined,
                size: 24,
                color: isError && isConfirm
                    ? const Color(0xFFD73F2C)
                    : const Color(0xFF657660),
              ),
              onPressed: onToggle,
            ),
            hintText: '••••••••',
            hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color:
                  isFilled ? const Color(0xFF3A3E39) : const Color(0xFF667085),
              fontFamily: 'Heebo',
            ),
          ),
        ),
      ],
    );
  }
}
