FROM hseeberger/scala-sbt:8u222_1.3.5_2.13.1

RUN apt-get update
RUN apt-get install libmpfr4

RUN adduser --disabled-password --gecos '' user

USER user
ENV USER=user \
    HOME=/home/user

WORKDIR /home/user

RUN git clone https://github.com/malyzajko/daisy.git && \
    git -C daisy checkout -b daisy b483303

RUN git clone --depth 1 https://github.com/regb/scala-smtlib /home/user/.sbt/1.0/staging/fac1130dcabb01fad620/scala-smtlib

WORKDIR /home/user/daisy

RUN sbt compile && sbt script

COPY --chown=user test.scala .