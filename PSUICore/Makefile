bin_path := ./scripts/bin
doc_path := ./../docs
my_framework_name := PSUICore

all: build clean lint

build:
	@echo "Building the project..."
	swift build

test:
	@echo "Running tests..."
	swift test

clean:
	@echo "Cleaning the project..."
	swift package clean
	rm -rf .build/

lint:
	@echo "Linting the code..."
	$(bin_path)/swiftlint --format --quiet --config ./../.swiftlint.yml

doc:
	@echo "Generating documentation..."
	swift package --allow-writing-to-directory $(doc_path) \
    generate-documentation --target $(my_framework_name) \
    --disable-indexing \
    --transform-for-static-hosting \
    --hosting-base-path $(my_framework_name) \
    --output-path $(doc_path)