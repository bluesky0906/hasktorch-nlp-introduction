# hasktorch-nlp-introduction

TODO - add description about this repository
どういう人向けなのか、必要な前提知識

## Prerequirements
 - Docker
 - (Optional) Install [hasktorch based on your environment](https://github.com/hasktorch/hasktorch)
   - Recommned adding `$LD_LYBRARY_PATH`/`$DYLD_LIBRARY_PATH` set by [setenv](https://github.com/hasktorch/hasktorch/blob/master/setenv) to your `.bashrc`



## How to proceed this training

TODO

Folk this repository

### Jupyter notebook
Clone this repository
```
git clone https://github.com/<your-username>/hasktorch-nlp-introduction.git
cd hasktorch-nlp-introduction
```

Run docker container
```
docker-compose up -d
```

Open http://localhost:8888/ and open hasktorch-nlp-introduction repository.

This directory in your local environment is mounted in the docker container, so your changes will be reflected in both.

#### Install new libraries
`package.yaml` is for stack project, so the libraries specified in the file cannot be used in jupyter notebook.
To install new libraries on jupyter environment, run below command **in the docker container**.
```
cabal install <library-name>
```
Hint: Use terminal from jupyter notebook.
hasktorch, [hasktorch-tools](https://github.com/DaisukeBekki/hasktorch-tools), [nlp-tools](https://github.com/DaisukeBekki/nlp-tools/tree/master) are already installed.

### Stack project
