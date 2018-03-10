FROM elixir:latest

ADD . /app
WORKDIR /app
VOLUME /app

CMD ["sh"]
