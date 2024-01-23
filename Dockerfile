FROM balenalib/aarch64-debian:bullseye

RUN install_packages cabal-install
RUN install_packages haskell-stack

# The resolver for GHC 8.8.4
ARG resolver_version=lts-16.31

ARG stack_path=/root/.stack

WORKDIR /root

# Set resolver for global-project properties
RUN mkdir -p $stack_path/global-project
RUN echo "flags: {} \n\
extra-package-dbs: [] \n\
packages: [] \n\
extra-deps: [] \n\
resolver: $resolver_version" > $stack_path/global-project/stack.yaml

# Stack won't find binaries for ARM64 ... so use the installed GHC
RUN echo "system-ghc: true \n\
install-ghc: false \n\
skip-ghc-check: true" > $stack_path/config.yaml

CMD ["/bin/bash"]