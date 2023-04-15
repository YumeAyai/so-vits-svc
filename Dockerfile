FROM python:3.8-slim
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install pip requirements
WORKDIR /content
COPY requirements.txt .

RUN apt-get update \
    && apt-get install -y sudo \
    && apt-get install -y vim \
    && apt-get install -y gcc \
    && apt-get install -y g++ \
    && apt-get install -y cmake \
    && python -m pip install --upgrade pip \
    && python -m pip install jupyter \
    && python -m pip install -r requirements.txt

COPY . /content/so-vits-svc

EXPOSE 8888 8080

ENTRYPOINT ["/bin/sh"]
# CMD ["./start.sh"]
