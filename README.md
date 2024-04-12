# Opus



## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     opus:
       github: krthr/opus
   ```

2. Run `shards install`

## Usage

```crystal
require "opus"

sample_rate = 48_000
frame_size = 960
channels = 2

encoder = Opus::Encoder.new(sample_rate, frame_size, channels)

buffer = Bytes.new(encoder.input_length, 0)

while real_length = audio_data.read(buffer)
  break if real_length.zero?
  opus_encoded_data = encoder.encode(buffer)
  # Use the encoded data
end
```

## Contributing

1. Fork it (<https://github.com/krthr/opus/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Wilson](https://github.com/krthr) - creator and maintainer
