////////////////////////////////////////////////////////
///Important Note
///verticat and horizontal doctor widget exchanges
////////////////////////////////////////////////////////
library;

import 'package:flutter/material.dart';
import '../utils/media_query_values.dart';

class VerticalDoctorWidget extends StatelessWidget {
  final String tagNum;
  final String name;
  final String speciality;
  final double rate;
  final String reviews;
  final String img;

  const VerticalDoctorWidget(
      {super.key,
      required this.tagNum,
      required this.name,
      required this.speciality,
      required this.rate,
      required this.reviews, 
      required this.img});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Hero(
              tag: 'doctor_img_$tagNum',
              child: Image.asset(
                img,
                height: 110,
                width: 110,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Image.asset('assets/images/Icon-7.png', width: 25, height: 25,),
                    const SizedBox(width: 10),
                    Text(
                      speciality,
                      style: const TextStyle(
                        color: Color.fromRGBO(97, 97, 97, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(
                      Icons.star_purple500_outlined,
                      color: Color.fromRGBO(255, 214, 0, 1),
                      size: 18.45,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${rate.toString()} ($reviews reviews)',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(97, 97, 97, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

class HorizontalDoctorWidget extends StatelessWidget {
  final String tagNum;
  final String name;
  final String speciality;
  final double rate;
  final String reviews;
  final String img;

  const HorizontalDoctorWidget(
      {super.key,
        required this.tagNum,
        required this.name,
        required this.speciality,
        required this.rate,
        required this.reviews, required this.img});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.38,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: 'doctor_img_$tagNum',
            child: Image.asset(
              img,
              height: 110,
              width: 110,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Image.asset('assets/images/Icon-1.png', width: 15, height: 15,),
              const SizedBox(width: 10),
              Text(
                speciality,
                style: const TextStyle(
                  color: Color.fromRGBO(97, 97, 97, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(
                Icons.star_purple500_outlined,
                color: Color.fromRGBO(255, 214, 0, 1),
                size: 18.45,
              ),
              const SizedBox(width: 4),
              Text(
                '${rate.toString()} ($reviews reviews)',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(97, 97, 97, 1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}