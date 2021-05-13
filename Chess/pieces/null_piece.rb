require_relative "Piece"
require "singleton"

class NullPiece < Piece
    include Singleton
    # singleton is one instance
    # the usefulness is to use this multiple times
end