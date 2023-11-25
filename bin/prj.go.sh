#!/usr/bin/env bash

# Descrição: Cria Projeto kotlin
#
# Solicita ao usuário que insira o nome do arquivo
echo "Por favor, insira o nome do projeto:"

# Lê a entrada do usuário e a armazena na variável 'filename'
read -r filename

# Mostra o nome do arquivo inserido
echo "Você inseriu o nome do arquivo: $filename"

if test ! -d "$filename"; then
	mkdir "${filename}"
	cd "${filename}" || exit

	go mod init mymodulo

	cat >main.go <<EOF
package main

import "fmt"

func main() {
	fmt.Println("Olá, mundo!")
}
EOF

fi

exit 0
