#let _ = ```typ
exec typst c "$0" --root "$(readlink -f "$0" | xargs dirname)/./" --input file-9=/images/ref-cycle.svg --input file-8=/images/rc-list.svg --input file-7=/images/list-size-box.svg --input file-6=/images/list-size.svg --input file-5=/images/slice.png --input file-4=/images/reference.png --input file-3=/images/string-type-4.png --input file-2=/images/string-type-3.png --input file-1=/images/string-type-2.png --input file-0=/images/string-type.png
⁠```
#set document(title: "Програмски језик Раст", author: "Игор Дејановић")
#set text(lang: "sr")
#set heading(numbering: "1.")
#let naslov = "Програмски језик Rust"
#let podnaslov = "скрипта за предмет Напредне технике програмирања"
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
#heading(level: 1)[Увод] #label("orge079c69")
#list(list.item[Језик опште намене, компајлиран и статички типизиран са инференцом типова])#list(list.item[Системско програмирање али са особинама вишег нивоа апстракције као што су
функционално програмирање])#list(list.item[2010, Graydon Hoare, Mozilla Research])#list(list.item[Перформансе и сигурност])

#list(list.item[Меморијска сигурност без употребе сакупљача смећа (енг. #emph[garbage collector \u{2d}
GC]) \u{2d} у време компајлирања кроз #emph[borrow checked].
#list(list.item[У време компајлирања спречава грешке #emph[use\u{2d}after\u{2d}free], #emph[double\u{2d}free], #emph[data\u{2d}races]])])#list(list.item[Сигурно конкурентно програмирање без #emph[heisenbugs] \u{2d} грешке које се тешко
репродукују.])#list(list.item[Експлицитно искључује недефинисано понашање у сигурном Расту (#emph[safe Rust]).
Програм прихваћен од стране компајлера нема недефинисаног понашања уколико се
не користи #emph[unsafe Rust].])

#list(list.item[Бесплатне апстракције (#emph[Zero\u{2d}cost apstractions]) високог нивоа које се
при превођењу уклањају.])

#figure([#quote(block: true)[What you don’t use, you don’t pay for. And further: What you do use, you couldn’t hand code any better.

\u{2d}\u{2d} Bjarne Stroustrup
]]) #label("org5bc404d")

#list(list.item[Конструкције високог нивоа се уклањају и генерише се ефикасан код:
#figure([#raw(block: true, lang: "rust", "// Функционални стил 
  let sum: u32 = (1..100).filter(|&x| x % 2 == 0).map(|x| x * x).sum();

  // Еквивалентна ручно писана петља
  let mut sum = 0;
  for x in 1..100 {
      if x % 2 == 0 {
          sum += x * x;
      }
  }")]) #label("org5b6e90e")])#list(list.item[Без подразумеване #emph[Heap] алокације \u{2d} све се експлицитно алоцира.])#list(list.item[Мономорфизација генеричких функција:])
#figure([#raw(block: true, lang: "rust", "fn print<T: Display>(t: &T) { ... }

print(&5i32);    // Компајлер генерише: `print_i32(&5i32)`
print(&\u{22}hello\u{22}); // Компајлер генерише: `print_str(&\u{22}hello\u{22})`")]) #label("orgcafbd84")
#list(list.item[Нема виртуалних таблица, позиви су директни.])


#list(list.item[Минимални runtime. Одлична подршка за WebAssembly.])#list(list.item[Модеран екосистем алата: Cargo, Rustfmt, Clippy])#list(list.item[#emph[State\u{2d}of\u{2d}the\u{2d}art] поруке о грешкама од стране компајлера])#list(list.item[Синтаксно сличан C\u{2b}\u{2b}. Утицај и OCaml\u{2d}а, Haskell\u{2d}а и Erlang\u{2d}а.])#list(list.item[Користи се у великим фирмама: Amazon, Facebook, Google, Microsoft...])#list(list.item[Више година за редом на SO упитнику први у категорији #emph["most loved programming
languages"]])
#heading(level: 2)[Мане] #label("orge2fd8c1")
#list(list.item[Тежи за учење \u{2d} нови концепти, стриктна правила.])#list(list.item[Дуже време компајлирања \u{2d} провере преводиоца, мономорфизација.])#list(list.item[За једноставне примене, нпр. скрипте, може бити превише церемонијалан.])#list(list.item[Моделовање комплекснијих структура података (стабла, графови) захтева више
напора јер не скрива комплексност као други језици.])#list(list.item[Још увек релативно млад екосистем, али се ситуација поправља из године у
годину.])
#heading(level: 2)[Недефинисано понашање] #label("org808af4f")
#list(list.item[Недефинисано понашање (#emph[Undefined behaviour \u{2d} UB]) је понашање програма за које
стандард програмског језика не прописује никакве захтеве.])#list(list.item[Када програм изазове недефинисано понашање, језички стандард не каже шта се
даље дешава. Резултат може бити било шта.])#list(list.item[Компајлер, при превођењу и оптимизовању кода, рачуна на то да #emph[UB] не може да се
деси.])#list(list.item[На програмерима је да ово осигурају или резултујући програм нема смисла и може
да уради било шта.])#list(list.item[Ц се ослања на недефинисана понашања. 
#list(list.item[Дереференцирање NULL поинтера, употреба висећих поинтера])#list(list.item[Употреба неиницијализованих варијабли])#list(list.item[Деалокација меморије која није добијена од алокатора])#list(list.item[Прекорачење бафера])#list(list.item[Трка за подацима])#list(list.item[...])])#list(list.item[C99 стандард има 191 недефинисано понашање])

#figure([#raw(block: true, lang: "c", "#include <limits.h>
#include <stdio.h>

int main (void)
{
  printf (\u{22}%d\n\u{22}, (INT_MAX+1) < 0);
  return 0;
}")]) #label("orgc1ebdf2")

Валидна понашања овог програма су:
#figure([#raw(block: true, lang: "sh", "$ cc test.c -o test
$ ./test
1
$ cc test.c -o test
$ ./test
0
$ cc test.c -o test
$ ./test
42
$ cc test.c -o test
$ ./test
Formatting root partition, chomp chomp")]) #label("org38c4ee2")

#list(list.item[John Regehr, #link("https://blog.regehr.org/archives/213")[A Guide to Undefined Behavior in C and C\u{2b}\u{2b}, Part 1] #footnote(link("https://blog.regehr.org/archives/213"))])
#heading(level: 2)[Недефинисано понашање и безбедносни пропусти] #label("org59d130d")
#list(list.item[Програми који имају #emph[UB] су бесмислени и могу да ураде било шта.])#list(list.item[То "било шта" може бити извршавање малициозног кода (#emph[exploit]).])#list(list.item[Зато су #emph[UB] чести извори безбедносних пропуста.])
#heading(level: 2)[Решења у Ц\u{2d}у] #label("org9201a32")
#list(list.item[Статичке и динамичке провере.])#list(list.item[Valgrind, Clang Address Sanitizer (ASan), Clang Undefined Behavior Sanitizer (UBSan)])#list(list.item[Експериментални Ц компајлери (нпр. SoftBound \u{2b} CETS, Fil\u{2d}C).])#list(list.item[Ц је инхерентно несигуран језик због #emph[UB] \u{2d}\u{3e} ови алати ће као резултат имати
лажно позитивне и лажно негативне резултате или користе #emph[runtime] који
онемогућава употребу у #emph[real\u{2d}time] системима.])
#heading(level: 2)[Промењиво стање са више референци (#emph[Mutable, Aliased State])] #label("org53ce98c")
#figure([#quote(block: true)[References are like jumps, leading wildly from one part of a data structure to
another. Their introduction into high\u{2d}level languages has been a step backward
from which we may never recover.

— C.A.R. Hoare, Hints on programming\u{2d}language design 1974
]]) #label("org551cebc")
#heading(level: 2)[Проблем] #label("orgbbb6400")
#figure([#raw(block: true, lang: "python", "def increment_first_element(data):
    data[0] += 1

data = [0, 1, 2]
alias1 = data      # Први алиас
alias2 = data      # Други алиас

print(f\u{22}Пре: {alias2}\u{22})
increment_first_element(alias1)
print(f\u{22}После: {alias2}\u{22})   # бочни ефекат: промењен alias2")]) #label("org9c16228")

#raw(block: false, "Пре: [0, 1, 2]
После: [1, 1, 2]")


#list(list.item[У Расту овакви бочни ефекти нису могући.])

#figure([#raw(block: true, lang: "rust", "fn increment_first_element(data: &mut Vec<i32>) {
    if let Some(first) = data.get_mut(0) {
        *first += 1;
    }
}

fn main() {
    let mut data = vec![0, 1, 2];

    // Ово не може
    // let alias = &mut data;
    // Може само да постоји једна промењива референца
    increment_first_element(&mut data);

    println!(\u{22}После: {:?}\u{22}, data);
    // println!(\u{22}Преко алиаса: \u{22}, alias);
}")]) #label("orgd84dd0f")

#raw(block: false, "После: [1, 1, 2]")
#heading(level: 2)[Промењиво дељено стање код конкурентног програмирања] #label("orgd0f5246")
#figure([#raw(block: true, lang: "c", "#include <stdio.h>
#include <pthread.h>

int shared_data = 0;

void* write_shared_data(void* arg) {
    for (int i = 0; i < 1000000; ++i) {
        shared_data = shared_data + 1;  // Истовремено читање и писање
    }
    return NULL;
}

int main() {
    pthread_t t1, t2;
    
    pthread_create(&t1, NULL, write_shared_data, NULL);
    pthread_create(&t2, NULL, write_shared_data, NULL);
    
    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    printf(\u{22}Shared data: %d\n\u{22}, shared_data);
    return 0;
}")]) #label("org0ca6e45")

#list(list.item[Еквивалентан програм у Расту није валидан тј. компајлер га не прихвата.])

#figure([#raw(block: true, lang: "rust", "use std::sync::Arc;
use std::thread;

fn main() {
    let mut shared_data = Box::new(0);
    let mut handles = vec![];

    for _ in 0..2 {
        let handle = thread::spawn(move || {
            for _ in 0..1000000 {
                // Incorrect: Trying to mutate `shared_data`
                *shared_data += 1;
            }
        });
        handles.push(handle);
    }

    for handle in handles {
        handle.join().unwrap();
    }

    println!(\u{22}Shared data: {}\u{22}, *shared_data);
}")]) #label("org1cf0a2e")

#list(list.item[Језик и компајлер нас приморавају да напишемо исправан програм.])

#figure([#raw(block: true, lang: "rust", "use std::sync::{Arc, Mutex};
use std::thread;

fn main() {
    let shared_data = Arc::new(Mutex::new(0));
    let mut handles = vec![];

    for _ in 0..2 {
        let shared_data = Arc::clone(&shared_data);
        let handle = thread::spawn(move || {
            for _ in 0..1000000 {
                let mut data = shared_data.lock().unwrap();
                *data += 1;  // Controlled access with Mutex
            }
        });
        handles.push(handle);
    }

    for handle in handles {
        handle.join().unwrap();
    }

    println!(\u{22}Shared data: {}\u{22}, *shared_data.lock().unwrap());
}")]) #label("org7119478")

#raw(block: false, "Shared data: 2000000")
#heading(level: 2)[Решења] #label("orgad69306")
#list(list.item[Функционални језици избегавају проблеме услед промењивог стања са више
референци тако што забрањују промењивост. Све је непромењиво (енг. #emph[immutable])
и може се слободно делити.])#list(list.item[Раст допушта #text(weight: "bold", [или]) променивост кроз јединствену референцу #text(weight: "bold", [или]) дељене непромењиве
референце али не и једно и друго истовремено.])#list(list.item[Ово елиминише читаве класе грешака.])
#heading(level: 1)[Инсталација и подешавање] #label("orgabe45dc")
#heading(level: 2)[Инсталација] #label("orged32ece")
#list(list.item[Раст стиже са алатом за управљање ланцем алата (енг. #emph[toolchain]) \u{2d}\u{2d} #raw("rustup")])

#figure([#raw(block: true, lang: "sh", "$ curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh")]) #label("org83d3654")

#list(list.item[Провера инсталације:])

#figure([#raw(block: true, lang: "sh", "~> rustc --version
rustc 1.65.0 (897e37553 2022-11-02)")]) #label("orgc24a85a")
#heading(level: 2)[Преглед инсталације] #label("org120dd48")
#figure([#raw(block: true, lang: "sh", "~> rustup show
Default host: x86_64-unknown-linux-gnu
rustup home:  /home/igor/.rustup

installed toolchains
--------------------

stable-x86_64-unknown-linux-gnu (default)
nightly-x86_64-unknown-linux-gnu

active toolchain
----------------

stable-x86_64-unknown-linux-gnu (default)
rustc 1.58.1 (db9d1b20b 2022-01-20)")]) #label("org63421c0")
#heading(level: 2)[Ажурирање] #label("orgd17a7e4")
За ажурирање инсталације на најновију верзију:

#figure([#raw(block: true, lang: "sh", "rustup update")]) #label("org83fe744")
#heading(level: 2)[Документација] #label("orge4a5b83")
Раст стиже са веома добром документацијом и књигама које су доступне директно из
инсталације:

#figure([#raw(block: true, lang: "sh", "rustup doc")]) #label("org29ce62e")
#heading(level: 1)[Почетак] #label("orgb33ff6a")
#heading(level: 2)[Hello, World!] #label("orgc6a638f")
#figure([#raw(block: true, lang: "sh", "$ mkdir hello_world
$ cd hello_world")]) #label("orgfbe2e38")

File #raw("main.rs"):
#figure([#raw(block: true, lang: "rust", "fn main() {
    println!(\u{22}Hello, world!\u{22});
}")]) #label("orgc59247e")
#heading(level: 2)[Компајлирање и покретање] #label("org8cff326")
#figure([#raw(block: true, lang: "sh", "$ rustc main.rs
$ ./main
Hello, world!")]) #label("org15e3c8c")
#heading(level: 2)[Hello, Cargo!] #label("org03237b7")
#list(list.item[Алат за разрешавање зависности и управљање пројектом.])

#figure([#raw(block: true, lang: "sh", "~> cargo --version
cargo 1.65.0 (4bc8f24d3 2022-10-20)")]) #label("orgb01f30c")

#list(list.item[Креирање пројекта са #raw("cargo") алатом:])

#figure([#raw(block: true, lang: "sh", "$ cargo new hello_cargo
$ cd hello_cargo")]) #label("orgbd338cc")
#heading(level: 2)[Садржај креираног пројекта] #label("org1b6ba9e")
Фајл #raw("cargo.toml") чува конфигурацију пројекта. Формат је #link("https://toml.io/en/")[TOML] #footnote(link("https://toml.io/en/")) (#emph[Tom’s Obvious,
Minimal Language]):

#figure([#raw(block: true, lang: "toml", "[package]
name = \u{22}hello_cargo\u{22}
version = \u{22}0.1.0\u{22}
edition = \u{22}2021\u{22}

[dependencies]")]) #label("org055b0b7")

Fajl #raw("src/main.rs"):
#figure([#raw(block: true, lang: "rust", "fn main() {
    println!(\u{22}Hello, world!\u{22});
}")]) #label("orgbf33fc3")
#heading(level: 2)[Покретање] #label("org684e158")
#figure([#raw(block: true, lang: "rust", "$ cargo build
   Compiling hello_cargo v0.1.0 (file:///projects/hello_cargo)
    Finished dev [unoptimized + debuginfo] target(s) in 2.85 secs")]) #label("orgd7913ac")

Извршни фајл се може наћи на локацији #raw("target/debug/hello_cargo"):

#figure([#raw(block: true, lang: "sh", "$ ./target/debug/hello_cargo
Hello, world!")]) #label("org259ac50")

Али #raw("cargo") омогућава и једноставнији начин покретања:
#figure([#raw(block: true, lang: "sh", "$ cargo run
    Finished dev [unoptimized + debuginfo] target(s) in 0.0 secs
     Running `target/debug/hello_cargo`
Hello, world!")]) #label("org42917a3")
#heading(level: 2)[Провера] #label("org1dc90c4")
Такође је могуће брзо проверити да ли се код компајлира:

#figure([#raw(block: true, lang: "sh", "$ cargo check
   Checking hello_cargo v0.1.0 (file:///projects/hello_cargo)
    Finished dev [unoptimized + debuginfo] target(s) in 0.32 secs")]) #label("org3bae70b")
#heading(level: 2)[Изградња финалне верзије] #label("orgfc13dbf")
#list(list.item[У току развоја користимо изградњу за дебаговање која се брже заврши али
генерисани извршни код није оптималан.])#list(list.item[За финалну верзију је потребно изградњу обавити на следећи начин:

#figure([#raw(block: true, lang: "rust", "cargo build --release")]) #label("orgff06b11")])#list(list.item[Ово ће обавити додатне оптимизације које ће дуже трајати али ће крајњи код
бити оптимизован.])
#heading(level: 2)[#raw("cargo") као конвенција] #label("org1faea62")
Практично сви Раст пројекти користе #raw("cargo") тако да је унификован начин изградње
пројеката. Углавном се своди на:

#figure([#raw(block: true, lang: "sh", "$ git clone example.org/someproject
$ cd someproject
$ cargo build")]) #label("org04ea1b0")
#heading(level: 1)[Игра погађања бројева] #label("org441d35d")
#heading(level: 2)[Подешавање пројекта] #label("org256210f")
#figure([#raw(block: true, lang: "rust", "$ cargo new guessing_game
$ cd guessing_game")]) #label("orgaa0bc80")

Фајл #raw("Cargo.toml"):
#figure([#raw(block: true, lang: "toml", "[package]
name = \u{22}guessing_game\u{22}
version = \u{22}0.1.0\u{22}
edition = \u{22}2021\u{22}

[dependencies]")]) #label("org89936c9")

Фајл #raw("src/main.rs"):
#figure([#raw(block: true, lang: "rust", "fn main() {
    println!(\u{22}Hello, world!\u{22});
}")]) #label("org1ceae9a")

#figure([#raw(block: true, lang: "sh", "$ cargo run
   Compiling guessing_game v0.1.0 (file:///projects/guessing_game)
    Finished dev [unoptimized + debuginfo] target(s) in 1.50s
     Running `target/debug/guessing_game`
Hello, world!")]) #label("orgb2b78af")
#heading(level: 2)[Преузимање броја са стандардног улаза] #label("orga48c5c0")
#figure([#raw(block: true, lang: "rust", "use std::io;

fn main() {
    println!(\u{22}Guess the number!\u{22});

    println!(\u{22}Please input your guess.\u{22});

    let mut guess = String::new();

    io::stdin()
        .read_line(&mut guess)
        .expect(\u{22}Failed to read line\u{22});

    println!(\u{22}You guessed: {}\u{22}, guess);
}")]) #label("orgef4110e")
#heading(level: 2)[Променљивост (#emph[mutability])] #label("org825a8ae")
#list(list.item[Варијабле су подразумевано непромењиве (#emph[immutable]).])#list(list.item[Уколико желимо варијаблу чија вредност може да се мења користимо кључну реч
#raw("mut").

#figure([#raw(block: true, lang: "rust", "let apples = 5; // immutable
  let mut bananas = 5; // mutable")]) #label("org542d0e0")])#list(list.item[Исто важи и за параметре и аргументе функција:

#figure([#raw(block: true, lang: "rust", "io::stdin()
      .read_line(&mut guess)")]) #label("org754d482")])
#heading(level: 2)[Обрада могућих грешака употребом #raw("Result") типа] #label("org4f042f1")
#raw("read_line") може да заврши неуспешно. Зато враћа #raw("io::Result") тип који представља
тип енумерације (#emph[enum]) и има две могуће вредности: #raw("Ok") и #raw("Err").

#figure([#raw(block: true, lang: "rust", "io::stdin()
    .read_line(&mut guess)
    .expect(\u{22}Failed to read line\u{22});")]) #label("org067fa66")

#raw("expect") je имплементиран тако да ће у случају #raw("Ok") варијанте вратити вредност која
је садржана унутар варијанте док ће у случају #raw("Err") варијанте прекинути извршавање
програма.

#figure([#raw(block: true, lang: "rust", "pub fn expect(self, msg: &str) -> T
    where
        E: fmt::Debug,
    {
        match self {
            Ok(t) => t,
            Err(e) => unwrap_failed(msg, &e),
        }
    }")]) #label("org81915b2")
#heading(level: 2)[Покретање] #label("org3e500ec")
#figure([#raw(block: true, lang: "rust", "$ cargo run
   Compiling guessing_game v0.1.0 (file:///projects/guessing_game)
    Finished dev [unoptimized + debuginfo] target(s) in 6.44s
     Running `target/debug/guessing_game`
Guess the number!
Please input your guess.
6
You guessed: 6")]) #label("org1a0641b")
#heading(level: 2)[Генерисање случајног броја] #label("orgead24a9")
Користимо #raw("rand") пакет (сандук \u{2d} #emph[crate] у терминологији #emph[Cargo]\u{2d}a).

Секција #raw("[dependencies]") у фајлу #raw("Cargo.toml"):
#figure([#raw(block: true, lang: "toml", "[dependencies]
rand = \u{22}0.8.3\u{22}")]) #label("org89386f8")

#figure([#raw(block: true, lang: "sh", "$ cargo build
    Updating crates.io index
  Downloaded rand v0.8.3
  Downloaded libc v0.2.86
  ...
   Compiling rand_chacha v0.3.0
   Compiling rand v0.8.3
   Compiling guessing_game v0.1.0 (file:///projects/guessing_game)
    Finished dev [unoptimized + debuginfo] target(s) in 2.53s")]) #label("org42f383c")

#emph[Cargo] користи #link("https://semver.org/")[Semantic Versioning] #footnote(link("https://semver.org/")). Раст пакети се преузимају са сајта #link("https://crates.io/")[crates.io] #footnote(link("https://crates.io/"))
и кеширају локално.

Бржи начин да додамо нову зависност.

#figure([#raw(block: true, lang: "sh", "$ cargo add rand
    Updating crates.io index
      Adding rand v0.9.2 to dependencies
             Features:
             + alloc
             + os_rng
             ...
    Updating crates.io index
     Locking 16 packages to latest Rust 1.89.0 compatible versions
      Adding cfg-if v1.0.4
      Adding getrandom v0.3.4
      Adding libc v0.2.177
      ...")]) #label("orgeed19fd")
#heading(level: 2)[Поновљивост изградње \u{2d} #emph[Cargo.lock]] #label("orgfba1f8e")
#list(list.item[Свако следеће покретање изградње користи исте верзије.])#list(list.item[Први пут када се покрене #raw("cargo build") креира се фајл #raw("Cargo.lock") са
информацијама о верзијама свих сандука који су инсталирани.])#list(list.item[#raw("Cargo.lock") је потребно чувати у систему контроле верзија (нпр. #raw("git")) да би се
осигурала поновљивост.])
#heading(level: 2)[Ажурирање сандука] #label("org9198993")
#list(list.item[Ажурирање на нове верзије сандука се обавља са:

#figure([#raw(block: true, lang: "sh", "$ cargo update
    Updating crates.io index
    Updating rand v0.8.3 -> v0.8.4")]) #label("org189aaec")])#list(list.item[Поштује се семантичко верзионирање тј. аутоматски се ажурира на следећу
верзију која је мања од наредне главне (#emph[major]) верзије.])#list(list.item[Ако прелазимо на нову главну верзију то морамо урадити изменом верзије у
#raw("Cargo.toml") фајлу.])
#heading(level: 2)[Генерисање случајног броја] #label("orgda9c6ee")
Фајл #raw("src/main.rs"):
#figure([#raw(block: true, lang: "rust", "use std::io;
use rand::Rng;

fn main() {
    println!(\u{22}Guess the number!\u{22});

    let secret_number = rand::thread_rng().gen_range(1..101);

    println!(\u{22}The secret number is: {}\u{22}, secret_number);

    println!(\u{22}Please input your guess.\u{22});

    let mut guess = String::new();

    io::stdin()
        .read_line(&mut guess)
        .expect(\u{22}Failed to read line\u{22});

    println!(\u{22}You guessed: {}\u{22}, guess);
}")]) #label("org4f71c28")

У #raw("gen_range") користимо израз опсега (#emph[range expression]). Интервал је затворен на
доњој граници и отворен на горњој. За интервал затворен и од горе можемо
писати #raw(block: false, "1..=100").
#heading(level: 2)[Документација за локалне сандуке] #label("org1c25be7")
Да би знали које методе и функције су нам доступне можемо користити уграђену
документацију за сандуке пројекта. Документацију добијамо са:

#figure([#raw(block: true, lang: "sh", "cargo doc --open")]) #label("org2ff86c8")
#heading(level: 2)[Покретање програма] #label("orge3741e5")
#figure([#raw(block: true, lang: "sh", "$ cargo run
   Compiling guessing_game v0.1.0 (file:///projects/guessing_game)
    Finished dev [unoptimized + debuginfo] target(s) in 2.53s
     Running `target/debug/guessing_game`
Guess the number!
The secret number is: 7
Please input your guess.
4
You guessed: 4")]) #label("orgc249be4")
#heading(level: 2)[Поређење тајног броја са задатим] #label("org4c73f63")
Фајл #raw("src/main.rs")
#figure([#raw(block: true, lang: "rust", "use rand::Rng;
use std::cmp::Ordering;
use std::io;

fn main() {
    // --snip--

    println!(\u{22}You guessed: {}\u{22}, guess);

    match guess.cmp(&secret_number) {
        Ordering::Less => println!(\u{22}Too small!\u{22}),
        Ordering::Greater => println!(\u{22}Too big!\u{22}),
        Ordering::Equal => println!(\u{22}You win!\u{22}),
    }
}")]) #label("org17eed51")
#list(list.item[Користимо #raw("std::cmp::Ordering") енумерисани тип који има варијанте #raw("Less"), #raw("Greater")
и #raw("Equal")])#list(list.item[#raw("match") израз пореди задату вредност са вредностима задатим у телу и извршава
грану која се подудара. Гране #raw("match") израза се у Раст терминологији зову "руке"
(#emph[arms]).])
#heading(level: 2)[Поправка типова] #label("org3d503be")
Код са претходног слајда није исправан:
#figure([#raw(block: true, lang: "sh", "$ cargo build
   Compiling libc v0.2.86
   ...
   Compiling guessing_game v0.1.0 (file:///projects/guessing_game)
error[E0308]: mismatched types
  --> src/main.rs:22:21
   |
22 |     match guess.cmp(&secret_number) {
   |                     ^^^^^^^^^^^^^^ expected struct `String`, found integer
   |
   = note: expected reference `&String`
              found reference `&{integer}`

error[E0283]: type annotations needed for `{integer}`
   --> src/main.rs:8:44
    |
8   |     let secret_number = rand::thread_rng().gen_range(1..101);
    |         -------------                      ^^^^^^^^^ cannot infer type for type `{integer}`
    |         |
    |         consider giving `secret_number` a type
    |
    = note: multiple `impl`s satisfying `{integer}: SampleUniform` found in the `rand` crate:
            - impl SampleUniform for i128;
            - impl SampleUniform for i16;
            - impl SampleUniform for i32;
            - impl SampleUniform for i64;
            and 8 more
...")]) #label("org645a017")

Основа грешке је неслагање типова. Са улаза прихватамо #raw("String") док нам је тајни
број #raw("integer").
#heading(level: 2)[Конверзија стринга у број] #label("org4c6c893")
Проблем решавамо конверзијом стринга са улаза у бројни тип.

#figure([#raw(block: true, lang: "rust", "// --snip--

    let mut guess = String::new();

    io::stdin()
        .read_line(&mut guess)
        .expect(\u{22}Failed to read line\u{22});

    let guess: u32 = guess.trim().parse().expect(\u{22}Please type a number!\u{22});

    println!(\u{22}You guessed: {}\u{22}, guess);

    match guess.cmp(&secret_number) {
        Ordering::Less => println!(\u{22}Too small!\u{22}),
        Ordering::Greater => println!(\u{22}Too big!\u{22}),
        Ordering::Equal => println!(\u{22}You win!\u{22}),
    }")]) #label("orgfef45ca")

Сада се програм компајлира.

#figure([#raw(block: true, lang: "sh", "$ cargo run
   Compiling guessing_game v0.1.0 (file:///projects/guessing_game)
    Finished dev [unoptimized + debuginfo] target(s) in 0.43s
     Running `target/debug/guessing_game`
Guess the number!
The secret number is: 58
Please input your guess.
  76
You guessed: 76
Too big!")]) #label("org5d693f9")
#heading(level: 2)[Омогућавање вишеструког погађања \u{2d} употреба петље] #label("org43b966e")
Фајл #raw("src/main.rs"):
#figure([#raw(block: true, lang: "rust", "// --snip--

    println!(\u{22}The secret number is: {}\u{22}, secret_number);

    loop {
        println!(\u{22}Please input your guess.\u{22});

        // --snip--

        match guess.cmp(&secret_number) {
            Ordering::Less => println!(\u{22}Too small!\u{22}),
            Ordering::Greater => println!(\u{22}Too big!\u{22}),
            Ordering::Equal => println!(\u{22}You win!\u{22}),
        }
    }
}")]) #label("orgefde437")
#heading(level: 2)[Прекид рада] #label("orgc2d6712")
Проблем је како прекинути програм када корисник погоди број?

#figure([#raw(block: true, lang: "rust", "// --snip--

        match guess.cmp(&secret_number) {
            Ordering::Less => println!(\u{22}Too small!\u{22}),
            Ordering::Greater => println!(\u{22}Too big!\u{22}),
            Ordering::Equal => {
                println!(\u{22}You win!\u{22});
                break;
            }
        }
    }
}")]) #label("orgdfad03d")
#heading(level: 2)[Руковање неисправним улазом] #label("org8e9ac6e")
#figure([#raw(block: true, lang: "rust", "// --snip--

        io::stdin()
            .read_line(&mut guess)
            .expect(\u{22}Failed to read line\u{22});

        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };

        println!(\u{22}You guessed: {}\u{22}, guess);

        // --snip--")]) #label("orga74261a")

Потребно је још обрисати линију која приказује генерисани број.
#heading(level: 2)[Финални код] #label("org1314164")
#figure([#raw(block: true, lang: "rust", "use rand::Rng;
use std::cmp::Ordering;
use std::io;

fn main() {
    println!(\u{22}Guess the number!\u{22});
    let secret_number = rand::thread_rng().gen_range(1..101);

    loop {
        println!(\u{22}Please input your guess.\u{22});
        let mut guess = String::new();
        io::stdin()
            .read_line(&mut guess)
            .expect(\u{22}Failed to read line\u{22});
        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };
        println!(\u{22}You guessed: {}\u{22}, guess);
        match guess.cmp(&secret_number) {
            Ordering::Less => println!(\u{22}Too small!\u{22}),
            Ordering::Greater => println!(\u{22}Too big!\u{22}),
            Ordering::Equal => {
                println!(\u{22}You win!\u{22});
                break;
            }
        }
    }
}")]) #label("org3b37bc2")
#heading(level: 1)[Основни програмски концепти] #label("org897f909")
#heading(level: 2)[Варијабле и променљивост (#emph[mutability])] #label("org598d840")
#heading(level: 3)[Варијабле и променљивост (#emph[mutability])] #label("org7c57d7f")
#list(list.item[Варијабле су подразумевано непромењиве.])#list(list.item[Једном када добију вредност (#emph[binding]) та вредност се не може променити

#figure([#raw(block: true, lang: "rust", "fn main() {
        let x = 5;
        println!(\u{22}The value of x is: {}\u{22}, x);
        x = 6;     // greška
        println!(\u{22}The value of x is: {}\u{22}, x);
    }")]) #label("org5ef7bae")

#figure([#raw(block: true, lang: "sh", "$ cargo run
    Compiling variables v0.1.0 (file:///projects/variables)
    error[E0384]: cannot assign twice to immutable variable `x`
    --> src/main.rs:4:5
    |
    2 |     let x = 5;
    |         -
    |         |
    |         first assignment to `x`
    |         help: consider making this binding mutable: `mut x`
    3 |     println!(\u{22}The value of x is: {}\u{22}, x);
    4 |     x = 6;
    |     ^^^^^ cannot assign twice to immutable variable

    For more information about this error, try `rustc --explain E0384`.
    error: could not compile `variables` due to previous error")]) #label("org632b9e7")])
#heading(level: 3)[#raw("mut") кључна реч] #label("orgfdaf215")
#figure([#raw(block: true, lang: "rust", "fn main() {
    let mut x = 5;
    println!(\u{22}The value of x is: {}\u{22}, x);
    x = 6;
    println!(\u{22}The value of x is: {}\u{22}, x);
}")]) #label("org44c819c")

#raw(block: false, "The value of x is: 5
The value of x is: 6")
#heading(level: 2)[Константе \u{2d} #raw("const")] #label("org46c8966")
#list(list.item[Слично као непромењиве варијабле са следећим разликама:
#list(list.item[Увек су непромењиве])#list(list.item[Могу се иницијализовати само константним изразом (познатим у време
компајлирања)])#list(list.item[Валидне за целокупно време извршавања програма у опсегу важења где су
дефинисане (#emph[scope])])#list(list.item[Мора се експлицитно дефинисати тип])])#list(list.item[Компајлер ће константе "убацити" на месту употребе])#list(list.item[По конвенцији имена константи се пишу великим словима

#figure([#raw(block: true, lang: "rust", "const THREE_HOURS_IN_SECONDS: u32 = 60 * 60 * 3;")]) #label("orgd169941")])
#heading(level: 2)[Типови података] #label("org304ae8d")
#heading(level: 3)[Типови података] #label("org22d2b0d")
#list(list.item[Свака вредност у Расту има тип. Типови морају бити познати у време
компајлирања (#emph[статички типизиран језик]).])#list(list.item[Компајлер ће пробати да одреди типове (#emph[type inference]). Ако није могуће
захтева се да дефинишемо тип експлицитно.

Нпр:
#figure([#raw(block: true, lang: "rust", "let guess: u32 = \u{22}42\u{22}.parse().expect(\u{22}Not a number!\u{22});")]) #label("org1ec9b13")
Овде није могуће одредити тип јер #raw("str::parse") функција може вратити различите
бројне типове (функција је генеричка) а не постоји начин да се тип аутоматски
одреди.

Сигнатура је:
#figure([#raw(block: true, lang: "rust", "pub fn parse<F>(&self) -> Result<F, <F as FromStr>::Err>
    where
        F: FromStr")]) #label("orga96b79e")])
#heading(level: 3)[#emph[Integer] типови] #label("orgfe3881c")
#figure([#table(columns: 3, [Дужина],[Signed],[Unsigned],
[8\u{2d}bit],[i8],[u8],
[16\u{2d}bit],[i16],[u16],
[32\u{2d}bit],[i32],[u32],
[64\u{2d}bit],[i64],[u64],
[128\u{2d}bit],[i128],[u128],
[arch],[isize],[usize],
)]) #label("orgd624265")
#heading(level: 3)[Литерали бројева] #label("org8ac98ce")
#figure([#table(columns: 2, [Литерали],[Примери],
[Decimal],[98\u{5f}222],
[Hex],[0xff],
[Octal],[0o77],
[Binary],[0b1111\u{5f}0000],
[Byte (u8 only)],[b'A'],
)]) #label("org57fc52c")
#heading(level: 3)[#emph[Floating\u{2d}Point] типови] #label("orgb8be8e3")
#figure([#raw(block: true, lang: "rust", "fn main() {
    let x = 2.0; // f64

    let y: f32 = 3.0; // f32
}")]) #label("orgd11a483")

IEEE\u{2d}754 стандард
#heading(level: 3)[Операције над бројевима] #label("org5217795")
#figure([#raw(block: true, lang: "rust", "fn main() {
    // addition
    let sum = 5 + 10;

    // subtraction
    let difference = 95.5 - 4.3;

    // multiplication
    let product = 4 * 30;

    // division
    let quotient = 56.7 / 32.2;
    let floored = 2 / 3; // Results in 0

    // remainder
    let remainder = 43 % 5;
}")]) #label("orga29f88d")
#heading(level: 3)[#emph[Boolean] тип] #label("orgb0744e6")
#figure([#raw(block: true, lang: "rust", "fn main() {
    let t = true;

    let f: bool = false; // with explicit type annotation
}")]) #label("orgcf71dc4")
#heading(level: 3)[Тип карактера] #label("orgca7b17e")
#figure([#raw(block: true, lang: "rust", "fn main() {
    let c = 'z';
    let z = 'ℤ';
    let heart_eyed_cat = '😻';
}")]) #label("org9ccaa01")
#heading(level: 3)[Торке (#emph[tuples])] #label("orgc3ccbf9")
#list(list.item[Хетерогене структуре фиксне дужине.])
#figure([#raw(block: true, lang: "rust", "fn main() {
    let tup: (i32, f64, u8) = (500, 6.4, 1);
}")]) #label("org77ed8d3")

#list(list.item[Распакивање торки (#emph[destructuring]):])
#figure([#raw(block: true, lang: "rust", "fn main() {
    let tup = (500, 6.4, 1);

    let (x, y, z) = tup;

    println!(\u{22}The value of y is: {}\u{22}, y);
}")]) #label("org43c19ca")

#raw(block: false, "The value of y is: 6.4")


Приступ елементима торке:
#figure([#raw(block: true, lang: "rust", "fn main() {
    let mut x: (i32, f64, u8) = (500, 6.4, 1);

    let five_hundred = x.0;

    let six_point_four = x.1;

    let one = x.2;

    // Уколико је торка промењива можемо извршити доделу
    x.2 = 2;
    println!(\u{22}{x:?}\u{22})
}")]) #label("org21347c4")

#raw(block: false, "(500, 6.4, 2)")
#heading(level: 3)[Низовни тип] #label("org86669c8")
#list(list.item[Сваки елемент низовног типа мора имати исти тип])#list(list.item[Димензија низа је непромењива (алоциран је на стеку)
#figure([#raw(block: true, lang: "rust", "fn main() {
        let a = [1, 2, 3, 4, 5];
    }")]) #label("org1316a82")])#list(list.item[Тип се може експлицитно дефинисати на следећи начин (низ дужине #raw("5") типа #raw("i32")):
#figure([#raw(block: true, lang: "rust", "let a: [i32; 5] = [1, 2, 3, 4, 5];")]) #label("org8a490c4")])#list(list.item[Иницијализација свих елемената на исту вредност се обавља на следећи начин:
#figure([#raw(block: true, lang: "rust", "let a = [3; 5];")]) #label("org05f7823")
Где је вредност сваког елемента #raw("3") а дужина низа #raw("5").])

Индексни приступ:

#figure([#raw(block: true, lang: "rust", "fn main() {
    let a = [1, 2, 3, 4, 5];

    let first = a[0];
    let second = a[1];
}")]) #label("org5da0682")

Конверзија низа у хомогену торку:
#figure([#raw(block: true, lang: "rust", "fn main() {
    let a = [1, 2, 3];
    let tup: (u32, u32, u32) = a.into();
    println!(\u{22}{tup:?}\u{22})
}")]) #label("orgfc9bf9b")

#raw(block: false, "(1, 2, 3)")
#heading(level: 2)[Функције] #label("orgc759701")
#heading(level: 3)[Функције] #label("orgdaea95d")
#figure([#raw(block: true, lang: "rust", "fn main() {
    println!(\u{22}Hello, world!\u{22});

    another_function();
}

fn another_function() {
    println!(\u{22}Another function.\u{22});
}")]) #label("org549781a")

#raw(block: false, "Hello, world!
Another function.")


#list(list.item[За именовање функција као и варијабли користи се #emph[snake\u{5f}case].])
#heading(level: 3)[Funkcije \u{2d} parametri] #label("org4f8d8a0")
#figure([#raw(block: true, lang: "rust", "fn main() {
    print_labeled_measurement(5, 'h');
}

fn print_labeled_measurement(value: i32, unit_label: char) {
    println!(\u{22}The measurement is: {}{}\u{22}, value, unit_label);
}")]) #label("org95ecd45")

#raw(block: false, "The measurement is: 5h")
#heading(level: 3)[Искази и изрази] #label("org127fdd0")
#list(list.item[Рaст је језик базиран на изразима (#emph[expression\u{2d}based])])#list(list.item[Искази (#emph[statements]) су језичке конструкције које немају повратну вредност.
Изрази (#emph[expressions]) се евалуирају у одређени резултат, тј. имају вредност.])#list(list.item[Пример: #raw("let") је исказ тј. нема повратну вредност. Ово можете писати:
#figure([#raw(block: true, lang: "rust", "let y = 6;")]) #label("org720b3d8")
Ali ovo ne:
#figure([#raw(block: true, lang: "rust", "let x = (let y = 6);")]) #label("org0bb93fd")])

Блок кода је такође израз. Шта је вредност у коју се евалуира?

#figure([#raw(block: true, lang: "rust", "{
    let x = 3;
    x + 1
}")]) #label("orgd0fd9d5")

Вредност блока је вредност последњег израза, тј. #raw("x+1"). Приметите да ту не
користимо #raw(";") јер терминација овим карактером претвара израз у исказ.

Због овога је сасвим легално да пишемо:

#figure([#raw(block: true, lang: "rust", "fn main() {
    let y = {
        let x = 3;
        x + 1
    };

    println!(\u{22}The value of y is: {}\u{22}, y);
}")]) #label("orgbe33871")

#raw(block: false, "The value of y is: 4")
#heading(level: 3)[Повратне вредности функција] #label("org2db02ff")
Вредност функције је вредност блока који представља тело функције, дакле
последњег израза унутар тела функције.

#figure([#raw(block: true, lang: "rust", "fn five() -> i32 {
    5
}

fn main() {
    let x = five();

    println!(\u{22}The value of x is: {}\u{22}, x);
}")]) #label("orga7ef33c")

#raw(block: false, "The value of x is: 5")


Или на пример:
#figure([#raw(block: true, lang: "rust", "fn main() {
    let x = plus_one(5);

    println!(\u{22}The value of x is: {}\u{22}, x);
}

fn plus_one(x: i32) -> i32 {
    x + 1
}")]) #label("orgc377838")

#raw(block: false, "The value of x is: 6")


Уколико израз #raw("x+1") терминирамо са #raw(";") код се неће компајлирати јер функција
декларише да враћа тип #raw("i32") док сада враћа #raw("()") (тзв. #emph[unit type]) односно нема
повратну вредност јер је последња инструкција исказ.

#figure([#raw(block: true, lang: "rust", "fn main() {
    let x = plus_one(5);

    println!(\u{22}The value of x is: {}\u{22}, x);
}

fn plus_one(x: i32) -> i32 {
    x + 1;
}")]) #label("orga487624")
#heading(level: 2)[Коментари] #label("org372db5d")
Коментари се пишу после #raw("//") или у форми блок коментара #raw("/*.... */") као и у C\u{2b}\u{2b}\u{2d}у.
Ово би били валидни коментари:
#figure([#raw(block: true, lang: "rust", "// So we’re doing something complicated here, long enough that we need
// multiple lines of comments to do it! Whew! Hopefully, this comment will
// explain what’s going on.

fn main() {
    let lucky_number = 7; // I’m feeling lucky today
}
...
fn main() {
    // I’m feeling lucky today
    let lucky_number = 7;
    /* this is block comment
       which can span multiple lines.
       Nesting is allowed.
     */
}")]) #label("orge6c00be")

Постоје и коментари за документацију који представљају посебну синтаксу за
коментаре који су део API документације. Они се пишу после #raw("///"). На пример:
#figure([#raw(block: true, lang: "rust", "/// Adds one to the number given.
///
/// # Examples
///
/// ```
/// let arg = 5;
/// let answer = my_crate::add_one(arg);
///
/// assert_eq!(6, answer);
/// ```
pub fn add_one(x: i32) -> i32 {
    x + 1
}")]) #label("org0cd06ac")
#heading(level: 2)[Контрола тока] #label("orga875c0f")
#heading(level: 3)[#raw("if") изрази] #label("org25c5e72")
#figure([#raw(block: true, lang: "rust", "fn main() {
    let number = 3;

    if number < 5 {
        println!(\u{22}condition was true\u{22});
    } else {
        println!(\u{22}condition was false\u{22});
    }
}")]) #label("orgcc5b7cf")

