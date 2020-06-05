ARG BASE_IMAGE
FROM ${BASE_IMAGE}

ARG PORT
ENV PORT=${PORT}

ARG ACCESS_TOKEN_EXPIRE_SECONDS
ENV ACCESS_TOKEN_EXPIRE_SECONDS=${ACCESS_TOKEN_EXPIRE_SECONDS}

ARG CORS_ALLOWS
ENV CORS_ALLOWS=${CORS_ALLOWS}

ARG MYSQL_USER
ENV MYSQL_USER = ${MYSQL_USER}

ARG MYSQL_PASSWORD
ENV MYSQL_PASSWORD = ${MYSQL_PASSWORD}

ARG MYSQL_HOST
ENV MYSQL_HOST = ${MYSQL_HOST}

ARG MYSQL_DATABASE
ENV MYSQL_DATABASE = ${MYSQL_DATABASE}

ARG SQLALCHEMY_DATABASE_URL
ENV SQLALCHEMY_DATABASE_URL=${SQLALCHEMY_DATABASE_URL}

ARG SQLALCHEMY_POOL_SIZE
ENV SQLALCHEMY_POOL_SIZE=${SQLALCHEMY_POOL_SIZE}

ARG SQLALCHEMY_POOL_TIMEOUT
ENV SQLALCHEMY_POOL_TIMEOUT=${SQLALCHEMY_POOL_TIMEOUT}

ARG SQLALCHEMY_POOL_RECYCLE
ENV SQLALCHEMY_POOL_RECYCLE=${SQLALCHEMY_POOL_RECYCLE}

ARG SQLALCHEMY_ECHO
ENV SQLALCHEMY_ECHO=${SQLALCHEMY_ECHO}

RUN mkdir run data

COPY src/apps/auth/repository/users.json ${USER_REPOSITORY_PATH}

COPY private_key .

COPY public_key .

CMD ["python", "-m", "uvicorn", "src.asgi:app","--host","0.0.0.0","--port","5000"]