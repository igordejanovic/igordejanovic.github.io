+++
title = "Информације за пројекат"
draft = false
creator = "Emacs 28.2 (Org mode 9.6 + ox-hugo)"
weight = 3002
+++

## Teme {#teme}

-   Predloženi projekti moraju biti bazirani na textX ili parglare bibliotekama.
-   Mogu biti JSD implementacije ili unapređenja pomenutih biblioteka.
-   Jezici mogu da definišu i podršku za editore (code completion, syntax
    highlighting itd. za npr. VS Code) -- poželjno posebno kod većih timova.
    Videti projekte [textX-LS](https://github.com/textX/textX-LS) i [Language Server Protocol](https://microsoft.github.io/language-server-protocol/).


## O vođenju projekta {#o-vođenju-projekta}

-   Svi projekti moraju biti otvorenog koda javno hostovani na GitHub-u. Izbor
    licence se ostavlja članovima tima, ali mora biti [OSI odobrena](https://opensource.org/licenses).
-   Predlog se piše u README fajlu projekta i šalje se link predmetnom profesoru
    na odobrenje.
-   Zadaci na projektu se definišu u sklopu [GitHub issues](https://github.com/features/issues/).
-   Tekuće stanje se prati upotrebom [Kanban table](https://docs.github.com/en/issues/organizing-your-work-with-project-boards/managing-project-boards/about-project-boards).


## Potrebno proveriti pre slanja profesoru na pregled {#potrebno-proveriti-pre-slanja-profesoru-na-pregled}

-   Projekat može da se instalira u modu za razvoj sa `pip install -e`.
    -   Da bi ovo bilo moguće projekat mora imati `setup.py` odnosno `setup.cfg` sa
        validnim meta-podacima.
    -   Proverite da li `python setup.py bdist_wheel` pakuje sve potrebne fajlove u
        rezultujći wheel fajl.
    -   Ukoliko se ispravno podesi projekat je moguće instalirati u virtuelno
        okruženje upotrebom pip komande direktno iz git repozitorijuma. Na primer:
        ```sh
                pip install git+https://github.com/textX/textX.git
        ```
    -   Za dodatne informacije pogledati [Python uputstvo za pakovanje i distribuciju
        projekata](https://packaging.python.org/en/latest/guides/distributing-packages-using-setuptools/).

-   Svi textX jezici i generatori su registrovani na odgovarajući način u
    `setup.cfg` i dostupni `textx` komandi. Vidite [textX registraciju i otkrivanje](http://textx.github.io/textX/stable/registration/).
    Kao primer videti [sam textX projekat](https://github.com/textX/textX/blob/master/setup.cfg).

    Generatori se mogu pozvati sa:
    ```sh
        textx generate ...
    ```

-   README.md mora da sardži opis projekta, uputstvo za instalaciju i primer
    upotrebe. Jezik može biti srpski ili engleski ali mora biti konzistentno
    korišćen.
