class: center, middle

# Softverski obrasci i komponente
## Projektni zadatak

.author[ [Igor Dejanović](http://igordejanovic.net/) ]

.small[[Fakultet tehničkih nauka u Novom Sadu](http://ftn.uns.ac.rs/)] </br>
.small[[Katedra za informatiku](http://informatika.ftn.uns.ac.rs/)]

.created[{{now|dtformat("%d.%m.%Y u %H:%M")}}]


---

## Tema zadatka

- **Ex**tensible **P**latform for **S**tructure **V**isualization and
  **N**avigation (**ExP**re**S**si**V**e**N**ess).
- Vizualizacija i navigacija nad strukturama tipa grafa.
- Promenjivi modeli: razne vrste *POPO* (*Plain Old Python Object*) objektnih
  grafova.
- Promenjive konkretne sintakse.
- Brz pregled i navigacija.
- Operacije: *pan, point zoom in/out, tree outline, bird-view, filter,
    search,* dobijanje detalja o tekućem objektu itd.
- Opciono: konzola za upravljanje platformom: izmena sintaksi, izmena modela
  itd.
  
---

## Motivacija

- Vizualizacija kao pomoć u razumevanju međuzavisnosti objekata realnih
  softverskih sistema.
- Pomoć u analizi složenih softverskih sistema kod npr. reinženjeringa.

- Primeri:

  - Vizualizacija šeme baze podataka – isčitavanje metapodataka proizvoljne baze
    i prikaz zavisnosti između tabela.
  - Vizualizacija strukture programskog koda – parsiranje proizvoljnog
    programskog koda i prikaz veza nasleđivanja, referenciranja i sl.

---

## Tehnologije

- Integraciona platforma – Python `setuptools` (`pkg_resources`)
- GUI - Web (HTML, CSS, JavaScript), [Flask](http://flask.pocoo.org/)
  ili [Django](https://www.djangoproject.com/).
- Vizualizacija - [d3](https://d3js.org/).


---

## Različite sintakse

- Izmenjive sintakse realizovane kao nezavisne komponente.
- Osnovna sintaksa – labelirani usmereni graf.
- Složenije sintakse – sintaksa tipa UML dijagrama klasa, sintakse za opis
  procesa, sintakse za opis složenih hijerarhija itd.
  
---

## Modeli

- Obični Python objekti (POPOs – *Plain Old Python Objects*).
- Modeli ne znaju za vizualizaciju (sledi se MVC obrazac).
- Modeli se mogu adaptirati za različite konkretne sintakse.
- Adaptacija se obavlja eksternim adapterima.
- Otvorena pitanja:

  - Izvori modela.
  - Mehanizmi kreiranja objektnih grafova.


