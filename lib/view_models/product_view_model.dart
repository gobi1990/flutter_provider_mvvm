import 'package:flutter/cupertino.dart';
import 'package:flutter_provider_mvvm/models/product.dart';

class ProductViewModel extends ChangeNotifier {
  bool _loading = false;
  List<Product> _productsList = [];

  bool get loading => _loading;
  List<Product> get productsList => _productsList;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setProductListModel(List<Product> productList) {
    _productsList = productList;
  }

  
}
