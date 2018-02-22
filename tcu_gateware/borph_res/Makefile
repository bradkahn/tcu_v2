BOF_FILE=tcu_v2.bof
SYM_FILE=tcu_registers.sym
# BIN_FILE=tcu_top.bin
BIN_FILE=tcu_top.bin
ISE_PROJECT_BIN_FILE=/home/brad/tcu_v2/tcu_gateware/ise/tcu_counter/$(BIN_FILE)


tcu:
	./mkbof -o $(BOF_FILE) -s $(SYM_FILE) -t 5 -v $(BIN_FILE)

fetch_bin:
	cp $(ISE_PROJECT_BIN_FILE) ./$(BIN_FILE)

send_bof:
	chmod +x $(BOF_FILE)
	cp $(BOF_FILE) /opt/rhinofs/root
