/* ====================================================== */
/*                    PH-REXX-CRUD                        */
/*             INFRASTRUCTURE MANAGEMENT                  */
/* ====================================================== */

esc = '1B'x
cyan = esc || '[1;36m'
green = esc || '[1;32m'
yellow = esc || '[1;33m'
red = esc || '[1;31m'
white = esc || '[1;37m'
reset = esc || '[0m'

csv = '../data/ativos.csv'

/* Ajusta o caminho para a pasta de dados do projeto */
csv = '/home/henrique/PH-REXX-CRUD/data/ativos.csv'

do forever

    call charout , esc || '[2J' || esc || '[H'

    say cyan || '  +======================================================+'
    say '  |                                                      |'
    say '  |                  PH-REXX-CRUD                        |'
    say '  |           INFRASTRUCTURE MANAGEMENT                  |'
    say '  |                                                      |'
    say '  +======================================================+'
    say '  |                                                      |'
    say '  |   [1]  CADASTRAR ATIVO                               |'
    say '  |   [2]  LISTAR ATIVOS                                 |'
    say '  |   [3]  CONSULTAR ATIVO                               |'
    say '  |   [4]  ATUALIZAR ATIVO                               |'
    say '  |   [5]  EXCLUIR ATIVO                                 |'
    say '  |                                                      |'
    say '  +------------------------------------------------------+'
    say '  |   [0]  SAIR DO SISTEMA                               |'
    say '  +======================================================+' || reset
    say ''

    call charout , yellow || '  SELECIONE UMA OPCAO: ' || reset
    pull opcao

    select

        when opcao = '1' then call cadastrar

        when opcao = '2' then call listar
        when opcao = '3' then call consultar
        when opcao = '4' then call atualizar
        when opcao = '5' then call excluir

        when opcao = '0' then do
            say ''
            say green || '  SISTEMA ENCERRADO COM SUCESSO!' || reset
            leave
        end

        otherwise mensagem = 'OPCAO INVALIDA! TENTE NOVAMENTE.'

    end

    if opcao <> '1' & opcao <> '0' then do
        say ''
        say yellow || '  [STATUS] ' || mensagem || reset
        say ''
        call charout , white || '  Pressione ENTER para continuar...' || reset
        pull pausa
    end

end

exit


/* ====================================================== */
/*                   MODULO DE CADASTRO                   */
/* ====================================================== */

cadastrar:

call charout , esc || '[2J' || esc || '[H'

say cyan || '  +======================================================+'
say '  |                                                      |'
say '  |                  CADASTRO DE ATIVOS                  |'
say '  |                                                      |'
say '  +======================================================+' || reset
say ''

call charout , white || '  ID DO ATIVO: ' || reset
pull id

call charout , white || '  HOSTNAME: ' || reset
pull hostname

call charout , white || '  ENDERECO IP: ' || reset
pull ip

call charout , white || '  SISTEMA OPERACIONAL: ' || reset
pull sistema

call charout , white || '  STATUS (ATIVO/INATIVO): ' || reset
pull status

call charout , white || '  AMBIENTE (PRODUCAO/HOMOLOGACAO/DESENVOLVIMENTO): ' || reset
pull ambiente

/* Validacao dos campos obrigatorios */

if id = '' | hostname = '' | ip = '' | sistema = '' | status = '' | ambiente = '' then do
    say ''
    say red || '  [ERRO] TODOS OS CAMPOS SAO OBRIGATORIOS!' || reset
    return
end

/* Normalizacao dos dados */

id = strip(id)
hostname = translate(strip(hostname))
ip = strip(ip)
sistema = strip(sistema)
status = translate(strip(status))
ambiente = translate(strip(ambiente))

/* Gravacao no arquivo CSV */

registro = id || ',' || hostname || ',' || ip || ',' || sistema || ',' || status || ',' || ambiente

resultado = lineout(csv, registro)
fechamento = lineout(csv)

if resultado = 0 then do
    say ''
    say green || '  +----------------------------------------------+'
    say '  |          ATIVO CADASTRADO COM SUCESSO!       |'
    say '  +----------------------------------------------+' || reset
    say ''
    say white || '  ID: ' || id
    say '  HOSTNAME: ' || hostname
    say '  IP: ' || ip
    say '  SISTEMA: ' || sistema
    say '  STATUS: ' || status
    say '  AMBIENTE: ' || ambiente || reset
end
else do
    say ''
    say red || '  [ERRO] NAO FOI POSSIVEL GRAVAR O REGISTRO!' || reset
