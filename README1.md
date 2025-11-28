# Patrickin konfigurointia

## Salt tiedostot

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

Näihin kansioihin lisään palomuurin, apachen, sovellusympäristön pythonilla sekä ssh:n 

Näiden jälkeen tein jo valmiiksi top.sls tiedoston 

`mkdir -p /Miniprojekti/srv/salt/top.sls`

Sinne lisäsin kaikki init.sls tiedostot 

<img width="170" height="169" alt="image" src="https://github.com/user-attachments/assets/66f8f18c-ad81-4e1d-b7bf-1426190a5283" />

<img width="913" height="352" alt="image" src="https://github.com/user-attachments/assets/9d2e3cf2-4b57-4c9d-9685-b917d0aec792" />

Tein muutokset kaikkiin init.sls tiedostoihin ja kokeilin toimiko top.sls tiedosto

<img width="538" height="696" alt="image" src="https://github.com/user-attachments/assets/fbaeac50-c0e8-4159-a8b3-1570c5e55cf5" />

tulosteesta vielä huomaa että tuloste on idempotenssi


