FROM continuumio/anaconda
MAINTAINER miasteinberg
RUN conda install -c bioconda mirdeep2
#RUN conda install -c bioconda perl
RUN apt-get install -y apt-utils
RUN apt-get install -y build-essential

# Install the mirdeep2 scripts (mapper.pl, quantifier.pl, etc)
RUN wget https://www.mdc-berlin.de/43969303/en/research/research_teams/systems_biology_of_gene_regulatory_elements/projects/miRDeep/mirdeep2_0_0_7.zip
RUN apt-get install -y unzip
RUN unzip mirdeep2_0_0_7.zip
ENV PATH $PATH:/mirdeep2_0_0_7

# Dependencies
RUN conda install -c bioconda bowtie
RUN conda install -c bioconda viennarna
RUN conda install -c bioconda perl-pdf-api2

RUN wget http://eddylab.org/software/squid/squid.tar.gz
RUN tar zxvf squid.tar.gz
RUN cd squid-1.9g && ./configure && make

RUN wget http://bioinformatics.psb.ugent.be/supplementary_data/erbon/nov2003/downloads/randfold-2.0.tar.gz
RUN tar zxvf randfold-2.0.tar.gz
RUN cd randfold-2.0 && sed -i "s/^INCLUDE=-I.*/INCLUDE=-I. -I\/squid-1.9g -L\/squid-1.9g/" Makefile && make
ENV PATH $PATH:/randfold-2.0

# Alter make_html.pl and make_html2.pl with #!/usr/bin/env perl so perl can find PDF::API2
RUN cd mirdeep2_0_0_7 && sed -i "s/^#!\/usr\/bin\/perl/#!\/usr\/bin\/env perl/" make_html.pl make_html2.pl
