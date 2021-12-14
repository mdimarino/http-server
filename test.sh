#!/bin/bash

PID=0

pgrep http-server > /dev/null
if [ ${?} -eq 0 ]; then
    echo "O executável já está rodando"
    exit 7
fi

if [ -x bin/http-server ]; then
    bin/http-server &
    PID=${!}
else
    echo "Executável bin/http-server não existe"
    exit 6
fi

pgrep http-server > /dev/null
if [ ${?} -eq 1 ]; then
    echo "O executável não está rodando"
    exit 5
fi

curl -s http://localhost:8080/ > /dev/null
if [ ${?} -eq 7 ]; then
    echo "O executável não respondende a chamadas a /"
    exit 4
fi

curl -s http://localhost:8080/hello > /dev/null
if [ ${?} -eq 7 ]; then
    echo "O executável não respondende a chamadas a /hello"
    exit 3
fi

curl -s http://localhost:8080/headers > /dev/null
if [ ${?} -eq 7 ]; then
    echo "O executável não respondende a chamadas a /headers"
    exit 2
fi

echo "Testes com finalizados com sucesso"
pkill http-server
