import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:flutter/material.dart';
import './../config/colors.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

  String currentPage = "posts";

  void setCurrentPage(String mode) {
    setState(() => currentPage = mode);
  }

  void handleMenuState() {
    final _state = _sideMenuKey.currentState;
    if (_state.isOpened)
      _state.closeSideMenu();
    else
      _state.openSideMenu();
  }

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      background: CustomColor.mainAccent,
      menu: buildMenu(),
      key: _sideMenuKey,
      type: SideMenuType.slideNRotate,
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.menu),
              color: CustomColor.mainAccent,
              onPressed: () => handleMenuState(),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Center(
                child: Text(
                  currentPage,
                  style: TextStyle(
                    color: CustomColor.mainAccent,
                    fontSize: 32,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenu() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 32, top: 32),
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 92,
                height: 92,
                margin: EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/face.jpg'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
              Text(
                "Hi,",
                style: TextStyle(color: Colors.white70, fontSize: 32),
                textAlign: TextAlign.start,
              ),
              Text(
                "Ann",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
              _menuOption(
                currentPage == "posts",
                "Posts",
                Icons.note,
                () => setCurrentPage("posts"),
              ),
              _menuOption(
                currentPage == "animals",
                "Animals",
                Icons.pets,
                () => setCurrentPage("animals"),
              ),
              _menuOption(
                currentPage == "vets",
                "Vets",
                Icons.medical_services,
                () => setCurrentPage("vets"),
              ),
              _menuOption(
                currentPage == "food",
                "Food",
                Icons.food_bank,
                () => setCurrentPage("food"),
              ),
              _menuOption(false, "Logout", Icons.logout, () => print("Logout"))
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuOption(
      bool isActive, String text, IconData icon, Function onTapEvent) {
    return GestureDetector(
      onTap: () {
        onTapEvent();
        Future.delayed(Duration(milliseconds: 400), () => handleMenuState());
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.only(top: 12),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isActive ? Colors.white : CustomColor.mainAccent,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(
                icon,
                size: 32,
                color: isActive ? CustomColor.mainAccent : Colors.white,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                color: isActive ? CustomColor.mainAccent : Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
