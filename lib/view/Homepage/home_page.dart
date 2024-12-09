import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:password_management/view/Homepage/widgets/gradient_card.dart';
import 'package:password_management/view/Homepage/widgets/gradients.dart';
import 'package:password_management/view/Homepage/widgets/sliver_search_app_bar.dart';

class HomePage extends StatefulWidget {
  final Function(int) onNavigate;

  const HomePage({super.key, required this.onNavigate});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ServiceItem> items = []; // Initialize as an empty list

  @override
  void initState() {
    super.initState();
    _fetchDataFromFirebase(); // Fetch data from Firebase when widget is initialized
  }

  Future<void> _fetchDataFromFirebase() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('details').get();
      setState(() {
        items = snapshot.docs.map((doc) => ServiceItem.fromDocument(doc)).toList();
      });
    } catch (e) {
      print('Error fetching data from Firebase: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Color.fromARGB(255, 23, 59, 89)));

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _fetchDataFromFirebase,
        child: CustomScrollView(
          slivers: [
            const SliverPersistentHeader(
              delegate: SliverSearchAppBar(),
              pinned: false,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Your Passwords",style: TextStyle(
                      fontWeight: FontWeight.w800

                    ), ),
                    GestureDetector(
                      onTap: () {
                        // Implement the navigation or action for "View All"
                      },
                      child: const Text("View All", ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) => GradientCard(
                  title: items[index].title,
                  email: items[index].email,
                  password: items[index].password,
                  serviceIcon: items[index].icon,
                  isPasswordVisible: items[index].isPasswordVisible,
                  onToggleVisibility: () => setState(() {
                    items[index].isPasswordVisible = !items[index].isPasswordVisible;
                  }),
                  gradient: cardGradients[index % cardGradients.length], // Assuming cardGradients is defined
                ),
                childCount: items.length,
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(bottom: 80), // Adjust the padding to ensure it accommodates the FAB.
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceItem {
  final String title;
  final String email;
  final IconData icon;
  bool isPasswordVisible; // Made non-final to allow toggling visibility
  final String password;

  ServiceItem({
    required this.title,
    required this.email,
    required this.icon,
    this.isPasswordVisible = false, // Default to false
    required this.password,
  });

  // Factory constructor to create ServiceItem from Firestore document
  factory ServiceItem.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ServiceItem(
      title: data['domain'] ?? '', // Change 'domain' to match your field names in Firestore
      email: data['username'] ?? '', // Change 'username' to match your field names in Firestore
      icon: Icons.email, // Use your desired default icon
      isPasswordVisible: false, // Default to false
      password: data['password'] ?? '', // Change 'password' to match your field names in Firestore
    );
  }
}
