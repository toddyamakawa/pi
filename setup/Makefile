
update:
	sudo apt-get update

vim: /usr/bin/vim
zsh: /usr/bin/zsh
tmux: /usr/bin/tmux

xclip: /usr/bin/xclip
bc: /usr/bin/bc

automake: /usr/bin/automake

libtool: brew
	sudo apt-get -y install libtool

# --- brew ---
brew: /usr/local/bin/brew
/usr/local/bin/brew: $(HOME)/.linuxbrew/bin/brew
	sudo ln -s $(HOME)/.linuxbrew/bin/brew /usr/local/bin/brew
$(HOME)/.linuxbrew/bin/brew:
	git clone https://github.com/Linuxbrew/brew.git $(HOME)/.linuxbrew

apache:
	sudo apt-get -y install apache2 php5 libapache2-mod-php5

mail: /etc/ssmtp/ssmtp.conf /usr/bin/mail

/etc/ssmtp/ssmtp.conf:
	sudo apt-get -y install ssmtp
	sudo chmod 600 /etc/ssmtp/ssmtp.conf

/usr/bin/mail:
	sudo apt-get -y install mailutils

localtime:
	sudo rm /etc/localtime
	sudo ln -s /usr/share/zoneinfo/US/Central /etc/localtime

# --- /usr/bin/* ---
/usr/bin/%:
	sudo apt-get -y install $(@:/usr/bin/%=%)

