ARG UPSTREAM=workers/ladybird-clang-18

FROM $UPSTREAM

RUN git clone https://github.com/LadybirdBrowser/ladybird.git
RUN cd ladybird; ./Meta/ladybird.sh build ladybird
