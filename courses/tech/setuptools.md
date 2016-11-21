class: center, middle

# setuptools & pkg_resources
## Komponentni razvoj na programskom jeziku Python

.author[ [Igor Dejanović](http://igordejanovic.net/) ]

.small[[Fakultet tehničkih nauka u Novom Sadu](http://ftn.uns.ac.rs/)] </br>
.small[[Katedra za informatiku](http://informatika.ftn.uns.ac.rs/)]

.created[{{now|dtformat("%d.%m.%Y u %H:%M")}}]


---

name: sadrzaj

## Sadržaj

- [setuptools](#setuptools)
- [Otkrivanje priključaka](#otkrivanje)
- [Kreiranje projekta](#kreiranje)

---
name: pregled
class: center, middle

# setuptools

---
layout: true

.section[[setuptools](#setutools)]

---

## setuptools

- Python biblioteka koja obezbeđuje podršku za pakovanje, distribuciju i
  instalaciju Python biblioteka i aplikacija.
- Metapodaci se navode u `setup.py` fajlu:

Minimalni primer:

```python
from setuptools import setup, find_packages
setup(
    name="HelloWorld",
    version="0.1",
    packages=find_packages(),
)
```

.footer[
.small[https://setuptools.readthedocs.io/en/latest/setuptools.html#developer-s-guide]
]

---

## setuptools primer

```python
from setuptools import setup, find_packages
setup(
    name="HelloWorld",
    version="0.1",
    packages=find_packages(),
    scripts=['say_hello.py'],

    install_requires=['docutils>=0.3'],

    package_data={
        '': ['*.txt', '*.rst'],
        'hello': ['*.msg'],
    },

    author="Me",
    author_email="me@example.com",
    description="This is an Example Package",
    license="PSF",
    keywords="hello world example examples",
    url="http://example.com/HelloWorld/"
)
```

.footer[
.small[https://setuptools.readthedocs.io/en/latest/setuptools.html#developer-s-guide]
]
---

## Verzije paketa

```
>>> from pkg_resources import parse_version
>>> parse_version('1.9.a.dev') == parse_version('1.9a0dev')
True
>>> parse_version('2.1-rc2') < parse_version('2.1')
True
>>> parse_version('0.6a9dev-r41475') < parse_version('0.6a9')
True
```

.footer[
.small[https://setuptools.readthedocs.io/en/latest/setuptools.html#specifying-your-project-s-version]
]

---

## Komandne skripte

```python
setup(
    # ...
    entry_points={
        'console_scripts': [
            'foo = my_package.some_module:main_func',
            'bar = other_module:some_func',
        ],
        'gui_scripts': [
            'baz = my_package_gui:start_func',
        ]
    }
)
```

.footer[
.small[https://setuptools.readthedocs.io/en/latest/setuptools.html#automatic-script-creation]
]

---

## Zavisnosti

```python
setup(
    ...
    install_requires=['docutils>=0.3'],
)
```

Podržane su različite šeme za verzije:
```
docutils >= 0.3

# comment lines and \ continuations are allowed in requirement strings
BazSpam ==1.1, ==1.2, ==1.3, ==1.4, ==1.5, \
    ==1.6, ==1.7  # and so are line-end comments

PEAK[FastCGI, reST]>=0.5a4

setuptools==0.5a7
```

.footer[
.small[https://setuptools.readthedocs.io/en/latest/setuptools.html#declaring-dependencies]
]

---

## Zavisnosti

- [PyPI](https://pypi.python.org/pypi) - *Python Package Index*
- egg fajl
- `.py` fajl
- VCS repozitorijum (Git, Subversion, Mercurial)

.footer[
.small[https://setuptools.readthedocs.io/en/latest/setuptools.html#dependencies-that-aren-t-in-pypi]
]

---

## Opcione zavisnosti

.medium[
.lcol[
```python
setup(
  name="Project-A",
  ...
  extras_require={
    'PDF':  ["ReportLab>=1.2", "RXP"],
    'reST': ["docutils>=0.3"],
  }
)
```
]
.rcol[
```python
setup(
  name="Project-A",
  ...
  entry_points={
    'console_scripts': [
      'rst2pdf = project_a.tools.pdfgen [PDF]',
      'rst2html = project_a.tools.htmlgen',
      # more script entry points ...
    ],
  }
)
```
]

.wide[
```python
setup(
  name="Project-B",
  install_requires=["Project-A[PDF]"],
  ...
)
```
]
]

.footer[
.small[https://setuptools.readthedocs.io/en/latest/setuptools.html#declaring-extras-optional-features-with-their-own-dependencies]
]
---

## Podaci

.medium[
```python
from setuptools import setup, find_packages
setup(
    ...
    # Koristi MANIFEST.in
    include_package_data=True
)
```

Ili na primer ako imamo stablo prikazano sa desne strane:

.lcol[
```python
from setuptools import setup, find_packages
setup(
    ...
    packages=find_packages('src'),
    package_dir={'':'src'},

    package_data={
        '': ['*.txt'],
        'mypkg': ['data/*.dat'],
    }
)
```
]
.rcol[
```python
setup.py
src/
    mypkg/
        __init__.py
        mypkg.txt
        data/
            somefile.dat
            otherdata.dat

```
]
]

.footer[
.small[https://setuptools.readthedocs.io/en/latest/setuptools.html#including-data-files]
]

---

## Instalacija

- Meta-podaci iz `setup.py` su dovoljni da se obavi instalacija paketa:

```
$ python setup.py install
```

- U modu za razvoj:

```
$ python setup.py develop
```

- Instalacija se obavlja u virtuelno okruženje (*virtualenv*) ukoliko je aktivno.

---

## Manifest fajl

- `MANIFEST.in` - šablon na osnovu kojeg se generiše `MANIFEST` fajl koji sadrži
  punu listu fajlova koji čine distribuciju.
  
```
include AUTHORS.rst

include CONTRIBUTING.rst
include HISTORY.rst
include LICENSE
include README.rst

recursive-include tests *
recursive-exclude * __pycache__
recursive-exclude * *.py[co]

recursive-include docs *.rst conf.py Makefile make.bat *.jpg *.png *.gif
```

- Podrazumevano se fajlovi definisani manifestom dodaju na standardni skup
  definisan `setup.py` fajlom.
  
.footer[
https://docs.python.org/3/distutils/sourcedist.html
]


---

## Kreiranje *source* distribucije

```
$ python setup.py sdist 
running sdist
running egg_info
creating sokprimer.egg-info
writing sokprimer.egg-info/PKG-INFO
writing top-level names to sokprimer.egg-info/top_level.txt
writing dependency_links to sokprimer.egg-info/dependency_links.txt
writing manifest file 'sokprimer.egg-info/SOURCES.txt'
...
copying tests/test_sokprimer.py -> sokprimer-0.1.0/tests
Writing sokprimer-0.1.0/setup.cfg
creating dist
Creating tar archive
removing 'sokprimer-0.1.0' (and everything under it)
```

Kreiran je fajl `dist/sokprimer-0.1.0.tar.gz`


---

## Kreiranje binarne distribucije

- Koristiti *wheel* format - zamenjuje stari egg binarni format.
- Prekompajliran za određenu arhitekturu.

.medium[
```
$ python setup.py bdist_wheel
running bdist_wheel
running build
running build_py
running egg_info
writing sokprimer.egg-info/PKG-INFO
writing top-level names to sokprimer.egg-info/top_level.txt
writing dependency_links to sokprimer.egg-info/dependency_links.txt
reading manifest file 'sokprimer.egg-info/SOURCES.txt'
reading manifest template 'MANIFEST.in'
...
creating build/bdist.linux-x86_64/wheel/sokprimer
copying build/lib/sokprimer/__init__.py 
-> build/bdist.linux-x86_64/wheel/sokprimer
copying build/lib/sokprimer/sokprimer.py
-> build/bdist.linux-x86_64/wheel/sokprimer
running install_egg_info
Copying sokprimer.egg-info to build/bdist.linux-x86_64
/wheel/sokprimer-0.1.0-py2.7.egg-info
running install_scripts
creating build/bdist.linux-x86_64/wheel/sokprimer-0.1.0.dist-info/WHEEL
```
Kreiran je fajl `dist/sokprimer-0.1.0-py2.py3-none-any.whl`
]


---


## pkg_resources

- Python paket koji se distribuira kao deo `setuptools` biblioteke.
- Pristup resursima biblioteke u vreme izvršavanja.
- Izgradnja proširivih aplikacija/biblioteka kroz registraciju i otkrivanje
  paketa.


---

## ResourceManagement API

```python
import pkg_resources
my_data = pkg_resources.resource_string(__name__, "foo.dat")
```

```python
from pkg_resources import Requirement, resource_filename
filename = resource_filename(Requirement.parse("MyProject"),"sample.conf")
```

---
name: otkrivanje
class: center, middle
layout: false

# Otkrivanje priključaka

---
layout: true

.section[[Otkrivanje](#sadrzaj)]

---

# Priključci

- pkg_resources `Entry Point`

```python
setup(
...
    entry_points={
        'textx_lang': [
            'er = er.lang:main',
        ]
    }
)
```

- Ime je `textx_lang`. Kolekcija parova ključ:vrednost. Ključ je `er`, vrednost
  je funkcija `main` iz modula `er.lang`.
  
---
  
## Otkrivanje priključaka

```python
def get_language(language_name):
    """
    Returns a callable that instantiates meta-model for the given language.
    """

    langs = list(pkg_resources.iter_entry_points(group='textx_lang',
                                                 name=language_name))

    if not langs:
        raise TextXError('Language "{}" is not registered.'
                         .format(language_name))

    if len(langs) > 1:
        # Multiple languages defined with the same name
        raise TextXError('Language "{}" registered multiple times:\n{}'
                         .format(language_name,
                                 "\n".join([l.dist for l in langs])))

    return langs[0].load()()
```
.small[
Više detalja: http://setuptools.readthedocs.io/en/latest/pkg_resources.html#entry-points
]


---
name: kreiranje
class: center, middle
layout: false

# Kreiranje projekta

---
layout: true

.section[[Kreiranje](#sadrzaj)]

---

## Kreiranje projekta

- Alat [cookiecutter](https://github.com/audreyr/cookiecutter) kreira projekte
  na osnovu šablona.
- Kreiranje Python paketa:

```
$ pip install cookiecutter
...
$ cookiecutter https://github.com/audreyr/cookiecutter-pypackage
Cloning into 'cookiecutter-pypackage'...
remote: Counting objects: 1914, done.
remote: Compressing objects: 100% (30/30), done.
remote: Total 1914 (delta 15), reused 0 (delta 0), pack-reused 1884
Receiving objects: 100% (1914/1914), 308.18 KiB | 356.00 KiB/s, done.
Resolving deltas: 100% (1106/1106), done.
full_name [Audrey Roy Greenfeld]: Igor Dejanovic
email [aroy@alum.mit.edu]: igor DOT dejanovic AT gmail
github_username [audreyr]: igordejanovic
project_name [Python Boilerplate]: SOK-Primer
project_slug [sok-primer]: sokprimer
...

```

---

## Kreiranje projekta

Dobijamo delimično konfigurisan projekat.

.medium[
```
$ cd sokprimer
$ ls -la
total 84
drwxr-xr-x  6 igor users 4096 Nov 20 14:39 .
drwxr-xr-x 25 igor users 4096 Nov 20 14:39 ..
-rw-r--r--  1 igor users  167 Nov 20 14:39 AUTHORS.rst
-rw-r--r--  1 igor users 3275 Nov 20 14:39 CONTRIBUTING.rst
drwxr-xr-x  2 igor users 4096 Nov 20 14:39 docs
-rw-r--r--  1 igor users  292 Nov 20 14:39 .editorconfig
drwxr-xr-x  2 igor users 4096 Nov 20 14:39 .github
-rw-r--r--  1 igor users  777 Nov 20 14:39 .gitignore
-rw-r--r--  1 igor users   89 Nov 20 14:39 HISTORY.rst
-rw-r--r--  1 igor users 1074 Nov 20 14:39 LICENSE
-rw-r--r--  1 igor users 2303 Nov 20 14:39 Makefile
-rw-r--r--  1 igor users  264 Nov 20 14:39 MANIFEST.in
-rw-r--r--  1 igor users 1068 Nov 20 14:39 README.rst
-rw-r--r--  1 igor users  145 Nov 20 14:39 requirements_dev.txt
-rw-r--r--  1 igor users  342 Nov 20 14:39 setup.cfg
-rw-r--r--  1 igor users 1471 Nov 20 14:39 setup.py
drwxr-xr-x  2 igor users 4096 Nov 20 14:39 sokprimer
drwxr-xr-x  2 igor users 4096 Nov 20 14:39 tests
-rw-r--r--  1 igor users  430 Nov 20 14:39 tox.ini
-rw-r--r--  1 igor users 3761 Nov 20 14:39 travis_pypi_setup.py
-rw-r--r--  1 igor users  778 Nov 20 14:39 .travis.yml
```
]



