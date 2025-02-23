# Server Stats

## Descrição
O `server-stats.sh` é um script desenvolvido para coletar e exibir estatísticas de desempenho do servidor, fornecendo informações essenciais sobre o uso de recursos do sistema.

## Funcionalidades
O script coleta e exibe os seguintes dados:

- **Uso Total da CPU:** Porcentagem de uso da CPU.
- **Uso Total de Memória:** Memória usada, livre, total e porcentagem de uso.
- **Uso Total do Disco:** Espaço usado, livre, total e porcentagem de uso do disco.
- **Principais Processos por Uso de CPU:** Lista os cinco processos que mais consomem CPU.
- **Principais Processos por Uso de Memória:** Lista os cinco processos que mais consomem memória.
- **Versão do Sistema Operacional:** Exibe informações sobre a versão do sistema operacional.
- **Tempo de Atividade:** Mostra há quanto tempo o sistema está em funcionamento.
- **Média de Carga:** Exibe a média de carga do sistema.
- **Usuários Conectados:** Lista os usuários atualmente conectados ao sistema.
- **Tentativas de Login com Falha:** Mostra as tentativas de login com falha (necessário executar como superusuário).

## Requisitos
- Sistema operacional baseado em **Linux**.
- Dependências: `mpstat`, `free`, `df`, `ps`, `lsb_release`, `uptime`, `who`, `lastb`.
- Permissões de superusuário para visualizar tentativas de login com falha.

## Instalação
1. Clone este repositório:
   ```bash
   git clone https://github.com/michelle-francisco217/server-stats.git
   ```

2. Acesse o diretório do projeto:
   ```bash
   cd server-stats
   ```

3. Dê permissão de execução ao script:
   ```bash
   chmod +x scripts/server-stats.sh
   ```

4. Para que o script possa ser executado de qualquer lugar no terminal, adicione-o ao PATH:
   ```bash
   sudo ln -s $(pwd)/scripts/server-stats.sh /usr/local/bin/server-stats
   ```

## Uso
Para executar o script, utilize o seguinte comando:
   ```bash
   sudo server-stats
   ```
A execução com `sudo` é necessária para acessar as tentativas de login com falha.

## Considerações Finais
- O script pode ser facilmente expandido para incluir mais métricas ou funcionalidades conforme necessário.
- Para evitar problemas de permissão, certifique-se de executá-lo com as permissões corretas.
- Recomenda-se agendar sua execução periodicamente via cron para monitoramento contínuo.

## Licença
Este projeto é distribuído sob a licença **MIT**. Sinta-se à vontade para usá-lo e modificá-lo conforme necessário.
