# Don't Remove Credit @VJ_Bots
# Subscribe YouTube Channel For Amazing Bot @Tech_VJ
# Ask Doubt on telegram @KingVJ01

FROM python:3.10.8-slim-buster

# Update apt sources to use archive.debian.org for oldoldstable
RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list && \
    sed -i 's|security.debian.org|archive.debian.org/debian-security|g' /etc/apt/sources.list && \
    sed -i '/stretch-updates/d' /etc/apt/sources.list

# Install system dependencies
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt /requirements.txt

RUN pip3 install -U pip && \
    pip3 install -U -r requirements.txt

RUN mkdir /VJ-FILTER-BOT
WORKDIR /VJ-FILTER-BOT
COPY . /VJ-FILTER-BOT

CMD ["python", "bot.py"]
