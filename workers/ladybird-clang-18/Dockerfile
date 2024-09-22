ARG UPSTREAM=debian
FROM $UPSTREAM

# General Dependencies
RUN apt update; apt install -y git openjdk-17-jre wget lsb-release;
RUN apt install -y autoconf autoconf-archive automake build-essential ccache cmake curl fonts-liberation2 libavcodec-dev libavformat-dev libgl1-mesa-dev nasm ninja-build pkg-config qt6-base-dev qt6-tools-dev-tools qt6-wayland qt6-multimedia-dev tar unzip zip

# clang-18
RUN wget -O /usr/share/keyrings/llvm-snapshot.gpg.key https://apt.llvm.org/llvm-snapshot.gpg.key
RUN echo "deb [signed-by=/usr/share/keyrings/llvm-snapshot.gpg.key] https://apt.llvm.org/$(lsb_release -sc)/ llvm-toolchain-$(lsb_release -sc)-18 main" | tee -a /etc/apt/sources.list.d/llvm.list
RUN apt update -y && apt install clang-18 clangd-18 clang-format-18 clang-tidy-18 lld-18 -y

RUN useradd -ms /bin/bash worker
USER worker
WORKDIR /home/worker
