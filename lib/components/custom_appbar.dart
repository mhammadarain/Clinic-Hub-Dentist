import 'package:clinic_hub_patient_web/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../controllers/navigation_controller.dart';
import '../models/menu_item_model.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<MenuItemModel> menuItems;
  const CustomAppBar({super.key, required this.menuItems});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController = Get.find();

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          Text(
            "⚡ Clinic Hub",
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const Spacer(),
          ScreenTypeLayout.builder(
            mobile: (context) => const SizedBox(), // No menu buttons on mobile
            desktop: (context) => Row(
              children: menuItems.map((item) {
                return TextButton(
                  onPressed: () => navigationController.scrollTo(item.index),
                  child: Text(
                    item.title,
                    style: const TextStyle(color: Colors.black87),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(width: 10),
          if (getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.desktop)
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
              onPressed: () {},
              child: const Text("Book Appointment",style: TextStyle(color: kWhiteColor),),
            ),
        ],
      ),
      iconTheme: const IconThemeData(color: kPrimaryColor),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
