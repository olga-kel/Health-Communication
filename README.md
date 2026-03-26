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
    │   ├── Annotator1_Ecuador_Annotations.xlsx
    │   ├── Annotator2_Ecuador_Annotations.xlsx
    │   ├── Annotator3_Ecuador_Annotations.xlsx
    │   └── Annotator4_Ecuador_Annotations.xlsx
    └── peru/
        ├── Annotator1_Peru_Annotations.xlsx
        ├── Annotator2_Peru_Annotations.xlsx
        ├── Annotator3_Peru_Annotations.xlsx
        └── Annotator4_Peru_Annotations.xlsx
```

---

## Data

### Overview

The dataset consists of **8 annotated Excel files** — 4 per country — each representing an independent annotator's scoring of the same COVID-19 survey responses. This multi-annotator structure supports inter-annotator agreement analysis and robust annotation quality assessment.

#### Ecuador

| File | Sheet | Rows | Columns | Language |
|------|-------|------|---------|----------|
| `Annotator1_Ecuador_Annotations.xlsx` | Form Responses 1 | ~150 | 85 | English |
| `Annotator2_Ecuador_Annotations.xlsx` | English annotated | ~150 | 90 | English |
| `Annotator3_Ecuador_Annotations.xlsx` | English annotated | ~150 | 96 | English |
| `Annotator4_Ecuador_Annotations.xlsx` | Form Responses 1 | ~150 | 134 | Spanish + English |

#### Peru

| File | Sheet | Rows | Columns | Language |
|------|-------|------|---------|----------|
| `Annotator1_Peru_Annotations.xlsx` | English Only | ~150 | 86 | English |
| `Annotator2_Peru_Annotations.xlsx` | English annotated | ~150 | 84 | English |
| `Annotator3_Peru_Annotations.xlsx` | Spanish + English | ~150 | 93 | Spanish + English |
| `Annotator4_Peru_Annotations.xlsx` | Spanish + English | ~150 | 93 | Spanish + English |

Each row represents one participant. Answers and variable descriptions are in English and/or Spanish depending on the annotator; accuracy codes are in English.

---

### Column Structure

All files share the same general structure organized into four sections:

#### Section 1 — Participant Demographics

| Column | Description |
|--------|-------------|
| `Timestamp` | Date and time of survey submission |
| `Gender` / `1.1 gender` | Participant gender |
| `Gender_cat` | Numeric gender code (computed, some annotators) |
| `Age` / `1.2 age` | Age group category (A/B/C/D) |
| `Age_cat` / `Age_cat_num` | Numeric age category code (computed, some annotators) |
| `Profession` / `1.3 Work` | Occupation |
| `Education Level` / `1.4 education_levels` | Highest education level attained |
| `School_cat` / `education` | Numeric/categorical education code |
| `Spoken.languages` / `1.5 bilinguistic` | Language background (monolingual / bilingual indigenous) |
| `Spoken.languages_num` | Numeric language background code (computed, some annotators) |
| `Main_lang` / `1.6 First_Lang` | Primary language spoken |
| `Main_lang_num` | Numeric primary language code (computed, some annotators) |
| `1.7 Quechua Response` | Participant's response to a Quechua proficiency test question |
| `Urban_rural` / `1.8 Region` | Urban or rural location |

#### Section 1.9 — COVID-19 Information Sources

Binary columns (0 = not used, 1 = used) indicating which sources the participant used to get COVID-19 information:

`TV`, `Radio`, `Internet`, `Social Media` / `social_networks`, `Friends`, `Family` / `relatives`, `Health Centers` / `clinic`, `Central Government` / `central_government`, `Local Government` / `local_government`, `Community Announcements` / `posters_announcments`, `Everything`, `Others`, `Nothing`

#### Section 2 — COVID-19 Knowledge Questions (Q2.1–Q2.23)

Each knowledge question follows a triplet structure:

| Column Pattern | Description |
|----------------|-------------|
| `2.X <Question text>` | Participant's free-text response |
| `2.X Normative Answer` / `2.X Norm` | Expert-defined correct answer used for scoring |
| `2.X Accuracy` | Numeric accuracy score (0–1 scale) assigned by the annotator |

**Topics covered across questions 2.1–2.17:**

| Question | Topic |
|----------|-------|
| 2.1 | How COVID-19 spreads |
| 2.2 | Transmission without a mask |
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
| 2.15 | Asymptomatic infection (present in all Ecuador files and Peru Annotators 3 & 4) |
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

> **Note:** Ecuador Annotator 3 and Ecuador/Peru Annotator 4 include additional accuracy scores for the vaccination section (Q2.18–Q2.23), whereas Annotators 1 and 2 do not score these items.

#### Summary Scores

| Column | Description |
|--------|-------------|
| `right answers` / `right.answers` | Total number of correct answers per participant |
| `Sfalse` | Total number of incorrect answers (present in all Ecuador files and Peru Annotator 2) |

---

### Annotator-Specific Notes

#### Ecuador

**Annotator 1** (`Annotator1_Ecuador_Annotations.xlsx`)
- Sheet: `Form Responses 1`
- English-only column headers in original survey format
- Uses snake_case for info source columns (e.g., `social_networks`, `posters_announcments`)
- Includes `Sfalse` column

**Annotator 2** (`Annotator2_Ecuador_Annotations.xlsx`)
- Sheet: `English annotated`
- English-only column headers using title case
- Adds computed demographic columns: `Gender_cat`, `Age_cat_num`, `bilinguistic`, `Main_lang_num`
- Includes two normative answer columns for Q2.16: `2.16. Norm 1` and `2.16. Norm 2`
- Includes `right answers` and `Sfalse`

**Annotator 3** (`Annotator3_Ecuador_Annotations.xlsx`)
- Sheet: `English annotated`
- Same base structure as Annotator 2
- Most comprehensive annotation: adds accuracy scores for the full vaccination section (Q2.17–Q2.23)

**Annotator 4** (`Annotator4_Ecuador_Annotations.xlsx`)
- Sheet: `Form Responses 1`
- Largest file (134 columns) — bilingual format with Spanish original questions paired with English translations side by side
- Includes accuracy scores for all questions including the full vaccination section (Q2.18–Q2.23)
- Spanish column names follow original survey format (e.g., `1.1. género`, `edad`, `1.3. ocupación`)

#### Peru

**Annotator 1** (`Annotator1_Peru_Annotations.xlsx`)
- Sheet: `English Only`
- English-only column headers
- Includes computed Excel formula columns: `Gender_cat`, `Age_cat_num`, `Spoken.languages_num`, `Main_lang_num`
- Q2.15 (asymptomatic infection) is not present as a standalone item

**Annotator 2** (`Annotator2_Peru_Annotations.xlsx`)
- Sheet: `English annotated`
- English-only column headers
- Includes two normative answer columns for Q2.16: `2.16. Norm 1` and `2.16. Norm 2`
- Does not include accuracy scores for the vaccination section (Q2.17–Q2.23)

**Annotator 3** (`Annotator3_Peru_Annotations.xlsx`)
- Sheet: `Spanish + English`
- Bilingual format: Spanish original questions paired with English translations throughout
- Includes Q2.15 as a standalone item
- Does not include normative answer columns (raw responses only for most questions)

**Annotator 4** (`Annotator4_Peru_Annotations.xlsx`)
- Sheet: `Spanish + English`
- Identical structure to Annotator 3
- Bilingual Spanish/English columns throughout

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
