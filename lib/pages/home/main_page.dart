import 'package:calvcare/pages/home/chat_page.dart';
import 'package:calvcare/pages/home/home_page.dart';
import 'package:calvcare/pages/home/profile_page.dart';
import 'package:calvcare/pages/home/wishlist_page.dart';
import 'package:calvcare/providers/page_provider.dart';
import 'package:calvcare/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        backgroundColor: secondaryColor,
        child: Image.asset(
          'assets/icon_cart.png',
          width: 20,
        ),
      );
    }

    Widget customButtonNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              backgroundColor: backgroundColor4,
              currentIndex: pageProvider.currentIndex,
              onTap: (value) {
                // ignore: avoid_print
                print(value);
                pageProvider.currentIndex = value;
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                    ),
                    child: Image.asset(
                      'assets/Home.png',
                      width: 21,
                      color: pageProvider.currentIndex == 0
                          ? primaryColor
                          : const Color(0xff808191),
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                    ),
                    child: Image.asset(
                      'assets/icon_chat.png',
                      width: 20,
                      color: pageProvider.currentIndex == 1
                          ? primaryColor
                          : const Color(0xff808191),
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                    ),
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 20,
                        bottom: 10,
                      ),
                      child: Image.asset(
                        'assets/icon_wishlist.png',
                        width: 20,
                        color: pageProvider.currentIndex == 2
                            ? primaryColor
                            : const Color(0xff808191),
                      ),
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icon_profile.png',
                    width: 18,
                    color: pageProvider.currentIndex == 3
                        ? primaryColor
                        : const Color(0xff808191),
                  ),
                  label: '',
                ),
              ]),
        ),
      );
    }

    Widget body() {
      switch (pageProvider.currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return ChatPage();
        case 2:
          return WishlistPage();
        case 3:
          return ProfilePage();
          break;

        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor:
          pageProvider.currentIndex == 0 ? backgroundColor1 : backgroundColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customButtonNav(),
      body: body(),
    );
  }
}
