+++
title = "Информације за пројекат"
type = "page"
draft = false
creator = "Emacs 28.2 (Org mode 9.6 + ox-hugo)"
weight = 3002
+++

## Теме {#теме}

-   Предложени пројекти морају бити базирани на textX или parglare библиотекама.
-   Могу бити ЈСД имплементације или унапређења поменутих библиотека.
-   Језици могу да дефинишу и подршку за едиторе (_Code completion_, _Syntax
    highlighting_ итд. за нпр. _VS Code_) -- пожељно посебно код већих тимова.
    Видети пројекте [textX-LS](https://github.com/textX/textX-LS) и [Language Server Protocol](https://microsoft.github.io/language-server-protocol/).


## О вођењу пројекта {#о-вођењу-пројекта}

-   Сви пројекти морају бити отвореног кода јавно хостовани на GitHub-у. Избор
    лиценце се оставља члановима тима, али мора бити [OSI одобрена](https://opensource.org/licenses).
-   Предлог се пише у README фајлу пројекта и шаље се линк предметном професору на
    одобрење.
-   Задаци на пројекту се дефинишу у склопу [GitHub issues](https://github.com/features/issues/).
-   Текуће стање се прати употребом [Канбан табле](https://docs.github.com/en/issues/organizing-your-work-with-project-boards/managing-project-boards/about-project-boards).


## Потребно проверити пре слања професору на преглед {#потребно-проверити-пре-слања-професору-на-преглед}

-   Пројекат може да се инсталира у моду за развој са `pip install -e`.
    -   Да би ово било могуће пројекат мора имати `setup.py` односно `setup.cfg` са
        валидним мета-подацима.
    -   Проверите да ли `python setup.py bdist_wheel` пакује све потребне фајлове у
        резултујћи wheel фајл.
    -   Уколико се исправно подеси пројекат је могуће инсталирати у виртуелно
        окружење употребом пип команде директно из гит репозиторијума. На пример:
        ```sh
                pip install git+https://github.com/textX/textX.git
        ```
    -   За додатне информације погледати [Python упутство за паковање и дистрибуцију
        пројеката](https://packaging.python.org/en/latest/guides/distributing-packages-using-setuptools/).

-   Сви textX језици и генератори су регистровани на одговарајући начин у
    `setup.cfg` и доступни `textx` команди. Видите [textX регистрацију и откривање](http://textx.github.io/textX/stable/registration/). Као
    пример видети [сам textX пројекат](https://github.com/textX/textX/blob/master/setup.cfg).

    Генератори се могу позвати са:
    ```sh
        textx generate ...
    ```

-   `README.md` мора да садржи опис пројекта, упутство за инсталацију и пример
    употребе. Језик може бити српски или енглески али мора бити конзистентно
    коришћен.
