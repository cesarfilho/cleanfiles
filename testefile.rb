require "mp3info"
require 'os'

class ClearFiles


  def pathtoOSnow(path)
    if OS.windows?
      path = path.gsub(/\\/, '/')
    end
    return path
  end

  def CleanPathMusic(path)

    path = pathtoOSnow(path)

    Dir.glob(path + '/*').sort.each do |file|
      if File.directory? file
        CleanPathMusic(file)
      elsif
        puts CleanFileName(file) + "@@@@ #{ShowMp3Tags(file)} "
      end
    end
  end

  def CleanFileName(file)
    exit if File.extname(file).upcase != '.MP3'

    filename = File.basename(file, File.extname(file))
    filename = filename.gsub(/_/, '').gsub(/-/, ' - ').gsub(/[ˆ0-9!@#$%ˆ&*-]/, ' ')
    filename = filename.split.map(&:capitalize).join(' ')
    return filename
  end

  def ShowMp3Tags(file)
    Mp3Info.open(file) do |mp3|
      return  "Song: #{mp3.tag.title}--#{mp3.tag.artist} "
      #puts mp3.tag.album
      #puts mp3.tag.tracknum
    end
  end
end

ClearFiles.new.CleanPathMusic(ARGV[0])
