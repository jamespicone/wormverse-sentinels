transform := saxonb-xslt
ifeq ($(OS),Windows_NT)
	transform := Transform
endif

delete := rm -f
ifeq ($(OS),Windows_NT)
	delete := del /f
endif

mkdir := mkdir -p
ifeq ($(OS),Windows_NT)
	mkdir := mkdir
endif

copy := cp
ifeq ($(OS),Windows_NT)
	copy := copy
endif