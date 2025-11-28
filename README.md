# Kehityspalvelin yhden napin painalluksella!

- Yhdistimme Patrickin kanssa aivomme ja noin puolentunnin aiheen miettimisen jälkeen päädyimme luomaan devaus-palvelinta, jonka saa käyttöön yhdellä napin painalluksella tai tarkemmin `vagrant up` komennolla.

- Devauspalvelin tulee sisältämään sille ominaiset komponentit:
    - Apache infrapalvelun
    - Sovellusympäristön Python
    - Konfiguraatiohallinnan Saltin avulla
    - SSH-pääsyn

- Tässä siis ideana se, että manuaalisen asennuksen työ vältetään ja automatisoidaan devauspalvelimen käyttöönotto. Ideaalitilanne työelämässä, jossa devaustiimi tarvitsee mahdollisimman nopeasti ja yksinkertaisesti uusia testausympäristöjä käyttöönsä eri projekteissa. Pureudutaan syvemmälle aiheeseen!

- Projektin tarkoituksena on soveltaa kurssilla opittuja asioita käytännönläheisesti ja mahdollisimman yksinkertaisella tavalla, sekä tehdä projektista helposti toteutettavan.

# Alkuvalmistelut - Yhdessä työskentely

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

`eka` = Varmistaa että kaikki sovellus paketit ladataan (python, wget, curl, vim)

`toka` = Asentaa SSH-palvelimen, käynnistää ja asettaa sen käynnistymään automaattisesti

`kolmas` = Asentaa helppokäyttöisen palomuurin, mutta ei ota sitä vielä käyttöön 

`neljäs` = Varmistaa että apache2 paketti on asennettuna 


- Tein muutokset kaikkiin init.sls tiedostoihin ja kokeilin toimiko top.sls tiedosto

<img width="538" height="696" alt="image" src="https://github.com/user-attachments/assets/fbaeac50-c0e8-4159-a8b3-1570c5e55cf5" />

## Vagrant-filen konfigurointia

- Tämän jälkeen teimme vagrant filen johon käytimme Teron antamia ohjeita: https://terokarvinen.com/2023/salt-vagrant/#infra-as-code---your-wishes-as-a-text-file

- Liitimme valmiin tiedosto pohjan vagrant tiedostoon ja lisäsimme meidän tekemän top.sls tiedoston polun

- Jotta pystyimme liittymään vagrantin avulla gittiin otimme ssh-avaimen komentokehotteesta ja liitimme sen githubiin

`ssh-keygen`

`cat /.ssh/id_ed25519.pub` (public tärkeä sillä se on julkinen avain)

- Tämän jälkeen pääsimme yhdistämään projektirepoomme

`git clone` komennolla



## Lähteet

Palvelinten hallinta: https://terokarvinen.com/palvelinten-hallinta/

Salt Vagrant: https://terokarvinen.com/2023/salt-vagrant/#infra-as-code---your-wishes-as-a-text-file



