FROM ubuntu:22.04

WORKDIR /flaresolverr
ADD https://github.com/FlareSolverr/FlareSolverr/releases/download/v3.3.21/flaresolverr_linux_x64.tar.gz /flaresolverr/flaresolverr_linux_x64.tar.gz
RUN apt update && apt install -y tar chromium-browser chromium-driver xvfb dumb-init procps curl vim xauth libnss3-dev libgdk-pixbuf2.0-dev libgtk-3-dev libxss-dev
RUN apt install -y libasound2 
RUN tar -xvf flaresolverr_linux_x64.tar.gz
WORKDIR /flaresolverr/flaresolverr
RUN chmod +x flaresolverr

ENV LANG=en_GB
ENV LOG_LEVEL=debug

USER flaresolverr

EXPOSE 8191
CMD "./flaresolverr"
