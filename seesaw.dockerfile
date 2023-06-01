FROM python:3.8

RUN apt-get update

# additional dependencies

RUN apt-get install -y --no-install-recommends \
        libmpfr-dev \
        bison \
        flex \
        g++ \
        libfl-dev

RUN adduser --disabled-password --gecos '' user

USER user
ENV USER=user \
    HOME=/home/user

RUN pip3 install sly symengine sympy bigfloat numpy

WORKDIR /home/user

# RealPaver
RUN wget http://pagesperso.lina.univ-nantes.fr/~granvilliers-l/realpaver/src/realpaver-0.4.tar.gz; \
    gzip -c -d realpaver-0.4.tar.gz | tar xf -; \
    cd realpaver-0.4; \
    ./configure || true; \
    gmake

# Gelpia

RUN git clone https://github.com/soarlab/gelpia.git && \
    git -C gelpia checkout -b constraints 2ee03ee && \
    cd gelpia && make requirements && make

ENV PATH=/home/user/gelpia/bin:$PATH

# Seesaw source and benchmarks

RUN git clone https://github.com/arnabd88/Seesaw.git && \
    git -C Seesaw checkout 336c4c4

WORKDIR /home/user/Seesaw
