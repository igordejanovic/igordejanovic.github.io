#let _ = ```typ
exec typst c "$0" --root "$(readlink -f "$0" | xargs dirname)/./" --input file-10=/images/robot.png --input file-9=/images/robot.dot.png --input file-8=/images/person-entity.png --input file-7=/images/entity.dot.png --input file-6=/images/base_types.png --input file-5=/program.dot.png --input file-4=/robot.dot.png --input file-3=/example.dot.png --input file-2=/images/hello_parts.png --input file-1=/hello.dot.png --input file-0=/images/textX.png
⁠```
#set document(title: "textX", author: "Игор Дејановић")
#set text(lang: "sr")
#set heading(numbering: "1.")
#let naslov = "textX"
#let podnaslov = "скрипта за предмет Језици специфични за домен"
#let autor = "Проф. др Игор Дејановић"
#let godina = 2025
#set document(title: naslov, author: autor)
#set text(lang: "sr")
#set heading(numbering: "1.1")
#set text(font: "Liberation Serif", size: 11pt)
#set par(justify: true)
#show link: set text(blue)
#show cite: set text(blue)
#show ref: set text(blue)
#show heading: set text(hyphenate: false)


#set page(
    margin: (left: 20mm, right: 20mm, top: 20mm, bottom: 20mm),
    numbering: none
  )
#grid(columns: (auto, 60%, auto), gutter: 2mm,
    align(left, image("logo/uns-logo.svg", width: 70%)),
    align(center + horizon, text([УНИВЕРЗИТЕТ У НОВОМ САДУ \
    *ФАКУЛТЕТ ТЕХНИЧКИХ НАУКА У
    НОВОМ САДУ*], size: 16pt)),
    align(right, image("logo/ftn-logo.svg", width: 70%)),
)
#line(length: 100%)

#v(3cm)

#align(center, text(autor, size: 20pt))

#v(1cm)

#align(center, text(strong(naslov), size: 25pt))

#v(1cm)

#align(center, text(podnaslov, size: 20pt))

#align(center + bottom, text([Нови Сад, #godina], size: 18pt))


#pagebreak()
#pagebreak()

#set page(paper: "iso-b5", margin: (y: 2.5cm, inside: 2cm, outside: 1.5cm))

#show figure.where(
  kind: table
): set figure.caption(position: top)
#show figure.where(kind: raw): set figure(supplement: [Листинг])
#set ref(supplement: none)


#import "@preview/hydra:0.6.2": hydra

#show heading.where(level: 1): (it) => {
    pagebreak(to: "odd", weak: true)
    set block(spacing: 8pt)
    if heading.numbering != none {
        text("Глава " + counter(heading).display(), size: 22pt)
    }
    set par(justify: false)
    line(length: 100%)
    rect(align(right + horizon, text(it.body, size: 22pt)), fill: white, width: 100%)
    line(length: 100%)
    v(1em)
}

#outline(title: [Садржај], depth: 2)

#set page(header: context {
     // Хедери са текућим секцијама не иду на страницу са поглављима
     if not (query(heading.where(level: 1)).any(h => h.location().page() == here().page())) {
        if calc.odd(here().page()) {
            align(right, emph(hydra(1)))
        } else {
            align(left, emph(hydra(2)))
        }
        line(length: 100%)
     }
})

#pagebreak(to: "odd", weak: false)
#set heading(numbering: "1.1")
#set page(numbering: "1")
#counter(page).update(1)
#heading(level: 1)[Основне особине] #label("orgc07a2e2")
#list(list.item[100% Пајтон код])#list(list.item[МИТ лиценца])#list(list.item[Истовремено дефинисање граматике и мета\u{2d}модела \u{2d} инспирисан са #link("https://www.eclipse.org/Xtext/")[Xtext] #footnote(link("https://www.eclipse.org/Xtext/"))])#list(list.item[Аутоматска конструкција модела \u{2d} подршка за разрешаване референци])#list(list.item[Подршка за везе типа целина\u{2d}део])#list(list.item[Контрола парсирања (#emph[whitespaces, case, keywords]...)])#list(list.item[Постпроцесирање објеката модела или целог модела])#list(list.item[Модуларизација граматика \u{2d} импорт])#list(list.item[Визуализација модела и мета\u{2d}модела])#list(list.item[Документација и туторијали доступни на #link("https://textx.github.io/textX/")])
#heading(level: 1)[Архитектура] #label("org4e20432")
#figure([#image(sys.inputs.file-0)]) #label("orgecc810c")
#heading(level: 1)[Инсталација] #label("orgd345c68")
#heading(level: 2)[Инсталација] #label("org9213c78")
#list(list.item[Са PyPI])
#figure([#raw(block: true, lang: "sh", "~> mkdir jsd
~> cd jsd
~/jsd> uv init
Initialized project `jsd`
?main ~/jsd> ls
main.py  pyproject.toml  README.md
?main ~/jsd> uv add textx\[cli\]
Using CPython 3.14.0
Creating virtual environment at: .venv
Resolved 5 packages in 8ms
Installed 3 packages in 15ms
 + arpeggio==2.0.3
 + click==8.3.1
 + textx==4.2.3")]) #label("org6fb0507")

#figure([#raw(block: true, lang: "sh", "?main ~/jsd> uv run textx
Usage: textx [OPTIONS] COMMAND [ARGS]...

Options:
  --debug  Debug/trace output.
  --help   Show this message and exit.

Commands:
  check            Check/validate model given its file path.
  generate         Run code generator on a provided model(s).
  list-generators  List all registered generators
  list-languages   List all registered languages
  version          Print version info.")]) #label("org0996a8a")
#heading(level: 2)[Инсталација развојне верзије са GitHub\u{2d}а] #label("orgb156fa1")
#figure([#raw(block: true, lang: "sh", "~> mkdir jsd
~> cd jsd
~/jsd> uv init
Initialized project `jsd`
?main ~/jsd> uv add git+https://github.com/textx/textx@master
Using CPython 3.14.0
Creating virtual environment at: .venv
Resolved 3 packages in 210ms
    Updated https://github.com/textx/textx (6ef5164d77988a8b905a98748e90586c44efba9e)
      Built textx @ git+https://github.com/textx/textx@6ef5164d77988a8b905a98748e90586c44efba9e
Prepared 1 package in 2.20s
Installed 2 packages in 2ms
 + arpeggio==2.0.3
 + textx==4.3.0.dev0 (from git+https://github.com/textx/textx@6ef5164d77988a8b905a98748e90586c44efba9e)")]) #label("orgb73e3e7")
#heading(level: 2)[Инсталација за развој] #label("orgd4309f5")
#figure([#raw(block: true, lang: "sh", "~> mkdir jsd
~> cd jsd
~/jsd> git clone git@github.com:textX/textX
Cloning into 'textX'...
remote: Enumerating objects: 14302, done.
remote: Counting objects: 100% (2641/2641), done.
remote: Compressing objects: 100% (975/975), done.
remote: Total 14302 (delta 1463), reused 2486 (delta 1365), pack-reused 11661 (from 1)
Receiving objects: 100% (14302/14302), 17.28 MiB | 12.45 MiB/s, done.
Resolving deltas: 100% (8808/8808), done.
~/jsd> cd textX
master ~/jsd/textX> uv venv -p 3.14
Using CPython 3.14.0
Creating virtual environment at: .venv
Activate with: source .venv/bin/activate
master ~/jsd/textX> source .venv/bin/activate
(textX) master ~/jsd/textX> uv pip install -e .
Resolved 2 packages in 6ms
      Built textx @ file:///home/igor/jsd/textX
Prepared 1 package in 232ms
Installed 2 packages in 3ms
 + arpeggio==2.0.3
 + textx==4.3.0.dev0 (from file:///home/igor/ntp/textX)")]) #label("org36c244f")
#heading(level: 1)[Основна употреба] #label("orgef18486")
#heading(level: 2)[Граматика = мета\u{2d}модел \u{2b} конкретна синтакса] #label("org1229b9b")
#figure([#raw(block: true, lang: "textx", "HelloWorldModel:
  'hello' to_greet+=Who[',']
;

Who:
  name = /[^,]*/
;")]) #label("orgead4771")
#figure([#raw(block: true, lang: "python", "from textx import metamodel_from_file
hello_meta = metamodel_from_file('hello.tx')")]) #label("orgf6eed22")

#figure([#image(sys.inputs.file-1)]) #label("org841571b")
#heading(level: 2)[Модел = програм] #label("org02b5d8b")
#figure([#raw(block: true, lang: "example", "hello World, Solar System, Universe")]) #label("org1f16a49")

#figure([#image(sys.inputs.file-2)]) #label("orgae83191")
#heading(level: 2)[Парсирање \u{2d} инстанцирање модела] #label("org5c0f170")
#figure([#raw(block: true, lang: "python", "example_hello_model = hello_meta.model_from_file('example.hello')")]) #label("org681147d")

#figure([#image(sys.inputs.file-3)]) #label("org7d43504")


#list(list.item[Модел је граф Пајтон објеката чија структура је у складу са граматиком (нпр.
#raw(block: false, "HelloWorldModel") објекат садржи Пајтон листу #raw(block: false, "to_greet")).])#list(list.item[Модел можемо даље интерпретирати, анализирати, генерисати код...])
#heading(level: 2)[Провера и визуализација мета\u{2d}модела] #label("org41402c2")
#list(list.item[textX ће при парсирају граматике пријавити синтаксне грешке.])#list(list.item[Ако желимо можемо проверити граматику у току развоја:

#figure([#raw(block: true, lang: "bash", "textx check hello.tx")]) #label("orge8c1ff5")

#raw(block: false, "/home/igor/repos/igordejanovic.github.io/courses/tech/textX/hello.tx: OK.")])#list(list.item[У случају грешке биће пријављена тачна локација.])#list(list.item[или визуализовати

#figure([#raw(block: true, lang: "bash", "textx list-generators")]) #label("org6f35579")

#raw(block: false, "any -> dot           textX    Generating dot visualizations from arbitrary models
textX -> dot         textX    Generating dot visualizations from textX grammars
textX -> PlantUML    textX    Generating PlantUML visualizations from textX grammars")


#figure([#raw(block: true, lang: "bash", "textx generate hello.tx --target dot")]) #label("orga6721e6")

#raw(block: false, "Generating dot target from models:
/home/igor/repos/igordejanovic.github.io/courses/tech/textX/hello.tx
-> /home/igor/repos/igordejanovic.github.io/courses/tech/textX/hello.dot
   To convert to png run \u{22}dot -Tpng -O hello.dot\u{22}")])
#heading(level: 2)[Робот пример] #label("org387e8be")
fajl #raw("robot.tx")
#figure([#raw(block: true, lang: "textx", "Program:
  'begin'
    commands*=Command
  'end'
;

Command:
  InitialCommand | MoveCommand
;

InitialCommand:
  'initial' x=INT ',' y=INT
;

MoveCommand:
  direction=Direction (steps=INT)?
;

Direction:
  \u{22}up\u{22}|\u{22}down\u{22}|\u{22}left\u{22}|\u{22}right\u{22}
;

Comment:
  /\/\/.*$/
;")]) #label("orgbbb7f48")

fajl #raw("program.rbt")
#figure([#raw(block: true, lang: "example", "begin
    initial 3, 1
    up 4
    left 9
    down
    right 1
end")]) #label("org6faeb26")
#heading(level: 2)[Инстанцирање мета\u{2d}модела] #label("org2f4ae60")
#figure([#raw(block: true, lang: "python", "from textx import metamodel_from_file
robot_mm = metamodel_from_file('robot.tx')")]) #label("org5505bb0")

#figure([#image(sys.inputs.file-4)]) #label("orgbe408d7")

#figure([#raw(block: true, lang: "bash", "textx generate robot.tx --target dot
dot -Tpng -O robot.dot")]) #label("org2e32055")
#heading(level: 2)[Парсирање и инстанцирање модела] #label("orgb354cbe")
#figure([#raw(block: true, lang: "python", "robot_model = robot_mm.model_from_file('program.rbt')")]) #label("org6d6f677")

#figure([#image(sys.inputs.file-5)]) #label("orgb2cc76f")

#figure([#raw(block: true, lang: "bash", "textx generate program.rbt --grammar robot.tx --target dot
dot -Tpng -O program.dot")]) #label("org11c4cb9")
#heading(level: 2)[Шта радити са моделом?] #label("orgb521095")
#list(list.item[Интерпретирање])#list(list.item[Генерисање кода])#list(list.item[Разне врсте анализе и трансформације])
#heading(level: 2)[Интерпретирање Робот модела] #label("org3f2bce2")
#figure([#raw(block: true, lang: "python", "class Robot(object):

    def __init__(self):
        # Initial position is (0,0)
        self.x = 0
        self.y = 0

    def __str__(self):
        return \u{22}Robot position is {}, {}.\u{22}.format(self.x, self.y)")]) #label("org75401aa")
#heading(level: 2)[Интерпретирање Робот модела] #label("org249f843")
#figure([#raw(block: true, lang: "python", "def interpret(self, model):

        # model is an instance of Program
        for c in model.commands:

            if c.__class__.__name__ == \u{22}InitialCommand\u{22}:
                print(\u{22}Setting position to: {}, {}\u{22}.format(c.x, c.y))
                self.x = c.x
                self.y = c.y
            else:
                dir = c.direction
                print(\u{22}Going {} for {} step(s).\u{22}.format(dir, c.steps))

                move = {
                    \u{22}up\u{22}: (0, 1),
                    \u{22}down\u{22}: (0, -1),
                    \u{22}left\u{22}: (-1, 0),
                    \u{22}right\u{22}: (1, 0)
                }[dir]

                # Calculate new robot position
                self.x += c.steps * move[0]
                self.y += c.steps * move[1]")]) #label("org8b4ffaf")
#heading(level: 2)[Интерпретација Робот модела] #label("orgcfb462b")
#figure([#raw(block: true, lang: "python", "robot = Robot()
    robot.interpret(robot_model)")]) #label("org45ed518")

#text(weight: "bold", [Проблем:]) Ако не задамо корак подразумевано је 0 (textX дефинише #emph[default]
вредности за базичне типове).
#heading(level: 2)[Object processor] #label("org82cbbc5")
#figure([#raw(block: true, lang: "python", "def move_command_processor(move_cmd):
    \u{22}\u{22}\u{22}
    This is object processor for MoveCommand instances.
    It implements a default step of 1 in case not given
    in the program.
    \u{22}\u{22}\u{22}

    if move_cmd.steps == 0:
        move_cmd.steps = 1")]) #label("orgaeec1bb")
#figure([#raw(block: true, lang: "textx", "MoveCommand:
  direction=Direction (steps=INT)?
;")]) #label("orgfaf55bf")
Регистрација процесора на мета\u{2d}моделу:

#figure([#raw(block: true, lang: "python", "# Register object processor for MoveCommand
        robot_mm.register_obj_processors({'MoveCommand': move_command_processor})")]) #label("org41b9d85")

Сада се робот понаша исправно.
#heading(level: 1)[textX језик] #label("org1a48c65")
#heading(level: 2)[textX граматичка правила] #label("orgdf13eb5")
textX метајезик, односно граматика, се састоји од скупа правила.

Свако правило има јединствено име дефинисано на почетку пре двотачке, и тело
правила које описује образац који мора бити препознат од стране парсера. Правило
се завршава карактером #raw(";"). Поред обрасца за парсирање, правила у исто време
дефинишу концепте циљног језика тј. његове апстрактне синтаксе, односно
метамодела. Ови концепти ће у време извршавања бити доступни као Пајтон класе и
биће коришћени за инстанцирање објеката које парсер препозна у улазном
текстуалном фајлу модела\u{2f}програма.

На пример, ако развијамо језик за опис цртежа, концепти овог језика би могли
бити #raw("Shape"), #raw("Line"), #raw("Circle") итд. Следеће правило се користи да опише концепт
#raw("Circle"):

#figure([#raw(block: true, lang: "text", "Circle:
  'Circle' '(' color=ID ',' size=INT ')'
;")]) #label("org35c9b4c")
#heading(level: 2)[Врсте правила] #label("orge4a2148")
Постоје три врсте правила у textX\u{2d}у:
#list(list.item[Обична правила (#emph[Common rules]),])#list(list.item[Апстрактна правила (#emph[Abstract rules]), i])#list(list.item[Правила препознавања (#emph[Match rules]).])
#heading(level: 2)[Обична правила] #label("orged155fc")
#text(weight: "bold", [Обична правила]) су правила која садрже бар један израз доделе (видети
#ref(label("org1a48c65"))), односно имају дефинисане атрибуте. Ова врста правила ће за
последицу имати динамичко креирање Пајтон класа које ће бити инстанциране за
време парсирања улазног стринга.

На пример:

#figure([#raw(block: true, lang: "text", "InitialCommand:
  'initial' x=INT ',' y=INT
;")]) #label("org86a7fac")

Правило #raw("InitialCommand") ће довести до креирања Пајтон класе истог имена чије
instance će imati dva atributa: #raw("x") и #raw("y").
#heading(level: 2)[Апстрактна правила] #label("org7dcf896")
#text(weight: "bold", [Апстрактна правила]) су правила која немају изразе доделе и референцирају бар
једно апстрактно или обично правило. Најчешће су дефинисана као уређени избор
других правила јер се користе да генерализују друга правила. На пример:

#figure([#raw(block: true, lang: "text", "Program:
  'begin'
    commands*=Command
  'end'
;

Command:
  MoveCommand | InitialCommand
;")]) #label("org97cdb35")

У овом примеру, Пајтон објекат у листи #raw("commands") ће бити или #raw("MoveCommand") или
#raw("InitialCommand"). #raw("Command") правило је апстрактно. Ово правило никада неће
резултовати Пајтон објектом.

Апстрактно правило може да се користи и у референцама повезивања (видети
#ref(label("org1a48c65"))). На пример:

#figure([#raw(block: true, lang: "text", "ListOfCommands:
  commands*=[Command][',']
;")]) #label("orga0ee561")

Такође, апстрактна правила могу референцирати правила препознавања и базичне
типове. На пример:

#figure([#raw(block: true, lang: "text", "Value:
    STRING | FLOAT | BOOL | Object
    | Array | \u{22}null\u{22}
;")]) #label("orgb72872b")

У овом примеру, базични типови као и препознавање стринг #raw("\u{22}null\u{22}") су правила
препознавања, али #raw("Object") и #raw("Array") су обична правила и стога је #raw("Value") правило
апстрактно.

Апстрактна правила могу бити сложена секвенца или уређени избор референци и
правила препознавања док год имамо бар једну референцу на апстрактно или обично
правило. На пример:

#figure([#raw(block: true, lang: "text", "Value:
  'id' /\d+-\d+/ | FLOAT | Object
;")]) #label("orga633ff8")

Правило чије тело се састоји само од једне референце препознавања на друго
апстрактно или обично правило је такође апстрактно правило:

#figure([#raw(block: true, lang: "text", "Value:
    OtherRule
;")]) #label("org2f56d7b")

Уколико је #raw("OtherRule") апстрактно или обично правило тада је и #raw("Value") апстрактно
правило.
#heading(level: 2)[Правила препознавања] #label("orgf4de156")
#text(weight: "bold", [Правила препознавања]) су правила које немају директних или индиректних израза
доделе, односно сва референцирана правила су такође правила препознавања. Обично
се користе да дефинишу набројиве вредности или сложена препознавања стринга која
се не могу исказати обични регуларним изразом.

На пример:

#figure([#raw(block: true, lang: "text", "Widget:
  \u{22}edit\u{22}|\u{22}combo\u{22}|\u{22}checkbox\u{22}|\u{22}togglebutton\u{22}
;

Name:
  STRING|/(\w|\+|-)+/
;")]) #label("org1c3fb44")

Ова правила могу да се користе искључиво у референцирању преко препознавања,
односно не могу се користити у референцама везе јер не дефинишу "праве" објекте.
Њихов тип у време извршавања је увек основни Пајтон тип (#raw("str"), #raw("int"), #raw("bool"), #raw("float")).

Сва базична, имплицитна, textX правила (нпр. #raw("INT"), #raw("STRING"), #raw("BASETYPE")) су правила
препознавања.
#heading(level: 2)[Базична правила\u{2f}типови] #label("org74c6c39")
#figure([#image(sys.inputs.file-6)]) #label("orgd4f6070")

#list(list.item[#raw("ID") \u{2d}\u{2d}\u{2d} препознаје #raw("[^\d\W]\w*\b"). Конвертује препознати низ карактера у Пајтон
#raw("str") тип.])#list(list.item[#raw("INT") \u{2d}\u{2d}\u{2d} препознаје целе бројеве #raw("[-+]?[0-9]+"). Конвертује препознати низ
карактера у Пајтон #raw("int") тип.])#list(list.item[#raw("FLOAT") \u{2d}\u{2d}\u{2d} препознаје реалне бројеве. Конвертује препознати низ карактера у
Пајтон #raw("float") тип.])#list(list.item[#raw("BOOL") \u{2d}\u{2d}\u{2d} препознаје булову вредност (#raw("0/1"), #raw("true/false")). Препознати низ
карактера се конвертује у Пајтон #raw("bool") тип.])#list(list.item[#raw("STRING") \u{2d}\u{2d}\u{2d} препознаје стринг под једноструким или двоструким знацима навода.
Знаци навода се могу наћи унутар стринга, али уколико су истог типа као и
наводи који се користе да ограниче стринг мора се користити префиx #raw("'\'") (енг.
#emph[backslash escaping]).])

Препознати уграђени типови се аутоматски конвертују у одговарајуће Пајтон типове
и постављају на подразумевану вредност у оквиру опционих препознавања.
#heading(level: 2)[Препознавања (#emph[Matches])] #label("org997757b")
Поред уграђених базичних правила, правила препознавања су правила најнижег
нивоа. Представљају основне градивне јединице сложенијих правила. Ова правила ће
конзумирати део улаза уколико је препознавање успешно.

Постоје две врсте препознавања: #emph[препознавање стринга] и #emph[препознавање регуларног
израза].
#heading(level: 2)[Препознавање стринга] #label("orgeaa656b")
#text(weight: "bold", [Препознавање стринга]) се пише као стринг у једноструким или двоструким знацима
навода. Овако написано правило препознаће задати стринг са улаза у облику у ком
је задат.

Примери:

#figure([#raw(block: true, lang: "text", "'blue'
'zero'
'person'")]) #label("org872d2c0")
#heading(level: 2)[Препознавање регуларног израза] #label("orgbfd862d")
#text(weight: "bold", [Препознавање регуларног израза]) користи Пyтхон регуларне изразе#super[1] који се наводе
унутар #raw("/ /"). Дакле, дефинишу класу стрингова који се могу наћи на улазу.

Примери:

#list(list.item[#raw(block: false, "/\d+/") \u{2d}\u{2d}\u{2d} препознаје стринг од једне или више цифри.])#list(list.item[#raw(block: false, "/\d{3,4}-\d{3}/") \u{2d}\u{2d}\u{2d} 3 или 4 цифре, затим '\u{2d}' па затим још 3 цифре.])#list(list.item[#raw(block: false, "/[^}]*/") \u{2d}\u{2d}\u{2d} нула или више карактера различитих од '}'.])

#enum(enum.item(1)[За увод у регуларне изразе на програмском језику Пајтон видети
#link("https://docs.python.org/3/howto/regex.html")],
)
#heading(level: 2)[Секвенца (#emph[Sequence])] #label("org4c664d1")
Секвенца је најједноставнији сложени израз који се добија навођењем подизраза
један иза другог. На пример, следеће правило:

#figure([#raw(block: true, lang: "text", "Colors:
  \u{22}red\u{22} \u{22}green\u{22} \u{22}blue\u{22}
;")]) #label("org66afd73")

је дефинисано као секвенца која се састоји од три стринг препознавања (#raw("red"),
#raw("greeen") i #raw("blue")). Секвенца ће успешно бити препозната ако су препознати сви њени
подизрази у редоследу у ком су наведени. Претходно #raw("Colors") правило ће препознати
следећи стринг:

#figure([#raw(block: true, lang: "text", "red green   blue")]) #label("orgc79c24d")

Уколико је укључено аутоматско прескакање празних карактера (#emph[whitespace skip]),
што је подразумевано, тада се може између два подизраза у секвенци наћи
произвољан број празних карактера као што је приказано у претходном примеру.
#heading(level: 2)[Уређени избор (#emph[Ordered choice])] #label("orgdc06d9c")
Уређени избор се наводи као скуп израза раздвојених знаком #raw("|"). Овај израз ће
покушати да препозна подизразе с лева на десно. Први израз који се успешно
препозна биће коришћен као резултат препознавања.

На пример, следеће правило

#figure([#raw(block: true, lang: "text", "Color:
  \u{22}red\u{22} | \u{22}green\u{22} | \u{22}blue\u{22}
;")]) #label("org6e43e74")

ће препознати или реч #raw("red") или #raw("green") или #raw("blue") при чему ће парсер да покуша сваки
од подизраза с лева на десно.

Ово је у супротности са класичним парсерима где је оператор избора неуређен.
textX као технологију за парсирање користи Arpeggio парсер који је базиран на
PEG формализму где је оператор избора уређен. Због тога парсирање не може бити
вишезначно, односно ако се улаз исправно парсира може постојати само једно
стабло парсирања.
#heading(level: 2)[Опционо препознавање (#emph[Optional])] #label("orgea069ff")
Опционо препознавање је израз који ће да покуша да препозна свој подизраз ако
може, али ће успети у препознавању и уколико подизраз није препознат.

На пример, уколико имамо правило

#figure([#raw(block: true, lang: "text", "MoveUp:
  'up' INT?
;")]) #label("orgb167d4d")

#raw("INT") ће бити опционо (јер је наведен знак #raw("?")) па ће бити могуће навести број иза
речи #raw("up"), али неће бити обавезно.

Следеће линије ће бити успешно препознате претходним правилом:

#figure([#raw(block: true, lang: "text", "up 45
up 1
up")]) #label("org940fb9f")

Опциони изрази могу бити и сложенији. На пример, код правила

#figure([#raw(block: true, lang: "text", "MoveUp:
  'up' ( INT | FLOAT )?
;")]) #label("org7daf451")

имамо да је уређени избор опциони тако да ћемо у овом случају моћи навести цео
или реалан број (#raw("INT") или #raw("FLOAT")), али нисмо обавезни да то учинимо.
#heading(level: 2)[Понављања (#emph[Repetitions])] #label("org2a9ea33")
#text(weight: "bold", [Понављање нула или више пута]) (#emph[zero or more]) се наводи употребом оператора #raw("*")
иза подизраза. Подизраз ће у том случају бити препознат нула или више пута.

На пример, уколико имамо правило

#figure([#raw(block: true, lang: "text", "Colors:
  (\u{22}red\u{22} | \u{22}green\u{22} | \u{22}blue\u{22})*
;")]) #label("org1f33c58")
понављање је примењено на уређени избор унутар заграде. Стога, парсер ће да
покуша да препозна елементе уређеног избора с лева на десно и када обави успешно
препознавање понављаће га док год успева да препозна једну од задатих речи.

Следећи улаз ће бити успешно парсиран:

#figure([#raw(block: true, lang: "text", "red blue green")]) #label("org7b73922")

али такође и

#figure([#raw(block: true, lang: "text", "red blue blue red red blue green")]) #label("org049f7a8")

или празан стринг (препознавање нула пута).
#heading(level: 2)[Понављања (#emph[Repetitions])] #label("org0f2d9c4")
#text(weight: "bold", [Понављање једном или више пута]) се наводи употребом оператора #raw("+") иза подизраза.
Подизраз ће у том случају бити препознат један или више пута.

На пример, уколико имамо правило које је слично претходном, али користи овај
облик понављања

#figure([#raw(block: true, lang: "text", "Colors:
  (\u{22}red\u{22} | \u{22}green\u{22} | \u{22}blue\u{22})+
;")]) #label("org44a349e")

обавезно је навођење бар једне боје, али може се навести и више у произвољном
редоследу и са понављањем као и код претходног правила. Дакле, ово правило не
препознаје празан стринг.
#heading(level: 2)[Доделе (#emph[Assignments])] #label("org3603c7f")
Доделе се користе као део поступка за дедукцију метамодела. Свака додела
резултује креирањем атрибута мета\u{2d}класе креиране textX правилом.

Свако правило има своју леву страну (LHS) и десну страну (RHS). LHS је увек име
атрибута који ће бити креиран док је десна страна правило које одређује шта се
препознаје на датом месту као и тип објекта који ће бити инстанциран и додељен
атрибуту при парсирању и инстанцирању модела. РХС је увек референца на друго
правило или једноставно препознавање.

На пример:

#figure([#raw(block: true, lang: "text", "Person:
  name=Name ',' surname=Surname ','
    age=INT ',' height=INT ';'
;")]) #label("org4947483")

#text(weight: "bold", [Напомена:]) Правило #raw("Name") и #raw("Surname") су дефинисани у граматици, али нису дати у овом
примеру.
#heading(level: 2)[Доделе \u{2d} креирање атрибута] #label("org9a7f438")
Претходни пример описује правило и мета\u{2d}класу #raw("Person") које ће парсирати и
инстанцирати објекат са четири атрибута.

#list(list.item[#raw("name") \u{2d}\u{2d}\u{2d} где ће се правилом #raw("Name") препознати објекат мета\u{2d}класе #raw("Name") са улаза,
инстанцирати и доделити атрибуту,])#list(list.item[#raw("surname") \u{2d}\u{2d}\u{2d} исто као и за #raw("name"), али се користи правило #raw("Surname") и додељује
атрибуту #raw("surname"),])#list(list.item[#raw("age") \u{2d}\u{2d}\u{2d} користиће се уграђено базично правило #raw("INT") и број који се препозна
конвертоваће се у Пајтон #raw("int") тип и доделити атрибуту,])#list(list.item[#raw("height") \u{2d}\u{2d}\u{2d} исто као и за атрибут #raw("age"), али ће се препознати број доделити
#raw("height") атрибуту #raw("Person") инстанце.])

Пример:
#figure([#raw(block: true, lang: "text", "Petar, Petrović, 25, 185;")]) #label("orge5bfdad")

Зарези, дати у претходном примеру, који ће бити препознати између препознавања
правила доделе, као и тачка\u{2d}зарез на крају, морају се наћи у улазном стрингу,
али ће бити одбачени приликом креирања модела јер немају никакво семантичко
значење. Кажемо да представљају #emph[синтаксни шум].
#heading(level: 2)[Доделе \u{2d} конверзије и вредности] #label("org33ba5fa")
Увек када је на RHS неки од базичних типова (нпр. #raw("INT"), #raw("BOOL"), #raw("FLOAT"), #raw("ID")) доћи ће
до конверзије препознатог стринга у одговарајући Пајтон тип (нпр. #raw("int"), #raw("bool"),
#raw("float"), #raw("str")).

Ако је на RHS препознавање стринга или регуларног израза као у следећем примеру:

#figure([#raw(block: true, lang: "text", "Color:
  color=/\w+/
;")]) #label("org1ade1f9")

тада ће атрибут на LHS (#raw("color")) бити постављен на вредност коју препозна RHS
правило.

Уколико се на RHS налази референца на друго правило тада ће бити препознат и
инстанциран објекат класе датог правила и атрибут на LHS ће бити референца на
дату инстанцу. На пример:

#figure([#raw(block: true, lang: "text", "Project:
  'project' name=ID 'lead' lead=Person
;")]) #label("org462a4cd")


#raw("lead") атрибут биће референца на објекат класе #raw("Person") а правило #raw("Person") мора
успешно препознати овај објекат иза кључне речи #raw("lead").

Постоје четири врсте доделе: #emph[obična], #emph[bulova], #emph[nula ili više] и #emph[jedan ili više].
#heading(level: 2)[Обична додела] #label("orgba747a2")
#text(weight: "bold", [Обична додела ( = )]) ће обавити препознавање RHS једном и објекат који се креира
доделити атрибуту на LHS.

#figure([#raw(block: true, lang: "text", "a=INT
b=FLOAT
c=/[a-Z0-9]+/
dir=Direction")]) #label("orgb1de037")
#heading(level: 2)[Булова додела] #label("orgb0596d5")
#text(weight: "bold", [Булова додела ( ?= )]) ће поставити LHS атрибут на #raw("True") уколико је RHS препознат
на улазу или на #raw("False") уколико није.

#figure([#raw(block: true, lang: "text", "cold ?= 'cold'
number_given ?= INT")]) #label("org2c43d52")
#heading(level: 2)[Додела нула\u{2f}један или више] #label("org2a666c6")
#text(weight: "bold", [Додела нула или више ( \u{2a}= )]) ће препознавати RHS све док успева и све објекте
редом сместити у Пајтон листу која је на LHS. Ако препознавање не успе ни једном
LHS ће бити празна листа.

#figure([#raw(block: true, lang: "text", "commands*=Command  // опциони низ команди
numbers*=INT       // опциони низ целих бројева")]) #label("orgef350bd")

#text(weight: "bold", [Додела један или више ( \u{2b}= )]) ради исто као претходна с тим што RHS мора да
препозна бар један објекат тј. LHS никада неће бити празна листа.

#figure([#raw(block: true, lang: "text", "numbers+=INT       // низ целих бројева, мора постојати бар један")]) #label("org7e98f85")
#heading(level: 2)[Референце (#emph[References])] #label("orgce3c942")
Правила могу да се међусобно референцирају. Референце се наводе на RHS. Постоје
два начина референцирања правила: #emph[референцирање преко препознавања] и
#emph[референцирање преко везе].
#heading(level: 2)[Референцирање преко препознавања] #label("org926503c")
#text(weight: "bold", [Референцирање преко препознавања]) се дефинише простим навођењем имена неког
другог правила. Можемо такође рећи и да правило које врши референцирање #emph[позива]
правило које се референцира. На месту референцирања textX ће покушати да
препозна циљно правило у целости и, уколико га препозна, инстанцираће га и
доделити атрибуту на левој страни. Референцирање преко препознавања има
семантику садржавања. Објекат који референцира #emph[садржи] објекат који се
референцира. Као додатну помоћ textX ће аутоматски креирати Пајтон референцу
#raw("парент") на објекту који се референцира. Овај атрибут ће референцирати на објекат
који референцира.

#figure([#raw(block: true, lang: "text", "Structure:
  'structure' '{'
    elements*=StructureElement
  '}'
;")]) #label("orgb19e9eb")

У претходном примеру правило #raw("Structure") референцира преко препознавања правило
#raw("StructureElement"). Унутар тела #raw("Structure") концепта, биће препознато нула или више
инстанци #raw("StructureElement") класе. Инстанце ће бити додељене #raw("elements") атрибуту
који ће, у овом случају, бити типа Пајтон листе.
#heading(level: 2)[Референцирање преко везе] #label("orge66b195")
#text(weight: "bold", [Референцирање преко везе]) наводи име циљног правила унутар угластих заграда. На
овом месту, парсер ће покушати да препозна име циљног објекта а не објекат у
целости. Циљни објекат мора да буде дефинисан негде друго унутар модела. Уколико
је објекат са датим именом пронађен, textX ће аутоматски да атрибуту на левој
страни додели вредност референце на циљни објекат.

#figure([#raw(block: true, lang: "text", "ScreenType:
  'screen' name=ID \u{22}{\u{22}
  '}'
;

ScreenInstance:
  'screen' type=[ScreenType]
;")]) #label("org8a73417")

#raw("type") атрибут који припада правилу #raw("ScreenInstance") референцира преко везе правило
#raw("ScreenType").

Ово би био пример правилне употребе:

#figure([#raw(block: true, lang: "text", "// Ово је дефиниција ScreenType објекта
// који се зове Introduction
screen Introduction {

}

// А ово је инстанца ScreenInstance која
// референцира претходни Introduction ScreenType.
screen Introduction")]) #label("orga2dcf30")

Иза кључне речи #raw("screen") на последњој линији неће бити препознат цео #raw("ScreenType"),
као што би то био случај са референцирањем преко препознавања, већ ће бити
препознато име (у овом случају #raw("Introduction")) #raw("ScreenType") објекта и аутоматски ће
веза бити разрешена у референцу на дати објекат која ће бити додељена #raw("type")
атрибуту #raw("ScreenInstance") инстанце.

Подразумевано се користи #raw("ID") правило за препознавање назива циљног објекта.
Уколико желимо то да променимо можемо урадити следеће:

#figure([#raw(block: true, lang: "text", "ScreenInstance:
  'screen' type=[ScreenType|WORD]
;")]) #label("org38849d1")

У претходном примеру ће за препознавање имена циљног објекта бити коришћено
правило #raw("WORD").
#heading(level: 2)[Синтаксни предикати (#emph[Syntactic predicates])] #label("org0e5217e")
Синтаксни предикати су оператори који се користе за имплементацију погледа
унапред (енг. #emph[lookaheads]). Поглед унапред је техника која омогућава да се донесе
одлука о примени правила за парсирање на основу дела улазног стринга који следи
без да се тај део стринга обради тј. конзумира. Ови оператори се наводе као
префикс за неко textX правило. Синтаксни предикат заједно са правилом које следи
чини ново правило које успева или не успева без конзумирања улаза. Најчешће ће
овакво правило бити део секвенце чиме ће се омогућити одустајање од даље анализе
секвенце уколико предикат није успео.

Постоје две врсте синтаксних предиката у textX\u{2d}у: #raw("Not") и #raw("And").
#heading(level: 2)[Негативни поглед унапред] #label("org85688ec")
#text(weight: "bold", [#raw("Not") \u{2d}\u{2d}\u{2d} негативни поглед унапред (#raw("!"))]) \u{2d}\u{2d}\u{2d} Успева уколико правило које следи иза
#raw("!") предиката не препознаје наставак улазног стринга и обрнуто.

Пример проблема:

#figure([#raw(block: true, lang: "text", "Expression: Let | ID | NUMBER;
Let:
    'let'
        expr+=Expression
    'end'
;")]) #label("org3bdfbb3")

У претходном примеру имамо рекурзивно правило #raw("Let") које се индиректно референцира
преко правила #raw("Expression"). Проблем је у томе што ће #raw("ID") правило које се позива из
#raw("Expression") правила препознати кључну реч #raw("end") што ће довести до тога да ниједно
#raw("Let") правило неће моћи успешно да се заврши.

Да бисмо решили овај проблем модификујемо граматику на следећи начин:

#figure([#raw(block: true, lang: "text", "Expression: Let | MyID | NUMBER;
Let:
    'let'
        expr+=Expression
    'end'
;
Keyword: 'let' | 'end';
MyID: !Keyword ID;")]) #label("org91987f7")

Уместо директне употребе уграђеног #raw("ID") правила уводимо правило #raw("MyID") које користи
#raw("Not") синтаксни предикат да спречи препознавање кључних речи #raw("let") и #raw("end") као изразе
#raw("Expression") правила. На овај начин ће #raw("end") бити конзумирано као завршетак #raw("Let")
правила и граматика ће исправно функционисати.
#heading(level: 2)[Позитивни поглед унапред] #label("org253ae7f")
#text(weight: "bold", [#raw("And") \u{2d}\u{2d}\u{2d} позитивни поглед унапред (#raw("&"))]) \u{2d}\u{2d}\u{2d} Успева уколико правило које следи иза
#raw("&") предиката препознаје наставак улазног стринга и обрнуто.

Пример:

#figure([#raw(block: true, lang: "text", "Model:
    elements+=Element
;
Element:
    AbeforeB | A | B
;
AbeforeB:
    a='a' &'b'      // правило успева само
                    // ако 'b' следи после 'a'
;
A: a='a';
B: a='b';")]) #label("org18b0e47")

Уколико имамо улазни стринг #raw("\u{22}a a a b\u{22}"), прва два #raw("a") токена ће бити препознати
правилом #raw("A") док ће трећи токен #raw("а") бити препознат правилом #raw("AbeforeB"). Иако се увек
проверава прво #raw("AbeforeB"), правило неће успети за прва два #raw("a") токена јер иза не
следи токен #raw("b"). Последњи токен ће бити препознат правилом #raw("B") јер га претходно
успешно правило #raw("AbeforeB") није конзумирало са улаза.
#heading(level: 2)[Уклањање препознатог улаза (#emph[Match Suppression])] #label("orgddec88c")
Некада је потребно дефинисати правило препознавања које ће вратити само део
препознатог улаза. У овом случају можемо користити оператор за уклањање
препознатог улаза (#raw("-")) који се наводи после израза препознавања.

На пример:

#figure([#raw(block: true, lang: "text", "FullyQualifiedID[noskipws]:
    /\s*/-
    QuotedID+['.']
    /\s*/-
;
QuotedID:
    '\u{22}'?- ID '\u{22}'?-
;")]) #label("orga7fbd63")

У претходном примеру желимо да препознамо потпуно квалификоване идентификаторе
(#emph[Fully Qualified IDs]) где делови имена могу бити под знацима навода. На пример
\u{2d}\u{2d}\u{2d} #raw("first.\u{22}second\u{22}.third"). Такође, желимо да уклонимо знаке навода из имена.
Један начин би био да радимо постпроцесирање после завршеног парсирања, али је
за ту намену елегантније решење употреба оператора #raw("-").

Правило #raw("FullyQualifiedID") користи #raw("noskipws") модификатор да би онемогућио појаву
празних карактера унутар потпуно квалификованих имена. Због тога се морају на
почетку и на крају препознати празни карактери и одбацити уколико постоје што се
обавља правилом #raw("/\s*/-").

Правило #raw("FullyQualifiedID") даље препознаје један или више #raw("QuotedID") одвојених
тачкама. Правило #raw("QuotedID") препознаје #raw("ID") које опционо може бити унутар знакова
навода а затим препознате знакове навода одбацује употребом #raw("\u{22}-\u{22}") оператора.
#heading(level: 2)[Модификатори понављања (#emph[Repetition modifiers])] #label("org0a8d86a")
Користе се за модификацију понашања свих оператора понављања (#raw("*"), #raw("+"), #raw("*="),
#raw("+=")). Наводе се унутар угластих заграда иза оператора понављања. Може се
навести више модификатора и у том случају се раздвајају зарезима.

У текућој имплементацији је дефинисано два модификатора понављања: модификатор
сепарације и модификатор краја линије.
#heading(level: 2)[Модификатор сепарације] #label("org83be18a")
#text(weight: "bold", [Модификатор сепарације (#emph[Separator modifier])]) се користи да дефинише сепаратор код
вишеструког препознавања. Наводи се као једноставно препознавање (препознавање
стринга или регуларног израза).

#figure([#raw(block: true, lang: "text", "numbers*=INT[',']")]) #label("org5ec2eae")

У овом примеру имамо препознавање низа целобројних вредности. Као модификатор
сепарације дефинисан је зарез па се очекује да између свака два броја која се
препознају буде наведен зарез. На пример:

#figure([#raw(block: true, lang: "text", "45, 47, 3, 78")]) #label("org0887e8a")

Такође, можемо дефинисати као модификатор препознавање регуларног израза. На
пример:

#figure([#raw(block: true, lang: "text", "fields += ID[/;|,|:/]")]) #label("org5fe7c92")

У овом случају као модификатор сепарације наводи се регуларни израз који
дефинише да ће низ поља бити раздвојено карактером који може бити тачка\u{2d}зарез,
зарез или двотачка. Тако ће успешно да се препозна следећи стринг:

#figure([#raw(block: true, lang: "text", "first, second; third, fourth: fifth")]) #label("orgf52cf7a")
#heading(level: 2)[Модификатор краја линије] #label("orge034f5f")
#text(weight: "bold", [Модификатор краја линије (#emph[End\u{2d}of\u{2d}line terminate modifier])]) се наводи као кључна
реч #raw("eolterm"). Уколико је укључен овај модификатор оператори понављања ће
завршити понављање на крају текућег реда тј. радиће само за текући ред.

#figure([#raw(block: true, lang: "text", "STRING*[',', eolterm]")]) #label("org80dbc7c")

Код овог примера вршимо препознавање нула или више стрингова раздвојених
зарезима, али само унутар текућег реда. Ако задамо следећи улаз:

#figure([#raw(block: true, lang: "text", "\u{22}first\u{22}, \u{22}second\u{22}, \u{22}third\u{22}
\u{22}fourth\u{22}")]) #label("orgc8e6155")

правило ће препознати и конзумирати само прави ред. Стринг #raw("\u{22}fourth\u{22}") неће бити
обухваћен.

Треба обратити пажњу да употреба #raw("eolterm") модификатора ступа на снагу одмах по
завршетку претходног препознавања.

#figure([#raw(block: true, lang: "text", "Conditions:
  'conditions' '{'
    varNames+=WORD[eolterm]
  '}'")]) #label("org4f1e83a")

У овом примеру један или више #raw("WORD") препознавања мора бити обављено одмах иза
#raw("conditions {"), на истој линији. То није била наша намера јер не желимо да
ограничимо корисника већ да му допустимо да пређе у следећи ред и, уколико жели,
направи произвољан број празних редова. Да би ово омогућили морамо да
препознамо и одбацимо све празне карактере пре почетка првог успешног #raw("WORD")
препознавања. То радимо на следећи начин:

#figure([#raw(block: true, lang: "text", "Conditions:
  'conditions' '{'
    /\s*/
    varNames+=WORD[eolterm]
  '}'")]) #label("org2d073bf")

Искористили смо препознавање регуларног израза #raw("/\s*/") да прескочимо све празне
карактере, укључујући и крајеве линија, све до првог успешног препознавања
#raw("WORD") правила.
#heading(level: 1)[Метамодели] #label("org100770d")
У textX\u{2d}u метамодел је објекат који садржи све релевантне податке о језику, све
класе језика, као и парсер који ће бити у стању да чита програме\u{2f}моделе на датом
језику и креира објектни модел текстуалне репрезентације. Метамодели се креирају
Пајтон функцијама #raw("metamodel_from_file") и #raw("metamodel_from_str") из пакета
#raw("textx.metamodel"). Ове функције примају textX граматику језика а враћају метамодел
објекат уколико граматика нема грешака или одговарајући изузетак уколико грешка
постоји.

Пример креирања метамодела из граматике дефинисане у фајлу:

#figure([#raw(block: true, lang: "python", "from textx.metamodel import metamodel_from_file
my_metamodel = metamodel_from_file('my_grammar.tx')")]) #label("orgb063fc8")

Парсирање текстуалне репрезентације модела и креирање меморијске објектне
репрезентације се обавља позивом метода #raw("model_from_file") i #raw("model_from_str")
метамодел објекта.

#figure([#raw(block: true, lang: "python", "my_model = my_metamodel.model_from_file('some_input.md')")]) #label("orga1ebb52")
#heading(level: 2)[Корисничке класе] #label("org248d27c")
За свако обично textX правило динамички се креира Пајтон класа истог назива у
метамоделу. Ове класе ће бити инстанциране за време парсирања када се успешно
препозна запис објекта у улазном стрингу. Инстанце ће чинити део објектног графа
односно модела.

У већини случајева динамички креиране класе ће бити сасвим довољне, али постоје
ситуације код којих ћемо желети да сами дефинишемо класу која ће бити
инстанцирана при препознавању одређеног правила. Да би ово постигли користимо
параметар #raw("classes") при инстанцирању метамодела. Овај параметар представља листу
корисничких класа чија имена морају бити иста као имена правила за које ће бити
инстанциране.

#figure([#raw(block: true, lang: "python", "from textx.metamodel import metamodel_from_str

grammar = '''
EntityModel:
  entities+=Entity
;

Entity:
  'entity' name=ID '{'
    attributes+=Attribute
  '}'
;

Attribute:
  name=ID ':' type=[Entity]
;
'''

class Entity:
  def __init__(self, parent, name, attributes):
    self.parent = parent
    self.name = name
    self.attributes = attributes


# Користимо \u{22}нашу\u{22} Entity класу.
# \u{22}Attribute\u{22} класа ће бити креирана динамички.
entity_mm = metamodel_from_str(grammar, classes=[Entity])")]) #label("org6a0a34e")

Метамодел #raw("entity_mm") се може користити да инстанцира моделе где ће при
инстанцирању #raw("Entity") класе бити коришћена Пyтхон класа из претходног примера.
Класа #raw("Attribute") која је последица истоименог правила ће бити креирана
динамички.

Корисничка класа треба да има конструктор који прима све атрибуте који су
дефинисани граматичким правилом (у овом случају #raw("name") и #raw("attributes")). Уколико
класа представља дете у вези родитељ\u{2d}дете (видети наредну секцију), тада је као
први параметар обавезан #raw("parent") који представља везу према објекту родитељу.
#heading(level: 2)[Везе родитељ\u{2d}дете] #label("org046ba6d")
Често у моделима постоји инхерентна веза типа родитељ\u{2d}дете. У претходном примеру
свака инстанца #raw("Attribute") класе припада некој инстанци #raw("Entity") класе.

textX има аутоматску подршку за овај тип везе и динамички креира #raw("parent") атрибут
на свим објектима типа дете.

Обратити пажњу да је, код дефинисања корисничких класа, неопходно обезбедити
овај параметар као први параметар конструктора код свих класа које представљају
дете у вези родитељ\u{2d}дете јер ће textX позивати конструктор уз прослеђивање
референце на родитељски објекат приликом парсирања.
#heading(level: 2)[Процесори] #label("orga807b46")
За дефинисање додатне статичке семантике модела теxтX омогућава дефинисање
процесора. Процесори су Пајтон објекти који се могу позвати (#emph[callables]) и који
могу да додатно провере и модификују препознати објекат у току парсирања.
Користе се код правила која није могуће дефинисати граматиком.

Постоје две врсте процесора: процесори објеката и процесори модела.

#text(weight: "bold", [Процесори објеката (#emph[object processors])]) \u{2d}\u{2d}\u{2d} су процесори који се позивају
после сваког успешног препознавања објекта. Као једини параметар добијају
објекат који требају да провере\u{2f}модификују.

#text(weight: "bold", [Процесори модела (#emph[Model processors])]) \u{2d}\u{2d}\u{2d} су процесори који се позивају када се
цео модел успешно парсира. Као параметар добијају метамодел и модел. Могу да
обаве произвољну проверу и\u{2f}или модификацију модела. Региструју се позивом методе
#raw("register_model_processor") над метамодел објектом.

#figure([#raw(block: true, lang: "python", "from textx.metamodel import metamodel_from_file

# Процесор модела је функција који ће прихватити метамодел
# и модел као своје параметре.
def check_some_semantics(metamodel, model):
  ...
  ... Vrši proveru modela i baca TextXSemanticError
  ... ako su semantička pravila narušena.

my_metamodel = metamodel_from_file('mygrammar.tx')

# Региструјемо модел процесор на инстанци метамодела
my_metamodel.register_model_processor(check_some_semantics)

# Парсирамо модел. Функција check_some_semantics ће бити
# аутоматски позвана након успешног парсирања да обави
# додатну семантичку проверу модела.
my_metamodel.model_from_file('some_model.ext')")]) #label("org48eab14")
#heading(level: 2)[Уграђени објекти] #label("orgda35936")
Често је потребно да у сваком моделу имамо објекте који су увек присутни, без
потребе да их корисник дефинише, и које можемо референцирати из остатка модела.
Да би олакшали посао кориснику можемо на нивоу метамодела регистровати уграђене
објекте. Тако регистровани објекти биће имплицитно део сваког модела. Класичан
пример су примитивни типови (нпр. #raw("integer"), #raw("string"), #raw("float")). Ако желимо да ово
буду прави објекти а не само кључне речи, креираћемо нове објекте и регистровати
над метамоделом. Наравно, да би могли инстанцирати класе у Пајтон\u{2d}у потребно је
да их региструјемо као корисничке класе (видети #ref(label("org100770d"))).

#figure([#raw(block: true, lang: "python", "class Entity:
  def __init__(self, parent, name, attributes):
      self.parent = parent
      self.name = name
      self.attributes = attributes

entity_builtins = {
        'integer': Entity(None, 'integer', []),
        'string': Entity(None, 'string', [])
}
entity_mm = metamodel_from_file(
  'entity.tx',
  classes=[Entity],        # Регистровање Entity
                           # корисничке класе,
  builtins=entity_builtins # Регистровање integer и string
)                          # уграђених Entity објеката")]) #label("orgd3f0433")

У претходном примеру региструјемо корисничку класу #raw("Entity") и затим две њене
инстанце (#raw("integer") и #raw("string")) које ће представљати уграђене типове за атрибуте.

#list(list.item[За више детаља видети пример
#link("https://github.com/igordejanovic/textX/tree/master/examples/Entity")])
#heading(level: 2)[Аутоматска иницијализација атрибута] #label("org936a16e")
Вредности атрибута објеката препознатих у улазном стрингу биће подешени на
вредности дате у тексту. Уколико је атрибут опциони и није наведен у улазном
стрингу свакако ће бити креиран на објекту. Његова вредност биће подразумевана и
зависиће од типа.

Подразумеване вредности за базичне textX типове су следеће:
#list(list.item[#raw("ID") \u{2d}\u{2d}\u{2d} празан стринг \u{2d}\u{2d}\u{2d} #raw("''")])#list(list.item[#raw("INT") \u{2d}\u{2d}\u{2d} int \u{2d}\u{2d}\u{2d} #raw("0")])#list(list.item[#raw("FLOAT") \u{2d}\u{2d}\u{2d} float \u{2d}\u{2d}\u{2d} #raw("0.0")])#list(list.item[#raw("BOOL") \u{2d}\u{2d}\u{2d} bool \u{2d}\u{2d}\u{2d} #raw("False")])#list(list.item[#raw("STRING") \u{2d}\u{2d}\u{2d} празан стринг \u{2d}\u{2d}\u{2d} #raw("''")])

Сваки атрибут са мултиплицитетом нула или више (#raw("*=")) а који не препознаје нити
један елемент са улаза биће иницијализован на празну Пајтон листу. Уколико је
мултиплицитет један или више (#raw("+=")) то захтева препознавање бар једног објекта на
улазу, па ће вредност атрибута бити Пајтон листа са свим препознатим објектима.

Иако овај механизам аутоматске иницијализације доста олакшава посао, постоје
ситуације када може да засмета. На пример, проблем настаје уколико желимо да
разликујемо ситуацију у којој корисник није дефинисао опциони елемент од
ситуације у којој је дефинисао, али је ставио подразумевану вредност.

Механизам аутоматске иницијализације се може искључити постављањем параметра
#raw("auto_init_attributes") на #raw("False") при позиву конструктора метамодела. У том
случају, уколико вредност није наведена на улазу, биће постављена на #raw("None"). То
важи за све обичне доделе (#raw(block: false, "=")). Код опционих додела (#raw(block: false, "?=")) вредност ће бити
#raw("False") уколико није наведена. Код додела са мултиплицитетом вишим од 1 (#raw(block: false, "*=") и
#raw(block: false, "+=")) атрибут ће увек бити иницијализован на Пајтон листу.
#heading(level: 2)[Конфигурација парсера] #label("org53505e0")
Arpeggio парсер креиран од стране textX\u{2d}а се може конфигурисати са становишта
осетљивости на величину слова (#emph[case\u{2d}sensitivity]), третирању празних карактера
(#emph[white\u{2d}space handling]) и аутоматској детекцији кључних речи.
#heading(level: 3)[Конфигурација парсера \u{2d} #emph[case\u{2d}sensitivity]] #label("orgdfd11a8")
Подразумевано, парсер је осетљив на величину слова. Тако ће речи #raw("Entity") и #raw("entity")
бити третиране као различите. Уколико је наш језик такав да величина слова није
битна можемо при креирању метамодела проследити параметар #raw("ignore_case") са
вредношћу #raw("True").

#figure([#raw(block: true, lang: "python", "from textx.metamodel import metamodel_from_file

my_metamodel = metamodel_from_file('mygrammar.tx',
                                   ignore_case=True)")]) #label("org2aff996")
#heading(level: 3)[Конфигурација парсера \u{2d} #emph[whitespaces]] #label("org1a69f4c")
Парсер подразумевано прескаче празне карактере (#raw("spaces"), #raw("tabs")). Због тога у
граматикама није потребно експлицитно препознавати празне карактере. Постоје
језици где су празни карактери сигнификантни. У таквим случајевима можемо
искључити прескакање празних карактера параметром #raw("skipws") који постављамо на
#raw("False"). Додатни механизам је редефинисање скупа празних карактера са
параметром #raw("ws") који представља стринг који се састоји од карактера из скупа
празних карактера.

#figure([#raw(block: true, lang: "python", "from textx.metamodel import metamodel_from_file
my_metamodel = metamodel_from_file('mygrammar.tx',
                                   skipws=False, ws='\s\n')")]) #label("org3dddafa")

Ова правила се могу дефинисати и на нивоу појединачних правила граматике.
#heading(level: 3)[Конфигурација парсера \u{2d} #emph[keywords]] #label("org5ee2f10")
При креирању ЈСД обично је пожељно да се кључне речи препознају у целини,
односно да се не препознају уколико су делови других елемената језика (нпр.
идентификатора). Због тога, textX може да буде конфигурисан да препознаје све
што изгледа као идентификатор или кључна реч у целости. На пример, за #raw("Entity")
језик кључна реч #raw("entity") не би смела да се препозна у стрингу #raw("entity1").

Могли бисмо да постигнемо одговарајући ефекат употребом регуларних израза и
параметра за препознавање границе речи:

#figure([#raw(block: true, lang: "text", "Enitity:
/\bentity\b/ name=ID ...")]) #label("orgdc8be27")

али би граматика у том случају била тешка за читање и одржавање. textX због тога
уводи параметар метамодела #raw("auto_kwd") који се може поставити на вредност #raw("True") и
производи исти ефекат.

#figure([#raw(block: true, lang: "python", "from textx.metamodel import metamodel_from_file
my_metamodel = metamodel_from_file('mygrammar.tx',
                                   autokwd=True)")]) #label("org7c3d7d8")
#heading(level: 1)[Модели] #label("org1c4b361")
textX модели су објектни графови обичних Пајтон објеката (#emph[Plain Old Python
Object \u{2d}\u{2d}\u{2d} POPO]). Ови објекти су креирани из улазног стринга који по структури
одговара дефинисаној textX граматици уз потенцијалну модификацију од стране
процесора (видети #ref(label("org100770d"))).

На неки начин модел је сличан апстрактном синтаксном стаблу (AST) код класичног
парсирања, али је на вишем семантичком нивоу јер су све референце разрешене и
структура је облика графа.

Сваки објекат модела је инстанца класе креиране динамички на основу textX
правила или дефинисане од стране корисника употребом механизма корисничких класа
(видети #ref(label("org100770d"))).

Модел се креира позивом метода #raw("model_from_file") и #raw("model_from_str") метамодела.

#figure([#raw(block: true, lang: "python", "from textx.metamodel import metamodel_from_file

my_mm = metamodel_from_file('mygrammar.tx')

# Kreiranje modela iz tekstualnog opisa
my_model = my_mm.model_from_file('some_model.ext')")]) #label("org4cdd5b2")

У наставку текста, као пример, користимо #raw("Entity") језик коришћен у секцији о
корисничким класама (видети #ref(label("org100770d"))).

Садржај фајла #raw("entity.tx") који дефинише језик (тј. метамодел) је следећи:

#figure([#raw(block: true, lang: "text", "EntityModel:
  entities+=Entity
;

Entity:
  'entity' name=ID '{'
    attributes+=Attribute
  '}'
;

Attribute:
  name=ID ':' type=[Entity]
;")]) #label("orgf27557c")
#heading(level: 2)[Специјални textX атрибути] #label("org5710517")
Сваки Пајтон објекат textX модела који није базични Пајтон тип (нпр. #raw("int"), #raw("str"))
поседује специјални атрибут #raw("_tx_position") који представља апсолутну позицију
објекта у текстуалном улазу. За конверзију позиције у ред и колону може се
користити метода парсера #raw("pos_to_linecol").

На пример:

#figure([#raw(block: true, lang: "python", "line, col = entity_mm.parser.pos_to_linecol(
      person_model.entities[0]._tx_position)")]) #label("org06ebdbc")

ће вратити линију и колону првог ентитета модела #raw("person.ent").

Поред позиције коренски објекат модела има и атрибуте:

#list(list.item[#raw("_tx_filename") \u{2d}\u{2d}\u{2d} пуна путања и назив фајла из којег је модел учитан или #raw("None")
уколико је учитан из Пајтон стринга,])#list(list.item[#raw("_tx_metamodel") \u{2d}\u{2d}\u{2d} референца на метамодел са којим је дати модел усклађен.])
#heading(level: 1)[Визуализације] #label("org4af9f62")
Метамодел, модел и стабло парсирања се могу трансформисати у #emph[dot] запис у циљу
визуализације. #emph[dot] је текстуални ЈСД и алат за опис графова и њихову
визуализацију и део је #emph[GraphViz] пакета. #raw("textx.export") модул садржи Пајтон
функције #raw("metamodel_export") и #raw("model_export") за трансформацију метамодела, односно
модела у #emph[dot] запис.

Ако textX ради у моду за отклањање грешака (#emph[debug], видети #ref(label("org1147855"))),
метамодел, модел и стабло парсирања ће бити аутоматски експортовани у #emph[dot] запис.

#emph[dot] фајлови се могу директно приказати у неком од доступних визуализатора (нпр.
xdot#super[1], ZGRViewer#super[2]) или се, употребом #emph[dot] алата, фајл може трансформисати у
неки од битмапираних или векторских графичких формата (нпр. PNG, SVG, JPG, PDF).

#enum(enum.item(1)[xdot \u{2d}\u{2d}\u{2d} #link("https://github.com/jrfonseca/xdot.py")],
enum.item(2)[ZGRViewer \u{2d}\u{2d}\u{2d} #link("http://zvtm.sourceforge.net/zgrviewer.html")],
)
#heading(level: 2)[Визуализација метамодела] #label("org2c2839c")
Метамодел се може визуализовати директно из програмског кода на следећи
начин:

#figure([#raw(block: true, lang: "python", "from textx.metamodel import metamodel_from_file
from textx.export import metamodel_export

entity_mm = metamodel_from_file('entity.tx')

metamodel_export(entity_mm, 'entity.dot')")]) #label("orgd3eea9a")

Позив функције #raw("metamodel_export") над метамоделом ће произвести #emph[dot] фајл датог
имена (у овом случају #raw("entity.dot")).

Текстуални #emph[dot] фајл можемо превести у неки од графичких формата на следећи
начин:

#figure([#raw(block: true, lang: "text", "$ dot -Tpng -O entity.dot")]) #label("orgf0e2967")

Ова команда ће произвести фајл #raw("entity.dot.png") графичког битмапираног формата
PNG.

#figure([#image(sys.inputs.file-7)]) #label("org74d1bdc")
#heading(level: 2)[Визуализација модела] #label("org7ee930e")
Такође, и модели се могу визуализовати из програмског кода. То се изводи на
следећи начин:

#figure([#raw(block: true, lang: "python", "from textx.export import model_export

person_model = entity_mm.model_from_file('person.ent')

model_export(person_model, 'person.dot')")]) #label("orgc2415a1")

Претходни кôд ће произвести фајл #raw("person.dot") који се може превести у графички
формат следећом командом:

#figure([#raw(block: true, lang: "text", "$ dot -Tpng -O person.dot")]) #label("orge414126")

#figure([#image(sys.inputs.file-8)]) #label("orgc9da9ac")

Визуализација може да се обави и употребом #link(label("org8c6aeb2"))[#raw("textx") komande] описане у наставку.
#heading(level: 1)[Обрада грешака] #label("org1147855")
Уколико textX детектује синтаксну грешку приликом парсирања описа метамодела
(граматике језика) или описа модела, доћи ће до појаве изузетка #raw("TextXSyntaxError")
односно #raw("TextXSemanticError"). Оба изузетка наслеђују #raw("TextXError") и описани су у
модулу #raw("textx.exceptions"). Сви textX изузеци имају атрибут #raw("message") који носи
поруку о грешци и атрибуте #raw("line") и #raw("col") који представљају ред односно колону у
којој се грешка десила.

textX подржава отклањање грешака (#emph[debugging]) и на нивоу метамодела (граматике) и
на нивоу модела. Подразумевано textX не ради у моду за отклањање грешака, али се
може поставити у тај мод употребом #raw("debug") параметра код инстанцирања метамодела
односно модела.

#figure([#raw(block: true, lang: "python", "from textx.metamodel import metamodel_from_file

robot_metamodel = metamodel_from_file('robot.tx', debug=True)")]) #label("org2a7728a")

или

#figure([#raw(block: true, lang: "python", "robot_program = robot_metamodel.model_from_file('program.rbt',
                                                debug=True)")]) #label("org191936a")

Када textX ради у #emph[debug] моду на конзоли ће бити приказане детаљне информације о
свим акцијама које textX предузима приликом парсирања и анализе стабала
парсирања. Такође, #emph[dot] фајлови за стабла парсирања за метамоделе и моделе као и
сами модели и метамодели, ће бити аутоматски креирани.

textX се у мод за отклањање грешака може поставити и употребом #raw("textx") команде и
параметра #raw("-d") (видети #ref(label("org8c6aeb2"))).

#figure([#raw(block: true, lang: "text", "$ textx -d visualize robot.tx program.rbt

 *** PARSING LANGUAGE DEFINITION ***
New rule: grammar_to_import -> RegExMatch
New rule: import_stm -> Sequence
New rule: rule_name -> RegExMatch
New rule: param_name -> RegExMatch
New rule: string_value -> OrderedChoice
New rule: rule_param -> Sequence
Rule rule_param founded in cache.
New rule: rule_params -> Sequence
...

>> Matching rule textx_model=Sequence at position 0 =
  >> Matching rule ZeroOrMore in textx_model at posit
      >> Matching rule import_stm=Sequence in textx_m
        ?? Try match rule StrMatch(import) in import_
        >> Matching rule comment=OrderedChoice in imp
            ?? Try match rule comment_line=RegExMatch
            -- NoMatch at 0
            ?? Try match rule comment_block=RegExMatc

...


Generating 'robot.tx.dot' file for meta-model.
To convert to png run 'dot -Tpng -O robot.tx.dot'
Generating 'program.rbt.dot' file for model.
To convert to png run 'dot -Tpng -O program.rbt.dot'")]) #label("org3bf36c8")
#heading(level: 1)[RREL] #label("org7186c33")
Претходна секција увела је појам провајдер опсега. У новијом верзијама textX\u{2d}а
постоји и додатни начин дефинисања правила разрешења референци која се наводе
директно у граматици као део референце. Овај језик називамо језик израза за
разрешење референци (енг. #emph[Reference Resolving Expression Language \u{2d}\u{2d}\u{2d} RREL]). Ово
је преферирани начин дефинисања правила разрешења и у већини случајева је
довољан. Уколико је потребна специфична претрага која није подржана са RREL онда
се може креирати наменски провајдер опсега који се региструје програмски над
моделом (видети претходну секцију).

RREL израз се пише као трећи део референце преко везе (видети #ref(label("org1a48c65"))).

На пример:

#figure([#raw(block: true, lang: "text", "Attribute: 'attr' ref=[Class|FQN|^packages*.classes]
                  name=ID ';';")]) #label("org32a7f96")
#heading(level: 2)[Навођење у textX граматици] #label("orgf2c90f8")
Ово правило граматике има референцу #raw("ref"). Свака референца преко везе се пише у
угластим заградама и има најмање један а највише три дела раздвојена карактером
#raw("|"). Први део дефинише тип циљног објекта, у овом случају то је #raw("Class"). Други део
дефинише образац који ће парсер да препозна на месту референце. Уколико није
дефинисан подразумева се #raw("ID"). Парсер ће у оцом случају препознати правило #raw("FQN"). И
на крају, трећи део дефинише RREL израз који дефинише правило проналаска циљног
објекта у моделу. У овом случају правило гласи #raw("^packages*.classes").

Свака референца у моделу генерално је облика имена раздвојених тачком. На
пример, референца може бити #raw("package1.component4") или само #raw("component4"). Даље можемо
да генерализујемо и кажемо да је референца низ имена где је #raw("ID") само специјалан
случај и представља низ дужине један. Имена не морају, у општем случају, бити
раздвојена тачком. Корисник може навести наменско правило препознавања и
регистровати процесор који ће да разложи име на низ делова. Али због
једноставности у наставку сматрамо да се делови имена раздвајају увек са тачком.
#heading(level: 2)[RREL оператори] #label("org993a4a5")
RREL израз се гради употребом RREL оператора. Дефинисани су следећи оператори:
#list(list.item[#raw(".") \u{2d}\u{2d}\u{2d} навигација тачком. Врши се претрага атрибута у текућем AST контексту.
Може се користити и за навигацију уз везе садржавања (родитељ\u{2d}дете). На пример
"#raw(".")" је текући објекат, "#raw("..")" је родитељски објекат, "#raw("...")" је родитељ родитеља
итд. Ако RREL израз почиње тачком претрага се извршава релативно почевши од
текућег AST контекста (текуће локације). У супротном имамо апсолутну путању
где претрага почиње од корена модела, осим ако израз не почиње оператором "#raw("^")".
На пример, #raw(".a.b") значи претрагу атрибута #raw("а") на текућој локацији и затим претрагу
атрибута #raw("b").])#list(list.item[#raw("parent(TIP)") \u{2d}\u{2d}\u{2d} врши се претрага уз родитељске везе све док се не нађе објекат
типа #raw("TIP").])
#heading(level: 2)[RREL оператори] #label("orge19850a")
#list(list.item[#raw("~") \u{2d}\u{2d}\u{2d} маркер који се може применити над елементом израза и који носи
информацију да се текућа колекција не претражује по текућем делу имена већ да
се цела процесира. На пример, уколико тражимо методу уз хијерархију
наслеђивања (веза #raw("extends")), могли би написати #raw("~extends*.methods"), где ће (због
#raw("*"), видети у наставку) бити прво претражена #raw("methods") колекција текућег
контекста. Затим се итерира кроз све елементе #raw("extends") колекције без
конзумације дела имена које се тражи (због #raw("~")) и затим се текући део имена
тражи у #raw("methods") колекцији објекта из #raw("extends").])#list(list.item[#raw("*") \u{2d}\u{2d}\u{2d} представља понављање. Резултује развијањем израза нула или више пута.
Прва експанзија је нула пута, затим једном, два пута итд. На пример,
#raw("~extends*.methods") ће прво да претражује у колекцији #raw("methods"), затим уколико
текући део имена није пронађен у #raw("~extends.methods"), затим у
#raw("~extends.~extends.methods") итд. Уколико процес не доведе до проналаска циљног
објекта, због употребе #raw("*"), израз се даље развија и претрага се наставља док се
објекат не пронађе или док не дођемо до краја ланца наслеђивања и тада
пријављујемо грешку да објекат није пронађен.])
#heading(level: 2)[RREL оператори] #label("org71adae1")
#list(list.item[#raw("^") \u{2d}\u{2d}\u{2d} претрага од дна ка врху (енг. #emph[bottom\u{2d}up]). Овај оператор дефинише да се
текућа путања развија од дна ка врху, уз родитељски ланац. Претрага почиње на
текућем AST контексту и иде се уз родитељски ланац за број компоненти текућег
израза. Затим се покушава претрага. На пример, #raw("^a.b.c") почиње на текућем
контексту и прво се пење уз родитељски ланац на родитеља. Затим се врши
претрага за атрибутом #raw("a") који има име текућег дела имена референце. Затим се
тражи атрибут #raw("b"), и на крају се тражи #raw("c"). Уколико претрага не успе, пењемо се уз
родитељски ланац један ниво више и поново покушавамо претрагу.])#list(list.item[#raw(",") \u{2d}\u{2d}\u{2d} дефинише секвенцу израза које треба покушати у редоследу дефинисања.])
#heading(level: 2)[RREL приоритети оператора] #label("org2faca19")
Приоритети од највишег до најнижег су: #raw("*"), #raw("."), #raw(",").

#raw("~") и #raw("^") се сматрају маркерима а не операторима.

Евалуација RREL израза тече на следећи начин:

#list(list.item[Израз се развија тако што #raw("*") креће од нуле.])#list(list.item[Навигација и препознавање уз конзумацију препознатих делова имена.])#list(list.item[Процес се понавља.])

Процес се зауставља када:
#list(list.item[Све могућности су исцрпљене и нисмо нашли циљни објекат. Грешка.])#list(list.item[При експанзији #raw("*") дошли смо у ситуацију да смо исцрпели све делове имена пре
него што смо завршили са RREL изразом. Грешка.])#list(list.item[Исцрпели смо све делове имена, такође и све делове RREL израза и пронашли смо
објекат. Ако се тип објекта не поклапа са оним што је дефинисано референцом у
граматици пријављујемо грешку, у супротном успешно смо пронашли објекат.])
#heading(level: 2)[RREL пример \u{2d} граматика\u{2f}метамодел] #label("orgd5af31b")
Видети #link("https://github.com/textX/textX/tree/master/tests/functional/test_scoping")[textX тестове] #footnote(link("https://github.com/textX/textX/tree/master/tests/functional/test_scoping")).

#figure([#raw(block: true, lang: "textx", "Model: packages*=Package ;

Package:
        'package' name=ID '{'
        (components+=Component
        | instances+=Instance
        | connections+=Connection
        | packages+=Package
        | interfaces+=Interface
        )*
        '}'
;

Interface: 'interface' name=ID;
Component:
    'component' name=ID ('extends' extends+=[Component:FQN|^packages*.components][','])? '{'
        slots*=Slot
    '}'
;
Slot: SlotIn|SlotOut;
SlotIn:
    'in' name=ID
    ('(' 'format' formats+=[Interface:FQN|^packages*.interfaces][','] ')')?
;
SlotOut:
    'out' name=ID
    ('(' 'format' formats+=[Interface:FQN|^packages*.interfaces][','] ')')?
;")]) #label("org0dac777")

#figure([#raw(block: true, lang: "textx", "Instance:
    'instance' name=ID ':' component=[Component:FQN|^packages*.components] ;
Connection:
    'connect'
      from_inst=[Instance:ID|^instances] '.'
      from_port=[SlotOut:ID|.~from_inst.~component.(~extends)*.slots]
    'to'
      to_inst=[Instance:ID|^instances] '.'
      to_port=[SlotIn:ID|.~to_inst.~component.(~extends)*.slots]
;

FQN: ID+['.'];
Comment: /\/\/.*$/;")]) #label("org03bce32")
#heading(level: 2)[RREL пример \u{2d} модел] #label("org40f88b8")
#figure([#raw(block: true, lang: "text", "package interfaces {
  interface B
  interface C
}
package base {
  interface A
  interface D
  component Start {
    out output1 (format A)
  }
  component Middle {
    in input2 (format A,interfaces.B,interfaces.C)
    out output2 (format interfaces.B,interfaces.C,D)
  }
  component End {
    in input3 (format interfaces.B,interfaces.C,D)
  }
}
package usage {
  instance start : base.Start
  instance action1 : base.Middle
  instance action2 : base.Middle
  instance action3 : base.Middle
  instance end : base.End
  connect start.output1   to action1.input2
  connect action1.output2 to action2.input2
  connect action2.output2 to action3.input2
  connect action3.output2 to end.input3
}")]) #label("org00b32ee")
#heading(level: 1)[#raw("textx") команда] #label("org8c6aeb2")
#heading(level: 2)[#raw("textx") команда] #label("orgdc7b3f0")
Поред употребе textX библиотеке из програмског кода неке од основних операција,
као што су, на пример, провера синтаксне исправности метамодела и модела, се
могу обавити употребом #raw("textx") ЦЛИ команде. Ова команда је проширива и састоји се
од низа команди које су регистроване од стране Пyтхон пакета. Све команде су
регистроване не исти начин и нема разлике између базичних textX команди и
команди које су регистроване од стране других Пајтон пакета.

#raw("textx") CLI команда није подразумевано инсталирана када инсталирате textX
библиотеку. Да бисте имали ову команду доступну потребно је да инсталирате #raw("cli")
зависности на следећи начин:

#figure([#raw(block: true, lang: "shell", "pip install textx[cli]")]) #label("org89fc220")
#heading(level: 2)[Основне поткоманде] #label("org2c8e421")
Основно упутство за употребу може се добити позивом команде без параметара или
са параметром #raw("--help") односно #raw("-h").

#figure([#raw(block: true, lang: "text", "$ textx --help
Usage: textx [OPTIONS] COMMAND [ARGS]...

Options:
  --debug  Debug/trace output.
  --help   Show this message and exit.

Commands:
  check            Check/validate model given its file path.
  generate         Run code generator on a provided model(s).
  list-generators  List all registered generators
  list-languages   List all registered languages
  version          Print version info.")]) #label("orgd84c375")

Излистане команде доступне су од стране основне textX библиотеке. Додатне
команде ће бити доступне по инсталацији Пајтон пакета који региструју нове textX
команде.
#heading(level: 2)[#raw("check") поткоманда] #label("orgbcf42cc")
Komanda #raw("check") koristi se za proveru sintaksne ispravnosti modela i metamodela,
odnosno gramatike. U slučaju postojanja greške u (meta)modelu biće prijavljena
greška sa tačnom lokacijom i prikazom okolnog konteksta. Na primer, da proverimo
ispravnost modela (#raw("program.rbt")) ako imamo ispravnu gramatiku (#raw("robot.tx")).

#figure([#raw(block: true, lang: "text", "$ textx check --grammar robot.tx program.rbt
Error:
/home/igor/repos/textX/textX/examples/robot/program.rbt:3:3:
Expected 'initial' or 'up' or 'down' or 'left' or 'right'
        or 'end' => 'al 3, 1   *gore 4    '")]) #label("org37ed1e3")

Vidimo da u redu 3, koloni 3 imamo grešku. Parser nam prijavljuje šta je
očekivano na toj lokaciji i iza znaka #raw("=>") vidimo deo fajla, odnosno kontekst gde
se greška nalazi. Karakter #raw("*") obeležava lokaciju unutar konteksta.
#heading(level: 2)[Визуализација #raw("generate") поткомандом] #label("orga1f431d")
Следеће што можемо урадити јесте визуализација (мета)модела која се обавља
командом #raw("generate") која позива регистровани генератор. Генератори су компоненте
које генеришу кôд на основу модела. Генератори и језици се могу регистровати
(видети #ref(label("org599ec39"))). Регистровани генератори и језици се
листају командама #raw("list-generators") и #raw("list-languages").

Пошто визуализација представља трансформацију (мета)модела у слику, урађена је
као стандардни генератор. Да бисмо видели који генератори су нам доступни
позваћемо команду #raw("list-generators") на следечи начин:

#figure([#raw(block: true, lang: "shell", "$ textx list-generators
any -> dot         textX[2.3.0]  Generating dot visual...
textX -> dot       textX[2.3.0]  Generating dot visual...
textX -> PlantUML  textX[2.3.0]  Generating PlantUML v...")]) #label("org59171c5")

Видимо да имамо три регистрована генератора од стране textX пакета. Први
генератор је у стању да трансформише било који модел на #emph[dot] језик. Други
генератор трансформише textX моделе (тј. метамоделе) у #emph[dot]. Трећи генератор
трансформише метамоделе у PlantUML дијаграме#super[1].

#enum(enum.item(1)[PlantUML је текстуални ЈСД за креирање UML дијаграма \u{2d}\u{2d}\u{2d}
#link("https://plantuml.com/")],
)
#heading(level: 2)[Генерисање #raw("dot") фајла] #label("org2914019")
На пример, за визуализацију метамодела потребно је урадити следеће:

#figure([#raw(block: true, lang: "shell", "$ textx generate robot.tx --target dot --overwrite
Generating dot target from models:
/home/igor/repos/textX/textX/examples/robot/robot.tx
-> /home/igor/repos/textX/textX/examples/robot/robot.dot
    To convert to png run \u{22}dot -Tpng -O robot.dot\u{22}")]) #label("orgbc66998")

Овом командом позивамо генератор који је регистрован за #raw(".tx") екстензију и бирамо
циљни формат\u{2f}платформу, у овом случају #raw("dot"). Генератор који ће бити позван је
#raw("textX -> dot") са списка добијеног употребом #raw("list-generators"). #raw("dot") фајл који смо
добили можемо конвертовати у слику према упутству:

#figure([#raw(block: true, lang: "shell", "$ dot -Tpng -O robot.dot")]) #label("org321c9d5")

Добићемо слику у облику PNG фајла.

#figure([#image(sys.inputs.file-9)]) #label("org94d1677")

Уместо креирања слике, #raw("dot") фајл можемо прегледати неким од #raw("dot") прегледача. На
пример:

#figure([#raw(block: true, lang: "text", "$ xdot robot.dot")]) #label("orgd92c383")
#heading(level: 2)[Конверзија у PlantUML] #label("orge42fe6a")
Алтернативно, метамодел можемо конвертовати у UML дијаграм употребом PlantUML
алата. Да бисмо креирали PlantUML фајл из метамодела позивамо команду #raw("generate")
на следећи начин:

#figure([#raw(block: true, lang: "shell", "$ textx generate robot.tx --target plantuml --overwrite
Generating plantuml target from models:
/home/igor/repos/textX/textX/examples/robot/robot.tx
-> /home/igor/repos/textX/textX/examples/robot/robot.pu
    To convert to png run \u{22}plantuml robot.pu\u{22}")]) #label("org95afd94")

Затим можемо креирати PNG слику са #raw("plantuml") командом према упутству.

#figure([#image(sys.inputs.file-10)]) #label("org113c61e")
#heading(level: 2)[Генерисање #raw("dot") фајла за модел] #label("org95d54ca")
Уколико желимо да визуализујемо модел потребно је навести и граматику на следећи
начин:

#figure([#raw(block: true, lang: "shell", "$ textx generate --grammar robot.tx program.rbt --target dot --overwrite
Generating dot target from models:
/home/igor/repos/textX/textX/examples/robot/program.rbt
-> /home/igor/repos/textX/textX/examples/robot/program.dot
    To convert to png run \u{22}dot -Tpng -O program.dot\u{22}")]) #label("orga7c933d")
#heading(level: 1)[Регистрација језика и генератора] #label("org599ec39")
textX обезбеђује механизам за динамичку регистрацију и откривање језика и
генератора кôда. Овим се постиже могућност употребе кориснички регистрованих
језика и генератора кроз #raw("textx") команду (видети #ref(label("org8c6aeb2"))).
#heading(level: 2)[Регистрација језика] #label("org3f0360a")
Инстанцирати #raw("LanguageDesc") класу где као параметре наводимо: јединствени назив
језика, фајл образац\u{2f}екстензију за моделе на датом језику, опис и функцију
(тачније Пајтон #emph[callable]) који врши креирање и конфигурацију метамодела.

#figure([#raw(block: true, lang: "python", "from textx import LanguageDesc

def entity_metamodel():
    # Funkcija konstruiše i vraća metamodel
    # Npr. poziva metamodel_from_file
    ...

entity_lang = LanguageDesc(
    'entity',
    pattern='*.ent',
    description='Entity-relationship language',
    metamodel=entity_metamodel)")]) #label("orgce1f5be")

Инстанцу #raw("LanguageDesc") затим можемо регистровати употребом #raw("register_language")
позива:

#figure([#raw(block: true, lang: "python", "from textx import register_language
register_language(entity_lang)")]) #label("orgc117afb")

По обављеној регистрацији метамодел се може добити на следећи начин:

#figure([#raw(block: true, lang: "python", "from textx import metamodel_for_language
lang_mm = metamodel_for_language('entity')")]) #label("org8bab97f")

Декларативан начин регистрације путем #raw("setup.py"), односно #raw("setup.cfg"). Користимо
улазне тачке (енг. #emph[entry points]), стандардан механизам Пајтон #raw("setuptools") пакета:

#figure([#raw(block: true, lang: "python", "setup(
    ...
    entry_points={
        'textx_languages': [
            'entity = entity.metamodel:entity_lang',
        ],
    },")]) #label("org79c69ea")

Улазна тачка се зове #raw("textx_languages") \u{2d} листа стрингова облика "\u{3c}име језика\u{3e} =
\u{3c}путања\u{5f}до\u{5f}LanguageDesc\u{5f}инстанце\u{3e}". У овом примеру инстанца #raw("LanguageDesc") се
налази у пакету #raw("entity.metamodel"). Варијабле тј. референца се зове #raw("entity_lang").

Алтернативно, можемо користити и новији начин употребом #raw("setup.cfg") фајла:

#figure([#raw(block: true, lang: "text", "[options.entry_points]
textx_languages =
    entity = entity.metamodel:entity_lang")]) #label("orgc2d38a2")

Декоратор #raw("language") \u{2d} параметри су назив језика и екстензија фајлова модел.
#emph[Docstring] се користи као опис.

#figure([#raw(block: true, lang: "python", "from textx import language

@language('entity', '*.ent')
def entity_lang():
    \u{22}\u{22}\u{22}
    Entity-relationship language
    \u{22}\u{22}\u{22}
    # Funkcija konstruiše i vraća metamodel
    # Npr. poziva metamodel_from_file
    ...")]) #label("orgb02af94")

Уколико смо успешно регистровали језик команда #raw("textx list-languages") ће га
приказати у листи.
#heading(level: 2)[Регистрација генератора] #label("orge07ca22")
Користимо инстанцу #raw("GeneratorDesc"). При инстанцирању наводимо: назив језика, назив
циљне технологије, опис и на крају функцију која врши генерисање. Функција мора
бити следећег облика:

#figure([#raw(block: true, lang: "python", "def generator(metamodel, model, output_path, overwrite, debug,
              **custom_args)")]) #label("org198996c")

Параметри генератор функције су следећи:

#list(list.item[#raw("metamodel") \u{2d}\u{2d}\u{2d} инстанца метамодела изворног језика,])#list(list.item[#raw("model") \u{2d}\u{2d}\u{2d} инстанца модела за који вршимо генерисање,])#list(list.item[#raw("output_path") \u{2d}\u{2d}\u{2d} циљна путања у фајл систему где треба сместити генерисани кôд,])#list(list.item[#raw("overwrite") \u{2d}\u{2d}\u{2d} да ли се врши преписивање циљних фајлова,])#list(list.item[#raw("debug") \u{2d}\u{2d}\u{2d} да ли се генератор позива у моду за отклањање грешака,])#list(list.item[#raw("**custom_args") \u{2d}\u{2d}\u{2d} додатни параметри специфични за генератор.])

Декоратор #raw("generator") \u{2d} параметри су назив језика и назив циљне платформе. Опис
генератора се наводи у #emph[docstring]\u{2d}у генератор функције.

#figure([#raw(block: true, lang: "python", "from textx import generator

@generator('entity', 'java')
def entity_java_generator(metamodel, model, output_path,
                          overwrite, debug, **custom_args)
    \u{22}Entity-relationship to Java language generator\u{22}
    # Код који врши генерисање на основу модела.")]) #label("orgc0ca645")

Регистрација се врши у #raw("setup.cfg") (или #raw("setup.py")) на исти начин као и језик с тим
што се улазна тачка назива #raw("textx_generators"):

#figure([#raw(block: true, lang: "text", "[options.entry_points]
textx_generators =
    entity_java = entity.generators:entity_java_generator")]) #label("orgeb53741")

По успешној регистрацији команда #raw("textx list-generators") ће листати информације о
генератору.

Регистровани генератор се може позвати командом #raw("text generate"). На пример:

#figure([#raw(block: true, lang: "shell", "$ textx generate mymodel.ent --target java --overwrite
        --meaning_of_life 42")]) #label("org0ccaa6e")

У претходној команди позивамо генератор регистрован за фајлове са екстензијом
#raw(".ent") над моделом #raw("mymodel.ent"). У питању је #emph[Entity] језик. Циљна платформа је #raw("java").
Додатни параметар #raw("meaning_of_life") је специфичан за генератор и биће прослеђен
кроз #raw("custom_args") речник.
#heading(level: 1)[Креирање иницијалног пројекта \u{2d} #emph[scaffolding]] #label("orgaf72b00")
Иницијални пројекат креирамо са следећом командом:

#figure([#raw(block: true, lang: "shell", "$ textx startproject <folder>")]) #label("org9a3884a")

Ова команда покреће генератор који поставља пар питања#super[1] и затим креира
пројекат у задатом фолдеру. Добра пракса је да се затим пројекат инсталира у
текуће радно окружење у развојном моду са:

#figure([#raw(block: true, lang: "shell", "$ pip install -e <folder>")]) #label("orgbbd351b")

#enum(enum.item(1)[Одговори на питања се кеширају и биће подразумевана при наредном покретању
генератора.],
)

По успешној инсталацији ваш језик, односно генератор је исправно регистрован и
видљив за команде #raw("textx list-languages"), односно #raw("textx list-generators").

Команда #raw("startproject") није дефинисана основном textX библиотеком већ пројектом
#raw("textX-dev"). Због тога је потребно инсталирати овај Пајтон пакет или директно са:

#figure([#raw(block: true, lang: "shell", "$ pip install textX-dev")]) #label("orgd04d042")

или путем инсталације свих развојних зависности за textX на следећи начин:

#figure([#raw(block: true, lang: "shell", "$ pip install textX[dev]")]) #label("org78052c6")

да бисте имали #raw("startproject") доступну као поткоманду #raw("textx") команде.
#heading(level: 1)[Примери] #label("orgc9004bb")
#heading(level: 2)[Генерисање кода \u{2d} Entity пример] #label("org68418d0")
#list(list.item[Референцирање других објеката.])#list(list.item[Употреба обрађивача шаблона (#text(weight: "bold", [Template Engines])) за генерисање кода.])#list(list.item[#link("http://textx.github.io/textX/stable/tutorials/entity/")])
#heading(level: 2)[State Machine] #label("org70896d0")
#list(list.item[Видео туториал])#list(list.item[#link("http://textx.github.io/textX/stable/tutorials/state_machine/")])
#heading(level: 2)[Израда мини компајлера \u{2d} ppci] #label("orgdd48533")
#list(list.item[#link("http://www.windel.nl/")[Windel Bouwman] #footnote(link("http://www.windel.nl/"))])#list(list.item[#link("https://ppci.readthedocs.io/en/latest/howto/toy.html")])
#heading(level: 2)[Quick Domain\u{2d}Specific Languages in Python with textX] #label("orgabd89af")
#list(list.item[#link("https://tomassetti.me/domain-specific-languages-in-python-with-textx/")])#list(list.item[Written by Alessio Stalla])
#heading(level: 2)[PyFlies \u{2d} језик за психолошке тестове] #label("org198348c")
#list(list.item[#link("https://pyflies.github.io/pyflies/latest/")])#list(list.item[#link("https://github.com/pyflies")])#list(list.item[#link("https://www.youtube.com/playlist?list=PLOgHC04drILVjnXQTFEL7sJDyfKMR21Vg")[Video tutorials] #footnote(link("https://www.youtube.com/playlist?list=PLOgHC04drILVjnXQTFEL7sJDyfKMR21Vg"))])
#heading(level: 1)[Подршка у едиторима] #label("orgc10a6b1")
#list(list.item[Visual Studio Code (#emph[IntelliSense], #emph[Outline], #emph[Code highlighting])
#list(list.item[#link("https://github.com/textX/textX-LS")[Tekući razvoj] #footnote(link("https://github.com/textX/textX-LS")) \u{2d} #emph[Language Server Protocol]])])#list(list.item[#link("https://github.com/textX/textx-mode")[Mod za Emacs] #footnote(link("https://github.com/textX/textx-mode"))])#list(list.item[#link("https://github.com/textX/textX-ninja")[Ninja IDE] #footnote(link("https://github.com/textX/textX-ninja"))])
#heading(level: 1)[Литература] #label("org8ca2977")
#list(list.item[Игор Дејановић, #emph[Језици специфични за домен], Факултет техничких наука, Нови
Сад, 2021. (доступно у скриптарници ФТН\u{2d}а)])#list(list.item[#link("https://textx.github.io/textX/")[textX dokumentacija] #footnote(link("https://textx.github.io/textX/"))])
