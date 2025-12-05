# Postgresql
alias psql-start='sudo systemctl start postgresql.service && echo "Postgresql service started" && nohup ~/pgadmin4/bin/pgadmin4 &'
alias psql-stop='sudo systemctl stop postgresql.service && echo "Postgresql service stoped" && pkill pgadmin4'
alias psql-status='sudo systemctl status postgresql.service'
alias psql-restart='sudo systemctl restart postgresql.service'

#export GTK_THEME=Sweet-Ambar-Blue-Dark-v40



# Docker
alias docker-start='sudo systemctl start docker.socket docker.service'
alias docker-stop='sudo systemctl stop docker.service docker.socket'
alias docker-status='sudo systemctl status docker'
alias docker-restart='sudo systemctl restart docker'
alias docker-exec='docker exec -it -u $1 $2 bash'



# Mis alias
#alias clear='printf "\033[2J\033[3J\033[1;1H" && neofetch'
source $(dirname $(gem which colorls))/tab_complete.sh
alias ll='colorls --sd'
# alias ytdown='~/Music/.ytdown'
alias clear='clear && echo -e "Last login: $last_login"'
alias ip-get="ip route get 1.1.1.1 | awk '{print \$7}'"



# PHP
#alias mysql='/opt/lampp/bin/mysql'
#alias set-php7='sudo xampp stop && sudo mv /opt/lampp /opt/lampp8 && sudo mv /opt/lampp7 /opt/lampp && sudo xampp start'
#alias set-php8='sudo xampp stop && sudo mv /opt/lampp /opt/lampp7 && sudo mv /opt/lampp8 /opt/lampp && sudo xampp start'
alias set-php7='sudo systemctl stop httpd mariadb && sudo /opt/lampp/xampp start'
alias set-php8='sudo /opt/lampp/xampp stop && sudo systemctl start httpd mariadb'
alias php-v='/opt/lampp/bin/php --version'



#alias sudo-sync='for ((i=0;i<10;i++)) do sudo sync && sudo sysctl -w vm.drop_caches=3 && sudo sync'
alias sudo-sync='sudo sync && sudo sysctl -w vm.drop_caches=3 && sudo sync'
alias off='shutdown -h now'
alias set-bright='brightnessctl set '
alias service='sudo systemctl '
alias feh-random='feh --bg-fill ~/.pictures/$(($RANDOM % $( ls ~/.pictures | wc -l ))).jpg'
alias py='python'
alias netr='sudo systemctl restart NetworkManager.service'
alias pacman-syu='sudo pacman -Syu --noconfirm'