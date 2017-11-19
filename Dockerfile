FROM jenkinsci/jnlp-slave
# if we want to install via apt
USER root
RUN apt-get update && apt-get install -y sbcl
RUN wget https://beta.quicklisp.org/quicklisp.lisp 
RUN sbcl --load quicklisp.lisp \
         --eval '(quicklisp-quickstart:install :path #p"/usr/share/quicklisp/quicklisp")' \
         --eval '(quit)'

RUN chown -R jenkins /usr/share/quicklisp

RUN echo '(let ((quicklisp-init "/usr/share/quicklisp/quicklisp/setup.lisp" )) (when (probe-file quicklisp-init)(load quicklisp-init)))' >> /etc/sbclrc

USER jenkins
