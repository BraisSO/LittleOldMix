<?php
$file = fopen("copa.txt", "r");
while( !feof($file) ) {
echo fgetc($file), "</br>";
}

fclose($file);
?>


