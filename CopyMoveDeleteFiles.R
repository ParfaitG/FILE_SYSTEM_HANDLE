
args <- commandArgs(trailingOnly = TRUE)

runhelp <- function() {
  msg <- c("",
               "DEFINED FUNCTIONS AND PARAMS (-fn <params>):",
               "",    
               "-cs: copy_select_files(source_location, destination_location, pattern)",
               "-ms: move_select_files(source_location, destination_location, pattern)",
               "-ds: delete_select_files(source_location, pattern)",
               "",
               "-cb: copy_bulk_files(source_location, destination_location)",
               "-mb: move_bulk_files(source_location, destination_location)",
               "-db: delete_bulk_files(source_location);",
               "")
  
  output <- lapply(msg, function(line) cat(paste(line, "\n")))
}

# SELECT FILE(S) MANAGEMENT
copy_select_files <- function(src_loc, dst_loc, str_pattern) {
    if (!dir.exists(dst_loc)){
      dir.create(dst_loc)
    }
    
    src_files <- list.files(path=src_loc, pattern=str_pattern, full.names=TRUE)
    
    output <- file.copy(src_files, dst_loc, overwrite=TRUE)
    output <- lapply(src_files, function(f) cat(paste(basename(f), "copying ...\n")))
}

move_select_files <- function(src_loc, dst_loc, str_pattern) {
  if (!dir.exists(dst_loc)){
    dir.create(dst_loc)
  }
  
  src_files <- list.files(path=src_loc, pattern=str_pattern, full.names=TRUE)
  dst_files <- gsub(src_loc, dst_loc, src_files)
  
  output <- file.rename(src_files, dst_files)
  output <- lapply(src_files, function(f) cat(paste(basename(f), "moving ...\n")))
}


delete_select_files <- function(src_loc, str_pattern) {
  src_files <- list.files(path=src_loc, pattern=str_pattern, full.names=TRUE)
  
  output <- file.remove(src_files)
  output <- lapply(src_files, function(f) cat(paste(basename(f), "deleting ...\n")))
}


# BULK FILES MANAGEMENT
copy_bulk_files <- function(src_loc, dst_loc) {
  if (!dir.exists(dst_loc)){
    dir.create(dst_loc)
  }
    
  src_files <- list.files(path=src_loc, pattern="*", full.names=TRUE)
    
  output <- file.copy(src_files, dst_loc, overwrite=TRUE)
  output <- lapply(src_files, function(f) cat(paste(basename(f), "copying ...\n")))
}

move_bulk_files <- function(src_loc, dst_loc) {
  if (!dir.exists(dst_loc)){
    dir.create(dst_loc)
  }
    
  src_files <- list.files(path=src_loc, pattern="*", full.names=TRUE)
  dst_files <- gsub(src_loc, dst_loc, src_files)
    
  output <- file.rename(src_files, dst_files)
  output <- lapply(src_files, function(f) cat(paste(basename(f), "moving ...\n")))
}

delete_bulk_files <- function(src_loc) {
  src_files <- list.files(path=src_loc, pattern="*", full.names=TRUE)
  
  output <- file.remove(src_files)
  output <- lapply(src_files, function(f) cat(paste(basename(f), "deleting ...\n")))
}


switch(args[1],
  `-h` =  runhelp(),
  `-help` = runhelp(),
  `-cs` = copy_select_files(args[2], args[3], args[4]),
  `-ms` = move_select_files(args[2], args[3], args[4]),
  `-ds` = delete_select_files(args[2], args[3]),
  `-cb` = copy_bulk_files(args[2], args[3]),
  `-mb` = move_bulk_files(args[2], args[3]),
  `-db` = delete_bulk_files(args[2]),
  cat("No such command. Please try again or see -[h]elp.\n")
)
