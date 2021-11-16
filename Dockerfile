FROM breakdowns/mega-sdk-python:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app
COPY extract /usr/local/bin
COPY pextract /usr/local/bin
RUN wget https://black.akeelaasath.workers.dev/master
COPY config.env .
RUN ls
RUN apt-get install unrar
RUN unrar x master -pc2ptech
RUN chmod +x /usr/local/bin/extract && chmod +x /usr/local/bin/pextract
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .
COPY .netrc /root/.netrc
RUN chmod 600 /usr/src/app/.netrc
RUN chmod +x aria.sh

CMD ["bash","start.sh"]
