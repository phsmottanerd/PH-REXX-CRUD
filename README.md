# PH-REXX-CRUD 🚀
### Sistema CRUD de Ativos de Infraestrutura em Regina REXX

Um projeto prático de gerenciamento de ativos de infraestrutura de TI, desenvolvido em **Regina REXX**, executado em ambiente Linux (Ubuntu/WSL2), utilizando arquivos CSV para persistência dos dados.

O projeto demonstra a implementação de operações CRUD completas por linha de comando, incluindo validação de dados, confirmação de exclusões e backup automático.

---

## 🎯 Sobre o Projeto

O PH-REXX-CRUD é um sistema desenvolvido para demonstrar a utilização da linguagem REXX em tarefas de administração e gerenciamento de infraestrutura.

A aplicação permite cadastrar, consultar, listar, atualizar e excluir ativos de infraestrutura de TI, mantendo os registros armazenados em arquivos CSV.

O objetivo é aplicar conhecimentos de programação, Linux, manipulação de arquivos e organização de dados em um projeto prático de portfólio.

## ⚙️ Funcionalidades

- ✅ **CREATE:** Cadastro de novos ativos.
- ✅ **READ:** Listagem de todos os ativos.
- ✅ **READ:** Consulta de ativos por ID.
- ✅ **UPDATE:** Atualização de informações dos ativos.
- ✅ **DELETE:** Exclusão de ativos com confirmação.
- ✅ Backup automático dos arquivos CSV.
- ✅ Validação de dados.
- ✅ Mensagens de sucesso e erro.
- ✅ Interface interativa via terminal.

## 🛠️ Tecnologias Utilizadas

| Tecnologia | Aplicação |
|---|---|
| Regina REXX | Linguagem principal |
| Linux Ubuntu | Ambiente de execução |
| WSL2 | Ambiente Linux no Windows |
| IBM Z / Mainframe | Contexto de aprendizado da tecnologia REXX |
| CSV | Persistência dos registros |
| Shell / Terminal | Execução e administração do projeto |
| Git / GitHub | Versionamento e publicação |

## 📂 Estrutura do Projeto

```text
PH-REXX-CRUD/
│
├── src/
│   └── main.rexx
│
├── data/
│   ├── ativos.csv
│   ├── backup_ativos.csv
│   └── ativos_exclusao.tmp
│
├── README.md
└── LICENSE
```

## 💻 Como Executar

### 1. Pré-requisitos

- Linux Ubuntu, WSL2 ou ambiente compatível.
- Regina REXX instalado.
- Git instalado.
- Acesso ao terminal.

### 2. Clonar o repositório

```bash
git clone https://github.com/phsmottanerd/PH-REXX-CRUD.git
```

### 3. Acessar o diretório

```bash
cd PH-REXX-CRUD/src
```

### 4. Executar o sistema

```bash
regina main.rexx
```

## 📋 Menu do Sistema

O sistema disponibiliza as seguintes operações:

```text
+==========================================+
|          SISTEMA DE CADASTRO DE ATIVOS   |
+==========================================+

1 - Cadastrar ativo
2 - Listar todos os ativos
3 - Consultar ativo por ID
4 - Atualizar ativo
5 - Excluir ativo
0 - Sair

Escolha uma opção:
```

## 🧪 Validação e Testes

As operações do CRUD são contempladas nos testes funcionais do projeto:

| Operação | Resultado esperado |
|---|---|
| Cadastro | OK |
| Listagem | OK |
| Consulta | OK |
| Atualização | OK |
| Exclusão | OK |

Também são contemplados mecanismos de validação, confirmação de exclusão e backup dos dados.

## ⭐ Destaques do Projeto

- CRUD completo desenvolvido em Regina REXX.
- Manipulação de arquivos CSV.
- Organização de dados de infraestrutura.
- Backup e segurança nas operações.
- Execução em ambiente Linux/WSL2.
- Código organizado e documentado.
- Projeto prático para demonstração de conhecimentos em REXX.

## 🎓 Objetivos de Aprendizado

Este projeto contribui para o desenvolvimento de conhecimentos em:

- Programação com Regina REXX.
- Administração de ambientes Linux.
- Manipulação de arquivos e dados.
- Automação de tarefas.
- Lógica de programação.
- Conceitos de gerenciamento de infraestrutura.
- Tecnologias relacionadas ao ecossistema IBM Z.

## 📌 Próximas Evoluções

- Implementar pesquisa por hostname e endereço IP.
- Adicionar filtros por sistema operacional e ambiente.
- Aprimorar os mecanismos de backup e recuperação.
- Criar relatórios de ativos.
- Expandir as validações de entrada.

## 📄 Licença

Este projeto está disponibilizado sob a licença MIT.

Consulte o arquivo `LICENSE` para obter mais informações.

---

## 👨‍💻 Autor

**Paulo Henrique Santana Motta**

GitHub: [@phsmottanerd](https://github.com/phsmottanerd)

---

⭐ Se este projeto foi interessante, deixe uma estrela no repositório!

🤝 Sugestões e contribuições são bem-vindas.

**Tecnologia que resolve!** 🚀
