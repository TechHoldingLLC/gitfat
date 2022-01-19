build:
	go build -o bin/gitfat .

compile:
	GOOS=darwin GOARCH=amd64 go build -o bin/gitfat-darwin-amd64 .
	GOOS=darwin GOARCH=arm64 go build -o bin/gitfat-darwin-arm64 .
	GOOS=linux GOARCH=amd64 go build -o bin/gitfat-linux-amd64 .
	GOOS=linux GOARCH=arm64 go build -o bin/gitfat-linux-arm64 .

	tar czf bin/gitfat-darwin-amd64.tar.gz bin/gitfat-darwin-amd64
	tar czf bin/gitfat-darwin-arm64.tar.gz bin/gitfat-darwin-arm64
	tar czf bin/gitfat-linux-amd64.tar.gz bin/gitfat-linux-amd64
	tar czf bin/gitfat-linux-arm64.tar.gz bin/gitfat-linux-arm64

	sha256sum bin/gitfat-darwin-amd64.tar.gz > bin/gitfat-darwin-amd64.tar.gz.sha256
	sha256sum bin/gitfat-darwin-arm64.tar.gz > bin/gitfat-darwin-arm64.tar.gz.sha256
	sha256sum bin/gitfat-linux-amd64.tar.gz > bin/gitfat-linux-amd64.tar.gz.sha256
	sha256sum bin/gitfat-linux-arm64.tar.gz > bin/gitfat-linux-arm64.tar.gz.sha256
