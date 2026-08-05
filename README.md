# 🤖 Projeto Robot Framework - Estudos em Automação

Bem-vindo ao **Projeto_RobotFramework**! Este repositório é um **projeto de estudos e prática** focado na automação de testes utilizando o [Robot Framework](https://robotframework.org/). O objetivo principal deste repositório é consolidar o aprendizado, explorar as funcionalidades da ferramenta e construir um portfólio prático na área de automação e Garantia da Qualidade (QA).

## 🎯 Sobre o Projeto de Estudos

Este projeto foi desenvolvido como um laboratório de testes para aplicar conceitos reais do dia a dia de um analista de QA. A arquitetura empregada simula um cenário real, utilizando uma estrutura baseada em *Keywords* (Palavras-chave), que ajuda a separar a lógica de teste da implementação técnica.

Através deste repositório de estudos, busca-se demonstrar e aprimorar conhecimentos em:
- Criação e execução de testes automatizados funcionais.
- Estruturação de *Keywords* customizadas, buscando reusabilidade e clareza.
- Organização de diretórios e boas práticas de codificação em Robot Framework.
- Estratégias para facilitar a depuração (*debugging*) e a análise de falhas nos testes, habilidades essenciais no mercado.

## 📂 Estrutura do Repositório

A estrutura de diretórios foi pensada para manter o projeto organizado e refletir o padrão adotado em projetos profissionais de QA:

```text
Projeto_RobotFramework/
├── resources/          # Keywords customizadas, variáveis e mapeamento de elementos.
│   ├── base/           # Configuração base para inicialização do ambiente de teste.
│   ├── keywords/       # Ações, instruções de alto e baixo nível e Locators (XPath, CSS, IDs) das páginas mapeadas.
│   └── data/           # Massas de dados e configurações de ambiente para testes.
├── results/            # Relatórios e logs gerados pelas execuções (ignorados no git).
├── tests/              # Pasta principal dos teste (.robot)
│   ├── API/            # Pasta dos arquivos de teste para API (.robot) contendo as suítes de teste de estudo.
│   ├── Functional/     # Pasta dos arquivos de teste Funcionnais (.robot) contendo as suítes de teste de estudo.
├── .gitignore          # Arquivos e pastas a serem ignorados pelo controle de versão.
└── README.md           # Documentação principal do projeto.
```

## 🚀 Tecnologias e Dependências

O núcleo de estudo deste projeto gira em torno das seguintes tecnologias:

- **[Python](https://www.python.org/):** Linguagem base do ecossistema Robot.
- **[Robot Framework](https://robotframework.org/):** Framework genérico e *keyword-driven* utilizado como foco principal de aprendizado.
- **[SeleniumLibrary](https://robotframework.org/SeleniumLibrary/):** Utilizada para interação e testes de interface de usuário (Web).
- **[RequestsLibrary](https://github.com/MarketSquare/robotframework-requests):** Utilizada para a automação e validação de testes de API (Back-end).
- **[FakerLibrary](https://guykisel.github.io/robotframework-faker/):** Utilizada para a geração de massa de dados aleatórios e fictícios (como nomes, e-mails, senhas e endereços), tornando os testes dinâmicos e independentes de dados fixos.

## ⚙️ Pré-requisitos e Instalação

Para executar este projeto localmente e acompanhar os estudos, você precisará ter o Python instalado na sua máquina.

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/MarrcosRodrigues/Projeto_RobotFramework.git
   cd Projeto_RobotFramework
   ```

2. **Crie um ambiente virtual (Recomendado):**
   ```bash
   python -m venv venv
   
   # No Windows:
   venv\Scripts\activate
   
   # No Linux/Mac:
   source venv/bin/activate
   ```

3. **Instale o Robot Framework e bibliotecas de apoio:**
   ```bash
   pip install robotframework
   # Caso esteja testando web:
   pip install robotframework-seleniumlibrary
   ```

## 🏃‍♂️ Como Executar os Testes

O Robot Framework oferece flexibilidade na execução dos testes, gerando evidências valiosas para o estudo de falhas e sucessos.

- **Executar todos os testes de estudo:**
  ```bash
  robot -d results tests/
  ```

- **Executar uma suíte específica:**
  ```bash
  robot -d results tests/nome_do_arquivo.robot
  ```

Os resultados detalhados (`log.html`, `report.html` e `output.xml`) serão criados na pasta `results/`, oferecendo uma visão completa dos passos executados e facilitando a análise.

## 👨‍💻 Autor

**Marcos Rodrigues**  
QA Analyst | Software Tester
[GitHub: MarrcosRodrigues](https://github.com/MarrcosRodrigues)