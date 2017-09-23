<?php


function runhelp() {

   echo "\n  DEFINED FUNCTIONS AND PARAMS: (-fn <params>) \n\n";
   echo "    -cs: copy_select_files(source_location, destination_location, pattern)\n\n";	
   echo "    -ms: move_select_files(source_location, destination_location, pattern)\n\n";
   echo "    -ds: delete_select_files(source_location, pattern)\n\n";

   echo "    -cb: copy_bulk_files(source_location, destination_location)\n\n";	
   echo "    -mb: move_bulk_files(source_location, destination_location)\n\n";
   echo "    -db: delete_bulk_files(source_location)\n\n";

} 


// SELECT FILE(S) MANAGEMENT
function copy_select_files($src_loc, $dst_loc, $pattern) {

   if (!file_exists($dst_loc)) {
       mkdir($dst_loc, 0777, true);
   }

   chdir($src_loc);

   foreach (glob($pattern) as $file) {
       echo "copying ".$file ."...\n";
       copy($file, $dst_loc . "/". $file);
   }
}

function move_select_files($src_loc, $dst_loc, $pattern) {

   if (!file_exists($dst_loc)) {
       mkdir($dst_loc, 0777, true);
   }

   chdir($src_loc);

   foreach (glob($pattern) as $file) {
       echo "moving ".$file."...\n";
       rename($file, $dst_loc . "/". $file);
   }
}
  
function delete_select_files($src_loc, $pattern) {

   chdir($src_loc);

   foreach (glob($pattern) as $file) {
       echo "deleting ".$file."...\n";
       unlink($file);
   }
}


// BULK FILE  MANAGEMENT
function copy_bulk_files($src_loc, $dst_loc) {

   if (!file_exists($dst_loc)) {
       mkdir($dst_loc, 0777, true);
   }

   chdir($src_loc);

   foreach (glob("*") as $file) {
       echo "copying ".$file."...\n";
       copy($file, $dst_loc . "/". $file);
   }

}

function move_bulk_files($src_loc, $dst_loc) {

   if (!file_exists($dst_loc)) {
       mkdir($dst_loc, 0777, true);
   }

   chdir($src_loc);

   foreach (glob("*") as $file) {
       echo "moving ".$file."...\n";
       rename($file, $dst_loc . "/". $file);
   }

}

function delete_bulk_files($src_loc) {

   chdir($src_loc);

   foreach (glob("*") as $file) {
       echo "deleting ".$file."...\n";
       unlink($file);
   }
}



switch ($argv[1]) {
    case "-cs":
        copy_select_files($argv[2], $argv[3], $argv[4]);
        break;
    case "-ms":
        move_select_files($argv[2], $argv[3], $argv[4]);
        break;
    case "-ds":
        delete_select_files($argv[2], $argv[3]);
        break;

    case "-cb":
        copy_select_files($argv[2], $argv[3]);
        break;
    case "-mb":
        move_select_files($argv[2], $argv[3]);
        break;
    case "-db":
        delete_select_files($argv[2]);
        break;

    case "-h":
    case "-help":
        runhelp();
        break;

    default:
        echo "Unable to find that command. Please try again or see -[h]elp";
} 





?>
