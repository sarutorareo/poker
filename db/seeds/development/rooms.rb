
0.upto(9) do |idx|
  Room.create(
    no: idx+1,
    # max_user: default,
    # pass: default
  )
end
