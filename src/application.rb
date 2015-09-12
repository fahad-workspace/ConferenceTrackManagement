require '../src/input_reader'
require '../src/session_generator'

InputReader.new.read_file '../data/input.txt'

SessionGenerator.new.generate_session