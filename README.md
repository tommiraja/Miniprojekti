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

Toteutamme työn kotikoneiltamme Windows 11 Home PowerShellin kautta Vagrantilla, sekä Debian 13 Trixie virtuaalikoneympäristössä.

 Tässä vielä kuva Debian13 ympäristön ominaisuuksista.

<img width="513" height="386" alt="image" src="https://github.com/user-attachments/assets/bf6225dd-5945-4b51-9b37-0d5c6e460784" />

Kommunikointiin käytimme Discord palvelua, jossa olimme aina kun työstimme projektia.

## Alkuvalmistelut - Yhdessä työskentely 27.11.2025

Alkuun loimme yhdessä miniprojektin repon ja jaoimme sen toisillemme.

Varmistimme että reposotioon liitämme seuraavat asiat repositioon:
- README:md
- GNU 3.0 Licence
 
<img width="746" height="429" alt="image" src="https://github.com/user-attachments/assets/b5ffa365-f8fb-496c-be3f-c685c32ea521" />

Täältä löysimme kloonaamiseen suunnatun SSH osoitteen:

<img width="400" height="133" alt="image" src="https://github.com/user-attachments/assets/b33e8a3f-e9fd-44b6-9a8d-581dcc9cb898" />


## Konfigurointia yhdessä pohdiskellen

### Salt tiedostot

Aloitimme projektin kloonaamalla Tommin github sivun SSH: osoitteen jonka annoimme komennoksi virtuaalikoneelle.

`git clone git@github.com:tommiraja/Miniprojekti.git`

Sen jälkeen vaihdoimme vielä varmuuden vuoksi koneen ajan oikeaan.

`sudo timedatectl set-time`

`sudo apt-get update`

Kun olimme saaneet nämä tehtyä kokeilimme saammeko muutoksia aikaan yhteisellä Github sivustollamme muokkaamalla README.md tiedostoa.
  
Sirryimme ensiksi `cd /Miniprojekti` kansioon ja sitten

`sudo nano README.md`

`git add .`

`git commit`

`git pull`

`git push`

Vola! tiedostoon oli tullut muutos!

Tämän jälkeen aloimme lisäämään init.sls tiedostoja saltin avulla.

`mkdir -p /Miniprojekti/srv/salt/eka`

`mkdir -p /Miniprojekti/srv/salt/toka`

`mkdir -p /Miniprojekti/srv/salt/kolmas`

`mkdir -p /Miniprojekti/srv/salt/neljäs`

Näihin kansioihin lisäsimme palomuurin, apachen, sovellusympäristön pythonilla sekä ssh:n. 

Näiden jälkeen teimme jo valmiiksi top.sls tiedoston. 

`mkdir -p /Miniprojekti/srv/salt/top.sls`

Sinne lisäsimme kaikki init.sls tiedostot.

Tältä näytti nyt tekemämme srv/salt kansio Githubissa:

<img width="913" height="352" alt="image" src="https://github.com/user-attachments/assets/9d2e3cf2-4b57-4c9d-9685-b917d0aec792" />

Tiedostot nyt sisälsivät:

`eka` 

<img width="276" height="275" alt="image" src="https://github.com/user-attachments/assets/fb9950e5-2454-43ba-9c0c-4ea515ddf953" />

= Varmistaa että kaikki sovellus paketit ladataan (python, wget, curl, vim).

`toka` 

<img width="302" height="197" alt="image" src="https://github.com/user-attachments/assets/6083d36c-b769-4bfe-b31e-91cceaadf46c" />

= Asentaa SSH-palvelimen, käynnistää ja asettaa sen käynnistymään automaattisesti.

`kolmas` 

<img width="243" height="75" alt="image" src="https://github.com/user-attachments/assets/e646603b-4ecc-453f-8146-4cd5ec901b30" />

= Asentaa helppokäyttöisen palomuurin, mutta ei ota sitä vielä käyttöön.

