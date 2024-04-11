require "./opus_lib"

module Opus
  class Encoder
    @vbr_rate : Int32?
    @bitrate : Int32?

    def initialize(@sample_rate : Int32, @frame_size : Int32, @channels : Int32)
      error = LibOpus::Code::OK
      @encoder = LibOpus.opus_encoder_create(@sample_rate, @channels, LibOpus::Application::AUDIO, pointerof(error))

      raise "Failed to create Opus encoder. Error code: #{error}" if error != LibOpus::Code::OK
    end

    def destroy : Void
      LibOpus.opus_encoder_destroy(@encoder)
    end

    def reset : Nil
      LibOpus.encoder_ctl(@encoder, LibOpus::CTL::RESET_STATE)
    end

    def vbr_rate=(value : Int32) : Int32
      @vbr_rate = value
      Opus.encoder_ctl(@encoder, LibOpus::CTL::SET_VBR, @vbr_rate)
      @vbr_rate
    end

    def bitrate=(value : Int32) : Int32
      @bitrate = value
      Opus.encoder_ctl(@encoder, LibOpus::CTL::SET_BITRATE, @bitrate)
      @bitrate
    end

    def input_length : Int32
      @frame_size * @channels * sizeof(Int16) # Opus require audio data as s16le
    end

    def encode(data : Bytes) : Bytes
      raise "Unexpected slice size! (Expected #{input_length}, got #{data.bytesize} bytes)" if data.bytesize != input_length

      buffer = Bytes.new(input_length)
      out_length = LibOpus.opus_encode(@encoder, data.to_unsafe.as(Int16*), @frame_size, buffer, buffer.size)
      buffer[0...out_length]
    end
  end
end
