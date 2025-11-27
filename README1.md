Patrick Raportti


Aloitin projektin kloonaamalla Tommin github sivun SSH: osoitteen jonka annoin komennoksi virtuaalikoneelleni

`git clone git@github.com:tommiraja/Miniprojekti.git`

Sen jälkeen vaihdoin vielä varmuuden vuoksi koneen ajan oikeaan 

`sudo timedatectl set-time`
`sudo apt-get update`

Kun olin saanut nämä tehtyä kokeilin sainko muutoksia aikaan yhteisellä Github sivustollamme muokkaamalla README.md tiedostoa
Sirryin ensiksi `cd /Miniprojekti` kansioon ja sitten

`sudo nano README.md`
`git add .`
`git commit`
`git pull`
`git push`

Vola! tiedostoon oli tullut muutos!

Tämän jälkeen aloin lisäämään init.sls tiedostoja saltin avulla

`mkdir -p /Miniprojekti/srv/salt/eka`
`mkdir -p /Miniprojekti/srv/salt/toka`
`mkdir -p /Miniprojekti/srv/salt/kolmas`
`mkdir -p /Miniprojekti/srv/salt/neljäs`

Näiden jälkeen tein jo valmiiksi top.sls tiedoston 

`mkdir -p /Miniprojekti/srv/salt/top.sls`

Sinne lisäsin kaikki init.sls tiedostot 


