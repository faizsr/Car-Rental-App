import 'dart:ui';

const String montserrat = 'Montserrat';

List<String> brands = [
  'ALL',
  'BMW',
  'PORSCHE',
  'AUDI',
  'SKODA',
  'MERCEDEZ',
  'SUZUKI',
  'LAMBORGHINI',
  'MAHINDRA',
  'TESLA',
  'TATA',
  'VOLKSWAGEN',
  'ASTON MARTIN'
];

extension HexToColor on String {
  Color hexToColor() {
    return Color(
        int.parse(toLowerCase().substring(1, 7), radix: 16) + 0xFF000000);
  }
}
