import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class PaletteProvider with ChangeNotifier {
  Future<PaletteGenerator> generatePalette() async {
    final imageProvider = const AssetImage('assets/images/S5.png');
    final image = await imageProvider.resolve(const ImageConfiguration());
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      imageProvider,
      size: const Size(200, 200),
      maximumColorCount: 10,
    );
    return paletteGenerator;
  }
}
