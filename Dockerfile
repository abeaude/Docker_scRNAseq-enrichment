FROM abeaude/scrnaseq-clustering:3.6.3
RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get -y -q --no-install-recommends install \
   libglpk-dev\
   libcurl4-openssl-dev \
  && apt-get clean 

RUN R -e "BiocManager::install(c('DOSE','enrichplot','GO.db','GOSemSim','qvalue','DO.db','reactome.db','graphite','clusterProfiler','ReactomePA','EnhancedVolcano','graph'),ask=FALSE, quiet = TRUE)" \
  && install2.r --error -s --deps TRUE --ncpus 5 \
	ggupset \
	visNetwork\
	msigdbr \
	vroom \
	pheatmap
