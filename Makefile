.PHONY: bs
bs:
	chmod +x scripts/deps.sh
	sh ./scripts/deps.sh

# test and coverage 
.PHONY: test
test:
	chmod +x scripts/test.sh
	sh ./scripts/test.sh