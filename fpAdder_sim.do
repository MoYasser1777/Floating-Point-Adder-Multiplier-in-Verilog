add wave -position insertpoint  \
sim:/registeredFPA/clk \
sim:/registeredFPA/reset \
sim:/registeredFPA/enable \
sim:/registeredFPA/A \
sim:/registeredFPA/B \
sim:/registeredFPA/result \
sim:/registeredFPA/overFlow \
sim:/registeredFPA/A_reg \
sim:/registeredFPA/B_reg \
sim:/registeredFPA/Sum_reg \
sim:/registeredFPA/overFlow_reg \
sim:/registeredFPA/MA \
sim:/registeredFPA/MB \
sim:/registeredFPA/MR \
sim:/registeredFPA/ER \
sim:/registeredFPA/SR \
sim:/registeredFPA/IBA \
sim:/registeredFPA/IBB \
sim:/registeredFPA/MSB \
sim:/registeredFPA/i
force -freeze sim:/registeredFPA/clk 1 0, 0 {5 ps} -r 10
force -freeze sim:/registeredFPA/reset 0 0
force -freeze sim:/registeredFPA/enable 1 0
force -freeze sim:/registeredFPA/A 00111111110000000000000000000000 0
force -freeze sim:/registeredFPA/B 11000000101100000000000000000000 0
run
force -freeze sim:/registeredFPA/A 01111111100000000000000000000000 0
force -freeze sim:/registeredFPA/B 00111111100000000000000000000000 0
run
force -freeze sim:/registeredFPA/A 00111111101000000000000000000000 0
force -freeze sim:/registeredFPA/B 01000000001000000000000000000000 0
run