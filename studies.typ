#import "glossary.typ": *

= Studies

== Enhancing scenarios with interactive chatbots

// Cliffe: "The first DSR study aims"....
// Cliffe: This section is mixing your high level research aims, with technical implementation aims. Really you shouldn't be mentioning SecGen/Hackerbot, config files etc, at this level. Start by describing the aims of this **DSR** study, and describe it first as a research/science project, rather than a software development project.
The first DSR study aims to make interactive chatbots for cyber simulations more capable and realistic using deep learning and LLMs; and to upgrade it to handle more complex scenarios. It shall be given capabilities that allow it to act as participants in exercises similar to table top role playing only with integration of real technology as well. It will also be used in LLM security exercises that involve manipulating AIs to get responses from the prompt. 

// Cliffe: Just describe what you are doing, rather than saying its "important".
Work will be done to determine which LLM is most suitable to use. This will need to be based on criteria such as the quality of the output, the time it takes to generate responses, and the size and resource consumption of the model. In order to evaluate response quality metrics will be needed. Some of these can be existing benchmarks of LLMs, but for the purpose of this study there will also need to be metrics for this specific application. 
// Cliffe: Don't say a study "may be needed" you need to clearly state what you are planning to do, plans can change, but you need to state your current plans clearly.
Some testing will be needed to compare the different LLMs that meet the resource criteria. Some candidate models for this include Qwen3 1.5B parameter, LFM 1.2B parameter, and Ministral 3 3B. It may also be worth exploring different quantized versions of the model, as quantization significantly reduces memory requirements at the cost of output quality. Model loading parameters such as context length will also need to be determined, as this can significantly effect both model performance and memory requirements. There are technologies such as Flash Attention and KV quantization that will also be considered.

// Cliffe: This is research rather than implemention, so move this up above the HB paragraph
Different models will have to be compared to determine which are the most suitable for the task at hand. This will involve looking at existing model benchmarks for things such as instruction following and technical accuracy. It will also involve testing and evaluating the models responses manually. Prompts used by the software will need to be determined as part of this evaluation.

// Cliffe: Make sure you don't mention Hackerbot before this point (except in the Literature Review, which should include it). Here you can mention implementation details, including Hackerbot. Move the introduction of Hackerbot to the lit rev, which should be positive about it (otherwise why build on it?) but also highlight gaps and opportunities.
For the purposes of this research area an existing chatbot will be used as a starting point; specifically hackerbot will be used.

Techniques like TransMLA, quantization, and fine tuning could be used to increase model speed and output quality. These may require further training on a GPU server or GPU cluster.

// Cliffe: This is too high level:
+ Develop software
+ Determine best model to use
+ Give software to students for them to test
+ Record any technical issues
+ Take surveys of their experience
+ Analyze results

// Cliffe: You actually need to describe the evaluation approach here, which is the 2nd half of this DSR study. What are you going to measure to answer your research questions?

The effectiveness of different prompt engineering techniques, context engineering techniques, and models will be performed by using the same set of prompts across multiple configurations of the system and comparing the quality of responses. The responses will be evaluated based on the criteria of technical accuracy and helpfulness. The effectiveness of jailbreak prompts will also be tested to determine how easily abused the system is by students with malicious intentions. The system must be useful in an educational context, so giving away too many answers would also be a problem and should be measured as well.

Once an optimal configuration has been found it can be tested on the students to compare it's performance against the old hackerbot system. This will involve looking at student enjoyment, immersion, and frustration using quantitative and qualitative analysis techniques. This will involve getting students to say which system they preferred, rate the two systems, and give descriptive written answers on what they felt the strengths and weaknesses of the new system is compared to the old one. Statistical analysis can be used on binary and rating scale answers. Thematic analysis will be done on written answers.

== Scenario Generation

=== Generating narrative content and instructions

