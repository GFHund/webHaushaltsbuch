<?PHP
require("dbException.php");
class dbConnection
{
  private $oMysqlHandler;
  private static $oDBConnectionInstance = NULL;
  private function __construct()
  {
    $this->oMysqlHandler = mysqli_connect("127.0.0.1","root","","haushaltsbuchdb");
  }
  public static function getInstance()
  {
    if(self::$oDBConnectionInstance == NULL)
    {
      self::$oDBConnectionInstance = new dbConnection();
    }
    return self::$oDBConnectionInstance;
  }
  public function createTable()
  {
    //CREATE TABLE `haushaltsbuchDB`.`productPriceTable` ( `id` INT UNSIGNED NOT NULL , `product_name` VARCHAR(200) NOT NULL , `price` FLOAT NOT NULL , `timestamp` TIMESTAMP NOT NULL , PRIMARY KEY (`id`))
    mysqli_query($this->oMysqlHandler,"CREATE TABLE IF NOT EXISTS productPriceTable(id INT PRIMARY KEY NOT NULL,productName varchar(200),price FLOAT)");
  }

  public function insertData($productName,$price,$tstamp)
  {
    $sSQLString = 'INSERT INTO productPriceTable(product_name,price,timestamp)VALUE("'.$productName.'",'.$price.','.$tstamp.');';
    $success = mysqli_query($this->oMysqlHandler,$sSQLString);
    if($success == false)
    {
      throw new dbException(mysqli_error($this->oMysqlHandler),$sSQLString);
    }
  }
  public function insertProduct($product){
    $sSQLString = 'INSERT INTO productPriceTable(product_name,price,timestamp)VALUE("'.$product->getProductName().'",'.$product->getProductPrice().','.$product->getProductTimestamp().');';
    $success = mysqli_query($this->oMysqlHandler,$sSQLString);
    if($success == false)
    {
      throw new dbException(mysqli_error($this->oMysqlHandler),$sSQLString);
    }
  }
  public function getAllData()
  {
    //SELECT product_name,price,timestamp FROM productPriceTable
  }
  public function close()
  {
    mysqli_close($this->oMysqlHandler);
  }
  public function handleError()
  {
    //aaa
  }
}
?>
