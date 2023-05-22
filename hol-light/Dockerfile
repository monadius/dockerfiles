FROM ocaml/opam:ubuntu-22.04-ocaml-4.14

RUN set -ex; \
    sudo apt-get update; \
    sudo apt-get install -y --no-install-recommends \
        pkg-config \
        libpcre3-dev \
        m4 \
        libipc-system-simple-perl \
        libstring-shellquote-perl \
        git \
    ;

RUN set -ex; \
    eval $(opam env); \
    opam install -y \
        'num=1.4' \
        'camlp5=8.00.03' \
    ;

RUN set -ex; \
    git clone https://github.com/jrh13/hol-light.git; \
    cd hol-light; \
    git checkout 7a035fd; \
    eval $(opam env); \
    make

COPY .ocamlinit /home/opam/hol-light/
WORKDIR /home/opam/hol-light