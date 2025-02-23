#!/bin/bash

# server-stats.sh
# Script para coletar estatísticas básicas de desempenho do servidor.
# Este script fornece informações sobre o uso da CPU, memória, disco,
# processos em execução, versão do sistema operacional, tempo de atividade,
# média de carga, usuários conectados e tentativas de login com falha.
#
# Para executar o script, use:
#   sudo ./scripts/server-stats.sh
# É necessário executar como superusuário para acessar as tentativas de login com falha.

# Função para exibir uma mensagem de cabeçalho
function header {
    echo "========================================"
    echo "$1"
    echo "========================================"
}

# Uso total da CPU
header "Uso Total da CPU"
mpstat | awk 'NR==4 {printf "Uso: %.2f%%\n", 100 - $12}'

# Uso total de memória
header "Uso Total de Memória"
free -m | awk 'NR==2 {printf "Usada: %dMi, Livre: %dMi, Total: %dMi, Porcentagem: %.2f%%\n", $3, $4, $2, ($3/$2)*100}'

# Uso total do disco
header "Uso Total do Disco"
df -h | awk '$NF=="/"{printf "Usado: %s, Livre: %s, Total: %s, Porcentagem: %s\n", $3, $4, $2, $5}'

# 5 principais processos por uso de CPU
header "5 Principais Processos por Uso de CPU"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

# 5 principais processos por uso de memória
header "5 Principais Processos por Uso de Memória"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

# Versão do sistema operacional
header "Versão do Sistema Operacional"
lsb_release -a 2>/dev/null || cat /etc/*release

# Tempo de atividade
header "Tempo de Atividade"
uptime

# Média de carga
header "Média de Carga"
uptime | awk -F'load average:' '{ print $2 }'

# Usuários conectados
header "Usuários Conectados"
who

# Tentativas de login com falha
header "Tentativas de Login com Falha"
if [ -r /var/log/btmp ]; then
    lastb | head -n 10
else
    echo "Não foi possível acessar /var/log/btmp. Execute o script como superusuário para ver as tentativas de login com falha."
fi

echo "========================================"
echo "Coleta de estatísticas concluída."
