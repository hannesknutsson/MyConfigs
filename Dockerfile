FROM debian:stable-slim
RUN apt update -y
RUN apt upgrade -y
RUN apt install -y sudo git curl
RUN git clone https://github.com/hannesknutsson/MyConfigs
RUN ln -snf /usr/share/zoneinfo/$(curl https://ipapi.co/timezone) /etc/localtime
RUN cd MyConfigs && ./run_this.bash cli
WORKDIR /root/
CMD zsh -c "source .zprofile && zsh"
