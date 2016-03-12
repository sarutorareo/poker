names = %w(Jiro Saburo Hana Hiyoten)

0.upto(3) do |idx|
  User.create(
    name: names{idx},
    chip: 1000
    administrator: (idx == 0)
  )
end
