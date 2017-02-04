<?php
class dbException extends Exception
{
  private $sSQLString;
  public function __construct($message,$sqlString)
  {
    parent::__construct($message);
    $this->sSQLString = $sqlString;
  }
  public function getSQLErrorMessage():string
  {
    return $this->message."<br />SQL String: ".$this->sSQLString;
  }
}

?>
