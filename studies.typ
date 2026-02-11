#import "glossary.typ": *

= Studies

== Enhancing scenarios with interactive chatbots

The first DSR study aims to make interactive chatbots for cyber simulations more capable and realistic using deep learning and LLMs; and to upgrade it to handle more complex scenarios. This study follows a Design Science Research (DSR) methodology, focusing on the design and evaluation of an AI-driven solution as a research project. It shall be given capabilities that allow it to act as participants in exercises similar to table top role playing only with integration of real technology as well. It will also be used in LLM security exercises that involve manipulating AIs to get responses from the prompt. 

Work will be done to determine which LLM is most suitable to use. This will need to be based on criteria such as the quality of the output, the time it takes to generate responses, and the size and resource consumption of the model. In order to evaluate response quality metrics will be needed. Some of these can be existing benchmarks of LLMs, but for the purpose of this study there will also need to be metrics for this specific application. 

Some testing will be needed to compare the different LLMs that meet the resource criteria. This testing will cover a broad spectrum of model sizes and types, ranging from massive frontier models in the 1T parameter class down to highly optimized small language models around the 1B parameter mark. Testing across this range will help determine the performance-to-resource ratio necessary for various simulation types, from heavy-duty centralized servers to edge-based local deployments. Some candidate models for this include Qwen3 1.5B parameter, LFM 1.2B parameter, and Ministral 3 3B. It may also be worth exploring different quantized versions of the model, as quantization significantly reduces memory requirements at the cost of output quality. Model loading parameters such as context length will also need to be determined, as this can significantly effect both model performance and memory requirements. There are technologies such as Flash Attention and KV quantization that will also be considered.

Different models will have to be compared to determine which are the most suitable for the task at hand. This will involve looking at existing model benchmarks for things such as instruction following and technical accuracy. It will also involve testing and evaluating the models responses manually. Prompts used by the software will need to be determined as part of this evaluation.

For the purposes of this research area an existing chatbot will be used as a starting point; specifically hackerbot will be used.

Techniques like TransMLA, quantization, and fine tuning could be used to increase model speed and output quality. These may require further training on a GPU server or GPU cluster.

The high level stages for this study are broken down into the following practical work packages:

+ *Software Development and Integration:*
  - Refactor the existing Hackerbot codebase to support a modular backend, allowing for easy switching between different LLM providers (e.g., local Ollama/vLLM instances vs. remote APIs).
  - Implement a "role-play" engine that can inject scenario-specific context (narrative, technical environment, character traits) into the system prompt.
  - Develop integration points for real-time technical feedback, enabling the bot to acknowledge student actions within the simulation.

+ *Model Selection and Optimization:*
  - Benchmark a diverse range of models, from 1T parameter frontier models to 1B parameter mobile-optimized models, using technical cyber security datasets to assess base knowledge.
  - Test various quantization levels (4-bit, 8-bit) to find the "sweet spot" between inference speed and conversational fidelity.
  - Fine-tune a subset of models on technical dialogue datasets if base models fail to maintain character or technical accuracy.

+ *Evaluation and Testing:*
  - *Automated Evaluation:* Run a standardized set of "jailbreak" and "technical hint" prompts against different configurations to measure safety and helpfulness.
  - *Response Analysis:* Perform thematic analysis on the AI-generated responses themselves. This involves coding the output for technical accuracy, persona consistency, and pedagogical utility (e.g., whether the bot provides hints that lead to discovery vs. simply giving away the answer).
  - *Student Pilot:* Deploy the optimized system to a small group of students. Record technical logs (latency, error rates) and qualitative interactions.
  - *Comparative Analysis:* Use surveys and interviews to compare the new system against the legacy Hackerbot, focusing on immersion, realism, and educational impact.
  - *Thematic Analysis:* Code written student feedback to identify recurring themes in user experience and technical shortcomings.

The effectiveness of different prompt engineering techniques, context engineering techniques, and models will be performed by using the same set of prompts across multiple configurations of the system and comparing the quality of responses. The responses will be evaluated based on the criteria of technical accuracy and helpfulness. The effectiveness of jailbreak prompts will also be tested to determine how easily abused the system is by students with malicious intentions. The system must be useful in an educational context, so giving away too many answers would also be a problem and should be measured as well.