#raw(block: false, "condition was true")
#heading(level: 3)[#raw("if-else")] #label("org74ad5d7")
#figure([#raw(block: true, lang: "rust", "fn main() {
    let number = 6;

    if number % 4 == 0 {
        println!(\u{22}number is divisible by 4\u{22});
    } else if number % 3 == 0 {
        println!(\u{22}number is divisible by 3\u{22});
    } else if number % 2 == 0 {
        println!(\u{22}number is divisible by 2\u{22});
    } else {
        println!(\u{22}number is not divisible by 4, 3, or 2\u{22});
    }
}")]) #label("org0fcf093")

#raw(block: false, "number is divisible by 3")
#heading(level: 3)[#raw("if") у #raw("let") исказима] #label("org917c177")
#raw("if") је израз па се може користити где год можемо писати и било који други израз.

#figure([#raw(block: true, lang: "rust", "fn main() {
    let condition = true;
    let number = if condition { 5 } else { 6 };

    println!(\u{22}The value of number is: {}\u{22}, number);
}")]) #label("org038a508")

#raw(block: false, "The value of number is: 5")


Али се гране морају слагати по типу. Ово је погрешно јер је прва грана типа
#raw("i32") док је #raw("else") грана типа #raw("str").

#figure([#raw(block: true, lang: "rust", "fn main() {
    let condition = true;

    let number = if condition { 5 } else { \u{22}six\u{22} };

    println!(\u{22}The value of number is: {}\u{22}, number);
}")]) #label("org3cf10ab")
#heading(level: 3)[Петље] #label("org3323fa7")
Рaст има три типа петље:
#list(list.item[#raw("loop") \u{2d} за бесконачне петље])#list(list.item[#raw("while") \u{2d} условна петља])#list(list.item[#raw("for") \u{2d} петља за итерацију кроз елементе итерабилних типова])
#heading(level: 3)[#raw("loop")] #label("org43a551b")
#figure([#raw(block: true, lang: "rust", "fn main() {
    loop {
        println!(\u{22}again!\u{22});
    }
}")]) #label("orgaf0198e")
#heading(level: 3)[#raw("loop") лабеле] #label("orgd1f8e44")
Уколико имамо угњеждене #raw("loop") исказе можемо користити лабеле приликом изласка са
#raw("break") инструкцијом.

#figure([#raw(block: true, lang: "rust", "fn main() {
    let mut count = 0;
    'counting_up: loop {
        println!(\u{22}count = {}\u{22}, count);
        let mut remaining = 10;

        loop {
            println!(\u{22}remaining = {}\u{22}, remaining);
            if remaining == 9 {
                break;
            }
            if count == 2 {
                break 'counting_up;
            }
            remaining -= 1;
        }

        count += 1;
    }
    println!(\u{22}End count = {}\u{22}, count);
}")]) #label("org76b4998")
#raw(block: false, "count = 0
remaining = 10
remaining = 9
count = 1
remaining = 10
remaining = 9
count = 2
remaining = 10
End count = 2")
#heading(level: 3)[#raw("loop") као израз] #label("org6714335")
#raw("loop") може имати повратну вредност. Повратна вредност се дефинише као параметар
#raw("break") инструкције.

#figure([#raw(block: true, lang: "rust", "fn main() {
    let mut counter = 0;

    let result = loop {
        counter += 1;

        if counter == 10 {
            break counter * 2;
        }
    };

    println!(\u{22}The result is {}\u{22}, result);
}")]) #label("org1e7bea7")

#raw(block: false, "The result is 20")
#heading(level: 3)[#raw("while")] #label("org5fb1d69")
#figure([#raw(block: true, lang: "rust", "fn main() {
    let mut number = 3;

    while number != 0 {
        println!(\u{22}{}!\u{22}, number);

        number -= 1;
    }

    println!(\u{22}LIFTOFF!!!\u{22});
}")]) #label("org5694ac3")

#raw(block: false, "3!
2!
1!
LIFTOFF!!!")
#heading(level: 3)[#raw("for")] #label("orga198caa")
Итерацију кроз уређену колекцију, као што је низ, можемо обавити са #raw("while") петљом.
#figure([#raw(block: true, lang: "rust", "fn main() {
    let a = [10, 20, 30, 40, 50];
    let mut index = 0;

    while index < 5 {
        println!(\u{22}the value is: {}\u{22}, a[index]);

        index += 1;
    }
}")]) #label("org99f32d7")

#raw(block: false, "the value is: 10
the value is: 20
the value is: 30
the value is: 40
the value is: 50")


Али је за ту намену природније и сигурније користити #raw("for") петљу. Такође ће се
програм брже извршавати.

#figure([#raw(block: true, lang: "rust", "fn main() {
    let a = [10, 20, 30, 40, 50];

    for element in a {
        println!(\u{22}the value is: {}\u{22}, element);
    }
}")]) #label("org9bb5866")

#raw(block: false, "the value is: 10
the value is: 20
the value is: 30
the value is: 40
the value is: 50")


#raw("for") петље су најчешћи облик петљи у употреби у Расту. Користе се нпр. и у
ситуацији када је потребно извршити петљу одређени број пута.

#figure([#raw(block: true, lang: "rust", "fn main() {
    for number in (1..4).rev() {
        println!(\u{22}{}!\u{22}, number);
    }
    println!(\u{22}LIFTOFF!!!\u{22});
}")]) #label("org8412fb6")

#raw(block: false, "3!
2!
1!
LIFTOFF!!!")
#heading(level: 3)[#raw("for") и итератори] #label("orgcb86a37")
Приликом итерације употребом #raw("for") исказа имплицитно се позива метода
#raw("into_iter()") над колекцијом. Ова метода конзумира елементе колекције.

#figure([#raw(block: true, lang: "rust", "fn main() {
    let names = vec![\u{22}Bob\u{22}, \u{22}Frank\u{22}, \u{22}Ferris\u{22}];

    for name in names.into_iter() {
        match name {
            \u{22}Ferris\u{22} => println!(\u{22}There is a rustacean among us!\u{22}),
            _ => println!(\u{22}Hello {}\u{22}, name),
        }
    }

    // println!(\u{22}names: {:?}\u{22}, names); -- FIXME: колекција овде није доступна
}")]) #label("org016dbf2")

#raw(block: false, "Hello Bob
Hello Frank
There is a rustacean among us!")


#figure([#raw(block: true, lang: "rust", "fn main() {
    let names = vec![\u{22}Bob\u{22}, \u{22}Frank\u{22}, \u{22}Ferris\u{22}];

    for name in names.iter() {
        match name {
            &\u{22}Ferris\u{22} => println!(\u{22}There is a rustacean among us!\u{22}),
            // TODO ^ Try deleting the & and matching just \u{22}Ferris\u{22}
            _ => println!(\u{22}Hello {}\u{22}, name),
        }
    }

    println!(\u{22}names: {:?}\u{22}, names);
}")]) #label("org0d352dd")

#raw(block: false, "Hello Bob
Hello Frank
There is a rustacean among us!
names: [\u{22}Bob\u{22}, \u{22}Frank\u{22}, \u{22}Ferris\u{22}]")


#figure([#raw(block: true, lang: "rust", "fn main() {
    let mut names = vec![\u{22}Bob\u{22}, \u{22}Frank\u{22}, \u{22}Ferris\u{22}];

    for name in names.iter_mut() {
        *name = match name {
            &mut \u{22}Ferris\u{22} => \u{22}There is a rustacean among us!\u{22},
            _ => \u{22}Hello\u{22},
        }
    }

    println!(\u{22}names: {:?}\u{22}, names);
}")]) #label("orgaa55018")

#raw(block: false, "names: [\u{22}Hello\u{22}, \u{22}Hello\u{22}, \u{22}There is a rustacean among us!\u{22}]")
#heading(level: 1)[Власништво и позајмљивање (#emph[Ownership and borrowing])] #label("org5a19386")
#heading(level: 2)[Власништво] #label("org78bd149")
#heading(level: 3)[Власништво] #label("org6e73e4f")
#list(list.item[Један од најважнијих концепата језика.])#list(list.item[Скуп правила који омогућавају управљање меморијом.])#list(list.item[Гаранције за меморијску сигурност без употребе #emph[garbage collector]\u{2d}а])#list(list.item[Све провере се обављају у време компајлирања \u{2d} резултује одличним
перформансама у време извршавања.])
#heading(level: 3)[Стек и хип (#emph[Stack and Heap])] #label("orgd63b4e6")
#list(list.item[Стек \u{2d} алокација простора за податке чија је величина позната у време
компајлирања.
#list(list.item[Бржа алокација и деалокација \u{2d} једноставан механизам, LIFO структура.])#list(list.item[Бржи приступ \u{2d} локалне варијабле, кеширање приступа.])])#list(list.item[Хип \u{2d} слободна алокација у време извршавања.
#list(list.item[Спорија алокација и деалокација.])#list(list.item[Спорији приступ \u{2d} произвољна локација.])])
#heading(level: 3)[Правила власништва] #label("orgd32553e")
#enum(enum.item(1)[Свака вредност у Расту има варијаблу која се назива #emph[власником] (#emph[owner]).],
enum.item(2)[У сваком тренутку постоји само један власник.],
enum.item(3)[Када власник изађе из опсега важења (#emph[scope]) вредност се деалоцира (#emph[drop]).],
)
#heading(level: 3)[Опсег важења варијабле (#emph[Variable Scope])] #label("orgcfe399e")
#figure([#raw(block: true, lang: "rust", "{                      // s није валидно овде јер још није декларисано
    let s = \u{22}hello\u{22};   // s је валидно од ове позиције

    // користимо s
}   // овде опсег престаје да важи и s више није валидно")]) #label("org5e55d6e")
#heading(level: 3)[#raw("String") тип] #label("orgda5174e")
#list(list.item[Демонстрација власништва над типом који се алоцира на хипу.

#figure([#raw(block: true, lang: "rust", "let mut s = String::from(\u{22}hello\u{22});
  s.push_str(\u{22}, world!\u{22}); // push_str() додаје литерал на стринг
  println!(\u{22}{}\u{22}, s); // hello, world!`")]) #label("orge437750")])#list(list.item[Меморија се алоцира са хипа у време извршавања.])#list(list.item[Морамо вратити меморију алокатору када нам више није потребна.])

#list(list.item[Алокација стринга се обавља на линији:

#figure([#raw(block: true, lang: "rust", "let mut s = String::from(\u{22}hello\u{22});")]) #label("orgb6dbcb1")])#list(list.item[Али деалокација је тежа:
#list(list.item[#emph[Garbage collector]])#list(list.item[#emph[Memory waste]])#list(list.item[#emph[Double\u{2d}free]])])

#list(list.item[Раст компајлер ће додати кôд који ради деалокацију када власник напусти опсег важења.])#list(list.item[Позива се функција #raw("drop") над типом и ова функција је задужена да обави деалокацију.

#figure([#raw(block: true, lang: "rust", "{
        let s = String::from(\u{22}hello\u{22}); // s постаје валидно

        // користимо s
  }  // <- s излази из опсега и позива се \u{22}drop\u{22}")]) #label("org3c014b0")])
#heading(level: 3)[Додела вредности] #label("org2dc38ce")
#list(list.item[Копирање вредности #raw("x") у #raw("y"). Обе варијабле сада имају вредност #raw("5").

#figure([#raw(block: true, lang: "rust", "let x = 5;
  let y = x;")]) #label("org657f225")])#list(list.item[Али са #raw("String") типом дешава се нешто друго.

#figure([#raw(block: true, lang: "rust", "let s1 = String::from(\u{22}hello\u{22});")]) #label("org70c043a")])

#figure([#image(sys.inputs.file-0)]) #label("orgc5f60f0")

#list(list.item[Ако би се копирао само садржај са стека имали бисмо следећу ситуацију (тзв.
#emph[shallow copy]).

#figure([#raw(block: true, lang: "rust", "let s1 = String::from(\u{22}hello\u{22});
  let s2 = s1;")]) #label("org49c7a51")])

#figure([#image(sys.inputs.file-1)]) #label("org22ea4c4")

Што је проблематично јер када и #raw("s1") и #raw("s2") напусте опсег покушаће се двострука
деалокација исте меморије на хипу (#emph[double free]).

Ако би се и хип меморија копирала (tzv. #emph[deep copy]) имали бисмо валидну ситуацију
али би таква операција била веома "скупа".

#figure([#image(sys.inputs.file-2)]) #label("org894601c")
#heading(level: 3)[Премештање (#emph[Move])] #label("org289bb1e")
Ако пробамо да компајлирамо следећи код:

#figure([#raw(block: true, lang: "rust", "let s1 = String::from(\u{22}hello\u{22});
let s2 = s1;

println!(\u{22}{}, world!\u{22}, s1);")]) #label("org81ed891")

Добићемо грешку:

Оно што нам компајлер каже је да се у исказу:

#figure([#raw(block: true, lang: "rust", "let s2 = s1;")]) #label("orgc214f11")

променио власник овог стринга. Нови власник је сада #raw("s2") док је варијабла #raw("s1")
постала невалидна и није је више могуће користити.

Кажемо да се обавило "премештање" (#emph[move]) вредности из #raw("s1") у #raw("s2").

#figure([#image(sys.inputs.file-3)]) #label("org34db034")

Чиме се испуњава прво правило власништва и спречава #emph[double free] грешка.
#heading(level: 3)[Клонирање] #label("orgca973ac")
Последица претходног је да Раст никада неће аутоматски обавити дубоко копирање
варијабле јер би то могло да изазове лоше перформансе.

Дубоко копирање (стек\u{2b}хип) радимо са #raw("clone") методом:

#figure([#raw(block: true, lang: "rust", "let s1 = String::from(\u{22}hello\u{22});
let s2 = s1.clone();

println!(\u{22}s1 = {}, s2 = {}\u{22}, s1, s2);")]) #label("org0c22b23")

Сада је лако пронаћи у коду сва места где се обавља потенцијално "скупа"
операција дубоког копирања.
#heading(level: 3)[#emph[Copy] типови] #label("org56812dc")
Како онда ради пример који смо видели претходно? Зашто не долази до премештања
и инвалидације #raw("y") варијабле?

#figure([#raw(block: true, lang: "rust", "let x = 5;
let y = x;

println!(\u{22}x = {}, y = {}\u{22}, x, y);")]) #label("org484a8df")

#list(list.item[Код простих типова чија је величина позната у време компајлирања и који могу
у целости стати на стек нема разлике између дубоког и плитког копирања.])#list(list.item[Овакви типови имплементирају #emph[Copy] особину (#emph[Trait]). Вредности ових типова не
обављају премештање већ увек копирање.])#list(list.item[Импликација је да се варијабла са десне стране доделе може користити и након
доделе.])#list(list.item[Раст ће спречити имплементацију #emph[Copy] особине ако тип имплементира и #emph[Drop] јер
то значи да ради неку специјалну алокацију па му је потребна и посебна
деалокација што значи да мора да се ради премештање.])
#heading(level: 3)[Власништво и функције] #label("orgd540139")
#list(list.item[Семантика преноса параметара код позива функција је слична семантици доделе.])

#figure([#raw(block: true, lang: "rust", "fn main() {
    let s = String::from(\u{22}hello\u{22});  // s постаје валидно

    takes_ownership(s);             // s вредност се премешта у функцију...
                                    // ... тако да s није валидно од ове позиције

    let x = 5;                      // x постаје валидно

    makes_copy(x);                  // x би се преместило у функцију,
                                    // али i32 је Copy, тако да је ok
                                    // да се x користи и после

} // x излази из опсега, затим s. Али пошто је s премештено ништа посебно се
  // не дешава.

fn takes_ownership(some_string: String) { // some_string улази у опсег
    println!(\u{22}{}\u{22}, some_string);
} // some_string излази из опсега и позива се `drop`. Меморија са хипа се
  // ослобађа.

fn makes_copy(some_integer: i32) { // some_integer улази у опсег
    println!(\u{22}{}\u{22}, some_integer);
} // some_integer излази из опсега. Пошто није 'Drop', ништа посебно се не
  // догађа (осим \u{22}скидања\u{22} са стека наравно)")]) #label("orgb60b113")
#heading(level: 3)[Повратне вредности и опсези] #label("org15329dc")
Приликом враћања вредности из функције такође може доћи до премештања власништва.

#figure([#raw(block: true, lang: "rust", "fn main() {
    let s1 = gives_ownership();         // gives_ownership премешта повратну
                                        // вредност у s1

    let s2 = String::from(\u{22}hello\u{22});     // s2 постаје валидно

    let s3 = takes_and_gives_back(s2);  // s2 се премешта у функцију
                                        // takes_and_gives_back, која премешта
                                        // повратну вредност у s3
} // s3 излази из опсега и позива се `drop`. s2 је премештена па се ништа
  // не дешава. s1 такође излази из опсега и деалоцира се.

fn gives_ownership() -> String {             // gives_ownership ће преместити
                                             // своју повратну вредност у функцију
                                             // која је позива

    let some_string = String::from(\u{22}yours\u{22}); // some_string постаје валидно

    some_string                              // some_string се премешта
                                             // у функцију позиваоца
}

// Ова функција узима власништво над стрингом и враћа га назад
fn takes_and_gives_back(a_string: String) -> String { // a_string постаје валидно

    a_string  // a_string се премешта у функцију позиваоца
}")]) #label("org2308137")

#list(list.item[Често нам је потребно да варијаблу користимо и после слања у функцију.])#list(list.item[Могли би је стало враћати заједно са резултатом функције на пример употребом торки.])

#figure([#raw(block: true, lang: "rust", "fn main() {
    let s1 = String::from(\u{22}hello\u{22});

    let (s2, len) = calculate_length(s1);

    println!(\u{22}The length of '{}' is {}.\u{22}, s2, len);
}

fn calculate_length(s: String) -> (String, usize) {
    let length = s.len();

    (s, length)
}")]) #label("org7ed2bc8")

Али је то напорно. Постоји концепт у Раст који је намењен оваквим
ситуацијама и базиран је на референцама и позајмљивању вредности.
#heading(level: 2)[Референце и позајмљивање (#emph[References and Borrowing])] #label("org9562f47")
#heading(level: 3)[Референце и позајмљивање (#emph[References and Borrowing])] #label("org4727d39")
#list(list.item[Референца је попут поинтера, садржи адресу вредности коју поседује нека друга
варијабла.])#list(list.item[За разлику од поинтера, референце у Расту су гарантовано валидне.])

#figure([#raw(block: true, lang: "rust", "fn main() {
    let s1 = String::from(\u{22}hello\u{22});

    let len = calculate_length(&s1);

    println!(\u{22}The length of '{}' is {}.\u{22}, s1, len);
}

fn calculate_length(s: &String) -> usize {
    s.len()
}")]) #label("org8bb38b8")

#figure([#image(sys.inputs.file-4)]) #label("org044fa08")
#heading(level: 3)[Референцирање] #label("orgb66c589")
#list(list.item[Примена оператора #raw("&") над варијаблом називамо #emph[референцирање].

#figure([#raw(block: true, lang: "rust", "let s1 = String::from(\u{22}hello\u{22});
  let len = calculate_length(&s1);")]) #label("orgcb2ad8d")])#list(list.item[Синтакса #raw("&s1") нам омогућава да креирамо референцу на вредност чији власник је
#raw("s1") без узимања власништва.])#list(list.item[Пошто референца није власник не долази до деалокације приликом изласка из
опсега.])#list(list.item[Операција обрнута референцирању назива се #emph[дереференцирање] и врши се #raw("*")
оператором над референцом (нпр. #raw("*s2") је вредност на коју референцира #raw("s2")).])#list(list.item[Операцију референцирања називамо позајмљивањем (#emph[borrowing]).])

#list(list.item[Параметар функције може бити референца.])
#figure([#raw(block: true, lang: "rust", "fn calculate_length(s: &String) -> usize { // s је референца на String
    s.len()
} // s излази из опсега али пошто нема власништво над вредношћу
  // ништа се не дешава.")]) #label("org47b3f84")
#heading(level: 3)[Промена позајмљене вредности] #label("orgfc69d56")
Шта се дешава уколико покушамо да модификујемо позајмљену вредност?

#figure([#raw(block: true, lang: "rust", "fn main() {
    let s = String::from(\u{22}hello\u{22});
    change(&s);
}

fn change(some_string: &String) {
    some_string.push_str(\u{22}, world\u{22});
}")]) #label("org482ab51")
#heading(level: 3)[Промењиве референце] #label("orgbebbddb")
Као и варијабле, и референце су подразумевано непромењива (#emph[immutable]). Морамо
бити експлицитни уколико нам треба промењива референца.

#figure([#raw(block: true, lang: "rust", "fn main() {
    let mut s = String::from(\u{22}hello\u{22});
    change(&mut s);
}

fn change(some_string: &mut String) {
    some_string.push_str(\u{22}, world\u{22});
}")]) #label("orged5bb13")
#heading(level: 3)[Више промењивих референци над истом вредношћу] #label("org58a05b9")
Раст не дозвољава да исти податак у једном тренутку има више промењивих
референци.

#figure([#raw(block: true, lang: "rust", "let mut s = String::from(\u{22}hello\u{22});

let r1 = &mut s;
let r2 = &mut s;

println!(\u{22}{}, {}\u{22}, r1, r2);")]) #label("orgeee9c05")

Овим ограничењем Раст, у време компајлирања, спречава класу грешака које
доводе до недефинисаног понашања и које зовемо #emph[data races]. Ове грешке се веома
тешко откривају и отклањају и могу настати уколико су задовољени следећи
услови:

#list(list.item[Два или више поинтера приступају истим подацима у исто време,])#list(list.item[Бар један поинтер се користи за измену податка,])#list(list.item[Не постоји механизам за синхронизацију приступа.])

Више промењивих референци можемо имати али не у истом опсегу:

#figure([#raw(block: true, lang: "rust", "let mut s = String::from(\u{22}hello\u{22});

{
    let r1 = &mut s;
} // r1 овде излази из опсега тако да можемо краирати нове референце

let r2 = &mut s;")]) #label("orgeab594d")
#heading(level: 3)[Комбинација промењивих и непромењивих референци] #label("orgdb903e7")
Слично правило постоји и уколико имамо комбинацију промењивих и непромењивих
референци:

#figure([#raw(block: true, lang: "rust", "let mut s = String::from(\u{22}hello\u{22});

let r1 = &s; // ovo je OK
let r2 = &s; // ovo je OK
let r3 = &mut s; // GREŠKA!

println!(\u{22}{}, {}, and {}\u{22}, r1, r2, r3);")]) #label("orgbb0d43d")

#list(list.item[Не можемо истовремено имати непромењиве и промењиве референце јер корисници
непромењивих референци не очекују да се подаци мењају.])#list(list.item[Можемо имати више непромењивих референци јер нико не може да мења податке и
тиме утиче на друге.])#list(list.item[Промењиве референце често зовемо и #emph[јединствене референце] јер када су оне
активне не може постојати друга референца на исту вредност.])
#heading(level: 3)[Опсег важења референце] #label("orgcf0bcd0")
Опсег важења референце почиње од места где је уведена па до њене последње
употребе. На пример, ово је валидно:

#figure([#raw(block: true, lang: "rust", "let mut s = String::from(\u{22}hello\u{22});

let r1 = &s; // OK
let r2 = &s; // OK
println!(\u{22}{} and {}\u{22}, r1, r2);
// варијабле r1 и r2 се не користе у наставку па њихов опсег
// престаје да важи.

let r3 = &mut s; // зато је ово OK
println!(\u{22}{}\u{22}, r3);")]) #label("org9d47204")

Ова особина референци се назива #emph[Non\u{2d}Lexical Lifetimes (NLL)].
#heading(level: 3)["Висеће" референце] #label("orga73fb1b")
#list(list.item[У језицима са поинтерима лако је креирати поинтер на део меморије који је деалоциран.])#list(list.item[Раст гарантовано спречава овакве грешке. Референце су увек валидне у Расту.])

#figure([#raw(block: true, lang: "rust", "fn main() {
    let reference_to_nothing = dangle();
}

fn dangle() -> &String {
    let s = String::from(\u{22}hello\u{22});

    &s
}")]) #label("org2db1ee2")

#list(list.item[Механизам који ово спречава назива се "време живота" (#emph[lifetime]) и биће
детаљније обрађено у наставку.])#list(list.item[У преводу Раст нам поручује:

#figure([#quote(block: true)[Тип повратне вредности ове функције је позајмљена вредност, али не постоји
улазни параметар од кога може да се позајми.
]]) #label("orga65e52b")])
#heading(level: 3)[Шта се тачно десило?] #label("orgda3fcb3")
#figure([#raw(block: true, lang: "rust", "fn dangle() -> &String { // dangle враћа референцу на String

    let s = String::from(\u{22}hello\u{22}); // s је нови String

    &s // Враћамо референцу на String s
} // s излази из опсега и позива се `drop`. Меморија се ослобађа.
  // ОПАСНОСТ! Враћена референца ће бити \u{22}висећа\u{22}.")]) #label("org932be5b")

Како се може решити. Вратићемо поседовану (#emph[owned]) вредност, тј урадићемо
премештање вредности у функцију позиваоца.

#figure([#raw(block: true, lang: "rust", "fn no_dangle() -> String {
    let s = String::from(\u{22}hello\u{22});

    s
}")]) #label("org25f6d14")
#heading(level: 3)[Правила позајмљивања] #label("org7bf4f24")
#enum(enum.item(1)[У сваком тренутку можемо имати или једну промењиву или произвољан број
непромењивих референци.],
enum.item(2)[Референце увек морају бити валидне.],
)
#heading(level: 2)[Исечци (#emph[Slice] тип)] #label("orgd1fa1b1")
#heading(level: 3)[#emph[Slice]] #label("org6bb0ea0")
#list(list.item[Исечци (#emph[slices]) омогућавају референцирање континуалне секвенце унутар
колекције уместо целе колекције])
#heading(level: 3)[Пример] #label("org8b16f98")
Функција која за задати стринг враћа прву реч.

#figure([#raw(block: true, lang: "rust", "fn first_word(s: &String) -> usize {
    let bytes = s.as_bytes();

    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return i;
        }
    }

    s.len()
}")]) #label("org2940ab5")

#list(list.item[Дакле, враћамо индекс краја речи. Позиваоц сада има потребне информације да дође до тражене речи.])#list(list.item[Проблем: два податка која су у вези али морамо ту везу ручно да одржавамо јер
немамо гаранцију да ће број који је враћен бити валидан и у будућности (нпр.
стринг може да се промени или да изађе из опсега).])

#figure([#raw(block: true, lang: "rust", "fn main() {
    let mut s = String::from(\u{22}hello world\u{22});

    let word = first_word(&s); // word ће добити вредност 5

    s.clear(); // стринг s постаје \u{22}\u{22}

    // word је и даље 5 иако то више није исправно
}")]) #label("org587cab1")

Проблем постаје још озбиљнији ако нпр. напишемо функцију #raw("second_word") која враћа
другу реч задатог стринга. По аналогији са претходним, требали би да вратимо
почетак и крај друге речи.

#figure([#raw(block: true, lang: "rust", "fn second_word(s: &String) -> (usize, usize) {")]) #label("org3e2b4c2")

Сада имамо три податка о којима морамо да водимо рачуна.
#heading(level: 3)[Стринг исечак] #label("org6857198")
Проблем решавамо употребом исечака.

#figure([#raw(block: true, lang: "rust", "let s = String::from(\u{22}hello world\u{22});

let hello = &s[0..5];
let world = &s[6..11];")]) #label("org42d113e")

