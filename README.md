# minutest

Typst template for meeting minutes and agendas (Danish/English).

```typ
#import "@local/minutest:0.1.0": *
#show: meeting.with(organisation: "…", meeting-name: "board meeting", lang: "en", kind: "minutes")
```

Blocks: `vote`, `resp`/`ansvar`, `proposal`, `amendment`, `next-meeting`. Pass `logo: image("logo.png", width: 2.3cm)` from your own document for a logo. See `examples/`.
