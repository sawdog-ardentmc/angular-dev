# angular-dev
basic angular dev environment with node:tls as the base ld image

when building image pass in the user and group ids, e.g.

docker build -t myimage \
  --build-arg USER_ID=$(id -u) \
  --build-arg GROUP_ID=$(id -g) .
