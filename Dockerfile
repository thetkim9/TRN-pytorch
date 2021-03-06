FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y wget
RUN mkdir TRN-pytorch
WORKDIR TRN-pytorch
RUN mkdir sample_data

RUN wget -P pretrain http://relation.csail.mit.edu/models/TRN_moments_RGB_InceptionV3_TRNmultiscale_segment8_best.pth.tar
RUN wget -P pretrain http://relation.csail.mit.edu/models/TRN_moments_RGB_InceptionV3_TRNmultiscale_segment8_best_v0.4.pth.tar
RUN wget -P pretrain http://relation.csail.mit.edu/models/moments_categories.txt

RUN wget -P sample_data http://relation.csail.mit.edu/data/bolei_juggling.mp4
RUN wget http://relation.csail.mit.edu/data/juggling.mp4
RUN apt-get install -y zip unzip
RUN apt-get install -y cmake
RUN apt-get install -y make
RUN apt-get install -y git
RUN apt-get install -y sudo
RUN apt-get install -y build-essential
RUN apt-get install -y apt-utils
COPY build_all.sh .
RUN bash build_all.sh
COPY . .
CMD python test_video.py --arch InceptionV3 --dataset moments --weights pretrain/TRN_moments_RGB_InceptionV3_TRNmultiscale_segment8_best.pth.tar --frame_folder sample_data/bolei_juggling
