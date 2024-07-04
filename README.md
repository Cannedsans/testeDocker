# Teste de "Dockerizar"
---
## Obejtivo 
 O objetivo é aprender e documentar como transformar um site em ruby em uma imagem docker para ser executado quando nescessário 
# Passo a passo 
--- 
para começar é nescessário confecionar a estrutura de arquivos 

```
projeto/
├── Dockerfile
├── Gemfile
├── app.rb
├── public/
│   └── css/
│       └── style.css
└── views/
    └── index.erb
```
após isso apenas os arquivos **Gemfile** e **Dockerfile** são importantes, no qual iremos instalar as dependências e criaremos a imagem respctivamente 
## Gemfile 
---
na gem file é preciso fornecer 3 gens, a gem sinatra é obrigatória para o funcionamento do site e uma gem de servidor, nesse exemplo foi usado a rackup em conjunto com puma .
```
# Gemfile
source 'https://rubygems.org'
gem 'sinatra'
gem 'puma'
gem 'rackup'
```

## Dockerfile
---
No Dockerfile iremos por todas as configurações de como será nossa imagem docker, para isso é nescessário tem o docker compose instalado em conjunto então fique atento.
```
# Dockerfile
# Usa a imagem base do Ruby
FROM ruby:latest

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia os arquivos do projeto para o contêiner
COPY . .

# Instala as dependências do Ruby especificadas no Gemfile
RUN bundle install

# Expõe a porta 4567 utilizada pelo Sinatra
EXPOSE 4567

# Comando padrão para executar o servidor Sinatra
CMD ["ruby", "app.rb", "-o", "0.0.0.0"]

```

## Montagem 
Agora para a montagem da imagem será apenas nescessário fazer 1 comando.

```
docker build -t nome-imagem .
```
não se esqueça de executar esse comando na **pasta do projeto** para que a imagem seja montada corretamente.

## inicializar 
para dar inicio apenas execute um contâiner com o comando de exemplo abaixo 
```
docker run -p 80:4567 nome-imagem
```
após isso abra no ip da máquina na porta 80 para acessar seu site

# Observações 
* no link do css a pasta css foi opcional, então para linkar /css/estilo.css
* inspecione os logs do contâiner em caso de algum problema para garantir que nada esteja errado 4
* o código foi escrito em chat gpt pois esse site é para fins de aprendizado