import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_management/view/Add_info/add_info.dart';
import 'package:password_management/view/Homepage/widgets/gradient_card.dart';
import 'package:password_management/view/Homepage/widgets/gradients.dart';
import 'package:password_management/view/Homepage/widgets/sliver_search_app_bar.dart';
import 'package:password_management/view/main_screen.dart';
// Import your GradientCard and ServiceItem properly

class HomePage extends StatefulWidget {
  final Function(int) onNavigate;

  const HomePage({Key? key, required this.onNavigate}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Assuming your ServiceItem class and items list are defined properly
  final List<ServiceItem> items = List.generate(
    20, // Generate 20 items for scrolling demonstration
        (index) => ServiceItem(
      title: "Service ${index + 1}",
      email: "user${index + 1}@service.com",
      icon: Icons.email,
      isPasswordVisible: false,
      password: "password${index + 1}",
    ),
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Color.fromARGB(255, 23, 59, 89)));

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverPersistentHeader(
            delegate: SliverSearchAppBar(),
            pinned: false,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Your Passwords", style: Theme.of(context).textTheme.headline6),
                  GestureDetector(
                    onTap: () {
                      // Implement the navigation or action for "View All"
                    },
                    child: Text("View All", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.blue)),
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
          SliverPadding(
            padding: EdgeInsets.only(bottom: 80), // Adjust the padding to ensure it accommodates the FAB.
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.onNavigate(1); // Assuming index 1 is for AddInfo page
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add, color: Colors.white),
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
}
