import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2_components/angular2_components.dart';

import '../objects/product.dart';
import '../services/productService.dart';

@Component(
  selector: 'Overview-Product-Dialog',
  templateUrl: 'Overview_Product_Dialog.html'
)
class Overview_Product_Dialog implements OnInit
{
  //final RouteParams _routeParams;
  List<Product> products;
  final ProductService _productService;
  Overview_Product_Dialog(this._productService){
    //aaa
  }
  //final List<Product> products;
  Future<Null> ngOnInit() async
  {
    products = (await _productService.getProducts());
  }
}