Синтакса #raw("s[x..y]") креира исечак над секвенцом #raw("s"). С обзиром да овај тип (#raw("[T]")) нема
познату величину у време компајлирања, не можемо га алоцирати на стеку, односно
не можемо га доделити локалним варијаблама или прослеђивати као параметар
функције. Зато се у пракси користи референца на исечак (#raw("&[T]")) (често се зове и
#emph[fat pointer]).

Дакле, у пракси много чешће срећемо синтаксу #raw("&s[x..y]").
#figure([#image(sys.inputs.file-5)]) #label("org68bf06c")
#heading(level: 3)[Исечци и синтакса опсега (#emph[range])] #label("org6e08548")
#figure([#raw(block: true, lang: "rust", "let s = String::from(\u{22}hello\u{22});

let slice = &s[0..2];
let slice = &s[..2];")]) #label("org039658a")

#figure([#raw(block: true, lang: "rust", "let s = String::from(\u{22}hello\u{22});

let len = s.len();

let slice = &s[3..len];
let slice = &s[3..];")]) #label("orga4a00f7")

#figure([#raw(block: true, lang: "rust", "let s = String::from(\u{22}hello\u{22});

let len = s.len();

let slice = &s[0..len];
let slice = &s[..];")]) #label("org6a05878")
#heading(level: 3)[Модификација примера да користи стринг исечке] #label("orgdc94b83")
#figure([#raw(block: true, lang: "rust", "fn first_word(s: &String) -> &str {
    let bytes = s.as_bytes();

    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return &s[0..i];
        }
    }

    &s[..]
}")]) #label("org9612a91")

Исти API и за #raw("second_word").

#figure([#raw(block: true, lang: "rust", "fn second_word(s: &String) -> &str {")]) #label("orgdcd1b05")

Сада нам компајлер осигурава да увек имамо валидну референцу на реч.
#figure([#raw(block: true, lang: "rust", "fn main() {
    let mut s = String::from(\u{22}hello world\u{22});

    let word = first_word(&s);

    s.clear(); // ГРЕШКА!

    println!(\u{22}the first word is: {}\u{22}, word);
}")]) #label("orgeb8dddd")

Не само да је API лакши за употребу већ је читава класа грешака које се тешко
откривају елиминисана у време компајлирања.
#heading(level: 3)[Стринг литерали су референце на исечке] #label("org8709331")
#figure([#raw(block: true, lang: "rust", "let s = \u{22}Hello, world!\u{22};")]) #label("org5675d8d")

Тип од #raw("s") је #raw("&str"). #raw("str") је стринг исечак.
#heading(level: 3)[Стринг исечци као параметри функција] #label("orge0ca13e")
#figure([#raw(block: true, lang: "rust", "fn first_word(s: &String) -> &str {")]) #label("org2e9d80b")

Али ће искусни Раст програмери писати:

#figure([#raw(block: true, lang: "rust", "fn first_word(s: &str) -> &str {")]) #label("orgeaba20c")

Јер ће ова функција моћи да се користи и за #raw("&str") и за #raw("&String"). Овде се
употребљава тзв. #emph[Deref Coercion] односно могућности типова да се дереференцирају
у други тип. Нпр. #raw("&String") ће се аутоматски дереференцирати у #raw("&str") уколико је то
потребно. Операција је ефикасна.

#figure([#raw(block: true, lang: "rust", "fn main() {
    let my_string = String::from(\u{22}hello world\u{22});

    // `first_word` works on slices of `String`s, whether partial or whole
    let word = first_word(&my_string[0..6]);
    let word = first_word(&my_string[..]);
    // `first_word` also works on references to `String`s, which are equivalent
    // to whole slices of `String`s
    let word = first_word(&my_string);

    let my_string_literal = \u{22}hello world\u{22};

    // `first_word` works on slices of string literals, whether partial or whole
    let word = first_word(&my_string_literal[0..6]);
    let word = first_word(&my_string_literal[..]);

    // Because string literals *are* string slices already,
    // this works too, without the slice syntax!
    let word = first_word(my_string_literal);
}")]) #label("org60b7a35")
#heading(level: 3)[Употреба исечака над другим структурама] #label("org7bfb08c")
#figure([#raw(block: true, lang: "rust", "let a = [1, 2, 3, 4, 5];

let slice = &a[1..3]; // референца на исечак типа &[i32]

assert_eq!(slice, &[2, 3]);")]) #label("orgb42a3a0")
#heading(level: 1)[Структуре] #label("orgcefd532")
#heading(level: 2)[#raw("struct") тип] #label("org21cfdbc")
Кориснички тип који омогућава груписање више логички повезаних вредности \u{2d} поља
(#emph[fields]).

У Расту постоје три врсте структура:
#list(list.item[Структуре торки (#emph[tuple structs]) \u{2d} у основи представљају именоване торке])#list(list.item[Класичне Ц\u{2d}овске структуре])#list(list.item[Јединичне структуре (#emph[unit structs]) \u{2d} структуре без атрибута])
#heading(level: 2)[Дефиниција структуре] #label("orga465082")
#figure([#raw(block: true, lang: "rust", "struct User {
    active: bool,
    username: String,
    email: String,
    sign_in_count: u64,
}")]) #label("org983ed15")
#heading(level: 2)[Креирање инстанце структуре] #label("org8cd6068")
#figure([#raw(block: true, lang: "rust", "fn main() {
    let user1 = User {
        active: true,
        username: String::from(\u{22}someusername123\u{22}),
        email: String::from(\u{22}someone@example.com\u{22}),
        sign_in_count: 1,
    };
}")]) #label("org404c7cb")
#heading(level: 2)[Промена вредности поља] #label("orgd1955b2")
#figure([#raw(block: true, lang: "rust", "fn main() {
    let mut user1 = User {
        active: true,
        username: String::from(\u{22}someusername123\u{22}),
        email: String::from(\u{22}someone@example.com\u{22}),
        sign_in_count: 1,
    };

    user1.email = String::from(\u{22}anotheremail@example.com\u{22});
}")]) #label("orgc264c9f")
#heading(level: 2)[Креирање структуре путем функције] #label("orga2511f2")
#figure([#raw(block: true, lang: "rust", "fn build_user(email: String, username: String) -> User {
    User {
        active: true,
        username: username,
        email: email,
        sign_in_count: 1,
    }
}")]) #label("org7b957a2")
#heading(level: 2)[Употреба скраћеног облика] #label("orgb9f85f7")
#figure([#raw(block: true, lang: "rust", "fn build_user(email: String, username: String) -> User {
    User {
        active: true,
        username,
        email,
        sign_in_count: 1,
    }
}")]) #label("orgb897e62")
#heading(level: 2)[Креирање инстанце из друге инстанце употребом синтаксе за ажурирање (#emph[update syntax])] #label("orgb19673c")
Уместо:
#figure([#raw(block: true, lang: "rust", "fn main() {
    // --snip--
    let user2 = User {
        active: user1.active,
        username: user1.username,
        email: String::from(\u{22}another@example.com\u{22}),
        sign_in_count: user1.sign_in_count,
    };
}")]) #label("org0d55302")

Можемо писати:
#figure([#raw(block: true, lang: "rust", "fn main() {
    let user2 = User {
        email: String::from(\u{22}another@example.com\u{22}),
        ..user1
    };
}")]) #label("orgc055f47")

#list(list.item[#raw("user1.username") је премештен у #raw("user2") и не може више да се користи. Остатак
структуре може јер #raw("user1.email") није премештен а остала поља су #emph[Copy] типа.])
#heading(level: 2)[Структуре торки] #label("org0ccb278")
Тзв. #emph[именоване торке]. Поља немају имена, приступа им се као код обичних торки
употребом #raw("x.n") синтаксе где је #raw("n") редни број поља.

#figure([#raw(block: true, lang: "rust", "struct Color(i32, i32, i32);
struct Point(i32, i32, i32);

fn main() {
    let black = Color(0, 0, 0);
    let origin = Point(5, 8, 0);
    let y = origin.1;
    println!(\u{22}{}\u{22}, y);
}")]) #label("org45c2c8c")

#raw(block: false, "8")
#heading(level: 2)[Јединичне структуре \u{2d} без поља] #label("org33d5d5b")
Користе се за креирање типова који имају понашање (имплементирају особине) али
не чувају податке (тзв. #link("https://doc.rust-lang.org/nomicon/exotic-sizes.html#zero-sized-types-zsts")[Zero Sized Types (ZSTs)] #footnote(link("https://doc.rust-lang.org/nomicon/exotic-sizes.html#zero-sized-types-zsts")))

#figure([#raw(block: true, lang: "rust", "struct AlwaysEqual;

fn main() {
    let subject = AlwaysEqual;
}")]) #label("org61ac329")
#heading(level: 2)[Разни примери] #label("org305ec92")
#figure([#raw(block: true, lang: "rust", "#[derive(Debug)]
struct Person {
    name: String,
    age: u8,
}

// A unit struct
struct Unit;

// A tuple struct
struct Pair(i32, f32);

// A struct with two fields
struct Point {
    x: f32,
    y: f32,
}
// Structs can be reused as fields of another struct
struct Rectangle {
    // A rectangle can be specified by where the top left and bottom right
    // corners are in space.
    top_left: Point,
    bottom_right: Point,
}")]) #label("orgc86734d")

#figure([#raw(block: true, lang: "rust", "// Create struct with field init shorthand
let name = String::from(\u{22}Peter\u{22});
let age = 27;
let peter = Person { name, age };

// Print debug struct
println!(\u{22}{:?}\u{22}, peter);

// Instantiate a `Point`
let point: Point = Point { x: 10.3, y: 0.4 };

// Access the fields of the point
println!(\u{22}point coordinates: ({}, {})\u{22}, point.x, point.y);

// Make a new point by using struct update syntax to use the fields of our
// other one
let bottom_right = Point { x: 5.2, ..point };

// `bottom_right.y` will be the same as `point.y` because we used that field
// from `point`
println!(\u{22}second point: ({}, {})\u{22}, bottom_right.x, bottom_right.y);")]) #label("orgc2da1ae")

#figure([#raw(block: true, lang: "rust", "// Destructure the point using a `let` binding
let Point { x: left_edge, y: top_edge } = point;

let _rectangle = Rectangle {
    // struct instantiation is an expression too
    top_left: Point { x: left_edge, y: top_edge },
    bottom_right: bottom_right,
};

// Instantiate a unit struct
let _unit = Unit;

// Instantiate a tuple struct
let pair = Pair(1, 0.1);

// Access the fields of a tuple struct
println!(\u{22}pair contains {:?} and {:?}\u{22}, pair.0, pair.1);

// Destructure a tuple struct
let Pair(integer, decimal) = pair;

println!(\u{22}pair contains {:?} and {:?}\u{22}, integer, decimal);")]) #label("org47bbcf2")
#heading(level: 1)[Енумерације] #label("org1c754e0")
#heading(level: 2)[#emph[Enum] тип] #label("orge9f9a1f")
#heading(level: 3)[#emph[Enum] тип] #label("orgd432751")
#list(list.item[Дефинисање типа навођењем свих могућих варијанти])#list(list.item[Варијанта може да садржи додатне податке])#list(list.item[Слично са алгебарским типовима података (#emph[algebraic data types]) у функционалним
језицима, нпр. F\u{23}, OCaml и Haskell\u{2d}у. Ова врста алгебарског типа је позната и
под називом #emph[sum type].])
#heading(level: 3)[Пример \u{2d} IP адреса] #label("org0fe92d2")
#list(list.item[IP адреса представља идентификацију мрежних интерфејса у уређајима који
комуницирају посредством Интернет протокола (#emph[Internet Protocol \u{2d} IP]).])#list(list.item[Тренутно имамо у употреби стару верзију 4 и нову верзију 6 која ће временом
заменити верзију 4.])#list(list.item[Верзија 4 је дужине 32 бита и наводи се као четири октета у облику нпр.
#raw("192.0.2.1")])#list(list.item[Верзија 6 је дужине 128 бита и наводи се као 8 група од по 4 хекса цифре
раздвојене са #raw(":"), нпр. #raw("2001:db8:0:1234:0:567:8:1")])

У Расту можемо писати следеће:

#figure([#raw(block: true, lang: "rust", "enum IpAddrKind {
    V4,
    V6,
}")]) #label("org2baeda5")

Док вредности можемо креирати са:
#figure([#raw(block: true, lang: "rust", "let four = IpAddrKind::V4;
let six = IpAddrKind::V6;")]) #label("orge27ccff")
#heading(level: 3)[Пример \u{2d} IP адреса \u{2d} функција] #label("orgf228d1a")
Сада можемо писати функцију која прима овај тип чиме је могуће проследити било
коју варијанту као аргумент.

#figure([#raw(block: true, lang: "rust", "fn route(ip_kind: IpAddrKind) {}

...

route(IpAddrKind::V4);
route(IpAddrKind::V6);")]) #label("org43131f6")
#heading(level: 3)[Пример \u{2d} IP адреса \u{2d} вредност] #label("orgd23b3aa")
#list(list.item[Али како да дефинишемо конкретну вредност IP адресе?])#list(list.item[Прва идеја би могла бити да користимо структуру.])

#figure([#raw(block: true, lang: "rust", "enum IpAddrKind {
    V4,
    V6,
}

struct IpAddr {
    kind: IpAddrKind,
    address: String,
}

let home = IpAddr {
    kind: IpAddrKind::V4,
    address: String::from(\u{22}127.0.0.1\u{22}),
};

let loopback = IpAddr {
    kind: IpAddrKind::V6,
    address: String::from(\u{22}::1\u{22}),
};")]) #label("org5e661a4")

Али, са #raw("enum") типом можемо то урадити и боље. #raw("Enum") варијанте могу садржати
додатне податке.

#figure([#raw(block: true, lang: "rust", "enum IpAddr {
    V4(String),
    V6(String),
}

let home = IpAddr::V4(String::from(\u{22}127.0.0.1\u{22}));

let loopback = IpAddr::V6(String::from(\u{22}::1\u{22}));")]) #label("orgca1ac98")

Вредност садржана у варијанти не мора бити иста за све варијанте. На пример,
IPv4 се састоји од 4 октета и можда желимо да вредност наводимо и чувамо у том
облику.

#figure([#raw(block: true, lang: "rust", "enum IpAddr {
    V4(u8, u8, u8, u8),
    V6(String),
}

let home = IpAddr::V4(127, 0, 0, 1);

let loopback = IpAddr::V6(String::from(\u{22}::1\u{22}));")]) #label("org57e81ba")
#heading(level: 3)[Пример \u{2d} IP адреса \u{2d} std библиотека] #label("orgb545c65")
У стандардној библиотеци можемо пронаћи тип #raw("IpAddr"). Дефинисан је на следећи
начин.

#figure([#raw(block: true, lang: "rust", "struct Ipv4Addr {
    // --snip--
}

struct Ipv6Addr {
    // --snip--
}

enum IpAddr {
    V4(Ipv4Addr),
    V6(Ipv6Addr),
}")]) #label("orgefbca2c")
#heading(level: 3)[Пример  \u{2d} #emph[Message]] #label("org03979e1")
#figure([#raw(block: true, lang: "rust", "enum Message {
    Quit,
    Move { x: i32, y: i32 },
    Write(String),
    ChangeColor(i32, i32, i32),
}")]) #label("org5bc3f6e")

Следеће структуре садрже исте податке као претходни #raw("enum") тип.

#figure([#raw(block: true, lang: "rust", "struct QuitMessage; // unit struct
struct MoveMessage {
    x: i32,
    y: i32,
}
struct WriteMessage(String); // tuple struct
struct ChangeColorMessage(i32, i32, i32); // tuple struct")]) #label("org67f5dd2")

Али, предност #raw("enum") типа је што је то јединствен тип па можемо нпр. направити
функцију која прима било коју вредност\u{2f}варијанту овог типа.

Над #raw("enum") типом, као и другим типовима, можемо имплементирати методе употребом
#raw("imlp") кључне речи.

#figure([#raw(block: true, lang: "rust", "impl Message {
    fn call(&self) {
        // тело методе се овде дефинише
    }
}

let m = Message::Write(String::from(\u{22}hello\u{22}));
m.call();")]) #label("org4d62769")
#heading(level: 3)[Пример \u{2d} #emph[WebEvent]] #label("org4d01744")
#figure([#raw(block: true, lang: "rust", "enum WebEvent {
    // An `enum` variant may either be `unit-like`,
    PageLoad,
    PageUnload,
    // like tuple structs,
    KeyPress(char),
    Paste(String),
    // or c-like structures.
    Click { x: i64, y: i64 },
}

fn inspect(event: WebEvent) {
    match event {
        WebEvent::PageLoad => println!(\u{22}page loaded\u{22}),
        WebEvent::PageUnload => println!(\u{22}page unloaded\u{22}),
        // Destructure `c` from inside the `enum` variant.
        WebEvent::KeyPress(c) => println!(\u{22}pressed '{}'.\u{22}, c),
        WebEvent::Paste(s) => println!(\u{22}pasted \\u{22}{}\\u{22}.\u{22}, s),
        // Destructure `Click` into `x` and `y`.
        WebEvent::Click { x, y } => {
            println!(\u{22}clicked at x={}, y={}.\u{22}, x, y);
        },
    }
}")]) #label("org0dab64a")

#figure([#raw(block: true, lang: "rust", "fn main() {
    let pressed = WebEvent::KeyPress('x');
    // `to_owned()` creates an owned `String` from a string slice.
    let pasted  = WebEvent::Paste(\u{22}my text\u{22}.to_owned());
    let click   = WebEvent::Click { x: 20, y: 80 };
    let load    = WebEvent::PageLoad;
    let unload  = WebEvent::PageUnload;

    inspect(pressed);
    inspect(pasted);
    inspect(click);
    inspect(load);
    inspect(unload);
}")]) #label("org9d9095f")

#raw(block: false, "pressed 'x'.
pasted \u{22}my text\u{22}.
clicked at x=20, y=80.
page loaded
page unloaded")
#heading(level: 3)[Употреба #raw("use") кључне речи] #label("org79bd394")
Варијанте можемо импортовати у текући опсег тако да се може избећи пуна
квалификација варијанти енумерисаног типа.

#figure([#raw(block: true, lang: "rust", "enum Status {
    Rich,
    Poor,
}

enum Work {
    Civilian,
    Soldier,
}")]) #label("org5df16ad")

#figure([#raw(block: true, lang: "rust", "fn main() {
    // Explicitly `use` each name so they are available without
    // manual scoping.
    use crate::Status::{Poor, Rich};
    // Automatically `use` each name inside `Work`.
    use crate::Work::*;

    // Equivalent to `Status::Poor`.
    let status = Poor;
    // Equivalent to `Work::Civilian`.
    let work = Civilian;

    match status {
        // Note the lack of scoping because of the explicit `use` above.
        Rich => println!(\u{22}The rich have lots of money!\u{22}),
        Poor => println!(\u{22}The poor have no money...\u{22}),
    }

    match work {
        // Note again the lack of scoping.
        Civilian => println!(\u{22}Civilians work!\u{22}),
        Soldier  => println!(\u{22}Soldiers fight!\u{22}),
    }
}")]) #label("org412ef18")
#heading(level: 3)[Ц\u{2d}овски енумерисани тип] #label("orgaf9166a")
Енумерисани тип у Расту се може користити као у Ц\u{2d}у.

#figure([#raw(block: true, lang: "rust", "// enum with implicit discriminator (starts at 0)
enum Number {
    Zero,
    One,
    Two,
}

// enum with explicit discriminator
enum Color {
    Red = 0xff0000,
    Green = 0x00ff00,
    Blue = 0x0000ff,
}

fn main() {
    // `enums` can be cast as integers.
    println!(\u{22}zero is {}\u{22}, Number::Zero as i32);
    println!(\u{22}one is {}\u{22}, Number::One as i32);

    println!(\u{22}roses are #{:06x}\u{22}, Color::Red as i32);
    println!(\u{22}violets are #{:06x}\u{22}, Color::Blue as i32);
}")]) #label("orgfe4570b")

#raw(block: false, "zero is 0
one is 1
roses are #ff0000
violets are #0000ff")
#heading(level: 3)[Тест случај \u{2d} повезана листа] #label("org4bf9c4c")
#figure([#raw(block: true, lang: "rust", "use crate::List::*;
enum List {
    Cons(u32, Box<List>),
    Nil,
}
impl List {
    fn new() -> List {
        Nil
    }
    fn prepend(self, elem: u32) -> List {
        Cons(elem, Box::new(self))
    }
    fn len(&self) -> u32 {
        match *self {
            Cons(_, ref tail) => 1 + tail.len(),
            Nil => 0
        }
    }
    fn stringify(&self) -> String {
        match *self {
            Cons(head, ref tail) => {
                format!(\u{22}{}, {}\u{22}, head, tail.stringify())
            },
            Nil => {
                format!(\u{22}Nil\u{22})
            },
        }
    }
}")]) #label("org6c569ee")

#figure([#raw(block: true, lang: "rust", "fn main() {
    // Create an empty linked list
    let mut list = List::new();
    // Prepend some elements
    list = list.prepend(1);
    list = list.prepend(2);
    list = list.prepend(3);

    // Show the final state of the list
    println!(\u{22}linked list has length: {}\u{22}, list.len());
    println!(\u{22}{}\u{22}, list.stringify());
}")]) #label("org73408c3")

#raw(block: false, "linked list has length: 3
3, 2, 1, Nil")
#heading(level: 2)[#raw("Option") енумерација] #label("org83da2f2")
#heading(level: 3)[#raw("Option") енумерација] #label("orge12f45a")
#list(list.item[Чест случај да вредност може бити нешто или ништа.])#list(list.item[Нпр. ако функција враћа први елемент из листе која није празна добићемо први
елемент, међутим ако је листа празна повратна вредност је ништа.])#list(list.item[Овај концепт се у различитим језицима различито имплементира. Често се користи
специјална вредност #raw("null") (или #raw("nil"), #raw("none") и сл.) и све варијабле могу бити #raw("null")
или #raw("non-null"). Проблем је што програмер не дефинише могућност ове вредности
кроз тип па самим тим компајлер нема могућност да провери да ли кôд исправно
обрађује ову могућност.])

У презентацији из 2009 године под називом #emph[Null References: The Billion Dollar
Mistake] Tony Hoare, који је први увео #raw("null") вредност као концепт је написао
следеће:

#figure([#quote(block: true)[I call it my billion\u{2d}dollar mistake. At that time, I was designing the first
comprehensive type system for references in an object\u{2d}oriented language. My goal
was to ensure that all use of references should be absolutely safe, with
checking performed automatically by the compiler. But I couldn’t resist the
temptation to put in a null reference, simply because it was so easy to
implement. This has led to innumerable errors, vulnerabilities, and system
crashes, which have probably caused a billion dollars of pain and damage in the
last forty years.
]]) #label("orgbdb3b4a")

#raw("Option") је генерички #raw("enum") тип у Расту.
#figure([#raw(block: true, lang: "rust", "enum Option<T> {
    None,
    Some(T),
}")]) #label("org647ad96")

Примери употребе:
#figure([#raw(block: true, lang: "rust", "let some_number = Some(5);           // тип је Option<i32>
let some_string = Some(\u{22}a string\u{22});  // тип је Option<&str>

let absent_number: Option<i32> = None;    // немогућа инференца")]) #label("org270b6bc")
#heading(level: 3)[Зашто је #raw("Option<T>") бољи од #raw("null")?] #label("org4a102d6")
#figure([#raw(block: true, lang: "rust", "let x: i8 = 5;
let y: Option<i8> = Some(5);

let sum = x + y;")]) #label("orgba533ef")
#heading(level: 3)[Како обрађивати #raw("Option<T>") податке?] #label("org6dcbc8e")
#list(list.item[Морамо експлицитно обрадити вредност #raw("Option<T>") и могућност да вредност буде
#raw("None").])#list(list.item[#raw("Option<T>") тип има #link("https://doc.rust-lang.org/stable/std/option/enum.Option.html")[богат API] #footnote(link("https://doc.rust-lang.org/stable/std/option/enum.Option.html")) који је потребно знати јер је овај тип врло често
у употреби.])

#figure([#raw(block: true, lang: "rust", "let x = Some(2);
let y = None;
assert_eq!(x.or(y), Some(2));

let x = None;
let y = Some(100);
assert_eq!(x.or(y), Some(100));")]) #label("orgfba9192")

#list(list.item[Често користимо језичке конструкције које омогућавају обраду обе варијанте.])
#heading(level: 1)[Сложена контрола тока и подударање образаца (#emph[Pattern Matching])] #label("org8d35ff2")
#heading(level: 2)[#raw("match") израз] #label("orgc05ea56")
#list(list.item[Моћан израз контроле тока базиран на подударању образаца (#emph[Pattern Matching]).])#list(list.item[Образац може бити литерал, назив варијабле, џокер (#emph[wildcards]) итд.])#list(list.item[#raw("match") израз ће извршити подударање уз исцрпљивање свих могућност. Уколико
нека могућност није обрађена компајлер ће пријавити грешку.])
#heading(level: 2)[#raw("match") као машина за сортирање новчића] #label("org149456a")
За почетак можемо #raw("match") израз посматрати као аутомат за сортирање новчића.

#figure([#raw(block: true, lang: "rust", "enum Coin {
    Penny,
    Nickel,
    Dime,
    Quarter,
}

fn value_in_cents(coin: Coin) -> u8 {
    match coin {
        Coin::Penny => 1,
        Coin::Nickel => 5,
        Coin::Dime => 10,
        Coin::Quarter => 25,
    }
}")]) #label("org2a38802")

#list(list.item[#raw("match") почиње са изразом произвољног типа.])#list(list.item[У телу се налазе "руке" (#emph[arms]) где свака рука има леву страну која представља
образац за подударање и десну страну (после #raw(block: false, "=>")) која представља кôд који се
евалуира у случају подударања. Руке су раздвојене зарезима.])

#list(list.item[Руке се подударају у редоследу навођења.])#list(list.item[Повратна вредност целог #raw("match") израза биће вредност евалуираног кода руке чије
је подударање успело])

Можемо на десној страни користити произвољан израз па и блок кода.
#figure([#raw(block: true, lang: "rust", "fn value_in_cents(coin: Coin) -> u8 {
    match coin {
        Coin::Penny => {
            println!(\u{22}Lucky penny!\u{22});
            1
        }
        Coin::Nickel => 5,
        Coin::Dime => 10,
        Coin::Quarter => 25,
    }
}")]) #label("org1322052")
#heading(level: 2)[Повезивање имена при подударању (#emph[binding])] #label("org5fb2df7")
#figure([#raw(block: true, lang: "rust", "#[derive(Debug)]
enum UsState {
    Alabama,
    Alaska,
    Arizona,
    // --snip--
}

enum Coin {
    Penny,
    Nickel,
    Dime,
    Quarter(UsState),
}

fn value_in_cents(coin: Coin) -> u8 {
    match coin {
        Coin::Penny => 1,
        Coin::Nickel => 5,
        Coin::Dime => 10,
        Coin::Quarter(state) => {
            println!(\u{22}State quarter from {:?}!\u{22}, state);
            25
        }
    }
}")]) #label("orge744259")
#heading(level: 2)[#raw("match") је исцрпан] #label("orgc4c0b3f")
#figure([#raw(block: true, lang: "rust", "fn value_in_cents(coin: Coin) -> u8 {
    match coin {
        Coin::Penny => 1,
        Coin::Nickel => 5,
        Coin::Dime => 10,
        Coin::Quarter(UsState::Alabama) | Coin::Quarter(UsState::Alaska) => 25
    }
}")]) #label("orga095e28")
#heading(level: 2)[Подударање са #raw("Option<T>") типом] #label("org9415647")
#figure([#raw(block: true, lang: "rust", "fn plus_one(x: Option<i32>) -> Option<i32> {
    match x {
        None => None,
        Some(i) => Some(i + 1),
    }
}

let five = Some(5);
let six = plus_one(five);
let none = plus_one(None);")]) #label("org7d9a73e")

Пошто је #raw("match") исцрпан не можемо заборавити да обрадимо #raw("None") случај.

#figure([#raw(block: true, lang: "rust", "fn plus_one(x: Option<i32>) -> Option<i32> {
    match x {
        Some(i) => Some(i + 1),
    }
}")]) #label("orge62b8f7")

Употреба #raw("Option<T>") API\u{2d}ја. #raw("map") метода. Више речи у поглављу о функционалном програмирању.

#figure([#raw(block: true, lang: "rust", "fn plus_one(x: Option<i32>) -> Option<i32> {
    x.map(|x| x + 1)
}
fn main () {
    let five = Some(5);
    let six = plus_one(five);
    let none = plus_one(None);
    println!(\u{22}{five:?}, {six:?}, {none:?}\u{22})
}")]) #label("org0c3d655")

#raw(block: false, "Some(5), Some(6), None")
#heading(level: 2)[Подразумевана обрада преосталих случајева] #label("orgf93f5fc")
#list(list.item[Желимо на специфичан начин обрадимо само неколико случајева док за све остале
радимо подразумевану обраду.])

#figure([#raw(block: true, lang: "rust", "let dice_roll = 9;
match dice_roll {
    3 => add_fancy_hat(),
    7 => remove_fancy_hat(),
    other => move_player(other),
}

fn add_fancy_hat() {}
fn remove_fancy_hat() {}
fn move_player(num_spaces: u8) {}")]) #label("orgd4f83cb")

#list(list.item[Раст ће нас упозорити ако додамо руку после оне која обрађује све случајеве
јер та се рука никада неће употребити.])

Ако желимо да обрадимо све случајеве али нас вредност не интересује можемо
користити #raw("_").

#figure([#raw(block: true, lang: "rust", "let dice_roll = 9;
match dice_roll {
    3 => add_fancy_hat(),
    7 => remove_fancy_hat(),
    _ => reroll(),
}

fn add_fancy_hat() {}
fn remove_fancy_hat() {}
fn reroll() {}")]) #label("org74315cb")
#heading(level: 2)[Распакивање (#emph[Destructuring])] #label("orge7a4f7c")
#heading(level: 3)[Распакивање торки] #label("orgf5b8ede")
#figure([#raw(block: true, lang: "rust", "fn main() {
    let triple = (0, -2, 3);
    // TODO ^ Try different values for `triple`

    println!(\u{22}Tell me about {:?}\u{22}, triple);
    // Match can be used to destructure a tuple
    match triple {
        // Destructure the second and third elements
        (0, y, z) => println!(\u{22}First is `0`, `y` is {:?}, and `z` is {:?}\u{22}, y, z),
        (1, ..)  => println!(\u{22}First is `1` and the rest doesn't matter\u{22}),
        (.., 2)  => println!(\u{22}last is `2` and the rest doesn't matter\u{22}),
        (3, .., 4)  => println!(\u{22}First is `3`, last is `4`, and the rest doesn't matter\u{22}),
        // `..` can be used to ignore the rest of the tuple
        _      => println!(\u{22}It doesn't matter what they are\u{22}),
        // `_` means don't bind the value to a variable
    }
}")]) #label("org22711bf")
#heading(level: 3)[Распакивање исечака] #label("orgc08061c")
#figure([#raw(block: true, lang: "rust", "fn main() {
    let array = [4, -2, 6];

    match array {
        [0, second, third] =>
            println!(\u{22}array[0] = 0, array[1] = {}, array[2] = {}\u{22}, second, third),
        [1, _, third] => println!(
            \u{22}array[0] = 1, array[2] = {} and array[1] was ignored\u{22},
            third
        ),
        [-1, second, ..] => println!(
            \u{22}array[0] = -1, array[1] = {} and all the other ones were ignored\u{22},
            second
        ),
        [3, second, tail @ ..] => println!(
            \u{22}array[0] = 3, array[1] = {} and the other elements were {:?}\u{22},
            second, tail
        ),
        [first, middle @ .., last] => println!(
            \u{22}array[0] = {}, middle = {:?}, array[2] = {}\u{22},
            first, middle, last
        ),
    }
}")]) #label("orge556352")

#raw(block: false, "array[0] = 4, middle = [-2], array[2] = 6")
#heading(level: 3)[Распакивање енумерација] #label("org3f65196")
#figure([#raw(block: true, lang: "rust", "#[allow(dead_code)]
enum Color {
    Red,
    Blue,
    Green,
    RGB(u32, u32, u32),
    HSV(u32, u32, u32),
    HSL(u32, u32, u32),
    CMY(u32, u32, u32),
    CMYK(u32, u32, u32, u32),
}
fn main() {
    let color = Color::RGB(122, 17, 40);
    println!(\u{22}What color is it?\u{22});
    match color {
        Color::Red   => println!(\u{22}The color is Red!\u{22}),
        Color::Blue  => println!(\u{22}The color is Blue!\u{22}),
        Color::Green => println!(\u{22}The color is Green!\u{22}),
        Color::RGB(r, g, b) =>
            println!(\u{22}Red: {}, green: {}, and blue: {}!\u{22}, r, g, b),
        Color::HSV(h, s, v) =>
            println!(\u{22}Hue: {}, saturation: {}, value: {}!\u{22}, h, s, v),
        Color::HSL(h, s, l) =>
            println!(\u{22}Hue: {}, saturation: {}, lightness: {}!\u{22}, h, s, l),
        Color::CMY(c, m, y) =>
            println!(\u{22}Cyan: {}, magenta: {}, yellow: {}!\u{22}, c, m, y),
        Color::CMYK(c, m, y, k) =>
            println!(\u{22}Cyan: {}, magenta: {}, yellow: {}, key (black): {}!\u{22}, c, m, y, k),
    }
}")]) #label("org9d7c615")
#heading(level: 3)[Распакивање референци] #label("org2143290")
#figure([#raw(block: true, lang: "rust", "fn main() {
    let reference = &4;

    match reference {
        &val => println!(\u{22}Got a value via destructuring: {:?}\u{22}, val),
    }
    match *reference {
        val => println!(\u{22}Got a value via dereferencing: {:?}\u{22}, val),
    }
    let _not_a_reference = 3;

    let ref _is_a_reference = 3;

    let value = 5;
    let mut mut_value = 6;
    match value {
        ref r => println!(\u{22}Got a reference to a value: {:?}\u{22}, r),
    }
    match mut_value {
        ref mut m => {
            *m += 10;
            println!(\u{22}We added 10. `mut_value`: {:?}\u{22}, m);
        },
    }
}")]) #label("orgbefad18")

#raw(block: false, "Got a value via destructuring: 4
Got a value via dereferencing: 4
Got a reference to a value: 5
We added 10. `mut_value`: 16")
#heading(level: 3)[Распакивање структура] #label("orgf84d577")
#figure([#raw(block: true, lang: "rust", "fn main() {
    struct Foo {
        x: (u32, u32),
        y: u32,
    }

    let foo = Foo { x: (1, 2), y: 3 };
    match foo {
        Foo { x: (1, b), y } => println!(\u{22}First of x is 1, b = {},  y = {} \u{22}, b, y),

        // you can destructure structs and rename the variables,
        // the order is not important
        Foo { y: 2, x: i } => println!(\u{22}y is 2, i = {:?}\u{22}, i),

        // and you can also ignore some variables:
        Foo { y, .. } => println!(\u{22}y = {}, we don't care about x\u{22}, y),
        // this will give an error: pattern does not mention field `x`
        //Foo { y } => println!(\u{22}y = {}\u{22}, y),
    }
}")]) #label("orged51e76")
#heading(level: 2)[#raw("if let") kontrola toka] #label("org6dc5de5")
#raw("if let") нам омогућава комбинацију #raw("if") и #raw("let") исказа у мање опширан исказ за обраду
само једног случаја поклапања и игнорисање осталих.

#figure([#raw(block: true, lang: "rust", "let config_max = Some(3u8);
match config_max {
    Some(max) => println!(\u{22}The maximum is configured to be {}\u{22}, max),
    _ => (),
}")]) #label("orgcd979bf")

Ово можемо концизније исказати са:

#figure([#raw(block: true, lang: "rust", "let config_max = Some(3u8);
if let Some(max) = config_max {
    println!(\u{22}The maximum is configured to be {}\u{22}, max);
}")]) #label("org687e909")

#list(list.item[Губимо исцрпност #raw("match") израза.])#list(list.item[Синтаксни шећер у ситуацијама када желимо да игноришемо остале могућности.])
#heading(level: 2)[Поништиви и непоништиви обрасци] #label("orgbae5dbe")
Обрасци за подударање #link("https://doc.rust-lang.org/book/ch18-02-refutability.html")[могу имати две форме] #footnote(link("https://doc.rust-lang.org/book/ch18-02-refutability.html")): поништив (#emph[refutable]) и непоништив
(#emph[irrefutable]). Образац који увек мора успети (нпр. #raw("let x = 5;")) је непоништив.
Образац који не мора да успе увек је поништив (нпр. #raw("if let Some(x) = a_value")
неће успети за #raw(block: false, "a_value==None")).

Параметри функција, #raw("let") искази и #raw("for") петље прихватају само непоништиве обрасце
јер програм не може урадити ништа смислено уколико подударање не успе.

#raw("if let") и #raw("while let") прихватају и поништиве и непоништиве обрасце али ће нас
компајлер упозорити уколико користимо непоништиве.

Можемо користити и #raw("else") грану. Следеће је еквивалентно.

#figure([#raw(block: true, lang: "rust", "let mut count = 0;
match coin {
    Coin::Quarter(state) => println!(\u{22}State quarter from {:?}!\u{22}, state),
    _ => count += 1,
}")]) #label("orge7a9c8b")

#figure([#raw(block: true, lang: "rust", "let mut count = 0;
if let Coin::Quarter(state) = coin {
    println!(\u{22}State quarter from {:?}!\u{22}, state);
} else {
    count += 1;
}")]) #label("org7782479")
#heading(level: 2)[#raw("let else")] #label("org6911b23")
Омогућава употребу поништивих образаца у исказима доделе. Уколико додела не
успева можемо дивергирати са #raw("else") граном (нпр. #raw("break"), #raw("return"), #raw("panic!")).

#figure([#raw(block: true, lang: "rust", "use std::str::FromStr;

fn get_count_item(s: &str) -> (u64, &str) {
    let mut it = s.split(' ');
    let (Some(count_str), Some(item)) = (it.next(), it.next()) else {
        panic!(\u{22}Can't segment count item pair: '{s}'\u{22});
    };
    let Ok(count) = u64::from_str(count_str) else {
        panic!(\u{22}Can't parse integer: '{count_str}'\u{22});
    };
    (count, item)
}

assert_eq!(get_count_item(\u{22}3 chairs\u{22}), (3, \u{22}chairs\u{22}));")]) #label("org175715d")
#heading(level: 2)[#raw("while let")] #label("orgb44faff")
Слично као #raw("if let") и #raw("while let") чини одређене конструкције са подударањем образаца
језгровитије.

На пример, ако имамо нешто попут:
#figure([#raw(block: true, lang: "rust", "// Make `optional` of type `Option<i32>`
let mut optional = Some(0);

// Repeatedly try this test.
loop {
    match optional {
        // If `optional` destructures, evaluate the block.
        Some(i) => {
            if i > 9 {
                println!(\u{22}Greater than 9, quit!\u{22});
                optional = None;
            } else {
                println!(\u{22}`i` is `{:?}`. Try again.\u{22}, i);
                optional = Some(i + 1);
            }
        },
        // Quit the loop when the destructure fails:
        _ => { break; }
    }
}")]) #label("orgc7d4de2")

То можемо написати као:
#figure([#raw(block: true, lang: "rust", "fn main() {
    // Make `optional` of type `Option<i32>`
    let mut optional = Some(0);

    // This reads: \u{22}while `let` destructures `optional` into
    // `Some(i)`, evaluate the block (`{}`). Else `break`.
    while let Some(i) = optional {
        if i > 9 {
            println!(\u{22}Greater than 9, quit!\u{22});
            optional = None;
        } else {
            println!(\u{22}`i` is `{:?}`. Try again.\u{22}, i);
            optional = Some(i + 1);
        }
    }
}")]) #label("org36f2736")
#heading(level: 1)[Паметни поинтери (#emph[Smart Pointers]) \u{2d} први део] #label("org14c4d22")
#heading(level: 2)[#raw("Box<T>")] #label("org9bcfbad")
#list(list.item[Најједноставнији паметни поинтер.])#list(list.item[Слично обичној референци али подаци се чувају на хипу.])#list(list.item[Перформансе сличне обичним референцама, осим алокације хип меморије. Али
такође нема додатних могућности.])
#heading(level: 3)[Ситуације у којима се користи #raw("Box<T>")] #label("orgdf007cb")
#enum(enum.item(1)[Када имамо тип чија величина не може да се утврди у време компајлирања а
желимо да га користимо у контексту где се величина мора знати. Нпр. као
локалну варијаблу.],
enum.item(2)[Када имамо тип који чува већу количину података и не желимо да се при
премештању власништва подаци копирају.],
enum.item(3)[Када желимо поседовати тип и није нам битно који је конкретан тип већ само
које особине имплементира.],
)
#heading(level: 3)[#raw("Box<T>") употреба] #label("org3394792")
#figure([#raw(block: true, lang: "rust", "fn main() {
    let b = Box::new(5);
    println!(\u{22}b = {}\u{22}, b);
}")]) #label("org352359c")

