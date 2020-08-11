FROM ubuntu:18.04
RUN mkdir TRN-pytorch
WORKDIR TRN-pytorch
RUN mkdir sample_data
COPY sample_data/download_sample_data.sh sample_data
COPY download.sh .
RUN ./download.sh
RUN ./sample_data/download_sample_data.sh
CMD python test_video.py --arch InceptionV3 --dataset moments --weights pretrain/TRN_moments_RGB_InceptionV3_TRNmultiscale_segment8_best.pth.tar --frame_folder sample_data/bolei_juggling