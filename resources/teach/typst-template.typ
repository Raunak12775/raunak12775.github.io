#let azur-blue = rgb("#0062AB")
#let bear-brownie = rgb("#73593A")
#let matcha-bright = rgb("#0c7e29")

#let sans-font="Nimbus Sans"
#let serif-font="Nimbus Roman"
#let mono-font = "Intel One Mono"

#let paper-colors = (
  bluepaper : azur-blue,
  brownpaper : bear-brownie,
  greenpaper : matcha-bright
)

// global variables - title, subtitle, paper-type
#let colored-papers(
  title: "Paper Title",
  subtitle: "Subtitle of the paper if any",
  paper-type: "bluepaper",
  // The paper's content.
  body,
) = {
  // title block banner
  // Configure the page.
  let root-color = paper-colors.at(paper-type)
  set page(paper: "a4", margin: (x: 15mm, y: 15mm),
footer: context [
  #grid(
    columns: (1fr,1fr),
    align: (left, right),
    [#set text(size: 8pt, font: sans-font, fill: black.lighten(50%))
    © Dr. Raunak Farhaz | Last update - #datetime.today().display()],
    [#set text(size: 8pt, font: sans-font, fill: black.lighten(50%))
      #counter(page).display("1/1", both: true)]
  )
 ]
)

align(center,
box(
  width: 110%,
  radius: 0.5em,
  inset: 6mm,
  fill: root-color.lighten(90%)
)[
#align(left, text(13pt, fill: root-color, weight: "bold", font: sans-font)[#title])
#align(left, text(11pt, fill: root-color, font: sans-font)[#subtitle])
])
v(2em)
// Configure equation numbering and spacing.
set math.equation(numbering: "(1)")
show math.equation: set text(font:"TeX Gyre Termes Math")
set figure.caption(separator: [ -- ])
show figure.where(kind: table): set figure.caption(position: top)
show figure.where(kind: table): set block(breakable: true)
show figure.caption: it => [
    #set align(left)
    #set par(justify: true, leading: 0.6em)
    #set text(9pt, font: sans-font, fill: black.lighten(20%), style: "italic")
    #pad(x: 1.5em)[#it]
  ]

  // Configure headings.
set heading(numbering: none)
show heading: set text(font: sans-font, fill: root-color)
set text(11pt, font: serif-font)
set par(justify: true)
set bibliography(title: "")
  // Display the paper's contents.
  body
}
