FROM a504082002/seqtool
MAINTAINER a504082002 <a504082002@gmail.com>

# Install python3
RUN apt-get update -qq &&\
    apt-get install -yq python3 python3-pip  python3-dev \
    					libfreetype6 libfreetype6-dev \
                        libpng12-0 libpng12-dev \
                        libpq-dev libopenblas-dev \
                        pkg-config g++ gfortran \
    					python3-tk python3-numpy python3-scipy && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy configs
RUN mkdir /build && cd /build
ADD configs/* /build/

# Install python packages
RUN pip3 install -r /build/requirements.txt


# set data mounting point
VOLUME ["/input", "/output", "/data"]
WORKDIR /data

CMD ["/bin/bash"]

