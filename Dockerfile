FROM ubuntu:20.04

# Встановлення залежностей
RUN apt-get update && apt-get install -y \
    g++-arm-linux-gnueabihf \
    build-essential \
    git \
    wget \
    curl \
    unzip \
    make \
    cmake \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build

# Копіюємо скрипт збірки
COPY build-script.sh /build/
RUN chmod +x /build/build-script.sh

CMD ["./build-script.sh"]
