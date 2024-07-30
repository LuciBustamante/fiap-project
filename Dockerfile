
# Use a imagem oficial do Node.js para a fase de construção

FROM node:18-alpine

  

# Crie o diretório de trabalho no contêiner

WORKDIR /app

  

COPY package.json ./

  

RUN npm install

  

COPY . .

# instalar o my SQL Client
RUN apk add --no-cache mysql-client

# setar as variáveis
# ENV MYSQL_HOST=localhost:3306
# ENV MYSQL_USER=root
# ENV MYSQL_PASSWORD=root
# ENV MYSQL_DATABASE=fiap
  

# RUN npm install -g pnpm (não aplicável)

# RUN npm run start (se existir quebra o build)

  

# Compilação do código TypeScript

# RUN npm run build - Obs: descomentar, se necessário!!!

  

# Expõe a porta utilizada pelo seu aplicativo Nest.js (por padrão, é a porta 3000)

EXPOSE 8080

  

# Comando para iniciar o aplicativo quando o contêiner for iniciado

CMD ["node", "dist/main"]
