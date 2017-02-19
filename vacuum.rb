require 'fileutils'

#open the file with the list of filenames

File.open("sample-file-list.txt") do |name| 
  
  #loop through each line
  name.each_line do |file_name| 
    #checking for the filename
    puts "here is the file I want to look for: #{file_name}" 
    #striping the file of new lines very important for Dir.glob
    file_strip = file_name.strip  
    #appending a wildcard ending to file to match any ext
    search_file_name = file_strip << ".*"  
     #specifing the folder you want to start at the top of I chose Userss
    folder = "/Users" 
    #globbing through the files and directories - warning this could take a while - get coffee - I there is a better way please pull suggest it. Perhaps Dir.foreach? 
    
    Dir.glob("#{folder}/**/#{search_file_name}")  do |file|  
      #checking what file you are working on
     puts "now I am working on #{file}"  
  
    #add error catching bc finding multiple copies of files and then moving them to a dir causes an error
  
     begin
       while
       FileUtils.mv("#{file}", "/Users/subdir")  # moving the file from its found location to a new location.
       end
     rescue Exception
       STDERR.puts "​#{$!}​: Copy of #{search_file_name} exists in desination directory"
     end
   end
 end
end