#raw(block: false, "b = 5")
#heading(level: 3)[Употреба у рекурзивним типовима] #label("org26142f1")
#list(list.item[#raw("Cons") листе. Из LISP\u{2d}a. Креирање листе употребом парова.
#figure([#raw(block: true, lang: "lisp", "(1, (2, (3, Nil)))")]) #label("org81bd277")])
#heading(level: 3)[Покушај креирања] #label("org559ba3c")
#figure([#raw(block: true, lang: "rust", "enum List {
    Cons(i32, List),
    Nil,
}
use List::{Cons, Nil};

fn main() {
    let list = Cons(1, Cons(2, Cons(3, Nil)));
}")]) #label("orgcc3bf9f")

#figure([#raw(block: true, lang: "text", "error[E0072]: recursive type `List` has infinite size
 --> src/main.rs:2:1
  |
2 | enum List {
  | ^^^^^^^^^
3 |     Cons(i32, List),
  |               ---- recursive without indirection
  |
help: insert some indirection (e.g., a `Box`, `Rc`, or `&`) to break the cycle
  |
3 |     Cons(i32, Box<List>),
  |               ++++    +

For more information about this error, try `rustc --explain E0072`.
error: could not compile `cargoXtBWbE` (bin \u{22}cargoXtBWbE\u{22}) due to previous error")]) #label("orgddf9c9f")

#list(list.item[Величина #raw("List") типа је бесконачна. Компајлер предлаже употребу индирекције кроз #raw("Box").])
#heading(level: 3)[Како компајлер рачуна величину типа?] #label("org53460d5")
#figure([#raw(block: true, lang: "rust", "enum Message {
    Quit,
    Move { x: i32, y: i32 },
    Write(String),
    ChangeColor(i32, i32, i32),
}")]) #label("orge8d8b66")

Величина типа је величина највеће алтернативе.

Како се рачуна величина #raw("List") типа?

#figure([#raw(block: true, lang: "rust", "enum List {
    Cons(i32, List),
    Nil,
}
use List::{Cons, Nil};")]) #label("orgc12f98b")

#figure([#image(sys.inputs.file-6)]) #label("orgc4e6213")
#heading(level: 3)[Преправка #raw("List") типа да користи #raw("Box<T>")] #label("org0f83fb6")
#figure([#raw(block: true, lang: "rust", "enum List {
    Cons(i32, Box<List>),
    Nil,
}

use crate::List::{Cons, Nil};

fn main() {
    let list = Cons(1, Box::new(Cons(2, Box::new(Cons(3, Box::new(Nil))))));
}")]) #label("org0210ab9")

#figure([#image(sys.inputs.file-7)]) #label("orgc1de7e1")

#list(list.item[Величина #raw("Box<T>") типа је фиксна и позната у време компајлирања. Садржи само
адресу садржаја на хипу.])
#heading(level: 2)[Употреба паметних поинтера као обичних референци (#emph[Deref] особина)] #label("org19b53ef")
#list(list.item[Типови који имплементирају #raw("Deref") редефинишу оператор #raw("*").])#list(list.item[Имплементацијом ове особине произвољни типови се могу третирати као референце.])
#heading(level: 3)[Употреба #raw("Box<T>") као референце] #label("org4ccdae7")
#figure([#raw(block: true, lang: "rust", "fn main() {
    let x = 5;
    let y = Box::new(x);

    assert_eq!(5, x);
    assert_eq!(5, *y);
}")]) #label("orgdbd8793")
#heading(level: 3)[Дефинисање корисничког паметног поинтера] #label("org67b2b15")
#figure([#raw(block: true, lang: "rust", "struct MyBox<T>(T);

impl<T> MyBox<T> {
    fn new(x: T) -> MyBox<T> {
        MyBox(x)
    }
}
fn main() {
    let x = 5;
    let y = MyBox::new(x);

    assert_eq!(5, x);
    assert_eq!(5, *y);
}")]) #label("org81e1871")

#figure([#raw(block: true, lang: "text", "error[E0614]: type `MyBox<{integer}>` cannot be dereferenced
  --> src/main.rs:14:19
   |
14 |     assert_eq!(5, *y);
   |                   ^^

For more information about this error, try `rustc --explain E0614`.
error: could not compile `cargoEj7N5h` (bin \u{22}cargoEj7N5h\u{22}) due to previous error")]) #label("orgaa5204a")
#heading(level: 3)[Имплементација #raw("Deref") особине] #label("orgc4a22a5")
#figure([#raw(block: true, lang: "rust", "use std::ops::Deref;

impl<T> Deref for MyBox<T> {
    type Target = T;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}")]) #label("org790ea3b")

#list(list.item[#raw("Target") је придружени тип (#emph[Associated type]) особине #raw("Deref").])#list(list.item[#raw("deref") враћа референцу на #raw("Target") тип.])#list(list.item[Приликом дереференцирања, вредност није обична референца, позива се #raw("deref")
уколико тип имплементира #raw("Deref") и враћена референца се затим дереференцира на
стандардни начин. Компајлер у позадини извршава ово:
#figure([#raw(block: true, lang: "rust", "*(y.deref())")]) #label("orga5985a8")])

#list(list.item[Зашто #raw("deref") враћа референцу на #raw("Target") тип а не директно вредност?])

Јер би дошло до премештања вредности из поинтера а то не желимо да се деси.
Желимо вредност само да позајмимо.
#heading(level: 3)[Имплицитна #raw("Deref") коерција] #label("org2068bd8")
#list(list.item[#raw("Deref") коерција представља имплицитну конверзију референци на тип који
имплементира #raw("Deref") у референцу на његов #raw("Target") тип приликом позива функција и
метода.])#list(list.item[Додато у језик да програмери не би морали да пишу превише експлицитних
референцирања и дереференцирања.])#list(list.item[На пример, тип #raw("&String") se имплицитно конвертује у #raw("&str") jer у стандардној
библиотеци постоји следећа имплементација:

#figure([#raw(block: true, lang: "rust", "impl ops::Deref for String {
      type Target = str;

      #[inline]
      fn deref(&self) -> &str {
          unsafe { str::from_utf8_unchecked(&self.vec) }
      }
  }")]) #label("orgcc40cf9")])
#heading(level: 3)[#raw("Deref") коерција типа #raw("MyBox")] #label("org68cbe23")
#figure([#raw(block: true, lang: "rust", "fn hello(name: &str) {
    println!(\u{22}Hello, {name}!\u{22});
}

fn main() {
    let m = MyBox::new(String::from(\u{22}Rust\u{22}));
    hello(&m);
}")]) #label("orgb7db894")

#list(list.item[Ово је могуће јер се конвертује #raw("&MyBox<String>") у #raw("&String") и затим се конвертује
#raw("&String") u #raw("&str") на основу имплементације у стандардној библиотеци.])#list(list.item[Раст ће позвати потребан број пута #raw("deref") ако постоји ланац конверзије који ће
довести до траженог типа.])#list(list.item[Због овога је боље користити #raw("&str") уместо #raw("&String") у листи параметара функције.
Функција ће моћи да се користи и за #raw("&str") и за све друге типове који се
имплицитном коерцијом могу превести у #raw("&str").])

Када Раст не би имплементирао имплицитну коерцију морали бисмо ово да пишемо:

#figure([#raw(block: true, lang: "rust", "fn main() {
    let m = MyBox::new(String::from(\u{22}Rust\u{22}));
    hello(&(*m)[..]);
}")]) #label("org0bc9cbc")
#heading(level: 2)[Ослобађање ресурса употребом #raw("Drop") особине] #label("orge8dd0c8")
#list(list.item[#raw("Drop") је друга особина битна за паметне поинтере.])#list(list.item[Ако тип имплементира #raw("Drop") тада ће компајлер позвати #raw("drop") методу приликом
изласка вредности из опсега важења.])#list(list.item[На пример, #raw("Box<T>") имплементира #raw("Drop") да би деалоцирао хип меморију приликом
изласка из опсега важења.])
#heading(level: 3)[Пример] #label("org28c97ca")
#figure([#raw(block: true, lang: "rust", "struct CustomSmartPointer {
    data: String,
}

impl Drop for CustomSmartPointer {
    fn drop(&mut self) {
        println!(\u{22}Dropping CustomSmartPointer with data `{}`!\u{22}, self.data);
    }
}

fn main() {
    let c = CustomSmartPointer {
        data: String::from(\u{22}my stuff\u{22}),
    };
    let d = CustomSmartPointer {
        data: String::from(\u{22}other stuff\u{22}),
    };
    println!(\u{22}CustomSmartPointers created.\u{22});
}")]) #label("org7282f79")

#raw(block: false, "CustomSmartPointers created.
Dropping CustomSmartPointer with data `other stuff`!
Dropping CustomSmartPointer with data `my stuff`!")
#heading(level: 2)[Дељено власништво кроз бројање референци \u{2d} #raw("Rc<T>")] #label("org91b0f58")
#heading(level: 3)[Мотивација] #label("org30e9c71")
#list(list.item[Постоје случајеви када је потребно имати више власника за неку вредност.])

#figure([#image(sys.inputs.file-8)]) #label("org5967699")
#heading(level: 3)[Покушај креирања дељене листе] #label("orgc2756fb")
#figure([#raw(block: true, lang: "rust", "enum List {
    Cons(i32, Box<List>),
    Nil,
}

use crate::List::{Cons, Nil};

fn main() {
    let a = Cons(5, Box::new(Cons(10, Box::new(Nil))));
    let b = Cons(3, Box::new(a));
    let c = Cons(4, Box::new(a));
}")]) #label("org380e6d8")

#figure([#raw(block: true, lang: "text", "error[E0382]: use of moved value: `a`
  --> src/main.rs:12:30
   |
10 |     let a = Cons(5, Box::new(Cons(10, Box::new(Nil))));
   |         - move occurs because `a` has type `List`, which does not implement the `Copy` trait
11 |     let b = Cons(3, Box::new(a));
   |                              - value moved here
12 |     let c = Cons(4, Box::new(a));
   |                              ^ value used here after move

For more information about this error, try `rustc --explain E0382`.
error: could not compile `cargo1mCqK5` (bin \u{22}cargo1mCqK5\u{22}) due to previous error")]) #label("org21fa18f")
#heading(level: 3)[Решење \u{2d} употреба #raw("Rc<T>") паметног поинтера] #label("org1ff59d3")
#list(list.item[Бројање референци \u{2d} #emph[reference counting].])#list(list.item[Додавањем новог власника бројач се увећава за један.])#list(list.item[Када власник изађе из опсега бројач се умањује за један.])#list(list.item[Када бројач постане 0 врши се деалокација вредности са хипа.])
#heading(level: 3)[Дељене листе употребом #raw("Rc<T>")] #label("org8a144ba")
#figure([#raw(block: true, lang: "rust", "enum List {
    Cons(i32, Rc<List>),
    Nil,
}

use crate::List::{Cons, Nil};
use std::rc::Rc;

fn main() {
    let a = Rc::new(Cons(5, Rc::new(Cons(10, Rc::new(Nil)))));
    let b = Cons(3, Rc::clone(&a));
    let c = Cons(4, Rc::clone(&a));
}")]) #label("org40e2047")

#list(list.item[#raw("Rc::clone") не клонира вредност већ само увећава бројач.])#list(list.item[Могли би писати и #raw("a.clone()") али је конвенција да се пише #raw("Rc::clone(&a)") јер
овде не долази заиста до клонирања па је лакше уочити оваква места у коду.])
#heading(level: 3)[Тестирање бројача] #label("orgb2f8c59")
#figure([#raw(block: true, lang: "rust", "enum List {
    Cons(i32, Rc<List>),
    Nil,
}
use std::rc::Rc;
use crate::List::{Cons, Nil};
fn main() {
    let a = Rc::new(Cons(5, Rc::new(Cons(10, Rc::new(Nil)))));
    println!(\u{22}count after creating a = {}\u{22}, Rc::strong_count(&a));
    let b = Cons(3, Rc::clone(&a));
    println!(\u{22}count after creating b = {}\u{22}, Rc::strong_count(&a));
    {
        let c = Cons(4, Rc::clone(&a));
        println!(\u{22}count after creating c = {}\u{22}, Rc::strong_count(&a));
    }
    println!(\u{22}count after c goes out of scope = {}\u{22}, Rc::strong_count(&a));
}")]) #label("org47701f3")

#raw(block: false, "count after creating a = 1
count after creating b = 2
count after creating c = 3
count after c goes out of scope = 2")
#heading(level: 3)[Финалне напомене] #label("orga3c8a59")
#list(list.item[#raw("Rc<T>") није сигуран у контексту нити (#emph[not threadsafe]). Тип који јесте је
#raw("Arc<T>") \u{2d} #emph[atomic reference counting].])#list(list.item[Овај тип има додатно оптерећење јер мора да ради закључавање. Зато у контексту
једне нити треба увек користити #raw("Rc<T>").])
#heading(level: 1)[Колекције] #label("org7db3ad2")
#heading(level: 2)[Вектор (#raw("Vec<T>"))] #label("org19b4eb4")
#heading(level: 3)[Шта је вектор?] #label("org0b621ee")
#list(list.item[Линеарна структура која омогућава смештање података у суседне локације у меморији.])#list(list.item[Хомогена структура. Елементи морају бити истог типа.])
#heading(level: 3)[Креирање новог вектора] #label("org57c98a5")
#figure([#raw(block: true, lang: "rust", "let v: Vec<i32> = Vec::new();")]) #label("org6554889")

#list(list.item[Морали смо додати анотацију типа јер је вектор генерички тип и компајлер не
зна тип елемента које ћемо смештати у вектор.])#list(list.item[Ако креирамо вектор са већ постојећим елементима чешће користимо #raw("vec!") макро:

#figure([#raw(block: true, lang: "rust", "let v = vec![1, 2, 3];")]) #label("org19892ce")])
#heading(level: 3)[Ажурирање вектора] #label("org176a289")
#figure([#raw(block: true, lang: "rust", "let mut v = Vec::new();
v.push(5);
v.push(6);
v.push(7);
v.push(8);")]) #label("orga824537")
#heading(level: 3)[Читање елемената вектора] #label("orgfbd2dc4")
#list(list.item[Индексни приступ или употреба #raw("get") методе.])

#figure([#raw(block: true, lang: "rust", "let v = vec![1, 2, 3, 4, 5];

let third: &i32 = &v[2];
println!(\u{22}The third element is {third}\u{22});

let third: Option<&i32> = v.get(2);
match third {
    Some(third) => println!(\u{22}The third element is {third}\u{22}),
    None => println!(\u{22}There is no third element.\u{22}),
}")]) #label("org14c5f06")

#list(list.item[Индексни приступ може да доведе до прекида програма уколико индексирамо ван
опсега валидних индекса.])#list(list.item[#raw("get") метода увек успева и враћа #raw("Option<&T>").])

#figure([#raw(block: true, lang: "rust", "let v = vec![1, 2, 3, 4, 5];

let does_not_exist = &v[100];
let does_not_exist = v.get(100);")]) #label("org3cc38bc")

#list(list.item[Први индексни приступ ће изазвати панику.])#list(list.item[Приступ са #raw("get") би вратио #raw("None").])
#heading(level: 3)[Провера позајмљивања у контексту вектора] #label("org7437e67")
#list(list.item[#link(label("org9562f47"))[Правила позајмљивања] важе и у контексту вектора. Не можемо истовремено имати
промењиву и непромењиву референцу на елемент вектора.])

#figure([#raw(block: true, lang: "rust", "let mut v = vec![1, 2, 3, 4, 5];
let first = &v[0];
v.push(6);
println!(\u{22}The first element is: {first}\u{22});")]) #label("org456c858")

Имамо референцу на први елемент вектора а покушавамо промењивом референцом да
додамо на крај. Ово делује као да би било безбедно.

#emph[Зашто Раст не дозвољава овакве операције?]

Приликом додавања новог елемента може доћи до попуњавања текуће алоциране зоне и
алоцирања нове зоне уз премештање свих елемената на нову локацију чиме би све
текуће референце постале невалидне. Правило позајмљивања спречава овакве грешке.
#heading(level: 3)[Итерација преко елемената вектора] #label("org70a172d")
#figure([#raw(block: true, lang: "rust", "let v = vec![100, 32, 57];
for i in &v {
    println!(\u{22}{i}\u{22});
}")]) #label("orgc7c1684")

#raw(block: false, "100
32
57")


Пошто итерирамо преко позајмљене вредности #raw("&v"), тип од #raw("i") ће бити позајмљен
(#raw("&u32")). Уколико би итерирали преко поседоване вредности #raw("for i in v") тада би сви
елементи из вектора били премештени (тј. конзумирани) од стране #raw("for") петље и не
би могли више да им приступимо.

#figure([#raw(block: true, lang: "rust", "let mut v = vec![100, 32, 57];
for i in &mut v {
    *i += 50;
}
println!(\u{22}{v:?}\u{22});")]) #label("org5f7a478")

#raw(block: false, "[150, 82, 107]")
#heading(level: 3)[Смештање елемената различитог типа] #label("org3978337")
#list(list.item[Вектор може садржати само елементе истог типа.])#list(list.item[Уколико желимо да сместимо елементе различитог типа користимо енумерације.])

#figure([#raw(block: true, lang: "rust", "#[derive(Debug)]
enum SpreadsheetCell {
    Int(i32),
    Float(f64),
    Text(String),
}
let row = vec![
    SpreadsheetCell::Int(3),
    SpreadsheetCell::Text(String::from(\u{22}blue\u{22})),
    SpreadsheetCell::Float(10.12),
];
println!(\u{22}{row:?}\u{22});")]) #label("org651cf77")

#raw(block: false, "[Int(3), Text(\u{22}blue\u{22}), Float(10.12)]")


#list(list.item[Употреба енумерација осигурава да ћемо обрадити све могуће случајеве нпр. #raw("match") изразом.])
#heading(level: 3)[Ослобађање елемената вектора] #label("org0005e5d")
#list(list.item[Вектор ће деалоцирати своје елементе када власник напусти опсег важења.])

#figure([#raw(block: true, lang: "rust", "{
    let v = vec![1, 2, 3, 4];

    // do stuff with v
} // <- v goes out of scope and is freed here")]) #label("org8175320")
#heading(level: 2)[#raw("String")] #label("orgd61fe64")
#heading(level: 3)[Шта је стринг?] #label("orgc3e7ecc")
#list(list.item[Раст има само један тип стринга подржан директно од стране језика \u{2d} #raw("str") који
се обично користи у позајмљеној форми #raw("&str") \u{2d} стринг исечак који представља
референцу на UTF\u{2d}8 енкодован садржај.])#list(list.item[Тип #raw("String"), дефинисан у Раст стандардној библиотеци, је растући, промењиви,
поседовани UTF\u{2d}8 енкодовани стринг тип.])
#heading(level: 3)[Креирање новог стринга] #label("org959588a")
#list(list.item[Нова празна #raw("String") вредност се креира на следећи начин:])
#figure([#raw(block: true, lang: "rust", "let mut s = String::new();")]) #label("orge7809ca")

Обично користимо #raw("to_string") методу типа који имплементира #raw("Display") особину да би
добили почетну вреност стринга.

#figure([#raw(block: true, lang: "rust", "let data = \u{22}initial contents\u{22};

let s = data.to_string();

// the method also works on a literal directly:
let s = \u{22}initial contents\u{22}.to_string();")]) #label("org6a8672a")

Такође, можемо користити #raw("String::from"):
#figure([#raw(block: true, lang: "rust", "let s = String::from(\u{22}initial contents\u{22});")]) #label("orgb74737f")
#heading(level: 3)[Стринг може да садржи произвољну UTF\u{2d}8 вредност] #label("orgb436cef")
#figure([#raw(block: true, lang: "rust", "let hello = String::from(\u{22}السلام عليكم\u{22});
let hello = String::from(\u{22}Dobrý den\u{22});
let hello = String::from(\u{22}Hello\u{22});
let hello = String::from(\u{22}שָׁלוֹם\u{22});
let hello = String::from(\u{22}नमस्ते\u{22});
let hello = String::from(\u{22}こんにちは\u{22});
let hello = String::from(\u{22}안녕하세요\u{22});
let hello = String::from(\u{22}你好\u{22});
let hello = String::from(\u{22}Olá\u{22});
let hello = String::from(\u{22}Здравствуйте\u{22});
let hello = String::from(\u{22}Hola\u{22});")]) #label("org5269bf2")
#heading(level: 3)[Ажурирање стринга] #label("org2b69467")
#figure([#raw(block: true, lang: "rust", "let mut s = String::from(\u{22}foo\u{22});
s.push_str(\u{22}bar\u{22});")]) #label("orgf88d999")

#figure([#raw(block: true, lang: "rust", "let mut s1 = String::from(\u{22}foo\u{22});
let s2 = \u{22}bar\u{22};
s1.push_str(s2);
println!(\u{22}s2 is {s2}\u{22});")]) #label("orgc8cc562")

#raw("s2") је позајмљено и може да се користи после додавања.

#list(list.item[Додавање једног карактера:
#figure([#raw(block: true, lang: "rust", "let mut s = String::from(\u{22}lo\u{22});
    s.push('l');")]) #label("org9afc11a")])
#heading(level: 3)[Употреба #raw("+") оператора] #label("orgf0b368e")
#figure([#raw(block: true, lang: "rust", "let s1 = String::from(\u{22}Hello, \u{22});
let s2 = String::from(\u{22}world!\u{22});
let s3 = s1 + &s2; // note s1 has been moved here and can no longer be used")]) #label("org96da3d2")

#raw("+") оператор конзумира први операнд тако да у претходном примеру #raw("s1") варијабла не
важи после задње линије.

#raw("+") оператор интерно користи #raw("add") методу чија сигнатура је нешто попут:

#figure([#raw(block: true, lang: "rust", "fn add(self, s: &str) -> String {")]) #label("org5b9be18")

Обратите пажњу да је други параметар типа #raw("&str") док је прослеђен тип #raw("&String").
Компајлер ово прихвата. Зашто?

Користи се техника #link("https://doc.rust-lang.org/std/ops/trait.Deref.html#more-on-deref-coercion")[Deref coercion] #footnote(link("https://doc.rust-lang.org/std/ops/trait.Deref.html#more-on-deref-coercion")), јер #raw("String") имплементира особину #raw("Deref<Target=str>").
#heading(level: 3)[Употреба #raw("format!") макроа] #label("org9b275fb")
Уместо:
#figure([#raw(block: true, lang: "rust", "let s1 = String::from(\u{22}tic\u{22});
let s2 = String::from(\u{22}tac\u{22});
let s3 = String::from(\u{22}toe\u{22});

let s = s1 + \u{22}-\u{22} + &s2 + \u{22}-\u{22} + &s3;")]) #label("org99fbf4f")

Можемо писати:
#figure([#raw(block: true, lang: "rust", "let s1 = String::from(\u{22}tic\u{22});
let s2 = String::from(\u{22}tac\u{22});
let s3 = String::from(\u{22}toe\u{22});

let s = format!(\u{22}{s1}-{s2}-{s3}\u{22});")]) #label("org3bc85a5")
#heading(level: 3)[Индексни приступ унутар стринга] #label("orgeb1c874")
#figure([#raw(block: true, lang: "rust", "let s1 = String::from(\u{22}hello\u{22});
let h = s1[0];")]) #label("org028095b")

#emph[Зашто?]
#heading(level: 3)[Чување стринга у меморији] #label("org81c53bb")
#figure([#raw(block: true, lang: "rust", "let hello = String::from(\u{22}Hola\u{22});
println!(\u{22}{}\u{22}, hello.len());")]) #label("orgeeefee9")

#raw(block: false, "4")


#figure([#raw(block: true, lang: "rust", "let hello = String::from(\u{22}Здраво\u{22});
println!(\u{22}{}\u{22}, hello.len());   // Дужина није 6 већ 12!")]) #label("org77d2975")

#raw(block: false, "12")


Шта би требао да врати елемент на одређеном индексу?
#heading(level: 3)[Различити погледи на стринг] #label("org987ad66")
Три начина посматрања стринга: низ бајтова, низ скалара и низ графем кластера.

На пример, хинди реч "“नम�ते" ће у меморији бити следећи низ бајтова:
Ако исту реч посматрамо као низ скалара или карактера (Раст #raw("char") тип) онда имамо
следеће вредности:

Четврти и шести карактер су дијакритици тј. немају смисла сами за себе.

Ако посматрамо исти садржај као графем кластере (најприближније концепту слова)
онда видимо следеће:

#figure([#raw(block: true, lang: "rust", "[\u{22}न\u{22}, \u{22}म\u{22}, \u{22}स्\u{22}, \u{22}ते\u{22}]")]) #label("orgcb627a0")
#heading(level: 3)[Сложеност индексног приступа] #label("orgeffa264")
Додатни разлог зашто не треба дозволити индексни приступ код стрингова јесте
чињеница да индексни приступ увак има сложеност #raw("O(1)") што се код стрингова не
може гарантовати.
#heading(level: 3)[Креирање исечака] #label("orgf851cc8")
Могуће је креирање исечака стрингова с тим да је на програмеру да обезбеди да се
границе исечака налазе на крајевима #raw("char") типа тј. није могуће да играница исечка
буде унутар карактера.

На пример, ово је могуће:
#figure([#raw(block: true, lang: "rust", "let hello = \u{22}Здраво\u{22};
let s = &hello[0..4];
println!(\u{22}{s}\u{22})")]) #label("org65fa30b")

#raw(block: false, "Зд")


Али ово је грешка:
#figure([#raw(block: true, lang: "rust", "let hello = \u{22}Здраво\u{22};
let s = &hello[0..3];
println!(\u{22}{s}\u{22})")]) #label("org31d53a5")
#heading(level: 3)[Итерација преко стрингова] #label("org2e3a460")
Начин да обрадимо све елементе стринга је да итерирамо, при чему имамо две
методе:

#list(list.item[#raw("chars") \u{2d} ако желимо да обрадимо стринг као низ карактера
#figure([#raw(block: true, lang: "rust", "for c in \u{22}Зд\u{22}.chars() {
        println!(\u{22}{c}\u{22});
    }")]) #label("org198fe94")])#list(list.item[#raw("bytes") \u{2d} ако желимо да обрадимо стринг као низ бајтова
#figure([#raw(block: true, lang: "rust", "for b in \u{22}Зд\u{22}.bytes() {
        println!(\u{22}{b}\u{22});
    }")]) #label("org85eb0e0")])
#heading(level: 2)[Хеш мапа (#raw("HashMap<K, V>"))] #label("org531d487")
#heading(level: 3)[Шта је хеш мапа?] #label("org169b262")
#list(list.item[Генеричка, хомогена структура која чува парове кључ\u{2d}вреност.])#list(list.item[У другим језицима се зове још и: хеш табела, речник или асоцијативни низ.])#list(list.item[Корисно у ситацијама када је потребно пронаћи везани податак не по индексу већ
по другој вредности.])
#heading(level: 3)[Креирање хеш мапе] #label("orgdc36f62")
#figure([#raw(block: true, lang: "rust", "use std::collections::HashMap;

let mut scores = HashMap::new();

scores.insert(String::from(\u{22}Blue\u{22}), 10);
scores.insert(String::from(\u{22}Yellow\u{22}), 50);")]) #label("orgf19f014")
#heading(level: 3)[Приступање елементима хеш мапе] #label("org182934d")
#figure([#raw(block: true, lang: "rust", "use std::collections::HashMap;

let mut scores = HashMap::new();

scores.insert(String::from(\u{22}Blue\u{22}), 10);
scores.insert(String::from(\u{22}Yellow\u{22}), 50);

let team_name = String::from(\u{22}Blue\u{22});
let score = scores.get(&team_name).copied().unwrap_or(0);")]) #label("org7b02e8c")

#list(list.item[#raw("get") метода враћа тип #raw("Option<&T>"), дакле #raw("None") вредност ако за дати кључ не
постоји везана вредност. Позивамо #raw("copied") да добијемо #raw("Option<T>") са копираном
вредношћу.])
#heading(level: 3)[Итерација преко парова кључ\u{2d}вредност] #label("org770c4c0")
#figure([#raw(block: true, lang: "rust", "use std::collections::HashMap;

let mut scores = HashMap::new();

scores.insert(String::from(\u{22}Blue\u{22}), 10);
scores.insert(String::from(\u{22}Yellow\u{22}), 50);

for (key, value) in &scores {
    println!(\u{22}{key}: {value}\u{22});
}")]) #label("orgc9d7476")

#raw(block: false, "Yellow: 50
Blue: 10")
#heading(level: 3)[Хеш мапа и власништво] #label("org9fdc2bc")
#list(list.item[Ако тип имплементира #raw("Copy") особину биће копиран у мапу, у супротном биће
премештен и хеш мапа постаје власник.])

#figure([#raw(block: true, lang: "rust", "use std::collections::HashMap;

let field_name = String::from(\u{22}Favorite color\u{22});
let field_value = String::from(\u{22}Blue\u{22});

let mut map = HashMap::new();
map.insert(field_name, field_value);
// field_name and field_value are invalid at this point, try using them and
// see what compiler error you get!")]) #label("org462172e")
#heading(level: 3)[Ажурирање хеш мапе \u{2d} преписивање вредности] #label("org14af1d7")
#figure([#raw(block: true, lang: "rust", "use std::collections::HashMap;

let mut scores = HashMap::new();

scores.insert(String::from(\u{22}Blue\u{22}), 10);
scores.insert(String::from(\u{22}Blue\u{22}), 25);

println!(\u{22}{:?}\u{22}, scores);")]) #label("org436147b")

#raw(block: false, "{\u{22}Blue\u{22}: 25}")
#heading(level: 3)[Ажурирање хеш мапе \u{2d} додавање уклолико кључ не постоји] #label("org62f683b")
#figure([#raw(block: true, lang: "rust", "use std::collections::HashMap;

let mut scores = HashMap::new();
scores.insert(String::from(\u{22}Blue\u{22}), 10);

scores.entry(String::from(\u{22}Yellow\u{22})).or_insert(50);
scores.entry(String::from(\u{22}Blue\u{22})).or_insert(50);

println!(\u{22}{:?}\u{22}, scores);")]) #label("org27e2916")

#raw(block: false, "{\u{22}Yellow\u{22}: 50, \u{22}Blue\u{22}: 10}")


Користимо #raw("Entry API").
#heading(level: 3)[Ажурирање хеш мапе \u{2d} на основу старе вредности] #label("org28249f4")
#figure([#raw(block: true, lang: "rust", "use std::collections::HashMap;

let text = \u{22}hello world wonderful world\u{22};

let mut map = HashMap::new();

for word in text.split_whitespace() {
    let count = map.entry(word).or_insert(0);
    *count += 1;
}

println!(\u{22}{:?}\u{22}, map);")]) #label("org8b0af33")

#raw(block: false, "{\u{22}wonderful\u{22}: 1, \u{22}hello\u{22}: 1, \u{22}world\u{22}: 2}")
#heading(level: 1)[Обрада грешака] #label("orgc7da8ac")
#heading(level: 2)[Категорије грешака у Расту] #label("orgbedb444")
#list(list.item[грешке код којих је могућ опоравак (#emph[recoverable])
#list(list.item[Грешке које очекивано могу да се десе у току рада и које можемо да обрадимо
и наставимо извршавање без нарушавања конзитентности стања програма.])])#list(list.item[грешке код којих опоравак није могућ (#emph[unrecoverable])
#list(list.item[Увек су симптом багова у програму, нпр. читање ван опсега низа.])#list(list.item[Једини логичан поступак је прекид рада програма.])])#list(list.item[Већина језика не прави разлику већ све обрађује на исти начин, најчешће
употребом механизма изузетака.])
#heading(level: 2)[#raw("panic!")] #label("orgb70c9b6")
#list(list.item[Макро који доводи до прекида програма. Позивамо га када програм заврши у стању
у коме није могућ опоравак.])

