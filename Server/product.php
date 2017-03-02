<?php
class Product{
  private $productName;
  private $productPrice;
  private $productTimestamp;
  public function _constructor($productName,$productPrice,$productTimestamp){
    $this->productName = $productName;
    $this->productPrice = $productPrice;
    $this->productTimestamp = $productTimestamp;
  }

  public static function createObjFromJSON($oJSON)
  {
    $name = $oJSON["Name"];
    $price = $oJSON["Price"];
    $time = $oJSON["Time"];
    return new Product($name,$price,$time);
  }

  //getter and setter methods
  public function getProductName(){
    return $this->productName;
  }

  public function getProductPrice(){
    return $this->productPrice;
  }

  public function getProductTimestamp(){
    return $this->productTimestamp;
  }
}
 ?>
