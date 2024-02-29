import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF4EA),
      body: Stack(
        children: [
          const SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    "Flexi-benefits",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Explore various tax-saving allowances available to you and opt for those that make the most sense for you",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF757575)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AllowanceCard(
                    icon: "fuel_icon",
                    title: "Fuel Allowance",
                    vector: "rings_1",
                    cardColor: Color(0xFFFEAA6C),
                    titleColor: Color(0xFF80121D),
                    price: "2400",
                  ),
                  SizedBox(height: 8),
                  AllowanceCard(
                    icon: "meal_icon",
                    title: "Meal Card",
                    vector: "rings_2",
                    cardColor: Color(0xFF83EDA8),
                    titleColor: Color(0xFF114036),
                    price: "2200",
                  ),
                  SizedBox(height: 8),
                  AllowanceCard(
                    icon: "car_icon",
                    title: "Commute Allowance",
                    vector: "rings_3",
                    cardColor: Color(0xFFFEC858),
                    titleColor: Color(0xFF5C3A12),
                    price: "1600",
                  ),
                  SizedBox(height: 150),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "₹ 0 allocated",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF191919)),
                        ),
                        Text(
                          "₹ 10,000 available",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFAFAFAF)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Stack(
                      children: [
                        Container(
                          height: 7,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xFFEEEEEE),
                              borderRadius: BorderRadius.circular(68)),
                        ),
                        Container(
                          height: 7,
                          width: 7,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF42D499),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 62,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(102),
                          color: const Color(0xFF191919)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Continue",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFFFFFFF)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: const Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                  size: 12,
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AllowanceCard extends StatelessWidget {
  final String icon;
  final String title;
  final String vector;
  final Color cardColor;
  final Color titleColor;
  final String price;
  const AllowanceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.vector,
    required this.cardColor,
    required this.titleColor,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset("assets/images/$icon.svg"),
              const SizedBox(
                height: 12,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: titleColor),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: CustomPaint(
                    painter: DashedLinePainter(), child: Container()),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Allocate upto ₹ $price / month",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF191919)),
                  ),
                  Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
                      child: Padding(
                        padding: const EdgeInsets.all(0.5),
                        child: Icon(
                          Icons.chevron_right_rounded,
                          color: cardColor,
                          size: 16,
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
        Positioned(
            right: 0,
            top: 0,
            child: SvgPicture.asset("assets/images/$vector.svg"))
      ],
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 8, dashSpace = 5, startX = 0;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = Colors.white
      ..strokeWidth = 1;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
