
folder_path = 'F:\Musicas_NEW\mp3_anderson'
folder_path = folder_path.gsub(/\\/, '/')
Dir.glob(folder_path + '/*').sort.each do |music|
    if !File.directory? music
      filename = File.basename(music, File.extname(music))
      filename = filename.gsub(/_/, '')
      filename = filename.gsub(/-/, ' - ')   
      filename = filename.split.map(&:capitalize).join(' ')
      File.rename(music, folder_path+'/' + filename + File.extname(music))      
    end
end

