import 'package:angular2/core.dart';
import 'package:angular2_components/angular2_components.dart';

import 'package:webHaushaltsbuch/objects/product.dart';

@Component(
  selector: 'Overview-Product-Dialog',
  templateUrl: 'Overview_Product_Dialog.html'
)
class Overview_Product_Dialog
{
  final List<Product> products;
}
