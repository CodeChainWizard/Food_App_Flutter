import 'package:flutter/material.dart';
import 'package:food_delivery/data/controllers/cart_controller.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];

  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;

  int _quantity = 0;

  int get quantity => _quantity;

  int _inCartItem = 0;

  int get inCartItem => _inCartItem + _quantity;

  late CartController _cart;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      print(_popularProductList);
      update();
    } else {
      print("not get...");
    }
  }

  // Manage Quantity
  void setQuantity(bool isIncrements) {
    if (isIncrements) {
      _quantity = checkQuantity(_quantity + 1);
      print("number of itmes:- " + quantity.toString());
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  // _inCartItems = 2;
  // _quantity = 0;
  // _quantity = -2;
  //
  int checkQuantity(int quantity) {
    if ((_inCartItem + quantity) < 0) {
      Get.snackbar("Hey Buddy!!", "You can't reduce more!",
          backgroundColor: Colors.white60, colorText: Colors.black);
      if (_inCartItem > 0) {
        _quantity = -_inCartItem;
        return _quantity;
      }
      return 0;
    } else {
      if ((_inCartItem + quantity) > 25) {
        Get.snackbar("Hey Buddy!!", "You Can't Increase more!",
            backgroundColor: Colors.white60, colorText: Colors.black);
        return 25;
      } else {
        return quantity;
      }
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItem = 0;
    _cart = cart;

    // if exits
    // get from storage inCartItems = 3
    var exist = false;
    exist = _cart.existInCat(product);

    print(exist.toString());
    if (exist) {
      _inCartItem = _cart.getQuantity(product);
    }
    // print("Quantity is:- "+_inCartItem.toString());
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItem = _cart.getQuantity(product);

    _cart.items.forEach((key, value) {
      print("The id is:- ${value.id} the Quantity is:- ${value.quantity}");
    });
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  //-------- Here, Push Cart data.
  List<CartModel> get getItems{
    return _cart.getItems;
  }
}
