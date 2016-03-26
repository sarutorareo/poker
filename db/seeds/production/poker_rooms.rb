
0.upto(9) do |idx|
  PokerRoom.create(
    no: idx+1,
    # max_user: default,
    # pass: default
  )
end
