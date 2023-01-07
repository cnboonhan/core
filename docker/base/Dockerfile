FROM ubuntu

ARG ROOT_PASSWORD
ENV env_password=${ROOT_PASSWORD:-password}
RUN echo "root:$env_password" | chpasswd

RUN apt update
RUN apt install vim git git-extras tmux curl zsh iputils-ping iproute2 inotify-tools golang-go delve python3 python3-pip ripgrep libxml2-utils jq unzip ttyd tig dos2unix file python-is-python3 python3-venv python3-autopep8 -y
RUN pip3 install cookiecutter

RUN curl -L packages.httpie.io/binaries/linux/http-latest -o /usr/bin/http && chmod +x /usr/bin/http

RUN git clone --depth 1 https://github.com/junegunn/fzf.git /root/.fzf
RUN /root/.fzf/install --all

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vi-mode

RUN mkdir -p /root/.vim
COPY vimrc /root/.vimrc
COPY tmux.conf /root/.tmux.conf
COPY tool-versions /root/.tool-versions
COPY zshrc /root/.zshrc
COPY coc-settings.json /root/.vim/coc-settings.json
COPY netrc /root/.netrc
COPY gitconfig /root/.gitconfig

RUN git clone https://github.com/asdf-vm/asdf.git /root/.asdf
RUN bash -c ". /root/.asdf/asdf.sh && \
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git && \
  asdf install"

RUN timeout 80 vim || true

CMD ["tail", "-f", "/dev/null"]
