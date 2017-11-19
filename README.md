# jenkins-sbcl
A Jenkins docker build with sbcl and quicklisp

~~~~
docker build -t jc/jenkins-sbcl-slave .
docker run -d --volume=$HOME/docker/jenkins_sbcl_home:/home/jenkins jc/jenkins-sbcl-slave -url http://docker.for.mac.localhost:8080 -workDir=/home/jenkins/agent cf2e44ecea392dada22da33c57812b09c2b055f6067ed0c54a4465ca6c7b8aaf sbcl-agent
~~~~
