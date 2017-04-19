{% extends "base_slides.md" %}
{% block slides %}
name: sadrzaj

# Sadržaj

- [Jezici specifični za domen](#jsd)
- [JSD primeri](#jsd-primeri)
- [Prednosti upotrebe](#prednosti)
- [Tehnologije za parsiranje](#tehnologije-za-parsiranje)
- [Primeri upotrebe](#primeri)
- [textX](#textX)

---
name: jsd
class: center, middle

# Jezici specifični za domen

---
layout: true

.section[[JSD](#sadrzaj)]

---

## Jezici specifični za domen - JSD (*Domain-Specific Languages - DSL*)

- Jezici specifični za domen (JSD, eng. *Domain-Specific Languages - DSL*)
  su jezici prilagođeni i ograničeni na određeni domen problema.
- Za razliku od jezika opšte namene (JON, eng. *General Purpose Language -
  GPL*), nude povećanje ekspresivnosti kroz upotrebu koncepata i notacija
  prilagođenih domenu problema i domenskim ekspertima.
- Nazivaju se još i *mali jezici* (eng. *little languages*).
- Uspešan JSD je fokusiran na uzak, dobro definisan domen i pokriva ga na
  odgovarajući način.
- Domen često ima svoj jezik korišćen od strane domenskih eksperata iako ne
  postoji njegova implementacija na računaru.

  

---
name: jsd-primeri
layout: false
class: center, middle

# Primeri JSD

---
layout: true

.section[[Primeri JSD](#sadrzaj)]

---

## SQL

```sql
SELECT player, stadium
    FROM game JOIN goal ON (id=matchid)
```

---

## JPA mapiranje

```java
@Entity
@Table(name="COURSES")
public class Course {

  private long courseId;
  private String courseName;

  public Course() {
  }

  public Course(String courseName) {
    this.courseName = courseName;
  }

  @Id
  @GeneratedValue
  @Column(name="COURSE_ID")
  public long getCourseId() {
    return this.courseId;
  }
}
```

---

## Build jezici (Ant/Maven/Gradle)

![](jsd/Ant-Maven-Gradle.png)

---

## Poslovni procesi - BPMN

![](jsd/BPMN.png)

---

## Mobilne aplikacije

![:scale 70%](jsd/MobilneAplikacije.png)

.footer[
  Kelly, S. & Tolvanen, J.-P. *Domain-Specific Modeling: Enabling Full Code
    Generation*, Wiley-IEEE Computer Society Pr, 2008
]
            
---

## Ali i...

![:scale 80%](jsd/MusicNotation-External.png)

---

## ili...

![:scale 70%](jsd/ChessNotation.png)

---

## Kada jezik smatramo JSD-om?

- Zavisi od toga šta nam je domen.
- Jezik može biti više ili manje prilagođen nekom domenu.
- U ekstremnom slučaju i opšti jezik kao što je Java možemo smatrati JSD-om ako
  nam je domen "razvoj softvera". Naravno, iako tačno u teorijskom smislu, u
  praktičnom gubimo sve prednosti JSD.
- Dobar JSD pokriva uzak, dobro definisan domen (domen problema). Koristi samo
  koncepte ciljnog domena, ograničen je na dati domen i samim tim je iskazivanje
  rešenja jezgrovitije i jasnije domenskim ekspertima.
- Čest je slučaj da jezik nastane kao JSD ali se vremenom proširi do te mere da
  ga možemo smatrati JON.

---
name: prednosti
layout: false
class: center, middle

# Prednosti upotrebe

---
layout: true

.section[[Prednosti](#sadrzaj)]

---


## Uticaj na produktivnost

- Pojedine studije pokazuju da povećanje produktivnosti ide i do 1000% .ref[1].
- Šta je osnovni razlog za povećanje produktivnosti?
 
.footer[
MetaCase, *Nokia case study*, tech. rep., MetaCase, 2007
]
  
  
---

## Problem mentalnog mapiranja

![](jsd/MentalnoMapiranje-1.svg)

.footer[
  Dmitriev, S. *Language oriented programming: The next programming
    paradigm *, JetBrains onBoard, 2004.
]

---

## Rešenje upotrebom JSD

![](jsd/MentalnoMapiranje-2.svg)

.footer[
  Dmitriev, S. *Language oriented programming: The next programming
    paradigm *, JetBrains onBoard, 2004.
]

---


## Zašto JSD?

- JSD su koncizniji od jezika opšte namene što omogućava korisnicima da jasnije
  iskažu svoju nameru.
- JSD sintaksa, bilo tekstualna ili grafička, može se prilagoditi i
  približiti domenskim ekspertima.
- Koncepti korišćeni u JSD su koncepti problemskog (poslovnog) domena što
  pod određenim uslovima omogućava da domenski eksperti direktno koriste JSD bez
  posredovanja programera.
- Upotrebom koncepata problemskog domena izbegava se ručno mapiranje na koncepte
  ciljne implementacione platforme. Taj posao se obavlja automatski upotrebom
  JSD prevodioca (kompajlera ili generatora koda).
- Iskazivanje rešenja konceptima nezavisnim od korišćene tehnologije rezultuje
  dužim životnim vekom aplikacije.
- Samodokumentujući jezički iskazi.

---

## Uticaj na kvalitet softvera

- Korišćenje koncepata domena problema dovodi do smanjenja broja linija koda (u
  terminologiji tekstualnih notacija), što ima pozitivan uticaj na brzinu
  razvoja i jednostavnost odžavanja.
- Smanjenje broja linija koda ide i do **50 puta** u pojedinim domenima primene.
  Gustina softverskih grešaka (broj softverskih grešaka na hiljadu linija koda)
  ne zavisi značajno od jezika koji se koristi.
- Iz toga se može zaključiti da JSD kroz smanjenje broja linija koda posredno
  utiču na smanjenje apsolutnog broja softverskih grešaka što povećava kvalitet
  softverskog proizvoda i smanjuje cenu održavanja.
- Prevođenje koda na ciljnu platformu (kompajliranje) će rezultovati
  konzistentnim kodom.


---

## Uticaj na evoluciju aplikacije

- Iskazivanje rešenja konceptima nezavisnim od korišćene tehnologije rezultuje
  dužim životnim vekom aplikacije.
- Nije potrebno menjati jezičke iskaze (programe/modele) kada dođe do promene
  tehnologije. Potrebno je promenu uneti u generator koda.
  

---
name: arhitekture
layout: false
class: center, middle

# Arhitekture

---
layout: true

.section[[Arhitekture](#sadrzaj)]

---

## Arhitektura bazirana na prevodiocima

![:scale 60%](jsd/Arhitektura-kompajler.svg)

---


## Arhitektura bazirana na interpreterima

![](jsd/Arhitektura-interpreter.svg)


---
name: gradivni
layout: false
class: center, middle

# Gradivni elementi

---
layout: true

.section[[Gradivni elementi](#sadrzaj)]

---

## Gradivni elementi JSD

Kao i svaki softverski jezik i JSD se sastoji od:
- Apstraktne sintakse
- Jedne ili više konkretnih sintaksi
- Semantike

---


## Apstraktna sintaksa

- Određuje pravila validnosti iskaza sa stanovišta njegove strukture.
- Definiše koncepte domena, njihove osobine i međusobne relacije
- Jezici za definisanje apstraktnih sintaksi jezika se u domenu modelovanja
  nazivaju meta-meta-modelima.ref[1].

.footer[
1. Preciznije, meta-metamodel je apstraktna sintaksa takvog jezika. Jezik još
    čine i konkretne sintakse i semantika.
]

---

## Primer - apstraktna sintaksa jezika za opis konačnih automata

![:scale 90%](jsd/StateMachine.svg)

.footer[
  I. Dejanović, *Prilog metodama brzog razvoja softvera na bazi proširivih
  jezičkih specifikacija*. PhD thesis, Faculty of Technical Sciences, University of
  Novi Sad, January 2012
]

---

## Stablo apstraktne sintakse

- Svaki iskaz na datom jeziku se može na apstraktan način opisati stablom
  apstraktne sintakse (*Abstract Syntax Tree*).
- Konkretna sintaksa nije važna u tom slučaju (na primer, ako posmatramo program
  na Javi tada ključne reči nisu deo stabla apstraktne sintakse).

---

## Primer stabla apstraktne sintakse

![:scale 65%](jsd/AbstractSyntaxTree.svg)

.footer[
http://en.wikipedia.org/wiki/Abstract_syntax_tree
]

---

## Konkretna sintaksa

- Da bi mogli da prikažemo iskaz na konkretan način potrebna nam je konkretna
  sintaksa.
- Konkretna sintaksa definiše *izgled* iskaza na nekom jeziku, odnosno u
  širem smislu definiše i načine interakcije korisnika sa jezičkim iskazima tj.
  predstavlja interfejs jezik-korisnik.
- Iako nam je dovoljna jedna konkretna sintaksa za jedan jezik, možemo ih imati
  više.
  
---

## Konkretna sintaksa

Primer istog iskaza upotrebom dve različite konkretne sintakse

![:scale 70%](jsd/RazliciteSintakse.png)

.footer.small[
  I. Dejanović, *Prilog metodama brzog razvoja softvera na bazi proširivih
  jezičkih specifikacija*. PhD thesis, Faculty of Technical Sciences, University of
  Novi Sad, January 2012
]

---

## Semantika

- Definiše smisao jezičkih iskaza.
- Iako postoje i druge tehnike u praksi se najčešće semantika definiše
  prevođenjem (kompajliranjem tj. generisanjem koda) na jezik koji već ima
  definisanu semantiku putem prevodioca na niže jezike ili interpretera (npr.
  virtualne mašine).
- Najčešće su ciljni jezici na koje se JSD prevodi jezici opšte namene.
- *Primer:* generisanje Java programskog koda iz JSD jezičkog iskaza.
- Jezici se prevode na sve "niže" i "niže". Gde je kraj prevođenju? Mašinski
  jezik. Definisan u hardveru računara (procesoru).
  

---
name: tehnologije-za-parsiranje
class: center, middle
layout: false

# Tehnologije za parsiranje

---
layout: true

.section[[Tehnologije za parsiranje](#sadrzaj)]

---

## Tehnologije za parsiranje

- Arpeggio
- parglare
- textX

---
## Arpeggio

- 100% Python kod
- MIT licenca
- Definisanje gramatike putem Python izraza ili putem PEG notacije
- Puna podrška za semantičku analizu
- Dobra podrška za debagovanje
- Vizualizacija stabla parsiranja i modela parsera upotrebom GraphViz biblioteke.
- Dobra prijava grešaka
- Mogućnost višestruke analize istog stabla parsiranja
- https://github.com/igordejanovic/arpeggio/

---

![](jsd/Arpeggio.svg)

---
## parglare

- 100% Python kod
- Najmlađi projekat od sva tri - Jan. 2017.
- LR(1) parser. U planu GLR implementacija.
- Gramatika se zadaje tekstualnim DSL-om.
- Podrška za asocijativnost i prioritet.
- Podrška za upravljanje white-space i komentarima.
- Brži od Arpeggio parsera

---
## parglare - primer gramatike

.medium[
```python
from parglare import Parser, Grammar

grammar = r"""
E = E '+' E  {left, 1}
  | E '-' E  {left, 1}
  | E '*' E  {left, 2}
  | E '/' E  {left, 2}
  | E '^' E  {right, 3}
  | '(' E ')';
E = number;
number = /\d+(\.\d+)?/;
"""

actions = {
    "E:0": lambda _, nodes: nodes[0] + nodes[2],
    "E:1": lambda _, nodes: nodes[0] - nodes[2],
    "E:2": lambda _, nodes: nodes[0] * nodes[2],
    "E:3": lambda _, nodes: nodes[0] / nodes[2],
    "E:4": lambda _, nodes: nodes[0] ** nodes[2],
    "E:5": lambda _, nodes: nodes[1],
    "E:6": lambda _, nodes: nodes[0],
    "number": lambda _, value: float(value),
}

g = Grammar.from_string(grammar)
parser = Parser(g, debug=True, actions=actions)

result = parser.parse("34 + 4.6 / 2 * 4^2^2 + 78")

print("Result = ", result)
```
]

---
## textX

- 100% Python kod
- MIT licenca
- Istovremeno definisanje gramatike i meta-modela -
  inspirisan [Xtext](https://eclipse.org/Xtext/)
- Automatska konstrukcija modela - podrška za razrešavane referenci
- Podrška za veze tipa celina-deo
- Kontrola parsiranja (*whitespaces, case, keywords*...)
- Postprocesiranje objekata modela ili celog modela
- Modularizacija gramatika - import
- Vizualizacija modela i meta-modela 
- "Najmoćniji" i najpopularniji alat od sva tri.
- Dokumentacija i tutorijali dostupni na http://igordejanovic.net/textX/

---

![](jsd/textX.png)


---
name: primeri
class: center, middle
layout: false

# Primeri upotrebe

---
layout: true

.section[[Primeri upotrebe](#sadrzaj)]

---
## pyFlies - DSL za kognitivne eksperimente

![:scale 90%](jsd/pyFliesGUI.png)

---
## pyFlies - DSL za kognitivne eksperimente

![](jsd/pyFliesArchitecture.svg)

---
## pyTabs - DSL za gitarske tablature

![:scale 50%](jsd/pyTabs.png)

---
## Energetska elektronika

Specifikacija komponenti i šema.


![:scale 90%](jsd/schematic_editor.png)

---
## Analiza *legacy* koda

![:scale 70%](jsd/atf.png)


---
name: textX
class: center, middle
layout: false

# [textX](../tech/textx.html)


.footer[
Prati [textX link](../tech/textx.html).
]
{% endblock %}