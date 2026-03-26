# Health Communication — COVID-19 Belief States in Latin America

Documentation of the research project **"Belief states of vulnerable groups in crises in Latin America: sociolinguistic and computational assessment"** (henceforth: COVID-project)

🔗 [DFG Project Page](https://gepris.dfg.de/gepris/projekt/468416293)

---

## Citation

Please cite one of the following papers if you use the data and/or code from this project:

- **Olga Kellert & Mahmud Zaman (2023)** — Use of NLP in the Context of Belief States of Ethnic Minorities in Latin America. In *Proceedings of the Workshop on Natural Language Processing for Indigenous Languages of the Americas (AmericasNLP)*, Toronto, Canada. Association for Computational Linguistics.

- **Olga Kellert, Claudia Crespo, Marleen Haboud, Fernando Ortega, Stavros Skopeteas** — Factores sociolingüísticos y demográficos que influyeron en la transmisión de información sobre COVID-19 en poblaciones indígenas y no indígenas rurales de Perú y Ecuador. *Deutscher Hispanistentag XXII*, Universität Graz, 22–26 February 2023. ([Presentation available online](https://github.com/olga-kel/Health-Communication))

- **Olga Kellert, Claudia Crespo, Marleen Haboud, Fernando Ortega** — Impact of demographic factors and the information source on the transmission and knowledge representation of COVID-19-related information among ethnic and linguistic minorities of Peru and Ecuador. *(submitted)*

---

## People

**Principal Investigators**
- Olga Kellert — University of Göttingen
- Stavros Skopeteas — University of Göttingen

**Main Cooperation Partners**
- Claudia Crespo (Peru)
- Marleen Haboud (Ecuador)
- Fernando Ortega (Ecuador)

**PhD Student** (questionnaire creation & computational assessment)
- Mahmud Uz Zaman

**Student Assistants** (data annotation & statistical analysis)
- Atfah Salma
- Günther Hannah

**Interviewers**
- Maria Rosa Guamán — interviews in Cañar, Ecuador
- Mery Salas Santa Cruz — interviews in Apurímac, Peru

**Creator**
- Olga Kellert, University of Göttingen — ORCID: [0000-0001-8601-8305](https://orcid.org/0000-0001-8601-8305)

---

## Research Context

The data was collected within the COVID-project, which investigates how social factors influence COVID-19-related beliefs and information among vulnerable groups in Latin America.

- **Creation date of files:** November 2022
- **Data collection method:** Survey of 300 participants from Peru and Ecuador
- **Software:** R for Windows, version 4.2.2

---

## Repository Structure

```
Health-Communication/
├── README.md
├── LICENSE-CC-BY.txt
├── Project-COVID-survey.R
└── data/
    ├── ecuador/
    │   └── Annotator1_Ecuador_Annotations.xlsx
    └── peru/
        └── Annotator1_Peru_Annotations.xlsx
```

---

## Data

### Overview

| File | Country | Sheet | Rows | Columns |
|------|---------|-------|------|---------|
| `Annotator1_Ecuador_Annotations.xlsx` | Ecuador | Form Responses 1 | ~150 | 85 |
| `Annotator1_Peru_Annotations.xlsx` | Peru | English Only | ~150 | 86 |

Both files are **anonymized annotated datasets** from the COVID-19 survey. Each row represents one participant. Answers and variable descriptions are in English and Spanish; codes are in English.

---

### Column Structure

Both datasets share the same general structure, organized into four sections:

#### Section 1 — Participant Demographics

| Column | Description |
|--------|-------------|
| `Timestamp` | Date and time of survey submission |
| `Gender` / `1.1 gender` | Participant gender |
| `Age` / `1.2 age` | Age group (e.g., A, B, C, D) |
| `Profession` / `1.3 Work` | Occupation |
| `Education Level` / `1.4 education_levels` | Highest education attained |
| `School_cat` / `education` | Numeric/categorical education code |
| `Spoken.languages` / `1.5 bilinguistic` | Language background (monolingual / bilingual indigenous) |
| `Main_lang` / `1.6 First_Lang` | Primary language spoken |
| `1.7 Quechua Response` | Participant's response to a Quechua proficiency question |
| `Urban_rural` / `1.8 Region` | Urban or rural region |

#### Section 1.9 — COVID-19 Information Sources

Binary columns (0/1) indicating which sources participants used to get COVID-19 information:

`TV`, `Radio`, `Internet`, `Social Media / social_networks`, `Friends`, `Family / relatives`, `Health Centers / clinic`, `Central Government / central_government`, `Local Government / local_government`, `Community Announcements / posters_announcments`, `Everything`, `Others`, `Nothing`

#### Section 2 — COVID-19 Knowledge Questions (Q2.1–Q2.23)

Each knowledge question follows a triplet structure:

| Column Pattern | Description |
|----------------|-------------|
| `2.X <Question text>` | Participant's free-text response |
| `2.X Normative Answer` | Expert-defined correct answer used for scoring |
| `2.X Accuracy` | Numeric accuracy score (0–1 scale) assigned by annotator |

**Topics covered (Q2.1–Q2.17):**

| Question | Topic |
|----------|-------|
| 2.1 | How COVID-19 spreads |
| 2.2 | Transmission via talking without a mask |
| 2.3 | Incubation period |
| 2.4 | Common symptoms |
| 2.5 | Asymptomatic cases |
| 2.6 | When to seek medical attention |
| 2.7.1 | Known protection measures |
| 2.7.2 | Additional protection measures |
| 2.8 | When to wear a mask |
| 2.9 | Which parts of the face a mask should cover |
| 2.10 | How masks prevent COVID-19 |
| 2.11 | Reusability of masks |
| 2.12 | Correct hand hygiene statements |
| 2.13 | Safe social distancing |
| 2.14 | High-risk groups |
| 2.15 | Asymptomatic infection (Ecuador only) |
| 2.16 | What the COVID-19 vaccine is |
| 2.17 | Reasons to get vaccinated |

#### Section 2.18–2.23 — Vaccination Experience

| Column | Description |
|--------|-------------|
| `2.18` | Whether people don't want to get vaccinated |
| `2.19` | Reasons for vaccine hesitancy |
| `2.20` | Whether participant has been vaccinated |
| `2.21` | Number of doses received |
| `2.22` | Post-vaccination discomfort |
| `2.23` | Would recommend vaccination to family |
| `2.23.1` | Reasons for/against recommending vaccination |

#### Summary Scores

| Column | Description |
|--------|-------------|
| `right answers` / `right.answers` | Total number of correct answers per participant |
| `Sfalse` *(Ecuador only)* | Total number of incorrect answers |

---

### Country-Specific Notes

**Ecuador (`Annotator1_Ecuador_Annotations.xlsx`)**
- Sheet name: `Form Responses 1`
- Includes a `Sfalse` column (count of incorrect answers)
- Question 2.15 on asymptomatic infection is present as a separate item
- Information source columns use snake_case names (e.g., `social_networks`, `posters_announcments`)

**Peru (`Annotator1_Peru_Annotations.xlsx`)**
- Sheet name: `English Only`
- Includes computed categorical columns with Excel formulas (e.g., `Gender_cat`, `Age_cat_num`, `Spoken.languages_num`, `Main_lang_num`)
- Question 2.15 is not present as a standalone item
- Information source columns use title case (e.g., `Social Media`, `Community Announcements`)

---

## Software Code

**`Project-COVID-survey.R`**
- R code for data analysis and visualization
- Performs logistic regression on COVID-19 knowledge outcomes
- Documented in English
- Requires: `openxlsx`, `ggplot2`, `scales`, `plyr`, `lessR`, `ggrepel`, `MASS`, `dplyr`, `sjPlot`

---

## License

All data, files, and code are licensed under a **Creative Commons Attribution 4.0 International (CC BY 4.0)** licence.
🔗 [https://creativecommons.org/licenses/by/4.0/](https://creativecommons.org/licenses/by/4.0/)

Anonymized data is available without access restrictions.

---

## Related Resources

- For another paper associated with this project and its research data, see: [https://github.com/mahmuduzzamanDE/ACLAmericaNLP](https://github.com/mahmuduzzamanDE/ACLAmericaNLP)
