import 'package:flutter/material.dart';
import 'package:vaga_blue_company/shared/design/colors/app_custom_colors.dart';
import 'package:vaga_blue_company/shared/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(children: [
            Image.asset('./assets/images/logo.png'),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(300, 20),
                  backgroundColor: context.colors.grey,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.healthCard);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.badge, color: context.colors.blue2),
                    Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Text(
                        'Carteirnha',
                        style: TextStyle(
                          color: context.colors.blue1,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(300, 20),
                  backgroundColor: context.colors.grey,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.graphics);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.donut_large, color: context.colors.blue2),
                    Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Text(
                        'Gráficos',
                        style: TextStyle(
                          color: context.colors.blue1,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
