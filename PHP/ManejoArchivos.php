
    <?php
    $target_dir= "descargas/";
    $target_file= $target_dir.basename($_FILES["archivo"]["name"]);
    move_uploaded_file($_FILES["archivo"]["tmp_name"],$target_file);
    ?>
   

