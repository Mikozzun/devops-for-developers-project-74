FROM node:20.12.2

WORKDIR /app

COPY app/package*.json app/Makefile ./

RUN make install

COPY app/ ./

CMD ["make", "test"]
