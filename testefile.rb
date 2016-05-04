
require 'os'

#Parametro do diretório a ser formatado
folder_path = ARGV[0]

def CleanPathMusic(path)

  if OS.windows?
    path = path.gsub(/\\/, '/')
  end

  Dir.glob(path + '/*').sort.each do |music|
      if File.directory? music
        CleanPathMusic(music)
      elsif
        filename = File.basename(music, File.extname(music))
        filename = filename.gsub(/_/, '').gsub(/-/, ' - ')
        filename = filename.split.map(&:capitalize).join(' ')

        puts filename
      end
  end
end

CleanPathMusic(folder_path)
