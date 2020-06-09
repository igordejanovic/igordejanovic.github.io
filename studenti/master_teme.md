---
title: Master teme
layout: page
sidebar: false
---

Sve master teme su iz oblasti inženjerstva jezika (*Language Engineering*).

## Slobodne

- DSL za opis pravila i interpretaciju tekstualnih igara (interactive fiction)
  - [A curated list of interactive fiction frameworks, tools, and resources](https://github.com/tajmone/awesome-interactive-fiction)
  
  Istražiti postojeće jezike i editore za opis IF igara. Osmisliti i
  implementirati jezik za modelovanje IF igara upotrebom
  [textX-a](https://github.com/textX/textX/) ili
  [parglare-a](https://github.com/igordejanovic/parglare). Implementirati
  interpreter modela. Kao studiju slučaja implementirati proizvoljnu igru.

- Web bazirani debager za [parglare] parser

  Prikaz tekućeg stanja parsera (GSS strukture) i parcijalnih stabala. Korak po
  korak izvršavanje. Osmisliti protokol komunikacije sa instancom parsera.
  Upotreba WebSocket-a i asinhronog programiranja u Python-u. Vizualizacija u
  Web browser-u upotrebom d3js ili druge JavaScript biblioteke.
  
- Podrška za AST->text transformacije (2 teme - [textX], [parglare]) 
  <br> Videti [textX#36](https://github.com/textX/textX/issues/36)

- Podrška za *indentation/column-based* jezike
  <br> Videti
  [textX#44](https://github.com/textX/textX/issues/44),
  [parglare#5](https://github.com/igordejanovic/parglare/issues/5)

- Podrška za bojenje koda i navigaciju za ugrađene (*embedded*) editore i jezike
  bazirane na [textX] / [parglare] (2 teme - textX, parglare)

  Videti:
  <br>[QScintilla](https://qscintilla.com/)
  <br>[Qt for Python - PySide](https://wiki.qt.io/Qt_for_Python)

- Podrška za IntelliSense u jezicima baziranim na [parglare] biblioteci u Visual
  Studio Code.
  
  Videti:
  <br>[textX-vscode]

- Podrška za strukturu i bojenje koda u jezicima baziranim na [parglare]
  biblioteci u Visual Studio Code.

  Videti:
  <br>[textX-extensions]
  <br>[textX-vscode]

- Podrška za vizualizaciju jezika baziranih na [parglare] biblioteci.

  Videti:
  <br>[viewX-vscode]
  
- Podrška za [pyFlies DSL] u Visual Studio Code

  Videti:
  <br>[textX]
  <br>[textX-vscode]


## U izradi

- Dragutin Marjanović: Upotreba
  [zio-telemetry](https://github.com/zio/zio-telemetry) za prikupljanje i
  analizu tragova u distribuiranim sistemima baziranim na mikroservisnim
  arhitekturama
  
  Rad započet: decembar 2019.
  
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


## Završene

- Stefan Ristanović: Jezik i interpreter za integraciju i automatizaciju REST
  baziranih aplikacija
  <br>Rad započet: april 2019.
  <br>Odbranjeno: mart 2020.

  <br>Opis: Kreirati DSL (tekstualni i opciono grafički) za definisanje REST
  baziranih procesa i integraciju automatizaciju REST servisa. Implementaciju
  uraditi uz oslonac na [textX] i [VS Code]. Primer: [Zapier](https://zapier.com/).

- Milorad Vojnović: DSL za generisanje API testova za GraphQL upite.
  <br>Rad započet: avgust 2018.
  <br>Odbranjeno: septembar 2019.

- Željko Bal: Jezik za opis i automatsko generisanje CLI i GUI interfejsa,
  mart 2019. 
  <br><https://github.com/zeljko-bal/CID>
  
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


[textX]: https://github.com/textX/textX
[parglare]: https://github.com/igordejanovic/parglare
[textX-vscode]: https://github.com/textX/textX-vscode
[textX-extensions]: https://github.com/textX/textX-extensions
[viewX-vscode]: https://github.com/textX/viewX-vscode
[pyFlies DSL]: https://github.com/igordejanovic/pyFlies
[VS Code]: https://code.visualstudio.com/
