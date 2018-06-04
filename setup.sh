#!/bin/bash

# Install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install solarized colors
cd ~/.vim/bundle
git clone git://github.com/altercation/vim-colors-solarized.git
mv vim-colors-solarized ~/.vim/bundle/

# Copy over .vimrc
mv .vimrc ~/.vimrc

# Clean up
cd ..
rm -rf vimrc