end

say ''
call charout , white || '  Pressione ENTER para voltar ao menu...' || reset
pull pausa

return


/* ====================================================== */
/*                    MODULO DE LISTAGEM                  */
/* ====================================================== */

listar:

call charout , esc || '[2J' || esc || '[H'

say cyan || '  +======================================================+'
say '  |                    ATIVOS CADASTRADOS                |'
say '  +======================================================+' || reset
say ''

cabecalho = linein(csv)

if cabecalho = '' then do
    say red || '  [ERRO] ARQUIVO CSV VAZIO OU INDISPONIVEL!' || reset
    return
end

say white || '  ID    HOSTNAME          IP              SISTEMA'
say '  ------------------------------------------------------' || reset

quantidade = 0

do while lines(csv) > 0

    registro = linein(csv)

    if registro <> '' then do
        parse var registro id ',' hostname ',' ip ',' sistema ',' status ',' ambiente

        quantidade = quantidade + 1

        say '  ' || left(id, 6) || left(hostname, 18) || left(ip, 16) || left(sistema, 12)
        say '        STATUS: ' || status || ' | AMBIENTE: ' || ambiente
    end

end

fechamento = stream(csv, 'c', 'close')

say ''
say green || '  TOTAL DE ATIVOS: ' || quantidade || reset
say ''
call charout , white || '  Pressione ENTER para voltar ao menu...' || reset
pull pausa

return



/* ====================================================== */
/*                    MODULO DE CONSULTA                  */
/* ====================================================== */

consultar:

call charout , esc || '[2J' || esc || '[H'

say cyan || '  +======================================================+'
say '  |                    CONSULTA DE ATIVOS                 |'
say '  +======================================================+' || reset
say ''

call charout , white || '  INFORME O ID DO ATIVO: ' || reset
pull idBusca
idBusca = strip(idBusca)

encontrado = 0
quantidade = 0

cabecalho = linein(csv)

if cabecalho = '' then do
    say red || '  [ERRO] ARQUIVO CSV VAZIO OU INDISPONIVEL!' || reset
    return
end

do while lines(csv) > 0

    registro = linein(csv)

    if registro <> '' then do
        parse var registro id ',' hostname ',' ip ',' sistema ',' status ',' ambiente

        if strip(id) = idBusca then do
            encontrado = 1
            say ''
            say green || '  +----------------------------------------------+'
            say '  |              ATIVO ENCONTRADO!               |'
            say '  +----------------------------------------------+' || reset
            say ''
            say white || '  ID: ' || id
            say '  HOSTNAME: ' || hostname
            say '  IP: ' || ip
            say '  SISTEMA: ' || sistema
            say '  STATUS: ' || status
            say '  AMBIENTE: ' || ambiente || reset
            leave
        end
    end

end

fechamento = stream(csv, 'c', 'close')

if encontrado = 0 then do
    say ''
    say yellow || '  [AVISO] NENHUM ATIVO ENCONTRADO COM ESSE ID.' || reset
end

say ''
call charout , white || '  Pressione ENTER para voltar ao menu...' || reset
pull pausa

return



/* ====================================================== */
/*                   MODULO DE ATUALIZACAO                */
/* ====================================================== */

atualizar:

call charout , esc || '[2J' || esc || '[H'

say cyan || '  +======================================================+'
say '  |                   ATUALIZACAO DE ATIVOS               |'
say '  +======================================================+' || reset
say ''

call charout , white || '  INFORME O ID DO ATIVO: ' || reset
pull idBusca
idBusca = strip(idBusca)

temp = '/home/henrique/PH-REXX-CRUD/data/ativos.tmp'
encontrado = 0

cabecalho = linein(csv)

if cabecalho = '' then do
    say red || '  [ERRO] ARQUIVO CSV VAZIO OU INDISPONIVEL!' || reset
    return
end

resultado = lineout(temp, cabecalho)

