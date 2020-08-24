.PHONY: format
format:
	black --check --diff --line-length=120 src tests

.PHONY: lint 
lint:
	pydocstyle src tests
	flake8 src tests
	mypy src tests
	pylint --rcfile=.pylintrc src tests

.PHONY: notebook
notebook:
	cd notebooks && PYTHONPATH=../src jupyter notebook

all-tests:
	PYTHONPATH=./src -v pytest

unit-tests:
	PYTHONPATH=./src pytest -v -m "not integration_test"

int-tests:
	PYTHONPATH=./src pytest -v -m integration_test
