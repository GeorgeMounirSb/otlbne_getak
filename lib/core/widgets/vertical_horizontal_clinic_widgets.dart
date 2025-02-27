////////////////////////////////////////////////////////
///Important Note
///verticat and horizontal clinic widget exchanges
////////////////////////////////////////////////////////
library;

import 'package:flutter/material.dart';
import '../utils/media_query_values.dart';

class VerticalClinicWidget extends StatelessWidget {
  final String tagNum;
  final String name;
  final String speciality;
  final double rate;
  final String reviews;
  final String img;

  const VerticalClinicWidget(
      {super.key,
      required this.tagNum,
      required this.name,
      required this.speciality,
      required this.rate,
      required this.reviews,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Expanded(
          child: Column(
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
              Text(
                speciality,
                style: const TextStyle(
                  color: Color.fromRGBO(97, 97, 97, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
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
        ),
      ],
    );
  }
}

class HorizontalClinicWidget extends StatelessWidget {
  final String tagNum;
  final String name;
  final String speciality;
  final double rate;
  final String reviews;
  final String img;

  const HorizontalClinicWidget(
      {super.key,
        required this.tagNum,
        required this.name,
        required this.speciality,
        required this.rate,
        required this.reviews, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.42,
      height: context.height * 0.25,
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: 'doctor_img_$tagNum',
            child: Image.asset(
              img,
              height: context.height * 0.12,
              width: context.width * 0.4,
            ),
          ),
          const SizedBox(height: 4),
          Flexible(
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            speciality,
            style: const TextStyle(
              color: Color.fromRGBO(97, 97, 97, 1),
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(
                Icons.star_purple500_outlined,
                color: Color.fromRGBO(255, 214, 0, 1),
                size: 18.45,
              ),
              const SizedBox(width: 2),
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