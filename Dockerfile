FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install wget
RUN mkdir TRN-pytorch
WORKDIR TRN-pytorch
RUN mkdir sample_data
COPY sample_data/download_sample_data.sh sample_data
COPY download.sh .
RUN ./sample_data/download_sample_data.sh
RUN ./download.sh
CMD python test_video.py --arch InceptionV3 --dataset moments --weights pretrain/TRN_moments_RGB_InceptionV3_TRNmultiscale_segment8_best.pth.tar --frame_folder sample_data/bolei_juggling