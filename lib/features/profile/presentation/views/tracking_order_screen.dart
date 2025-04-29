import 'package:flutter/material.dart';

class TrackingOrderScreen extends StatefulWidget {
  final String name, subtitle, price, image;
  final List<Map<String, dynamic>> otherItems;

  const TrackingOrderScreen({
    super.key,
    required this.name,
    required this.subtitle,
    required this.price,
    required this.image,
    this.otherItems = const [],
  });

  @override
  State<TrackingOrderScreen> createState() => _TrackingOrderScreenState();
}

class _TrackingOrderScreenState extends State<TrackingOrderScreen> {
  bool showAllItems = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back, size: 24, color: Color(0xFF3A3E39)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'My Orders',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Color(0xFF3A3E39),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductCard(
                widget.name, widget.subtitle, widget.price, widget.image),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => setState(() => showAllItems = !showAllItems),
              child: Text(
                'See all items',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xFF657660),
                ),
              ),
            ),
            if (showAllItems)
              ...widget.otherItems.map((item) => Column(
                    children: [
                      const Divider(
                          height: 24, thickness: 1, color: Color(0xFFE0E0E0)),
                      _buildProductCard(item['name'], item['subtitle'],
                          item['price'], item['image']),
                    ],
                  )),
            const SizedBox(height: 24),
            _buildTrackingStep("Order Confirmed", "23 April, 2025", true),
            _buildTrackingStep("Order Shipped", "24 April, 2025", true),
            _buildTrackingStep("Out for Delivery", "", false),
            _buildTrackingStep("Delivered", "", false),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(
      String name, String subtitle, String price, String image) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(image, width: 70, height: 70, fit: BoxFit.cover),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xFF232922))),
              const SizedBox(height: 4),
              Text(subtitle,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xFF6E726C))),
              const SizedBox(height: 4),
              Text(price,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xFF232922))),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildTrackingStep(String title, String date, bool isCompleted) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: const Color(0xFF657660),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.check,
                  size: 14,
                  color: isCompleted
                      ? const Color(0xFF53634F)
                      : const Color(0xFFC3C9C0)),
            ),
            Container(
              width: 2,
              height: 50,
              color: const Color(0xFF657660),
            ),
          ],
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: isCompleted
                    ? const Color(0xFF232922)
                    : const Color(0xFFC3C9C0),
              ),
            ),
            const SizedBox(height: 4),
            if (date.isNotEmpty)
              Text(
                date,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xFF6E726C),
                ),
              ),
            const SizedBox(height: 24),
          ],
        )
      ],
    );
  }
}
