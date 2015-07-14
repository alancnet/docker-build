FROM ubuntu:trusty
RUN echo Hello>>log
CMD cat log