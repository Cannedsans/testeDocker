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
