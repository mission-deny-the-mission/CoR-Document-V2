#import "glossary.typ": *
#import "literature-review.typ"

#set page(
  paper: "a4",
  margin: (left: 2.5cm, right: 2.5cm, top: 2.5cm, bottom: 2.5cm)
)

#set text(
  font: "New Computer Modern",
  size: 11pt
)

#set par(
  justify: true,
  first-line-indent: 1.2em
)

#set heading(numbering: "1.1")

#show link: set text(fill: blue)

#align(center)[
  #text(size: 20pt, weight: "bold")[
    Improving Realism and Immersion in Cyber‑Security Educational Scenarios through Generative AI
  ]

  #v(1em)

  #text(size: 14pt)[Harry Hall]

  #v(0.5em)

  #text(size: 12pt)[July - September 2025]
]

#v(2em)

#outline(
  title: "Table of Contents",
  indent: auto
)

#v(2em)

= Introduction

The increasing sophistication of cyber threats demands equally advanced training methodologies. Current cybersecurity education faces significant challenges in providing realistic, engaging scenarios that prepare students for real-world situations. Traditional training exercises often rely on static or predictable scenarios that fail to capture the dynamic nature of modern cyber threats.

Most current cybersecurity training exercises are based on static or heuristically randomized scenarios, limiting realism and learning engagement. In particular, the bots currently in use have limited conversational fidelity #cite(<schreuders_hackerbot_2018>). Narrative content is not always generated using AI, and even when it is generated this way the models and techniques are sometimes outdated for example using older models such as GPT-2 #cite(<zacharis_aicef_2023>). Senarios generated using current methods can also have low variety making them predictable.

A significant research gap exists in leveraging state-of-the-art generative AI models for comprehensive cybersecurity education. While some systems incorporate basic AI elements, none fully exploit the potential of modern large language models (LLMs) for dynamic scenario generation, realistic chatbot interactions, and automated vulnerability creation. This thesis addresses this gap by exploring how frontier open generative AI models can enhance realism and immersion in cybersecurity training.

The proposed PhD thesis will cover the uses of Generative AI models such as #acrfull("llm") and image generators in educational cybersecurity simulations including hacking challenges such as #acrfull("ctf") and #acrfull("koth"). This will include using #acrshort("llm")s to generate narrative content (thematic learning scenario content), provide realistic chatbots for students to interact with, and even generate randomized challenges such as unique malware for malware analysis challenges or randomly generated insecure systems and software.

= Aims and Objectives

== Aims:
Use AI to improve realism, immersion, and to assist learning

== Objectives:
+ Investigate how #acrshort("ai") models can interact with students during cyber security training scenarios
  + Setup and test chatbots acting as employees and threat actors in challenges
  + Test the ability of #acrshort("llm")s to give hints and tips without giving away complete answers
+ Explore the use of #acrshort("ai") in #acrfull("apg")
  + Explore using #acrshort("llm")s in sample malware generation for use in malware analysis classes
  + Explore using #acrshort("llm")s in generating insecure software and system configurations
  + Explore using #acrshort("llm")s and image generation models in creating narrative content

= Research Questions

== Hackerbot study
+ What architecture and techniques are the most effective for the educational chatbot powered by LLMs.
  + Is RAG, CAG, or fine tuning more effective for feeding #acrshort("LLM")s resources about cybersecurity
  + What sort of prompt engineering works best?
+ How can roleplaying personalities make education bots more effective
  + What kind of prompting techniques help with roleplaying?
  + Which models work best for roleplaying in cybersecurity scernarios?
+ Determine what is the most efficient and effective way to run an AI powered assistant
  + What kind of hardware resources are required to run the models locally?
  + Can inference be done scalably using only CPUs?
  + What size of model is needed for an AI bot for this kind of chatbot?
  + Which #acrshort("LLM")s are most effective?

== Malware generation and obfscuation study

+ What techniques are most effective at doing randomized malware generation for malware analysis labs?
+ To what extent can the malware generation be automated? Partly or fully?
+ How can #acrshort("LLM")s be used to obfscuate existing malware in ways that make it more complex to analyze?

#include "literature-review.typ"

= Methodology

This PhD is following the design science methodology for the production of artifacts and design knowledge. This will involve the production of several artifacts, some of which will be integrated into the existing Hacktivity and SecGen systems in use within the University (specifically the BEC school). Success will be measured through both technical criteria and student experience.

Design science methodology is a methodology involves the creation and evaluation of novel artifacts to solve problems. These artifacts can involve models, methods, systems, or processes. The artifacts must have been demonstrated to provide utility in the real world. The methodology uses an iterative process of design, construction, evaluation, and refinement. Because of this ongoing process of refinement there will not be a fixed number of studies defined at this stage. The studies will be further defined as part of the process of refining the design and implementation of the systems. The research outputs will be the design of the system, the research showing the usefulness of the design, and the created software artifacts themselves.

The software development cycle for this research will follow an agile approach, integrating with the design science methodology to ensure continuous improvement and adaptation. The development process will be organized into iterative sprints, each focusing on specific components of the AI-enhanced cybersecurity training system. Each sprint will include requirements analysis, design, implementation, testing, and deployment phases, allowing for rapid prototyping and frequent feedback incorporation from both technical stakeholders and end-users.

Version control using Git will be employed throughout the development lifecycle to track changes, facilitate collaboration, and maintain code quality. Regular code reviews and documentation updates will be conducted to maintain software quality and knowledge transfer.

Technical criteria include the functionality of the system, the associated costs and resource usage associated with using the #acrshort("ai")s. For scenario generation the time taken and success rate at generating scenarios and malware must be measured. For the chatbot studies responsiveness and generation speed in tokens per second must be measured. Responsivness to student queries is important for satisfaction of the students.

Student experience will be measured through surveys. Statistical and thematic analysis will be performed on the surveys to see how students felt about the new capabilities of the system. It must also be ensured that the chatbots do not give away information or answers that the students should not have.

#include "studies.typ"

= Project Feasibility and Resources

Generating narrative content should be more or less trivial for current machine learning algorithms. It's well within the capabilities of current LLMs.

Integrating AI into hackerbot is well under way. The main concerns are over resource consumption and how well smaller models are able to perform the tasks required. More thorough testing of small model capabilties is required. This is largely an infrastructure problem and won't get in the way of proving it to be possible. Small models capable of running on limited infrastructure such as Gemma 1B and LFM2 1.2B have been found, and initial tests on inference speed and output quality are positive.

Generating malware and obfuscating malware is more complicated. This requires the use of powerful #acrshort("llm")s that require lots of computational resources. The problem being that cloud hosting is made difficult by the nature of generating malware and potentially requiring uncensored models.

The feasibility of generating insecure software and system configurations is difficult to determine. It highly depends on the performance of frontier #acrshort("llm")s and surrounding tooling. Medium sized uncensored models are capable of generating code for malware, but it is unclear how similar this malware is to malware found in real cyber attacks. Techniques using agentic AI and AI agents will need to be tested and iterated upon.

= Training and development

If techniques such as fine tuning and TransMLA are to be used then training may be required. This includes learning about python frameworks such as PyTorch, TensorFlow, and Transformers. Training will also be needed in statistical and survey analysis. Particularly in determining statistical significance.

Training in malware analysis will also be necessary in order to have the skills to evaluate artificially generated malware.

#bibliography("combined-references.bib", style: "harvard-cite-them-right")
