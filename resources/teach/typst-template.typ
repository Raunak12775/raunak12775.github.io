#let azur-blue = rgb("#0062AB")
#let bear-brownie = rgb("#73593A")
#let matcha-bright = rgb("#0c7e29")

#let sans-font="TeX Gyre Heros"
#let serif-font="Libertinus Serif"
#let mono-font = "Intel One Mono"

#let paper-colors = (
  bluepaper : azur-blue,
  brownpaper : bear-brownie,
  greenpaper : matcha-bright
)

// global variables - title, subtitle, paper-type
#let colored-papers(
  // The paper's title.
  title: "Paper Title",
  subtitle: "Subtitle of the paper if any",
  paper-type: "bluepaper",
  // The paper's content.
  body,
) = {
  // title block banner
  // Configure the page.
  let root-color = paper-colors.at(paper-type)
  set page(paper: "a4", margin: (x: 1.5cm, y: 1cm), fill: root-color.lighten(95%),
footer: context [
      #set text(size: 9pt, font: sans-font)
      #counter(page).display("1/1", both: true)
    ]
)
align(center)[
#box(
  width: 110%,
  radius: 1em,
  inset: 32pt,
  fill: root-color
)[
#align(left, text(16pt, fill: white, weight: "bold", font: sans-font)[#title])
#align(left, text(12pt, fill: white, weight: "bold", font: sans-font)[#subtitle])
#v(1em)
#align(right, text(11pt, fill: white, weight: "bold",font: sans-font)[revised on  #datetime.today().display() | curated by Raunak Farhaz])
]
]

v(2em)
// Configure equation numbering and spacing.
set math.equation(numbering: "(1)")
show math.equation: set block(spacing: 0.65em)

  // Configure headings.
set heading(numbering: "I.A.1.")
show heading: set text(font: sans-font, fill: root-color)
set text(11pt, font: serif-font, fill: root-color.darken(30%))
set par(justify: true, spacing: 0.55cm, leading: 0.35cm, first-line-indent: (amount: 0.75cm, all: true))
  // Display the paper's contents.
  body
}
