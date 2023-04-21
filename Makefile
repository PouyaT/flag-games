PWD = $(CURDIR)
requirements:
	pip freeze > "$(PWD)\requirements.txt"