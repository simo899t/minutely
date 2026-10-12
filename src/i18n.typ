// Language strings. Add a language by adding a key with the same fields.
#let strings = (
  da: (
    months: ("januar", "februar", "marts", "april", "maj", "juni",
      "juli", "august", "september", "oktober", "november", "december"),
    agenda: "Dagsorden",
    minutes: "Referat af",
    agenda-of: "Dagsorden",
    in: "i",
    at: "kl.",
    page: "side",
    of: "af",
    placeholder: "udfyldes",
    formalia: "Formalia",
    chair: "Valg af dirigent",
    minute-taker: "Valg af referent",
    attendees: "Tilstedeværende",
    extra-attendees: "Ekstra tilstedeværende",
    approval: "Godkendelse af referat for seneste møde",
    approved: "Godkendt",
    for: "For", against: "Imod", abstain: "Blankt",
    passed: "✓ Vedtaget", rejected: "✗ Ikke vedtaget", tie: "– Faldet ved stemmelighed",
    responsible: "Ansvarlig",
    proposal: "Forslag",
    amendment: "Vedtægtsændring",
    before: "Før", after: "Efter",
    next-meeting: "Næste møde",
  ),
  en: (
    months: ("January", "February", "March", "April", "May", "June",
      "July", "August", "September", "October", "November", "December"),
    agenda: "Agenda",
    minutes: "Minutes of",
    agenda-of: "Agenda for",
    in: "in",
    at: "at",
    page: "page",
    of: "of",
    placeholder: "to be filled in",
    formalia: "Formalities",
    chair: "Election of chair",
    minute-taker: "Election of minute-taker",
    attendees: "Present",
    extra-attendees: "Also present",
    approval: "Approval of previous minutes",
    approved: "Approved",
    for: "For", against: "Against", abstain: "Abstain",
    passed: "✓ Passed", rejected: "✗ Rejected", tie: "– Fell on a tie",
    responsible: "Responsible",
    proposal: "Proposal",
    amendment: "Amendment",
    before: "Before", after: "After",
    next-meeting: "Next meeting",
  ),
)

// Current language, read from `text.lang` (set by `meeting`). Falls back to English.
#let tr(key) = {
  let lang = text.lang
  strings.at(if lang in strings { lang } else { "en" }).at(key)
}

#let fmt-date(d) = {
  if type(d) == datetime {
    let m = tr("months").at(d.month() - 1)
    if text.lang == "da" [#d.day(). #m #d.year()] else [#d.day() #m #d.year()]
  } else [#d]
}
