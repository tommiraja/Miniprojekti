# Yhteenveto kehityspalvelin yhdellä komennolla 

(Täältä pääset lukemaan kokonaisen raportin: https://github.com/tommiraja/Miniprojekti/blob/d0c35fdbc992469dec2cbd411e2d78af4e04bc7c/README.md)

Patrick ja Tommi toteuttivat projektin, jonka tavoitteena oli rakentaa devauspalvelin, joka käynnistyy käyttövalmiiksi yhdellä komennolla: vagrant up. Ratkaisu automatisoi koko ympäristön pystytyksen ja soveltuu työelämän tilanteisiin, joissa tarvitaan nopeasti toistettavia kehitys‑ ja testausympäristöjä.

Projektin tavoitteena on automatisoida kehityspalvelimen asennus ja konfigurointi, jotta manuaalista työtä ja virheille alttiita toistuvia vaiheita voidaan vähentää. Ratkaisu toteutetaan Infrastructure as Code -periaatteella hyödyntäen Vagrantia ja masterless-tilassa toimivaa Saltia. Tarkoituksena on rakentaa yksinkertainen mutta toimiva kokonaisuus, jota voidaan helposti laajentaa ja kehittää jatkossa..


## Ympäristö

Työ tehtiin Windows 11 Home + PowerShell -ympäristöissä.

Virtuaalikoneena Debian 13 Trixie.

Yhteistyö: projektin repositorio GitHubissa ja kommunikointi Discordissa.


## Työvaiheet

### 1. GitHub-repositorion valmistelu

- Luotiin yhteinen repo ja lisättiin:
- Salt-tiedostot
- Kloonaus SSH-avainparilla.
- Testattiin muutoksien toimiva synkronointi: git add, commit, push, pull.

### 2. Salt-kansiorakenne
   
- Luotiin kansio srv/salt/ ja sen alle ympäristön tilat:
- Kansio	Tarkoitus
- eka/	Sovelluspakettien asennus (python, wget, curl, vim jne.)
- toka/	SSH-palvelimen asennus ja käynnistys
- kolmas/	UFW-palomuurin asennus
- neljas/	Apache2-asennus
- top.sls	Määrittelee kaikkien yllä olevien tilojen soveltamisen
- Salt ajettiin virtuaalikoneessa komennolla:

### 3. Vagrantfile
   
- Rakennettiin Vagrantfile, joka:
- Lataa Debianin (debian/bullseye64).
- Synkronoi Saltin tilat VM:ään.
- Asentaa Salt-minionin käyttäen Broadcomin virallista repo‑asennusta.
- Suorittaa Saltin automaattisesti (state.apply) käynnistyksen yhteydessä.
- Tämän ansiosta koko ympäristö asentuu täysin automaattisesti komennolla:

### 4. Testaus
   
- Molemmat ajoivat projektin omissa ympäristöissään.
- Vagrant & Salt automatisoivat kaiken onnistuneesti.
- Ainoa näkyvä huomio oli Saltin antamat varoitukset vanhenevista Python-moduuleista, jotka eivät vaikuta toimivuuteen.
  
## Lopputulos

- Toimiva masterless‑Salt + Vagrant -kehityspalvelin.
- Täysin idempotentti ympäristö.
- Yhden komennon käyttöönotto.
- Selkeä ja laajennettavissa oleva rakenne.





