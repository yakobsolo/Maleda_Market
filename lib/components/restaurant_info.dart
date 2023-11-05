import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodly/routes/routed.dart';
import 'package:get/get.dart';

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Maleda Market",
              style: Theme.of(context).textTheme.headline6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF868686),
                ),
                child: Row(
                  children: const [
                    Text("\$\$"),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: CircleAvatar(
                        radius: 2,
                        backgroundColor: Color(0xFF868686),
                      ),
                    ),
                    Text("Pure Ethiopian Food")
                  ],
                ),
              ),
            ),
            Row(
              children: [
                const Text("People's Choice"),
                const SizedBox(width: 8),
                SvgPicture.asset("assets/icons/rating.svg"),
                const SizedBox(width: 4),
                const Text("200+ Users")
              ],
            ),
            const Spacer(),
            Row(
              children: [
                const InfoCard(
                  svgSrc: "assets/icons/delivery.svg",
                  title: "In-Store",
                  subtitle: "Pickup",
                ),
                const SizedBox(width: 16),
                const InfoCard(
                  svgSrc: "assets/icons/clock.svg",
                  title: "15",
                  subtitle: "Minutes Max",
                ),
                const SizedBox(width: 24),
                const Spacer(),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    primary: const Color(0xFF22A45D),
                    fixedSize: const Size(120, 40),
                    side: const BorderSide(color: Color(0xFF22A45D)),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () => Get.toNamed(RouteHelper.getCart()),
                    child: Text(
                      "Take away".toUpperCase(),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                )
              ],
            ),
            // const Spacer(),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.svgSrc,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String svgSrc, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(svgSrc),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        )
      ],
    );
  }
}
