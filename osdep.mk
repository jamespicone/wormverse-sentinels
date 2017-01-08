transform := saxonb-xslt
ifeq ($(OS),Windows_NT)
	transform := Transform
endif

copy := cp
ifeq ($(OS),Windows_NT)
	copy := xcopy
endif

package_folder := ../Cards/$(folder)/

ifeq ($(OS),Windows_NT)
   mkdir = mkdir $(subst /,\,$(1)) > nul 2>&1 || (exit 0)
   rm = $(wordlist 2,65535,$(foreach FILE,$(subst /,\,$(1)),& del $(FILE) > nul 2>&1)) || (exit 0)
   rmdir = rmdir $(subst /,\,$(1)) > nul 2>&1 || (exit 0)
   echo = echo $(1)
   copy = robocopy . $(2) $(1) > nul || (exit 0)
else
   mkdir = mkdir -p $(1)
   rm = rm $(1) > /dev/null 2>&1 || true
   rmdir = rmdir $(1) > /dev/null 2>&1 || true
   echo = echo "$(1)"
   copy = cp $(1) $(2)
endif