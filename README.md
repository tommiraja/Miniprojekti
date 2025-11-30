# Kehityspalvelin yhden napin painalluksella!

- Yhdistimme Patrickin kanssa aivomme ja noin puolentunnin aiheen miettimisen jälkeen päädyimme luomaan devaus-palvelinta, jonka saa käyttöön yhdellä napin painalluksella tai tarkemmin `vagrant up` komennolla.

- Devauspalvelin tulee sisältämään sille ominaiset komponentit:
    - Apache infrapalvelun
    - Sovellusympäristön Python
    - Konfiguraatiohallinnan Saltin avulla
    - SSH-pääsyn

- Tässä siis ideana se, että manuaalisen asennuksen työ vältetään ja automatisoidaan devauspalvelimen käyttöönotto. Ideaalitilanne työelämässä, jossa devaustiimi tarvitsee mahdollisimman nopeasti ja yksinkertaisesti uusia testausympäristöjä käyttöönsä eri projekteissa. Pureudutaan syvemmälle aiheeseen!

- Projektin tarkoituksena on soveltaa kurssilla opittuja asioita käytännönläheisesti ja mahdollisimman yksinkertaisella tavalla, sekä tehdä projektista helposti toteutettavan.
# Ympäristön kuvaus
- Toteutamme työn kotikoneiltamme Windows 11 Home PowerShellin kautta Vagrantilla, sekä Debian 13 Trixie virtuaalikoneympäristössä.
# Alkuvalmistelut - Yhdessä työskentely 27.11.2025

- Alkuun loimme yhdessä miniprojektin repon ja jaoimme sen toisillemme


<img width="520" height="281" alt="image" src="https://github.com/user-attachments/assets/7c58e49a-3d26-4522-83f6-8e20af1b80b5" />

## Patrickin konfigurointia yhdessä pohdiskellen

### Salt tiedostot

- Aloitin projektin kloonaamalla Tommin github sivun SSH: osoitteen jonka annoin komennoksi virtuaalikoneelleni

`git clone git@github.com:tommiraja/Miniprojekti.git`

 - Sen jälkeen vaihdoin vielä varmuuden vuoksi koneen ajan oikeaan 

`sudo timedatectl set-time`

`sudo apt-get update`

- Kun olin saanut nämä tehtyä kokeilin sainko muutoksia aikaan yhteisellä Github sivustollamme muokkaamalla README.md tiedostoa
Sirryin ensiksi `cd /Miniprojekti` kansioon ja sitten

`sudo nano README.md`

`git add .`

`git commit`

`git pull`

`git push`

- Vola! tiedostoon oli tullut muutos!

- Tämän jälkeen aloin lisäämään init.sls tiedostoja saltin avulla

`mkdir -p /Miniprojekti/srv/salt/eka`

`mkdir -p /Miniprojekti/srv/salt/toka`

`mkdir -p /Miniprojekti/srv/salt/kolmas`

`mkdir -p /Miniprojekti/srv/salt/neljäs`

- Näihin kansioihin lisään palomuurin, apachen, sovellusympäristön pythonilla sekä ssh:n 

- Näiden jälkeen tein jo valmiiksi top.sls tiedoston 

`mkdir -p /Miniprojekti/srv/salt/top.sls`

- Sinne lisäsin kaikki init.sls tiedostot 

<img width="170" height="169" alt="image" src="https://github.com/user-attachments/assets/66f8f18c-ad81-4e1d-b7bf-1426190a5283" />

<img width="913" height="352" alt="image" src="https://github.com/user-attachments/assets/9d2e3cf2-4b57-4c9d-9685-b917d0aec792" />

- Eli tiedostot nyt sisältävät

`eka` 

<img width="276" height="275" alt="image" src="https://github.com/user-attachments/assets/fb9950e5-2454-43ba-9c0c-4ea515ddf953" />

= Varmistaa että kaikki sovellus paketit ladataan (python, wget, curl, vim)

`toka` 

<img width="302" height="197" alt="image" src="https://github.com/user-attachments/assets/6083d36c-b769-4bfe-b31e-91cceaadf46c" />

= Asentaa SSH-palvelimen, käynnistää ja asettaa sen käynnistymään automaattisesti

`kolmas` 

<img width="243" height="75" alt="image" src="https://github.com/user-attachments/assets/e646603b-4ecc-453f-8146-4cd5ec901b30" />

= Asentaa helppokäyttöisen palomuurin, mutta ei ota sitä vielä käyttöön 

`neljäs` 

<img width="245" height="76" alt="image" src="https://github.com/user-attachments/assets/a120f057-3f26-4089-803c-07d922d05950" />

= Varmistaa että apache2 paketti on asennettuna 

Tässä vielä yhteenvetona toppi filessä:

<img width="203" height="138" alt="image" src="https://github.com/user-attachments/assets/642a3a34-0d5e-42eb-916c-a7d4d8c68972" />

- Tein muutokset kaikkiin init.sls tiedostoihin ja kokeilin toimiko top.sls tiedosto

<img width="538" height="696" alt="image" src="https://github.com/user-attachments/assets/fbaeac50-c0e8-4159-a8b3-1570c5e55cf5" />

## Vagrant-filen konfigurointia 28.11.2025

- Tämän jälkeen teimme vagrant filen johon käytimme Teron antamia ohjeita: https://terokarvinen.com/2023/salt-vagrant/#infra-as-code---your-wishes-as-a-text-file

- Liitimme valmiin tiedosto pohjan vagrant tiedostoon ja lisäsimme meidän tekemän top.sls tiedoston polun

- Jotta pystyimme liittymään vagrantin avulla gittiin otimme ssh-avaimen komentokehotteesta ja liitimme sen githubiin

`ssh-keygen`

`cat /.ssh/id_ed25519.pub` (public tärkeä sillä se on julkinen avain)

- Tämän jälkeen pääsimme yhdistämään projektirepoomme

`git clone` komennolla

Kokeilimme vielä Patrickin powershell ympäristössä saimmeko vagrantin ssh yhteydellä Miniprojektin toimimaan tähän siis käytimme komentoja

`cd /Miniprojekti/vagrant`

`vagrant up`

`vagrant ssh`

Kun pääsimme devausympäristöön tarkistimme onko paketit valmiina ladattu 

`sudo salt-call --local state.apply`

<img width="578" height="1005" alt="image" src="https://github.com/user-attachments/assets/5d5201d1-4118-42b7-9522-7599960aea55" />

Tuloste oli suoraan idempotenssilla, sillä paketit latautuivat kun vagrant up komento oli ajettu.

Kuitenkin virhe komentoja tuli näkyviin tulosteiden yläreunassa, jotka tarkoittivat että paketit olivat vanhentunemassa mutta saltin jotkut moduulit vielä käyttävät sitä. 

## Lähteet

Palvelinten hallinta: https://terokarvinen.com/palvelinten-hallinta/

Salt Vagrant: https://terokarvinen.com/2023/salt-vagrant/#infra-as-code---your-wishes-as-a-text-file



