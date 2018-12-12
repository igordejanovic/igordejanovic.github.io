---
title: Master teme
layout: page
sidebar: false
---

Sve master teme su iz oblasti inženjerstva jezika (*Language Engineering*).

## Slobodne

- Podrška za bojenje koda i navigaciju za ugrađene (*embedded*) editore i jezike
  bazirane na [textX](https://github.com/igordejanovic/textX) /
  [parglare](https://github.com/igordejanovic/parglare/) (2 teme - textX, parglare)

  Videti:
  <br>[QScintilla](https://qscintilla.com/)
  <br>[Qt for Python - PySide](https://wiki.qt.io/Qt_for_Python)

- Podrška za IntelliSense u jezicima baziranim na [parglare
  biblioteci](https://github.com/igordejanovic/parglare/) u Visual Studio Code.
  
  Videti:
  <br>[textX-vscode](https://github.com/textX-tools/textX-vscode)

- Podrška za strukturu i bojenje koda u jezicima baziranim na [parglare
  biblioteci](https://github.com/igordejanovic/parglare/) u Visual Studio Code.

  Videti:
  <br>[textX-extensions](https://github.com/textX-tools/textX-extensions)
  <br>[textX-vscode](https://github.com/textX-tools/textX-vscode)

- Podrška za vizualizaciju jezika baziranih na [parglare
  biblioteci](https://github.com/igordejanovic/parglare/)

  Videti:
  <br>[viewX-vscode](https://github.com/textX-tools/viewX-vscode)
  
- Debager za [parglare](https://github.com/igordejanovic/parglare/) parser

  Prikaz tekućeg stanja parsera i parcijalnih stabala. Korak po korak
  izvršavanje. Osmisliti protokol komunikacije sa instancom parsera.
  
- Podrška za [pyFlies DSL](https://github.com/igordejanovic/pyFlies) u Visual
  Studio Code

  Videti:
  <br>[textX](https://github.com/igordejanovic/textX)
  <br>[textX-vscode](https://github.com/textX-tools/textX-vscode)

## U izradi

- Milorad Vojnović: DSL za generisanje API testova za GraphQL upite

- Željko Bal: Jezik za opis i automatsko generisanje CLI i GUI interfejsa.
  <br><https://github.com/zeljko-bal/CID>
  
- Milan Šović: Minimalna jezička infastruktura za bojenje koda, sklapanje
  (folding) i Intellisense za jezike bazirane na
  [textX-u](https://github.com/igordejanovic/textX)
 
  Rad započet: oktobar 2018. 
  <br>Opis: Na osnovu textX gramatike, i dodatnih DSL-ova po potrebi, generisati
  minimalni web bazirani editor sa bojenjem koda, sklapanjem i komunikacijom sa
  [Language Server Protocol
  serverom](https://github.com/textX-tools/textX-languageserver) (podrškom za
  IntelliSense). Editor treba da ima minimalne zavisnosti tako da se može
  korisiti u različitim kontekstima (na web-u, kao ugrađeni, kao deo desktop
  aplikacija, kao test editor pri razvoju gramatike i sl.)


## Završene (u 2018)

- Filip Frank: Jezik za podršku ekstrakciji podataka iz nestrukturiranih izvora
  podataka sa veba, oktobar 2018.
  <br><https://github.com/Pazzo92/scraping-dsl>

- Daniel Elero: Server i ekstenzija za VS Code okruženje za podršku jezicima
  baziranim na textX alatu, septembar 2018.
  <br><https://github.com/textX-tools/textX-languageserver>
  <br><https://github.com/textX-tools/textX-vscode>

- Daniel Kupčo: Podrška vizualizaciji jezika kreiranih upotrebom textX
  biblioteke u okviru Visual Studio Code editora, septembar 2018.
  <br><https://github.com/textX-tools/viewX-vscode>

- Nemanja Starčev: Podrška vizualizaciji strukture i bojenju koda u Visual
  Studio Code editoru za jezike bazirane na textX alatu, jun 2018.
  <br><https://github.com/textX-tools/textX-extensions>
