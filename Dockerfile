FROM hypriot/rpi-ruby

RUN apt-get update && \
  apt-get -y upgrade && \
  apt-get -y install nano build-essential redis-server libzmq3-dev && \
  apt-get -y autoremove && \
  apt-get -y autoclean

RUN echo "docker ALL=(root) NOPASSWD:ALL" | tee -a /etc/sudoers && \
  addgroup --system docker && \
  adduser --system docker --shell /bin/bash && \
  echo "docker:docker" | chpasswd

RUN mkdir /home/docker/celluloid && \
  chmod 777 /home/docker/celluloid

COPY containerFiles /home/docker/celluloid

WORKDIR /home/docker/celluloid

RUN chown -R docker:docker /home/docker/celluloid

USER docker

RUN bundle install && \
  bundle update

CMD ["/home/docker/celluloid/start.sh"]