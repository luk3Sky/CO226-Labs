<?php
   if (isset($_POST['submit'])){
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <meta http-equiv="X-UA-Compatible" content="ie=edge">
 <title>Document</title>
 <style>
     .round1 {
         border: 5px solid black;
         border-radius: 2px;
         width: fit-content;
     }
 </style>
</head>
<body>

 <article>
     <main>
         <section class="round1" >
             <div style="margin:10px;">
                 <h1>Your Information System</h1>
                 <p>Thank you, <?php echo $_POST['first-name']?> for your purchase from our web site.</p>
                 <p>Your item colour is : <?php echo $_POST['color-selection']?> & T-Shirt Size : <?php  echo $_POST['size_selection']?>
                 <p>Selected item/items are :</p>
                 <?php  
                     if (isset($_POST['cap'])) {
                         echo "<li>Cap";
                     }
                 ?>
                 <?php
                     if(isset($_POST['wrist_band'])) {
                         echo "<li>Wrist band";
                     }
                     
                 ?>
                 <p>Your items wil be sent to :</p>
                 <?php 
                 echo $_POST['first-name']," ",$_POST['last-name'],",<br>";
                 echo $_POST['address_line_1'],",<br>";
                 echo $_POST['address_line_2'],",<br>";
                 echo $_POST['address_line_3'],",<br>";
                 ?>
                 <!-- <p>Thank you for submitting your comments. We appriciate it. You said:</p> -->
                 
                 <?php 
                     if (!empty($_POST["comment"])) {
                         echo "<p>Thank you for submitting your comments. We appriciate it. You said:</p>";
                         echo $_POST["comment"];
                     }else{
                         echo "<p>Thank you for submitting.</p>";
                     }
                 ?>
             </div>
             
         </section>
     </main>
 </article>
</body>
</html>