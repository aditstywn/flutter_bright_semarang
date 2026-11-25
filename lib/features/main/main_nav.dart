import 'package:material_ui/material_ui.dart';

import '../../core/style/color/colors_app.dart';
import '../home/presentation/home_page.dart';

class MainNav extends StatefulWidget {
  final String? appVersion;
  const MainNav({super.key, this.appVersion});

  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),

    const Center(
      child: Text(
        'Profile',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _selectedIndex, children: _pages),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          decoration: BoxDecoration(
            color: ColorsApp.white,
            boxShadow: [
              BoxShadow(
                color: ColorsApp.grey.withAlpha(50),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              child: BottomNavigationBar(
                onTap: _onItemTapped,
                currentIndex: _selectedIndex,
                backgroundColor: ColorsApp.white,
                showUnselectedLabels: true,
                showSelectedLabels: true,
                selectedItemColor: ColorsApp.primary,
                unselectedItemColor: ColorsApp.grey,
                selectedLabelStyle: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.home_outlined, size: 23),
                    activeIcon: const Icon(Icons.home, size: 23),
                    label: 'Home',
                  ),

                  BottomNavigationBarItem(
                    icon: const Icon(Icons.person_outline, size: 23),
                    activeIcon: const Icon(Icons.person, size: 23),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
