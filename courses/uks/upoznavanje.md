{% extends "base_slides.md" %}
{% block slides %}

## Opšte informacije

- Broj ESPB: 6
- Fond časova: 3+3
- Predmetni nastavnik: [dr Igor Dejanović](http://igordejanovic.net) (igord na
  uns ac rs)
- Predmetni asistent: MSc. Miloš Simić (milossimicsimo na gmail)
- Stranica predmeta: http://informatika.ftn.uns.ac.rs/UKS
- Google grupa: https://groups.google.com/forum/#!forum/kzi-uks
- Konsultacije se obavljaju po potrebi uz najavu na email

---

## Šta predstavlja upravljanje konfiguracijom softvera?

- Upravljanje konifiguracijom softvera (*Software Configuration Management*)
  predstavlja disciplinu koja se bavi kontrolisanom evolucijom složenih
  softverskih sistema.

.footer[J. Estublier, *Software configuration management: a roadmap*, in
  Proceedings of the conference on The future of Software engineering, pp.
  279–289, ACM, 2000]

---

## Zašto koristiti SCM?


- Softverski proizvodi često “žive” godinama pa čak i decenijama.
- Softverski proizvodi su često izuzetno kompleksni.
- Da bi obezbedili kontinualnu evoluciju moramo uvesti procese, tehnike i alate
  koji će to omogućiti.
- Praksa je pokazala da je uspeh projekta direktno povezan sa upotrebom
  efikasnih SCM tehnika i alata.
