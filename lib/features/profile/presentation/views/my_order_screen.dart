import 'package:flutter/material.dart';
import 'package:furni_quest/features/profile/presentation/views/leave_review_screen.dart';
import 'package:furni_quest/features/profile/presentation/views/tracking_order_screen.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> tabs = ['Active', 'Completed', 'Cancelled'];

  final List<Map<String, dynamic>> activeOrders = [
    {
      'name': 'Classic Chair',
      'subtitle': 'Chair | Qty : 01 pcs',
      'price': '\$230.00',
      'image': 'assets/BlackChair.png',
      'button': 'Track Order',
    },
  ];

  final List<Map<String, dynamic>> completedOrders = [
    {
      'name': 'Classic Chair',
      'subtitle': 'Chair | Qty : 01 pcs',
      'price': '\$230.00',
      'image': 'assets/BlackChair.png',
      'button': 'Leave Review',
    },
  ];

  final List<Map<String, dynamic>> cancelledOrders = [
    {
      'name': 'Classic Chair',
      'subtitle': 'Chair | Qty : 01 pcs',
      'price': '\$230.00',
      'image': 'assets/BlackChair.png',
      'button': 'Re-Order',
    },
  ];

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  Widget _buildOrderItem(Map<String, dynamic> data) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  "assets/BlackChair.png",
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color(0xFF232922),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      data['subtitle'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xFF6E726C),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      data['price'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color(0xFF232922),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (data['button'] == 'Leave Review') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LeaveReviewScreen(
                          name: data['name'],
                          subtitle: data['subtitle'],
                          price: data['price'],
                          image: "assets/BlackChair.png",
                        ),
                      ),
                    );
                  } else if (data['button'] == 'Track Order') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TrackingOrderScreen(
                          name: data['name'],
                          subtitle: data['subtitle'],
                          price: data['price'],
                          image:  "assets/BlackChair.png",
                          otherItems: const [], // default empty list
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF657660),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    data['button'],
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1, thickness: 1, indent: 16, endIndent: 16),
      ],
    );
  }

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
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: const Color(0xFF657660),
            unselectedLabelColor: const Color(0xFF989797),
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            indicatorColor: const Color(0xFF657660),
            tabs: tabs.map((tab) => Tab(text: tab)).toList(),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView(
                  children:
                      activeOrders.map((e) => _buildOrderItem(e)).toList(),
                ),
                ListView(
                  children:
                      completedOrders.map((e) => _buildOrderItem(e)).toList(),
                ),
                ListView(
                  children:
                      cancelledOrders.map((e) => _buildOrderItem(e)).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
