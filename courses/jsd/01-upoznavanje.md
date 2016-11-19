class: center, middle

# Jezici specifični za domen
## upoznavanje sa predmetom

.author[ [Igor Dejanović](http://igordejanovic.net/) ]

.small[[Fakultet tehničkih nauka u Novom Sadu](http://ftn.uns.ac.rs/)] </br>
.small[[Katedra za informatiku](http://informatika.ftn.uns.ac.rs/)]


.footnote[2016]


---

# Opšte informacije

- Broj ESPB: 6
- Fond časova: 3+3
- Predmetni nastavnik: [dr Igor Dejanović](http://igordejanovic.net) (igord na
  uns ac rs)
- Predmetni asistent: MSc. Renata Vaderna (renatav na uns ac rs)
- Stranica predmeta: [http://www.informatika.ftn.uns.ac.rs/JSD]()
- Konsultacije se obavljaju po potrebi uz najavu na email

---
# Cilj predmeta

- Osposobljavanje studenata za dizajniranje i implementaciju softverskih jezika
  namenjenih za uske domene ljudske delatnosti (Domain-Specific Language – DSL) uz
  primenu savremenih metoda, tehnika i alata.
- Savladavanje modernih tehnologija za razvoj DSL-ova uz oslonac na
  programskih jezik Pyhon i alate: Arpeggio i textX.

---
# Zašto koristiti jezike specifične za domen?

- Prilagođenost domenu omogućava jednostavnije opisivanje
  rešenja problema. Koriste se koncepti domena.
- Pojedine studije pokazuju da povećanje produktivnosti ide i do
  1000% u poređenju sa jezicima opšte namene. .ref[*]
- Domenski eksperti mogu direktno koristiti DSL-ove jer je to
  jezik njihovog domena.
- Ideal kome težimo:
  - Softver inženjeri kreiraju i evoluiraju jezike, alate i mapiranje
    na ciljne tehničke platforme.
  - Domenski eksperti definišu konkretna rešenja upotrebom
    DSL-a.

.footer[.ref[*]MetaCase, “Nokia case study,” tech. rep., MetaCase, 2007]

---
# Tematske celine

.medium[

1. Uvod u programski jezik Pyhon
1. Uvod u DSL-ove (motivacija)
1. Tekstualne sintakse i parsiranje -
   [Arpeggio](https://github.com/igordejanovic/Arpeggio)
1. Apstraktne, konkretne sintakse i metamodelovanje
1. [textX](https://github.com/igordejanovic/textX)
1. [textX-tools](https://github.com/igordejanovic/textx-tools)
1. Postavka projektnog zadatka - diskusija
1. Primeri -
   DOMMLite i [ER](https://github.com/igordejanovic/textx-lang-er),
   [pyFlies](https://github.com/igordejanovic/pyflies),
   [mobl](http://www.mobl-lang.org/).
1. Transformacije, generisanje koda i interpretiranje -
   [Jinja2](http://jinja.pocoo.org/docs/dev/)
1. Java bazirani alati - [Xtext](http://www.eclipse.org/Xtext/)
   i [Spoofax](http://strategoxt.org/Spoofax)
1. Grafičke sintakse (editori, vizualizatori, layouting, routing) -
   [Graphviz i dot](http://www.graphviz.org/)
   [GMF](http://www.eclipse.org/modeling/gmf/),
   [Graphitti](http://www.eclipse.org/graphiti/),
   [Spray](https://code.google.com/a/eclipselabs.org/p/spray/)
1. Ograničenja, sistem tipova, scoping, linking.
1. Domeni, jezici i njihova hijerarhija.
1. Prezentacije projekata i diskusija
1. Koevolucija jezika

]
---

# Struktura ocene

- Predispitne obaveze - 60%
- Teorijski deo ispita - 40%

---

# Projekat

- Timski rad - timovi od 4±1 studenta.
- Obavezna upotreba sistema za kontrolu verzija (Git).
- Obavezna upotreba sistema za upravljanje projektom (GitLab).

---

# Projekat - raspodela bodova

.center-table[
| Aktivnost             | bodovi |
|-----------------------|:------:|
| Dizajn jezika         |     20 |
| Implementacija jezika |     20 |
| Git aktivnost         |     10 |
| Gitlab aktivnost      |     10 |
| **Ukupno**            |     60 |
]

.paznja[I pored timskog rada svi bodovi se dobijaju individualno.]


---

# Literatura za predmet

- M. Völter, *DSL Engineering: Designing, Implementing and Using
  Domain-Specific Languages*. 2013.
- S. Kelly and J.-P. Tolvanen, *Domain-Specific Modeling: Enabling Full Code
  Generation.* Wiley-IEEE Computer Society Pr, March 2008
- A. Kleppe, *Software language engineering: creating domain-specific languages
  using metamodels.* Addison-Wesley, 2009
- Beazley, David M. *Python essential reference*. Addison-Wesley Professional,
  2009.
