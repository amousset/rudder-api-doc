API:=public relay
build: $(API)

# Rebuild everything at each call as it is fast enough
$(API):
	mkdir -p build
	# Needed for "openapi bundle" to work
	rm -rf build/$@
	# Build a single yaml file from sources
	openapi bundle src/$@/openapi.yml --output build/$@/openapi.yml
	# Build doc from yaml file (with pre-rendered html)
	redoc-cli bundle --output build/$@/index.html build/$@/openapi.yml \
		--disableGoogleFont \
		--options.theme.colors.primary.main="#f08004" \
		--options.expandResponses="200," \
		--options.pathInMiddlePanel=1 \
		--options.hideHostname=1
	# Copy common assets
	cp -r src/assets build/$@/
	# Copy specific assets if any
	if [ -d src/$@/assets ]; then cp -r src/$@/assets/. build/$@/assets; fi

optipng:
	find src -name "*.png" -exec optipng {} \;

clean:
	rm -rf build
