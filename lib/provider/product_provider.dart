import 'package:flutter/foundation.dart';
import 'package:my_workshop/model/product.dart';
import 'package:my_workshop/service/api_service.dart';

class ProductProvider with ChangeNotifier {
  List<Product> products = [];
  List<Product>? productSearchResult;
  Product? productSelected;
  ApiService apiService = ApiService();

  setProductSelected(Product product){
    productSelected = product;
  }

  Future<void> getProducts() async {
    var res = await apiService.callGetMothod("products");
    if (res != null) {
      products = List.from(
        res.map(
          (e) => Product.fromJson(e),
        ),
      );
      notifyListeners();
    }
  }

  Future<void> deleteProduct(int id) async {
    var res = await apiService.callDeleteMothod("product/$id");
    if (res != null) {
      await getProducts();
      notifyListeners();
    }
  }

  Future<void> addProducts({
    required String name,
    required String desc,
    required String price,
    required String image,
  }) async {
    var res = await apiService.callPostMothod(
      "product",
      body: {
        "name": name,
        "description": desc,
        "price": price,
        "image_url": image,
      },
    );
    if (res != null) {
      await getProducts();
      notifyListeners();
    }
  }

  Future<void> updateProducts({
    required int id,
    required String name,
    required String desc,
    required String price,
    required String image,
  }) async {
    var res = await apiService.callPutMothod(
      "product/$id",
      body: {
        "name": name,
        "description": desc,
        "price": price,
        "image_url": image,
      },
    );
    if (res != null) {
      await getProducts();
      notifyListeners();
    }
  }

  search(String word) {
    productSearchResult = products
        .where(
          (element) => (element.name ?? "").toLowerCase().contains(word),
        )
        .toList();
    notifyListeners();
  }
}
