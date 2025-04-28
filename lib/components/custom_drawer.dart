import 'package:clinic_hub_patient_web/constants/app_color.dart';
import 'package:clinic_hub_patient_web/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/navigation_controller.dart';
import '../models/menu_item_model.dart';

class CustomDrawer extends StatelessWidget {
  final List<MenuItemModel> menuItems;
  const CustomDrawer({super.key, required this.menuItems});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController = Get.find();

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: kPrimaryColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Image.asset(
                    mainLogo,
                    // height: 100,
                    // width: 100,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 8,),
                Text(
                  "Clinic Hub",
                  style: TextStyle(color: kWhiteColor, fontSize: 24),
                ),
              ],
            ),
          ),
          ...menuItems.map(
                (item) => ListTile(
              title: Text(item.title),
              onTap: () {
                Navigator.pop(context); // Close drawer
                navigationController.scrollTo(item.index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
