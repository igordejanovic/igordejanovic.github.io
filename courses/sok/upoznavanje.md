{% extends "base_slides.md" %}
{% block slides %}

## Opšte informacije

- Broj ESPB: 4
- Fond časova: 3+3
- Predmetni nastavnik: dr Igor Dejanović, igord na uns.ac.rs
- Predmetni asistenti: 
  - MSc Željko Ivković, zeljkoi na uns.ac.rs (za SIIT-NS i E2)
  - BSc Miloš Simić, milossimicsimo na gmail.com (za SIIT-Loznica)

- Materijali su dostupni na sajtu enastava.io i na ovom sajtu
- Komunikacija se obavlja preko google grupe:
  - https://groups.google.com/d/forum/sok-e2-2017 za E2
  - https://groups.google.com/d/forum/sok-siit-2017 za SIIT u NS
- Informacije o ispitima:
  - https://groups.google.com/d/forum/dejanovic-ispiti

  
---

## Cilj predmeta

- Osposobljavanje za primenu komponentno baziranog razvoja (*Component-Based
  Development - CBD*)
- Osposobljavanje za prepoznavanje i primenu softverskih obrazaca
- Savladavanje modernih tehnologija baziranih na komponentnom razvoju
- Integracija postojećih, slobodno dostupnih komponenti i rešenja u cilju
  izgradnje složenih softverskih proizvoda

---
## Struktura ocene

.center-table[
| Praktični deo | Teorija |
|:-------------:|:-------:|
|           60% |     40% |
]

---

## Projekat

- Timski rad - timovi od 4 ± 1 studenta
- Obavezna upotreba sistema za kontrolu verzija (git)
- Obavezna upotreba sistema za upravljanje projektom (GitLab)

---

## Projekat - raspodela bodova

.center-table[
| Aktivnost                 | Bodovi |
|---------------------------|:------:|
| Model komponenti          |     10 |
| Implementacija komponenti |     20 |
| Implementacija projekta   |     18 |
| Git aktivnost             |      6 |
| Gitlab aktivnost          |      6 |
| **Ukupno**                | **60** |
]

---
## Ukus SOK-a - prezentacije starijih generacija

- Gen. 2007/08 – Generički IDE za razvoj (*Code Editor – CodEd*): Swing,
  OSGI(Apache Felix)
  
    - Multi-level tim – cela nastavna grupa je veliki tim koji se deli na
      podtimove
    - Podrška za proizvoljne programske jezike (specijalizacija za Javu): custom
      parser, syntax highlighting, code outline, search/replace...
      
---
## Ukus SOK-a - prezentacije starijih generacija

- Gen. 2008/09 – Extensible Graph Analysis and Transformation Engine (ExGATE):
  Swing, OSGI (Eclipse Eqinox).

  - Pojedinačni timovi
  - Generiči editor za kreiranje, analizu, transformaciju i vizuelizaciju
    grafova
  - Podrška za pretrage grafova, layouting, generisanje...

---
## Prezentacija ExGERM tima

<iframe width="380" height="245" allowfullscreen
    src="https://www.youtube.com/embed/qOWJA0aa_JM">
</iframe>
<iframe width="380" height="245" allowfullscreen
    src="https://www.youtube.com/embed/eBd7YdmPZt4">
</iframe>

---
## Generacija 2011-2015

- **Ex**tensible **P**latform for **S**tructure **V**isualization and
    **N**avigation (**ExP**re**S**si**V**e**N**ess)
- Vizualizacija i navigacija nad strukturama tipa grafa
- Promenjivi modeli: razne vrste POJO objektnih grafova
- Promenjive konkretne sintakse
- Brz pregled i navigacija
- Operacije: pan, point zoom in/out, tree outline, bird-view, filter,
  search, dobijanje detalja o tekućem objektu itd
- Opciono: konzola za upravljanje platformom: izmena sintaksi,
    izmena modela itd

- Tehnologije:
  - Integraciona platforma – Eclipse Equinox (OSGi)
  - GUI – Eclipse Rich Client Platform (RCP) + SWT/JFace
  - Vizualizacija grafova – GEF (Draw2d, Zest)
  - I naravno: git i GitLab

---

## Generacija 2016-

.medium[

- **Ex**tensible **P**latform for **S**tructure **V**isualization and
    **N**avigation (**ExP**re**S**si**V**e**N**ess)
- Vizualizacija i navigacija nad strukturama tipa grafa
- Promenjivi modeli: razne vrste POPO objektnih grafova
- Promenjive konkretne sintakse
- Brz pregled i navigacija
- Operacije: pan, point zoom in/out, tree outline, bird-view, filter,
  search, dobijanje detalja o tekućem objektu itd
- Opciono: konzola za upravljanje platformom: izmena sintaksi,
    izmena modela itd
- Tehnologije:
  - Integraciona platforma – Python setuptools
  - Server strana: [Django](https://www.djangoproject.com/)
  - Baza: [MongoDB](https://www.mongodb.com/), [SQLite](https://www.sqlite.org/)
    ili [PostgreSQL](https://www.postgresql.org/)
  - GUI – HTML, CSS, JavaScript
  - Vizualizacija grafova – [D3.js](https://d3js.org/)
  
]

---
## Literatura

- E. Gamma, R. Helm, R. Johnson, and J. M. Vlissides, *Design Patterns: Elements
    of Reusable Object-Oriented Software*, Addison-Wesley Professional, 1994

- C. Szyperski, *Component Software: Beyond Object-Oriented Programming*,
    Addison-Wesley Longman Publishing Co., Inc., 2002

- Allen B.
  Downey,
  [Think Python 2nd Edition](http://greenteapress.com/wp/think-python-2e/)

- [The Python Tutorial](https://docs.python.org/3/tutorial/index.html)

- [Package Discovery and Resource Access using pkg_resources](http://setuptools.readthedocs.io/en/latest/pkg_resources.html)

    

{% endblock %}
