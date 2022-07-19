# Criando build a partir de uma imagem alpine
FROM golang:alpine as mybuilder

# Escolhendo o diretório
WORKDIR /app

# Copiando tudo o que temos na nossa pasta e jogando para o diretório escolhido
COPY . .

# Fazendo o build do nosso programa
RUN go build -o /src main.go

# 
FROM scratch

# Escolhendo o diretório
WORKDIR /

# Dizendo que queremos, a partir do nosso builder, copiar o binário gerado por ele
COPY --from=mybuilder /src /src

# Executando o binário gerado
ENTRYPOINT ["/src"]