Once an optimal configuration has been found it can be tested on the students to compare its performance against the old hackerbot system. This will involve looking at student enjoyment, immersion, and frustration using quantitative and qualitative analysis techniques. This will involve getting students to say which system they preferred, rate the two systems, and give descriptive written answers on what they felt the strengths and weaknesses of the new system is compared to the old one. Statistical analysis can be used on binary and rating scale answers. Thematic analysis will be done on written answers.

=== DSR Iteration Cycles

This study follows an iterative DSR approach with three distinct cycles:

*Cycle 1: Baseline Implementation and Model Selection*
+ *Design & Build:* Refactor Hackerbot to support modular LLM backends. Integrate 3-5 candidate models (spanning 1B to 1T parameters) with standardized prompt templates. Implement basic role-play context injection.
+ *Demonstrate:* Deploy to sandboxed test environment. Generate responses to 50 pre-defined prompts covering technical hints, jailbreak attempts, and character consistency scenarios.
+ *Evaluate:* 
  - Automated metrics: Response latency, token usage, jailbreak success rate
  - Manual assessment: Technical accuracy (scored 1-5 by two cyber security educators), persona consistency (binary: maintained/broken)
  - Comparative analysis against legacy Hackerbot baseline
+ *Refinement Criteria:* Model selected if: latency less than 5s (95th percentile), jailbreak resistance greater than 80%, technical accuracy greater than 3.5/5
+ *Expected Duration:* Progress already under way. Could potentially be finished in 4 weeks infrastructure and personal workload permitting.

*Cycle 2: Prompt and Context Optimization*
+ *Design & Build:* Using the best-performing model from Cycle 1, develop advanced prompt engineering techniques including few-shot examples, chain-of-thought reasoning, and dynamic context injection based on student progress.
+ *Demonstrate:* Test refined prompts against expanded scenario set (100 prompts) covering edge cases identified in Cycle 1.
+ *Evaluate:*
  - A/B testing between baseline prompts (Cycle 1) and optimized prompts
  - Measure pedagogical effectiveness: hint quality (leads to discovery vs. gives answer away), scored by expert panel
  - Assess reduction in hallucinations and off-character responses
+ *Refinement Criteria:* Proceed if pedagogical effectiveness improves by at least 20% and hallucination rate decreases by at least 30%
+ *Expected Duration:* 3-4 weeks

*Cycle 3: Student Pilot and Final Refinement*
+ *Design & Build:* Deploy optimized system to production-like environment. Implement logging and analytics pipeline to capture student interactions.
+ *Demonstrate:* Run pilot with 20-30 students across two different cyber security scenarios. Students interact with both legacy and new Hackerbot (randomized order to control for learning effects).
+ *Evaluate:*
  - Quantitative: System Usability Scale (SUS), immersion questionnaire (5-point Likert), paired t-tests for preference
  - Qualitative: Semi-structured interviews (n=10), thematic analysis of open-ended survey responses
  - Technical logs: actual latency in student environment, error rates, conversation length
+ *Refinement Criteria:* Success if SUS score greater than 70, immersion score significantly higher than legacy (p less than 0.05), and greater than 60% student preference for new system
+ *Iteration Decision:* If success criteria not met, return to Cycle 2 for prompt refinement based on student feedback themes. Maximum 2 additional iterations before re-evaluating model selection.
+ *Expected Duration:* 6-8 weeks (including recruitment and analysis)

*Stop Conditions:*
- Success: All Cycle 3 criteria met, system ready for broader deployment
- Partial Success: Technical performance adequate but student preference mixed → document limitations, deploy with options for both systems
- Failure: Fundamental model limitations identified → return to Cycle 1 with different model architecture or abandon LLM approach for specific scenario types

== Scenario Generation

=== Generating narrative content and instructions

#acrshort("llm")s and image generation models will be used to create realistic companies, characters, names, and stories called narrative content for the randomized scenarios being generated. As part of this the models will need to be fed a precise prompt along with details about the lab. Additionally the language model might be used to generate prompts and characters for the hackerbot model to follow when interacting with the student.

