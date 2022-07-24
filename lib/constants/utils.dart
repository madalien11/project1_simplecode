import '../model/product_model.dart';

List<ProductModel> filter({
  required List<ProductModel> data,
  rating,
  category,
}) {
  return rating == 'all' && category == 'all'
      ? data
      : data.where((element) {
          if (rating == 'all') {
            return element.category == category;
          }
          if (category == 'all') {
            return element.rating.rate >= double.parse(rating);
          }
          return element.category == category &&
              element.rating.rate >= double.parse(rating);
        }).toList();
}
