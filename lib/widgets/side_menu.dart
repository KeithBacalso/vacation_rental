import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  String _selectedItem = 'Home';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildMenuItem(Icons.home_outlined, 'Home'),
            _buildMenuItem(Icons.person_outline, 'Profile'),
            _buildMenuItem(Icons.location_on_outlined, 'Nearby'),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Divider(color: Colors.white54),
            ),
            _buildMenuItem(Icons.bookmark_border, 'Bookmark'),
            _buildMenuItem(Icons.notifications_outlined, 'Notification'),
            _buildMenuItem(Icons.message_outlined, 'Message'),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Divider(color: Colors.white54),
            ),
            _buildMenuItem(Icons.settings_outlined, 'Setting'),
            _buildMenuItem(Icons.help_outline, 'Help'),
            _buildMenuItem(Icons.logout, 'Logout'),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    final isSelected = _selectedItem == title;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: isSelected ? 1 : 0),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: constraints.maxWidth * value,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                ),
              ),
              ListTile(
                leading: Icon(icon, color: Colors.white),
                title: Text(
                  title,
                  style: const TextStyle(color: Colors.white),
                ),
                selected: isSelected,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onTap: () {
                  setState(() {
                    _selectedItem = title;
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
