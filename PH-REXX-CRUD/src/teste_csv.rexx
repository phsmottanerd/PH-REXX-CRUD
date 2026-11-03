arquivo = '/home/henrique/PH-REXX-CRUD/data/ativos.csv'

registro = '999,SRV-TESTE,192.168.1.99,Ubuntu,Ativo,TESTE'

resultado = lineout(arquivo, registro)
say 'Resultado da gravacao:' resultado

fechamento = lineout(arquivo)
say 'Fechamento:' fechamento
