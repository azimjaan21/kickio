import 'package:flutter/material.dart';
import 'package:kickio/ui/screens/see_more_screen.dart';

class HeadContainer extends StatelessWidget {
  const HeadContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SeeMoreScreen(),
              ),
            ),
      child: Stack(
        children: [
          Center(
            child: Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xff414141),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            style: TextStyle(
                              color: Color(0xff949393),
                            ),
                            text: 'Just Do It \n with ',
                          ),
                          TextSpan(
                            text: 'Nike',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Explore now >',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset('assets/images/nike.png'),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset('assets/images/head.png'),
          ),
          const Positioned(
            bottom: 0,
            left: 15,
            right: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star, size: 20, color: Colors.amber),
                    Icon(Icons.star, size: 20, color: Colors.amber),
                    Icon(Icons.star, size: 20, color: Colors.amber),
                    Icon(Icons.star, size: 20, color: Colors.amber),
                    Icon(Icons.star, size: 20, color: Colors.amber),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
