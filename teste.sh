#!/bin/bash

# Defina o prefixo do bloco de IP de 24 bits (por exemplo, 192.168.1.)
prefixo="192.168.1."

# Defina o arquivo de saída onde serão gravados os IPs que responderam "is alive"
arquivo_saida="ips_vivos.txt"

# Especifica o diretório onde o arquivo de saída será criado
diretorio_saida=".\"

# Loop através dos IPs no bloco de 24 bits e use o comando fping para verificar a resposta
for i in {1..254}; do
    ip="${prefixo}${i}"
    resultado=$(fping -q -c 1 -r 0 $ip 2>&1)

    # Verifique se o IP respondeu com sucesso (resposta "is alive")
    if echo "$resultado" | grep -q "is alive"; then
        echo "$ip está vivo."
        echo "$ip" >> "$diretorio_saida$arquivo_saida"
    fi
done