// ignore_for_file: deprecated_member_use
import 'package:kickio/tools/file_importer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;
  List<Widget> pages = const [
    HomeScreen(),
    OrdersScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        destinations: [
          NavigationDestination(
              selectedIcon: SvgPicture.asset('assets/images/icon_home.svg'),
              icon: SvgPicture.asset(
                'assets/images/icon_home.svg',
                color: const Color(0xffCDCDCD),
              ),
              label: ''),
          NavigationDestination(
              selectedIcon: SvgPicture.asset(
                'assets/images/icon_wallet.svg',
                color: Colors.black,
              ),
              icon: SvgPicture.asset(
                'assets/images/icon_wallet.svg',
              ),
              label: ''),
          NavigationDestination(
              selectedIcon: SvgPicture.asset(
                'assets/images/icon_cart.svg',
                color: Colors.black,
              ),
              icon: SvgPicture.asset('assets/images/icon_cart.svg'),
              label: ''),
          NavigationDestination(
              selectedIcon: SvgPicture.asset(
                'assets/images/icon_user.svg',
                color: Colors.black,
              ),
              icon: SvgPicture.asset('assets/images/icon_user.svg'),
              label: ''),
        ],
      ),
    );
  }
}
