##

# koetter/gdas:latest


FROM osgeo/gdal

LABEL maintainer="Allan Koetter <allan.koetter@live.com>"

# Setup additional env
RUN apt-get update -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --fix-missing --no-install-recommends \
    python3 \
    python3-pip \

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .


CMD [ "python", "./your-daemon-or-script.py" ]
