#let _ = ```typ
exec typst c "$0" --root "$(readlink -f "$0" | xargs dirname)/./"
⁠```
#set document(title: "Adding Footnotes", author: "Игор Дејановић Jens Lechtenbörger")
#set text(lang: "sr")
#set heading(numbering: "1.")
#heading(level: 1)[Just a slide] #label("orgc2981fe")
#list(list.item[Nothing really special here#footnote(label("1"))])
#heading(level: 2)[A deeper nesting] #label("org987689c")
#list(list.item[Again some footnote#footnote(label("2"))])
#heading(level: 1)[Footnotes] #label("org8bc52d1")
#hide[#footnote[Except for a footnote] #label("1")]
#hide[#footnote[Footnote on a deeper level of nesting] #label("2")]
#hide[#footnote[Footnote on a subsequent slide] #label("3")]
#heading(level: 1)[More slides] #label("org6eaccd4")
#list(list.item[With text])
#heading(level: 2)[Subheading] #label("org8417797")
#list(list.item[Also with text#footnote(label("3"))])
