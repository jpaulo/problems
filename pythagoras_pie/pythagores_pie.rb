PIECE_SIZES = []

def calculate(n)
  return PIECE_SIZES[n] if PIECE_SIZES[n]

  if n == 0
    PIECE_SIZES[0] = 0
    return PIECE_SIZES[n]
  end

  PIECE_SIZES[n] = (0.01 * n) * (1 - ((0..(n - 1)).inject(0){ |sum, i| sum + calculate(i) }))
  PIECE_SIZES[n]
end

piece_size1 = 0
piece_size2 = 0

for i in 1..100
  piece_size1 = calculate(i)

  if piece_size1 > piece_size2
    piece_size2 = piece_size1
    next
  end

  break
end

puts "GUEST NUMBER #{i - 1} GETS THE BIGGEST PIECE OF PIE"