#figure([#raw(block: true, lang: "rust", "fn main() {
    panic!(\u{22}crash and burn\u{22});
}")]) #label("org2209f47")

#figure([#raw(block: true, lang: "sh", "$ cargo run
   Compiling panic v0.1.0 (file:///projects/panic)
    Finished dev [unoptimized + debuginfo] target(s) in 0.25s
     Running `target/debug/panic`
thread 'main' panicked at 'crash and burn', src/main.rs:2:5
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace")]) #label("orgb90e563")
#heading(level: 2)[#raw("panic!") повратни траг (#emph[backtrace])] #label("orgb3a15ac")
#figure([#raw(block: true, lang: "rust", "fn main() {
    let v = vec![1, 2, 3];

    v[99];
}")]) #label("org8999ed9")

#figure([#raw(block: true, lang: "sh", "$ cargo run
   Compiling panic v0.1.0 (file:///projects/panic)
    Finished dev [unoptimized + debuginfo] target(s) in 0.27s
     Running `target/debug/panic`
thread 'main' panicked at 'index out of bounds: the len is 3 but the index is 99', src/main.rs:4:5
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace")]) #label("orgf2da0e2")

#list(list.item[Читамо линије повратног трага од горе до доле и интересује нас да пронађемо
прво место где се помиње наш код. То је локација која је изазвала прекид.])
#figure([#raw(block: true, lang: "sh", "$ RUST_BACKTRACE=1 cargo run
thread 'main' panicked at 'index out of bounds: the len is 3 but the index is 99', src/main.rs:4:5
stack backtrace:
   0: rust_begin_unwind
             at /rustc/e092d0b6b43f2de967af0887873151bb1c0b18d3/library/std/src/panicking.rs:584:5
   1: core::panicking::panic_fmt
             at /rustc/e092d0b6b43f2de967af0887873151bb1c0b18d3/library/core/src/panicking.rs:142:14
   2: core::panicking::panic_bounds_check
             at /rustc/e092d0b6b43f2de967af0887873151bb1c0b18d3/library/core/src/panicking.rs:84:5
   3: <usize as core::slice::index::SliceIndex<[T]>>::index
             at /rustc/e092d0b6b43f2de967af0887873151bb1c0b18d3/library/core/src/slice/index.rs:242:10
   4: core::slice::index::<impl core::ops::index::Index<I> for [T]>::index
             at /rustc/e092d0b6b43f2de967af0887873151bb1c0b18d3/library/core/src/slice/index.rs:18:9
   5: <alloc::vec::Vec<T,A> as core::ops::index::Index<I>>::index
             at /rustc/e092d0b6b43f2de967af0887873151bb1c0b18d3/library/alloc/src/vec/mod.rs:2591:9
   6: panic::main
             at ./src/main.rs:4:5
   7: core::ops::function::FnOnce::call_once
             at /rustc/e092d0b6b43f2de967af0887873151bb1c0b18d3/library/core/src/ops/function.rs:248:5
note: Some details are omitted, run with `RUST_BACKTRACE=full` for a verbose backtrace.")]) #label("org216e0d9")

У програмском језику Ц, читање ван опсега је недефинисано понашање и компајлер
може да произведе кôд који ради произвољну ствар. Најчешће ће да чита са
локације која се налази иза краја низа што представља грешку #emph[buffer overread]
која доводи до сигурносних пропуста.
#heading(level: 2)[Опоравак од грешке \u{2d} #raw("Result<T,E>")] #label("org1e47cc5")
#list(list.item[Многе грешке су очекиване током нормалног извршавања програма.])#list(list.item[На пример, ако покушамо отварање фајла, он можда не постоји тако да би
опоравак од грешке могао бити његово креирање.])#list(list.item[Код оваквих грешака Раст користи генерички тип #raw("Result<T,E>"):])

#figure([#raw(block: true, lang: "rust", "enum Result<T, E> {
    Ok(T),
    Err(E),
}")]) #label("org7f17a98")
#heading(level: 2)[Отварање фајла] #label("org209c81e")
Фајл: #raw("src/main.rs"):
#figure([#raw(block: true, lang: "rust", "use std::fs::File;

fn main() {
    let greeting_file_result = File::open(\u{22}hello.txt\u{22});
}")]) #label("org823a279")

#list(list.item[Варијабла #raw("greeting_file_result") ће бити типа #raw("Result<std::fs::File,
  std::io::Error>"). Уколико је враћена варијанта #raw("Ok") она ће у себи садржати фајл,
уколико се врати варијанта #raw("Err"), у њој ће бити грешка типа #raw("std::io::Error").])

#list(list.item[У сваком случају морамо обрадити обе варијанте.])
Фајл: #raw("src/main.rs"):
#figure([#raw(block: true, lang: "rust", "use std::fs::File;

fn main() {
    let greeting_file_result = File::open(\u{22}hello.txt\u{22});

    let greeting_file = match greeting_file_result {
        Ok(file) => file,
        Err(error) => panic!(\u{22}Problem opening the file: {:?}\u{22}, error),
    };
}")]) #label("orga13ff1c")
#heading(level: 2)[Препознавање различитих грешака] #label("orgdf3a727")
#list(list.item[Желимо да креирамо фајл уколико не постоји. Морамо да проверимо коју грешку
смо добили.])

#figure([#raw(block: true, lang: "rust", "use std::fs::File;
use std::io::ErrorKind;

fn main() {
    let greeting_file_result = File::open(\u{22}hello.txt\u{22});

    let greeting_file = match greeting_file_result {
        Ok(file) => file,
        Err(error) => match error.kind() {
            ErrorKind::NotFound => match File::create(\u{22}hello.txt\u{22}) {
                Ok(fc) => fc,
                Err(e) => panic!(\u{22}Problem creating the file: {:?}\u{22}, e),
            },
            other_error => {
                panic!(\u{22}Problem opening the file: {:?}\u{22}, other_error);
            }
        },
    };
}")]) #label("orgee7aab5")

#list(list.item[Алтернативно можемо користити API #raw("Result") типа:])

#figure([#raw(block: true, lang: "rust", "use std::fs::File;
use std::io::ErrorKind;

fn main() {
    let greeting_file = File::open(\u{22}hello.txt\u{22}).unwrap_or_else(|error| {
        if error.kind() == ErrorKind::NotFound {
            File::create(\u{22}hello.txt\u{22}).unwrap_or_else(|error| {
                panic!(\u{22}Problem creating the file: {:?}\u{22}, error);
            })
        } else {
            panic!(\u{22}Problem opening the file: {:?}\u{22}, error);
        }
    });
}")]) #label("orge1d6663")
#heading(level: 2)[Пречица #raw("unwrap")] #label("org8449cbf")
#list(list.item[С обзиром да је оваква обрада честа, постоји пречица тако да можемо писати
доста краће:])

#figure([#raw(block: true, lang: "rust", "use std::fs::File;

fn main() {
    let greeting_file = File::open(\u{22}hello.txt\u{22}).unwrap();
}")]) #label("orgc8cae9c")
#heading(level: 2)[Пречица #raw("expect")] #label("org72eb08f")
#list(list.item[Или, уколико желимо да дамо више информација у случају прекида:])

#figure([#raw(block: true, lang: "rust", "use std::fs::File;

fn main() {
    let greeting_file = File::open(\u{22}hello.txt\u{22})
        .expect(\u{22}hello.txt should be included in this project\u{22});
}")]) #label("org6b023b0")
#heading(level: 2)[Пропагација грешака] #label("org8e32e57")
#figure([#raw(block: true, lang: "rust", "use std::fs::File;
use std::io::{self, Read};

fn read_username_from_file() -> Result<String, io::Error> {
    let username_file_result = File::open(\u{22}hello.txt\u{22});

    let mut username_file = match username_file_result {
        Ok(file) => file,
        Err(e) => return Err(e),
    };

    let mut username = String::new();

    match username_file.read_to_string(&mut username) {
        Ok(_) => Ok(username),
        Err(e) => Err(e),
    }
}")]) #label("org82c24c4")

Сада позиваоц може да одлучи како да обради грешку. Нпр. може да:
#list(list.item[прекине програм са #raw("panic!")])#list(list.item[користи подразумевано корисничко име])#list(list.item[пронађе корисничко име на неком другом месту (нпр. из базе података)])
#heading(level: 2)[Пречица за пропагацију грешака \u{2d} оператор #raw("?")] #label("org8313ae1")
#figure([#raw(block: true, lang: "rust", "use std::fs::File;
use std::io::{self, Read};

fn read_username_from_file() -> Result<String, io::Error> {
    let mut username_file = File::open(\u{22}hello.txt\u{22})?;
    let mut username = String::new();
    username_file.read_to_string(&mut username)?;
    Ok(username)
}")]) #label("org06db5a6")

#list(list.item[Оператор #raw("?") елиминише тзв. #emph[boilerplate] код.])#list(list.item[Функција мора да враћа компатибилан тип да би могла да се користи ова пречица.])

Постоји значајна разлика између #raw("?") оператора и #raw("match") израза. #raw("?") оператор ће
аутоматски радити конверзију грешака за све грешке које имплементирају #raw("From")
особину. На пример, ако нека наша грешка #raw("OurError") имплементира конверзију из
#raw("std::io::Error") тако што имамо #raw("impl From<std::io::Error> for OurError") тада можемо
декларисати да наша функција враћа #raw("OurError") и даље користити пречицу #raw("?") на
местима која резултују са #raw("std::io::Error").
#heading(level: 2)[Додатно скраћење кода] #label("org126aaf7")
#list(list.item[Употребом повезаних позива #emph[chain call] можемо додатно поједноставити код:])

#figure([#raw(block: true, lang: "rust", "use std::fs::File;
use std::io::{self, Read};

fn read_username_from_file() -> Result<String, io::Error> {
    let mut username = String::new();

    File::open(\u{22}hello.txt\u{22})?.read_to_string(&mut username)?;

    Ok(username)
}")]) #label("org9d8f841")
#heading(level: 2)[Употреба #raw("?") оператора код #raw("Option") типа] #label("org1493d3e")
#figure([#raw(block: true, lang: "rust", "fn last_char_of_first_line(text: &str) -> Option<char> {
    text.lines().next()?.chars().last()
}")]) #label("org2ffaf03")
#heading(level: 2)[Употреба #raw("?") оператора у функцији #raw("main")] #label("org699b5ec")
#figure([#raw(block: true, lang: "rust", "use std::error::Error;
use std::fs::File;

fn main() -> Result<(), Box<dyn Error>> {
    let greeting_file = File::open(\u{22}hello.txt\u{22})?;

    Ok(())
}")]) #label("org7850539")
#heading(level: 1)[Пакети, сандуци и модули] #label("org656f41f")
#heading(level: 2)[Организација програмског кода] #label("orge027dea")
#list(list.item[Са порастом величине пројекта расте значај организације кода.])#list(list.item[Раст механизми за организацију кода су:
#list(list.item[Пакети])#list(list.item[Сандуци (#emph[crates])])#list(list.item[Модули и кључна реч #raw("use")])#list(list.item[Путање (#emph[paths])])])
#heading(level: 2)[Сандуци (#emph[crates])] #label("org76d64d8")
#list(list.item[Сандук представља најмању количину кода коју Раст компајлер обрађује у једном тренутку.])#list(list.item[Сандук може бити у форми #emph[бинарног сандука] и #emph[библиотечког сандука].])#list(list.item[Бинарни сандук представља програме који могу да се компајлирају и покрену. Ови
сандуци имају функцију #raw("main") која представља улазну тачку.])#list(list.item[Библиотечки сандуци представљају функционалност намењену за дељење са другим пројектима.])#list(list.item[Корен сандука представља почетни фајл од кога Раст компајлер креће, односно
представља коренски модул.])
#heading(level: 2)[Пакети] #label("org1123a7d")
#list(list.item[Пакет представља скуп логички повезаних сандука којима се управља на
јединствен начин.])#list(list.item[Пакет мора имати бар један сандук.])#list(list.item[Пакет може имати произвољно много бинарних сандука али највише један
библиотечки сандук.])
#heading(level: 2)[Креирање пакета] #label("orgc35e342")
#figure([#raw(block: true, lang: "sh", "$ cargo new my-project
     Created binary (application) `my-project` package
$ ls my-project
Cargo.toml
src
$ ls my-project/src
main.rs")]) #label("org05ba6b1")

#list(list.item[Сваки пакет у корену има #raw("Cargo.toml") конфигурациони фајл.])#list(list.item[Према конвенцији корен бинарног сандука је #raw("src/main.rs"), док је корен
библиотечког сандука #raw("src/lib.rs").])#list(list.item[Ако пакет има више бинарних сандука, коренски фајлови се смештају у фолдер #raw("src/bin").])
#heading(level: 2)[Структура пакета] #label("org26d0c33")
#figure([#raw(block: true, lang: "text", "backyard
├── Cargo.lock
├── Cargo.toml              <- конфигурација пакета
└── src
    ├── garden
    │   └── vegetables.rs   <- модул
    ├── garden.rs           <- модул
    └── main.rs             <- корен бинарног сандука")]) #label("org2023dcf")
#heading(level: 2)[Груписање повезаног кода у модуле] #label("org33be6f5")
#list(list.item[У циљу читљивости, лакшег проналаска и поновне искористљивости, модули нам омогућавају организацију кода унутар сандука у виду стабла.])#list(list.item[Модули, такође, омогућавају дефинисање правила приступа. Сви елементи унутар
модула су подразумевано приватни.])
#heading(level: 2)[Пример употребе модула] #label("org8aa1863")
#figure([#raw(block: true, lang: "sh", "cargo new restaurant --lib")]) #label("org7185b16")

Фајл: src\u{2f}lib.rs
#figure([#raw(block: true, lang: "rust", "mod front_of_house {
    mod hosting {
        fn add_to_waitlist() {}

        fn seat_at_table() {}
    }

    mod serving {
        fn take_order() {}

        fn serve_order() {}

        fn take_payment() {}
    }
}")]) #label("org21f0595")

Модули могу имати друге модуле, структуре, енумерације, константе, особине итд.
#heading(level: 2)[Стабло модула (#emph[module tree])] #label("orgf69ac80")
Модули се повезују и чине структуру типа стабла чији корен је корен сандука
(#raw("main.rs") ili #raw("lib.rs")).

#figure([#raw(block: true, lang: "text", "crate
 └── front_of_house
     ├── hosting
     │   ├── add_to_waitlist
     │   └── seat_at_table
     └── serving
         ├── take_order
         ├── serve_order
         └── take_payment")]) #label("org911ad17")

Аналогија је систем фајлова и фолдера.
#heading(level: 2)[Путање унутар стабла модула] #label("orgc6da85d")
Елементи Раст кода се могу референцирати путањама које представљају синтаксне
елементе за навигацију над стаблом модула.

Постоје две врсте путања:
#list(list.item[#emph[апсолутна путања] \u{2d} пуна путања која почиње од корена сандука. Започиње са
речју #raw("crate").])#list(list.item[#emph[релативна путања] \u{2d} путања која се гради релативно од позиције где се наводи.
Може да користи кључне речи #raw("self") i #raw("super").])
#heading(level: 2)[Пример апсолутне и релативне путање] #label("orgfe56c1a")
#figure([#raw(block: true, lang: "rust", "mod front_of_house {
    mod hosting {
        fn add_to_waitlist() {}
    }
}

pub fn eat_at_restaurant() {
    // Absolute path
    crate::front_of_house::hosting::add_to_waitlist();

    // Relative path
    front_of_house::hosting::add_to_waitlist();
}")]) #label("org0220ea7")
#heading(level: 2)[Видљивост елемената унутар модула] #label("org43ee876")
#list(list.item[Претходни пример се не компајлира.])

#figure([#raw(block: true, lang: "rust", "$ cargo build
   Compiling restaurant v0.1.0 (file:///projects/restaurant)
error[E0603]: module `hosting` is private
 --> src/lib.rs:9:28
  |
9 |     crate::front_of_house::hosting::add_to_waitlist();
  |                            ^^^^^^^ private module
  |
note: the module `hosting` is defined here
 --> src/lib.rs:2:5
  |
2 |     mod hosting {
  |     ^^^^^^^^^^^

error[E0603]: module `hosting` is private
  --> src/lib.rs:12:21
   |
12 |     front_of_house::hosting::add_to_waitlist();
   |                     ^^^^^^^ private module
   |
note: the module `hosting` is defined here
  --> src/lib.rs:2:5
   |
2  |     mod hosting {
   |     ^^^^^^^^^^^

For more information about this error, try `rustc --explain E0603`.
error: could not compile `restaurant` due to 2 previous errors")]) #label("org8ff0f19")

Ако учинимо модул #raw("hosting") јавним:

#figure([#raw(block: true, lang: "rust", "mod front_of_house {
    pub mod hosting {
        fn add_to_waitlist() {}
    }
}

pub fn eat_at_restaurant() {
    // Absolute path
    crate::front_of_house::hosting::add_to_waitlist();

    // Relative path
    front_of_house::hosting::add_to_waitlist();
}")]) #label("orgca509d8")

И даље имамо грешку:
#figure([#raw(block: true, lang: "rust", "$ cargo build
   Compiling restaurant v0.1.0 (file:///projects/restaurant)
error[E0603]: function `add_to_waitlist` is private
 --> src/lib.rs:9:37
  |
9 |     crate::front_of_house::hosting::add_to_waitlist();
  |                                     ^^^^^^^^^^^^^^^ private function
  |
note: the function `add_to_waitlist` is defined here
 --> src/lib.rs:3:9
  |
3 |         fn add_to_waitlist() {}
  |         ^^^^^^^^^^^^^^^^^^^^

error[E0603]: function `add_to_waitlist` is private
  --> src/lib.rs:12:30
   |
12 |     front_of_house::hosting::add_to_waitlist();
   |                              ^^^^^^^^^^^^^^^ private function
   |
note: the function `add_to_waitlist` is defined here
  --> src/lib.rs:3:9
   |
3  |         fn add_to_waitlist() {}
   |         ^^^^^^^^^^^^^^^^^^^^

For more information about this error, try `rustc --explain E0603`.
error: could not compile `restaurant` due to 2 previous errors")]) #label("org7a505b4")

Морамо учинити и функцију #raw("add_to_waitlist") јавном јер иако је модул јаван његови
елементи су подразумевано приватни.

#figure([#raw(block: true, lang: "rust", "mod front_of_house {
    pub mod hosting {
        pub fn add_to_waitlist() {}
    }
}

pub fn eat_at_restaurant() {
    // Absolute path
    crate::front_of_house::hosting::add_to_waitlist();

    // Relative path
    front_of_house::hosting::add_to_waitlist();
}")]) #label("org7c9a874")
#heading(level: 2)[Јавни API] #label("orgd663d0b")
Кôд који је јавно доступан ван библиотечког сандука чини јавни API библиотеке и
представља "уговор" са корисницима библиотеке. Стога је важно поштовати одређена
правила измене ових елемената.

Делови кода који нису споља јавно доступни могу слободно да се мењају јер неће
утицати на кориснике.
#heading(level: 2)[Релативне путање и употреба #raw("super")] #label("org320cff7")
#list(list.item[#raw("super") се користи у ситуацији када релативну путању креирамо са почетком у
родитељском модулу.])

#figure([#raw(block: true, lang: "rust", "fn deliver_order() {}

mod back_of_house {
    fn fix_incorrect_order() {
        cook_order();
        super::deliver_order();
    }

    fn cook_order() {}
}")]) #label("org08df680")
#heading(level: 2)[Јавни приступ структурама и енумерацијама] #label("org29ec9d7")
#list(list.item[Постоји одређена разлика у третирању #raw("pub") кључне речи када су у питању
структуре и енумерације.])#list(list.item[Структуре које имају јавни приступ и даље подразумевано имају приватан приступ пољима.])
#figure([#raw(block: true, lang: "rust", "mod back_of_house {
    pub struct Breakfast {
        pub toast: String,
        seasonal_fruit: String,
    }
    impl Breakfast {
        pub fn summer(toast: &str) -> Breakfast {
            Breakfast {
                toast: String::from(toast),
                seasonal_fruit: String::from(\u{22}peaches\u{22}),
            }
        }
    }
}
pub fn eat_at_restaurant() {
    let mut meal = back_of_house::Breakfast::summer(\u{22}Rye\u{22});

    meal.toast = String::from(\u{22}Wheat\u{22});
    println!(\u{22}I'd like {} toast please\u{22}, meal.toast);

    // Следећа линија се не компајлира јер је поље приватно
    // meal.seasonal_fruit = String::from(\u{22}blueberries\u{22});
}")]) #label("org13c7234")

Са друге стране, варијанте енумерација су увек јавне:

#figure([#raw(block: true, lang: "rust", "mod back_of_house {
    pub enum Appetizer {
        Soup,
        Salad,
    }
}

pub fn eat_at_restaurant() {
    let order1 = back_of_house::Appetizer::Soup;
    let order2 = back_of_house::Appetizer::Salad;
}")]) #label("org0e00600")
#heading(level: 2)[Увођење елемената у опсег \u{2d} кључна реч #raw("use")] #label("org91c3736")
#list(list.item[Употреба пуних путања за свако навођење језичког елемента је оптерећујућа и
лоше утиче на читкост кода.])#list(list.item[Употребом кључне речи #raw("use") можемо увести елемент у текући опсег.])

#figure([#raw(block: true, lang: "rust", "mod front_of_house {
    pub mod hosting {
        pub fn add_to_waitlist() {}
    }
}

use crate::front_of_house::hosting;

pub fn eat_at_restaurant() {
    hosting::add_to_waitlist();
}")]) #label("org3611e55")

Аналогно креирању пречица (#emph[shortcuts]) у фајл систему.
#heading(level: 2)[#raw("use") само креира пречицу] #label("org6879ee2")
Следећи пример се не компајлира јер смо померили функцију #raw("eat_at_restaurant") у
модул #raw("customer") и релативна пречица више није валидна.

#figure([#raw(block: true, lang: "rust", "mod front_of_house {
    pub mod hosting {
        pub fn add_to_waitlist() {}
    }
}

use crate::front_of_house::hosting;

mod customer {
    pub fn eat_at_restaurant() {
        hosting::add_to_waitlist();
    }
}")]) #label("org98fa314")
#heading(level: 2)[Креирање идиоматских путања] #label("org136e9b3")
#list(list.item[Када уводимо функцију у опсег обично то радимо увођењем родитељског модула
како смо видели на претходном примеру.])#list(list.item[Ако уводимо типове (структуре, енумерације) наводимо их директно.])#list(list.item[На пример, увођење структуре #raw("HashMap") из стандардне библиотеке:])

#figure([#raw(block: true, lang: "rust", "use std::collections::HashMap;

fn main() {
    let mut map = HashMap::new();
    map.insert(1, 2);
}")]) #label("org54aa20c")
#heading(level: 2)[Употреба кључне речи #raw("as") за промену имена] #label("orgc49de3a")
Раст не дозвољава да постоје различити елементи у опсегу са истим именом.
Уколико желимо да уведемо елементе са истим називом можемо:
#list(list.item[Увести родитељски модул, као у следећем примеру:
#figure([#raw(block: true, lang: "rust", "use std::fmt;
    use std::io;
    fn function1() -> fmt::Result {
        // --snip--
    }

    fn function2() -> io::Result<()> {
        // --snip--
    }")]) #label("orgd13ba53")])#list(list.item[Променити име у текућем опсегу употребом кључне речи #raw("as").
#figure([#raw(block: true, lang: "rust", "use std::fmt::Result;
    use std::io::Result as IoResult;
    fn function1() -> Result {
        // --snip--
    }

    fn function2() -> IoResult<()> {
        // --snip--
    }")]) #label("org4c47e5d")])
#heading(level: 2)[Реекспорт имена са #raw("pub use")] #label("orgd24aa03")
#list(list.item[Када уведемо име у опсег са #raw("use") он је приватан за приступ споља.])#list(list.item[Уколико желимо да буде јаван споља можемо користити #raw("pub use").])

#figure([#raw(block: true, lang: "rust", "mod front_of_house {
    pub mod hosting {
        pub fn add_to_waitlist() {}
    }
}

pub use crate::front_of_house::hosting;

pub fn eat_at_restaurant() {
    hosting::add_to_waitlist();
}")]) #label("org3a5a741")

#list(list.item[Ово се често користи када јавни API библиотеке треба да буде различит од
интерне организације кода.])
#heading(level: 2)[Употреба екстерних пакета] #label("orgd288f5b")
Фајл #raw("Cargo.toml"):
#figure([#raw(block: true, lang: "rust", "...
[dependencies]
rand = \u{22}0.8.5\u{22}
...")]) #label("org1faad9c")

И затим можемо увести елементе из #raw("rand") сандука са:
#figure([#raw(block: true, lang: "rust", "use rand::Rng;

fn main() {
    let secret_number = rand::thread_rng().gen_range(1..=100);
}")]) #label("org3f15fdb")

Пакети се подразумевано преузимају са #raw("crates.io"). #raw("std") библиотека је сандук, увек
је локално присутан, није потребно посебно га наводити у конфигурацији али је
елементе које користимо потребно увести.

#figure([#raw(block: true, lang: "rust", "use std::collections::HashMap;")]) #label("orgb4950d6")
#heading(level: 2)[Угњеждене путање при увођењу] #label("orgdecfaca")
#list(list.item[Ако уводимо више елемената из истог модула можемо користити скраћени угњеждени
запис.])#list(list.item[На пример:
#figure([#raw(block: true, lang: "rust", "// --snip--
    use std::cmp::Ordering;
    use std::io;
    // --snip--")]) #label("org8c2fc47")])#list(list.item[Можемо писати као:
#figure([#raw(block: true, lang: "rust", "// --snip--
    use std::{cmp::Ordering, io};
    // --snip--")]) #label("org6b54498")])

#list(list.item[Moжемо истовремено увести и модул и неке од његових елемената. На пример,
уместо:
#figure([#raw(block: true, lang: "rust", "use std::io;
    use std::io::Write;")]) #label("org78d1ba5")])#list(list.item[Можемо писати:
#figure([#raw(block: true, lang: "rust", "use std::io::{self, Write};")]) #label("org66c700d")])
#heading(level: 2)[#emph[Glob] оператор] #label("org33cf34b")
#list(list.item[Ако желимо да уведемо све елементе неког модула можемо писати:
#figure([#raw(block: true, lang: "rust", "use std::collections::*;")]) #label("orgcdd14e0")])
#heading(level: 2)[Подела модула у посебне фајлове] #label("orgc2d3ebb")
Модуле често пишемо у посебним фајловима због лакшег приступа и организације.

Фајл #raw("src/lib.rs"):
#figure([#raw(block: true, lang: "rust", "pub mod front_of_house;    // <- наводимо име фајла модула

pub use crate::front_of_house::hosting;

pub fn eat_at_restaurant() {
    hosting::add_to_waitlist();
}")]) #label("org9e7784b")

А затим у фајлу #raw("src/front_of_house.rs")
#figure([#raw(block: true, lang: "rust", "pub mod hosting {
    pub fn add_to_waitlist() {}
}")]) #label("orge4f9bb7")

А можемо даље декомпоновати и извући модул #raw("hosting") из фајла #raw("front_of_house.rs"):

Фајл #raw("src/front_of_house.rs"):
#figure([#raw(block: true, lang: "rust", "pub mod hosting;")]) #label("org8b8dabe")

Фајл #raw("src/front_of_house/hosting.rs"):
#figure([#raw(block: true, lang: "rust", "pub fn add_to_waitlist() {}")]) #label("orgc12f9ef")

#raw("mod") је потребно навести само једном. Тиме се модул увезује у стабло модула и
могуће га је референцирати путањама из остатка кода. Односно, #raw("mod") није исто што
и #raw("include") из других програмских језика.
#heading(level: 1)[Тестирање] #label("org729d19c")
#heading(level: 2)[Тестирање] #label("org0e5565c")
#figure([#quote(block: true)[Program testing can be a very effective way to show the presence of bugs, but it
is hopelessly inadequate for showing their absence.

\u{2d}\u{2d} Edsger W. Dijkstra, “The Humble Programmer”, 1972
]]) #label("orge35d044")

#list(list.item[Раст систем типова и провера позајмица спречава појаву шире класе логичких
грешака али не може да предупреди појаву свих грешака. На пример, Раст не може
да провери да ће одређена функција да ради тачно оно што је програмер
замислио.])#list(list.item[Одређена класа логичких грешака захтева креирање тестова.])
#heading(level: 2)[Како писати тестове?] #label("orge137738")
#enum(enum.item(1)[Поставити потребно стање и улазне податке.],
enum.item(2)[Извршити кôд који се тестира са датим улазима.],
enum.item(3)[Потврдити да је резултат извршавања очекиван.],
)
#heading(level: 2)[Анатомија тест функције] #label("orge9403dc")
#figure([#raw(block: true, lang: "rust", "$ cargo new adder --lib
     Created library `adder` project
$ cd adder")]) #label("orgfe78ca6")

Генерисан тест ће бити:

Фајл #raw("src/lib.rs"):
#figure([#raw(block: true, lang: "rust", "#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {
        let result = 2 + 2;
        assert_eq!(result, 4);
    }
}")]) #label("orgaacc6fd")
#heading(level: 2)[Покретање теста] #label("org1818032")
#figure([#raw(block: true, lang: "sh", "$ cargo test
   Compiling adder v0.1.0 (file:///projects/adder)
    Finished test [unoptimized + debuginfo] target(s) in 0.57s
     Running unittests src/lib.rs (target/debug/deps/adder-92948b65e88960b4)

running 1 test
test tests::it_works ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

   Doc-tests adder

running 0 tests

test result: ok. 0 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s")]) #label("org6d02ad7")
#heading(level: 2)[Пример теста 1] #label("orgb2f52ca")
#figure([#raw(block: true, lang: "rust", "#[derive(Debug)]
struct Rectangle {
    width: u32,
    height: u32,
}

impl Rectangle {
    fn can_hold(&self, other: &Rectangle) -> bool {
        self.width > other.width && self.height > other.height
    }
}")]) #label("orgb2bc7a1")

#figure([#raw(block: true, lang: "rust", "#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn larger_can_hold_smaller() {
        let larger = Rectangle {
            width: 8,
            height: 7,
        };
        let smaller = Rectangle {
            width: 5,
            height: 1,
        };

        assert!(larger.can_hold(&smaller));
    }
}")]) #label("orgca8c543")

#figure([#raw(block: true, lang: "sh", "$ cargo test
   Compiling rectangle v0.1.0 (file:///projects/rectangle)
    Finished test [unoptimized + debuginfo] target(s) in 0.66s
     Running unittests src/lib.rs (target/debug/deps/rectangle-6584c4561e48942e)

running 1 test
test tests::larger_can_hold_smaller ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

   Doc-tests rectangle

running 0 tests

test result: ok. 0 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s")]) #label("org98414f8")
#heading(level: 2)[Пример теста 2] #label("org0aff774")
#figure([#raw(block: true, lang: "rust", "#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn larger_can_hold_smaller() {
        // --snip--
    }

    #[test]
    fn smaller_cannot_hold_larger() {
        let larger = Rectangle {
            width: 8,
            height: 7,
        };
        let smaller = Rectangle {
            width: 5,
            height: 1,
        };

        assert!(!smaller.can_hold(&larger));
    }
}")]) #label("orgc9154dc")

#figure([#raw(block: true, lang: "sh", "$ cargo test
   Compiling rectangle v0.1.0 (file:///projects/rectangle)
    Finished test [unoptimized + debuginfo] target(s) in 0.66s
     Running unittests src/lib.rs (target/debug/deps/rectangle-6584c4561e48942e)

running 2 tests
test tests::larger_can_hold_smaller ... ok
test tests::smaller_cannot_hold_larger ... ok

test result: ok. 2 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

   Doc-tests rectangle

running 0 tests

test result: ok. 0 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s")]) #label("orgeb25e27")
#heading(level: 2)[Неуспешан тест] #label("orgaa70612")
#list(list.item[Намерно уводимо грешку у код да видимо како излгеда када тест не успева:])
#figure([#raw(block: true, lang: "rust", "// --snip--
impl Rectangle {
    fn can_hold(&self, other: &Rectangle) -> bool {
        self.width < other.width && self.height > other.height
    }
}")]) #label("orgeba7671")

#figure([#raw(block: true, lang: "sh", "$ cargo test
   Compiling rectangle v0.1.0 (file:///projects/rectangle)
    Finished test [unoptimized + debuginfo] target(s) in 0.66s
     Running unittests src/lib.rs (target/debug/deps/rectangle-6584c4561e48942e)

running 2 tests
test tests::larger_can_hold_smaller ... FAILED
test tests::smaller_cannot_hold_larger ... ok

failures:

---- tests::larger_can_hold_smaller stdout ----
thread 'tests::larger_can_hold_smaller' panicked at 'assertion failed: larger.can_hold(&smaller)', src/lib.rs:28:9
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace

failures:
    tests::larger_can_hold_smaller

test result: FAILED. 1 passed; 1 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

error: test failed, to rerun pass `--lib`")]) #label("orga97126f")
#heading(level: 2)[Тестирање једнакости и неједнакости \u{2d} #raw("assert_eq!") и #raw("assert_ne!")] #label("org9a274a0")
#figure([#raw(block: true, lang: "rust", "pub fn add_two(a: i32) -> i32 {
    a + 2
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_adds_two() {
        assert_eq!(4, add_two(2));
    }
}")]) #label("org652cdbd")

#figure([#raw(block: true, lang: "sh", "$ cargo test
   Compiling adder v0.1.0 (file:///projects/adder)
    Finished test [unoptimized + debuginfo] target(s) in 0.58s
     Running unittests src/lib.rs (target/debug/deps/adder-92948b65e88960b4)

running 1 test
test tests::it_adds_two ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

   Doc-tests adder

running 0 tests

test result: ok. 0 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s")]) #label("org866e577")

Уколико тест не успе:

#figure([#raw(block: true, lang: "rust", "pub fn add_two(a: i32) -> i32 {
    a + 3
}")]) #label("org2b108c1")

#figure([#raw(block: true, lang: "sh", "$ cargo test
   Compiling adder v0.1.0 (file:///projects/adder)
    Finished test [unoptimized + debuginfo] target(s) in 0.61s
     Running unittests src/lib.rs (target/debug/deps/adder-92948b65e88960b4)

running 1 test
test tests::it_adds_two ... FAILED

failures:

---- tests::it_adds_two stdout ----
thread 'tests::it_adds_two' panicked at 'assertion failed: `(left == right)`
  left: `4`,
 right: `5`', src/lib.rs:11:9
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace


failures:
    tests::it_adds_two

test result: FAILED. 0 passed; 1 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

error: test failed, to rerun pass `--lib`")]) #label("orgc4d9a42")
#heading(level: 2)[Произвољна корисничка порука] #label("org99286fb")
#figure([#raw(block: true, lang: "rust", "#[test]
    fn greeting_contains_name() {
        let result = greeting(\u{22}Carol\u{22});
        assert!(
            result.contains(\u{22}Carol\u{22}),
            \u{22}Greeting did not contain name, value was `{}`\u{22},
            result
        );
    }")]) #label("org3e44983")

#figure([#raw(block: true, lang: "sh", "$ cargo test
   Compiling greeter v0.1.0 (file:///projects/greeter)
    Finished test [unoptimized + debuginfo] target(s) in 0.93s
     Running unittests src/lib.rs (target/debug/deps/greeter-170b942eb5bf5e3a)

running 1 test
test tests::greeting_contains_name ... FAILED

failures:

---- tests::greeting_contains_name stdout ----
thread 'tests::greeting_contains_name'
panicked at 'Greeting did not contain name, value was `Hello!`', src/lib.rs:12:9
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace


failures:
    tests::greeting_contains_name

test result: FAILED. 0 passed; 1 failed; 0 ignored; 0 measured; 0 filtered out;
finished in 0.00s

error: test failed, to rerun pass `--lib`")]) #label("orgc252537")
#heading(level: 2)[Провера #raw("should_panic")] #label("org6dee8d4")
#figure([#raw(block: true, lang: "rust", "pub struct Guess {
    value: i32,
}

impl Guess {
    pub fn new(value: i32) -> Guess {
        if value < 1 || value > 100 {
            panic!(\u{22}Guess value must be between 1 and 100, got {}.\u{22}, value);
        }

        Guess { value }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    #[should_panic]
    fn greater_than_100() {
        Guess::new(200);
    }
}")]) #label("org23bcabb")

#figure([#raw(block: true, lang: "rust", "impl Guess {
    pub fn new(value: i32) -> Guess {
        if value < 1 {
            panic!(
                \u{22}Guess value must be greater than or equal to 1, got {}.\u{22},
                value
            );
        } else if value > 100 {
            panic!(
                \u{22}Guess value must be less than or equal to 100, got {}.\u{22},
                value
            );
        }
        Guess { value }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    #[should_panic(expected = \u{22}less than or equal to 100\u{22})]
    fn greater_than_100() {
        Guess::new(200);
    }
}")]) #label("orgfa46a01")
#heading(level: 2)[Филтрирање тестова при покретању] #label("org4a6542c")
#figure([#raw(block: true, lang: "rust", "pub fn add_two(a: i32) -> i32 {
    a + 2
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn add_two_and_two() {
        assert_eq!(4, add_two(2));
    }

    #[test]
    fn add_three_and_two() {
        assert_eq!(5, add_two(3));
    }

    #[test]
    fn one_hundred() {
        assert_eq!(102, add_two(100));
    }
}")]) #label("org3315e0a")

#figure([#raw(block: true, lang: "sh", "$ cargo test one_hundred
   Compiling adder v0.1.0 (file:///projects/adder)
    Finished test [unoptimized + debuginfo] target(s) in 0.69s
     Running unittests src/lib.rs (target/debug/deps/adder-92948b65e88960b4)

running 1 test
test tests::one_hundred ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 2 filtered out; finished in 0.00s")]) #label("org0df6263")

#figure([#raw(block: true, lang: "sh", "$ cargo test add
   Compiling adder v0.1.0 (file:///projects/adder)
    Finished test [unoptimized + debuginfo] target(s) in 0.61s
     Running unittests src/lib.rs (target/debug/deps/adder-92948b65e88960b4)

running 2 tests
test tests::add_three_and_two ... ok
test tests::add_two_and_two ... ok

test result: ok. 2 passed; 0 failed; 0 ignored; 0 measured; 1 filtered out; finished in 0.00s")]) #label("org034d722")
#heading(level: 1)[Генерички типови (#emph[generics])] #label("org6acf23d")
#heading(level: 2)[Генерички типови (#emph[generics])] #label("org99e7cb8")
#list(list.item[Механизам за елиминацију дуплирања кода.])#list(list.item[Генерички типови су апстрактне замене за конкретне типове и друге особине у
време извршавања.])#list(list.item[Омогућавају нам да на апстрактан начин искажемо особине типова и њихове везе
са другим типовима без знања о томе који ће се конкретни типови наћи на
њиховом месту у време компајлирања и извршавања кода.])#list(list.item[На пример функције могу примити генеричке параметре. Такође, сложени типови
могу бити параметризовани генеричким типовима (пример је #raw("Option<T>")).])
#heading(level: 2)[Уклањање дуплог кода употребом функција] #label("org7b71581")
#figure([#raw(block: true, lang: "rust", "fn main() {
    let number_list = vec![34, 50, 25, 100, 65];

    let mut largest = number_list[0];

    for number in number_list {
        if number > largest {
            largest = number;
        }
    }

    println!(\u{22}The largest number is {}\u{22}, largest);
}")]) #label("orge609937")

