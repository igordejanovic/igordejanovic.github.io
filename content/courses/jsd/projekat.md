+++
title = "Информације за пројекат"
type = "page"
draft = false
creator = "Emacs 29.4 (Org mode 9.8 + ox-hugo)"
weight = 3002
+++

## Теме {#теме}

-   Предложени пројекти морају бити базирани на textX или parglare библиотекама.
-   Могу бити ЈСД имплементације или унапређења поменутих библиотека.
-   Језици морају имплементирати и подршку за едиторе (_Code completion_, _Syntax
    highlighting_ итд. за нпр. _VS Code_). Видети пројекте [textX-LS](https://github.com/textX/textX-LS) и [Language Server
    Protocol](https://microsoft.github.io/language-server-protocol/).


## О вођењу пројекта {#о-вођењу-пројекта}

-   Сви пројекти морају бити отвореног кода јавно хостовани на GitHub-у. Избор
    лиценце се оставља члановима тима, али мора бити [OSI одобрена](https://opensource.org/licenses).
-   Предлог се пише у README фајлу пројекта и шаље се линк предметном професору на
    одобрење.
-   Задаци на пројекту се дефинишу у склопу [GitHub issues](https://github.com/features/issues/).
-   Текуће стање се прати употребом [Канбан табле](https://docs.github.com/en/issues/organizing-your-work-with-project-boards/managing-project-boards/about-project-boards).
-   Трајне белешке (_commit_) се повезују са задацима (_issues_) употребом


## Потребно проверити пре слања асистенту на преглед {#потребно-проверити-пре-слања-асистенту-на-преглед}

-   Све што се оцењује мора бити на основној грани `main`.
-   Пројекат може да се инсталира употребом `pip` алата.
-   Да би ово било могуће пројекат мора имати [pyproject.toml](https://packaging.python.org/en/latest/guides/writing-pyproject-toml/) са валидним
    мета-подацима.
-   Проверите да ли се при изградњи `wheel` фајла пакују сви потребни фајлови. `Wheel`
    фајл је зип архива коју можете отворити у произвољном софтверу за рад са
    архивама и проверити садржај. Ако нешто недостаје погледајте [упутство](https://packaging.python.org/en/latest/guides/distributing-packages-using-setuptools/#packaging-your-project).

    На пример, уколико се изградња спроводи са `flit` алатом wheel се креира са:
    ```sh
        pip install flit
        flit build
    ```
    У фолдеру `dist` биће креиран wheel фајл.

    Као пример, видети како је [конфигурисан textX](https://github.com/textX/textX/blob/master/pyproject.toml).

-   Уколико се исправно подеси пројекат је могуће инсталирати у виртуелно
    окружење употребом pip команде директно из гит репозиторијума. На пример:
    ```sh
        python -m venv venv
        source venv/bin/activate
        pip install git+https://github.com/textX/textX.git
    ```
    Такође је могуће инсталирати пројекат у моду за развој:
    ```sh
        pip install -e .
    ```

-   Сви textX језици и генератори су регистровани на одговарајући начин у
    `pyproject.toml` и доступни `textx` команди. Видите [textX регистрацију и
    откривање](https://textx.github.io/textX/registration.html). Као пример видети [сам textX пројекат](https://github.com/textX/textX/blob/master/pyproject.toml).

    Генератори се могу позвати са:
    ```sh
        textx generate ...
    ```

-   Ако пројекат има CLI или GUI команду, и она мора бити регистрована у
    `pyproject.toml` тако да је доступна по обављеној инсталацији. Видети како је
    регистрована `textx` CLI команда у textX пројекту.

-   `README.md` мора да садржи опис пројекта, упутство за инсталацију и пример
    употребе. Језик може бити српски или енглески али мора бити конзистентно
    коришћен.
