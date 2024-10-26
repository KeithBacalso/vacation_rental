import 'package:flutter/material.dart';

class BestForYou extends StatelessWidget {
  const BestForYou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildBestForYouCard(
          'Orchard House',
          'Rp 2.500.000.000 / Year',
          '6 Bedroom',
          '4 Bathroom',
          'assets/best/orchard.png',
        ),
        const SizedBox(height: 16),
        _buildBestForYouCard(
          'The Hollies House',
          'Rp 2.000.000.000 / Year',
          '5 Bedroom',
          '2 Bathroom',
          'assets/best/hollies.png',
        ),
        const SizedBox(height: 16),
        _buildBestForYouCard(
          'Sea Breeze House',
          'Rp. 900.000.000 / Year',
          '2 Bedroom',
          '2 Bathroom',
          'assets/best/sea_breeze.png',
        ),
      ],
    );
  }

  Widget _buildBestForYouCard(String name, String price, String bedrooms,
      String bathrooms, String imagePath) {
    return Container(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            child: Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: const TextStyle(color: Colors.blue),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.king_bed_outlined, size: 16),
                  const SizedBox(width: 4),
                  Text(bedrooms),
                  const SizedBox(width: 16),
                  const Icon(Icons.bathtub_outlined, size: 16),
                  const SizedBox(width: 4),
                  Text(bathrooms),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
