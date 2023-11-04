TARGETS = backup cbackup vmf mbxbackup
LBINDIR = /usr/local/bin

install: $(TARGETS)
	@for n in $(TARGETS);\
	do \
	diff -q $$n $(LBINDIR)/$$n > /dev/null;\
	if [ "$$?" != "0"	];then \
	   echo sudo install -m 755 -t $(LBINDIR) $$n;\
	   sudo install -m 755 -t $(LBINDIR) $$n;\
	fi;\
	done

# Code below is from template!
usage:
	@echo "please use"
	@echo "  make fritz"
	@echo "  or"
	@echo "  make tools"

fritz: $(FBTARGETS)
	install -m 755 -t $(LBINDIR) $(FBTARGETS)

tools: $(TOOLTARGETS)
	install -m 755 -t $(LBINDIR) $(TOOLTARGETS)
