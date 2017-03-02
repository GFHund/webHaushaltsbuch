<?php
$sJson = file_get_contents("php://input");
$oJSON = json_decode($sJson);
if($oJSON == NULL)
{
  echo "data:{result:\"cannot decode JSON\"}";
  die();
}
$oProduct = product::createObjFromJSON($oJSON);
$db = new dbConnection();
$db->insertProduct($oProduct);
$db->close();
/*
foreach($oJSON as $oProduct){
  //aaa
}
*/
 ?>
