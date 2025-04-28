import 'package:clinic_hub_patient_web/constants/app_color.dart';
import 'package:clinic_hub_patient_web/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:animate_do/animate_do.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        height: MediaQuery.of(context).size.height,
        child: ScreenTypeLayout.builder(
          mobile: (context) => _buildMobileLayout(context),
          desktop: (context) => _buildDesktopLayout(context),
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            clinicImage,
            fit: BoxFit.contain,
          ),
        ),
        Text(
          "Find a Doctor & Book Online",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Medical Recovery is most focused in helping you discover your most beautiful self.",
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              ),
              child: const Text("Take Appointment",style: TextStyle(color: kWhiteColor),),
            ),
            const SizedBox(width: 16),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: kPrimaryColor),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              ),
              child: const Text("Learn More",style: TextStyle(color: kPrimaryColor),),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        // Left text section
        Expanded(
          flex: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Find a Doctor & Book Online",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Medical Recovery is most focused in helping you discover your most beautiful self.",
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    ),
                    child: const Text("Take Appointment",style: TextStyle(color: kWhiteColor),),
                  ),
                  const SizedBox(width: 20),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: kPrimaryColor),
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    ),
                    child: const Text("Learn More",style: TextStyle(color: kPrimaryColor),),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Right doctor image with two background colors below
        Expanded(
          flex: 5,
          child: Stack(
            children: [
              // Background half blue half white
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white, // Light blue background
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: kPrimaryColor, // White background
                    ),
                  ),
                ],
              ),
              // Doctor image on top
              Center(
                child: Image.asset(
                  clinicImage,
                  fit: BoxFit.contain,
                  height: 800, // you can adjust height if needed
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
