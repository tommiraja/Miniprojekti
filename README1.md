Yhteenveto: Kehityspalvelin yhdellä komennolla (Vagrant + Salt masterless)
Patrick ja Tommi toteuttivat projektin, jonka tavoitteena oli rakentaa devauspalvelin, joka käynnistyy käyttövalmiiksi yhdellä komennolla: vagrant up. Ratkaisu automatisoi koko ympäristön pystytyksen ja soveltuu työelämän tilanteisiin, joissa tarvitaan nopeasti toistettavia kehitys‑ ja testausympäristöjä.

Projektin idea ja tavoitteet
Automatisoida kehityspalvelimen asennus ja konfigurointi.

Välttää manuaalinen työ ja virheherkät toistot.

Toteuttaa “Infra as Code” käyttäen Vagrantia + Saltia (masterless).

Rakentaa yksinkertainen mutta toimiva kokonaisuus, jota voi laajentaa.

Ympäristö
Työ tehtiin Windows 11 Home + PowerShell -ympäristöissä.

Virtuaalikoneena Debian 13 Trixie.

Yhteistyö: projektin repositorio GitHubissa ja kommunikointi Discordissa.

Työvaiheet
1. GitHub-repositorion valmistelu
Luotiin yhteinen repo ja lisättiin:

README.md

GNU GPLv3 -lisenssi

Salt-tiedostot

Kloonaus SSH-avainparilla.

Testattiin muutoksien toimiva synkronointi: git add, commit, push, pull.

2. Salt-kansiorakenne
Luotiin kansio srv/salt/ ja sen alle ympäristön tilat:

Kansio	Tarkoitus
eka/	Sovelluspakettien asennus (python, wget, curl, vim jne.)
toka/	SSH-palvelimen asennus ja käynnistys
kolmas/	UFW-palomuurin asennus
neljas/	Apache2-asennus
top.sls	Määrittelee kaikkien yllä olevien tilojen soveltamisen
Salt ajettiin virtuaalikoneessa komennolla:

sudo salt-call --local state.apply
Tuloksena idempotenssi (ei muutettavaa), koska tilat toteutettiin jo Vagrantin kautta.

3. Vagrantfile
Rakennettiin Vagrantfile, joka:

Lataa Debianin (debian/bullseye64).

Synkronoi Saltin tilat VM:ään.

Asentaa Salt-minionin käyttäen Broadcomin virallista repo‑asennusta.

Poistaa master‑konfiguraation ja vaihtaa tilaan file_client: local.

Suorittaa Saltin automaattisesti (state.apply) käynnistyksen yhteydessä.

Tämän ansiosta koko ympäristö asentuu täysin automaattisesti komennolla:

vagrant up
4. Testaus
Molemmat ajoivat projektin omissa ympäristöissään.

Vagrant & Salt automatisoivat kaiken onnistuneesti.

Ainoa näkyvä huomio oli Saltin antamat varoitukset vanhenevista Python-moduuleista, jotka eivät vaikuta toimivuuteen.

Lopputulos
Toimiva masterless‑Salt + Vagrant -kehityspalvelin.

Täysin idempotentti ympäristö.

Yhden komennon käyttöönotto.

Selkeä ja laajennettavissa oleva rakenne.


Käytimme avainten lisäämiseen Teron ohjeita jotka löysimme täältä: Install Salt https://terokarvinen.com/install-salt-on-debian-13-trixie/


Loimme kansiot top fileen johon käytimme Teron antamia ohjeita täältä: http://terokarvinen.com/2024/hello-salt-infra-as-code/

top fileen saimme apua täältä vaikka top file oli hyvin jo muistissa ennestään, mutta aina on hyvä tarkistaa https://docs.saltproject.io/en/latest/ref/states/top.html

Vagrantfileä tehdessä käytimme teron ohjeita joita löysimme täältä https://terokarvinen.com/2021/two-machine-virtual-network-with-debian-11-bullseye-and-vagrant/ mutta tarvitsimme myös tekoälyn käyttöä vagrantfile:lle koska yritimme alkuun ajaa teron versioita mutta emme saaneet saltia toimimaan koska se ei asentunut automaattisesti käynnistyksen yhteydessä. (APT ei löytänyt salt pakettia)

Täältä löysimme apua boot-strap skriptiin jota käytimme vagrantfilessämme: https://smrtalek.medium.com/setup-for-a-saltstack-vagrant-environment-c5b720010e4c




