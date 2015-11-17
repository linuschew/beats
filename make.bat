REM Batch script to build and test on Windows. You can use this in conjunction
REM with the Vagrant machine.
REM 
REM If running inside of Vagrant do this first:
REM mkdir C:\Gopath\src\github.com\elastic
REM mklink /d C:\Gopath\src\github.com\elastic\winlogbeat \\vboxsvr\vagrant

REM This is already done inside the Vagrant box.
REM set PATH=%PATH%;%GOPATH%\bin

go get github.com/tools/godep
godep go build
godep go test ./...
godep go test -race -c -cover -covermode=atomic -coverpkg ./...
