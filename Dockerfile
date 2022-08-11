FROM ubuntu:latest

WORKDIR /vim

RUN apt-get update -y

RUN apt-get install -y vim
RUN apt-get install -y git
RUN apt-get install -y ruby-full
RUN apt-get install -y wget curl
RUN apt-get install -y zsh 
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN touch /root/.zshrc

RUN git clone https://github.com/nikolalsvk/dotfiles.git

WORKDIR dotfiles

RUN ./install.rb

RUN vim +'PlugInstall --sync' +qa

RUN apt-get upgrade -y vim

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs

CMD [ "zsh" ]