// Cliffe: This needs re-framing. This doesn't describe a study -- this is a description of some development work you are planning. This needs to describe the details of what you are going to do to design and evaluate a solution using DSR
#acrshort("llm")s and image generation models will be used to create realistic companies, characters, names, and stories called narrative content for the randomized scenarios being generated. As part of this the models will need to be fed a precise prompt along with details about the lab. Additionally the language model might be used to generate prompts and characters for the hackerbot model to follow when interacting with the student.

This will require a system to be designed and implemented. As part of the design phase the working of SecGen will be analyzed in detail so that extensions can be built to work with the existing systems. In particular the new components aim to be capable of generating parts of scenario files which are currently set statically and manually. This will involve adding additional functions to the parts of the system that take scenario files and turn them into built scenarios, or it may involve generating scenario files before they are processed by the current system.

Once a system has been developed and tested, outputs will be gathered and there quality and appropriateness determined. Any shortcomings with the responses given by the system will be analyzed and the system will be tweaked to improve the quality of the output through methods such as changing the model selected or the prompt engineering and context engineering used. In this way the design and implementation of the system will be iterated on in accordance with the Design Science Research methodology.

Once a system has been designed, implemented, and iterated upon it will be tested on students to determine if it improved immersion, realism, and engagement. This will be done by surveys gathering quantitative and qualitative data.

=== Malware generation and obfuscation

// Cliffe: Again, this needs to describe the details of what you are going to do to design and evaluate a solution using DSR
The plan here is to use uncensored #acrshort("llm")s to create randomized malware for students to study. This is done through two techniques: one is to take existing working malware and use #acrshort("llm") to obscure it's source code by rewriting it. The other is to generate novel malware using the #acrshort("llm")s coding capabilities. In order to do this MCP servers may be used to provide additional documentation to the AI, along with using agentic techniques to help it write, debug, and update the code. This could be implemented using existing coding software such as OpenCode. Part of this process will involve testing the malware to make sure it works. This could involve automated and/or manual tests. Generating malware for students to analyze using #acrshort("llm")s is not something that has been done at scale and documented before.

The quality of the output from the two approaches will need to be compared, along with the resources and costs involved in generating the malware samples using these approaches. In order to determine the quality multiple samples must be generated using the two approaches and then they will need to tested both to determine their functionality and to look at how easily they can be disassembled. The goal here is to produce samples which are challenging enough for the students without being too challenging, and also fulfil the functions of actual malware without being a threat the systems hosting the malware analysis challenges.

Once a working systems has been designed and implemented, it's performance characteristics will need to be determined. This includes the amount of resources used by the system, time taken when generating malware, and any adverse qualities the produced samples have. This information will be used to iterate on the system either to reduce the time and resources needed to generate samples or to increase the quality of the samples generated.

There are many variables that can be adjusted here when iterating on the system. Model selection is one of the most important ones. Looking at context engineering techniques including feeding relevant documentation, examples, and code snippets to the system is also important.

=== Generating insecure software and system configurations

// Cliffe: Again, this needs to describe the details of what you are going to do to design and evaluate a solution using DSR
Along with the ability to create software LLMs can be used to produce #acrfull("iac") files and commands used to configure a system. The idea here is to use an #acrshort("llm") to generate part or all of a lab including the vulnerable software used or the insecure configuration. This would allow for novel insecure labs to be generated without needing extensive configuration with XML or complicated software for randomization. It would allow for a greater variety of labs and challenges to be generated than would otherwise be possible while reducing the amount of time spent by staff on developing new labs.

This part is likely to require the use of advanced frontier models and/or fine-tuned models for this specific purpose. As part of this process the labs generated will need to be tested either automatically or manually to make sure they are both built correctly and are indeed vulnerable. Part of this could involve asking the model to generate a solution script designed to exploit the vulnerability in the lab and retrieve any flags therein. An automated testing system could then use this solution on an instance of the generated lab to ensure it is vulnerable. If the lab is found to not be solvable by the script then the model could be prompted to fix the lab, or a human signalled for manual intervention. This could involve a separate LLM agent configured specifically for debugging broken labs. These different approaches will need to be tested, evaluated, and refined before being compared.

