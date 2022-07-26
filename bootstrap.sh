#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull;

function doIt() {
        pkg install -y rsync tree file build-essential git openssh binutils libandroid-spawn python perl-rename ffmpeg youtubedr termux-api qpdf poppler exiftool ripgrep termux-exec imagemagick traceroute;
        /data/data/com.termux/files/usr/bin/python3 -m pip install --upgrade pip;
        pip install youtube-dl tinyapi;
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
  --exclude "git-completion.bash" --exclude "git-prompt.bash" \
  --exclude "dircolors" --exclude "aliases.bash" --exclude "functions.bash" \
  --exclude "thaiwordlist.txt" --exclude "en_words_huge.txt" --exclude "en_words_big.txt" --exclude "en_words.txt" \
          -avh . ~;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;

