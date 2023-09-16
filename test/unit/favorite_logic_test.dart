import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Favorite state toggling logic', () {
    // Initializes a test card data
    final cardData = {
      'image': 'image_url_1',
      'title': 'Test Card',
      'description': 'Description for Test Card',
      'isFavorite': false,
    };

    // Simulates toggling the favorite state
    cardData['isFavorite'] = !(cardData['isFavorite'] as bool);

    // Expects the favorite state to be toggled
    expect(cardData['isFavorite'], true);
  });
}
