<html>
<head>
</head>
<body>
  <form action="haushaltsBuchMaske.php" method="post">
    <label for="ProductName"> Product:
      <input id="ProductName" name="ProductName" type="Input" />
    </label>
    <label for="Price"> Preis:
      <input id="Price" name="Price" type="Input" />
    </label>
    <label>Time:
      <select id="timeDay" name="timeDay">
        <?php  for($i=1;$i<=31;$i++) echo "<option>".$i."</option>";?>
      </select>
      <select id="timeMonth" name="timeMonth">
        <?php
        $monthArr = array("Januar","Februar","März","April","Mai","Juni","Juli","August","September","Oktober","November","Dezember");
        for($i=0;$i<31;$i++) echo "<option value=\"".($i+1)."\">".$monthArr[$i]."</option>";
        ?>
      </select>
      <select id="timeYear" name="timeYear">
        <option>2017</option>
        <option>2016</option>
      </select>
    </label>

    <button name="send" type="submit">Send</button>
  </form>
<?PHP
if(isset($_POST['send']))
{
  require("dbConnection.php");
  var_dump($_POST);
  $db = dbConnection::getInstance();
  $sTime = $_POST['timeDay'].'.'.$_POST['timeMonth'].'.'.$_POST['timeYear'];
  $sTimestamp = strtotime($sTime);
  if($sTimestamp == false)
  {
    echo "Fehler beim Convertieren von Datum to timestamp";
  }
  else
  {
    try
    {
      $db->insertData($_POST['ProductName'],$_POST['Price'],$sTimestamp);
    } catch (dbException $e)
    {
      echo $e->getSQLErrorMessage();
    }
  }

  $db->close();
}
?>
</body>
</html>
