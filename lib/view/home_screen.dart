import 'package:clinic_hub_patient_web/models/menu_item_model.dart';
import 'package:clinic_hub_patient_web/view/sections/header_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../components/custom_appbar.dart';
import '../components/custom_drawer.dart';
import '../controllers/navigation_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final NavigationController navigationController = Get.put(NavigationController());

  static final List<MenuItemModel> menuItems = [
    MenuItemModel(title: "Home", index: 0),
    MenuItemModel(title: "About Us", index: 1),
    MenuItemModel(title: "Appointment", index: 2),
    MenuItemModel(title: "Completed", index: 3),
    MenuItemModel(title: "Top Doctors", index: 4),
    MenuItemModel(title: "Profile", index: 5),
    MenuItemModel(title: "Contact", index: 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(menuItems: menuItems),
      drawer: ScreenTypeLayout.builder(
        mobile: (BuildContext context) => CustomDrawer(menuItems: menuItems),
        tablet: (BuildContext context) => CustomDrawer(menuItems: menuItems),
        desktop: (BuildContext context) => const SizedBox.shrink(), // No drawer on desktop
      ),
      body: ScrollablePositionedList.builder(
        itemScrollController: navigationController.itemScrollController,
        itemPositionsListener: navigationController.itemPositionsListener,
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return _buildSection(index);
        },
      ),
    );
  }


  Widget _buildSection(int index) {
    switch (index) {
      case 0:
        return const HeaderSection();
    // case 1:
    //   return const AboutSection();
    // case 2:
    //   return const PagesSection();
    // case 3:
    //   return const ServicesSection();
    // case 4:
    //   return const FindDoctorSection();
    // case 5:
    //   return const BlogSection();
    // case 6:
    //   return const ContactSection();
      default:
        return const SizedBox.shrink();
    }
  }
}
