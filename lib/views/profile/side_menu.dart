import 'package:d_cal/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home_controller.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final HomeController c = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: Responsive.isDesktop(context)
          ? null
          : Responsive.isTablet(context)
              ? size.width * 0.6
              : size.width * 0.5,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.048,
          ),
          if (Responsive.isDesktop(context))
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: size.width * 0.016),
                  child: Container(
                    padding: EdgeInsets.only(
                      top: size.height * 0.014,
                      bottom: size.height * 0.014,
                      left: size.width * 0.017,
                      right: size.width * 0.021,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: const Color(0xFFF2F2F2),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.arrow_back_ios_new,
                          size: 12,
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        const Text(
                          'return',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          _listTileItems(
            index: 0,
            icon: Icons.person,
            title: 'profile',
            top: size.height * 0.032,
            left: size.width * 0.016,
            right: size.width * 0.016,
          ),
          _listTileItems(
            index: 1,
            icon: Icons.edit_note_sharp,
            title: 'Advanced Settings',
            top: size.height * 0.008,
            left: size.width * 0.016,
            right: size.width * 0.016,
          ),
          _listTileItems(
            index: 2,
            icon: Icons.help,
            title: 'help',
            top: size.height * 0.008,
            left: size.width * 0.016,
            right: size.width * 0.016,
          ),
          _listTileItems(
            index: 3,
            icon: Icons.note,
            title: 'Terms of Service',
            top: size.height * 0.008,
            left: size.width * 0.016,
            right: size.width * 0.016,
          ),
          _listTileItems(
            index: 4,
            icon: Icons.logout_sharp,
            title: 'logout',
            top: size.height * 0.008,
            left: size.width * 0.016,
            right: size.width * 0.016,
          ),
        ],
      ),
    );
  }

  Widget _listTileItems({
    required int index,
    required IconData icon,
    required String title,
    required double top,
    required double left,
    required double right,
  }) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.only(
          top: top,
          left: left,
          right: right,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: c.listTileIndex.value == index
                ? const BorderRadius.all(
                    Radius.circular(16),
                  )
                : null,
            color: c.listTileIndex.value == index
                ? const Color(0xFFFF6F42).withOpacity(0.05)
                : null,
          ),
          child: ListTile(
            onTap: () {
              c.updateListTileSelection(index);
            },
            leading: Icon(icon),
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            textColor: c.listTileIndex.value == index
                ? const Color(0xFFFF6F42)
                : const Color(0xFFACACAC),
            iconColor: c.listTileIndex.value == index
                ? const Color(0xFFFF6F42)
                : const Color(0xFFACACAC),
            horizontalTitleGap: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
