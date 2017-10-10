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
RUN wget https://gist.githubusercontent.com/jar-o/990e4d19e07741290ad08d96f6c2745e/raw/7d756ba84fb4e78ef50d8660e1b7edeaac1b9f28/dum.stanza

RUN pip install dumdum

RUN rm -f run.sh
RUN wget https://gist.githubusercontent.com/jar-o/a2ea32fdf122c301f552e14644748a98/raw/3c286dc78a87d612e91dd580cbffb9ab8b069d12/run.sh
RUN chmod +x run.sh

ENTRYPOINT /run.sh

