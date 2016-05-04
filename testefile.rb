
#folder_path = 'F:\Musicas_NEW\mp3_anderson'
folder_path = '/Users/cesarfilho/Music'

#CleanPathMusic(folder_path) 

def CleanPathMusic(path)
  path = path.gsub(/\\/, '/')
  Dir.glob(path + '/*').sort.each do |music|
      if File.directory? music
        CleanPathMusic(music)
      elsif
        filename = File.basename(music, File.extname(music))
        filename = filename.gsub(/_/, '').gsub(/-/, ' - ')   
        filename = filename.split.map(&:capitalize).join(' ')
        #if File.extname(music).uppercase == 'MP3'
          puts filename
        #File.rename(music, folder_path+'/' + filename + File.extname(music))  
        #end    
      end
  end
end

CleanPathMusic(folder_path)