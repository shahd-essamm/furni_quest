import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List<String> languages = [
    'English',
    'Arabic',
    'French',
    'Spanish',
    'German',
    'Italian',
    'Chinese',
    'Japanese',
    'Korean',
  ];

  String selectedLanguage = 'English';

  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isDropdownOpen = false;
  final GlobalKey _key = GlobalKey();

  void _toggleDropdown() {
    if (_isDropdownOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    _isDropdownOpen = true;
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    _isDropdownOpen = false;
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + renderBox.size.height,
        width: renderBox.size.width,
        child: Material(
          color: const Color(0xFFF0F3EC),
          elevation: 4,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 8),
            shrinkWrap: true,
            children: languages.map((lang) {
              return ListTile(
                title: Text(
                  lang,
                  style: const TextStyle(
                    fontFamily: 'Heebo',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF3A3E39),
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedLanguage = lang;
                  });
                  _closeDropdown();
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).size.width * 0.04;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AppBar
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 20),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, size: 24, color: Color(0xFF3A3E39)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Spacer(),
                    const Text(
                      'Notification',
                      style: TextStyle(
                        fontFamily: 'Heebo',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xFF3A3E39),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),

              // App Notification Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F3EC),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'App Notification',
                      style: TextStyle(
                        fontFamily: 'Heebo',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xFF3A3E39),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Open Notification Settings',
                      style: TextStyle(
                        fontFamily: 'Heebo',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xFF657660),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Never miss a message, click the link below to easily enable notification from us.',
                      style: TextStyle(
                        fontFamily: 'Heebo',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xFF646B62),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Language Selection Card
              CompositedTransformTarget(
                link: _layerLink,
                child: Container(
                  key: _key,
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F3EC),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Receive Communications In',
                        style: TextStyle(
                          fontFamily: 'Heebo',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color(0xFF3A3E39),
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Language',
                        style: TextStyle(
                          fontFamily: 'Heebo',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xFF646B62),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedLanguage,
                            style: const TextStyle(
                              fontFamily: 'Heebo',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color(0xFF657660),
                            ),
                          ),
                          GestureDetector(
                            onTap: _toggleDropdown,
                            child: const Icon(
                              Icons.keyboard_arrow_down,
                              size: 24,
                              color: Color(0xFF3A3E39),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
