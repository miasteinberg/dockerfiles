FROM continuumio/anaconda
MAINTAINER miasteinberg
RUN conda install -c bioconda trim-galore
