FROM htorch/hasktorch-jupyter:latest-cpu

RUN curl -sSL https://get.haskellstack.org/ | sh

RUN stack upgrade
RUN stack --version
RUN stack setup

RUN mkdir libraries
RUN mv ./hasktorch ./inline-c ./dist-newstyle ./libraries/

RUN cd libraries
RUN git clone https://github.com/DaisukeBekki/hasktorch-tools.git hasktorch-tools
RUN git clone https://github.com/DaisukeBekki/nlp-tools.git nlp-tools

# TODO: install hasktorch-tools after adding cabal file to hasktorch-tools
RUN cabal v1-install ./nlp-tools --ghc-options "-j1 +RTS -A128m -n2m -RTS"

