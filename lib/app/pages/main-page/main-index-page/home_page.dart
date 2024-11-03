import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obateka/app/components/global/floating_bot.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/home.png',
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ),
          Positioned(
            top: 360,
            right: 100,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              width: 95,
              height: 120,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: InkWell(
                onTap: () {
                  Get.toNamed('/obateka');
                },
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icons/obateka.png',
                      width: 60,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Obateka',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(5),
              width: 100,
              height: 90,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: FloatingBot(),
            ),
          ),
        ],
      ),
    );
  }
}