This will require a system to be designed and implemented. As part of the design phase the working of SecGen will be analyzed in detail so that extensions can be built to work with the existing systems. In particular the new components aim to be capable of generating parts of scenario files which are currently set statically and manually. This will involve adding additional functions to the parts of the system that take scenario files and turn them into built scenarios, or it may involve generating scenario files before they are processed by the current system.

==== DSR Iteration Cycles for Narrative Generation

*Cycle 1: Architecture Design and Proof of Concept*
+ *Problem Identification:* Current SecGen scenarios use static narrative content, reducing realism and replayability. Manual creation is time-consuming and limits scenario diversity.
+ *Design & Build:* 
  - Analyze SecGen scenario file structure to identify narrative insertion points (company names, character backgrounds, mission briefings)
  - Develop LLM integration module that accepts scenario metadata and generates contextually appropriate narrative elements
  - Create initial prompt templates for 3 narrative types: company profiles, character personas, mission backstories
+ *Demonstrate:* Generate 30 narrative sets (10 per type) for existing scenario templates
+ *Evaluate:*
  - Expert review by 3 cyber security educators rating coherence (1-5), realism (1-5), and appropriateness (1-5)
  - Automated checks: consistency (no contradicting details within a set), completeness (all required fields populated)
  - Acceptance threshold: Mean score greater than 3.5/5 across all dimensions
+ *Expected Duration:* 3-4 weeks

*Cycle 2: Prompt Refinement and Cross-Element Consistency*
+ *Design & Build:* Based on Cycle 1 feedback, refine prompts to address common issues (e.g., anachronisms, technical inaccuracies, inconsistent tone). Implement consistency checking to ensure narrative elements cohere (character roles align with company structure, mission difficulty matches student level).
+ *Demonstrate:* Generate 50 complete scenario narratives with all elements integrated
+ *Evaluate:*
  - Same expert panel rates holistic scenario quality
  - Automated consistency validation checks cross-element coherence
  - Compare generation time and token costs against Cycle 1
+ *Refinement Criteria:* Proceed if quality scores improve by at least 15% and consistency checks pass rate greater than 90%
+ *Expected Duration:* 2-3 weeks

*Cycle 3: Image Generation Integration and Student Validation*
+ *Design & Build:* Integrate image generation models to create visual assets (company logos, character portraits, location images). Ensure visual consistency with narrative tone.
+ *Demonstrate:* Generate 20 complete scenarios with both narrative and visual content. Deploy to student testing environment.
+ *Evaluate:*
  - Student survey (n=30-40): immersion rating, realism perception, engagement (compared to static baseline scenarios)
  - Qualitative feedback: open-ended questions about what enhanced/detracted from experience
  - Thematic analysis of student feedback coded by two researchers (inter-rater reliability κ>0.75)
