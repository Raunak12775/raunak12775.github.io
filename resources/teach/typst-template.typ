#let azur-blue = rgb("#0062AB")
#let bear-brownie = rgb("#73593A")
#let matcha-bright = rgb("#0c7e29")

#let sans-font = "TeX Gyre Heros"
#let serif-font = "TeX Gyre Termes"
#let mono-font = "Intel One Mono"
#let body-size = 11pt
#let heading-size = 14pt

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
  let lighten-percentage = 95%
  set page(
    paper: "a4",
    margin: (x: 3cm, y: 2cm),
    fill: root-color.lighten(lighten-percentage),
    background: context if (
      here().page() == 1
    ) [
      #place(top, rect(
        fill: root-color,
        height: 6cm,
        width: 100%,
      ))
    ],
    footer: context [
      #set text(size: 8pt, font: sans-font)
      #counter(page).display("1/1", both: true)
    ],
  )

  grid(
    columns: (1.78fr, 1fr),
    [
      #text(size: heading-size, font: sans-font, fill: root-color.lighten(lighten-percentage))[#title]

      #text(size: body-size, font: sans-font, fill: root-color.lighten(lighten-percentage))[#emph(subtitle)]
    ],
    [
      #text(
        size: body-size,
        font: sans-font,
        fill: root-color.lighten(lighten-percentage),
      )[*Raunak Farhaz* \ #text(9pt, font: mono-font)[#datetime.today().display()] \ #link("mailto:farhazraunak@proton.me")]
    ],
  )


  // Configure equation numbering and spacing.
  set math.equation(numbering: "(1)")
  show math.equation: set block(spacing: 0.65em)

  // Configure headings.
  set heading(numbering: "I.A.1.")
  show heading: set text(font: sans-font)

  // set body properties.
  v(4cm)
  set text(body-size, font: serif-font)
  set par(justify: true, spacing: 0.55cm, leading: 0.35cm, first-line-indent: (amount: 0.75cm, all: true))


  // Display the paper's contents.
  body
}
