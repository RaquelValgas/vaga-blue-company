import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:vaga_blue_company/shared/design/colors/app_custom_colors.dart';
import 'package:vaga_blue_company/shared/design/text-style/app_custom_text_styles.dart';

class HealthCardPage extends StatefulWidget {
  const HealthCardPage({super.key});

  @override
  State<HealthCardPage> createState() => _HealthCardPageState();
}

class _HealthCardPageState extends State<HealthCardPage> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  String side = 'Verso';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.white,
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('./assets/images/logo.png'),
            FlipCard(
              key: cardKey,
              flipOnTouch: false,
              direction: FlipDirection.HORIZONTAL,
              front: Container(
                width: 350,
                height: 200,
                decoration: BoxDecoration(
                    color: context.colors.grey,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nome:",
                        style: context.textStyles.textBold.copyWith(
                            color: context.colors.black,
                            fontSize: 15,
                            decoration: TextDecoration.none),
                      ),
                      Text(
                        "João Silva Rodrigues",
                        style: context.textStyles.textRegular.copyWith(
                            color: context.colors.black,
                            fontSize: 15,
                            decoration: TextDecoration.none),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Meu Plano:",
                        style: context.textStyles.textBold.copyWith(
                            color: context.colors.black,
                            fontSize: 15,
                            decoration: TextDecoration.none),
                      ),
                      Text(
                        "Básico",
                        style: context.textStyles.textRegular.copyWith(
                            color: context.colors.black,
                            fontSize: 15,
                            decoration: TextDecoration.none),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Carteirinha:",
                        style: context.textStyles.textBold.copyWith(
                            color: context.colors.black,
                            fontSize: 15,
                            decoration: TextDecoration.none),
                      ),
                      Text(
                        "4561589310000235",
                        style: context.textStyles.textRegular.copyWith(
                            color: context.colors.black,
                            fontSize: 15,
                            decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                ),
              ),
              back: Container(
                width: 350,
                height: 200,
                decoration: BoxDecoration(
                    color: context.colors.grey,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Abrangência:",
                        style: context.textStyles.textBold.copyWith(
                            color: context.colors.black,
                            fontSize: 15,
                            decoration: TextDecoration.none),
                      ),
                      Text(
                        "Nacional",
                        style: context.textStyles.textRegular.copyWith(
                            color: context.colors.black,
                            fontSize: 15,
                            decoration: TextDecoration.none),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Acomodação:",
                        style: context.textStyles.textBold.copyWith(
                            color: context.colors.black,
                            fontSize: 15,
                            decoration: TextDecoration.none),
                      ),
                      Text(
                        "Enfermaria",
                        style: context.textStyles.textRegular.copyWith(
                            color: context.colors.black,
                            fontSize: 15,
                            decoration: TextDecoration.none),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(300, 20),
                backgroundColor: context.colors.grey,
              ),
              onPressed: () {
                cardKey.currentState!.toggleCard();
                setState(() {
                  side = cardKey.currentState!.isFront ? 'Frente' : 'Verso';
                });
              },
              child: Text(
                side,
                style: TextStyle(
                  color: context.colors.blue1,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
