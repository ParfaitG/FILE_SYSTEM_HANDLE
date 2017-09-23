import sys
import os, shutil
import re


def runhelp():
    info = """
    DEFINED FUNCTIONS AND PARAMS (-fn <params>):
    
      -cs: copy_select_files(source_location, destination_location, pattern)
      -ms: move_select_files(source_location, destination_location, pattern)
      -ds: delete_select_files(source_location, pattern)

      -cb: copy_bulk_files(source_location, destination_location)
      -mb: move_bulk_files(source_location, destination_location)
      -db: delete_bulk_files(source_location);
    """
    
    print(info)
    
    
# SELECT FILE(S) MANAGEMENT
def copy_select_files(src_loc, dst_loc, pattern):
    
    if not os.path.exists(dst_loc):
        os.mkdir(dst_loc)
        
    for curr_file in os.listdir(src_loc):
        if re.match(pattern, curr_file):            
            print(curr_file + " copied...")
            shutil.copyfile(os.path.join(src_loc, curr_file), os.path.join(dst_loc, curr_file))
        
    return None


def move_select_files(src_loc, dst_loc, pattern):

    if not os.path.exists(dst_loc):
        os.mkdir(dst_loc)        

    for curr_file in os.listdir(src_loc):
        if re.match(pattern, curr_file): 
            print(curr_file + " moved...")
            shutil.move(os.path.join(src_loc, curr_file), os.path.join(dst_loc, curr_file))

    return None


def delete_select_files(src_loc, pattern):

    for curr_file in os.listdir(src_loc):
        if re.match(pattern, curr_file):
            print(curr_file + " deleted...")
            os.remove(os.path.join(src_loc, curr_file))
            
    return None



# BULK FILE  MANAGEMENT
def copy_bulk_files(src_loc, dst_loc):
    
    if not os.path.exists(dst_loc):
        os.mkdir(dst_loc)
        
    for curr_file in os.listdir(src_loc):
        print(curr_file + " deleted...")
        shutil.copyfile(os.path.join(src_loc, curr_file), os.path.join(dst_loc, curr_file))
        
    return None


def move_bulk_files(src_loc, dst_loc):
    
    if not os.path.exists(dst_loc):
        os.mkdir(dst_loc)
        
    for curr_file in os.listdir(src_loc):
        print(curr_file + " deleted...")
        shutil.move(os.path.join(src_loc, curr_file), os.path.join(dst_loc, curr_file))

    return None


def delete_bulk_files(src_loc):

    for curr_file in os.listdir(src_loc):
        print(curr_file + " deleted...")
        os.remove(os.path.join(src_loc, curr_file))

    return None


# SYSTEM CALLS
if sys.argv[1] == "-h" or sys.argv[1] == "-help": 
    runhelp()
elif sys.argv[1] == "-cs": 
    copy_select_files(sys.argv[2], sys.argv[3], sys.argv[4])
elif sys.argv[1]  == "-ms": 
    move_select_files(sys.argv[2], sys.argv[3], sys.argv[4])
elif sys.argv[1]  == "-ds": 
    delete_select_files(sys.argv[2], sys.argv[3])    
elif sys.argv[1]  == "-cb": 
    copy_bulk_files(sys.argv[2], sys.argv[3])
elif sys.argv[1]  == "-mb": 
    move_bulk_files(sys.argv[2], sys.argv[3])
elif sys.argv[1]  == "-db": 
    delete_bulk_files(sys.argv[2])
else: print("Unable to run command. Please try again or see -[h]elp for more info.")
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
