module Opus
  @[Link("opus")]
  lib LibOpus
    enum Code : LibC::Int
      OK               =  0
      BAD_ARG          = -1
      BUFFER_TOO_SMALL = -2
      INTERNAL_ERROR   = -3
      INVALID_PACKET   = -4
      UNIMPLEMENTED    = -5
      INVALID_STATE    = -6
      ALLOC_FAIL       = -7
    end

    enum Application : LibC::Int
      VOIP                = 2048
      AUDIO               = 2049
      RESTRICTED_LOWDELAY = 2051
    end

    enum CTL : LibC::Int
      SET_BITRATE = 4002
      SET_VBR     = 4006
      RESET_STATE = 4028
    end

    type Encoder = Void

    fun opus_encoder_get_size(channels : LibC::Int) : LibC::Int
    fun opus_encoder_create(sample_rate : LibC::Int, channels : LibC::Int, application : Application, error : Code*) : Encoder*
    fun opus_encoder_init(st : Encoder*, sample_rate : LibC::Int, channels : LibC::Int, application : Application) : LibC::Int
    fun opus_encode(st : Encoder*, pcm : Int16*, frame_size : LibC::Int, data : UInt8*, max_data_bytes : LibC::Int) : LibC::Int
    fun opus_encode_float(st : Encoder*, pcm : LibC::Float*, frame_size : LibC::Int, data : UInt8*, max_data_bytes : LibC::Int) : LibC::Int
    fun opus_encoder_destroy(st : Encoder*) : Void
    fun opus_encoder_ctl(st : Encoder*, request : CTL, ...) : LibC::Int
  end
end
