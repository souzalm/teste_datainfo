# teste_datainfo
Repositório do teste de uma aplicação para um Sistema de Cadastro de Usuário para uma seleção da Datainfo.

Para acessar o cadastro do BD da aplicação, posicionar as pastas para o build Maven juntamente com um servidor e acessar http://localhost:8080/datainfo3/usuario/list.

Também é possível realizar o carregamento de dados diretamente no BD.

As páginas dessa aplicação web são:

- /datainfo3/usuario/list: Página com a Lista de Usuários e botão para cadastro de Novo Usuário e hiperlink para Edição de Usuário;

- /datainfo3/usuario/edit: Página para cadastro de Novo Usuário, deleção dos dados do Usuário e Edição dos dados do Usuário;

- /datainfo3/usuario/formLogin: Página para Login na aplicação web.

*** O Banco de Dados utilizado para elaboração da aplicação foi o HSQLDB v2.5.0.
*** O Servidor utilizado para elaboração da aplicação foi o Tomcat v7.0.
*** No arquivo pom.xml encontram todas as dependências e pluguins necessários para rodar tal aplicação.
