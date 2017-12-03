BOF_FILE=tcu_v2.bof
SYM_FILE=tcu_registers.sym
BIN_FILE=tcu_top.bin
ISE_PROJECT_BIN_FILE=~/NeXtRAD-TCU-Controller/$(BIN_FILE)


tcu:
	./mkbof -o $(BOF_FILE) -s $(SYM_FILE) -t 5 -v $(BIN_FILE)

fetch_bin:
	cp $(ISE_PROJECT_BIN_FILE) ./$(BIN_FILE)
