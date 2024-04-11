require "log"
require "./opus/encoder"

module Opus
  VERSION = "0.1.0"
end

# sample_rate = 48_000
# channels = 2

# encoder = Opus::Encoder.new(sample_rate, 960, channels)

# input = File.open("/Users/krthr/Projects/discord-music/output.mp3", "r")
# output = File.open("output.opus", "w")

# audio_data = IO::Memory.new

# process = Process.run("ffmpeg", ["-i", "pipe:0",
#                                  "-loglevel", "0",
#                                  "-f", "s16le",
#                                  "-c:a", "pcm_s16le",
#                                  "-ar", sample_rate.to_s,
#                                  "-ac", channels.to_s,
#                                  "pipe:1",
# ], shell: true, input: input, output: audio_data, error: STDOUT)

# audio_data.rewind

# Log.info { "Audio data size in bytes: #{audio_data.size}" }
# Log.info { "Encoder input length: #{encoder.input_length}" }

# buffer = Bytes.new(encoder.input_length, 0)

# while real_length = audio_data.read(buffer)
#   break if real_length.zero?
#   opus_encoded_data = encoder.encode(buffer)
#   output.write_bytes(opus_encoded_data.size.to_i16, IO::ByteFormat::LittleEndian)
#   output.write(opus_encoded_data)
# end
