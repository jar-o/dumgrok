# To build:
# 
#   docker build . -t dumgrok
#
# To run:
#
#   docker run dumgrok
#
# To run and land in the console:
#
#   docker run -it dumgrok /bin/sh

FROM jfloff/alpine-python:2.7-slim 

# Update so wget works
RUN apk update && apk add ca-certificates wget && update-ca-certificates

# Fetch ngrok
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
RUN unzip ngrok-stable-linux-amd64.zip

# Generate the dumdum stanza
RUN wget https://raw.githubusercontent.com/jar-o/dumgrok/master/dum.stanza

RUN pip install dumdum

RUN rm -f run.sh
RUN wget https://raw.githubusercontent.com/jar-o/dumgrok/master/run.sh
RUN chmod +x run.sh

ENTRYPOINT /run.sh

