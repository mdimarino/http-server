APP="http-server"

## build: construindo a aplicação
build:
	@echo "Construindo a aplicação"
	@go build -o bin/${APP} src/main.go

## run: roda a aplicação src/main.go
run:
	@echo "Roda a aplicação"
	@go run src/main.go

## clean: remove o binário
clean:
	@echo "Remove o binário"
	@rm -rf bin/

## test: testa o binário
test: build
	@echo "Testa o binário"
	@./test.sh

## help: exibe esta mensagem de ajuda
help:
	@echo "Uso: \n"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'
