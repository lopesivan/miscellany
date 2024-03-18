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

	cat <<EOF >.vars
GRADLE_HOME=/opt/gradle/gradle-8.2.1/bin
EOF

	eval "$(jenv vars)"
	export PATH=$GRADLE_HOME:$PATH
	gradle init --type kotlin-application

	cat <<EOF >Makefile
run:
    ./gradlew \$@
jar:
    ./gradlew \$@
clean:
    ./gradlew \$@

EOF

fi