#figure([#raw(block: true, lang: "rust", "fn main() {
    let number_list = vec![34, 50, 25, 100, 65];

    let mut largest = number_list[0];

    for number in number_list {
        if number > largest {
            largest = number;
        }
    }

    println!(\u{22}The largest number is {}\u{22}, largest);

    let number_list = vec![102, 34, 6000, 89, 54, 2, 43, 8];

    let mut largest = number_list[0];

    for number in number_list {
        if number > largest {
            largest = number;
        }
    }

    println!(\u{22}The largest number is {}\u{22}, largest);
}")]) #label("org3a83aae")

Дуплирање кода!

Елиминишемо дуплирање увођењем функције.

#figure([#raw(block: true, lang: "rust", "fn largest(list: &[i32]) -> i32 {
    let mut largest = list[0];

    for &item in list {
        if item > largest {
            largest = item;
        }
    }

    largest
}

fn main() {
    let number_list = vec![34, 50, 25, 100, 65];

    let result = largest(&number_list);
    println!(\u{22}The largest number is {}\u{22}, result);

    let number_list = vec![102, 34, 6000, 89, 54, 2, 43, 8];

    let result = largest(&number_list);
    println!(\u{22}The largest number is {}\u{22}, result);
}")]) #label("org221c389")


Поступак елиминације дуплог кода је подразумевао следеће:

#enum(enum.item(1)[Идентификација дуплог кода.],
enum.item(2)[Екстракција кода у функцију, дефинисање параметара и повратне вредности.],
enum.item(3)[Замена инстанци дуплог кода са позивом функције.],
)
#heading(level: 2)[Уклањање дуплог кода употребом генеричких функција] #label("org0f1906f")
Имамо функцију за проналажење највећег елемента у листи са различитим типовима.
#figure([#raw(block: true, lang: "rust", "fn largest_i32(list: &[i32]) -> i32 {
    let mut largest = list[0];
    for &item in list {
        if item > largest {
            largest = item;
        }
    }
    largest
}
fn largest_char(list: &[char]) -> char {
    let mut largest = list[0];
    for &item in list {
        if item > largest {
            largest = item;
        }
    }
    largest
}
fn main() {
    let number_list = vec![34, 50, 25, 100, 65];
    let result = largest_i32(&number_list);
    println!(\u{22}The largest number is {}\u{22}, result);
    let char_list = vec!['y', 'm', 'a', 'q'];
    let result = largest_char(&char_list);
    println!(\u{22}The largest char is {}\u{22}, result);
}")]) #label("orgaba8f00")

Функције су готово идентичне. Разлика је само у типу. Пишемо генеричку функцију
тако што дефинишемо генерички тип унутар #raw("<>") после назива функције:

#figure([#raw(block: true, lang: "rust", "fn largest<T>(list: &[T]) -> T {")]) #label("org95119f9")

#raw("T") је генерички тип и у време компајлирања биће замењен са конкретним типом.

Сада је наш код следећи:

#figure([#raw(block: true, lang: "rust", "fn largest<T>(list: &[T]) -> T {
    let mut largest = list[0];

    for &item in list {
        if item > largest {
            largest = item;
        }
    }

    largest
}

fn main() {
    let number_list = vec![34, 50, 25, 100, 65];

    let result = largest(&number_list);
    println!(\u{22}The largest number is {}\u{22}, result);

    let char_list = vec!['y', 'm', 'a', 'q'];

    let result = largest(&char_list);
    println!(\u{22}The largest char is {}\u{22}, result);
}")]) #label("orgd9fca93")

Али се не компајлира.

#figure([#raw(block: true, lang: "rust", "$ cargo run
   Compiling chapter10 v0.1.0 (file:///projects/chapter10)
error[E0369]: binary operation `>` cannot be applied to type `T`
 --> src/main.rs:5:17
  |
5 |         if item > largest {
  |            ---- ^ ------- T
  |            |
  |            T
  |
help: consider restricting type parameter `T`
  |
1 | fn largest<T: std::cmp::PartialOrd>(list: &[T]) -> T {
  |             ++++++++++++++++++++++

For more information about this error, try `rustc --explain E0369`.
error: could not compile `chapter10` due to previous error")]) #label("org2b0b00c")

Тип #raw("T") може бити било који тип па и тип који не дефинише операцију #raw(">") која се
користи у коду. Дакле, морамо ограничити који типови су могући.

Видећемо како се ово ради у наставку у причи о особинама (#emph[Traits]).
#heading(level: 2)[Генерички типови у структурама] #label("orgee883f4")
#figure([#raw(block: true, lang: "rust", "struct Point<T> {
    x: T,
    y: T,
}

fn main() {
    let integer = Point { x: 5, y: 10 };
    let float = Point { x: 1.0, y: 4.0 };
}")]) #label("org36a686f")

Типови оба поља морају бити исти.

#figure([#raw(block: true, lang: "rust", "struct Point<T> {
    x: T,
    y: T,
}

fn main() {
    let wont_work = Point { x: 5, y: 4.0 };
}")]) #label("org5a8f5c9")

Ако желимо да поља имају различите типове онда морамо имати различите генеричке типове.

#figure([#raw(block: true, lang: "rust", "struct Point<T, U> {
    x: T,
    y: U,
}

fn main() {
    let both_integer = Point { x: 5, y: 10 };
    let both_float = Point { x: 1.0, y: 4.0 };
    let integer_and_float = Point { x: 5, y: 4.0 };
}")]) #label("org82a9e41")
#heading(level: 2)[Генерички типови у енумерацијама] #label("orgc2e0224")
#figure([#raw(block: true, lang: "rust", "enum Option<T> {
    Some(T),
    None,
}")]) #label("org993af2e")

#figure([#raw(block: true, lang: "rust", "enum Result<T, E> {
    Ok(T),
    Err(E),
}")]) #label("org11ce091")
#heading(level: 2)[Дефиниције метода] #label("org8d83ec0")
#figure([#raw(block: true, lang: "rust", "struct Point<T> {
    x: T,
    y: T,
}

impl<T> Point<T> {
    fn x(&self) -> &T {
        &self.x
    }
}

fn main() {
    let p = Point { x: 5, y: 10 };

    println!(\u{22}p.x = {}\u{22}, p.x());
}")]) #label("org26c436b")

Пошто смо навели #raw("<T>") иза кључне речи #raw("impl") Раст даље зна да је тип #raw("T") генерички
а не конкретни тип тако да је метода #raw("x") за #raw("Point<T>") дефинисана над свим типовима
#raw("T").

Могли смо нпр. методу дефинисати само за одређени #raw("Point") тип.

#figure([#raw(block: true, lang: "rust", "impl Point<f32> {
    fn distance_from_origin(&self) -> f32 {
        (self.x.powi(2) + self.y.powi(2)).sqrt()
    }
}")]) #label("org192bdeb")

Овај #raw("impl") блок дефинише методу #raw("distance_from_origin") али само за #raw("Point<f32>") док
остали #raw("Point") типови неће имати ову методу.
#heading(level: 2)[Генерички типови у методама и #raw("impl") блоковима] #label("orge1bf0dd")
Генерички типови у структурама и методама не морају бити исти. На пример, можемо
креирати методу #raw("mixup") која узима две инстанце #raw("Point") и враћа нови #raw("Point") тип где
ће прво поље имати исти тип као прва тачка а друго поље као друга тачка.

#figure([#raw(block: true, lang: "rust", "struct Point<X1, Y1> {
    x: X1,
    y: Y1,
}

impl<X1, Y1> Point<X1, Y1> {
    fn mixup<X2, Y2>(self, other: Point<X2, Y2>) -> Point<X1, Y2> {
        Point {
            x: self.x,
            y: other.y,
        }
    }
}

fn main() {
    let p1 = Point { x: 5, y: 10.4 };
    let p2 = Point { x: \u{22}Hello\u{22}, y: 'c' };
    let p3 = p1.mixup(p2);
    println!(\u{22}p3.x = {}, p3.y = {}\u{22}, p3.x, p3.y);
}")]) #label("org39b8d2b")

#raw(block: false, "p3.x = 5, p3.y = c")

Генерички типови #raw("X2") и #raw("Y2") су наведени само у методи јер су релевантни само у
њеном контексту.
#heading(level: 2)[Перформансе] #label("orgda86254")
Употреба генеричког кода не доводи до деградације перформанси. Раст користи
технику мономорфизације (#emph[Monomorphization]) код које ће компајлер инстанцирати
конкретан кôд за сваки тип посебно.

То би значило следеће. Ако имамо код:

#figure([#raw(block: true, lang: "rust", "let integer = Some(5);
let float = Some(5.0)")]) #label("org209a9e9")

Компајлер ће произвести код еквивалентан следећем:
#figure([#raw(block: true, lang: "rust", "enum Option_i32 {
    Some(i32),
    None,
}

enum Option_f64 {
    Some(f64),
    None,
}

fn main() {
    let integer = Option_i32::Some(5);
    let float = Option_f64::Some(5.0);
}")]) #label("orged18350")
#heading(level: 1)[Особине (#emph[Traits]) \u{2d} дефинисање заједничког понашања] #label("org2f4fcac")
#heading(level: 2)[Особине (#emph[Traits])] #label("org0e7ff2d")
#list(list.item[Особина дефинише функционалност коју тип може делити са другим типовима.])#list(list.item[У другим језицима сличан концепт назива се интерфејс.])#list(list.item[Можемо користити #emph[ограничења кроз особине] (#emph[Trait bounds]) да дефинишемо да
генерички тип мора задовољити одређена ограничења.])
#heading(level: 2)[Дефинисање особина] #label("org4598ee3")
#list(list.item[Пример дефинисања #emph[media aggregator] библиотеке која може да приказе сажетак
података који се може чувати у #raw("NewsArticle") или #raw("Tweet") инстанци.])#list(list.item[Дефинишемо #raw("Summary") особину да опишемо ову функционалност.])

#figure([#raw(block: true, lang: "rust", "pub trait Summary {
    fn summarize(&self) -> String;
}")]) #label("orgb9fd140")
#heading(level: 2)[Имплементација особина] #label("orgb870c8c")
#figure([#raw(block: true, lang: "rust", "pub struct NewsArticle {
    pub headline: String,
    pub location: String,
    pub author: String,
    pub content: String,
}

impl Summary for NewsArticle {
    fn summarize(&self) -> String {
        format!(\u{22}{}, by {} ({})\u{22}, self.headline, self.author, self.location)
    }
}

pub struct Tweet {
    pub username: String,
    pub content: String,
    pub reply: bool,
    pub retweet: bool,
}

impl Summary for Tweet {
    fn summarize(&self) -> String {
        format!(\u{22}{}: {}\u{22}, self.username, self.content)
    }
}")]) #label("orgc069a8d")

Методе особина се позивају као и обичне методе. Једина разлика је у томе што
методе особина морају бити доступне у опсегу (укључити их са #raw("use")).

#figure([#raw(block: true, lang: "rust", "use aggregator::{Summary, Tweet};

fn main() {
    let tweet = Tweet {
        username: String::from(\u{22}horse_ebooks\u{22}),
        content: String::from(
            \u{22}of course, as you probably already know, people\u{22},
        ),
        reply: false,
        retweet: false,
    };

    println!(\u{22}1 new tweet: {}\u{22}, tweet.summarize());
}")]) #label("org1640b2f")

Ограничење у употреби особина је да можемо имплементирати особину над типом
једино ако је бар једно од њих локално за наш сандук. Ово правило је део скупа
правила који се називају #emph[coherence]. Конкретно ово правило зове се #emph[orphan rule] и
спречава некомпатибилне имплементације особина над типовима од стране више
сандука.

Без овог правила могло би се десити да два различита сандука имплементирају исту
особину над истим типом на различите начине и компајлер не би знао коју верзију
да користи.
#heading(level: 2)[Подразумевана имплементација] #label("org6cc35bd")
Особина може имати подразумевану имплементацију метода.

#figure([#raw(block: true, lang: "rust", "pub trait Summary {
    fn summarize(&self) -> String {
        String::from(\u{22}(Read more...)\u{22})
    }
}")]) #label("org48641cd")

Да би користили подразумевану имплементацију можемо навести празно тело у #raw("impl")
блоку:

#figure([#raw(block: true, lang: "rust", "impl Summary for NewsArticle {}")]) #label("org7980d05")

И затим можемо позвати #raw("summarize") методу:

#figure([#raw(block: true, lang: "rust", "let article = NewsArticle {
        headline: String::from(\u{22}Penguins win the Stanley Cup Championship!\u{22}),
        location: String::from(\u{22}Pittsburgh, PA, USA\u{22}),
        author: String::from(\u{22}Iceburgh\u{22}),
        content: String::from(
            \u{22}The Pittsburgh Penguins once again are the best \
             hockey team in the NHL.\u{22},
        ),
    };

    println!(\u{22}New article available! {}\u{22}, article.summarize());")]) #label("orga2cc3cc")

#list(list.item[Подразумевана имплементација може бити редефинисана приликом имплементације.])#list(list.item[Такође, подразумеване методе могу позивати друге методе.])

#figure([#raw(block: true, lang: "rust", "pub trait Summary {
    fn summarize_author(&self) -> String;

    fn summarize(&self) -> String {
        format!(\u{22}(Read more from {}...)\u{22}, self.summarize_author())
    }
}")]) #label("orgf148f9d")

Сада је потребно и довољно да приликом имплементације дефинишемо
#raw("summarize_author") методу:

#figure([#raw(block: true, lang: "rust", "impl Summary for Tweet {
    fn summarize_author(&self) -> String {
        format!(\u{22}@{}\u{22}, self.username)
    }
}")]) #label("org531fe8f")
#heading(level: 2)[Особине као параметри] #label("org4434992")
#list(list.item[Сада можемо користити особине да дефинишемо функције које раде над параметрима
различитог типа.])

#figure([#raw(block: true, lang: "rust", "pub fn notify(item: &impl Summary) {
    println!(\u{22}Breaking news! {}\u{22}, item.summarize());
}")]) #label("orged2e2b3")

Функција #raw("notify") ради над свим типовима који имплементирају #raw("Summary").

Претходна употреба #raw("impl") код параметра је синтаксни шећер за општи облик
навођења ограничења кроз особине.

#figure([#raw(block: true, lang: "rust", "pub fn notify<T: Summary>(item: &T) {
    println!(\u{22}Breaking news! {}\u{22}, item.summarize());
}")]) #label("orge747021")

Ограничења кроз особине (#emph[Trait bounds]) стављамо после двотачке код навођења
генеричког типа. Компајлер ће верификовати да све што користимо над вредностима
овог типа унутар функције је заиста дефинисано особинама наведеним у заглављу.

#raw("impl Trait") синтаксе је концизнија код једноставних примера али је пуна синтакса
боља код сложенијих примера.

На пример:

#figure([#raw(block: true, lang: "rust", "pub fn notify(item1: &impl Summary, item2: &impl Summary) {")]) #label("org914bd65")

би у пуној синтакси било:

#figure([#raw(block: true, lang: "rust", "pub fn notify<T: Summary>(item1: &T, item2: &T) {")]) #label("orga4fc2ac")
#heading(level: 2)[Вишеструке особине код ограничења] #label("org223d37b")
Можемо дефинисати и више ограничења употребом #raw("+") синтаксе. На пример, ако
параметар мора да имплементира #raw("Summary") и #raw("Display"):
#figure([#raw(block: true, lang: "rust", "pub fn notify(item: &(impl Summary + Display)) {")]) #label("org03120b6")

или у пуној синтакси:

#figure([#raw(block: true, lang: "rust", "pub fn notify<T: Summary + Display>(item: &T) {")]) #label("org3dc26b9")
#heading(level: 2)[#raw("where") клаузула у ограничењима] #label("orgf04f68a")
#list(list.item[Уколико имамо више ограничења основна синтакса може да смањи читкост.])

#figure([#raw(block: true, lang: "rust", "fn some_function<T: Display + Clone, U: Clone + Debug>(t: &T, u: &U) -> i32 {")]) #label("orgf3e363c")

#list(list.item[#raw("where") клаузула измешта дефинисање ограничења после заглавља функције чиме
се постиже боља читкост:])

#figure([#raw(block: true, lang: "rust", "fn some_function<T, U>(t: &T, u: &U) -> i32
    where T: Display + Clone,
          U: Clone + Debug
{")]) #label("orgfa6edda")
#heading(level: 2)[#raw("impl Trait") као повратна вредност функције] #label("org47eaa85")
#figure([#raw(block: true, lang: "rust", "fn returns_summarizable() -> impl Summary {
    Tweet {
        username: String::from(\u{22}horse_ebooks\u{22}),
        content: String::from(
            \u{22}of course, as you probably already know, people\u{22},
        ),
        reply: false,
        retweet: false,
    }
}")]) #label("org39c70eb")

Посебно значајно у контексту затворења (#emph[closures]) и итератора где је конкретан
тип превише сложен за писање или је познат само компајлеру.

#raw("impl Trait") синтакса за повратне вредности је могућа само ако функција враћа
један тип који имплементира дату особину. На пример, ова функција неће радити
ако функција може вратити #raw("NewsArticle") или #raw("Tweet").
#heading(level: 2)[Поправка #raw("largest") генеричке функције] #label("org082fdb5")
На претходним сладовима имали смо функцију #raw("largest"). Сада можемо да завршимо
њену дефиницију.

Грешка је била следећа:
Дакле, морамо ограничити типове на оне који подржавају поређење. Ова особина се
у стандардној библиотеци зове #raw("std::cmp::PartialOrd"), па ћемо преправити заглавље
функције на следећи начин:

#figure([#raw(block: true, lang: "rust", "fn largest<T: PartialOrd>(list: &[T]) -> T {")]) #label("org4d5623b")

Међутим, сада имамо још једну грешку:
Уводимо додатно ограничење да генерички тип мора бити и #raw("Copy"). Тако да је пуно
решење следеће:

#figure([#raw(block: true, lang: "rust", "fn largest<T: PartialOrd + Copy>(list: &[T]) -> T {
    let mut largest = list[0];

    for &item in list {
        if item > largest {
            largest = item;
        }
    }

    largest
}

fn main() {
    let number_list = vec![34, 50, 25, 100, 65];

    let result = largest(&number_list);
    println!(\u{22}The largest number is {}\u{22}, result);

    let char_list = vec!['y', 'm', 'a', 'q'];

    let result = largest(&char_list);
    println!(\u{22}The largest char is {}\u{22}, result);
}")]) #label("org3989f24")
#heading(level: 2)[Употреба особина ограничења за условну имплементацију метода] #label("orgba7a77e")
Ако желимо да имплементирамо методу само над типовима који имплементирају
одређене особине.
#figure([#raw(block: true, lang: "rust", "use std::fmt::Display;

struct Pair<T> {
    x: T,
    y: T,
}

impl<T> Pair<T> {
    fn new(x: T, y: T) -> Self {
        Self { x, y }
    }
}

impl<T: Display + PartialOrd> Pair<T> {
    fn cmp_display(&self) {
        if self.x >= self.y {
            println!(\u{22}The largest member is x = {}\u{22}, self.x);
        } else {
            println!(\u{22}The largest member is y = {}\u{22}, self.y);
        }
    }
}")]) #label("org5e41c9d")
#heading(level: 1)[Валидација референци кроз животни век (#emph[Lifetimes])] #label("org46e01be")
#heading(level: 2)[Животни век (#emph[Lifetime])] #label("org7f2d750")
#list(list.item[Свака референца има животни век, опсег у коме је референца валидна.])#list(list.item[У доста ситуација компајлер аутоматски може да закључи који је животни век
референце. Када то није у стању морамо да урадимо ручну анотацију.])#list(list.item[Анотацијама животног века доводимо у везу животни век различитих референци.])
#heading(level: 2)[Спречавање "висећих" референци] #label("orga21e458")
#figure([#raw(block: true, lang: "rust", "{
    let r;

    {
        let x = 5;
        r = &x;
    }

    println!(\u{22}r: {}\u{22}, r);
}")]) #label("org197bcd7")
#heading(level: 2)[#emph[Borrow Checker]] #label("org3f95a9b")
#list(list.item[Раст компајлер има компоненту #emph[borrow checker] која проверава да ли су све
позајмице валидне.])

#figure([#raw(block: true, lang: "rust", "{
    let r;                // ---------+-- 'a
                          //          |
    {                     //          |
        let x = 5;        // -+-- 'b  |
        r = &x;           //  |       |
    }                     // -+       |
                          //          |
    println!(\u{22}r: {}\u{22}, r); //          |
}                         // ---------+")]) #label("orga173499")

#list(list.item[Програм је одбачен јер #raw("r") референцира вредност чији животни век (#raw("'b")) је краћи
од животног века варијабле #raw("r") (#raw("'a")). Уколико би се ово дозволило, #raw("r") би у једном
делу референцирала невалидну вредност.])

Варијабле имају животни век који је једнак синтаксном опсегу у коме је
варијабла дефинисана. Животни век имају и референце које позајмљују вредност и
смештају се у варијабле (нпр. #raw("r=&x") из претходног примера).

Једно од правила је да референца на варијаблу (тј. вредност) не може да живи
дуже од саме вредности односно варијабле која је власник те вредности. Односно
#emph[животни век вредности мора да садржи животни век референце позајмљене од те
вредности].

#figure([#raw(block: true, lang: "rust", "{
    let r;
    {
        let x = 5;
        r = &x;           // -+- &x не може да живи дуже од
    }                     // -+  овог животног века
    println!(\u{22}r: {}\u{22}, r);
}")]) #label("org3c75a2b")

Ако сместимо референцу у варијаблу, референца мора бити исправна за цео животни
век варијабле у коју је смештена.

Кажемо да #emph[животни век референце мора да садржи животни век варијабле у коју је
смештена].

#figure([#raw(block: true, lang: "rust", "{
    let r;
    {
        let x = 5;
        r = &x;           // -+- животни век било чега што
    }                     //  |  се смести у r мора да живи
    println!(\u{22}r: {}\u{22}, r); // -+  бар оволико
}")]) #label("orgde14ff0")

Видимо да ово правило није задовољено. #raw("&x") не живи довољно дуго јер #raw("x") не живи
довољно дуго.

Ако претходна два правила објединимо можемо рећи да:

#emph[Животни век вредности мора да садржи животни век свих варијабли које вредност
позајмљују].

Односно, варијабла која је власник вредности може отићи из опсега тек када не
постоји више ни једна варијабла која чува позајмљену вредност.

Следећи код је прихваћен. Референца #raw("r") не живи дуже од податка који референцира
(#raw("x")).

#figure([#raw(block: true, lang: "rust", "{
    let x = 5;            // ----------+-- 'b
                          //           |
    let r = &x;           // --+-- 'a  |
                          //   |       |
    println!(\u{22}r: {}\u{22}, r); //   |       |
                          // --+       |
}                         // ----------+")]) #label("orgdc11954")
#heading(level: 2)[Генерички животни векови у функцијама] #label("org24df706")
#list(list.item[Креирамо функцију #raw("longest") која враћа дужи од два прослеђена стринга.
Прослеђујемо референцу на стринг исечак #raw("&str").])

#figure([#raw(block: true, lang: "rust", "fn main() {
    let string1 = String::from(\u{22}abcd\u{22});
    let string2 = \u{22}xyz\u{22};

    let result = longest(string1.as_str(), string2);
    println!(\u{22}The longest string is {}\u{22}, result);
}")]) #label("orgd03cda3")

Овај програм није прихваћен.
#figure([#raw(block: true, lang: "rust", "fn longest(x: &str, y: &str) -> &str {
    if x.len() > y.len() {
        x
    } else {
        y
    }
}")]) #label("orga15eb1c")

#list(list.item[Зашто програм није прихваћен?])#list(list.item[#emph[Borrow checker] није у стању да одреди у којој релацији су референце #raw("x") и #raw("y") са
повратном вредношћу која је такође референца.])#list(list.item[Тј. повратна вредност мора бити позајмљена однекуд, али компајлер не може да
одреди да ли је позајмљена од #raw("x") или #raw("y") или од неке глобалне вредности.])#list(list.item[Ова информација је потребна да би се обавила калкулација и провера животног века.])
#heading(level: 2)[Синтакса за анотацију животног века] #label("org290cb1b")
#list(list.item[Да би помогли компајлеру референце означавамо са животним веком и тиме
доводимо у везу различите референце (нпр. параметре и повратне вредности
функције).])#list(list.item[Анотација је облика #raw("'a"). Иза апострофа се пише име анотације које је најчешће
једно мало слово са почетка алфабета (#raw("'a, 'b,...")).])#list(list.item[#text(weight: "bold", [Важно:]) анотације животног века не мењају животни век референце већ само
помажу компајлеру у провери.])

#figure([#raw(block: true, lang: "rust", "&i32        // референца
&'a i32     // референца са експлицитним животним веком
&'a mut i32 // промењива референца са експлицитним животним веком")]) #label("org7bd2aeb")

#list(list.item[Једна анотација нема пуно смисла. Функцију имају тек када анотирамо више
референци јер се доводе у везу ако имају исто име.])#list(list.item[Уведимо функцију #raw("lt") која враћа животни век варијабле\u{2f}вредности и релацију
између животних векова #raw("'a≥'b") односно #raw("'b≤'a") која значи да #raw("'a") обухвата #raw("'b")
односно #raw("'b") је садржано у #raw("'a").])
#heading(level: 2)[Анотација животног века у сигнатурама функција] #label("orgcb9fbfe")
#list(list.item[Следећа анотација за функцију #raw("longest") је исправна јер референца која се враћа
може бити #raw("x") или #raw("y") у зависности од дужине стринга. Стога је потребно да имамо
строжији услов да је животни век повратне вредности у вези са животним веком
оба параметра.])

#figure([#raw(block: true, lang: "rust", "fn longest<'a>(x: &'a str, y: &'a str) -> &'a str {
    if x.len() > y.len() {
        x
    } else {
        y
    }
}")]) #label("orgc8c6fc0")

#list(list.item[Овим кажемо компајлеру да за неки генерички животни век #raw("'a"), функција прима две
референце чији животни век вредности обухвата #raw("'a") и враћа референцу која мора
бити валидна бар колико и животни век #raw("'a") тј. животни век повратне референце
мора да обухвати #raw("'a"). Уколико такав животни век постоји код се прихвата.])#list(list.item[Сигнатура доводи у везу обе улазне референце са излазном.])

Посматрајмо код који позива функцију #raw("longest"):

#figure([#raw(block: true, lang: "rust", "fn main() {
    let string1 = String::from(\u{22}abcd\u{22});
    {
        let string2 = \u{22}xyz\u{22};
        let result = longest(string1.as_str(), string2);
    }
    println!(\u{22}The longest string is {}\u{22}, result);
}")]) #label("org1994bd8")

За код мора да постоји #raw("'a") тако да важи:

Што не може бити испуњено истовремено, тј. не постоји #raw("'a") које испуњава ова
ограничења.

Други начин размишљања је да повратна вредност функције позајмљује од
вредности улазних параметара означених истим именом животног века.

#figure([#raw(block: true, lang: "rust", "fn main() {
    let string1 = String::from(\u{22}abcd\u{22});
    {
        let string2 = \u{22}xyz\u{22};
        let result = longest(string1.as_str(), string2);
    }
    println!(\u{22}The longest string is {}\u{22}, result);
}")]) #label("orgf2dd7e6")

Што значи да #raw("result") позајмљује од #raw("string1") и #raw("string2") и та позајмица траје све
време живота варијабле #raw("result") што не може бити валидно јер #raw("result") живи дуже
од вредности #raw("string2").

Иако, можемо видети да ће, због дужине стринга, враћена вредност бити #raw("string1") и
програм је валидан, компајлер ово не може да закључи.
#heading(level: 2)[Ментални модел у контексту животног века] #label("org62da534")
#list(list.item[Навођење анотације животног века зависи од тога шта функција ради.])#list(list.item[На пример:])

#figure([#raw(block: true, lang: "rust", "fn longest<'a>(x: &'a str, y: &str) -> &'a str {
    x
}")]) #label("orgd4d1e19")

#list(list.item[У овом случају враћамо животни век првог параметра чиме саопштавамо компајлеру
да се позајмица врши искључиво од првог параметра.])

#list(list.item[Ако не позајмимо од улазних параметара морамо вратити референцу на вредност
креирану унутар функције, што није дозвољено.])

#figure([#raw(block: true, lang: "rust", "fn longest<'a>(x: &str, y: &str) -> &'a str {
    let result = String::from(\u{22}really long string\u{22});
    result.as_str()
}")]) #label("orgf7c705a")

Немогуће је вратити референцу на локалну промењиву јер би то била висећа
референца. Решење у овом случају је да вратимо поседовану вредност.

Дакле, синтакса за анотацију животних векова доводи у везу животне векове
улазних параметара и повратних вредности. Наводи се само код референци.

На основу анотације, Раст је у стању да обави провере и обезбеди операције које
су меморијски сигурне и забрани операције које би могле да доведу до нарушавања
меморијске сигурности.

Анотације животног века истовремено представљају и корисне информације
програмерима јер је лако видети у каквој су вези улазни параметри и излазне
вредности.
#heading(level: 2)[Анотације животног века у декларацијама структура] #label("org7a44ad6")
#list(list.item[Сложени типови који у себи садрже референце морају увести анотације као врсту
генеричког типа.])

#figure([#raw(block: true, lang: "rust", "struct ImportantExcerpt<'a> {
    part: &'a str,
}

fn main() {
    let novel = String::from(\u{22}Call me Ishmael. Some years ago...\u{22});
    let first_sentence = novel.split('.').next().expect(\u{22}Could not find a '.'\u{22});
    let i = ImportantExcerpt {
        part: first_sentence,
    };
}")]) #label("orgafb3f29")
#heading(level: 2)[Елизија животног века] #label("org2e508eb")
#list(list.item[Имали смо претходно пример у коме нисмо дефинисали анотације животног века.])

#figure([#raw(block: true, lang: "rust", "fn first_word(s: &str) -> &str {
    let bytes = s.as_bytes();

    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return &s[0..i];
        }
    }

    &s[..]
}")]) #label("org96abc5e")

#list(list.item[Постоје одређена правила које називамо #emph[правилима елизије животног века]
(#emph[lifetime elision rules]) и која омогућавају да се избегне анотирање животног
века када је анотација очигледна.])
#heading(level: 2)[Правила елизије животног века] #label("org7edc795")
#enum(enum.item(1)[Компајлер креира животни век за сваку референцу у параметрима функције:],
)

#figure([#raw(block: true, lang: "rust", "fn foo<'a>(x: &'a i32)
fn foo<'a, 'b>(x: &'a i32, y: &'b i32)
итд.")]) #label("org6d5a643")

#enum(enum.item(2)[Када имамо тачно један улазни животни век, он је додељен свим референцама у
повратној вредности:],
)

#figure([#raw(block: true, lang: "rust", "fn foo<'a>(x: &'a i32) -> &'a i32")]) #label("orgea7f9b8")

#enum(enum.item(3)[Ако има више улазних животних векова али је један улазни параметар #raw("&self") ili
#raw("&mut self") тада се овај животни век додељује свим излазним референцема.],
)
#heading(level: 2)[Пример елизије 1] #label("org97b70e3")
#figure([#raw(block: true, lang: "rust", "fn first_word(s: &str) -> &str {")]) #label("org2a15908")

Правило 1.

#figure([#raw(block: true, lang: "rust", "fn first_word<'a>(s: &'a str) -> &str {")]) #label("orga9ce77e")

Правило 2.

#figure([#raw(block: true, lang: "rust", "fn first_word<'a>(s: &'a str) -> &'a str {")]) #label("orgc689448")
#heading(level: 2)[Пример елизије 2] #label("org6299947")
#figure([#raw(block: true, lang: "rust", "fn longest(x: &str, y: &str) -> &str {")]) #label("org7786694")

Правило 1.

#figure([#raw(block: true, lang: "rust", "fn longest<'a, 'b>(x: &'a str, y: &'b str) -> &str {")]) #label("orgc4486c8")

#list(list.item[Не можемо да применимо ни правило 2 ни правило 3. И даље нам излазни параметар
нема анотацију \u{2d}\u{3e} анотација мора ручно да се обави.])
#heading(level: 2)[Анотација животног века у методама] #label("orgf910bb5")
#figure([#raw(block: true, lang: "rust", "impl<'a> ImportantExcerpt<'a> {
    fn level(&self) -> i32 {
        3
    }
}")]) #label("orgeb31558")