do while lines(csv) > 0

    registro = linein(csv)

    if registro <> '' then do
        parse var registro id ',' hostname ',' ip ',' sistema ',' status ',' ambiente

        if strip(id) = idBusca then do
            encontrado = 1

            say ''
            say yellow || '  DEIXE UM CAMPO VAZIO PARA MANTER O VALOR ATUAL.' || reset
            say ''

            say '  HOSTNAME ATUAL: ' hostname
            call charout , '  NOVO HOSTNAME: '
            pull novoHostname
            if strip(novoHostname) <> '' then hostname = translate(strip(novoHostname))

            say ''
            say '  IP ATUAL: ' ip
            call charout , '  NOVO IP: '
            pull novoIp
            if strip(novoIp) <> '' then ip = strip(novoIp)

            say ''
            say '  SISTEMA ATUAL: ' sistema
            call charout , '  NOVO SISTEMA: '
            pull novoSistema
            if strip(novoSistema) <> '' then sistema = strip(novoSistema)

            say ''
            say '  STATUS ATUAL: ' status
            call charout , '  NOVO STATUS: '
            pull novoStatus
            if strip(novoStatus) <> '' then status = translate(strip(novoStatus))

            say ''
            say '  AMBIENTE ATUAL: ' ambiente
            call charout , '  NOVO AMBIENTE: '
            pull novoAmbiente
            if strip(novoAmbiente) <> '' then ambiente = translate(strip(novoAmbiente))

            registro = id || ',' || hostname || ',' || ip || ',' || sistema || ',' || status || ',' || ambiente
        end

        resultado = lineout(temp, registro)
    end

end

fechamento = stream(csv, 'c', 'close')
fechamento = lineout(temp)

if encontrado = 1 then do
    resultado = stream(temp, 'c', 'close')
    resultado = stream(csv, 'c', 'close')
        address system 'mv -f ' || temp || ' ' || csv
        resultado = rc

    if resultado = 0 then
        say green || '  [SUCESSO] ATIVO ATUALIZADO!' || reset
    else
        say red || '  [ERRO] NAO FOI POSSIVEL SUBSTITUIR O CSV!' || reset
end
else do
    resultado = stream(temp, 'c', 'close')
        address system 'rm -f ' || temp
        resultado = rc
    say yellow || '  [AVISO] ID NAO ENCONTRADO. NENHUMA ALTERACAO REALIZADA.' || reset
end

say ''
call charout , white || '  Pressione ENTER para voltar ao menu...' || reset
pull pausa

return


excluir:
    call charout , esc || '[2J' || esc || '[H'
    say cyan || '  +======================================================+' || reset
    say cyan || '  |                    EXCLUSAO DE ATIVOS                 |' || reset
    say cyan || '  +======================================================+' || reset
    say ''

    call charout , white || '  INFORME O ID DO ATIVO: ' || reset
    pull idBusca
    idBusca = strip(idBusca)

    if idBusca = '' then do
        say yellow || '  [AVISO] ID NAO INFORMADO.' || reset
        call charout , white || '  Pressione ENTER para voltar...' || reset
        pull pausa
        return
    end

    say ''
    call charout , yellow || '  CONFIRMA A EXCLUSAO DO ID ' || idBusca || '? (S/N): ' || reset
    pull confirma
    confirma = translate(strip(confirma))

    if confirma <> 'S' then do
        say yellow || '  [AVISO] EXCLUSAO CANCELADA.' || reset
        call charout , white || '  Pressione ENTER para voltar...' || reset
        pull pausa
        return
    end

    temp = '/home/henrique/PH-REXX-CRUD/data/ativos_exclusao.tmp'
    encontrado = 0

    address system 'rm -f ' || temp

    cabecalho = linein(csv)

    if cabecalho = '' then do
        fechamento = stream(csv, 'c', 'close')
        say red || '  [ERRO] CSV VAZIO OU INDISPONIVEL.' || reset
        call charout , white || '  Pressione ENTER para voltar...' || reset
        pull pausa
        return
    end

    resultado = lineout(temp, cabecalho)

    do while lines(csv) > 0
        registro = linein(csv)

        if registro <> '' then do
            parse var registro id ',' hostname ',' ip ',' sistema ',' status ',' ambiente

            if strip(id) = idBusca then
                encontrado = 1
            else
                resultado = lineout(temp, registro)
        end
    end

    fechamento = stream(csv, 'c', 'close')
    fechamento = lineout(temp)
    fechamento = stream(temp, 'c', 'close')

    if encontrado = 1 then do
        address system 'mv -f ' || temp || ' ' || csv
        resultado = rc

        if resultado = 0 then
            say green || '  [SUCESSO] ATIVO EXCLUIDO!' || reset
        else
            say red || '  [ERRO] NAO FOI POSSIVEL SUBSTITUIR O CSV!' || reset
    end
    else do
        address system 'rm -f ' || temp
        say yellow || '  [AVISO] ID NAO ENCONTRADO. NENHUMA ALTERACAO REALIZADA.' || reset
    end

    say ''
    call charout , white || '  Pressione ENTER para voltar ao menu...' || reset
    pull pausa

return

