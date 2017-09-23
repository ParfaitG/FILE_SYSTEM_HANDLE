import java.util.regex.Matcher;
import java.util.regex.Pattern;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.io.FilenameFilter;
import java.io.FileWriter;
import java.io.IOException;

public class CopyMoveDeleteFiles {       
    
   public static void main(String[] args) {
 
       try {
	     if (args.length != 0) {
	      switch(args[0]){  
		  case "-h": run_help(); break;  
		  case "-help": run_help(); break;  
		  case "-cs": copy_select_files(args[1], args[2], args[3]); break;
		  case "-ms": move_select_files(args[1], args[2], args[3]); break;
		  case "-ds": delete_select_files(args[1], args[2]); break;
		  case "-cb": copy_bulk_files(args[1], args[2]); break;
		  case "-mb": move_bulk_files(args[1], args[2]); break;
		  case "-db": delete_bulk_files(args[1]); break;
		  default: System.out.println("Unable to run command. Please try again or see -[h]elp for more info.");
	      }
	     } else  {
		System.out.println("No args entered. Please try again or see -[h]elp for more info.");
	     }
        } catch (ArrayIndexOutOfBoundsException abe) {
            System.out.println("You are short of a missing argument. Please try again or see -[h]elp.");
        } 
   }

   public static void run_help() {
      String msg = String.join("\n",
                               "",
                               "DEFINED FUNCTIONS AND PARAMS (-fn <params>):",
                               "",    
                               "-cs: copy_select_files(source_location, destination_location, pattern)",
                               "-ms: move_select_files(source_location, destination_location, pattern)",
                               "-ds: delete_select_files(source_location, pattern)",
                               "",
                               "-cb: copy_bulk_files(source_location, destination_location)",
                               "-mb: move_bulk_files(source_location, destination_location)",
                               "-db: delete_bulk_files(source_location);",
                               "");
      System.out.println(msg);

   }

   // SELECT FILE(S) MANAGEMENT
   public static void copy_select_files(String src_loc, String dst_loc, String pattern) {
       Pattern p = Pattern.compile(pattern);

       File src_dir = new File(src_loc);
       File dst_dir = new File(dst_loc);

       try {

           if (Files.notExists(dst_dir.toPath())){
               Files.createDirectory(dst_dir.toPath());
           }

           File[] matches = src_dir.listFiles(new FilenameFilter() {
               public boolean accept(File src_dir, String fname) {
                   Matcher m = p.matcher(fname); 
                   return m.find();
               }
           });

           for(File m: matches){
               if(m.isFile()) {
                 System.out.println(m.getName() + " copying...");
                 Files.copy(m.toPath(), (new File(dst_loc+'/'+m.getName()).toPath()), StandardCopyOption.REPLACE_EXISTING);
               }
           }
       } catch (IOException ioe) {
            System.err.println(ioe.getMessage());
       }
      
   }

   public static void move_select_files(String src_loc, String dst_loc, String pattern) {
       Pattern p = Pattern.compile(pattern);

       File src_dir = new File(src_loc);
       File dst_dir = new File(dst_loc);

       try {

           if (Files.notExists(dst_dir.toPath())){
               Files.createDirectory(dst_dir.toPath());
           }

           File[] matches = src_dir.listFiles(new FilenameFilter() {
               public boolean accept(File src_dir, String fname) {
                   Matcher m = p.matcher(fname); 
                   return m.find();
               }
           });

           for(File m: matches){
               if(m.isFile()) {
                 Files.move(m.toPath(), (new File(dst_loc+'/'+m.getName()).toPath()), StandardCopyOption.REPLACE_EXISTING);
                 System.out.println(m.getName() + " moving...");
               }
           }
       } catch (IOException ioe) {
            System.err.println(ioe.getMessage());
       }
      
   }


   public static void delete_select_files(String src_loc, String pattern) {
       Pattern p = Pattern.compile(pattern);

       File src_dir = new File(src_loc);

       try {

           File[] matches = src_dir.listFiles(new FilenameFilter() {
               public boolean accept(File src_dir, String fname) {
                   Matcher m = p.matcher(fname); 
                   return m.find();
               }
           });

           for(File m: matches){
               if(m.isFile()) {
                 Files.delete(m.toPath());
                 System.out.println(m.getName() + " deleting...");
               }
           }
       } catch (IOException ioe) {
            System.err.println(ioe.getMessage());
       }
      
   }


   // BULK FILE(S) MANAGEMENT
   public static void copy_bulk_files(String src_loc, String dst_loc) {
       Pattern p = Pattern.compile(".*");

       File src_dir = new File(src_loc);
       File dst_dir = new File(dst_loc);

       try {

           if (Files.notExists(dst_dir.toPath())){
               Files.createDirectory(dst_dir.toPath());
           }

           File[] matches = src_dir.listFiles(new FilenameFilter() {
               public boolean accept(File src_dir, String fname) {
                   Matcher m = p.matcher(fname); 
                   return m.find();
               }
           });

           for(File m: matches){
               if(m.isFile()) {
                 System.out.println(m.getName() + " copying...");
                 Files.copy(m.toPath(), (new File(dst_loc+'/'+m.getName()).toPath()), StandardCopyOption.REPLACE_EXISTING);
               }
           }
       } 
       catch (IOException ioe) {
            System.err.println(ioe.getMessage());
       }
      
   }

   public static void move_bulk_files(String src_loc, String dst_loc) {
       Pattern p = Pattern.compile(".*");

       File src_dir = new File(src_loc);
       File dst_dir = new File(dst_loc);

       try {

           if (Files.notExists(dst_dir.toPath())){
               Files.createDirectory(dst_dir.toPath());
           }

           File[] matches = src_dir.listFiles(new FilenameFilter() {
               public boolean accept(File src_dir, String fname) {
                   Matcher m = p.matcher(fname); 
                   return m.find();
               }
           });

           for(File m: matches){
               if(m.isFile()) {
                 Files.move(m.toPath(), (new File(dst_loc+'/'+m.getName()).toPath()), StandardCopyOption.REPLACE_EXISTING);
                 System.out.println(m.getName() + " moving...");
               }
           }
       } catch (IOException ioe) {
            System.err.println(ioe.getMessage());
       }
      
   }

   public static void delete_bulk_files(String src_loc) {
       Pattern p = Pattern.compile(".*");

       File src_dir = new File(src_loc);

       try {

           File[] matches = src_dir.listFiles(new FilenameFilter() {
               public boolean accept(File src_dir, String fname) {
                   Matcher m = p.matcher(fname); 
                   return m.find();
               }
           });

           for(File m: matches){
               if(m.isFile()) {
                 Files.delete(m.toPath());
                 System.out.println(m.getName() + " deleting...");
               }
           }
       } catch (IOException ioe) {
            System.err.println(ioe.getMessage());
       }
      
   }
}
