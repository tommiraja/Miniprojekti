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


ensi

<img width="276" height="275" alt="image" src="https://github.com/user-attachments/assets/fb9950e5-2454-43ba-9c0c-4ea515ddf953" />

toka

<img width="302" height="197" alt="image" src="https://github.com/user-attachments/assets/6083d36c-b769-4bfe-b31e-91cceaadf46c" />

kolmas

<img width="243" height="75" alt="image" src="https://github.com/user-attachments/assets/e646603b-4ecc-453f-8146-4cd5ec901b30" />

neljäs

<img width="245" height="76" alt="image" src="https://github.com/user-attachments/assets/a120f057-3f26-4089-803c-07d922d05950" />

toppi

<img width="203" height="138" alt="image" src="https://github.com/user-attachments/assets/642a3a34-0d5e-42eb-916c-a7d4d8c68972" />


Käytimme avainten lisäämiseen Teron ohjeita jotka löysimme täältä: Install Salt https://terokarvinen.com/install-salt-on-debian-13-trixie/

Raportin kirjoittaminen: https://terokarvinen.com/2006/06/04/raportin-kirjoittaminen-4/

Loimme kansiot top fileen johon käytimme Teron antamia ohjeita täältä: http://terokarvinen.com/2024/hello-salt-infra-as-code/

top fileen saimme apua täältä vaikka top file oli hyvin jo muistissa ennestään, mutta aina on hyvä tarkistaa https://docs.saltproject.io/en/latest/ref/states/top.html

Vagrantfileä tehdessä käytimme teron ohjeita joita löysimme täältä https://terokarvinen.com/2021/two-machine-virtual-network-with-debian-11-bullseye-and-vagrant/ mutta tarvitsimme myös tekoälyn käyttöä vagrantfile:lle koska yritimme alkuun ajaa teron versioita mutta emme saaneet saltia toimimaan koska se ei asentunut automaattisesti käynnistyksen yhteydessä. (APT ei löytänyt salt pakettia)

Chat gpt promptit 
- Miten saamme ladattua saltin, sillein että käynnistyksen yhteydessä ei tule unable to locate package: salt-minion
- 