#list(list.item[На основу правила 1. не морамо да анотирамо улазну референцу.])

#figure([#raw(block: true, lang: "rust", "impl<'a> ImportantExcerpt<'a> {
    fn announce_and_return_part(&self, announcement: &str) -> &str {
        println!(\u{22}Attention please: {}\u{22}, announcement);
        self.part
    }
}")]) #label("org7915827")

#list(list.item[На основу правила 1 не морамо да анотирамо улазне референце а на основу
правила 3 не морамо да анотирамо ни повратну вредност.])
#heading(level: 2)[Животни век #raw("static")] #label("orgac60c5f")
#list(list.item[Специјалан животни век који означавамо са #raw("'static") означава животни век
целокупног трајања извршавања програма.])#list(list.item[Овај животни век имају статичке вредности јер су такве вредности смештене
директно у извршну датотеку тј. нису алоциране у току извршавања програма.])

#figure([#raw(block: true, lang: "rust", "let s: &'static str = \u{22}I have a static lifetime.\u{22};")]) #label("orga68b5b0")
#heading(level: 2)[Генерички типови, ограничење кроз особине и животни век] #label("orgfb6c232")
#figure([#raw(block: true, lang: "rust", "use std::fmt::Display;

fn longest_with_an_announcement<'a, T>(
    x: &'a str,
    y: &'a str,
    ann: T,
) -> &'a str
where
    T: Display,
{
    println!(\u{22}Announcement! {}\u{22}, ann);
    if x.len() > y.len() {
        x
    } else {
        y
    }
}")]) #label("org9625ed2")
#heading(level: 1)[Паметни поинтери \u{2d} други део] #label("orgf322a0b")
#heading(level: 2)[Образац интерне промењивости \u{2d} #raw("RefCell<T>")] #label("org83b0c4d")
#list(list.item[Дизајн образац за измену података чак и када постоје дељене референце.])#list(list.item[Ово је забрањено правилима позајмљивања.])#list(list.item[Интерно користи несигуран кôд (#emph[unsafe]) чиме се ставља до знања компајлеру да
се провера обавља од стране #raw("RefCell<T>") типа.])#list(list.item[Провера се сели из времена компајлирања у време извршавања (#emph[run\u{2d}time])])
#heading(level: 3)[Правила позајмљивања у време извршавања \u{2d} #raw("RefCell<T>")] #label("org3c025a8")
#list(list.item[За разлику од #raw("Rc<T>"), #raw("RefCell<T>") може имати само једног власника.])#list(list.item[У чему је разлика у односу на #raw("Box<T>")?])

Подсетимо се правила позајмљивања:

#enum(enum.item(1)[У сваком тренутку можемо имати или једну промењиву или произвољан број
непромењивих референци.],
enum.item(2)[Референце увек морају бити валидне.],
)

#list(list.item[Код #raw("Box<T>") правила позајмљивања се проверавају у време компајлирања (статички).
Ако прекршимо правила кôд се неће компајлирати.])#list(list.item[Код #raw("RefCell<T>") правила позајмљивања се проверавају у време извршавања.
Ако прекршимо правила програм ће прекинути са извршавањем (#emph[panic]).])#list(list.item[Боље је провере обавити у време компајлирања али некада то није могуће.])

#list(list.item[Раст компајлер и правила којa користи су исправна али непотпуна (#emph[sound but
uncomplete]). Ово значи да ће сви невалидни програми бити одбијени (#emph[sound]) али
ће бити одбијени и неки валидни програми (#emph[uncomplete]).])#list(list.item[#raw("RefCell<T>") користимо у ситуацијама када знамо да је наш програм валидан али
Раст компајлер то није у стању да верификује статички.])#list(list.item[Правила се и даље проверавају али у време извршавања.])
#heading(level: 3)[Рекапитулација правила паметних поинтера] #label("org2859661")
#list(list.item[#raw("Rc<T>") омогућава више власника. #raw("Box<T>") и #raw("RefCell<T>") само једног.])#list(list.item[#raw("Box<T>") омогућава непромењиве или промењиве позајмице које се проверавају у
време компајлирања. #raw("Rc<T>") дозвољава само непромењиве позајмице у време
компајлирања. #raw("RefCell<T>") дозвољава непромењиве и промењиве позајмице у време
извршавања.])#list(list.item[Пошто #raw("RefCell<T>") омогућава промењиве референце које се проверавају у време
извршавања, можемо мењати унутрашње податке иако имамо дељену референцу у
време компајлирања. Због тога се овај образац назива "унутрашња промењивост"
(#emph[İnterior Mutability]).])
#heading(level: 3)[Студија случаја за примену #raw("RefCell<T>") \u{2d} #emph[Mock] објекти] #label("orga29c3ec")
#list(list.item[Лажни објекти коришћени у тестирању, посебна врста тест дублера (#emph[test
doubles]).])#list(list.item[#emph[Mock] објекти региструју информације о позивима да би се у тесту те информације
могле верификовати.])

Креирамо библиотеку за праћење потрошње неког ресурса и обавештавање када се
приближавамо лимиту потрошње.

#figure([#raw(block: true, lang: "rust", "pub trait Messenger {
    fn send(&self, msg: &str);
}

pub struct LimitTracker<'a, T: Messenger> {
    messenger: &'a T,
    value: usize,
    max: usize,
}")]) #label("orgdb81e94")

#figure([#raw(block: true, lang: "rust", "impl<'a, T> LimitTracker<'a, T>
where
    T: Messenger,
{
    pub fn new(messenger: &'a T, max: usize) -> LimitTracker<'a, T> {
        LimitTracker {
            messenger,
            value: 0,
            max,
        }
    }

    pub fn set_value(&mut self, value: usize) {
        self.value = value;

        let percentage_of_max = self.value as f64 / self.max as f64;

        if percentage_of_max >= 1.0 {
            self.messenger.send(\u{22}Error: You are over your quota!\u{22});
        } else if percentage_of_max >= 0.9 {
            self.messenger
                .send(\u{22}Urgent warning: You've used up over 90% of your quota!\u{22});
        } else if percentage_of_max >= 0.75 {
            self.messenger
                .send(\u{22}Warning: You've used up over 75% of your quota!\u{22});
        }
    }
}")]) #label("org3d268c6")
#heading(level: 3)[#emph[Mock] објекти \u{2d} проблем са тестирањем] #label("orgd4507c5")
#figure([#raw(block: true, lang: "rust", "#[cfg(test)]
mod tests {
    use super::*;
    struct MockMessenger {
        sent_messages: Vec<String>,
    }

    impl MockMessenger {
        fn new() -> MockMessenger {
            MockMessenger {
                sent_messages: vec![],
            }
        }
    }

    impl Messenger for MockMessenger {
        fn send(&self, message: &str) {
            self.sent_messages.push(String::from(message));
        }
    }

    #[test]
    fn it_sends_an_over_75_percent_warning_message() {
        let mock_messenger = MockMessenger::new();
        let mut limit_tracker = LimitTracker::new(&mock_messenger, 100);

        limit_tracker.set_value(80);
        assert_eq!(mock_messenger.sent_messages.len(), 1);
    }
}")]) #label("orge7c6b2e")
#heading(level: 3)[#emph[Mock] објекти \u{2d} решење са #raw("RefCell<T>")] #label("org403eaf5")
#figure([#raw(block: true, lang: "rust", "#[cfg(test)]
mod tests {
    use super::*;
    use std::cell::RefCell;

    struct MockMessenger {
        sent_messages: RefCell<Vec<String>>,
    }

    impl MockMessenger {
        fn new() -> MockMessenger {
            MockMessenger {
                sent_messages: RefCell::new(vec![]),
            }
        }
    }

    impl Messenger for MockMessenger {
        fn send(&self, message: &str) {
            self.sent_messages.borrow_mut().push(String::from(message));
        }
    }

    #[test]
    fn it_sends_an_over_75_percent_warning_message() {
        // --snip--

        assert_eq!(mock_messenger.sent_messages.borrow().len(), 1);
    }
}")]) #label("org86255ab")
#heading(level: 3)[Покушај нарушавања правила позајмљивања] #label("org6a09a24")
#figure([#raw(block: true, lang: "rust", "impl Messenger for MockMessenger {
        fn send(&self, message: &str) {
            let mut one_borrow = self.sent_messages.borrow_mut();
            let mut two_borrow = self.sent_messages.borrow_mut();

            one_borrow.push(String::from(message));
            two_borrow.push(String::from(message));
        }
    }")]) #label("orgab3c3d2")
#heading(level: 3)[Вишеструко власништво над промењивим подацима \u{2d} #raw("Rc<T>") \u{2b} #raw("RefCell<T>")] #label("org73e3316")
#list(list.item[Ако нам треба унутрашња промењивост и могућност постојања више власника можемо
искомбиновати #raw("Rc<T>") и #raw("RefCell<T>") типове.])

#figure([#raw(block: true, lang: "rust", "#[derive(Debug)]
enum List {
    Cons(Rc<RefCell<i32>>, Rc<List>),
    Nil,
}

use crate::List::{Cons, Nil};
use std::cell::RefCell;
use std::rc::Rc;

fn main() {
    let value = Rc::new(RefCell::new(5));

    let a = Rc::new(Cons(Rc::clone(&value), Rc::new(Nil)));

    let b = Cons(Rc::new(RefCell::new(3)), Rc::clone(&a));
    let c = Cons(Rc::new(RefCell::new(4)), Rc::clone(&a));

    *value.borrow_mut() += 10;

    println!(\u{22}a after = {:?}\u{22}, a);
    println!(\u{22}b after = {:?}\u{22}, b);
    println!(\u{22}c after = {:?}\u{22}, c);
}")]) #label("org646ef02")
#heading(level: 2)[Цикличне референце и цурење меморије] #label("org2250b19")
#list(list.item[Раст меморијске гаранције чине тешким али не и немогућим алокацију меморије
која се никада не ослобађа. Ово није једна од Раст гаранција.])#list(list.item[Комбиновање #raw("Rc<T>") и #raw("RefCell<T>") може да доведе до цурења меморије (#emph[memory leak]).])
#heading(level: 2)[Креирање цикличних референци] #label("org5d5c2df")
#figure([#raw(block: true, lang: "rust", "use List::{Cons, Nil};
use std::cell::RefCell;
use std::rc::Rc;

#[derive(Debug)]
enum List {
    Cons(i32, RefCell<Rc<List>>),
    Nil,
}

impl List {
    fn tail(&self) -> Option<&RefCell<Rc<List>>> {
        match self {
            Cons(_, item) => Some(item),
            Nil => None,
        }
    }
}")]) #label("orgc20727c")

#figure([#raw(block: true, lang: "rust", "<<cycle-refs-header>> // <- Занемарите овy линију
fn main() {
    let a = Rc::new(Cons(5, RefCell::new(Rc::new(Nil))));

    println!(\u{22}a initial rc count = {}\u{22}, Rc::strong_count(&a));
    println!(\u{22}a next item = {:?}\u{22}, a.tail());

    let b = Rc::new(Cons(10, RefCell::new(Rc::clone(&a))));

    println!(\u{22}a rc count after b creation = {}\u{22}, Rc::strong_count(&a));
    println!(\u{22}b initial rc count = {}\u{22}, Rc::strong_count(&b));
    println!(\u{22}b next item = {:?}\u{22}, b.tail());

    if let Some(link) = a.tail() {
        *link.borrow_mut() = Rc::clone(&b);
    }

    println!(\u{22}b rc count after changing a = {}\u{22}, Rc::strong_count(&b));
    println!(\u{22}a rc count after changing a = {}\u{22}, Rc::strong_count(&a));

    // Uncomment the next line to see that we have a cycle;
    // it will overflow the stack
    // println!(\u{22}a next item = {:?}\u{22}, a.tail());
}")]) #label("org1fe3699")

#figure([#image(sys.inputs.file-9)]) #label("orgf22290a")
#heading(level: 2)[Цикличне референце \u{2d} могуће решење] #label("org6fff093")
#list(list.item[Конверзија #raw("Rc<T>") у #raw("Weak<T>").])#list(list.item["Слабе" референце нису власници тако да не утичу на деалокацију меморије.])#list(list.item[Видети детаље у књизи #link("https://doc.rust-lang.org/stable/book/ch15-06-reference-cycles.html")[The Rust Programming Language, поглавље 15.06] #footnote(link("https://doc.rust-lang.org/stable/book/ch15-06-reference-cycles.html"))])
#heading(level: 1)[Функционално програмирање, затворења и итератори] #label("orgcaa0449")
#heading(level: 2)[Затворења (#emph[closures])] #label("orgbb0a861")
#list(list.item[Анонимне функције које се могу сачувати у варијабли и проследити другим функцијама.])#list(list.item[За разлику од обичних функција, затворења "памте" варијабле из свога окружења.])#list(list.item[Често се користе као параметри функција за трансформацију итератора.])
#heading(level: 3)[Пример] #label("org8f2a68d")
#list(list.item[Фирма која врши промоцију периодичним слањем мајци насумично одабраним
клијентима са мејлинг листе.])#list(list.item[Ако клијент има омиљену боју подешену у профилу мајица те боје му се шаље. У
супротном, шаље му се мајица у боји које тренутно има највише на стању.])

#figure([#raw(block: true, lang: "rust", "#[derive(Debug, PartialEq, Copy, Clone)]
enum ShirtColor {
    Red,
    Blue,
}

struct Inventory {
    shirts: Vec<ShirtColor>,
}")]) #label("org56ec1e9")

#figure([#raw(block: true, lang: "rust", "impl Inventory {
    fn giveaway(&self, user_preference: Option<ShirtColor>) -> ShirtColor {
        user_preference.unwrap_or_else(|| self.most_stocked())    // <- Затворење
    }

    fn most_stocked(&self) -> ShirtColor {
        let mut num_red = 0;
        let mut num_blue = 0;

        for color in &self.shirts {
            match color {
                ShirtColor::Red => num_red += 1,
                ShirtColor::Blue => num_blue += 1,
            }
        }
        if num_red > num_blue {
            ShirtColor::Red
        } else {
            ShirtColor::Blue
        }
    }
}")]) #label("orgfd183b1")

#figure([#raw(block: true, lang: "rust", "<<giveaway-types>>
<<giveaway-inventory>> // <- Занемарите ове линије
fn main() {
    let store = Inventory {
        shirts: vec![ShirtColor::Blue, ShirtColor::Red, ShirtColor::Blue],
    };

    let user_pref1 = Some(ShirtColor::Red);
    let giveaway1 = store.giveaway(user_pref1);
    println!(
        \u{22}The user with preference {:?} gets {:?}\u{22},
        user_pref1, giveaway1
    );

    let user_pref2 = None;
    let giveaway2 = store.giveaway(user_pref2);
    println!(
        \u{22}The user with preference {:?} gets {:?}\u{22},
        user_pref2, giveaway2
    );
}")]) #label("orga0d0fd9")

#raw(block: false, "The user with preference Some(Red) gets Red
The user with preference None gets Blue")
#heading(level: 3)[Инференца типова] #label("org902529a")
#list(list.item[За разлику од функција, код затворења није неопходна анотација типова
параметара и повратних вредности.])#list(list.item[Уколико је анотација потребна то радимо на следећи начин:])

#figure([#raw(block: true, lang: "rust", "let expensive_closure = |num: u32| -> u32 {
        println!(\u{22}calculating slowly...\u{22});
        thread::sleep(Duration::from_secs(2));
        num
    };")]) #label("org75c3123")
#heading(level: 3)[Поређење са функцијама] #label("orgbe7ee90")
#figure([#raw(block: true, lang: "rust", "fn  add_one_v1   (x: u32) -> u32 { x + 1 }
let add_one_v2 = |x: u32| -> u32 { x + 1 };
let add_one_v3 = |x|             { x + 1 };
let add_one_v4 = |x|               x + 1  ;")]) #label("orga73333e")

#list(list.item[Последње две линије захтевају евалуацију затворења да би компајлер могао да
изведе типове, слично као употреба #raw("let v = Vec::new()").])
#heading(level: 3)[Инференца типова при евалуацији] #label("orgcab8efa")
#figure([#raw(block: true, lang: "rust", "let example_closure = |x| x;

let s = example_closure(String::from(\u{22}hello\u{22}));
let n = example_closure(5);")]) #label("org8089295")

#figure([#raw(block: true, lang: "sh", "$ cargo run
   Compiling closure-example v0.1.0 (file:///projects/closure-example)
error[E0308]: mismatched types
 --> src/main.rs:5:29
  |
5 |     let n = example_closure(5);
  |             --------------- ^- help: try using a conversion method: `.to_string()`
  |             |               |
  |             |               expected struct `String`, found integer
  |             arguments to this function are incorrect
  |
note: closure parameter defined here
 --> src/main.rs:2:28
  |
2 |     let example_closure = |x| x;
  |                            ^

For more information about this error, try `rustc --explain E0308`.
error: could not compile `closure-example` due to previous error")]) #label("orgea1ea19")
#heading(level: 3)[Памћење окружења \u{2d} референце и власништва] #label("org74be073")
#list(list.item[Затворење може да запамти варијабле свога окружења на три начина, као и код
преноса параметара функције:
#enum(enum.item(1)[непромењива позајмица (дељена референца)],
enum.item(2)[промењива позајмица (јединствена референца)],
enum.item(3)[узимање власништва (премештање)],
)])
#heading(level: 3)[Памћење окружења \u{2d} непромењива позајмица] #label("orge1185b0")
#figure([#raw(block: true, lang: "rust", "fn main() {
    let list = vec![1, 2, 3];
    println!(\u{22}Before defining closure: {:?}\u{22}, list);

    let only_borrows = || println!(\u{22}From closure: {:?}\u{22}, list);

    println!(\u{22}Before calling closure: {:?}\u{22}, list);
    only_borrows();
    println!(\u{22}After calling closure: {:?}\u{22}, list);
}")]) #label("org6dd3af6")

#raw(block: false, "Before defining closure: [1, 2, 3]
Before calling closure: [1, 2, 3]
From closure: [1, 2, 3]
After calling closure: [1, 2, 3]")
#heading(level: 3)[Памћење окружења \u{2d} промењива позајмица] #label("org4191e6f")
#figure([#raw(block: true, lang: "rust", "fn main() {
    let mut list = vec![1, 2, 3];
    println!(\u{22}Before defining closure: {:?}\u{22}, list);

    let mut borrows_mutably = || list.push(7);

    // println!(\u{22}Before calling closure: {:?}\u{22}, list); // <- Ово не може!
    borrows_mutably();
    println!(\u{22}After calling closure: {:?}\u{22}, list);
}")]) #label("org54a64bf")

#raw(block: false, "Before defining closure: [1, 2, 3]
After calling closure: [1, 2, 3, 7]")
#heading(level: 3)[Памћење окружења \u{2d} узимање власништва] #label("orgaf9d4e5")
#list(list.item[Ако желимо да затворење преузме власништво над вредношћу користимо кључну реч #raw("move").])#list(list.item[Најчешће користимо у контексту нити.])

#figure([#raw(block: true, lang: "rust", "use std::thread;

fn main() {
    let list = vec![1, 2, 3];
    println!(\u{22}Before defining closure: {:?}\u{22}, list);

    thread::spawn(move || println!(\u{22}From thread: {:?}\u{22}, list))
        .join()
        .unwrap();
}")]) #label("org468d666")

#raw(block: false, "Before defining closure: [1, 2, 3]
From thread: [1, 2, 3]")


#list(list.item[Неопходно јер #raw("main") нит може завршити раније и тиме деалоцирати #raw("list") вредност
која би још увек била позајмљена од стране креиране нити.])

#list(list.item[Ако уклонимо кључну реч #raw("move") добићемо следећу грешку:])

#figure([#raw(block: true, lang: "sh", "error[E0373]: closure may outlive the current function, but it borrows `list`, which
is owned by the current function
 --> src/main.rs:8:19
  |
8 |     thread::spawn(|| println!(\u{22}From thread: {:?}\u{22}, list))
  |                   ^^                               ---- `list` is borrowed here
  |                   |
  |                   may outlive borrowed value `list`
  |
note: function requires argument type to outlive `'static`
 --> src/main.rs:8:5
  |
8 |     thread::spawn(|| println!(\u{22}From thread: {:?}\u{22}, list))
  |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
help: to force the closure to take ownership of `list` (and any other referenced variables),
use the `move` keyword
  |
8 |     thread::spawn(move || println!(\u{22}From thread: {:?}\u{22}, list))
  |                   ++++

For more information about this error, try `rustc --explain E0373`.
error: could not compile `cargo0sMXjj` due to previous error")]) #label("orgb1a154f")
#heading(level: 3)[Премештање запамћених вредности и #raw("Fn") особине] #label("org2cc89bf")
#list(list.item[Затворење може са запамћеним вредностима да уради нешто од следећег:
#enum(enum.item(1)[Врати власништво позиваоцу приликом евалуације.],
enum.item(2)[Измени запамћену вредност.],
enum.item(3)[Само чита запамћену вредности.],
enum.item(4)[или, може и да не запамти ниједну вредност из свог окружења.],
)])

#list(list.item[У зависности од тога, затворење ће аутоматски имплементирати једну, две или
све три особине:
#enum(enum.item(1)[#raw("FnOnce") \u{2d} затворења која могу да се позову једном. Сва затворења
имплементирају бар ову особину, пошто могу да се позову бар једном.
Затворења која предају власништво запамћене вредности приликом позива
имплементрају само ову особину пошто се не могу позвати више од једном.],
enum.item(2)[#raw("FnMut") \u{2d} затворења која не премештају вредности али их могу мењати. Могу се
позвати више од једном.],
enum.item(3)[#raw("Fn") \u{2d} затворења која нити премештају нити мењају своје окружење, или не
памте ништа из окружења. Могу се позвати више пута.],
)])
#heading(level: 3)[Пример \u{2d} #raw("FnOnce")] #label("org26181a0")
#figure([#raw(block: true, lang: "rust", "impl<T> Option<T> {
    pub fn unwrap_or_else<F>(self, f: F) -> T
    where
        F: FnOnce() -> T
    {
        match self {
            Some(x) => x,
            None => f(),
        }
    }
}")]) #label("org43952da")

#list(list.item[#raw("unwrap_or_else") прихвата најопштији облик затворења која имплементирају #raw("FnOnce").])
#heading(level: 3)[Пример \u{2d} #raw("FnMut")] #label("org5f25c02")
#figure([#raw(block: true, lang: "rust", "#[derive(Debug)]
struct Rectangle {
    width: u32,
    height: u32,
}

fn main() {
    let mut list = [
        Rectangle { width: 10, height: 1 },
        Rectangle { width: 3, height: 5 },
        Rectangle { width: 7, height: 12 },
    ];

    list.sort_by_key(|r| r.width);
    println!(\u{22}{:#?}\u{22}, list);
}")]) #label("org226195b")

#list(list.item[Сигнатура за методу #raw("sort_by_key") над исечком je #raw("FnMut"). Зашто?])
#figure([#raw(block: true, lang: "rust", "pub fn sort_by_key<K, F>(&mut self, f: F)
where
    F: FnMut(&T) -> K,
    K: Ord,")]) #label("org05b8852")

#list(list.item[Затворење се позива за сваки елемент исечка тако да не може бити само #raw("FnOnce")
већ мора имати додатна ограничења.])#list(list.item[Иако затворење у овом случају #raw("|r| r.width") не модификује својe окружење ипак је
ограничење тако дефинисано да буде најмање рестриктивно. Стога, пошто је
једини захтев да затворење можемо позивати више пута, ограничење које је
следеће најмање рестриктивно после #raw("FnOnce") је #raw("FnMut").])#list(list.item[Овим ћемо моћи проследити затворења која су и #raw("Fn") и #raw("FnMut") али не и она која су
само #raw("FnOnce").])

#list(list.item[Да видимо шта ће бити ако имамо затворење које ради премештање из окружења и
тиме је само #raw("FnOnce").])

#figure([#raw(block: true, lang: "rust", "#[derive(Debug)]
struct Rectangle {
    width: u32,
    height: u32,
}

fn main() {
    let mut list = [
        Rectangle { width: 10, height: 1 },
        Rectangle { width: 3, height: 5 },
        Rectangle { width: 7, height: 12 },
    ];

    let mut sort_operations = vec![];
    let value = String::from(\u{22}by key called\u{22});

    list.sort_by_key(|r| {
        sort_operations.push(value);
        r.width
    });
    println!(\u{22}{:#?}\u{22}, list);
}")]) #label("org2c7c2fb")

#figure([#raw(block: true, lang: "sh", "error[E0507]: cannot move out of `value`, a captured variable in an `FnMut` closure
  --> src/main.rs:19:30
   |
16 |     let value = String::from(\u{22}by key called\u{22});
   |         ----- captured outer variable
17 |
18 |     list.sort_by_key(|r| {
   |                      --- captured by this `FnMut` closure
19 |         sort_operations.push(value);
   |                              ^^^^^ move occurs because `value` has type `String`, which
   does not implement the `Copy` trait

For more information about this error, try `rustc --explain E0507`.
error: could not compile `cargoHMNw8k` due to previous error")]) #label("org2719a0f")

#list(list.item[Али ово ће радити јер је сада затворење #raw("FnMut").])

#figure([#raw(block: true, lang: "rust", "#[derive(Debug)]
struct Rectangle {
    width: u32,
    height: u32,
}

fn main() {
    let mut list = [
        Rectangle { width: 10, height: 1 },
        Rectangle { width: 3, height: 5 },
        Rectangle { width: 7, height: 12 },
    ];

    let mut num_sort_operations = 0;
    list.sort_by_key(|r| {
        num_sort_operations += 1;
        r.width
    });
    println!(\u{22}{:#?}, sorted in {num_sort_operations} operations\u{22}, list);
}")]) #label("orgcddba96")
#heading(level: 2)[Итератори] #label("org815a269")
#list(list.item[Итератор образац омогућава процесирање елемената секвенци.])#list(list.item[Итератори имплементирају логику итерације тј. преузимање елемента редом из
секвенце и логику детекције краја итерације.])#list(list.item[Итератори у Расту су "лењи", односно процесирање ће се одложити и обавити тек
онда када је то заиста потребно.])
#heading(level: 3)[Пример] #label("orgc00e2dc")
#figure([#raw(block: true, lang: "rust", "let v1 = vec![1, 2, 3];

let v1_iter = v1.iter();")]) #label("org3988970")

#list(list.item[#raw("v1_iter") је итератор. Сам по себи не ради ништа док се не конзумира.])

#figure([#raw(block: true, lang: "rust", "let v1 = vec![1, 2, 3];

let v1_iter = v1.iter();

for val in v1_iter {
    println!(\u{22}Got: {}\u{22}, val);
}")]) #label("org829a558")

#raw(block: false, "Got: 1
Got: 2
Got: 3")
#heading(level: 3)[#raw("Iterator") особина и метода #raw("next")] #label("org9acf64c")
#figure([#raw(block: true, lang: "rust", "pub trait Iterator {
    type Item;

    fn next(&mut self) -> Option<Self::Item>;

    // methods with default implementations elided
}")]) #label("orgdbbef32")

#list(list.item[Ова особина има придружени тип (#emph[associated type]) \u{2d} #raw("type Item") односно
#raw("Self::Item"). Стога, имплементација ове особине над неким типом захтева
дефиницију и придруженог типа који представља тип елемената над којима се врши
итерација.])
#heading(level: 3)[Демонстрација итерације] #label("orgfa3e713")
#figure([#raw(block: true, lang: "rust", "#[test]
fn iterator_demonstration() {
    let v1 = vec![1, 2, 3];

    let mut v1_iter = v1.iter();

    assert_eq!(v1_iter.next(), Some(&1));
    assert_eq!(v1_iter.next(), Some(&2));
    assert_eq!(v1_iter.next(), Some(&3));
    assert_eq!(v1_iter.next(), None);
}")]) #label("org1c6b6cf")

#list(list.item[Сваки позив методе #raw("next") врши конзумацију итератора, односно узима се наредни
елемент и ажурира се интерно стање итератора.])#list(list.item[У овом случају #raw("iter") метода производи итератор кроз непромењиве (дељене)
референце над елементима вектора, тако да #raw("next") враћа непромењиву референцу на
наредни елемент.])#list(list.item[Ако нам треба итерација преко промењивих референци користимо методу #raw("iter_mut").])#list(list.item[Ако нам треба итерација преко власничких вредности користимо методу #raw("into_iter").
У том случају итератор постаје власник колекције и враћа премештене вредности
при сваком позиву #raw("next") методе.])
#heading(level: 3)[Методе које конзумирају итераторе] #label("org0862625")
#list(list.item[#raw("Iterator") особина има богат API.])#list(list.item[Неке од ових метода позивају #raw("next") методу. За такве методе кажемо да су
конзумирајући адаптери јер врше конзумацију итератора.])#list(list.item[На пример, #raw("sum") метода.])

#figure([#raw(block: true, lang: "rust", "let v1 = vec![1, 2, 3];

let v1_iter = v1.iter();

let total: i32 = v1_iter.sum();

// println!(\u{22}{:?}\u{22}, v1_iter.next());  // <- Ово не може.

assert_eq!(total, 6);")]) #label("org5093171")

#list(list.item[Када се позове #raw("sum") више нисмо у стању да позовемо #raw("v1_iter") јер смо га
конзумирали.])
#heading(level: 3)[Методе које производе друге итераторе] #label("org7b34569")
#list(list.item[Називамо их итератор адаптерима.])#list(list.item[Врше конверзију једног итератора у неки други итератор.])

#figure([#raw(block: true, lang: "rust", "let v1: Vec<i32> = vec![1, 2, 3];

v1.iter().map(|x| x + 1);")]) #label("orge4cdc47")

#list(list.item[Претходни код производи упозорење:])

#figure([#raw(block: true, lang: "rust", "$ cargo run
   Compiling iterators v0.1.0 (file:///projects/iterators)
warning: unused `Map` that must be used
 --> src/main.rs:4:5
  |
4 |     v1.iter().map(|x| x + 1);
  |     ^^^^^^^^^^^^^^^^^^^^^^^^
  |
  = note: iterators are lazy and do nothing unless consumed
  = note: `#[warn(unused_must_use)]` on by default

warning: `iterators` (bin \u{22}iterators\u{22}) generated 1 warning
    Finished dev [unoptimized + debuginfo] target(s) in 0.47s
     Running `target/debug/iterators`")]) #label("org8c79cd6")

#list(list.item[Итератор адаптери су "лењи". Претходни итератор није конзумиран тако да се
мапирање никада неће извршити.])

#list(list.item[Дакле, морамо конзумирати итератор. Једна од метода за конзумацију итератора
је #raw("collect") која ће да конзумира итератор и креира колекцију са елементима које
он враћа.])

#figure([#raw(block: true, lang: "rust", "let v1: Vec<i32> = vec![1, 2, 3];

let v2: Vec<_> = v1.iter().map(|x| x + 1).collect();

assert_eq!(v2, vec![2, 3, 4]);")]) #label("org6fc7cb7")

#list(list.item[Обратите пажњу да је била потребна анотација типа јер је #raw("collect") генеричка
метода која може да креира вредности различитог типа.])#list(list.item[Можете позивати више адаптера у низу и сви заједно су лењи тј. морате на крају
позвати методу која конзумира да бисте извршили цео ланац.])
#heading(level: 3)[Употреба затворења као параметара итератор адаптера] #label("orgb06c7b4")
#list(list.item[Многи адаптери користе затворења као своје параметре.])

#figure([#raw(block: true, lang: "rust", "#[derive(PartialEq, Debug)]
struct Shoe {
    size: u32,
    style: String,
}

fn shoes_in_size(shoes: Vec<Shoe>, shoe_size: u32) -> Vec<Shoe> {
    shoes.into_iter().filter(|s| s.size == shoe_size).collect()
}")]) #label("org4df19e6")

#figure([#raw(block: true, lang: "rust", "let shoes = vec![
    Shoe {
        size: 10,
        style: String::from(\u{22}sneaker\u{22}),
    },
    Shoe {
        size: 13,
        style: String::from(\u{22}sandal\u{22}),
    },
    Shoe {
        size: 10,
        style: String::from(\u{22}boot\u{22}),
    },
];

let in_my_size = shoes_in_size(shoes, 10);

assert_eq!(
    in_my_size,
    vec![
        Shoe {
            size: 10,
            style: String::from(\u{22}sneaker\u{22})
        },
        Shoe {
            size: 10,
            style: String::from(\u{22}boot\u{22})
        },
    ]
);")]) #label("org307c773")
#heading(level: 3)[Употреба итератор адаптера за писање концизнијег кода] #label("org768327b")
#list(list.item[Пример претраге са #raw("for") петљом:])
#figure([#raw(block: true, lang: "rust", "pub fn search<'a>(query: &str, contents: &'a str) -> Vec<&'a str> {
    let mut results = Vec::new();

    for line in contents.lines() {
        if line.contains(query) {
            results.push(line);
        }
    }

    results
}")]) #label("org82c5584")

#list(list.item[Исти алгоритам употребом итератор адаптера:])

#figure([#raw(block: true, lang: "rust", "pub fn search<'a>(query: &str, contents: &'a str) -> Vec<&'a str> {
    contents
        .lines()
        .filter(|line| line.contains(query))
        .collect()
}")]) #label("org454ab97")

#list(list.item[Иако интуитивно можемо да помислимо да је код написан на вишем нивоу употребом
итератора спорији, заправо компајлер је у прилици да боље оптимизује овај код
и он је често нешто бржи од еквивалентног кода написаног употребом #raw("for") петље.])
#heading(level: 3)[Анализа сложенијих примера] #label("org93035a5")
#figure([#raw(block: true, lang: "rust", "let buffer: &mut [i32];
let coefficients: [i64; 12];
let qlp_shift: i16;

for i in 12..buffer.len() {
    let prediction = coefficients.iter()
                                 .zip(&buffer[i - 12..i])
                                 .map(|(&c, &s)| c * s as i64)
                                 .sum::<i64>() >> qlp_shift;
    let delta = buffer[i];
    buffer[i] = prediction as i32 + delta;
}")]) #label("orgd0e0556")

#figure([#raw(block: true, lang: "rust", "token_recognizers
    .iter()
    .map(|tr| {
        (
            tr.recognize(&context.input[context.position..]),
            tr.token_kind(),
        )
    })
    // Skip unsuccesful recognition
    .skip_while(|(recognized, _)| recognized.is_none())
    // Create tokens
    .map(|(recognized, token_kind)| Token {
        kind: token_kind,
        value: recognized.unwrap(),
        location: recognized.unwrap().location_span(context.location),
    })
    // Take the first token or return None if no tokens are found.
    .next()")]) #label("org1ce9d7b")

#figure([#raw(block: true, lang: "rust", "let max_actions = self
    .table
    .states
    .iter()
    .map(|x| x.actions.iter().filter(|x| !x.is_empty()).count())
    .max()
    .unwrap();")]) #label("org71d68eb")

#figure([#raw(block: true, lang: "rust", "let mut terminals = state
    .actions
    .iter()
    .enumerate()
    .filter(|(_, actions)| !actions.is_empty())
    .map(|(idx, _)| TermIndex(idx))
    .collect::<Vec<_>>();")]) #label("orgaba3f1c")

#figure([#raw(block: true, lang: "rust", "fn context_str(&self, position: usize) -> String {
    format!(
        \u{22}{:?}\u{22},
        self[position - min(15, position)..position]
            .iter()
            .map(|x| format!(\u{22}{x}\u{22}))
            .chain(once(\u{22}-->\u{22}.to_string()))
            .chain(self[position..].iter().map(|x| format!(\u{22}{x}\u{22})).take(15))
            .collect::<Vec<_>>()
    )
}")]) #label("orgd73b415")

