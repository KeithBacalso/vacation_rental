import 'package:flutter/material.dart';

class PropertyTypeSelector extends StatefulWidget {
  const PropertyTypeSelector({Key? key}) : super(key: key);

  @override
  State<PropertyTypeSelector> createState() => _PropertyTypeSelectorState();
}

class _PropertyTypeSelectorState extends State<PropertyTypeSelector> {
  String _selectedType = 'House'; // Default selected type

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Search address, or near you',
            hintStyle: const TextStyle(color: Colors.black54),
            prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
            suffixIcon: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.tune, color: Colors.white),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[100],
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 80,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildPropertyTypeButton('House'),
                const SizedBox(width: 8),
                _buildPropertyTypeButton('Apartment'),
                const SizedBox(width: 8),
                _buildPropertyTypeButton('Hotel'),
                const SizedBox(width: 8),
                _buildPropertyTypeButton('Villa'),
                const SizedBox(width: 8),
                _buildPropertyTypeButton('Cottage'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPropertyTypeButton(String text) {
    bool isSelected = _selectedType == text;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ]
            : [],
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            _selectedType = text;
          });
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: isSelected ? Colors.blue : Colors.grey.shade100,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
