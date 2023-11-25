#!/usr/bin/env bash

[ $1 ] && {
	filetype=1
} || {
	echo 1>&2 Sintaxe: "$0" in out
	exit 1
}
# ----------------------------------------------------------------------------
# cpp
if [[ "$1" == "cpp" ]]; then
	cat <<EOF
#include <iostream>

int main() {
    std::cout << "Hello World!";
    return 0;
}
EOF
fi
# ----------------------------------------------------------------------------
# c
if [[ "$1" == "c" ]]; then
	cat <<EOF
#include <stdio.h>

int main(void) {
   printf("Hello, World!");
   return 0;
}
EOF
fi
# ----------------------------------------------------------------------------
# java
if [[ "$1" == "java" ]]; then
	cat <<EOF
public class HelloWorld {
    public static void main(String[] args)
    {
        System.out.print('Hello, World!');
    }
}
EOF
fi
# ----------------------------------------------------------------------------
# go
if [[ "$1" == "go" ]]; then
	cat <<EOF
package main

import "fmt"

func main() {
    fmt.Println("Hello, World!")
}
EOF
fi
