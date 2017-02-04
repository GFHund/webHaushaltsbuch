import 'dart:async';
import 'dart:convert';

import 'package:angular2/core.dart';
import 'package:http/http.dart';

import 'package:webHaushaltsbuch/objects/product.dart';

@Injectable()
class ProductService
{
  static final _productsUrl = 'server/productsJson';
  Future<List<Product>> getProducts() async
  {
    try{
      final response = await _http.get(_productsUrl);
      final products = _extractData(response)
      .map((value)=>new Product.fromJson(value))
      .toList();
    }
    catch(e)
    {
      throw _handleError(e);
    }
  }

  dynamic _extractData(Response resp) => JSON.decode(resp.body)['data'];

  Exception _handleError(dynamic e)
  {
    print(e);
    return new Exception('Server error; cause: $e');
  }
}