vsim  singleModuleFPM

add wave -radix hex singleModuleFPM/*
add wave -radix bin singleModuleFPM/clk
force singleModuleFPM/reset 0 
force -freeze sim:/singleModuleFPM/clk 0 0, 1 {50 ps} -r 100
force -freeze sim:/singleModuleFPM/enable 1 0
# A = 5.325
force singleModuleFPM/A 32'h40aa6666
# B = 5.325
force singleModuleFPM/B 32'h40aa6666
run 300 ps

# A = -2.125
force singleModuleFPM/A				32'hc0080000
# B = -3.625
force singleModuleFPM/B				32'hc0680000
run 300 ps

# A = -0.625
force singleModuleFPM/A				32'hbf200000
# B = 1.625
force singleModuleFPM/B				32'h3fd00000
run 300 ps

# A = 5.25
force singleModuleFPM/A				32'h40a80000
# B = -3.0625
force singleModuleFPM/B				32'hc0440000
run 300 ps

# A = 0.0
force singleModuleFPM/A				32'h00000000
# B = 5.25
force singleModuleFPM/B				32'h40a80000
run 300 ps

# A = 0.0
force singleModuleFPM/A				32'h00000000
# B = -3.125
force singleModuleFPM/B				32'hc0480000
run 300 ps

# A = 1.0
force singleModuleFPM/A				32'h3f800000
# B = 3.125
force singleModuleFPM/B				32'h40480000
run 300 ps

# A = 1.0
force singleModuleFPM/A				32'h3f800000
# B = -3.125
force singleModuleFPM/B				32'hc0480000
run 300 ps

# A = 0.0
force singleModuleFPM/A				32'h00000000
# B = 0.0
force singleModuleFPM/B				32'h00000000
run 300 ps

# A = high exponent number
force singleModuleFPM/A				32'h7f000000
# B = high exponent number
force singleModuleFPM/B				32'h7f000000
run 300 ps