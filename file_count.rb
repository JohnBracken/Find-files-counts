#Script to count the number of different types of files from my home
#directory recursively.

#Change directory to home
Dir.chdir("/home/username")

#List of file extensions to search
file_extensions = ["csv", "pdf", "jpg", "theme", "odt", "png", 
"rb", "py", "md", "txt", "xlsx", "R", "sas", "json",
"xml", "sql", "js"]

#Open file to write summary of file counts for each extension type.
f = File.open(File.expand_path('/home/usename/Documents/ruby/file_count/File_type_count_summary.md'), 'w')
    f.puts "# Summary of Number of files of Specific Extension From Home Directory\n\n"

    #Get list of files for each extension type and put count of them in a summary markdown file.
    #Include the search into hidden files. 
    file_extensions.each do |extension|
    
        subset_files = Dir["**/" + "*." + extension]
        hidden_files = Dir["/home/username/\.[a-z]*/**/" + "*." + extension]
        subset_files = subset_files.concat(hidden_files)
        f.puts "* Number of " + "." +  extension + " files found: " + subset_files.length.to_s + "\n" 
    end

f.close
