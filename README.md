# minutely

Typst template for meeting minutes and agendas (Danish/English).

## Example

```typ
#import "@preview/minutely:0.1.0": *

#let WT = "W. Tarkin"
#let FP = "F. Piett"
#let OK = "O. Krennic"

#show: meeting.with(
  organisation: "The Empire",
  meeting-name: "board meeting",
  kind: "minutes",
  date: datetime(year: 2026, month: 3, day: 12),
  time: "16:00", location: "Conference room, deck 3",
  chair: WT, minute-taker: FP,
  attendees: (WT, OK, FP),
  logo: image("logo.png", width: 100%),
)

= Construction
== Station budget #resp(OK, FP)
#vote(question: "Approve the revised station budget?",
  agrees: (WT, FP), against: (OK,), abstain: 0)
#proposal(no: 3)[The board may approve design changes to the exhaust ports …]
#amendment(no: 4, before: [may], after: [shall])
#next-meeting(date: datetime(year: 2026, month: 4, day: 9), time: "16:00", location: "Conference room, deck 3")
```

Formalia (chair, minute-taker, attendees, approval of last minutes) is inserted automatically. See `examples/`.

## `meeting` parameters

| Parameter | Default | Description |
|---|---|---|
| `organisation` | `none` | Organisation name, appended to the title ("… in The Empire"). |
| `meeting-name` | `"meeting"` | Name of the meeting, e.g. `"board meeting"`, `"bestyrelsesmøde"`. |
| `kind` | `"minutes"` | `"minutes"`/`"referat"` or `"agenda"`/`"dagsorden"`. Agendas omit approval of minutes. |
| `title` | `auto` | Override the generated title. |
| `date` | `datetime.today()` | Meeting date (`datetime` is localised; anything else is printed as is). |
| `time` | `none` | Start time, e.g. `"16:00"`. |
| `location` | `none` | Meeting location. |
| `chair` | `none` | Chair. Shown as placeholder if empty. |
| `minute-taker` | `none` | Minute-taker. Shown as placeholder if empty. |
| `attendees` | `()` | Array of names (or a string). |
| `attendees-label` | `none` | Override the "Present" heading. |
| `extra-attendees` | `()` | Additional attendees; section omitted if empty. |
| `approved` | `auto` | Approval of previous minutes; `auto` prints "Approved". |
| `formalia` | `true` | Insert the formalia section. |
| `author` | `none` | PDF author metadata. |
| `logo` | `none` | Content, e.g. `image("logo.png")`. Must be passed from your own document, not a path string. |
| `lang` | `auto` | `"da"`, `"en"` or `auto` (Danish if `meeting-name`/`kind` contains Danish words). |
| `font` | `"New Computer Modern"` | Body font. |

## Blocks

| Block | Parameters | Description |
|---|---|---|
| `vote` | `question`, `agrees`, `against`, `abstain`, `decision` | Vote box. Counts may be numbers, a name, or an array of names. `decision`: `true`/`false`/custom content; `none` computes it from the counts. |
| `resp` / `ansvar` | `..names` | Inline "Responsible: …" tag. |
| `proposal` | `no`, body | Proposal block, optional § number. |
| `amendment` | `no`, `before`, `after`, body | Amendment block with optional before/after text. |
| `next-meeting` | `date`, `time`, `location`, `note` | "Next meeting" section. |

Statutes / vedtægter live in the separate package [statutely](../statutely).
