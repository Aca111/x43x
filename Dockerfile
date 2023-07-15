FROM alpine
LABEL version="0.1"

# Install dependencies
RUN apk update
RUN apk upgrade
RUN apk install  curl unzip jq openssl qrencode unzip tzdata 
RUN apk 
RUN rm -rf /var/lib/apk/lists/*

# Set the timezone

#end 

#install xray-reality
WORKDIR /root/
COPY ./conf.docker.sh ./install.sh
RUN sh install.sh
RUN qrencode -s 50 -o qr.png $(cat test.url)
#end 

ENTRYPOINT ["tail", "-f", "/dev/null"]

EXPOSE 443
