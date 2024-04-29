FROM htorch/hasktorch-jupyter:latest-cpu

RUN curl -sSL https://get.haskellstack.org/ | sh

RUN stack upgrade
RUN stack --version
RUN stack setup

RUN mkdir libraries
RUN mv ./hasktorch ./inline-c ./dist-newstyle ./libraries/

WORKDIR /home/ubuntu/libraries
RUN git clone https://github.com/DaisukeBekki/hasktorch-tools.git
RUN git clone https://github.com/DaisukeBekki/nlp-tools.git

WORKDIR /home/ubuntu/libraries/hasktorch-tools
RUN cabal v1-install /home/ubuntu/libraries/hasktorch/hasktorch /home/ubuntu/libraries/hasktorch/codegen /home/ubuntu/libraries/hasktorch/libtorch-ffi /home/ubuntu/libraries/hasktorch/libtorch-ffi-helper --ghc-options "-j1 +RTS -A128m -n2m -RTS"

WORKDIR /home/ubuntu
RUN cabal v1-install ./libraries/hasktorch-tools ./libraries/nlp-tools --ghc-options "-j1 +RTS -A128m -n2m -RTS"
