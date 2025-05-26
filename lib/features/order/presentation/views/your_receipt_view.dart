import 'package:flutter/material.dart';
import 'package:furni_quest/features/home/presentation/screens/main_view.dart';
import 'package:intl/intl.dart';

class YourReceiptView extends StatefulWidget {
  const YourReceiptView(
      {super.key, required this.cartList, required this.totalCost});
  final List cartList;
  final int totalCost;

  @override
  State<YourReceiptView> createState() => _YourReceiptViewState();
}

class _YourReceiptViewState extends State<YourReceiptView> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isSmallScreen = screenWidth < 360; // For small devices
    DateTime now = DateTime.now();

    String formattedDate = DateFormat('dd/MM/yy').format(now); 
    String formattedTime = DateFormat('hh:mm a').format(now); 
    String formattedDateTime = '$formattedDate, $formattedTime'; 

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 70),
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: screenWidth * 0.85, // Responsive width
                    padding: EdgeInsets.all(
                        screenWidth * 0.05), // Responsive padding
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 16,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: screenHeight * 0.03),
                        Text(
                          "Payment Success!",
                          style: TextStyle(
                            fontSize: isSmallScreen ? 16 : 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF3B3A35),
                            fontFamily: 'Heebo',
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Your payment has been successfully done.",
                          style: TextStyle(
                            fontSize: isSmallScreen ? 10 : 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF3B3A35),
                            fontFamily: 'Heebo',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Divider(color: Color(0xFFB9C5B1)),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          "Total Payment",
                          style: TextStyle(
                            fontSize: isSmallScreen ? 10 : 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF4F4C43),
                            fontFamily: 'Heebo',
                          ),
                        ),
                        Text(
                          "\$${widget.totalCost}",
                          style: TextStyle(
                            fontSize: isSmallScreen ? 20 : 22,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF3B3A35),
                            fontFamily: 'Heebo',
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2, // Adjust grid dynamically
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 2,
                          children: [
                            _buildInfoCard("Ref Number", "000085752257"),
                            _buildInfoCard(
                                "Payment Time", formattedDateTime),
                            _buildInfoCard("Payment Method", "Cash"),
                            _buildInfoCard("Sender Name", "Antonio Roberto"),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        TextButton.icon(
                          onPressed: () {},
                          icon: Image.asset('assets/download.png',
                              height: isSmallScreen ? 16 : 20),
                          label: Text(
                            "Get PDF Receipt",
                            style: TextStyle(
                              color: Color(0xFF657660),
                              fontSize: isSmallScreen ? 10 : 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Heebo',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -22,
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 16,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(Icons.check_circle,
                            color: Color(0xFF657660), size: 24),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 95),
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.04),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainView()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF53634F),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  minimumSize: Size(screenWidth * 0.85, 44),
                ),
                child: Text(
                  "Done",
                  style: TextStyle(
                    fontSize: isSmallScreen ? 14 : 16,
                    color: Colors.white,
                    fontFamily: 'Heebo',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFB9C5B1)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 10,
              color: Color(0xFF657660),
              fontWeight: FontWeight.w400,
              fontFamily: 'Heebo',
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Color(0xFF4F4C43),
              fontFamily: 'Heebo',
            ),
          ),
        ],
      ),
    );
  }
}




