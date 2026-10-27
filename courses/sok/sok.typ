#let _ = ```typ
exec typst c "$0" --root "$(readlink -f "$0" | xargs dirname)/./" --input file-66=/razvoj-baziran-na-komponentama/images/AbstractPlatform.png --input file-65=/05-mikroservisni-obrasci/images/reg-02.png --input file-64=/05-mikroservisni-obrasci/images/reg-01.png --input file-63=/05-mikroservisni-obrasci/images/apig-02.png --input file-62=/05-mikroservisni-obrasci/images/apig-01.png --input file-61=/05-mikroservisni-obrasci/images/messaging-02.png --input file-60=/05-mikroservisni-obrasci/images/messaging-01.png --input file-59=/05-mikroservisni-obrasci/images/messaging-01.png --input file-58=/05-mikroservisni-obrasci/images/cqrs-02.png --input file-57=/05-mikroservisni-obrasci/images/cqrs-01.png --input file-56=/05-mikroservisni-obrasci/images/apic-01.png --input file-55=/05-mikroservisni-obrasci/images/es-02.png --input file-54=/05-mikroservisni-obrasci/images/es-01.png --input file-53=/05-mikroservisni-obrasci/images/saga-03.png --input file-52=/05-mikroservisni-obrasci/images/saga-02.png --input file-51=/05-mikroservisni-obrasci/images/saga-01.png --input file-50=/05-mikroservisni-obrasci/images/dps-02.svg --input file-49=/05-mikroservisni-obrasci/images/dps-01.svg --input file-48=/05-mikroservisni-obrasci/images/msa.png --input file-47=/04-obrasci-ponasanja/images/ChainOfResponsibility-Concrete.png --input file-46=/04-obrasci-ponasanja/images/ChainOfResponsibility-Abstract.png --input file-45=/04-obrasci-ponasanja/images/Visitor-Concrete.png --input file-44=/04-obrasci-ponasanja/images/Visitor-Sequence.png --input file-43=/04-obrasci-ponasanja/images/Visitor-Abstract.png --input file-42=/04-obrasci-ponasanja/images/TemplateMethod-Concrete.png --input file-41=/04-obrasci-ponasanja/images/TemplateMethod-Abstract.png --input file-40=/04-obrasci-ponasanja/images/Strategy-Concrete.png --input file-39=/04-obrasci-ponasanja/images/Strategy-Abstract.png --input file-38=/04-obrasci-ponasanja/images/State-Concrete.png --input file-37=/04-obrasci-ponasanja/images/State-Abstract.png --input file-36=/04-obrasci-ponasanja/images/Observer-Sequence.png --input file-35=/04-obrasci-ponasanja/images/Observer-Abstract.png --input file-34=/04-obrasci-ponasanja/images/Memento-Sequence.png --input file-33=/04-obrasci-ponasanja/images/Memento-Abstract.png --input file-32=/04-obrasci-ponasanja/images/Mediator-Sequence.png --input file-31=/04-obrasci-ponasanja/images/Mediator-Concrete.png --input file-30=/04-obrasci-ponasanja/images/Mediator-Abstract.png --input file-29=/04-obrasci-ponasanja/images/Command-Sequence.png --input file-28=/04-obrasci-ponasanja/images/Command-Abstract.png --input file-27=/04-obrasci-ponasanja/images/Iterator-Java.png --input file-26=/04-obrasci-ponasanja/images/Iterator-Abstract.png --input file-25=/03-strukturalni/images/Proxy-Concrete.png --input file-24=/03-strukturalni/images/Proxy-Abstract.png --input file-23=/03-strukturalni/images/Decorator-Abstract.png --input file-22=/03-strukturalni/images/Decorator-ConcreteGood.png --input file-21=/03-strukturalni/images/Decorator-ConcreteBad.png --input file-20=/03-strukturalni/images/Composite-Concrete.png --input file-19=/03-strukturalni/images/Composite-Abstract.png --input file-18=/03-strukturalni/images/Bridge-abstract.png --input file-17=/03-strukturalni/images/Bridge-concreteGood.png --input file-16=/03-strukturalni/images/Bridge-concreteBad.png --input file-15=/03-strukturalni/images/TreeDisplay.png --input file-14=/03-strukturalni/images/Adapter-abstract.png --input file-13=/03-strukturalni/images/Adapter-concrete.png --input file-12=/02-kreacioni/images/Singleton.png --input file-11=/02-kreacioni/images/Builder.png --input file-10=/02-kreacioni/images/Prototype.png --input file-9=/02-kreacioni/images/AbstractFactory.png --input file-8=/02-kreacioni/images/FactoryMethod.png --input file-7=/02-kreacioni/images/IntAndAbsCls-Concrete.png --input file-6=/02-kreacioni/images/IntAndAbsCls-Abstract.png --input file-5=/02-kreacioni/images/Interface-Concrete.png --input file-4=/02-kreacioni/images/Interface-Abstract.png --input file-3=/02-kreacioni/images/Delegation-abstract.png --input file-2=/02-kreacioni/images/Delegation-concreteGood.png --input file-1=/02-kreacioni/images/Delegation-concreteBad.png --input file-0=/01-uvod/images/patternspace.png
⁠```
#set document(title: "Софтверски обрасци и копоненте Софтверски обрасци и компоненте Софтверски обрасци и компоненте Софтверски обрасци и компоненте Софтверски обрасци и компоненте Микросервисни обрасци Razvoj baziran na komponentama Прикључци у Пајтону", author: "Игор Дејановић")
#set text(lang: "sr")
#set heading(numbering: "1.")
#let naslov = "Софтверски обрасци и компоненте"
#let podnaslov = "скрипта за предмет"
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
#heading(level: 1)[Увод] #label("org8b7d189")
#heading(level: 2, outlined: false, numbering: none)[Садржај] #label("orgf863672")
#heading(level: 2)[Увод] #label("org0fa03b2")
#heading(level: 3)[Развој софтвера] #label("orgc82e168")
#list(list.item[Развој софтвера је тежак а развој софтвера на такав начин да се решење може
поново употребити је још теже.])#list(list.item[Добар, проширив и флексибилан дизајн је тешко а вероватно и немогуће одрадити
#emph[из прве] за неискусног пројектанта.])
#heading(level: 3)[Искуство] #label("org0504789")
#list(list.item[Искусни пројектанти, тј. експерти, ипак праве добар дизајн.])#list(list.item[Експерти знају нешто што почетници не знају. Шта је то?])
#heading(level: 3)[Поновно коришћење добрих решења] #label("orgb9df6be")
Експерти ће поново примењивати решења која су се показала као добра у
прошлости.
#heading(level: 3)[Поновна искористљивост \u{2d} #emph[Reusability]] #label("org97e1901")
Дефиниција са #emph[The Free Dictionary]:

#figure([#quote(block: true)[The ability to use all or the greater part of the same programming code or
system design in another application.
]]) #label("org6126704")

#list(list.item[#link("http://encyclopedia2.thefreedictionary.com/reusability/")])
#heading(level: 3)[Поновна искористљивост \u{2d} Зашто?] #label("org485add0")
#list(list.item[Да не би измишљали #emph[топлу воду].])#list(list.item[Употреба већ постојећих решења \u{2d} бржа изградња софтвера.])#list(list.item[Већ коришћен софтвер је боље тестиран \u{2d} робусност.])
#heading(level: 3)[Поновна искористљивост \u{2d} Како?] #label("org12d490a")
#list(list.item[На нивоу кода \u{2d} библиотеке, оквири за развој (#emph[frameworks]), софтверске
компоненте итд.])#list(list.item[На нивоу дизајна  \u{2d} дизајн обрасци.])
#heading(level: 2)[Софтверски обрасци] #label("org3d530e6")
#heading(level: 3)[Шта је образац?] #label("orgb1ed5e0")
Christopher Alexander и сар. су написали#super[\u{2a}]:

#figure([#quote(block: true)[Each pattern describes a problem which occurs over and over again in our
environment, and then describes the core of the solution to that problem, in
such a way that you can use this solution a million times over, without ever
doing it the same way twice.
]]) #label("orgdfec556")

#raw("*") Christopher Alexander, Sara Ishikawa, Murray Silverstein, Max Jacobson,
Ingrid Fiksdahl\u{2d}King, and Shlomo Angel. #emph[A Pattern Language]. Oxford University
Press, New York, 1977.
#heading(level: 3)[...ili у слободном преводу] #label("org06df0f1")
#figure([#quote(block: true)[Сваки образац #emph[описује проблем] који се #emph[појављује наново] у нашем окружењу, и
затим #emph[описује суштину решења] датог проблема на такав начин да решење можете
применити милион пута а да никада не решите проблем на потпуно идентичан начин.
]]) #label("org83cdaa9")
#heading(level: 3)[Шта је софтверски образац?] #label("org9398bf5")
Рецепт настао на бази кумулираног експертског знања и искуства у решавању
одређеног рекурентног проблема у развоју софтвера који описује проблем, решење
и контекст у коме је решење примењиво као и предности и мане решења.
#heading(level: 3)[Градивни елементи софтверског образца] #label("org0f064de")
#list(list.item[#emph[Назив] \u{2d} Обезбеђује лако референцирање на образац. Чини део вокабулара и
омогућава комуникацију.])#list(list.item[#emph[Проблем] \u{2d} Опис проблема и контекста у коме се образац може применити. Често се
наводи и листа предуслова за употребу обрасца.])#list(list.item[#emph[Решење] \u{2d} Елементи, међусобне везе, сарадња и одговорност. Апстрактно је да би
могло бити примењено у различитим конкретним контекстима.])#list(list.item[#emph[Последице] \u{2d} описују шта је то што добијамо а шта губимо употребом датог
обрасца (#emph[trade\u{2d}offs]).])
#heading(level: 3)[У чему је предност употребе софтверских образаца?] #label("org6922158")
#list(list.item[Учење на туђим грешкама.])#list(list.item[Мање искусни пројектанти могу правити добар дизајн.])#list(list.item[Лакша комуникација. Конзистентан вокабулар.])#list(list.item[Лакша анализа дизајна сложеног софтвера. Обрасци имају своју #text(weight: "bold", [мустру]).])#list(list.item[Лакше укључивање нових људи на пројекат.])#list(list.item[Познавање унапред свих евентуалних проблема које решење може да изазове.])
#heading(level: 3)[Избор програмског језика] #label("org45bb88e")
Избор програмског језика и програмске парадигме са становишта софтверских
образаца је важан!
#heading(level: 3)[Организација] #label("org1ccff63")
#list(list.item[Класификација и каталогизација у циљу лакшег проналажења.])#list(list.item[Различити аутори \u{2d} различите класификације.])#list(list.item[Различити домени \u{2d} различити обрасци.])
#heading(level: 3)[Класификација ОО дизајн образаца] #label("org9c6e123")
#figure([#image(sys.inputs.file-0)]) #label("org0d62b91")

#list(list.item[E. Gamma, R. Helm, R. Johnson, and J. M. Vlissides, #emph[Design Patterns: Elements
of Reusable Object\u{2d}Oriented Software], Addison\u{2d}Wesley Professional, 1994])
#heading(level: 3)[Класификација ОО дизајн образаца] #label("org5416461")
Класификација ОО дизајн образаца према [1]:

#list(list.item[Фундаментални])#list(list.item[Креациони])#list(list.item[Партициони])#list(list.item[Структурални])#list(list.item[Обрасци понашања])#list(list.item[Обрасци за конкурентни дизајн])

#enum(enum.item(1)[M. Grand, #emph[Patterns in Java: A Catalog of Reusable Design Patterns
Illustrated with UML], John Wiley & Sons, Inc., vol. 1, 2002],
)
#heading(level: 2)[Софтверски антиобрасци] #label("orgcc5a014")
#heading(level: 3)[Софтверски антиобрасци] #label("orgb72b37b")
#list(list.item[У развоју софтвера антиобрасци представљају обрасце који су се показали
неефикасним и контрапродуктивним у пракси#super[\u{2a}].])#list(list.item[Још се зову и #emph[pitfalls] или #emph[dark patterns].])

#list(list.item[#raw("*") #link("http://en.wikipedia.org/wiki/Anti-pattern")[Anti\u{2d}pattern] #footnote(link("http://en.wikipedia.org/wiki/Anti-pattern")), From Wikipedia, the free encyclopedia])
#heading(level: 3)[Како их препознати?] #label("orgdae9733")
Антиобрасци исказују следеће особине:

#list(list.item[Рекурентан образац акције, процеса или структуре који је иницијално изгледао
као добар али је у пракси показао да доноси више проблема него решења,])#list(list.item[Рефакторисано решење проблема постоји, јасно је документовано и доказано у
пракси.])
#heading(level: 3)[Неки од примера антиобразаца] #label("org9ec035e")
Примери антиобразаца су#super[\u{2a}]:

#list(list.item[#emph[Cargo cult programming] \u{2d} Коришћење образаца и метода без разумевања због чега
се користе.])#list(list.item[#emph[God object] \u{2d} Концентрисање превише функционалности у један елемент дизајна
(најчешће класу).])#list(list.item[#emph[Big ball of mud] \u{2d} Систем без јасне структуре.])#list(list.item[#emph[Copy and paste programming] \u{2d} Копирање и измена постојећег кода уместо креирања
генеричког решења.])#list(list.item[#emph[Not Invented Here (NIH) sindrom] \u{2d} Тенденција ка измишљању #text(weight: "bold", [топле воде]) уместо
коришћења постојећег, опробаног решења.])#list(list.item[#emph[Premature optimization] \u{2d} Оптимизовање софтвера прерано на уштрб доброг дизајна
и функционалности.])#list(list.item[#emph[Dependency hell] \u{2d} Проблеми са верзијама зависних компоненти и софтвера.])

#list(list.item[#raw("*") За шири списак видети #link("http://en.wikipedia.org/wiki/Anti-pattern")])
#heading(level: 3)[Литература] #label("orgb78e9d6")
#list(list.item[E. Gamma, R. Helm, R. Johnson, and J. M. Vlissides, #emph[Design Patterns: Elements
of Reusable Object\u{2d}Oriented Software], Addison\u{2d}Wesley Professional, 1994])#list(list.item[M. Grand, #emph[Patterns in Java: A Catalog of Reusable Design Patterns Illustrated
with UML], John Wiley & Sons, Inc., vol. 1, 2002])#list(list.item[#link("http://en.wikipedia.org/wiki/Anti-pattern")[Anti\u{2d}pattern] #footnote(link("http://en.wikipedia.org/wiki/Anti-pattern")), From Wikipedia, the free encyclopedia])
#heading(level: 1)[Креациони обрасци] #label("org36791fc")
#heading(level: 2, outlined: false, numbering: none)[Садржај] #label("orgd781a20")
#heading(level: 2)[Фундаментални обрасци] #label("org1e1d50f")
#heading(level: 3)[Фундаментални обрасци] #label("orgdc145ed")
#list(list.item[Обрасци који се користе за изградњу сложенијих образаца.])#list(list.item[Често подржани програмским језиком.])
#heading(level: 2)[Delegation] #label("orgd591676")
#heading(level: 3)[Delegation] #label("org3bdd54e")
#list(list.item[Општи начин проширења функционалности класе или објекта.])#list(list.item[Користи се у ситуацијама када наслеђивање није довољно флексибилно, посебно у
ситуацији када програмски језик омогућава само једноструко наслеђивање.])#list(list.item[Динамичко проширење при инстанцирању класе дефинисањем делегата.])
#heading(level: 3)[Пример проблема] #label("org9a1c39c")
#figure([#image(sys.inputs.file-1)]) #label("orgb6d2607")
#heading(level: 3)[Пример решења] #label("org9af106d")
#figure([#image(sys.inputs.file-2)]) #label("orgaf18d96")
#heading(level: 3)[Структура обрасца] #label("org1eedaa9")
#figure([#image(sys.inputs.file-3)]) #label("org0370d41")
#heading(level: 3)[Пример] #label("org88fef7f")
#figure([#raw(block: true, lang: "java", "interface I {
    void f();
    void g();
}
class A implements I {
    public void f() { System.out.println(\u{22}A: doing f()\u{22}); }
    public void g() { System.out.println(\u{22}A: doing g()\u{22}); }
}
class B implements I {
    public void f() { System.out.println(\u{22}B: doing f()\u{22}); }
    public void g() { System.out.println(\u{22}B: doing g()\u{22}); }
}")]) #label("org84b6666")

#figure([#raw(block: true, lang: "java", "class C implements I {
    // delegation
    I i = new A();

    public void f() { i.f(); }
    public void g() { i.g(); }
}

// normal attributes
public void toA() { i = new A(); }
public void toB() { i = new B(); }

public class Main {
    public static void main(String[] args) {
        C c = new C();
        c.f();
        // output: A: doing f()
        c.g();
        // output: A: doing g()
        c.toB();
        c.f();
        // output: B: doing f()
        c.g();
        // output: B: doing g()
    }
}")]) #label("orgeaea981")

#list(list.item[Извор: Wikipedia])
#heading(level: 3)[Када користити?] #label("orgc2dba3a")
#list(list.item[Наслеђивање је статичка веза. Потребно је да објекат #emph[мења класу] у време
извршавања.])#list(list.item[Потребно је симулирати вишеструко наслеђивање. Делегатор може имати више
делегата.])#list(list.item[Желимо да наследимо одређену класу али она није под нашом контролом.
Делегација је у том случају безбеднија јер нас штити од некомпатибилних
промена надкласе.])
#heading(level: 2)[Interface] #label("orgf9c6544")
#heading(level: 3)[Interface] #label("org768350c")
#list(list.item[Желимо да учинимо клијента независним од класа које обезбеђују сервис тако да
можемо изменити класе без утицаја на клијента.])#list(list.item[Сервисне класе већ наслеђују неке класе а вишеструко наслеђивање није
подржано.])
#heading(level: 3)[Структура обрасца] #label("org3594a55")
#figure([#image(sys.inputs.file-4)]) #label("org6079e1e")
#heading(level: 3)[Пример] #label("org9878c8f")
#figure([#image(sys.inputs.file-5)]) #label("orgaa8d8f3")
#heading(level: 3)[Шта добијамо?] #label("org5c75fde")
#list(list.item[Сервисна класа може бити замењена без утицаја на клијента.])#list(list.item[Сервисна класа може имплементирати више интерфејса и наслеђивати произвољну
класу.])
#heading(level: 2)[Interface and Abstract Class] #label("org1e8fe54")
#heading(level: 3)[Interface and Abstract Class] #label("org30bae72")
#list(list.item[Проширење #emph[Interface] обрасца.])#list(list.item[Желимо да клијента учинимо независним од хијерархије класа које имплементирају
сервис на такав начин да можемо мењати класе које имплементирају сервис без
утицаја на клијента.])#list(list.item[Истовремено желимо да дефинишемо апстрактну имплементацију сервиса тако да
конкретни сервиси могу да редефинишу\u{2f}допуне базну имплементацију.])
#heading(level: 3)[Структура обрасца] #label("orgf11fe6d")
#figure([#image(sys.inputs.file-6)]) #label("org5217f63")
#heading(level: 3)[Пример] #label("orgcfaacee")
#figure([#image(sys.inputs.file-7)]) #label("orgacd3e76")
#heading(level: 3)[Шта добијамо?] #label("orge3b84be")
#list(list.item[Конкретан сервис може бити базиран на апстрактној имплементацији али и не
мора. Довољно је да имплементира интерфејс сервиса.])#list(list.item[Сервисна класа може имплементирати више интерфејса и може наслеђивати
произвољну класу.])#list(list.item[Апстрактна класа обезбеђује базичну имплементацију чиме се развој нових
сервисних класа убрзава.])
#heading(level: 2)[Креациони обрасци] #label("org0695e77")
#heading(level: 3)[Креациони обрасци] #label("org8aab122")
#list(list.item[Апстракција и локализација процеса инстанцирања објеката.])#list(list.item[Чине систем независним од начина креирања и композиције објеката.])
#heading(level: 3)[Базичне особине] #label("org6ef88ce")
Базичне особине креационих образаца су следеће:

#list(list.item[Енкапсулирају знање о конкретним класама које систем користи.])#list(list.item[Скривају начин на који се врши инстацирање класа и композиција објеката.])
#heading(level: 3)[Каталог креационих образаца] #label("org2c1a871")
Према [1] креациони обрасци су следећи:

#list(list.item[Factory Method])#list(list.item[Abstract Factory])#list(list.item[Prototype])#list(list.item[Builder])#list(list.item[Singleton])

#list(list.item[E. Gamma, R. Helm, R. Johnson, and J. M. Vlissides, #emph[Design Patterns: Elements
of Reusable Object\u{2d}Oriented Software], Addison\u{2d}Wesley Professional, 1994])
#heading(level: 2)[Factory Method] #label("orgb441ea6")
#heading(level: 3)[Factory Method] #label("org69f0be2")
#list(list.item[Желимо да одвојимо клијента од конкретне имплементације путем Интерфејса.])#list(list.item[Желимо да клијент креира објекте на такав начин да "не зна" коју конкретну
класу инстанцира.])
#heading(level: 3)[Структура] #label("orgc064c89")
#figure([#image(sys.inputs.file-8)]) #label("orgc48c137")
#heading(level: 3)[Шта добијамо?] #label("orgd644e96")
#list(list.item[Инстанцирање конкретних објеката је локализовано. Програмски код није јако
спрегнут са типом конкретних инстанци.])#list(list.item[Класа може делегирати креирање конкретних објеката које користи на своје
подкласе чиме се постиже већа флексибилност.])
#heading(level: 3)[А шта губимо?] #label("orgc8a7670")
#list(list.item[Релативно велики број класа.])#list(list.item[Сваки нови Производ захтева новог Креатора.])
#heading(level: 3)[Демонстрација обрасца #emph[Factory Method] на примеру у Јави] #label("org3c362e6")
#heading(level: 2)[Abstract Factory] #label("orga67050c")
#heading(level: 3)[Abstract Factory] #label("org8e59218")
#list(list.item[Проширење #emph[Factory Method] обрасца.])#list(list.item[Креирање фамилије објеката сличних по функцији коју врше у апликацији при
чему клијент (објекат који их користи) "не зна" конкренте класе објеката.])
#heading(level: 3)[Структура] #label("orgc2fcb12")
#figure([#image(sys.inputs.file-9)]) #label("org060b459")
#heading(level: 3)[Шта добијамо?] #label("org87f0cb9")
#list(list.item[Инстанцирање фамилије конкретних објеката је локализовано.])#list(list.item[Програмски код није јако спрегнут са типом конкретних инстанци.])#list(list.item[Промена фамилије конкретних инстанци могућа је изменом програмског кода на
месту где се инстанцира конкретна фабрика објеката (најчешће једна линија
кода).])#list(list.item[У одређеним случајевима могућа је динамичка промена фабрике објеката (нпр.
#link("https://en.wikipedia.org/wiki/Pluggable_look_and_feel")[Swing PLAF] #footnote(link("https://en.wikipedia.org/wiki/Pluggable_look_and_feel"))).])
#heading(level: 3)[А шта губимо?] #label("org03a0d5a")
#list(list.item[Релативно велики број класа.])#list(list.item[Сваки нови Производ захтева нову методу у свим Креаторима и свака нова
фамилија производа захтева новог конкретног Креатора и нове конкретне
производе.])
#heading(level: 2)[Prototype] #label("org544ff71")
#heading(level: 3)[Prototype] #label("orga424141")
Креирање објекта копирањем већ постојеће инстанце.
#heading(level: 3)[Структура] #label("orge099efb")
#figure([#image(sys.inputs.file-10)]) #label("orgcd46aa1")
#heading(level: 3)[Шта добијамо?] #label("org7741caa")
#list(list.item[Елиминишемо потребу за постојањем креатор класа и њених наследница при
коришћењу #emph[Factory Method] дизајн шаблона \u{2d} смањује се број потребних класа.])#list(list.item[Ако је инстанцирање објеката превише "скупо" са становишта потрошње
процесорског времена и меморије, клонирање већ креираних објеката може довести
до убрзања и смањења потрошње меморије.])#list(list.item[Уколико нам требају инстанце објеката чије стање се разликује од иницијалног
али је слично већ постојећим једноставније је клонирање постојећег, сличног,
објекта и измена потребних атрибута од креирања и пуне иницијализације новог
објекта.])
#heading(level: 3)[На шта треба обратити пажњу?] #label("org6c07c6b")
#list(list.item[Клонирање се најчешће реализује тзв. "дубоким копирањем" (енг. #emph[deep copy]).])#list(list.item[Јавина #raw("clone") операција је реализована као "плитко копирање" (енг. #emph[shallow
copy]).])
#heading(level: 3)[Демонстрација обрасца #emph[Prototype] на примеру у Јави] #label("orgdfa6bac")
#heading(level: 2)[Builder] #label("orgcd26952")
#heading(level: 3)[Builder] #label("org10054dd")
Конструкција сложених објеката поделом надлежности на онога ко "зна" како треба
направити структуру сложеног објекта и онога ко "зна" како треба креирати
појединачне делове.
#heading(level: 3)[Структура] #label("orgc4a24c8")
#figure([#image(sys.inputs.file-11)]) #label("org3aff2dc")
#heading(level: 3)[Шта добијамо?] #label("org2d519ad")
Раздвајамо конструкцију сложеног објекта (најчешће #emph[Composite]) од његове
репрезентације тако да исти поступак изградње може резултовати различитим
репрезентацијама.
#heading(level: 3)[Када користити?] #label("org419ee3f")
#list(list.item[Ако је потребно учинити алгоритам за креирање сложених објеката независним од
конкретних делова који сачињавају објекат.])#list(list.item[Ако процес конструкције мора обезбедити различите репрезентације објекта који
се изграђује.])
#heading(level: 3)[Напомена] #label("orgbdd60ea")
Постоји и друга врста #emph[Builder] обрасца где се објекат гради у корацима употребом
помоћног #emph[Builder] објекта.

Пример у Јави:

#figure([#raw(block: true, lang: "java", "public class Car {
    private String make;
    private String model;
    private int year;
    private String color;
    private int horsepower;

    private Car(Builder builder) {
        this.make = builder.make;
        this.model = builder.model;
        this.year = builder.year;
        this.color = builder.color;
        this.horsepower = builder.horsepower;
    }")]) #label("org6047284")
#figure([#raw(block: true, lang: "java", "public static class Builder {
        private String make;
        private String model;
        private int year;
        private String color;
        private int horsepower;

        public Builder withMake(String make) {
            this.make = make;
            return this;
        }

        public Builder withModel(String model) {
            this.model = model;
            return this;
        }
        ...

        public Car build() {
            return new Car(this);
        }
    }
    ...")]) #label("orgeddcbba")
#figure([#raw(block: true, lang: "java", "@Override
    public String toString() {
        return \u{22}Car{\u{22} +
                \u{22}make='\u{22} + make + '\'' +
                \u{22}, model='\u{22} + model + '\'' +
                \u{22}, year=\u{22} + year +
                \u{22}, color='\u{22} + color + '\'' +
                \u{22}, horsepower=\u{22} + horsepower +
                '}';
    }

    public static void main(String[] args) {
        Car car = new Car.Builder()
                .withMake(\u{22}Toyota\u{22})
                .withModel(\u{22}Camry\u{22})
                .withYear(2020)
                .withColor(\u{22}Blue\u{22})
                .withHorsepower(200)
                .build();

        System.out.println(car);
    }
}")]) #label("org4f14a0f")

#raw(block: false, "Car{make='Toyota', model='Camry', year=2020, color='Blue', horsepower=200}")


Може се комбиновати и са #link("https://docs.rust-embedded.org/book/static-guarantees/typestate-programming.html")[Typestate обрасцем] #footnote(link("https://docs.rust-embedded.org/book/static-guarantees/typestate-programming.html")) у циљу боље контроле могућих конфигурација.
#heading(level: 2)[Singleton] #label("orge7aac7d")
#heading(level: 3)[Singleton] #label("org2e4829a")
#list(list.item[Потребно је да постоји само једна инстанца класе у систему. На пример: logger,
регистар, јединствена конекција ка бази и сл.])#list(list.item[Јединична инстанца мора бити доступна свим клијентима.])
#heading(level: 3)[Структура] #label("orgc099353")
#figure([#image(sys.inputs.file-12)]) #label("orgd553d86")
#heading(level: 3)[Шта добијамо?] #label("org8133ef8")
#list(list.item[Контролисани приступ јединственој инстанци.])#list(list.item[Наслеђивање класе јединствене инстанце и омогућавање реконфигурације система и
у време извршавања (#emph[run\u{2d}time]).])#list(list.item[Ако је накнадно потребно, може се обезбедити постојање више од једне инстанце.
На пример, #emph[Connection Pool].])
#heading(level: 3)[Напомена] #label("orgcfb2641")
#list(list.item[#emph[Singleton] се данас сматра анти\u{2d}обрасцем.])#list(list.item[Два главна разлога:

#list(list.item[#emph[Singleton] је глобални објекат – глобалне варијабле лоше утичу на квалитет
дизајна и на конкурентност у контексту вишенитног програмирања.])#list(list.item[#emph[Singleton] се тешко #emph[mock\u{2d}up]\u{2d}ује (клијентски код је чврсто спрегнут са
#emph[Singleton] објектом) па је тестирање кода који га користи веома тешко. Овај
проблем се може решити коришћењем #emph[Dependency Injection] обрасца.])])
#heading(level: 2)[Литература] #label("org4599b01")
#list(list.item[E. Gamma, R. Helm, R. Johnson, and J. M. Vlissides, #emph[Design Patterns: Elements
of Reusable Object\u{2d}Oriented Software], Addison\u{2d}Wesley Professional, 1994])#list(list.item[M. Grand, #emph[Patterns in Java: A Catalog of Reusable Design Patterns Illustrated
with UML], John Wiley & Sons, Inc., vol. 1, 2002])
#heading(level: 1)[Структурални обрасци] #label("org2437f26")
#heading(level: 2, outlined: false, numbering: none)[Садржај] #label("org1d3a717")
#heading(level: 2)[Структурални софтверски обрасци] #label("org43a06fd")
Баве се удруживањем објеката и класа, коришћењем наслеђивања, композиције и
делегације, у циљу формирања сложенијих структура.
#heading(level: 2)[Adapter] #label("orga593c04")
#heading(level: 3)[Adapter] #label("org6398665")
#list(list.item[Прилагођавамо компоненту чија нам је функционалност потребна али њен
интерфејс не одговара нашим захтевима.])#list(list.item[Нпр. прилагођавање COTS (#emph[Commercial Of\u{2d}The\u{2d}Shelf]) компоненти нашем систему или
прилагођавање старих компоненти захтевима новог система.])#list(list.item[Креирање компоненте тако да је могуће користити у различитим, унапред
непознатим, сценаријима.])#list(list.item[Познат још и као #emph[Wrapper].])
#heading(level: 3)[Пример] #label("org847b95a")
#figure([#image(sys.inputs.file-13)]) #label("org74cae51")
#heading(level: 3)[Структура] #label("orge2dd30d")
#figure([#image(sys.inputs.file-14)]) #label("org9d90a3e")
#heading(level: 3)[Две верзије] #label("org70e15d7")
#list(list.item[#emph[Базиран на класама и наслеђивању] – Класа која се адаптира се наслеђује и
класа наследница имплементира одговарајући интерфејс.])#list(list.item[#emph[Базиран на објектима и делегацији] – Објекту који се адаптира се делегирају
позиви од стране адаптер објекта.])
#heading(level: 3)[Напомене] #label("orgb747902")
#list(list.item[Количина посла коју адаптер ради варира од обичне конверзије параметара и
назива метода до подршке за потпуно другачији сет операција.])#list(list.item[Измењиви адаптери (#emph[Pluggable adapters]) – Креирање компоненте тако да
се унапред предвиди адаптација објеката са којима треба да сарађује иако
унапред објекти и њихове класе нису познати. Пример #emph[TreeDisplay].#super[1]])

#list(list.item[E. Gamma, R. Helm, R. Johnson, and J. M. Vlissides, #emph[Design Patterns: Elements
of Reusable Object\u{2d}Oriented Software], Addison\u{2d}Wesley Professional, 1994])
#heading(level: 3)[Пример \u{2d} TreeDisplay] #label("org4699478")
#figure([#image(sys.inputs.file-15)]) #label("orge4fa2ba")

#list(list.item[E. Gamma, R. Helm, R. Johnson, and J. M. Vlissides, #emph[Design Patterns: Elements
of Reusable Object\u{2d}Oriented Software], Addison\u{2d}Wesley Professional, 1994])
#heading(level: 2)[Bridge] #label("org29d51c4")
#heading(level: 3)[Bridge] #label("org51dd39a")
Раздвајање абстракције од имплементације тако да се могу независно мењати.
#heading(level: 3)[Пример проблема] #label("orgfb1562a")
#figure([#image(sys.inputs.file-16)]) #label("orgc59e574")
#heading(level: 3)[Примена #emph[Bridge] обрасца] #label("orgd3dbf3d")
#figure([#image(sys.inputs.file-17)]) #label("org31cd8d3")
#heading(level: 3)[Структура] #label("orgb750202")
#figure([#image(sys.inputs.file-18)]) #label("org872a6e5")
#heading(level: 3)[Када кориситити] #label("orgadffb94")
#list(list.item[Када желимо избећи трајно везивање апстракције и имплементације. На пример,
ако је потребна измена имплементације у време извршавања апликације.])#list(list.item[Када желимо да омогућимо независно проширење апстракције и имплементације
кроз наслеђивање.])#list(list.item[Када имамо сложене хијерархије класа као што је показано у примеру.])
#heading(level: 3)[Инстанцирање конкретне имплементације] #label("org61829c8")
Одлука о инстанцирању конкретне имплементације:
#list(list.item[Конструктор апстракције путем параметра (ако зна за све имплементације).])#list(list.item[Делегирање надлежности другом објекту – видети #emph[Factory Method] \u{2d} уколико је
потребно учинити апстракције несвесне конкретних имплементација.])
#heading(level: 2)[Composite] #label("org5ecace5")
#heading(level: 3)[Composite] #label("org9d6fc3a")
#list(list.item[Композиција објеката у структуре облика стабла.])#list(list.item[Униформно третирање простих и сложених објеката.])
#heading(level: 3)[Структура обрасца] #label("org5d3906d")
#figure([#image(sys.inputs.file-19)]) #label("org9f3584a")
#heading(level: 3)[Пример] #label("orgc3f5a46")
#figure([#image(sys.inputs.file-20)]) #label("org8fa0916")
#heading(level: 3)[Напомена] #label("org1ab93fd")
GOF књига – методе за манипулацију #emph[child] елементима у #raw("Component") апстрактној класи.
#heading(level: 3)[Када користити?] #label("org246c571")
#list(list.item[Ако желите да креирате хијерархије објеката типа целина\u{2d}део.])#list(list.item[Желите да клијент може да игнорише разлике између композитних и простих
објеката и третира их на униформан начин.])
#heading(level: 3)[Демонстрација обрасца #emph[Composite] на примеру у Јави] #label("orge15e1f8")
#heading(level: 2)[Decorator] #label("org830dbfa")
#heading(level: 3)[Decorator] #label("org2171c59")
#list(list.item[Додавање одговорности објекту динамички.])#list(list.item[Флексибилна алтернатива за наслеђивање.])#list(list.item[По структури сличан #emph[Adapter] обрасцу али има другу намену.])
#heading(level: 3)[Мотивација] #label("org551a809")
#figure([#image(sys.inputs.file-21)]) #label("org0f53aa4")
#heading(level: 3)[Пример] #label("orgf326291")
#figure([#image(sys.inputs.file-22)]) #label("orgfb83ac3")
#heading(level: 3)[Структура обрасца] #label("orged4b9b4")
#figure([#image(sys.inputs.file-23)]) #label("org9abc322")
#heading(level: 3)[Пример \u{2d} #emph[React Higher\u{2d}Order Components (HOCs)]] #label("org5706256")
#figure([#raw(block: true, lang: "javascript", "function withLogging(WrappedComponent) {
  return function(props) {
    console.log('Rendering:', WrappedComponent.name);
    return <WrappedComponent {...props} />;
  };
}

const EnhancedButton = withLogging(Button);")]) #label("orgd2e33af")
#heading(level: 2)[Proxy] #label("orgc00866f")
#heading(level: 3)[Proxy] #label("orgc38e40f")
#list(list.item[Посредовање између објекта који пружа сервис и објекта који користи сервис у
циљу имплементације контроле приступа, транспарентног приступа удаљеним
објектима, AOP техника и сл.])#list(list.item[Имплементација најчешће делегира позиве метода објекту који пружа])#list(list.item[Клијент није свестан да постоји посредник између њега и објекта који
обезбеђује сервис.])#list(list.item[Познат и под називом #emph[Surrogate].])
#heading(level: 3)[Структура обрасца] #label("org547ecc7")
#figure([#image(sys.inputs.file-24)]) #label("org823387e")
#heading(level: 3)[Када се користи?] #label("org3053d92")
#list(list.item[Одлагање скупе иницијализације објекта – виртуелни прокси (#emph[Virtual Proxy]) или
лењи прокси (#emph[Lazy Proxy]).])#list(list.item[Приступ удаљеном објекту као да је локални (употребом технологија за
дистрибуиране објекте \u{2d} CORBA, DCOM, RMI и сл.) – #emph[Remote Proxy].])#list(list.item[Провера права приступа објекту – #emph[Protective Proxy].])#list(list.item[Синхронизација приступа (проверавање да ли је објекат закључан приликом
приступа), бројање референци (#emph[smart pointer]), имплементацију AOP техника –
#emph[Smart Proxy].])
#heading(level: 3)[Пример \u{2d} #emph[Lazy Proxy]] #label("org7debde7")
#figure([#image(sys.inputs.file-25)]) #label("org3192492")
#heading(level: 3)[#emph[Copy\u{2d}On\u{2d}Write] оптимизација] #label("org9e71cf1")
#list(list.item[Посебна врста лењег или виртуелног проксија.])#list(list.item[Одлагање копирања сложеног објекта (видети #emph[Prototype] образац) за тренутак
када се затражи операција модификације.])#list(list.item[Потребно бројање референци: свако креирање новог проксија увећава бројач
референци, свако стварно копирање циљног објекта умањује бројач референци.
Када бројач референци постане 0 објекат се може уклонити.])
#heading(level: 3)[Демонстрација обрасца #emph[Proxy] на примеру у Јави] #label("orgb16d364")
#heading(level: 2)[Литература] #label("org652cf15")
#list(list.item[M. Grand, #emph[Patterns in Java: A Catalog of Reusable Design Patterns Illustrated
with UML], John Wiley &amp; Sons, Inc., vol. 1, 2002])#list(list.item[E. Gamma, R. Helm, R. Johnson, and J. M. Vlissides, #emph[Design Patterns: Elements
of Reusable Object\u{2d}Oriented Software], Addison\u{2d}Wesley Professional, 1994])
#heading(level: 1)[Обрасци понашања] #label("orgc58fc28")
#heading(level: 2, outlined: false, numbering: none)[Садржај] #label("orgba71e4a")
#heading(level: 2)[Обрасци понашања] #label("org62bbbe0")
#list(list.item[Баве се алгоритмима и расподелом одговорности између објеката.])#list(list.item[Не дефинишу само образац структуре већ и образац комуникације између објеката.])
#heading(level: 2)[Iterator] #label("orgff433c4")
#heading(level: 3)[Iterator] #label("org3f968dc")
Омогућава приступ елементима колекције секвенцијално без откривања конкретне
репрезентације колекције.
#heading(level: 3)[Структура обрасца] #label("orgc921a57")
#figure([#image(sys.inputs.file-26)]) #label("org07d853a")
#heading(level: 3)[Јава имплементација] #label("org7acc01e")
Итератор образац је директно подржан у јавиним стандардним библиотекама –
интерфејси #raw("Iterable<E>") и #raw("Iterator<E>").
#heading(level: 3)[Јава имплементација] #label("orga92af28")
#figure([#image(sys.inputs.file-27)]) #label("orgab77959")
#heading(level: 3)[Јава имплементација \u{2d} #emph[While] петља] #label("org42ba23a")
#figure([#raw(block: true, lang: "java", "List<Integer> intList = new ArrayList<Integer>();
Iterator<Integer> i = intList.iterator();
while(i.hasNext()){
    Integer a = i.next();
    System.out.println(a);
}")]) #label("org875392c")
#heading(level: 3)[Јава имплементација \u{2d} #emph[ForEach] петља] #label("orgcc1fd79")
Итератори су подржани директно у Јава програмском језику. #emph[For\u{2d}each] петља у јави
се може користити за било који објекат који имплементира #raw("Iterable<E>") интерфејс
или за јава низове.

#figure([#raw(block: true, lang: "java", "List<Integer> intList = new ArrayList<Integer>();
for(Integer i: intList){
    System.out.println(i);
}")]) #label("org6b19e73")
#heading(level: 2)[Command] #label("orged26709")
#heading(level: 3)[Command] #label("orgd0e5217")
#list(list.item[Енкапсулација захтева за обрадом у виду објекта.])#list(list.item[Омогућава креирање редова за обраду (#emph[Queues]) као и #emph[undo] операције.])#list(list.item[Познат и под називима #emph[Action] и #emph[Transaction].])
#heading(level: 3)[Структура обрасца] #label("org4f8f88c")
#figure([#image(sys.inputs.file-28)]) #label("org0544d3f")
#heading(level: 3)[Сарадња учесника] #label("orgae4d656")
#figure([#image(sys.inputs.file-29)]) #label("org4506dee")
#heading(level: 3)[Шта добијамо?] #label("orgdb9ec94")
#list(list.item[Раздвајамо објекат који иницира извршавање операција од онога који "зна" како
операцију треба извршити.])#list(list.item[#emph[Command] објекти су објекти првог реда. Могу се третирати као и сви други
објекти.])#list(list.item[Команде се могу компоновати (употребом #emph[Composite] обрасца) и формирати
сложеније команде – макро команде.])#list(list.item[Нове команде се лако додају – није потребно изменити постојеће класе.])
#heading(level: 2)[Mediator] #label("org9ee9fe3")
#heading(level: 3)[Mediator] #label("orgea234f2")
#list(list.item[Објекат који енкапсулира знање о интеракцији групе објеката.])#list(list.item[Омогућава слабо спрезање (#emph[loose coupling]) објеката тако што објекти не
референцирају једни друге директно.])
#heading(level: 3)[Структура обрасца] #label("org4cc5bcc")
#figure([#image(sys.inputs.file-30)]) #label("org6881008")
#heading(level: 3)[Пример] #label("orgb92524a")
#figure([#image(sys.inputs.file-31)]) #label("org982e952")
#heading(level: 3)[Сарадња учесника] #label("org95d181f")
#figure([#image(sys.inputs.file-32)]) #label("orgd2063a7")
#heading(level: 3)[Шта добијамо?] #label("org2e6f706")
#list(list.item[Сложена интеракција објеката је централизована – измена се врши наслеђивањем
једне класе.])#list(list.item[Објекти који ступају у интеракцију су слабо спрегнути – објекте и медијатор
можемо мењати независно.])#list(list.item[Једноставнији протокол – везе #emph[више\u{2d}на\u{2d}више] замењене везама #emph[један\u{2d}на\u{2d}више] које
су лакше за разумевање и измену.])#list(list.item[Логика интеракције објеката је одвојена од њиховог индивидуалног понашања –
инеракција се лакше анализира.])#list(list.item[Проблем који може настати – монолитан и превише комплексан медијатор објекат.])
#heading(level: 2)[Memento] #label("orgcc2e1a5")
#heading(level: 3)[Memento] #label("org2fd4cb9")
#list(list.item[Без нарушавања енкапсулације бележи и екстернализује интерно стање објекта
тако да се објекат може касније вратити у идентично стање.])#list(list.item[Познат и под називом #emph[Token].])
#heading(level: 3)[Структура обрасца] #label("org0fb1600")
#figure([#image(sys.inputs.file-33)]) #label("org3ece00e")
#heading(level: 3)[Сарадња учесника] #label("org744d2af")
#figure([#image(sys.inputs.file-34)]) #label("orgb225c40")
#heading(level: 3)[Шта добијамо?] #label("orgf0a13f4")
#list(list.item[Очувавамо енкапсулацију – мементо не открива детаље интерне имплементације
#emph[Originator] објекта иако се његово стање чува ван њега. Приступ #emph[Memento]
објекту је могућ само од стране #emph[Originator] објекта.])#list(list.item[Поједностављен дизајн #emph[Originator] објекта – клијенти чувају стање објекта кроз
#emph[Memento] објекат.])#list(list.item[Боља скалабилност \u{2d} чување стања се препушта клијентима.])#list(list.item[Коришћење #emph[Memento] објеката може бити проблематично уколико је стање
#emph[Originator]\u{2d}а дефинисано великом количином података.])#list(list.item[У неким програмским језицима је тешко спречити приступ интерној структури
#emph[Memento] објекта од стране других објеката у систему.])
#heading(level: 2)[Observer] #label("orgcb22277")
#heading(level: 3)[Observer] #label("orge0ce8bd")
#list(list.item[Дефинише међузависност објеката тако да када се стање једног објекта промени
сви зависни објекти се аутоматски обавештавају.])#list(list.item[Познат и под називом #emph[Publish\u{2d}Subscribe].])
#heading(level: 3)[Структура обрасца] #label("orga65fca7")
#figure([#image(sys.inputs.file-35)]) #label("orgcd130b2")
#heading(level: 3)[Сарадња учесника] #label("org85f4f08")
#figure([#image(sys.inputs.file-36)]) #label("orgbb19303")
#heading(level: 3)[Подршка у Јави] #label("org428962d")
#list(list.item[Интерфејс #raw("Observer") и класа #raw("Observable") у пакету #raw("java.util").])#list(list.item[Механизам #emph[Listener]\u{2d}а у #emph[Swing]\u{2d}у прати овај образац.])
#heading(level: 3)[Шта добијамо?] #label("org2311774")
#list(list.item[Апстрактно спрезање #emph[Observer] и #emph[Observable] објеката. #emph[Observable] не зна
конкретне класе #emph[Observer] објеката већ комуницира са њима путем једноставног
интерфејса.])#list(list.item[#emph[Broadcast] стил комуникације. #emph[Observable] јавља да се промена догодила. Не мора
се наводити прималац поруке. Сви заинтересовани ослушкивачи ће добити
нотификацију о промени.])#list(list.item[Уколико #emph[Observable] не наводи у позиву поруке шта је промењено, #emph[Observer]\u{2d}и
морају то сами да испитају што може бити "скупо".])
#heading(level: 3)[Напомене] #label("org51ce4a3")
#list(list.item[Уколико #emph[Observer] посматра више #emph[Observable] објеката потребно је идентификовати
објекат који шаље поруку о промени – слање референце на објекат као
аргумент.])#list(list.item[Измена стања #emph[Observable] објекта приликом обраде нотификације може довести до
бесконачне рекурзије.])
#heading(level: 2)[State] #label("org11998c9")
#heading(level: 3)[State] #label("org6b865a2")
Измена понашања објекта приликом промене његовог интерног стања. Објекат се
понаша као да је променио класу.
#heading(level: 3)[Структура обрасца] #label("orgd3e5501")
#figure([#image(sys.inputs.file-37)]) #label("org5531cf5")
#heading(level: 3)[Сарадња учесника] #label("orgfdbdc9a")
#list(list.item[#emph[Context] делегира операције зависне од стања објекту стате (#emph[ConcreteStateX]).])#list(list.item[#emph[Context] може проследити себе у захтеву уколико стање треба да му приступа.])#list(list.item[Клијенти користе искључиво #emph[Context], мада могу, уколико је потребно, поставити
текуће стање.])#list(list.item[Одлуку о преласку у ново стање може донети #emph[Context] или текући стате објекат.])
#heading(level: 3)[Пример] #label("org9cc1743")
#figure([#image(sys.inputs.file-38)]) #label("org092285e")
#heading(level: 3)[Шта добијамо?] #label("orge01ed73")
#list(list.item[Локализација кода специфичног за одређено стање у једну класу \u{2d} избегавање
великих #emph[switch\u{2f}if\u{2d}else] исказа.])#list(list.item[Експлицитан прелазак између стања.])
#heading(level: 3)[Напомене] #label("org7ae7e89")
#list(list.item[Промена стања: #emph[Context] или #emph[ConcreteStateX]?
#list(list.item[Уколико мења #emph[ConcreteStateX] потребно је да приступа #emph[Context]\u{2d}у преко
интерфејса за промену стања.])#list(list.item[Негативно: стања морају да знају једна за друге.])#list(list.item[Уколико #emph[Context] мења стање – код може бити доста комплексан код већег броја
стања.])])#list(list.item[Креирање и уништавање #emph[State] објеката: једном при иницијализацији или при
свакој промени стања.])#list(list.item[Одређени програмски језици подржавају облик динамичког наслеђивања – природна
подршка за #emph[State] образац.])
#heading(level: 2)[Strategy] #label("orgd19fd54")
#heading(level: 3)[Strategy] #label("orgb207545")
Дефинисање фамилије алгоритама и омогућавање њихове измене без утицаја на
клијента.
#heading(level: 3)[Структура обрасца] #label("orgb9c7ff5")
#figure([#image(sys.inputs.file-39)]) #label("org16fd70d")
#heading(level: 3)[Пример] #label("orge3e0057")
#figure([#image(sys.inputs.file-40)]) #label("org54e734b")
#heading(level: 3)[Шта добијамо?] #label("orga872f0d")
#list(list.item[Дефинисање фамилије алгоритама. Наслеђивање стратегија се може користити за
имплементацију заједничке функционалности алгоритама.])#list(list.item[Измена понашања објекта динамички. Наслеђивањем контекст класе може се
постићи измена функционалности али је она статичке природе.])#list(list.item[Елиминација исказа услова (#emph[if\u{2d}else, switch]).])#list(list.item[Омогућавамо клијенту избор алгоритма и његових перформанси (нпр. мањи утрошак
меморије или брже извршавање).])
#heading(level: 2)[Template Method] #label("org4e12eef")
#heading(level: 3)[Template Method] #label("org1122499")
#list(list.item[Дефинисање структуре алгоритма при чему се дефинисање одређених корака
оставља класама наследницама.])#list(list.item[Структура алгоритма је непромењива али се одређени кораци могу променити.])
#heading(level: 3)[Структура обрасца] #label("orgbe35173")
#figure([#image(sys.inputs.file-41)]) #label("org4ce4878")
#heading(level: 3)[Пример] #label("org47104b9")
#figure([#image(sys.inputs.file-42)]) #label("orgd9afffc")
#heading(level: 3)[Шта добијамо?] #label("org35a4366")
#list(list.item[Могућност дефинисања инваријантних делова алгоритма у апстрактној класи а
варијабилних делова у подкласама – спречава се дуплирање кода.])#list(list.item[Инвертовање контроле – #emph[Hollywood principle]

#figure([#quote(block: true)[Don’t call us, we’ll call you
]]) #label("orga8527ff")])#list(list.item[Дефинисање тзв. #emph[hook] операција. Најчешће су празне али могу имати дефинисано
и стандардно понашање. За разлику од апстрактних операција, #emph[hook] операције су
опционе (не морају се редефинисати).])
#heading(level: 2)[Visitor] #label("orgdcb468c")
#heading(level: 3)[Visitor] #label("org53dc775")
#list(list.item[Раздвајање алгоритма од структуре података над којим оперише.])#list(list.item[Локализација имплементације операције која се извршава над елементима сложене
структуре података (нпр. чворовима стабла).])
#heading(level: 3)[Структура] #label("org63ed46d")
#figure([#image(sys.inputs.file-43)]) #label("orgbf5a429")
#heading(level: 3)[Сарадња учесника] #label("org1fd096f")
#figure([#image(sys.inputs.file-44)]) #label("orgdb57f56")
#heading(level: 3)[Пример] #label("org39b50d1")
#figure([#image(sys.inputs.file-45)]) #label("org4771e55")
#heading(level: 3)[Када користити?] #label("org18fc5a6")
#list(list.item[Објектна структура садржи елементе различитих класа а потребно је извршити
операцију која зависи од конкретне класе објекта.])#list(list.item[Више различитих, несродних операција је потребно извршити над елементима
сложене структуре а желимо избећи "загађивање", свих класа чији објекти чине
сложену структуру, са новом методом за сваку операцију.])#list(list.item[Хијерархија класа објектне структуре се ретко мења док додавање нових
операција над структуром може бити честа операција.])
#heading(level: 3)[Напомене] #label("org311b0ae")
#list(list.item[#emph[Visitor] представља имплементацију #emph[Double Dispatch] механизма. Позвана
операција зависи истовремено од типа конкретног #emph[Visitor] објекта као и од типа
конкретног елемента структуре над којом се операција врши.])#list(list.item[Сродне операције су локализоване у једној класи.])
#heading(level: 2)[Chain of Responsibility] #label("orgbdba1c6")
#heading(level: 3)[Chain of Responsibility] #label("org7d6e66a")
Избегавање јаког спрезања објекта који шаље захтев од објекта који врши обраду
захтева тако што се објекти који врше обраду увезују у листу и даје се шанса
сваком у низу да обради догађај све док неко не одговори позитивно на захтев
(изврши обраду).
#heading(level: 3)[Структура] #label("orgf529e3c")
#figure([#image(sys.inputs.file-46)]) #label("orge5d6944")
#heading(level: 3)[Пример] #label("org0e75ab6")
#figure([#image(sys.inputs.file-47)]) #label("org05d9e66")
#heading(level: 3)[Када користити?] #label("org5878da0")
#list(list.item[Више од једног објекта може да обради захтев а обрађивач није познат унапред.])#list(list.item[Желимо да упутимо захтев једном из групе објеката а да не наводимо конкретног
обрађивача експлицитно.])#list(list.item[Листа могућих обрађивача може динамички да се мења у време извршавања.])
#heading(level: 3)[Напомене] #label("orgc7ab3fe")
#list(list.item[Две врсте: прослеђивање захтева низ ланац и после обраде или прекид
прослеђивања.])#list(list.item[Објекат који врши обраду није експлицитно дефинисан па не постоји гаранција
да ће захтев бити обрађен.])
#heading(level: 2)[Литература] #label("orgc5f90ae")
#list(list.item[E. Gamma, R. Helm, R. Johnson, and J. M. Vlissides, #emph[Design Patterns: Elements
of Reusable Object\u{2d}Oriented Software], Addison\u{2d}Wesley Professional, 1994])#list(list.item[M. Grand, #emph[Patterns in Java: A Catalog of Reusable Design Patterns Illustrated
with UML], John Wiley & Sons, Inc., vol. 1, 2002])
#heading(level: 1)[Микросервисни обрасци] #label("org5200dc9")
#heading(level: 2, outlined: false, numbering: none)[Садржај] #label("orgfc55f68")
#heading(level: 2)[Увод] #label("org10fba0c")
#heading(level: 3)[Микросервиси (#emph[Microservices])] #label("org27c3b29")
#list(list.item[Софтверске компоненте.])#list(list.item[Висока кохезија, слаба спрега.])#list(list.item[Комуникација се обавља путем стандардних технолошки независних протокола
(најчешће HTTP употребом REST стила уз JSON формат порука).])#list(list.item[Могу бити имплементирани у различитим програмских језицима и технологијама.])#list(list.item[Мали су, ограниченог контекста. Независно се развијају и распоређују.])#list(list.item[Имају јасно дефинисане интерфејсе путем којих комуницирају.])#list(list.item[#emph[Unix] филозофија:
#figure([#quote(block: true)[Do one thing and do it well.
]]) #label("org7d99741")])
#heading(level: 3)[Архитектура базирана на микросервисима] #label("org282c24a")
#list(list.item[Архитектонски стил где се апликација гради као скуп слабо спрегнутих "малих"
сервиса (микросервиса) који сарађују.])#list(list.item[Варијанта #emph[Service\u{2d}Oriented Architecture] (SOA) али сервиси су "мали" и
протоколи за комуникацију су једноставни (#emph[light\u{2d}weight]).])#list(list.item[Микросервиси пружају услуге и\u{2f}или користе друге микросервисе.])#list(list.item[У циљу независне миграције микросервиса на нове верзије интерфејси се
верзионирају и омогућава се клијентима да користе старе интерфејсе у прелазном
периоду.])

#figure([#image(sys.inputs.file-48)]) #label("org6d98f6d")
#heading(level: 3)[Предности у односу на монолитну архитектуру] #label("org35a4b04")
#list(list.item[Тимови могу бити технолошки хетерогени.])#list(list.item[Распоређивање (#emph[deployment]) се обавља у малим инкрементима (#emph[fine\u{2d}grained]).])#list(list.item[Модуларност, декомпозиција. Лакше разумевање, развој и тестирање. Отпорност на
"ерозију архитектуре".])#list(list.item[Боља скалабилност. Боља еластичност. Лако додавање нових микросервиса по
потреби.])#list(list.item[Боља отпорност на отказе. Уколико један микросервис "падне" остатак
апликације наставља да ради.])#list(list.item[Лакша миграција на нове технологије. Могућа постепеним заменама микросервиса.])#list(list.item[Интеграција хетерогених и "старих" система (#emph[legacy]).])#list(list.item[Континуална интеграција и достава (#emph[Continuous Integration\u{2f}Delivery])])
#heading(level: 3)[Мане у односу на монолитну архитектуру] #label("org0c35d0b")
#list(list.item[Више "покретних делова". Захтева боље алате за распоређивање и надзор.])#list(list.item[Теже дебаговање. Дебаговање захтева праћење захтева кроз више микросервиса
који се извршавају често на различитим физичким\u{2f}виртуелним рачунарима.])#list(list.item[Додатни трошкови (#emph[overheads]) услед комуникације.])#list(list.item[Додатни трошкови у случају потребе за дељењем података.])
#heading(level: 2)[Обрасци за рад са базама података] #label("orgff947c1")
#heading(level: 3)[База података по сервису (#emph[Database per service])] #label("orge2ffcdd")
#list(list.item[У циљу слабог спрезања сервиса подаци над којима сервиси оперишу се
имплементирају као приватни.])#list(list.item[Други сервиси не могу приступити подацима директно већ само кроз интерфејс
сервиса.])

#link("https://microservices.io/patterns/data/database-per-service.html")
#heading(level: 4, outlined: false, numbering: none)[Структура] #label("org400a0ac")
#figure([#raw(block: true, lang: "plantuml", "cloud \u{22}клијенти\u{22} as klijenti
component \u{22}Сервис за наручивање\u{22} as servis1
database baza1 [

                      Наруџбенице
----
<#FBFB77>|   ID | купац | статус     | укупно    | ... |
| 1234 |    15 | прихваћено | 23,458.00 |     |
| 1235 |     3 | у обради   | 12,223.00 |     |


]
servis1 --> baza1
servis1 -up0)- klijenti
component \u{22}Сервис за купце\u{22} as servis2
database baza2 [

                             Купци
----
<#FBFB77>| ID | Назив | лимит кредита| ... |
| 15 |    .. | .. | .. | ..    |
| 3  |    .. | .. | .. | ..    |

]
servis2 --> baza2
servis2 -up0)- klijenti")]) #label("org6c5786b")

#figure([#image(sys.inputs.file-49)]) #label("orgfd194da")
#heading(level: 4, outlined: false, numbering: none)[Предности] #label("org2374073")
#list(list.item[Подаци су део имплементације сервиса.])#list(list.item[Имплементација приватне базе се може мењати независно од остатка система.])#list(list.item[Могуће је користити хетерогене технологије.])
#heading(level: 4, outlined: false, numbering: none)[Мане] #label("org598cdc2")
#list(list.item[Отежано извођење трансакција које се обављају између података различитих
сервиса. Видети образац #link(label("orgf4852f7"))[Saga].])#list(list.item[Отежани сложени упити који обухватају податке више сервиса. Видети образац #link(label("org748d2df"))[CQRS].])
#heading(level: 4, outlined: false, numbering: none)[Начини имплементације] #label("org0ac09e6")
#list(list.item[Употреба једне инстанце базе за све сервисе:
#list(list.item[приватне табеле по сервису,])#list(list.item[приватна шема по сервису.])])#list(list.item[Посебна инстанца базе по сервису.])
#heading(level: 3)[Дељена база података (#emph[Shared database])] #label("org4949833")
#list(list.item[У циљу подршке за ACID трансакције сервиси деле исту базу податакa и могу
слободно да приступају подацима других сервиса.])

#link("https://microservices.io/patterns/data/shared-database.html")
#heading(level: 4, outlined: false, numbering: none)[Структура] #label("orgcc62de4")
#figure([#raw(block: true, lang: "plantuml", "cloud \u{22}клијенти\u{22} as klijenti
component \u{22}Сервис за наручивање\u{22} as servis1
database \u{22}Јединствена база\u{22} {

card narudzbenica [

                      Наруџбенице
----
<#FBFB77>|   ID | купац | статус     | укупно    | ... |
| 1234 |    15 | прихваћено | 23,458.00 |     |
| 1235 |     3 | у обради   | 12,223.00 |     |

]

card kupci [

                             Купци
----

<#FBFB77>| ID | Назив | лимит кредита| ... |
| 15 |    .. | .. | .. | ..    |
| 3  |    .. | .. | .. | ..    |

]

}
servis1 --> narudzbenica
servis1 -up0)- klijenti
component \u{22}Сервис за купце\u{22} as servis2
servis2 --> kupci
servis2 -up0)- klijenti")]) #label("org4e935e5")

#figure([#image(sys.inputs.file-50)]) #label("orgab85682")
#heading(level: 4, outlined: false, numbering: none)[Предности] #label("org684df33")
#list(list.item[Једноставније за имплементацију и операцију.])#list(list.item[Једноставније трансакције (ACID) и упити (нпр. могућ JOIN између табела
различитих сервиса).])
#heading(level: 4, outlined: false, numbering: none)[Мане] #label("org64521fd")
#list(list.item[Јача спрега између сервиса у време развоја (нпр. одржавање шеме базе мора
бити координисано између тимова) и у време извршавања (нпр. један сервис може
да закључа табелу и спречи друге сервисе да приступе).])#list(list.item[Сервиси могу да мењају податке других сервиса. Ово је могуће административно
регулисати уколико база подржава.])#list(list.item[Иста база можда неће задовољити потребне функционалне и нефункционалне
особине захтеване од стране неких сервиса.])
#heading(level: 2)[Обезбеђивање конзистенције] #label("orgf4852f7")
#heading(level: 3)[Saga] #label("orgf89539b")
#list(list.item[Вид дистрибуиране трансакције. Мање ригидна од #emph[two\u{2d}phase commit] (2PC).])#list(list.item[Очување конзистенције података између сервиса.])#list(list.item[Користи се када је у употреби #link(label("orgff947c1"))[Database per service] образац за имплементацију
трансакција.])#list(list.item[Низ локалних трансакција (#emph[ACID]) које објавом поруке\u{2f}догађаја иницирају следећу
трансакцију у ланцу. Уколико нека од трансакција не успе, извршава се
поништавање.])

#figure([#image(sys.inputs.file-51)]) #label("org0029e96")
#heading(level: 4, outlined: false, numbering: none)[Приступи] #label("org86762d9")
#list(list.item[Два приступа у координацији трансакције:
#list(list.item[Базиран на кореографији (#emph[Choreography]) \u{2d} после сваке локалне трансакције
објављује се догађај који иницира извршавање следеће трансакције у низу.])#list(list.item[Базиран на оркестрацији (#emph[Orchestration]) \u{2d} оркестратор (посебан објекат) је
задужен да обавести учеснике да започну или да пониште трансакцију.])])
#heading(level: 4, outlined: false, numbering: none)[Структура \u{2d} кореографија] #label("orgcd683a6")
#enum(enum.item(1)[Сервис за наручивање прима захтев #raw("POST /orders") креира наруџбину у стању #emph[у
обради]],
enum.item(2)[Прослеђује догађај #raw("Наруџбина креирана")],
enum.item(3)[Сервис за купце покушава да резервише средства и објављује догађај који
представља резултат операције: средства су резервисана или је кредит
прекорачен.],
enum.item(4)[Сервис за наручивање прихвата или одбија наруџбину.],
)

#figure([#image(sys.inputs.file-52)]) #label("orga75eb4c")
#heading(level: 4, outlined: false, numbering: none)[Структура \u{2d} оркестрација] #label("org1fadc8c")
#list(list.item[Сервис за наручивање је оркестратор тј. задужен је за координацију целокупног
процеса наручивања.])

#figure([#image(sys.inputs.file-53)]) #label("org1f5c047")
#heading(level: 4, outlined: false, numbering: none)[Предности] #label("orge9fc130")
#list(list.item[Слабија спрега. Мање ригидан систем.])#list(list.item[Боља скалабилност.])
#heading(level: 4, outlined: false, numbering: none)[Мане] #label("org4e11118")
#list(list.item[Мора се пажљиво моделовати редослед операција због потенцијалног поништавања.])#list(list.item[Шта радити у ситуацији када је операција неуспешна због техничког проблема
(нпр. сервис није тренутно доступан)?])#list(list.item[Модел конзистентности \u{2d} коначна конзистентност (#emph[Eventual Consistency]) \u{2d} немамо
гаранције да ће прочитани подаци бити право стање система тј. да ће бити конзистентни.])#list(list.item[BASE семантика (#emph[Basically\u{2d}Available, Soft\u{2d}state, Eventual consistency])
#list(list.item[#emph[Basically\u{2d}Available] \u{2d} добра доступност података али без гаранције на конзистентност])#list(list.item[#emph[Soft\u{2d}state] \u{2d} одређена вероватноћа да знамо стање јер систем можда још није конвергирао.])#list(list.item[#emph[Eventual consistency] \u{2d} ако изменимо стање после одређеног времена измена ће
бити видљива свим клијентима.])])
#heading(level: 3)[#emph[Event sourcing (ES)]] #label("orgd8b597e")
#list(list.item[Користи се код архитектуре вођене догађајима (#emph[Event\u{2d}Driven]).])#list(list.item[Уместо чувања тренутног стања ентитета чува се низ догађаја који су мењали
ентитет.])#list(list.item[Текуће стање се може добити применом свих догађаја до садашњег тренутка.])#list(list.item[Природно се користи са обрасцем #link(label("org748d2df"))[CQRS].])
#heading(level: 4, outlined: false, numbering: none)[Структура код класичног приступа] #label("org854a985")
#figure([#image(sys.inputs.file-54)]) #label("org83c2d32")
#heading(level: 4, outlined: false, numbering: none)[Структура код #emph[ES] приступа] #label("org6b2bec2")
#figure([#image(sys.inputs.file-55)]) #label("org80921cc")
#heading(level: 4, outlined: false, numbering: none)[Напомене] #label("org5b4f6e3")
#list(list.item[Ток догађаја треба да буде једини извор текућег стања.])#list(list.item[Предности:
#list(list.item[различити модели се могу изградити применом тока догађаја у будућности.])#list(list.item[природно садржи пуну историју измена што омогућава ревизију и контролу.])])#list(list.item[Мана: немогућност постављања упита над током догађаја \u{2d} због тога се користи у
синергији са #link(label("org748d2df"))[CQRS].])#list(list.item[Додатно можемо користити брокере порука (#emph[message brokers]) уместо базе података.])
#heading(level: 2)[Постављање упита] #label("org748d2df")
#heading(level: 3)[API композиција (#emph[API Composition])] #label("orgedeac7a")
#list(list.item[У случају употребе обрасца #link(label("orgff947c1"))[#emph[Database per service]] поставља се питање како
имплементирати упите који удружују податке из различитих микросервиса.])

#link("https://microservices.io/patterns/data/api-composition.html")
#heading(level: 4, outlined: false, numbering: none)[Решење] #label("org939e6dc")
#list(list.item[Креирати сервис који поставља појединачне упите и затим комбинује податке у
меморији и враћа јединствени одговор са удруженим подацима.])
#heading(level: 4, outlined: false, numbering: none)[Структура] #label("orga9aa4fc")
#figure([#image(sys.inputs.file-56)]) #label("orga71f24c")
#heading(level: 4, outlined: false, numbering: none)[Предности и мане] #label("org8a3a185")
#list(list.item[Предности:
#list(list.item[Поједностављење сложених упита.])#list(list.item[Једно место за ажурирање сложених упита.])])#list(list.item[Мане:
#list(list.item[Поједини упити могу бити неефикасни јер се велика количина података преноси
преко мреже и удружује у меморији.])])
#heading(level: 4, outlined: false, numbering: none)[Пример] #label("orge3bdb4d")
#list(list.item[Образац #link(label("orgfd2760b"))[#emph[API Gateway]] често ради API композицију.])
#heading(level: 3)[CQRS] #label("org9573542")
#list(list.item[#emph[Command Query Responsibility Segregation] (#emph[CQRS]) се користи у ситуацији када
имамо обрасце #link(label("orgff947c1"))[#emph[Database per service]] и #link(label("orgf4852f7"))[#emph[Event sourcing]] имплементиране и желимо
да подржимо упите који удружују податке из више микросервиса.])#list(list.item[Базиран на идеји поделе захтева на оне који мењају стање и оне који само
читају тј. немају бочне ефекте. Еквивалентно са #emph[REST] методама за читање (#raw("GET,
  HEAD")) и измену стања (#raw("POST, PUT, PATCH...")).])#list(list.item[Креирање базе која је само за читање и која се континуално ажурира обрадом
догађаја који се емитују при промени података.])
#heading(level: 4, outlined: false, numbering: none)[Структура \u{2d} посебне базе] #label("orgf2c308e")
#list(list.item[Захтев за изменом производа #raw("(1)") уписује текуће стање у локалну базу #raw("(2)") и
објављује догађај #raw("(3)").])#list(list.item[Сервис за упите, на основу догађаја, ажурира #raw("(4)") свој интерни модел
оптимизован за упите који чува у локалној бази.])
#figure([#image(sys.inputs.file-57)]) #label("org890d573")
#heading(level: 4, outlined: false, numbering: none)[Структура \u{2d} јединствена база] #label("org97fd6c1")
#list(list.item[Захтев за изменом производа #raw("(1)") уписује тренутно стање у локалну базу #raw("(2)") и
ажурира модел за упите #raw("(3)") и затим објављује догађај #raw("(4)").])#list(list.item[Сервис за упите чита ажуран модел за упите #raw("(5)").])
#figure([#image(sys.inputs.file-58)]) #label("orgff89b39")
#heading(level: 4, outlined: false, numbering: none)[Предности] #label("org92edc8b")
#list(list.item[Неминован код употребе обрасца #link(label("orgf4852f7"))[#emph[Event sourcing]].])#list(list.item[Боља подела надлежности.])#list(list.item[Једноставнији упитни модел. Боље перформансе упита. Подаци су најчешће
денормализовани у циљу постизања оптималних перформанси.])
#heading(level: 4, outlined: false, numbering: none)[Мане] #label("org9251702")
#list(list.item[Увећана сложеност.])#list(list.item[Кашњење у репликацији. Коначна конзистентност (#emph[Eventual Consistency]).])#list(list.item[Дуплирање података. Постоји могућност неконзистенције.])
#heading(level: 2)[Комуникација] #label("orgfd2760b")
#heading(level: 3)[#emph[Messaging]] #label("orga57ec7d")
#list(list.item[Слање порука је у основи архитектуре вођене догађајима.])#list(list.item[Асинхрона комуникација, слабо спрезање микросервиса.])#list(list.item[Посредник (#emph[message broker]), који мора бити високо доступан, омогућава
баферовање и перзистенцију порука.])
#heading(level: 4, outlined: false, numbering: none)[#emph[Send\u{2f}Receive] образац] #label("org4c12080")
#list(list.item[Обично представља комуникацију између два учесника (#emph[point\u{2d}to\u{2d}point]) са
специфичном наменом, најчешће извршење акције над циљним сервисом.])#list(list.item[Овај облик је коришћен типично од стране команди.])#list(list.item[Мора се обезбедити да само циљни сервис реагује на поруку.])

#figure([#image(sys.inputs.file-59)]) #label("org92a7812")
#heading(level: 4, outlined: false, numbering: none)[#emph[Publish\u{2f}Subscribe] образац] #label("org31797e5")
#list(list.item[Комуникација "један на више".])#list(list.item[Сервиси заинтересовани за одређене поруке се региструју (#emph[subscribe]).])#list(list.item[Сервиси примају поруке и обрађују их у паралели различитом брзином.])#list(list.item[Основа хоризонталног скалирања.])
#figure([#image(sys.inputs.file-60)]) #label("orge3eb405")
#heading(level: 4, outlined: false, numbering: none)[#emph[Request\u{2f}Response] образац] #label("org3051a1e")
#list(list.item[Имплементира се када је потребна повратна информација, обично при
имплементацији #link(label("orga57ec7d"))[#emph[Send\u{2f}Receive] образца].])#list(list.item[Порука\u{2f}команда и одговор на команду могу бити корелирани одређеним
идентификатором.])
#figure([#image(sys.inputs.file-61)]) #label("org9483b14")
#heading(level: 3)[#emph[Remote Procedure Invocation (RPI)]] #label("org382c262")
#list(list.item[Сервиси често морају тесније сарађивати да би обрадили одређени захтев.])#list(list.item[Понекад је синхрони начин комуникације бољи. Тада користимо #emph[RPI].])
#heading(level: 4, outlined: false, numbering: none)[Предности] #label("orgb583d4f")
#list(list.item[Једноставан вид комуникације. Синхрона варијанта #link(label("orga57ec7d"))[#emph[Request\u{2f}Response] образца].])
#heading(level: 4, outlined: false, numbering: none)[Мане] #label("org88ae2f1")
#list(list.item[Јако темпорално спрезање сервиса. Морају бити доступни истовремено.])
#heading(level: 4, outlined: false, numbering: none)[Приступи] #label("orga43e5af")
#list(list.item[#link("https://en.wikipedia.org/wiki/Representational_state_transfer")[REST] #footnote(link("https://en.wikipedia.org/wiki/Representational_state_transfer"))
#list(list.item[Добро познат приступ. Основа комуникације на вебу.])#list(list.item[Најчешће се користи у комбинацији са текстуалним порукама, нпр. JSON.])])#list(list.item[#link("https://grpc.io/")[gRPC] #footnote(link("https://grpc.io/"))
#list(list.item[Развијен у Гуглу.])#list(list.item[Акценат на перформансама.])#list(list.item[Бинарне поруке базиране на технологији #link("https://developers.google.com/protocol-buffers/")[Protocol Buffers] #footnote(link("https://developers.google.com/protocol-buffers/")).])])#list(list.item[#link("https://thrift.apache.org/")[Apache Thrift] #footnote(link("https://thrift.apache.org/"))
#list(list.item[Развијен у Фејсбуку.])#list(list.item[Различити формати порука и транспортни протоколи.])])
#heading(level: 3)[#emph[API Gateway]] #label("org7f94786")
#list(list.item[Инстанца класичног ОО обрасца #emph[Facade]. Скривање интерне сложености.])#list(list.item[Посредник за спољне клијенте.])#list(list.item[Специјализација #link(label("org748d2df"))[обрасца API композицијe] за екстерне клијенте. Интеграција
података са више микросервиса.])#list(list.item[Може имплементирати додатне функционалности, нпр. ауторизацију.])
#heading(level: 4, outlined: false, numbering: none)[Структура] #label("orgd2c5735")
#figure([#image(sys.inputs.file-62)]) #label("orgad276c6")
#heading(level: 4, outlined: false, numbering: none)[Варијанта \u{2d} #emph[Backends for Frontends]] #label("orgf37811e")
#list(list.item[По један гејтвеј за сваки фронтенд.])#list(list.item[Специјализација API\u{2d}ja.])

#figure([#image(sys.inputs.file-63)]) #label("org8dc4b70")
#heading(level: 4, outlined: false, numbering: none)[Напомена] #label("orgbbb69b0")
#list(list.item[Једна тачка отказа. Обезбедити високу доступност.])
#heading(level: 2)[Откривање сервиса] #label("org572ab99")
#heading(level: 3)[#emph[Service Registry]] #label("org86001ef")
#list(list.item[За разлику од класичних дистрибуираних система код микросервисних архитектура
сервиси нису увек на истој мрежној адреси.])#list(list.item[Како клијент сазнаје где се сервис налази?])#list(list.item[Специјални сервис који је увек на истој локацији и који има информације о
локацијама свих других сервиса.])#list(list.item[Два приступа:
#list(list.item[#emph[клијентски] \u{2d} код којег клијент сервис сам пита регистар,])#list(list.item[#emph[серверски] \u{2d} код којег имамо посредника (#emph[рутер]) који поставља питање регистру.])])
#heading(level: 4, outlined: false, numbering: none)[Структура \u{2d} клијентски] #label("org3c81c5c")
#figure([#image(sys.inputs.file-64)]) #label("org450735f")
#heading(level: 4, outlined: false, numbering: none)[Структура \u{2d} серверски] #label("org1b2693a")
#figure([#image(sys.inputs.file-65)]) #label("org91909d4")
#heading(level: 2)[Литература] #label("orga06517e")
#list(list.item[Hugo Filipe Oliveira Rocha, Practical Event\u{2d}Driven Microservices Architecture,
Apress, 2022.])#list(list.item[Microsoft, #link("https://docs.microsoft.com/en-us/azure/architecture/patterns/")[Cloud Design Patterns] #footnote(link("https://docs.microsoft.com/en-us/azure/architecture/patterns/"))])#list(list.item[Chris Richardson, #link("https://microservices.io/")[Microservice Architecture] #footnote(link("https://microservices.io/"))])#list(list.item[Wikipedia, #link("https://en.wikipedia.org/wiki/Microservices")[Microservices] #footnote(link("https://en.wikipedia.org/wiki/Microservices"))])
#heading(level: 1)[Развој базиран на компонентама] #label("orgc6c1b9b")
#heading(level: 2)[Razvoj softvera] #label("orgad5a124")
#figure([#quote(block: true)[In a world of rapidly changing business requirements, custom\u{2d}made
software is often too late \u{2d}\u{2d} too late to be productive before
becoming obsolete.
]]) #label("org8dab57a")

#list(list.item[C. Szyperski, #emph[Component Software: Beyond Object\u{2d}Oriented Programming], Addison\u{2d}Wesley Longman Publishing Co., Inc., 2002])
#heading(level: 2)[Modularizacija] #label("org9045dff")
#list(list.item[Savladavanje kompleksnosti softvera podelom na manje celine \u{2d}\u{2d} #emph[Divide
and Conquer] princip.])#list(list.item[Moduli treba da imaju #text(weight: "bold", [visoku koheziju]) i #text(weight: "bold", [slabu spregu]) sa drugim
modulima.])
#heading(level: 2)[Softverske komponente] #label("orgca3447a")
#list(list.item[Softverske komponente su izvršive jedinice koje se nezavisno
proizvode, dobavljaju i instaliraju i koje se mogu komponovati u cilju
formiranja funkcionalnog sistema.])#list(list.item[U cilju obezbeđivanja kompozicije, komponente moraju da poštuju
određeni #emph[komponentni model] i da budu kreirane za #emph[određenu ciljnu
platformu].])#list(list.item[Sistem sastavljen od softverskih komponenti se naziva komponentni
softver (#emph[component software]).])
#heading(level: 2)[Razvoj baziran na komponentama] #label("org5abd489")
#list(list.item[Razvoj baziran na komponentama (#emph[Component\u{2d}Based Development \u{2d} CBD]) \u{2d}\u{2d} izrada
softvera upotrebom softverskih komponenti.])#list(list.item[Komponentizacija nije nova ideja \u{2d}\u{2d} uspešno se primenjuje u različitim
oblastima...])#list(list.item[...ali do nedavno nije bilo velikog uspeha u oblasti razvoja softvera.])
#heading(level: 2)[Šta je problem sa softverom?] #label("org5673c1a")
Često se tvrdi da je softver previše fleksibilan da bi bilo moguće kreirati
komponente \u{2d}\u{2d} ovo ne može biti razlog već više znak nezrelosti oblasti.
#heading(level: 2)[Integracija kao preduslov ponovne iskoristljivosti komponenti] #label("org7f52a29")
#figure([#quote(block: true)[A key issue is that today's software environments focus on
writing new software, instead of integrating existing software into
new systems. In reality, integrating existing code has become a large
part of the work of software developers. Therefore, there is a need
for tools that standardize the integration aspects of software so that
reusing existing components becomes reliable, robust and cheap.
]]) #label("org1e1dad3")

#link("http://www.osgi.org/About/Technology")
#heading(level: 2)[Preduslovi uspešne komponentizacije] #label("orgbbb4915")
#list(list.item[Postojanje standarda koji su praktični i ostvarljivi:
#list(list.item[OSGi])#list(list.item[EJB])#list(list.item[DCOM i ActiveX])#list(list.item[CORBA])])#list(list.item[Postojanje tržišta komponenti:
#list(list.item[Eclipse Marketplace])#list(list.item[Firefox\u{2f}Chrome priključci])#list(list.item[Google Play, Apple App Store i dr.])])#list(list.item[Isplativost razvoja: smatra se da komponenta mora bar 3 puta da se iskoristi
da bi se njen razvoj isplatio.])
#heading(level: 2)[Vrste softvera prema načinu dobavljanja] #label("org650fbf1")
#list(list.item[Namenski izrađen softver (#emph[Custom made])])#list(list.item[Standardni softver])
#heading(level: 2)[Namenski izrađen softver] #label("org5d80f6e")
#list(list.item[Može biti u potpunosti prilagođen korisniku.])#list(list.item[Može koristiti vlasnička znanja i iskustvo firme za koju se proizvodi.])#list(list.item[Ovim se može postići značajna prednost na tržištu.])#list(list.item[Razvoj i održavanje može biti skupo. Interoperabilnost sa drugim sistemima
može biti problematično.])
#heading(level: 2)[Standardni softver] #label("org0315d81")
#list(list.item[Kupuje se gotov i parametrizuje se da bude #emph[dovoljno dobar] za posao za koji se
koristi.])#list(list.item[Kratko vreme izgradnje \u{2d}\u{2d} svodi se na konfiguraciju i prilagođavanje.])#list(list.item[Unapređenje, održavanje i implementacija interoperabilnosti sa drugim
sistemima se prebacuje na proizvođača standardnog softvera.])#list(list.item[Teško može biti osnova sticanja prednosti na tržištu jer i konkurencija može
kupiti isti softver.])
#heading(level: 2)[Problem sa standardnim softverom] #label("org6e87118")
#list(list.item[Često zahteva drastičnu promenu poslovnih procesa i načina rada u cilju
prilagođavanja \u{2d}\u{2d} primer: uvođenje SAP R\u{2f}3 u Australijsku poštu.])#list(list.item[Izmenu procesa bi trebalo raditi u skladu sa izmenom poslovnog okruženja a ne
u cilju prilagođavanja predviđenom načinu rada softvera.])
#heading(level: 2)[Komponentni softver \u{2d}\u{2d} hibridni pristup] #label("orgfc02920")
#list(list.item[Namenski izraditi komponente u domenu ekspertize.])#list(list.item[Kupiti standardne komponente za ostale domene.])#list(list.item[Primer: kupovina GUI komponenti, komponenti za rad sa XML datotekama, bazama i
sl.])#list(list.item[Dobijamo prednost na tržištu jer u svom domenu radimo posao na način na koji
želimo ali istovremeno ubrzavamo razvoj upotrebom standardnih, robusnih
komponenti u domenima koji nisu od presudnog značaja za naš poslovni domen.])
#heading(level: 2)[Evolutivni razvoj] #label("org3798787")
#list(list.item[Za razliku od monolitnih rešenja gde imamo periodičnu zamenu sistema novim
(revolutivni pristup) kod komponentnog razvoja unapređenje sistema možemo
raditi evolutivno kroz nezavisno unapređenje komponenti.])#list(list.item[Imamo niz češćih manjih promena umesto ređih velikih promena koje menjaju
sistem iz korena.])
#heading(level: 2)[Univerzalne komponente?] #label("orgca5d0eb")
#list(list.item[... ne postoje.])#list(list.item[Komponente se prave za određenu ciljnu platformu i moraju poštovati određeni
komponentni model.])#list(list.item[Takođe, moramo unapred imati svest o korisnicima komponente koju razvijamo
odnosno njihovim očekivanjima.])
#heading(level: 2)[Apstraktna arhitektura softvera baziranog na komponentama] #label("orgc4e8be8")
#figure([#image(sys.inputs.file-66)]) #label("orga01f2b5")
#heading(level: 2)[Platforma] #label("org7b8c5c1")
#list(list.item[Obezbeđuje infrastrukturu u koju se #emph[ugrađuju] komponente.])#list(list.item[Pruža skup bazičnih servisa koje komponente mogu da koriste.])
#heading(level: 2)[Servisi] #label("org166f225")
#list(list.item[Predstavlja skup funkcionalnosti koje određena komponenta pruža drugim
komponentama i čije korišćenje je definisano ugovorom, koji propisuje način
upotrebe (npr. interfejsi i protokoli), i ograničeno politikom upotrebe
servisa.])#list(list.item[Platforma mora imati propisane mehanizme za objavljivanje i pronalaženje
servisa.])
#heading(level: 2)[Konzumenti i pružaoci servisa] #label("org3d29479")
#list(list.item[U komponentnom softveru svaka komponenta može biti u ulozi pružaoca i\u{2f}ili
konzumenta servisa.])#list(list.item[Različite tehnike pronalaženja i povezivanja servisa.])
#heading(level: 2)[Literatura] #label("org8a4b4c2")
#list(list.item[C. Szyperski, #emph[Component Software: Beyond Object\u{2d}Oriented Programming],
Addison\u{2d}Wesley Longman Publishing Co., Inc., 2002])
#heading(level: 1)[Креирање компоненти у Пајтону] #label("org3386908")
#heading(level: 2, outlined: false, numbering: none)[Sadržaj] #label("org3c693b6")
#heading(level: 2)[Мотивација] #label("org30e6452")
#list(list.item[Пакет жели да омогући команду која се може позвати са терминала.])#list(list.item[Пакет жели да омогући покретање GUI апликације.])#list(list.item[Пакет жели да омогући прилагођавање своје функционалности употребом прикључака (#emph[plugins]).])
#heading(level: 2)[Конзолне скрипте] #label("orgf055e89")
#heading(level: 3)[Организација пројекта] #label("org67e5019")
#figure([#raw(block: true, lang: "text", "project_root_directory
├── pyproject.toml        # and/or setup.cfg, setup.py
└── src
    └── timmins
        ├── __init__.py
        └── ...")]) #label("org849fcda")

У #raw("__init__.py"):

#figure([#raw(block: true, lang: "python", "def hello_world():
    print(\u{22}Hello world\u{22})")]) #label("orgab32602")
#heading(level: 3)[Покретање као модул] #label("org3ca0270")
У #raw(block: false, "src/timmins/__main__.py"):
#figure([#raw(block: true, lang: "python", "from . import hello_world

if __name__ == '__main__':
    hello_world()")]) #label("org6c88d35")

Сада је могуће покренути функцију са терминала на следећи начин:

#figure([#raw(block: true, lang: "sh", "$ python -m timmins
Hello world")]) #label("org8eaf539")
#heading(level: 3)[Преко екстензионе тачке] #label("org94d6004")
У #raw(block: false, "pyproject.toml"):
#figure([#raw(block: true, lang: "toml", "[project.scripts]
hello-world = \u{22}timmins:hello_world\u{22}")]) #label("org0e24ce0")

Сада можемо скрипту директно позвати:
#figure([#raw(block: true, lang: "sh", "$ hello-world
Hello world")]) #label("org648f56e")
#heading(level: 3)[Исто тако можемо регистровати и GUI скрипту] #label("org050e9a1")
#figure([#raw(block: true, lang: "toml", "[project.gui-scripts]
hello-world = \u{22}timmins:hello_world\u{22}")]) #label("orgc000cbd")
#heading(level: 3)[Генеричко решење] #label("org4b2b868")
#list(list.item[Регистрација конзолних и GUI скрипти представља специјалну употребу општег
механизма за проширење који називамо #emph[Прикључне тачке].])
#heading(level: 2)[Прикључне тачке (#emph[Entry Points])] #label("org5dfacb2")
#list(list.item[Општи начин проширења функционалности пакета.])#list(list.item[Тип метаподатка који пакети могу да региструју.])#list(list.item[Други пакети могу динамички да открију и исчитају ове метаподатке.])
#heading(level: 3)[Организација пројекта] #label("orged8820c")
Крећемо од исте организације пројекта.
#figure([#raw(block: true, lang: "text", "project_root_directory
├── pyproject.toml        # and/or setup.cfg, setup.py
└── src
    └── timmins
        ├── __init__.py
        └── ...")]) #label("org1aa574d")

У #raw("__init__.py"):

#figure([#raw(block: true, lang: "python", "def hello_world():
    print(\u{22}Hello world\u{22})")]) #label("org3f17e1b")
#heading(level: 3)[Поставка проблема] #label("orgf3e8425")
#list(list.item[Желимо да омогућимо прилагођен приказ основног стринга.])#list(list.item[Прилагођавање могу да ураде други пакети.

На пример испис може бити промењен на следећи начин:
#figure([#raw(block: true, lang: "text", "!!! Hello world !!!")]) #label("org91e8f12")])
#heading(level: 3)[Први корак] #label("orga9f4e26")
Раздвајање приказа на две функције:

#figure([#raw(block: true, lang: "python", "def display(text):
    print(text)

def hello_world():
    display('Hello world')")]) #label("org3a24b11")
#heading(level: 3)[Откривање прикључака и модификоване #raw("display") функције] #label("org37415f3")
#figure([#raw(block: true, lang: "python", "from importlib.metadata import entry_points
display_eps = entry_points(group='timmins.display')")]) #label("org1d7708d")

Прикључне тачке имају назив, групу и вредност (атрибути #raw("name"), #raw("group"), #raw("value")):
#figure([#raw(block: true, lang: "python", "(
    EntryPoint(name='excl', value='timmins_plugin_fancy:excl_display', group='timmins.display'),
    ...,
)")]) #label("org1b27005")
#heading(level: 3)[Учитавање објекта регистрованог у прикључној тачки] #label("org1c362db")
#figure([#raw(block: true, lang: "python", "display = display_eps[0].load()")]) #label("org6cf00e4")

Потребно је дефинисати понашање у случају да не постоји пакет који региструје
функцију у прикљуној тачки:

#figure([#raw(block: true, lang: "python", "from importlib.metadata import entry_points
display_eps = entry_points(group='timmins.display')
try:
    display = display_eps[0].load()
except IndexError:
    def display(text):
        print(text)

def hello_world():
    display('Hello world')")]) #label("org87d3c31")
#heading(level: 3)[Регистрација прилагођене #raw("display") функције] #label("orgafbb5cb")
#figure([#raw(block: true, lang: "text", "timmins-plugin-fancy
├── pyproject.toml        # and/or setup.cfg, setup.py
└── src
    └── timmins_plugin_fancy
        └── __init__.py")]) #label("org0a6b5ca")

У #raw("src/timmins_plugin_fancy/__init__.py"):
#figure([#raw(block: true, lang: "python", "def excl_display(text):
    print('!!!', text, '!!!')")]) #label("org3b6deb7")

#raw("pyproject.toml")
#figure([#raw(block: true, lang: "toml", "# Note the quotes around timmins.display in order to escape the dot .
[project.entry-points.\u{22}timmins.display\u{22}]
excl = \u{22}timmins_plugin_fancy:excl_display\u{22}")]) #label("org4cd4586")

Сада можемо видети дејство прикључка уколико је пакет инсталиран:

#figure([#raw(block: true, lang: "python", ">>> from timmins import hello_world

>>> hello_world()
!!! Hello world !!!")]) #label("org164d287")

У случају да пакет #raw("timmins_plugin_fancy") није инсталиран понашање је
подразумевано:

#figure([#raw(block: true, lang: "python", ">>> from timmins import hello_world

>>> hello_world()
Hello world")]) #label("org3f354f5")
#heading(level: 3)[Регистрација више прикључака под истом групом] #label("org6a4f0e1")
#list(list.item[Желимо да имамо више различитих начина исписа:])
#figure([#raw(block: true, lang: "python", "def excl_display(text):
    print('!!!', text, '!!!')

def lined_display(text):
    print(''.join(['-' for _ in text]))
    print(text)
    print(''.join(['-' for _ in text]))")]) #label("org762f0fa")

#raw("pyproject.toml")

#figure([#raw(block: true, lang: "toml", "[project.entry-points.\u{22}timmins.display\u{22}]
excl = \u{22}timmins_plugin_fancy:excl_display\u{22}
lined = \u{22}timmins_plugin_fancy:lined_display\u{22}")]) #label("orgfc9de1e")

Сада можемо у базном пакету урадити нешто попут овога:

#figure([#raw(block: true, lang: "python", "display_eps = entry_points(group='timmins.display')
try:
    display = display_eps['lined'].load()
except KeyError:
    # if the 'lined' display is not available, use something else
    ...")]) #label("orgb331a18")

Или можемо учитати све прикључке:

#figure([#raw(block: true, lang: "python", "display_eps = entry_points(group='timmins.display')
for ep in display_eps:
    display = ep.load()
    # do something with display
    ...")]) #label("orge5aaee4")
#heading(level: 2)[Литература] #label("orge6adb49")
#list(list.item[#link("https://setuptools.pypa.io/en/latest/userguide/entry_point.html")[Setuptools Entry Points] #footnote(link("https://setuptools.pypa.io/en/latest/userguide/entry_point.html"))])#list(list.item[#link("https://packaging.python.org/en/latest/guides/creating-and-discovering-plugins/")[Creating and discovering plugins] #footnote(link("https://packaging.python.org/en/latest/guides/creating-and-discovering-plugins/"))])
