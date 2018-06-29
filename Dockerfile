# Docker image for speech analysis using librosa

FROM jupyter/scipy-notebook

USER $NB_UID
RUN conda install --quiet --yes -c conda-forge \
    librosa=0.6.1

# install RISE for live slides https://damianavila.github.io/RISE/index.html
RUN conda install --quiet --yes -c damianavila82 rise
RUN jupyter-nbextension install rise --py --sys-prefix &\
    jupyter-nbextension enable rise --py --sys-prefix

# install pyalveo to get data from the Alveo API
RUN conda install --quiet --yes pyalveo
# install pysptk for speech feature extraction
RUN pip install pysptk