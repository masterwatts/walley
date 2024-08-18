import 'package:flutter/material.dart';
import 'package:walley/impl/ui/root/walley_navigation_bar.dart';
import 'package:walley/impl/ui/user/user_page.dart';
import 'package:walley/main.dart';

// ignore: must_be_immutable
class WalleyAppBar extends StatelessWidget {
  WalleyNavigationBar walleyNavigationBar;

  WalleyAppBar({super.key, required this.walleyNavigationBar});

  @override
  Widget build(BuildContext context) {
    return walleyAppBar(context, walleyNavigationBar);
  }

  AppBar walleyAppBar(
    BuildContext context,
    WalleyNavigationBar walleyNavigationBar,
  ) =>
      AppBar(
        toolbarHeight: 60,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onLongPress: () => {
                    if (walleyNavigationBar.isHomeScreen())
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text(
                              "Walley version ${Walley.version} ${Walley.beta ? "beta" : ""}.",
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      },
                  },
                  child: Row(
                    children: [
                      Text(
                        walleyNavigationBar.getScreen().getName(),
                        style: const TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 6,
                          ), // Adjust the height to move the text down
                          Text(
                            (Walley.beta && walleyNavigationBar.isHomeScreen())
                                ? "beta"
                                : "",
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserPage()),
              ),
              // Navigator.push(
              //   context,
              //   MaterialPageRoute<ProfileScreen>(
              //     builder: (context) => ProfileScreen(
              //       actions: [
              //         SignedOutAction((context) {
              //           Navigator.of(context).pop();
              //         })
              //       ],
              //     ),
              //   ),
              // )
              child: const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/placeholder_avatar.jpg'),
              ),
            ),
          ],
        ),
        centerTitle: false,
      );
}