`neljäs` 

<img width="245" height="76" alt="image" src="https://github.com/user-attachments/assets/a120f057-3f26-4089-803c-07d922d05950" />

= Varmistaa että apache2 paketti on asennettuna. 

Tässä vielä yhteenvetona toppi filessä:

<img width="203" height="138" alt="image" src="https://github.com/user-attachments/assets/642a3a34-0d5e-42eb-916c-a7d4d8c68972" />

Teimme muutokset kaikkiin init.sls tiedostoihin ja kokeilin toimiko top.sls tiedosto virtuaalikoneen kautta.

`sudo salt-call --local state.apply`

<img width="538" height="696" alt="image" src="https://github.com/user-attachments/assets/fbaeac50-c0e8-4159-a8b3-1570c5e55cf5" />

Lopuksi oli vielä tärkeä committaa muutokset githubiin.

`git add .`

`git commit`

`git pull`

`git push`

## Vagrant-filen konfigurointia 28.11.2025

Tämän jälkeen teimme vagrant filen johon käytimme Teron antamia ohjeita: https://terokarvinen.com/2023/salt-vagrant/#infra-as-code---your-wishes-as-a-text-file

Liitimme valmiin tiedosto pohjan vagrant tiedostoon ja lisäsimme meidän tekemän top.sls tiedoston polun.

Jotta pystyimme liittymään vagrantin avulla gittiin otimme ssh-avaimen komentokehotteesta ja liitimme sen githubiin.

`ssh-keygen`

`cat /.ssh/id_ed25519.pub` (public tärkeä sillä se on julkinen avain)

Tämän jälkeen pääsimme yhdistämään projektirepoomme.

`git clone` komennolla

Kokeilimme vielä Patrickin powershell ympäristössä saimmeko vagrantin ssh yhteydellä Miniprojektin toimimaan tähän siis käytimme komentoja.

`cd /Miniprojekti/vagrant`

`vagrant up`

`vagrant ssh`

Kun pääsimme devausympäristöön tarkistimme onko paketit valmiina ladattu.

`sudo salt-call --local state.apply`

<img width="578" height="1005" alt="image" src="https://github.com/user-attachments/assets/5d5201d1-4118-42b7-9522-7599960aea55" />

Tuloste oli suoraan idempotenssilla, sillä paketit latautuivat kun vagrant up komento oli ajettu.

Kuitenkin virhe komentoja tuli näkyviin tulosteiden yläreunassa, jotka tarkoittivat että paketit olivat vanhentunemassa mutta saltin jotkut moduulit vielä käyttävät sitä. 

## Lähteet

Palvelinten hallinta: https://terokarvinen.com/palvelinten-hallinta/

Salt Vagrant: https://terokarvinen.com/2023/salt-vagrant/#infra-as-code---your-wishes-as-a-text-file

Vagrant https://terokarvinen.com/2021/two-machine-virtual-network-with-debian-11-bullseye-and-vagrant/

Setup for Salt Vagrant Environment https://smrtalek.medium.com/setup-for-a-saltstack-vagrant-environment-c5b720010e4c

The Top File https://docs.saltproject.io/en/latest/ref/states/top.html

Hello Salt Infra as a Code http://terokarvinen.com/2024/hello-salt-infra-as-code/

Raportin kirjoittaminen: https://terokarvinen.com/2006/06/04/raportin-kirjoittaminen-4/

Install Salt on Debian 13 Trixie https://terokarvinen.com/install-salt-on-debian-13-trixie/

Käytimme myös lähteinä tunneilta opiskeltuja asioita, joita olimme ottaneet muistiinpanoiksi.

Chat gpt promptit 
- Miten saamme ladattua saltin, sillein että käynnistyksen yhteydessä ei tule unable to locate package: salt-minion
- Mitkä olisivat ominaisia init.sls tiedostoja valmiille palvelinympäristölle?