- Prva 4 na listi od 12 koraka za bolji razvoj softvera.ref[1] istaknutog softver
  inženjera, pisca i autora izuzetno popularnog
  servisa
  [StackOverflow](http://stackoverflow.com/) [Joela Spolskog](http://www.joelonsoftware.com/AboutMe.html) predstavljaju
  SCM tehnike (kontrola verzija izvornog koda, automatizovana i kontinualna
  izgradnja i praćenje grešaka).


.footer[.ref[1] J. Spolsky, The joel test: 12 steps to better code, August 2000.]


---

## Zašto koristiti SCM?

- Podrška za paralelni rad. Ručno spajanje paralelnih izmena nije ni malo
  zabavno.
- Upotreba SCM alata, pre svega distribuiranih sistema za kontrolu verzija je
  dovela do pojave tzv. društvenog kodiranja
  ([Social Coding](http://www.techrepublic.com/blog/it-consultant/social-coding-the-next-wave-in-development/))
  i servisa kao što
  su [GitHub](https://github.com/), [BitBucket](https://bitbucket.org/) i dr.
  Ovo je omogućilo eksploziju razvoja slobodnog softvera.
--

- Zato što vam to traži poslodavac.
--

- Zato što vam to traži klijent.
--

- **Savet:** Ako firma ne koristi SCM tehnike (pre svega kontrolu verzija)
  zapitajte se da li želite da radite u takvoj firmi.


---

##  Cilj predmeta

- Savladavanje teoretskih osnova discipline upravljanja konfiguracijom softvera
  (*Software Configuration Management*).
- Osposobljavanje za uvođenje i primenu procesa upravljanja konfiguracijom
  softvera.
- Upoznavanje sa industrijskim standardima, okvirima i alatima iz oblasti
  upravljanja konfiguracijom softvera.
- Savladavanje modernih SCM tehnologija (Git, pytest, GitHub/GitLab/Gogs,
  Docker, Travis, ReviewBoard, Mylyn).

---

## Struktura ocene

- Predispitne obaveze - 60%
- Teorijski deo ispita - 40%


---

## Projekat

- Timski rad - timovi od 4±1 studenta.
- Obavezna upotreba sistema za kontrolu verzija ([Git](https://git-scm.com/)).
- Obavezna upotreba sistema za praćenje projekta ([GitHub](https://github.com/)).

---

## Projekat - raspodela bodova

.medium.center-table[
| Aktivnost               | Bodovi |
|-------------------------|:------:|
| Model                   |      6 |
| Implementacija projekta |     20 |
| Implementacija testova  |      6 |
| Git                     |     10 |
| GitHub                  |     10 |
| SCM                     |      8 |
| **Ukupno**              | **60** |
]

.paznja[I pored timskog rada svi bodovi se dobijaju individualno.]

---

## Plan izvođenja nastave

.medium[
1. Upoznavanje sa predmetom
1. Programski jezik Python
1. [Django framework](https://www.djangoproject.com/)
1. Osnove upravljanja konfiguracijom softvera
1. Upravljanje izvornim kodom (*Source Code Management*)
1. Sistemi za kontrolu verzija (Subversion, Mercurial, Git)
1. Upravljanje promenama (*Change Control*). Postavka zadatka.
1. Analiza i dizajn sistema za upravljanje konfiguracijom softvera
1. SCM sistemi (GitLab/GitHub, Gogs, Trac, RedMine, Review Board...)
1. Upravljanje izgradnom i uvođenjem softvera (*Build
   Management and Deployment* - [Docker](https://www.docker.com/))
1. Upravljanje izdanjima (*Release Management*)
1. Diskusije i analiza progresa po timovima
1. Demonstracije projekata
]

---

## Projektni zadatak

- Veb aplikacija za upravljanje promenama.
- Slično GitHub-u.
- Od zahteva za promenom do uvođenja i puštanja u rad.
- Veza prema promenama u izvornom kodu - koristiti GitHub.
- Krajnji cilj: definisan SCM proces za upravljanje promenama, podržan
  aplikacijom. Preći na sopstvenu aplikaciju u upravljanju projektom
  ([dogfooding](https://en.wikipedia.org/wiki/Eating_your_own_dog_food))

---

## Osnove upravljanja konfiguracijom softvera

- Osnovni pojmovi i koncepti.
- Šta sve obuhvata SCM? Koji su razlozi uvođenja?
- Tradicionalno i moderna shvatanja SCM discipline.
- SCM procesi.
- SCM obrasci i preporučena praksa (*best practice*).
- SCM alati.
- SCM industrijski okviri i standardi.


---

## Upravljanje izvornim kodom (*Source Code Management*)

- Algoritmi i modeli. Distribuirani i centralizovani sistemi.
- Upravljanje alternativnih tokovima razvoja. Grananje.
- Formiranje osnovne linije (*Baseline*).
- Upravljanje konkurentnim radom. Optimističko i pesimističko
  zaključavanje.
- Preporučena praksa.
- Alati.

---

## Sistemi za kontrolu verzija

- Pregled osnovnih osobina najpopularnijih alata za kontrolu
  verzija (Subversion, Mercurial, Bazaar, Git).
- Detaljno upoznavanje sa Git alatom.

---

## Upravljanje promenama (*Change Control*)

- Šta predstavlja upravljanje promenama?
- Kakve sve promene mogu nastati i u kojim fazama životnog ciklusa?
- Kako se promene prate? Životni ciklus zahteva za promenom.
- Kako se analizira uticaj promena na komponente sistema?
- Izveštavanje.

---

## Upravljanje izgradnjom i uvođenje (*Build and Deploy*)

- Šta predstavlja izgradnja a šta uvođenje softvera?
- Zašto je potrebno postupak automatizovati?
- Kako se izgradnja i uvođenje mogu automatizovati?
- Šta predstavlja kontinualna izgradnja (*Continuous
  Build*) i kontinualna dostava (*Continuous Delivery*)?
- Puppet, Fabric, Travis, Docker, ...


---

## Upravljanje izdanjima (*Release Management*)

- Šta predstavlja izdanje softvera?
- Zašto je bitno da uvedemo upravljanje u ovaj segment?
- Tehnike vođenja verzija izdanja?
- Alternativna izdanja.
- Sledljivost i povezivanje izdanja za komponente i njihove
  verzije od kojih je izdanje kreirano.

---

## Literatura za predmet


- J. Humble and D. Farley, *Continuous delivery: reliable software releases
  through build, test and deployment automation* Addison-Wesley Professional,
  2010
- S. Berczuk and B. Appleton, *Software configuration management patterns:
  effective teamwork, practical integration* Addison-Wesley Professional, 2003
- M. Handbook, *Configuration management guidance, tech. rep., MIL-HDBK-61A
  (SE)* Department of Defense–United States of America, 2001
- Scott Chacon and Ben Straub, [Pro Git](https://git-scm.com/book/en/v2).
  APress, 2014.
- Beazley, David M. *Python essential reference* Addison-Wesley Professional,
  2009.
- [The Python Tutorial](https://docs.python.org/release/3.4.0/tutorial/)
- David Mertz, [Functional Programming in
  Python](http://www.oreilly.com/programming/free/functional-programmi

{% endblock %}
