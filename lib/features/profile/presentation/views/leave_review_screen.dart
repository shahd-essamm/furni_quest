import 'package:flutter/material.dart';

class LeaveReviewScreen extends StatefulWidget {
  final String image;
  final String name;
  final String subtitle;
  final String price;

  const LeaveReviewScreen({
    super.key,
    required this.image,
    required this.name,
    required this.subtitle,
    required this.price,
  });

  @override
  State<LeaveReviewScreen> createState() => _LeaveReviewScreenState();
}

class _LeaveReviewScreenState extends State<LeaveReviewScreen> {
  double rating = 0;
  TextEditingController reviewController = TextEditingController();

  bool get canSubmit => rating > 0 || reviewController.text.isNotEmpty;

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
          'Leave Review',
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
            const SizedBox(height: 28),

            /// Product Info
            SizedBox(
              height: 85,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      widget.image,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Color(0xFF232922),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.subtitle,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xFF6E726C),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.price,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Color(0xFF232922),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 30,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF657660),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Re-Order',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),

            const Center(
              child: Text(
                'How is your order?',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 19,
                  color: Color(0xFF3A3E39),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 12),

            const Text(
              'Add detailed review',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color(0xFF4B5049),
              ),
            ),
            const SizedBox(height: 8),

            Container(
              height: 105,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF868E82)),
              ),
              child: TextField(
                controller: reviewController,
                maxLines: null,
                decoration: const InputDecoration.collapsed(
                  hintText: 'Enter here',
                ),
                onChanged: (_) => setState(() {}),
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: const [
                Icon(Icons.photo_camera, color: Color(0xFF515E4D)),
                SizedBox(width: 8),
                Text(
                  'Add photo',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xFF232922),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            const Center(
              child: Text(
                'Your overall rating',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF7A7F78),
                ),
              ),
            ),
            const SizedBox(height: 8),

            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(5, (index) {
                  return Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            rating = index + 1.0;
                          });
                        },
                        icon: Icon(
                          Icons.star,
                          size: 24,
                          color: rating > index
                              ? const Color(0xFFEEB417)
                              : const Color(0xFFC8C8C8),
                        ),
                      ),
                      if (index != 4) const SizedBox(width: 8),
                    ],
                  );
                }),
              ),
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF96A093)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size.fromHeight(44),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xFF4B5049),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: canSubmit ? () {} : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: canSubmit
                          ? const Color(0xFF657660)
                          : const Color(0xFFDDE1DA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size.fromHeight(44),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