+ *Success Criteria:* Immersion scores significantly higher than baseline (p less than 0.05, Cohen's d greater than 0.5), no systematic complaints about narrative quality
+ *Iteration Decision:* If students report specific recurring issues (e.g., "characters feel generic"), return to Cycle 2 for targeted prompt refinement
+ *Expected Duration:* 5-6 weeks

*Stop Conditions:*
- Success: Student validation shows significant improvement, system integrated into SecGen production
- Iterative refinement: Up to 2 additional cycles if specific fixable issues identified
- Pivot: If fundamental LLM limitations prevent coherent narrative generation, explore hybrid approach (LLM-assisted human authoring) or template-based generation with LLM variation

=== Malware generation and obfuscation

The plan here is to use uncensored #acrshort("llm")s to create randomized malware for students to study. This is done through two techniques: one is to take existing working malware and use #acrshort("llm") to obscure it's source code by rewriting it. The other is to generate novel malware using the #acrshort("llm")s coding capabilities. In order to do this MCP servers may be used to provide additional documentation to the AI, along with using agentic techniques to help it write, debug, and update the code. This could be implemented using existing coding software such as OpenCode. Part of this process will involve testing the malware to make sure it works. This could involve automated and/or manual tests. Generating malware for students to analyze using #acrshort("llm")s is not something that has been done at scale and documented before.

The study will be structured into the following work packages:

+ *Artifact Design and Agentic Workflow:*
  - Develop a multi-agent system (e.g., using a "Coder" and a "Reviewer" agent) to handle the iterative process of malware generation, compilation, and debugging.
  - Implement MCP (Model Context Protocol) servers to provide the agents with access to secure coding documentation, malware repositories (for obfuscation reference), and local compilers.
  - Design specialized prompt templates that leverage few-shot learning with known malware samples to guide the generation of novel variants.

+ *Technical Implementation and Obfuscation:*
  - Build a pipeline for automated source-code obfuscation where an LLM rewrites existing functional code to bypass simple signature-based detection while maintaining original logic.
  - Integrate agentic feedback loops where the system attempts to compile the generated code and passes error logs back to the LLM for automated fixing.

+ *Evaluation and Comparative Analysis:*
  - *Functional Validation:* Perform automated execution testing in a sandboxed environment to ensure the generated malware fulfills its technical requirements without crashing or exceeding intended scope.
  - *Analysis Difficulty Assessment:* Subject the generated samples (both novel and obfuscated) to static and dynamic analysis. Measure the time and complexity required for a human or automated tool to identify the malware's core functionality.
  - *Thematic Analysis of Code:* Analyze the generated source code for patterns in how the LLM approaches obfuscation and logic implementation. Compare these patterns against known human-written malware to identify unique AI "fingerprints" or innovative techniques.
  - *Resource and Cost Analysis:* Measure the token usage, compute time, and success rate of the agentic workflow across different model sizes (1B to 1T parameters) to determine the most efficient configuration for large-scale scenario generation.

The quality of the output from the two approaches will need to be compared, along with the resources and costs involved in generating the malware samples using these approaches. In order to determine the quality multiple samples must be generated using the two approaches and then they will need to tested both to determine their functionality and to look at how easily they can be disassembled. The goal here is to produce samples which are challenging enough for the students without being too challenging, and also fulfil the functions of actual malware without being a threat the systems hosting the malware analysis challenges.

==== DSR Iteration Cycles for Malware Generation

*Cycle 1: Single-Agent Generation and Functional Validation*
+ *Problem Identification:* Static malware samples become familiar to students, reducing learning effectiveness. Manual creation/obfuscation is labor-intensive and doesn't scale.
+ *Design & Build:*
  - Implement basic agentic workflow with single LLM agent for code generation
  - Test both approaches: (A) Novel generation from specification, (B) Obfuscation of existing samples
  - Create sandboxed testing environment with automated compilation and execution checks
  - Start with simple malware types: reverse shell, keylogger, file encryptor
+ *Demonstrate:* Generate 20 samples (10 novel, 10 obfuscated) across 3 malware categories
+ *Evaluate:*
  - *Functionality:* Compilation success rate, runtime stability (no crashes), correct behavior (achieves stated malicious function)
  - *Resource metrics:* Generation time, token usage, number of debugging iterations required
  - *Baseline comparison:* Compare against manual obfuscation time (assumed ~2 hours per sample)
  - *Success threshold:* At least 70% functional on first attempt, at least 90% after automated debugging
+ *Expected Duration:* 4-5 weeks

*Cycle 2: Multi-Agent System and Obfuscation Quality*
+ *Design & Build:* 
  - Implement multi-agent system: Coder agent, Reviewer agent (checks code quality), Debugger agent (fixes compilation errors)
  - Integrate MCP servers providing malware pattern documentation and obfuscation technique references
  - Enhance obfuscation with specific techniques: control flow flattening, string encryption, dead code insertion
+ *Demonstrate:* Generate 40 samples (20 novel, 20 obfuscated) with increased complexity (polymorphic behavior)
+ *Evaluate:*
  - *Functional metrics:* Same as Cycle 1, targeting at least 85% first-attempt success
  - *Obfuscation effectiveness:* Submit samples to 3 static analysis tools (Ghidra, IDA Free, VirusTotal). Measure deobfuscation time for expert analyst (n=2 analysts per sample)
  - *Pedagogical appropriateness:* Expert panel (3 malware analysis educators) rates difficulty level (beginner/intermediate/advanced) and learning value
  - *Comparative analysis:* Novel vs. obfuscated approach - which produces more pedagogically valuable samples?
+ *Refinement Criteria:* Proceed if obfuscation delays analysis by at least 30 minutes, samples rated as pedagogically appropriate by at least 2/3 experts
+ *Expected Duration:* 4-5 weeks

*Cycle 3: Difficulty Calibration and Student Validation*
+ *Design & Build:* 
  - Implement difficulty parameterization (beginner samples with minimal obfuscation, advanced with heavy obfuscation)
  - Create automated grading system that checks student analysis reports against ground-truth behavior
  - Generate diverse sample set: 30 samples across 3 difficulty levels
+ *Demonstrate:* Deploy to malware analysis lab with 25-35 students. Each student analyzes 3 samples (1 per difficulty level, mix of AI-generated and traditional samples, blinded)
+ *Evaluate:*
  - *Student performance:* Analysis accuracy, time to complete, difficulty ratings
  - *Engagement:* Post-lab survey on sample variety and realism
  - *Comparative analysis:* No significant difference in learning outcomes between AI-generated and traditional samples (equivalence testing), but increased variety appreciation
  - *Cost analysis:* Total time/resource cost for generating 30 samples vs. manual creation/curation
+ *Success Criteria:* 
  - Learning outcomes equivalent or better (non-inferiority margin: -5% on accuracy)
  - Student ratings indicate samples are realistic and appropriately challenging (mean greater than 3.5/5)
  - Generation cost less than 30% of manual approach
+ *Iteration Decision:* If difficulty calibration is off (too easy/hard), return to Cycle 2 to adjust obfuscation parameters. If fundamental quality issues, revisit model selection and agentic architecture.
+ *Expected Duration:* 6-8 weeks

*Stop Conditions:*
- Success: All validation criteria met, system ready for production use in malware analysis courses
- Conditional success: One approach (novel OR obfuscation) works well → focus on successful approach, document limitations of the other
- Failure: Samples consistently non-functional or trivially analyzable → investigate hybrid approach (AI-assisted human creation) or focus on other generation tasks

=== Generating insecure software and system configurations

Along with the ability to create software LLMs can be used to produce #acrfull("iac") files and commands used to configure a system. The idea here is to use an #acrshort("llm") to generate part or all of a lab including the vulnerable software used or the insecure configuration. This would allow for novel insecure labs to be generated without needing extensive configuration with XML or complicated software for randomization. It would allow for a greater variety of labs and challenges to be generated than would otherwise be possible while reducing the amount of time spent by staff on developing new labs.

This part is likely to require the use of advanced frontier models and/or fine-tuned models for this specific purpose. As part of this process the labs generated will need to be tested either automatically or manually to make sure they are both built correctly and are indeed vulnerable. Part of this could involve asking the model to generate a solution script designed to exploit the vulnerability in the lab and retrieve any flags therein. An automated testing system could then use this solution on an instance of the generated lab to ensure it is vulnerable. If the lab is found to not be solvable by the script then the model could be prompted to fix the lab, or a human signalled for manual intervention. This could involve a separate LLM agent configured specifically for debugging broken labs. These different approaches will need to be tested, evaluated, and refined before being compared.

==== DSR Iteration Cycles for Insecure Code Generation

*Cycle 1: Single Vulnerability Type and Exploit Validation*
+ *Problem Identification:* Creating diverse vulnerable applications manually is time-intensive and limits scenario variety. Existing vulnerable apps (WebGoat, DVWA) become overly familiar to students.
+ *Design & Build:*
  - Focus on one well-defined vulnerability class: SQL injection in web applications
  - Develop LLM prompting strategy to generate vulnerable PHP/Python web apps with intentional SQLi flaws
  - Implement dual-agent system: Generator creates vulnerable code, Exploiter creates proof-of-concept exploit script
  - Build automated testing pipeline: deploy generated app in Docker, run exploit script, verify flag capture
+ *Demonstrate:* Generate 15 vulnerable web applications with varying SQLi contexts (login forms, search functions, user profiles)
+ *Evaluate:*
  - *Buildability:* Docker build success rate, application starts without crashes (target: at least 90%)
  - *Exploitability:* Automated exploit success rate (target: at least 80%)
  - *Vulnerability correctness:* Manual verification by security expert that vulnerability matches intended type and is realistic
  - *Difficulty assessment:* Expert panel rates whether vulnerability difficulty is appropriate for target student level (undergraduate cyber security course)
+ *Refinement Criteria:* Proceed if buildability and exploitability thresholds met
+ *Expected Duration:* 5-6 weeks

*Cycle 2: Multi-Vulnerability and Infrastructure-as-Code Generation*
+ *Design & Build:*
  - Expand to 3 additional vulnerability types: XSS, insecure deserialization, path traversal
  - Implement IaC generation: LLM creates Terraform/Ansible configurations with intentional security misconfigurations (open S3 buckets, overly permissive firewall rules)
  - Develop Debugger agent that analyzes failed builds/exploits and attempts repairs
  - Create validation suite that checks for unintended vulnerabilities (security scanning with OWASP ZAP)
+ *Demonstrate:* Generate 30 labs: 20 web app vulnerabilities (5 per type), 10 IaC misconfigurations
+ *Evaluate:*
  - *Technical metrics:* Same as Cycle 1, plus deployment success rate for IaC (target: at least 85%)
  - *Unintended vulnerabilities:* Security scan to ensure no critical unintended flaws (would confuse students)
  - *Debugger effectiveness:* Percentage of failed builds/exploits recovered by Debugger agent vs. requiring human intervention
  - *Diversity assessment:* Code similarity analysis to ensure generated samples are sufficiently distinct (cosine similarity less than 0.7)
+ *Refinement Criteria:* 
  - Debugger recovers at least 60% of failures
  - No more than 10% of samples have critical unintended vulnerabilities
  - Diversity threshold met
+ *Iteration Decision:* If specific vulnerability types consistently fail, focus on successful types and iterate separately on problematic ones
+ *Expected Duration:* 5-7 weeks

*Cycle 3: Student Learning Validation and Cost-Effectiveness*
+ *Design & Build:*
  - Generate complete lab set for one course module: 25 labs across 4 vulnerability types, including instructions and learning objectives
  - Implement difficulty progression (scaffolded learning from simple to complex)
  - Create instructor dashboard showing generated lab metadata and solutions
+ *Demonstrate:* Deploy to live course with 30-40 students. Split design: 50% students get AI-generated labs, 50% get traditional hand-crafted labs (randomized assignment)
+ *Evaluate:*
  - *Learning outcomes:* Compare student performance on post-lab assessments between groups (t-test, equivalence testing)
  - *Student experience:* Survey on lab quality, clarity, realism (both groups)
  - *Instructor experience:* Interview with course instructor on lab variety, preparation time saved
  - *Cost analysis:* 
    - Time to generate 25 labs (LLM approach) vs. estimated manual creation time
    - Computational costs (API calls, infrastructure)
    - Instructor review/fixing time for AI-generated labs
+ *Success Criteria:*
  - Learning outcomes equivalent or better (non-inferiority margin: -5% on assessment scores)
  - Total approach (generation + review) costs less than 50% of manual creation time
  - Instructor willing to adopt for future course iterations
+ *Iteration Decision:* If learning outcomes equivalent but students report quality issues, return to Cycle 2 for quality refinement. If outcomes worse, investigate pedagogical issues with AI-generated content.
+ *Expected Duration:* 8-10 weeks (full semester integration)

*Stop Conditions:*
- Success: Learning equivalence demonstrated, cost savings achieved, instructor adoption → scale to additional vulnerability types and courses
- Partial success: Works for some vulnerability types but not others → document scope limitations, use hybrid approach
- Failure: Consistently generates non-working or pedagogically inappropriate labs → explore AI-assisted manual creation (LLM suggests vulnerabilities, human implements) or abandon automated generation for this application
