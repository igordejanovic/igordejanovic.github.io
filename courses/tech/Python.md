class: center, middle

# Programski jezik Python

.author[ [Igor Dejanović](http://igordejanovic.net/) ]

.small[[Fakultet tehničkih nauka u Novom Sadu](http://ftn.uns.ac.rs/)] </br>
.small[[Katedra za informatiku](http://informatika.ftn.uns.ac.rs/)]


.footnote[2016]


---

name: sadrzaj

# Sadržaj

- [Kratak pregled jezika](#pregled)
- Leksičke konvencije i sintaksa
- Tipovi i objekti
- Operatori i izrazi
- Struktura programa i kontrola toka
- Funkcije i funkcionalno programiranje
- Klase i objektno-orijentisano programirane
- Moduli i paketi
- Ulaz i izlaz
- Alati

---
name: pregled
class: center, middle

# Kratak pregled Python-a

---
layout: true

.sekcija[[Pregled](#sadrzaj)]

---

# Python

- Razvoj započet 1989 u Holandiji kao hobi projekat Gvida Van Rosuma. Danas
  jedan od najpopularnijih jezika.
- Interpretiran dinamički jezik visokog nivoa.
- Više paradigmi: imperativno, proceduralno, objektno, funkcionalno...
- Akcenat na efikasnosti programera i čitkosti koda.
- Cross-platform
- Sveobuhvatna i veoma razvijena standardna biblioteka.
- Jezik ima više implementacija.
- Koristi se za desktop i web aplikacije, mobilne aplikacije, administrativne
  skripte, upravljačke skripte, u ugrađenim sistemima...
- Upotrebljava se u firmama širom sveta: Google, Disney, Dropbox, Industrial
  Light & Magic...

---

# Zen of Python

```nohiglight
>>> import this
Beautiful is better than ugly.
Explicit is better than implicit.
Simple is better than complex.
Complex is better than complicated.
Flat is better than nested.
Sparse is better than dense.
Readability counts.
Special cases aren't special enough to break the rules.
Although practicality beats purity.
Errors should never pass silently.
Unless explicitly silenced.
In the face of ambiguity, refuse the temptation to guess.
There should be one-- and preferably only one --obvious way to do it.
Although that way may not be obvious at first unless you're Dutch.
Now is better than never.
Although never is often better than *right* now.
If the implementation is hard to explain, it's a bad idea.
If the implementation is easy to explain, it may be a good idea.
Namespaces are one honking great idea -- let's do more of those!
```

---


# Implementacije Python-a

- CPython
- PyPy
- Jython
- Iron Python
- pyjs
- ...

---


# Python konzola

- Pokreće se pozivom Python interpretera bez parametara.

```
$ python
Python 3.4.1 (default, May 19 2014, 17:23:49)
[GCC 4.9.0 20140507 (prerelease)] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> print("Hello World!")
Hello World!
>>> 23423432 ** 34
36992864259838982449973046100677855738848171498810334668814347544
72272789093305975943853887303038138168893642829742372685558166974
99603306904629343154070096117901999442230973428786292674630445031
96766248000024671594323356975802355740978014370737946624
>>>
```

---

# Jednostavan program na Python-u

```python
principal = 1000    # Početni iznos
rate = 0.05         # Kamatna stopa
numyears = 5
year = 1
while year <= numyears:
principal = principal * (1 + rate)
  print year, principal     # print(year, principal) u Python-u 3
  year += 1
```

- Varijable - imena/reference za objekte.
- Objekti imaju nepromenjiv tip. Varijable mogu da menjaju objekat koji
  referenciraju.

---

# print i formatiranje izlaza

- Slično `printf` funkciji u C-u.
- Upotrebom string interpolacije (operator %)

```python
print "%3d %0.2f" % (year, principal)
print("%3d %0.2f" % (year, principal))      # Python 3
```

Ili modernija varijanta - `format` funkcija

```python
print format(year,"3d"),format(principal,"0.2f")
print(format(year,"3d"),format(principal,"0.2f")) # Python 3

# ili format funkcijom nad stringom
print "{0:3d} {1:0.2f}".format(year,principal)
print("{0:3d} {1:0.2f}".format(year,principal)) # Python 3
```

---

# Uslovi

```python
if a < b:
    print "Computer says Yes"
else:
    print "Computer says No"
```

```python
if product == "game" and type == "pirate memory" \
            and not (age < 4 or age > 8):
      print "I'll take it!"
```

```python
if suffix == ".htm":
    content = "text/html"
elif suffix == ".jpg":
    content = "image/jpeg"
elif suffix == ".png":
    content = "image/png"
else:
    raise RuntimeError("Unknown content type")
```

```python
if 'spam' in s:
    has_spam = True
else:
    has_spam = False
```

---

# Fajl ulaz/izlaz

.medium[

```python
f = open("foo.txt")
line = f.readline()
while line:
    print line,     # print(line,end='') za Python 3
    line = f.readline()
f.close()
```

Isti program u kraćoj formi:

```python
with open("foo.txt") as f:
  for line in f:
      print line,
```

Pisanje u fajl:

```python
f = open("out","w")       # Otvaranje za pisanje - "w"
while year <= numyears:
    principal = principal * (1 + rate)
    print >>f,"%3d %0.2f" % (year,principal)
    # Alternativno f.write("%3d %0.2f\n" % (year,principal))
    # Za P3, print("%3d %0.2f" % (year,principal),file=f)
    year += 1
f.close()
```
]

---

# Stringovi

```python
a = "Hello World"
b = 'Python is groovy'
c = """Computer says 'No'"""
print '''Content-type: text/html
<h1>Hello World</h1>
Click <a href="http://www.python.org">here</a>.
'''
b = a[4]      # b = 'o'

c = a[:5]     # c = "Hello"
d = a[6:]     # d = "World"
e = a[3:8]    # e = "lo Wo"

g = a + " This is a test"

x = "37"
y = "42"
z = x + y               # z = "3742" (konkatanacija stringova)
z = int(x) + int(y)     # z = 79 (Integer +)
```

---

# Liste

- Liste su sekvence proizvoljnih objekata (referenci)

```python
names = [ "Dave", "Mark", "Ann", "Phil" ]
a = names[2]          # Vraća treći objekat iz liste - "Ann"
names[0] = "Jeff"     # Menja prvi objekat-referencu na "Jeff"
names.append("Paula")       # Dodaje "Paula" na kraj liste
names.insert(2, "Thomas")   # Ubacuje "Thomas" na lokaciju 2

b = names[0:2]      # Vraća [ "Jeff", "Mark" ]
c = names[2:]       # Vraća [ "Thomas", "Ann", "Phil", "Paula" ]
names[1] = 'Jeff'   # Menja drugi element sa 'Jeff'
names[0:2] = ['Dave','Mark','Jeff']   # Menja prva dva elementa sa liste
                                      # sa listom na desnoj strani
a = [1,2,3] + [4,5]     # Rezultat je [1,2,3,4,5]

names = []            # Prazna lista
names = list()        # Prazna lista

a = [1,"Dave",3.14, ["Mark", 7, 9, [100,101]], 10]
a[1]            # "Dave"
a[3][2]         # 9
a[3][3][1]      # 101
```

---

# List comprehensions

```python
import sys                # Učitavanje sys modula
if len(sys.argv) != 2     # Proveri broj argumenata
    print "Please supply a filename"
    raise SystemExit(1)
f = open(sys.argv[1])     # Ime fajla je dato kao paramatar
lines = f.readlines()     # Pročitaj sve linije u listu
f.close()

# Konvertuje sve vrednosti u linijama teksta u float
fvalues = [float(line) for line in lines]

# Pronađi min i max vrednosti
print "The minimum value is ", min(fvalues)
print "The maximum value is ", max(fvalues)
```

---

# N-torke (*Tuples*)

- Nepromenjiva struktura - *immutable*

```python
stock = ('GOOG', 100, 490.10)
address = ('www.python.org', 80)
person = (first_name, last_name, phone)

# ili samo
stock = 'GOOG', 100, 490.10
address = 'www.python.org',80
person = first_name, last_name, phone

# Načini navođenja
a = ()          # 0-tuple (prazan tuple)
b = (item,)     # 1-tuple (obratiti pažnju na zarez)
c = item,       # 1-tuple (obratiti pažnju na zarez)

# "raspakivanje"
name, shares, price = stock
host, port = address
first_name, last_name, phone = person
```

---

# Primer upotrebe n-torki i lista

.medium[

```python
# File containing lines of the form "name,shares,price"
filename = "portfolio.csv"
portfolio = []
with open(filename) as f:
  for line in f:
      fields = line.split(",")      # Svaku liniju podeli na mestu ","
      name = fields[0]              # Izdvoj pojedinačna polja
      shares = int(fields[1])       # i konvertuj vrednosti
      price = float(fields[2])
      stock = (name,shares,price)   # Kreiraj n-torku (name, shares, price)
      portfolio.append(stock)       # Dodaj je na listu slogova
```

```python
>>> portfolio[0]
('GOOG', 100, 490.10)
>>> portfolio[1]
('MSFT', 50, 54.23)
>>> portfolio[1][1]
50
>>> portfolio[1][2]
54.23
>>>
```

```python
total = 0.0
for name, shares, price in portfolio:
    total += shares * price
```

]

---

# Skupovi (*sets*)

Neuređena kolekcija objekata.

```python
s = set([3,5,9,10])     # Kreira skup brojeva
t = set("Hello")        # Kreira skup jedinstvenih karaktera
>>> t
set(['H', 'e', 'l', 'o'])
```
Operacije nad skupovima:

```python
a = t | s     # Unija skupova t i s
b = t & s     # Presek skupova t i s
c = t - s     # Razlika skupova t i s
d = t ^ s     # Simetrična razlika skupova t i s
              # (elementi koji pripadaju ili skupu t ili
              #  skupu s ali ne i preseku)
```

Dodavanje i uklanjanje elemenata.

```python
t.add('x')                # Dodavanje jednog elementa u t
s.update([10,37,42])      # Dodavanje više elemenata u s
t.remove('H')             # Uklanjanje elementa
```

---

# Rečnici (*dictionaries*)

- Asocijativni niz objekata indeksiranih ključevima.
- Ključ može biti bilo koji nepromenjivi objekat (*immutable*).

```python
# Dva načina kreiranja praznog rečnika
stock = {}
stock = dict()

# Kreiranje rečnika sa podacima
stock = {
    "name" : "GOOG",
    "shares" : 100,
    "price" : 490.10
}

# Upotreba
name = stock["name"]
value = stock["shares"] * shares["price"]

# Upis vrednosti
stock["shares"] = 75
stock["date"] = "June 7, 2007"
```

---

# Rečnici - nastavak

```python
# Mogu se koristiti za brzo pronalaženje podataka
prices = {
    "GOOG": 490.10,
    "AAPL": 123.50,
    "IBM":  91.50,
    "MSFT": 52.13
}

# Default vrednosti
if "SCOX" in prices:
    p = prices["SCOX"]
else:
    p = 0.0

# ili kraće
p = prices.get("SCOX",0.0)

# Lista ključeva
syms = list(prices)     # syms = ["AAPL", "MSFT", "IBM", "GOOG"]

# ili
syms = prices.keys()
```

---

# Iteracija i petlje

```python
for n in [1,2,3,4,5,6,7,8,9]:
    print "2 na stepen %d je %d" % (n, 2**n)

for n in range(1,10):
    print "2 na stepen %d je %d" % (n, 2**n)

a = range(5)        # a = [0, 1, 2, 3, 4]
b = range(1, 8)     # b = [1, 2, 3, 4, 5, 6, 7]
c = range(0, 14, 3) # c = [0, 3, 6, 9, 12]
d = range(8, 1, -1) # d = [8, 7, 6, 5, 4, 3, 2]

for i in xrange(100000000):       # i = 0,1,2,...,99999999
    statements
```

---

# Iteracija i petlje (2)

- Iterator protokol
- Stringovi su sekvence - podržavaju iterator protokol

```python
a = "Hello World"
# Štampa pojedinačna slova stringa a
for c in a:
    print c
```

- Liste takođe.

```python
b = ["Dave","Mark","Ann","Phil"]
# Štampa članove liste b
for name in b:
    print name
```

---

# Iteracija i petlje (3)


- I mape

```python
c = { 'GOOG' : 490.10, 'IBM' : 91.50, 'AAPL' : 123.15 }
# Štampa sve članove rečnika c
for key in c:
    print key, c[key]
```

- I fajlovi

```python
# Štampa sve linije fajla foo.txt
f = open("foo.txt")
for line in f:
    print line,
```
- Proizvoljni objekti mogu da podrže iterator protokol.
- Kreiranje iteratora upotrebom funkcija - generatori (videti u nastavku)

---

# Funkcije

- Kreiraju se ključnom rečju `def`
- Ukoliko funkcija nema povratnu vrednost implicitno vraća `None`

```python
def fibonacci(n):
  "Returns element of fibonacci array at given possition."
  if n < 0:
    raise ValueError("Array index must be >=0.")
  if n < 2:
    return 1
  return fibonacci(n-2) + fibonacci(n-1)
```

```python
def f(a, b=5):
  return a + 2 ** b
>>> f(3)
35
>>> f(3, 5)
35
>>> f(3, 6)
67
```

---

# Funkcije (2)

.medium[

Parametri i vrednosti parametara se mogu upariti po poziciji ili po nazivu

```python
def f(a, b=5):
  return a + 2 ** b

>>> f(b=3, a=1)
9
```

Promenjivi broj parametara, po poziciji i po imenu

```python
def f(*args, **kwargs):
  for a in args:
    print(a)
  for k, v in kwargs.items():
    print(k, v)

>>> f(34, 56, 67, b=12, c=89, foo="bar")
34
56
67
b 12
foo bar
c 89
```
]

---

# Funkcije (3)


- Sve reference unutar funkcije su unutar opsega funkcije (scope)
- Ako treba da referenciramo globalnu varijablu deklarišemo je sa ključnom
  rečju `global`.

```python
count = 0
...
def foo1():
  count = 1    # Kreiranje lokalne varijable count
...
def foo2():
  global count
  count += 1    # Izmene globalne varijable count
```

---

# Generatori


Umesto jedne vrednosti funkcija može generisati sekvencu vrednosti.

```python
def countdown(n):
  print "Counting down!"
  while n > 0:
    yield n     # Generisanje vrednosti (n)
    n -= 1
```

- Poziv funkcije vraća tzv. *generator objekat*
- Ključna reč `yield` označava povratak jedne vrednosti sekvence.

---

# Generatori - upotreba

```python
>>> c = countdown(5)
>>> c.next()
Counting down!
5
>>> c.next()
4
>>> c.next()
3
```

```python
>>> for i in countdown(5):
...
print i,
Counting down!
5 4 3 2 1
```

Svaki objekat (klasa) koji implementira generator protokol može da se koristi
kao generator.

---

# Korutine (*coroutines*)

- Koncept obrnut generatorima.
- Funkcije koje mogu spolja da prime sekvencu vrednosti u toku izvršavanja.

```python
def print_matches(matchtext):
  print "Tražim", matchtext
  while True:
    line = (yield)    # Preuzmi liniju teksta spolja
    if matchtext in line:
      print line
>>> matcher = print_matches("python")
>>> matcher.next()    # Postavlja se na prvi (yield)
Tražim python
>>> matcher.send("Hello World")
>>> matcher.send("python is cool")
python is cool
>>> matcher.send("yow!")
>>> matcher.close()     # Na kraju je potrebno zatvoriti korutinu
```

Omogućavaju implementaciju *producer-consumer* ili *pipe* obrasca bez upotrebe
niti i višenitnog programiranja.

---

# Objekti i klase

.medium[

- Sve vrednosti su objekti.
- Objekat se sastoji od internih podataka i metoda koje operišu nad njima.
- Metode i atributi objekta se mogu izlistati ugrađenom funkcijom `dir`.


Stringovi su objekti.

```python
>>> dir("foo")
['__add__', '__class__', '__contains__', '__delattr__',
...  '__len__', '__lt__', '__mod__', '__mul__',
... 'capitalize', 'center', 'count', 'decode', 'encode',
... 'startswith', 'strip', 'swapcase', 'title', 'translate',
'upper', 'zfill']
```

Brojevi su objekti

```python
>>> dir(2)
['__abs__', '__add__', '__and__', '__class__', '__cmp__', '__coerce__',
 ...'__pow__', '__radd__', '__rand__', '__rdiv__', '__rdivmod__',
 ...'bit_length', 'conjugate', 'denominator', 'imag', 'numerator', 'real']
```

]

---

# Objekti i klase (2)

Funkcije su objekti

```python
>>> dir(fibonacci)
['__call__', '__class__', '__closure__', '__code__',
 ...
 'func_dict', 'func_doc', 'func_globals', 'func_name']
```

Liste su objekti

```python
>>> items = [37, 42]
>>> dir(items)
['__add__', '__class__', '__contains__', '__delattr__'
...
'append', 'count', 'extend', 'index', 'insert', 'pop',
'remove', 'reverse', 'sort']
```

---

# Objekti i klase (3)


- Specijalne metode su oblika `__xxx__`
- Ove metode se koriste za implementaciju npr. operatora (npr. +, -, \*, in...)i
  odgovora na specijalne ugrađene funkcije (npr. len).

```python
>>> items = [37, 42]
>>> items.__add__([73,101])
[37, 42, 73, 101]
# je ekvivalentno sa
>>> items + [73, 101]
```

Klasa može da proizvoljno redefiniše specijalne metode.

---

# Objekti i klase (4)

.medium[

Specijalna metoda *__init__* predstavlja konstruktor.

Primer: implementacija steka

```python
class Stack(object):
  def __init__(self):
    self.stack = [ ]
  def push(self,object):
    self.stack.append(object)
  def pop(self):
    return self.stack.pop()
  def length(self):
    return len(self.stack)

s = Stack()
s.push("Dave")
s.push(42)
s.push([3,4,5])
x = s.pop()
y = s.pop()
del s
```

- Svaka metoda prima objekat kao eksplicitan prvi parametar.
- Po konvenciji parametar nazivamo `self`

]

---

# Objekti i klase (5)

Pošto je stek vrlo sličan Python listi možemo direktno naslediti ugrađenu
listu.

```python
class Stack(list):    # Nasleđujemo listu
  # Dodajemo push metodu da bi implementirali
  # stack interfejs
  # Napomena: liste već imaju pop() methodu.
  def push(self,object):
    self.append(object)
```

Ovako kreirana klasa ima sve osobine liste.

```python
>>> s = Stack()
>>> s.push(2)
>>> s.push(3)
>>> s.push(4)
>>> s
[2, 3, 4]
>>> s[:2]
[2, 3]
```

---

# Objekti i klase

Klasa može da definiše različite vrste metoda.

```python
class EventHandler(object):
  @staticmethod
  def dispatcherThread():
    while (1):
      # Wait for requests
      ...

EventHandler.dispatcherThread()   # Poziv static metode kao da je funkcija
```

`@staticmethod` je dekorator. Više u nastavku.

---

# Izuzeci

Ukoliko dođe do graške u programu javlja se izuzetak

Ispis može biti poput ovoga:

```python
Traceback (most recent call last):
File "foo.py", line 12, in <module>
IOError: [Errno 2] No such file or directory: 'file.txt'
```

---

# Izuzeci (2)

Izuzeci se mogu uhvatiti i obraditi.

```python
f = open("file.txt", "r")
try:
  ... obrada fajla
except Exception as e:
  .. obrada izuzetka
finally:
  # Ovaj blok se uvek izvršava na kraju
  # bez obzira šta da se desi
  f.close()
```

Izuzeci se programski izazivaju na mestu detektovanja
nevalidnog stanja sa:

```python
raise RuntimeError("Computer says no")
```

---

# Izuzeci - konteksti

- Upotreba nekog resursa uvek zahteva njegovo oslobađanje (zatvaranje) po
  završetku upotrebe.
- Ovo oslobađanje može biti teže izvodljivo u kontekstu izuzetaka.
- Zato je uvedena ključna reč `with`.

```python
import threading
message_lock = threading.Lock()
...
with message_lock:
  messages.add(newmessage)
```

- Izlaskom iz `with` bloka, bilo regularno ili zbog izuzetka biće automatski
  obavljeno oslobađanje resursa.
- Objekti koji mogu da se navedu u iskazu `with` implementiraju određeni
  kontekst protokol (dve specijalne metode: `__enter__` i `__exit__`)

---

# Moduli

- Veće programe je poželjno razbiti u više fajlova/modula.
- Python omogućava import-ovanje definicija iz drugih fajlova/modula.
- Python moduli su fajlovi sa ekstenzijom `.py`

```python
# file : div.py
def divide(a,b):
  q = a/b
  r = a - q*b
  return (q,r)
```

.lcol[
```python
import div
a, b = div.divide(2305, 29)
```
]

.rcol[
```python
import div as foo
a,b = foo.divide(2305,29)
```
]
.lcol[
```python
from div import divide
a,b = divide(2305,29)
```
]
.rcol[
```python
from div import *
```
]

---

# Moduli (2)

I moduli su objekti

```python
>>> import string
>>> dir(string)
['_ _builtins_ _', '_ _doc_ _', '_ _file_ _', '_ _name_ _', '_idmap',
'_idmapL', '_lower', '_swapcase', '_upper', 'atof', 'atof_error',
'atoi', 'atoi_error', 'atol', 'atol_error', 'capitalize',
'capwords', 'center', 'count', 'digits', 'expandtabs', 'find',
...
```

---
layout: false
name: sintaksa
class: center, middle

# Leksičke konvencije i sintaksa

---
layout: true

.sekcija[[Sintaksa](#sadrzaj)]

---

# Struktura linije i indentacija

```python
a = math.cos(3 * (x - n)) + \
    math.sin(3 * (y - n))
```

```python
if a:
  statement1     # Ispravna indentacija
  statement2
else:
  statement3
    statement4   # Neispravna indentacija
```

```python
if a: statement1
else: statement2
```

```python
if a:
  pass
else:
  statements
```

