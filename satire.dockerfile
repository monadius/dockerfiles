FROM python:3.8

RUN apt-get update

# additional dependencies

RUN apt-get install -y --no-install-recommends \
        libmpfr-dev \
        bison \
        flex \
        g++

RUN adduser --disabled-password --gecos '' user

USER user
ENV USER=user \
    HOME=/home/user

RUN pip3 install sly symengine sympy bigfloat numpy

WORKDIR /home/user

# Gelpia

RUN git clone https://github.com/soarlab/gelpia.git && \
    git -C gelpia checkout -b satire c28bf255 && \
    cd gelpia && make requirements && make

ENV PATH=/home/user/gelpia/bin:$PATH

# Satire source and benchmarks

RUN git clone https://github.com/arnabd88/Satire.git && \
    git -C Satire checkout -b satire 8a4816a

COPY --chown=user satire.sh /home/user/Satire/run
COPY --chown=user test.satire /home/user/Satire/
WORKDIR /home/user/Satire