#figure([#raw(block: true, lang: "rust", "let actions = state
    .actions
    .iter()
    .enumerate()
    .filter(|(_, a)| !a.is_empty())
    .flat_map(|(i, a)| repeat(i).zip(a.iter()))
    .map(|(i, a)| {
        (
            self.grammar.terminals[TermIndex(i)].name.clone(),
            match a {
                Action::Shift(s) => format!(\u{22}Shift to {s}\u{22}),
                Action::Reduce(p, l) => {
                    format!(
                        \u{22}Reduce for len {l} by:   {}\u{22},
                        self.grammar.productions[*p]
                            .to_string(self.grammar)
                    )
                }
                Action::Accept => \u{22}Accept\u{22}.into(),
            },
        )
    })
    .collect::<Vec<_>>();")]) #label("orgf01be70")
#heading(level: 1)[Објектно\u{2d}оријентисано програмирање у Расту] #label("org45ad49d")
#heading(level: 2)[Објектно\u{2d}оријентисане особине Раста] #label("org942d669")
#heading(level: 3)[Објекти садрже податке и понашање] #label("org2f93cbf")
#list(list.item[Дефиниција из књиге: Erich Gamma, Richard Helm, Ralph Johnson, and John
Vlissides: #emph[Design Patterns: Elements of Reusable Object\u{2d}Oriented Software],
Addison\u{2d}Wesley Professional, 1994. (позната под називом #emph[The Gang of Four
book \u{2d} GoF]):

#figure([#quote(block: true)[Object\u{2d}oriented programs are made up of objects. An object packages both data
and the procedures that operate on that data. The procedures are typically
called methods or operations.
]]) #label("org11515fb")])#list(list.item[Према овој дефиницији Раст јесте објектно\u{2d}оријентисан језик.])
#heading(level: 3)[Енкапсулација \u{2d} скривање имплементационих детаља] #label("org4dc8d1b")
#list(list.item[Идеја често придружена ООП парадигми је енкапсулација која значи да
имплементациони детаљи објекта нису познати коду који користи посматрани
објекат.])#list(list.item[Раст има могућност енкапсулирања интерне имплементације и дефинисања шта је
споља видљиво употребом #raw("pub") кључне речи.])
#heading(level: 3)[Енкапсулација \u{2d} пример] #label("org9f541e6")
#figure([#raw(block: true, lang: "rust", "pub struct AveragedCollection {
    list: Vec<i32>,
    average: f64,
}")]) #label("org08b229c")

#list(list.item[Можемо мењати интерну имплементацију #raw("AveragedCollection") типа без утицаја на
кориснике док год не мењамо сигнатуре јавних метода.])
#figure([#raw(block: true, lang: "rust", "impl AveragedCollection {
    pub fn add(&mut self, value: i32) {
        self.list.push(value);
        self.update_average();
    }

    pub fn remove(&mut self) -> Option<i32> {
        let result = self.list.pop();
        match result {
            Some(value) => {
                self.update_average();
                Some(value)
            }
            None => None,
        }
    }

    pub fn average(&self) -> f64 {
        self.average
    }

    fn update_average(&mut self) {
        let total: i32 = self.list.iter().sum();
        self.average = total as f64 / self.list.len() as f64;
    }
}")]) #label("orgb8402bf")
#list(list.item[Ако је енкапсулација неопходна да би се језик сматрао објектно\u{2d}оријентисаним
онда Раст задовољава тај услов.])
#heading(level: 3)[Наслеђивање] #label("org3497373")
#list(list.item[Наслеђивање представља механизам где објекат\u{2f}класа може наследити елементе из
дефиниције другог објекта\u{2f}класе чиме добија податке и понашање свог родитеља.])#list(list.item[Раст не поседује овај механизам.])
#heading(level: 3)[Разлози за употребу наслеђивања] #label("org990f413")
#enum(enum.item(1)[Поновна искористивост кода (#emph[code reuse])
#list(list.item[Делимично подржано са подразумеваним имплементацијама метода особина.])#list(list.item[#link(label("org2f4fcac"))[Видели смо на примеру #raw("Summary") особине].])],
enum.item(2)[Полиморфизам
#list(list.item[Често синоним за наслеђивање али је заправо општији концепт где кôд може да
ради са вредностима различитог типа.])#list(list.item[Раст ово подржава употребом генеричког кода за апстракцију могућих типова и
дефинисањем ограничења кроз особине да се специфицира које особине тражени
тип мора да има. Често се оваква врста полиморфизма зове ограничени
параметарски полиморфизам (#emph[bounded parametric polymorphism]).])],
)
#heading(level: 3)[Наслеђивање као анти\u{2d}образац у дизајну језика] #label("org0b733c0")
#list(list.item[У модерним језицима наслеђивање није заступљено јер се сматра да доноси више
проблема него користи.])#list(list.item[Често се дешава да родитељске класе деле више кода него што би требало или да
деле методе чије позивање код подкласа нема смисла.])#list(list.item[Додатно, многи језици омогућавају само једноструко наслеђивање што додатно
смањује флексибилност дизајна.])
#heading(level: 2)[Употреба објеката са особином (#emph[Trait Objects])] #label("orgd1f2dcc")
#heading(level: 3)[Мотивација] #label("org9601f10")
#list(list.item[Некада је потребно да у одређеним контекстима користимо вредности различитог
типа.])#list(list.item[На пример да имамо колекцију вредности различитог типа.])#list(list.item[Ако је унапред познато који су могући типови можемо користити #raw("enum") за ову
намену, као што смо #link(label("org19b4eb4"))[видели раније].])#list(list.item[Али некада, нпр. код развоја библиотеке, није могуће унапред знати. Тј. желимо
да омогућимо флексибиност да се дефинишу нови типови са којима ће постојећи
кôд радити.])
#heading(level: 3)[Дефинисање особина за дељење понашања] #label("org52562ff")
#list(list.item[Правимо GUI чије методе ће радити са вредностима које имплементирају особину #raw("Draw").])

#figure([#raw(block: true, lang: "rust", "pub trait Draw {
    fn draw(&self);
}")]) #label("org6856bdd")
#heading(level: 3)[Имплементација генеричког кода] #label("org6657eb8")
Желимо да подржимо овакву методу:

#figure([#raw(block: true, lang: "rust", "impl Screen {
    pub fn run(&self) {
        for component in self.components.iter() {
            component.draw();
        }
    }
}")]) #label("org7a4fdaa")

Са оним што до сада знамо могли бисмо пробати нешто овако:

#figure([#raw(block: true, lang: "rust", "pub struct Screen<T: Draw> {
    pub components: Vec<T>,
}

impl<T> Screen<T>
where
    T: Draw,
{
    pub fn run(&self) {
        for component in self.components.iter() {
            component.draw();
        }
    }
}")]) #label("orgfd36411")

Али је проблем што тип #raw("T") ће бити исти за све елементе вектора #raw("components") тј.
обавиће се мономорфизација. Значи да нећемо моћи да у вектор сместимо различите
GUI компоненте, нпр. #raw("Button") и #raw("TextField").
#heading(level: 3)[Генерички кôд употребом објеката са особином] #label("org3986633")
У овом случају користимо објекте са особином (#emph[Trait Objects]) употребом кључне
речи #raw("dyn"). С обзиром да конкретан тип објекта са особином није познат у време
компајлирања његова величина није позната па се увек користи кроз неки облик
индирекције\u{2f}референце (нпр. #raw("&") или #raw("Box")).

#figure([#raw(block: true, lang: "rust", "pub struct Screen {
    pub components: Vec<Box<dyn Draw>>,
}

impl Screen {
    pub fn run(&self) {
        for component in self.components.iter() {
            component.draw();
        }
    }
}")]) #label("org98d9489")

Сада можемо имплементирати различите GUI компоненте које све имају особину #raw("Draw").

#figure([#raw(block: true, lang: "rust", "pub struct Button {
    pub width: u32,
    pub height: u32,
    pub label: String,
}

impl Draw for Button {
    fn draw(&self) {
        // code to actually draw a button
    }
}")]) #label("org94d8495")
#figure([#raw(block: true, lang: "rust", "use gui::Draw;

struct SelectBox {
    width: u32,
    height: u32,
    options: Vec<String>,
}

impl Draw for SelectBox {
    fn draw(&self) {
        // code to actually draw a select box
    }
}")]) #label("org8291f6f")
И можемо у вектор ставити вредности ових типова.

#figure([#raw(block: true, lang: "rust", "use gui::{Button, Screen};

fn main() {
    let screen = Screen {
        components: vec![
            Box::new(SelectBox {
                width: 75,
                height: 10,
                options: vec![
                    String::from(\u{22}Yes\u{22}),
                    String::from(\u{22}Maybe\u{22}),
                    String::from(\u{22}No\u{22}),
                ],
            }),
            Box::new(Button {
                width: 50,
                height: 10,
                label: String::from(\u{22}OK\u{22}),
            }),
        ],
    };

    screen.run();
}")]) #label("orgf27e66a")
#heading(level: 3)[Напомена о начину позивања метода] #label("org2492813")
#list(list.item[Генеричка варијанта са мономорфизацијом користи статичко позивање кода јер се
тип #raw("T") разрешава у време компајлирања и компајлер зна где се метода налази па
може да генерише кôд који ће је директно позвати.])#list(list.item[Код објекта са особинама у време компајлирања се не зна који ће то тип бити па
се позивање обавља у време извршавања тако што сваки објекат са особином има
дефинисану таблицу адреса свих својих метода.])#list(list.item[У време извршавања се ова таблица консултује да би се одредила функција коју
је потребно позвати.])#list(list.item[Ова индирекција има своју цену па је такав кôд нешто спорији.])#list(list.item[Већина ООП језика користи само ову варијанту тј. нема могућност да се метода
позове директно.])#list(list.item[Индиректно позивање методе спречава компајлер да обави тзв. #emph[inlining]
оптимизацију где се кôд методе директно уграђује на месту позива.])
#heading(level: 2)[Имплементација #emph[State] ООП дизајн образаца] #label("org7159f8b")
#list(list.item[Вредност има скуп интерних стања.])#list(list.item[Стања су представљена као објекти и вредност мења своје понашање у зависности
од тренутно активног стања.])#list(list.item[Пример: процесирање блог објаве. Стања: #raw("draft"), #raw("review") и #raw("published").])#list(list.item[Вредност која чува стање не зна ништа о промени понашања када дође до промене стања.])
#heading(level: 3)[Предност употребе #emph[State] обрасца] #label("orged3b1a2")
#list(list.item[Предност употребе овог обрасца је да када дође до промене захтева неће бити
потребно мењати имплементацију кода самог типа који имплментира овај образац
или клијентског кода већ само кода самих стања.])
#heading(level: 3)[Финална жељена функционалност] #label("orge5d4844")
#enum(enum.item(1)[Блог објава почиње у #raw("draft") стању.],
enum.item(2)[Када се драфт заврши прелази у стање #raw("review").],
enum.item(3)[Ако се објава одобри, објављује се и прелази у стање #raw("published").],
enum.item(4)[Само објаве у стању #raw("published") могу вратити садржај.],
)
#heading(level: 3)[Иницијална #raw("main") функција] #label("org08e13bd")
#figure([#raw(block: true, lang: "rust", "use blog::Post;

fn main() {
    let mut post = Post::new();

    post.add_text(\u{22}I ate a salad for lunch today\u{22});
    assert_eq!(\u{22}\u{22}, post.content());

    post.request_review();
    assert_eq!(\u{22}\u{22}, post.content());

    post.approve();
    assert_eq!(\u{22}I ate a salad for lunch today\u{22}, post.content());
}")]) #label("orge0b7579")
#heading(level: 3)[Дефинисање #raw("Post") типа] #label("orgc4597f0")
#figure([#raw(block: true, lang: "rust", "pub struct Post {
    state: Option<Box<dyn State>>,
    content: String,
}

impl Post {
    pub fn new() -> Post {
        Post {
            state: Some(Box::new(Draft {})),
            content: String::new(),
        }
    }
}

trait State {}

struct Draft {}

impl State for Draft {}")]) #label("org0842cdd")

#raw("State") дефинише дељену функционалност свих стања. За сада ова особина не дефинише
методе. #raw("Post") започиње животни циклус у стању #raw("Draft").
#heading(level: 3)[Чување садржаја у #raw("Post") структури] #label("org4a72551")
#figure([#raw(block: true, lang: "rust", "impl Post {
    // --snip--
    pub fn add_text(&mut self, text: &str) {
        self.content.push_str(text);
    }
    pub fn content(&self) -> &str {
        \u{22}\u{22}
    }
}")]) #label("org6483e18")
#heading(level: 3)[Захтевање рецензије] #label("orgc3903df")
#figure([#raw(block: true, lang: "rust", "impl Post {
    // --snip--
    pub fn request_review(&mut self) {
        if let Some(s) = self.state.take() {
            self.state = Some(s.request_review())
        }
    }
}

trait State {
    fn request_review(self: Box<Self>) -> Box<dyn State>;
}

struct Draft {}

impl State for Draft {
    fn request_review(self: Box<Self>) -> Box<dyn State> {
        Box::new(PendingReview {})
    }
}

struct PendingReview {}

impl State for PendingReview {
    fn request_review(self: Box<Self>) -> Box<dyn State> {
        self
    }
}")]) #label("orgad83447")

#list(list.item[#raw("take") над #raw("Option") типом је потребан јер желимо да узмемо власништво над
вредношћу која је у #raw("self.state") али морамо оставити поље у валидном стању. #raw("take")
ће заменити вредност са #raw("None"). Ово је могуће јер имамо #raw("&mut self") референцу.])
#heading(level: 3)[Имплементација #raw("approve") методе] #label("org569efff")
#figure([#raw(block: true, lang: "rust", "impl Post {
    // --snip--
    pub fn approve(&mut self) {
        if let Some(s) = self.state.take() {
            self.state = Some(s.approve())
        }
    }
}

trait State {
    fn request_review(self: Box<Self>) -> Box<dyn State>;
    fn approve(self: Box<Self>) -> Box<dyn State>;
}

struct Draft {}

impl State for Draft {
    // --snip--
    fn approve(self: Box<Self>) -> Box<dyn State> {
        self
    }
}")]) #label("org7d6d957")
#figure([#raw(block: true, lang: "rust", "struct PendingReview {}

impl State for PendingReview {
    // --snip--
    fn approve(self: Box<Self>) -> Box<dyn State> {
        Box::new(Published {})
    }
}

struct Published {}

impl State for Published {
    fn request_review(self: Box<Self>) -> Box<dyn State> {
        self
    }

    fn approve(self: Box<Self>) -> Box<dyn State> {
        self
    }
}")]) #label("org8ce7acc")
#heading(level: 3)[Ажурирање #raw("content") методе у #raw("Post") типу] #label("orgce121bc")
#list(list.item[Вршимо делегацију истој методи текућег стања.

#figure([#raw(block: true, lang: "rust", "impl Post {
        // --snip--
        pub fn content(&self) -> &str {
            self.state.as_ref().unwrap().content(self)
        }
        // --snip--
    }")]) #label("org4a3c464")])#list(list.item[Метода #raw("as_ref") над #raw("Option") је дефинисана на следећи начин:

#figure([#raw(block: true, lang: "rust", "/// Converts from `&Option<T>` to `Option<&T>`.
    pub const fn as_ref(&self) -> Option<&T> {
        match *self {
            Some(ref x) => Some(x),
            None => None,
        }
    }")]) #label("orga81f821")

Пошто је стање типа #raw("Option<Box<dyn State>>") када позовемо #raw("as_ref") добијемо
#raw("Option<&Box<dyn State>>"). Да нисмо то урадили добили би грешку јер не можемо да
преместимо стање (са #raw("unwrap")) из позајмљене #raw("&self") вредности.])

#figure([#raw(block: true, lang: "rust", "self.state.as_ref().unwrap().content(self)")]) #label("org33b56a5")

Тип над којим се позива #raw("content") je #raw("&Box<dyn State>"). #raw("Deref") коерција ће омогућити
да се "прође кроз" #raw("&") и #raw("Box") тако да ће се позвати над типом који имплементира
#raw("State").

Сада је потребно још имплементирати ову методу над #raw("State") типовима.
#figure([#raw(block: true, lang: "rust", "trait State {
    // --snip--
    fn content<'a>(&self, post: &'a Post) -> &'a str {
        \u{22}\u{22}
    }
}

// --snip--
struct Published {}

impl State for Published {
    // --snip--
    fn content<'a>(&self, post: &'a Post) -> &'a str {
        &post.content
    }
}")]) #label("orga019693")

#list(list.item[Користимо подразумевану имплементацију у #raw("State") особини.])#list(list.item[Тип #raw("Published") редефинише ову имплементацију.])
#heading(level: 3)[Други приступ \u{2d} енкодовање стања у типовима] #label("org6dcf1b4")
#list(list.item[Идеја: свако стање објаве је представљено другим типом. Објаве се током
животног циклуса трансформишу у вредности другог типа.])

#figure([#raw(block: true, lang: "rust", "fn main() {
    let mut post = Post::new();

    post.add_text(\u{22}I ate a salad for lunch today\u{22});
    assert_eq!(\u{22}\u{22}, post.content());
}")]) #label("org01ed024")

#list(list.item[#raw("Post") тип представља објављену објаву и тренутно није могуће креирати ову вредност.])#list(list.item[Иницијално је могуће креирати само #raw("DraftPost") кроз #raw("Post::new").])
#figure([#raw(block: true, lang: "rust", "pub struct Post {
    content: String,
}

pub struct DraftPost {
    content: String,
}

impl Post {
    pub fn new() -> DraftPost {
        DraftPost {
            content: String::new(),
        }
    }

    pub fn content(&self) -> &str {
        &self.content
    }
}

impl DraftPost {
    pub fn add_text(&mut self, text: &str) {
        self.content.push_str(text);
    }
}")]) #label("orgdf2b9fc")

Једино #raw("DraftPost") има методу #raw("request_review") тако да је немогуће позвати ову
методу над објавама које су у другом стању.
#figure([#raw(block: true, lang: "rust", "impl DraftPost {
    // --snip--
    pub fn request_review(self) -> PendingReviewPost {
        PendingReviewPost {
            content: self.content,
        }
    }
}

pub struct PendingReviewPost {
    content: String,
}

impl PendingReviewPost {
    pub fn approve(self) -> Post {
        Post {
            content: self.content,
        }
    }
}")]) #label("org0c02ca5")

Једино #raw("PendingReviewPost") има #raw("approve") методу тако да није могуће одобрити објаве
у другим стањима.

Објаве се трансформишу овим методама (узима се власништво над претходном) да се
осигура да не постоје исте објаве у различитим стањима. Због овога је потребно
користити #emph[shadowing] употребом #raw("let post = post.<metoda>").
#figure([#raw(block: true, lang: "rust", "use blog::Post;

fn main() {
    let mut post = Post::new();

    post.add_text(\u{22}I ate a salad for lunch today\u{22});

    let post = post.request_review();

    let post = post.approve();

    assert_eq!(\u{22}I ate a salad for lunch today\u{22}, post.content());
}")]) #label("orgcc641a7")
#heading(level: 3)[Предност приступа] #label("orga532e3a")
#list(list.item[Није могуће креирати невалидно стање.])#list(list.item[Покушај креирања невалидног стања је грешка у време компајлирања.])
#heading(level: 1)[Конкурентно програмирање] #label("orge0955ca")
#heading(level: 2)[Употреба нити] #label("org9980a74")
#list(list.item[Раст стандардна библиотека користи 1:1 модел имплементације нити. Једна нит у
Расту се мапира на једну нит оперативног система.])#list(list.item[Постоје разни сандуци који имплементирају друге моделе.])
#heading(level: 2)[Проблеми са нитима] #label("org7f36a0c")
Нити се извршавају конкурентно тако да не постоје инхерентне гаранције на
редослед извршавања. Ово може довести до разних проблема:
#list(list.item[Стање трке (#emph[race conditions]) \u{2d} када нити приступају ресурсима у
неконзистентном редоследу.])#list(list.item[Закључавање (#emph[Deadlocks]) \u{2d} када нити међусобно чекају једни на друге и
истовремено се спречавају да наставе са радом и ослободе ресурсе које држе
закључаним.])#list(list.item[Разне грешке које се манифестују под тачно одређеним околностима које се тешко
репродукују.])
#heading(level: 2)[Креирање нове нити] #label("org2f1fd1c")
#figure([#raw(block: true, lang: "rust", "use std::thread;
use std::time::Duration;

fn main() {
    thread::spawn(|| {
        for i in 1..10 {
            println!(\u{22}hi number {} from the spawned thread!\u{22}, i);
            thread::sleep(Duration::from_millis(1));
        }
    });

    for i in 1..5 {
        println!(\u{22}hi number {} from the main thread!\u{22}, i);
        thread::sleep(Duration::from_millis(1));
    }
}")]) #label("org356673d")

#raw(block: false, "hi number 1 from the main thread!
hi number 1 from the spawned thread!
hi number 2 from the main thread!
hi number 2 from the spawned thread!
hi number 3 from the main thread!
hi number 3 from the spawned thread!
hi number 4 from the main thread!
hi number 4 from the spawned thread!
hi number 5 from the spawned thread!")


#list(list.item[Када основна нит, дефинисана #raw("main") функцијом, заврши све остале нити се гасе.])
#heading(level: 2)[Употреба #raw("join")] #label("orga8a1816")
Да би сачекали да све нити заврше користимо повратну вредност #raw("thread::spawn")
позива која је типа #raw("JoinHandle"). У питању је поседована вредност чија метода #raw("join")
ће блокирати текућу нит док дата нит не заврши.

#figure([#raw(block: true, lang: "rust", "use std::thread;
use std::time::Duration;

fn main() {
    let handle = thread::spawn(|| {
        for i in 1..10 {
            println!(\u{22}hi number {} from the spawned thread!\u{22}, i);
            thread::sleep(Duration::from_millis(1));
        }
    });

    for i in 1..5 {
        println!(\u{22}hi number {} from the main thread!\u{22}, i);
        thread::sleep(Duration::from_millis(1));
    }

    handle.join().unwrap();
}")]) #label("org0d0da88")
Ако преместимо #raw("handle.join()") пре петље.

#figure([#raw(block: true, lang: "rust", "use std::thread;
use std::time::Duration;

fn main() {
    let handle = thread::spawn(|| {
        for i in 1..10 {
            println!(\u{22}hi number {} from the spawned thread!\u{22}, i);
            thread::sleep(Duration::from_millis(1));
        }
    });

    handle.join().unwrap();

    for i in 1..5 {
        println!(\u{22}hi number {} from the main thread!\u{22}, i);
        thread::sleep(Duration::from_millis(1));
    }

}")]) #label("orgeb94575")
#heading(level: 2)[Позајмљивање вредности] #label("org9f1b482")
Често нам треба да нит позајми вредност из текуће нити. У следећем примеру
вектор #raw("v") се покушава читати из нити.
#figure([#raw(block: true, lang: "rust", "use std::thread;

fn main() {
    let v = vec![1, 2, 3];

    let handle = thread::spawn(|| {
        println!(\u{22}Here's a vector: {:?}\u{22}, v);
    });

    handle.join().unwrap();
}")]) #label("org9d89677")

Али се овај кôд не компајлира.

Раст инференца проналази да се вектор треба позајмити путем дељене референце али
нема гаранције да ће позајмљена вредност бити "жива" када је нит буде користила.

У овом примеру користимо #raw("drop") па је још јасније зашто је ово проблем.

#figure([#raw(block: true, lang: "rust", "use std::thread;

fn main() {
    let v = vec![1, 2, 3];

    let handle = thread::spawn(|| {
        println!(\u{22}Here's a vector: {:?}\u{22}, v);
    });

    drop(v); // oh no!

    handle.join().unwrap();
}")]) #label("org7f8b2ae")
#heading(level: 2)[Премештање вредности] #label("org283d84b")
Решење је да се вектор премести у нит употребом кључне речи #raw("move").

#figure([#raw(block: true, lang: "rust", "use std::thread;

fn main() {
    let v = vec![1, 2, 3];

    let handle = thread::spawn(move || {
        println!(\u{22}Here's a vector: {:?}\u{22}, v);
    });

    handle.join().unwrap();
}")]) #label("orge28736d")

Ово решава проблем са оба претходна примера. Али је једино први пример валидан.
Није могуће користити #raw("drop") над премештеном вредношћу.

Правила власништва одбацују невалидан кôд и лепо се уклапају и у причу о
вишенитном програмирању.
#heading(level: 2)[Конкурентно програмирање слањем порука] #label("org4f8e8b5")
Слање порука је све популарнији модел конкурентног програмирања где се сигурност
постиже разменом порука између нити.

Један од слогана Го програмског језика је:

#figure([#quote(block: true)[Do not communicate by sharing memory; instead, share memory by communicating.
]]) #label("orgf715513")
#heading(level: 2)[#raw("mpsc::channel()")] #label("org96c0966")
#list(list.item[#raw("mpsc") је модул у стандардној библиотеци који омогућава овај стил конкурентног програмирања.])#list(list.item[#emph[Multiple Producer, Single Consumer \u{2d} MPSC]])

#figure([#raw(block: true, lang: "rust", "use std::sync::mpsc;
use std::thread;

fn main() {
    let (tx, rx) = mpsc::channel();

    thread::spawn(move || {
        let val = String::from(\u{22}hi\u{22});
        tx.send(val).unwrap();
    });

    let received = rx.recv().unwrap();
    println!(\u{22}Got: {}\u{22}, received);
}")]) #label("org33c32b6")

#list(list.item[#raw("recv") је блокирајући позив који чека да прихвати поруку. Враћа #raw("Result<T, E>")
тип. Уколико се добије грешка то је знак да је пошиљалац затворио свој крај
конекције и да поруке више неће стизати.])#list(list.item[Постоји и #raw("try_recv") који није блокирајућ.])
#heading(level: 2)[Власништво] #label("orgb775d60")
#list(list.item[Раст правила власништва играју битну улогу у креирању сигурног конкурентног кода.])#list(list.item[Покушај употребе вредности #raw("val") после слања.
#figure([#raw(block: true, lang: "rust", "use std::sync::mpsc;
    use std::thread;

    fn main() {
        let (tx, rx) = mpsc::channel();

        thread::spawn(move || {
            let val = String::from(\u{22}hi\u{22});
            tx.send(val).unwrap();
            println!(\u{22}val is {}\u{22}, val);
        });

        let received = rx.recv().unwrap();
        println!(\u{22}Got: {}\u{22}, received);
    }")]) #label("orgcfe0ada")])
#heading(level: 2)[Итерација над пријемником] #label("org3b39c80")
#figure([#raw(block: true, lang: "rust", "use std::sync::mpsc;
use std::thread;
use std::time::Duration;

fn main() {
    let (tx, rx) = mpsc::channel();

    thread::spawn(move || {
        let vals = vec![
            String::from(\u{22}hi\u{22}),
            String::from(\u{22}from\u{22}),
            String::from(\u{22}the\u{22}),
            String::from(\u{22}thread\u{22}),
        ];

        for val in vals {
            tx.send(val).unwrap();
            thread::sleep(Duration::from_secs(1));
        }
    });

    for received in rx {
        println!(\u{22}Got: {}\u{22}, received);
    }
}")]) #label("org9e4a928")

#raw(block: false, "Got: hi
Got: from
Got: the
Got: thread")
#heading(level: 2)[Клонирање пошиљаоца] #label("org65d67fe")
#figure([#raw(block: true, lang: "rust", "// --snip--

    let (tx, rx) = mpsc::channel();

    let tx1 = tx.clone();
    thread::spawn(move || {
        let vals = vec![
            String::from(\u{22}hi\u{22}),
            String::from(\u{22}from\u{22}),
            String::from(\u{22}the\u{22}),
            String::from(\u{22}thread\u{22}),
        ];

        for val in vals {
            tx1.send(val).unwrap();
            thread::sleep(Duration::from_secs(1));
        }
    });

    // --snip--")]) #label("orgf17e5ea")
#figure([#raw(block: true, lang: "rust", "// --snip--

    thread::spawn(move || {
        let vals = vec![
            String::from(\u{22}more\u{22}),
            String::from(\u{22}messages\u{22}),
            String::from(\u{22}for\u{22}),
            String::from(\u{22}you\u{22}),
        ];

        for val in vals {
            tx.send(val).unwrap();
            thread::sleep(Duration::from_secs(1));
        }
    });

    for received in rx {
        println!(\u{22}Got: {}\u{22}, received);
    }

    // --snip--")]) #label("orgf047d7b")
#heading(level: 2)[Дељено стање] #label("orga704520")
#list(list.item[Употреба канала је слична приступу јединственог власништва. Када се податак
пошаље низ канал преноси се и власништво на примаоца поруке.])#list(list.item[Алтернативни метод конкурентног програмирања је употреба дељеног стања.])#list(list.item[Потребно је обезбедити да само једна нит приступа дељеном стању и једном
тренутку. То се постиже ексклузивним закључавањем путем #raw("mutex") структура.])

#list(list.item[#raw("Mutex") структуре имају репутацију да су тешки за употребу зато што се морају
строго поштовати два правила:
#enum(enum.item(1)[Мора се добити приступ (#emph[lock]) пре приступа ресурсу који се дели.],
enum.item(2)[Када се приступ ресурсу заврши потребно је откључати #raw("mutex") да би друге нити
могле да га користе.],
)])#list(list.item[Уколико се заборави правило 1 долази до грешака у неконзистентности података.])#list(list.item[Уколико се заборави правило 2 друге нити никада не могу добити приступ ресурсу
коме морају приступити.])#list(list.item[Употребом Раст система типова компајлер спречава да се ова правила забораве
или да се употреба #raw("mutex")\u{2d}а неправилно спроведе.])
#heading(level: 2)[#raw("Mutex<T>") API] #label("org7ae21e5")
#figure([#raw(block: true, lang: "rust", "use std::sync::Mutex;

fn main() {
    let m = Mutex::new(5);

    {
        let mut num = m.lock().unwrap();
        *num = 6;
    }

    println!(\u{22}m = {:?}\u{22}, m);
}")]) #label("org40f1111")

#list(list.item[#raw("Mutex<T>") је #emph[wrapper] тип који садржи у себи податак који се дели.])#list(list.item[Тип варијабле #raw("m") је #raw("Mutex<i32>") а не #raw("i32").])#list(list.item[Једини начин приступа податку је кроз методу #raw("lock()") која ће да блокира док се
не добије ексклузиван приступ. Дакле, немогуће је заборавити да се #raw("mutex")
закључа јер је то једини начин да се приступи податку.])#list(list.item[#raw("lock()") враћа #raw("LockResult") јер може да не успе уколико нит која држи закључан
ресурс прекине са радом кроз #raw("panic").])#list(list.item[#raw("LockResult") уколико успе у себи садржи #raw("MutexGuard") паметни поинтер који
имплементира #raw("Deref"), да би могао да врати интерне податке, и #raw("Drop") да би
аутоматски откључао ресурс када изађе из опсега важења.])
#heading(level: 2)[Дељење #raw("Mutex<T>") између нити] #label("org27b7c90")
#figure([#raw(block: true, lang: "rust", "use std::sync::Mutex;
use std::thread;

fn main() {
    let counter = Mutex::new(0);
    let mut handles = vec![];

    for _ in 0..10 {
        let handle = thread::spawn(move || {
            let mut num = counter.lock().unwrap();

            *num += 1;
        });
        handles.push(handle);
    }

    for handle in handles {
        handle.join().unwrap();
    }

    println!(\u{22}Result: {}\u{22}, *counter.lock().unwrap());
}")]) #label("org0336cc2")
#heading(level: 2)[Покушај употребе #raw("Rc<T>") за вишеструко власништво] #label("org1679822")
#figure([#raw(block: true, lang: "rust", "use std::rc::Rc;
use std::sync::Mutex;
use std::thread;

fn main() {
    let counter = Rc::new(Mutex::new(0));
    let mut handles = vec![];

    for _ in 0..10 {
        let counter = Rc::clone(&counter);
        let handle = thread::spawn(move || {
            let mut num = counter.lock().unwrap();

            *num += 1;
        });
        handles.push(handle);
    }

    for handle in handles {
        handle.join().unwrap();
    }

    println!(\u{22}Result: {}\u{22}, *counter.lock().unwrap());
}")]) #label("org7adf0f4")

#list(list.item[#raw("`Rc<Mutex<i32>>` cannot be sent between threads safely")])#list(list.item[#raw("trait `Send` is not implemented for `Rc<Mutex<i32>>`")])#list(list.item[Специјална особина #raw("Send") је имплементирана само за типове који могу да се шаљу
између нити.])#list(list.item[#raw("Rc<T>") тип не имплементира #raw("Send") јер није сигуран у контексту нити (#emph[thread\u{2d}safe]).])
#heading(level: 2)[Употреба #raw("Arc<T>")] #label("orgacc6b24")
#list(list.item[#emph[Atomic Reference Counting]])#list(list.item[Варијанта #raw("Rc<T>") типа која је сигурна у контексту нити и стога имплементира #raw("Send").])#list(list.item[Подршка за вишенитно окружење има своју цену, зато не треба користити #raw("Arc<T>") у
контексту једне нити.])

#figure([#raw(block: true, lang: "rust", "use std::sync::{Arc, Mutex};
    use std::thread;

    fn main() {
        let counter = Arc::new(Mutex::new(0));
        let mut handles = vec![];

        for _ in 0..10 {
            let counter = Arc::clone(&counter);
            let handle = thread::spawn(move || {
                let mut num = counter.lock().unwrap();

                *num += 1;
            });
            handles.push(handle);
        }

        for handle in handles {
            handle.join().unwrap();
        }

        println!(\u{22}Result: {}\u{22}, *counter.lock().unwrap());
    }")]) #label("orgef678e1")

#raw(block: false, "Result: 10")
#heading(level: 2)[Напомена о #raw("RefCell<T>/Rc<T>") и #raw("Mutex<T>/Arc<T>")] #label("org36a2caa")
#list(list.item[#raw("counter") је непромењив али можемо добити промењиву позајмицу тј. #raw("Mutex<T>")
омогућава унутрашњу промењивост као и #raw("RefCell<T>").])
#heading(level: 2)[#raw("Send") и #raw("Sync") особине] #label("orge5c8085")
#list(list.item[Третирају се посебно од стране компајлера.])#list(list.item[Маркер особине. Без метода.])#list(list.item[#raw("Send") имплементирају типови чије вредности се безбедно могу прености између нити.])#list(list.item[Већина типова у Расту су #raw("Send") али има изузетака (нпр. #raw("Rc<T>")). Такође, сви
сложени типови који се састоје искључиво од #raw("Send") типова су #raw("Send").])#list(list.item[#raw("Sync") имплементирају типови чије вредности се могу позајмљивати између нити.])#list(list.item[Тип #raw("T") je #raw("Sync") ako je #raw("&T") #raw("Send").])#list(list.item[Примитивни Раст типови су #raw("Sync"). Сложени типови који се састоје искључиво од
#raw("Sync") типова су #raw("Sync").])
#heading(level: 1)[Литература] #label("orgec3f421")
#list(list.item[Steve Klabnik and Carol Nichols: #link("https://doc.rust-lang.org/book/")[The Rust Programming Language] #footnote(link("https://doc.rust-lang.org/book/")), no starch press.])#list(list.item[#link("https://doc.rust-lang.org/stable/rust-by-example/index.html")[Rust by Example] #footnote(link("https://doc.rust-lang.org/stable/rust-by-example/index.html"))])#list(list.item[#link("https://github.com/rust-lang/book/issues/3070")[Slice is NOT reference] #footnote(link("https://github.com/rust-lang/book/issues/3070"))])#list(list.item[#link("https://lborb.github.io/book/")[The Little Book of Rust Books] #footnote(link("https://lborb.github.io/book/"))])#list(list.item[#link("https://google.github.io/comprehensive-rust/")[Google: Comprehensive Rust] #footnote(link("https://google.github.io/comprehensive-rust/"))])#list(list.item[#link("https://rust-lang.github.io/rfcs/0505-api-comment-conventions.html")[RFC 505: API documentation conventions] #footnote(link("https://rust-lang.github.io/rfcs/0505-api-comment-conventions.html"))])#list(list.item[#link("https://github.com/rust-lang/rustlings")[Rustlings: Small exercises to get you used to reading and writing Rust code!] #footnote(link("https://github.com/rust-lang/rustlings"))])
