ARG base=prefecthq/prefect:3.0-python3.12
FROM ${base}
ARG base

RUN apt update; apt install -y bash-completion vim git make
RUN pip install prefect[docker]

RUN mkdir -p /root/.prefect; \
    echo "set mouse-=a" > /root/.vimrc; 

ENV PREFECT_SERVER_API_HOST=0.0.0.0
ENV PREFECT_SERVER_API_PORT=4200
#ENV PREFECT_API_URL=http://host:4200/api
EXPOSE 4200
VOLUME /root/.prefect
