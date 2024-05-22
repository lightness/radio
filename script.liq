#!/usr/bin/liquidsoap -v

set("decoder.file_decoders",["META","MAD","OGG"])
set("decoder.file_extensions.mad",["mp3","mp2","mp1"])
set("decoder.file_extensions.ogg",["ogv","oga","ogx","ogg","opus"])
set("decoder.mime_types.ogg",["application/ogg","application/x-ogg","audio/x-ogg","audio/ogg","video/ogg"])
set("decoder.mime_types.mp3",["audio/mpeg","audio/MPA"])

set("log.file.path","/var/log/liquidsoap/basic.log")
set("log.stdout",true)
set("log.level",4)


# recipe = single("/music/song.mp3")
# output(recipe)

default = single("/music/song.mp3")

# output(default)

output.icecast(
  %mp3(bitrate=128, samplerate=44100, stereo=true),
  mount="autodj",
  encoding="ISO-8859-1",
  default,
  host="icecast2.my", port=8000, password="pwd",
  genre="other",
  name="My radio",
  fallible=true,
  icy_metadata="true",
  public=true,
  url="http://icecast2.my:8000/autodj",
  description="BestRadio"
)

