build:
	go build -o bin/gitfat .

compile:
	GOOS=darwin GOARCH=amd64 go build -o bin/gitfat-darwin-amd64 .
	GOOS=darwin GOARCH=arm64 go build -o bin/gitfat-darwin-arm64 .
	GOOS=linux GOARCH=amd64 go build -o bin/gitfat-linux-amd64 .
	GOOS=windows GOARCH=amd64 go build -o bin/gitfat-windows-amd64.exe .

	tar czf bin/gitfat-darwin-amd64.tar.gz bin/gitfat-darwin-amd64
	tar czf bin/gitfat-darwin-arm64.tar.gz bin/gitfat-darwin-arm64
	tar czf bin/gitfat-linux-amd64.tar.gz bin/gitfat-linux-amd64
	tar czf bin/gitfat-windows-amd64.exe.tar.gz bin/gitfat-windows-amd64.exe

	sha256sum bin/gitfat-darwin-amd64.tar.gz > bin/gitfat-darwin-amd64.tar.gz.sha256
	sha256sum bin/gitfat-darwin-arm64.tar.gz > bin/gitfat-darwin-arm64.tar.gz.sha256
	sha256sum bin/gitfat-linux-amd64.tar.gz > bin/gitfat-linux-amd64.tar.gz.sha256
	sha256sum bin/gitfat-windows-amd64.exe.tar.gz > bin/gitfat-windows-amd64.exe.tar.gz.sha256
