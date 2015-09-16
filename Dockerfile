FROM continuumio/miniconda

RUN apt-get update \
  && apt-get -y install python-pip python-numpy python-scipy git expat
RUN pip install pyshp

RUN conda install -c ioos iris cartopy

RUN wget http://download.osgeo.org/proj/proj-4.8.0.tar.gz
RUN wget http://download.osgeo.org/proj/proj-datumgrid-1.5.tar.gz

RUN tar xzf proj-4.8.0.tar.gz
RUN tar xzf proj-datumgrid-1.5.tar.gz

RUN proj-4.8.0/configure
RUN make
RUN make install

RUN echo /usr/local/lib >> /etc/ld.so.conf
RUN ldconfig
