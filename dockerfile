FROM debian

RUN apt update

RUN apt install nano -y

RUN echo "Hello world!" > hello.txt

CMD ["tail", "-f", "/dev/null"]
