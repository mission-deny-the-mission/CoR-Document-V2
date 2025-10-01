// Acronym definitions for the document
// With proper label-based hyperlink system

#let acronyms = (
  "llm": ("LLM", "Large Language Model"),
  "ai": ("AI", "Artificial Intelligence"),
  "dl": ("DL", "Deep Learning"),
  "cot": ("CoT", "Chain of Thought"),
  "lora": ("LoRA", "Low Rank Adapter"),
  "qlora": ("QLoRA", "Quantized Low Rank Adapter"),
  "gpt": ("GPT", "Generative Pretrained Transformer"),
  "llama": ("LLaMA", "Large Language Model Meta AI"),
  "moe": ("MoE", "Mixture of Experts"),
  "rnn": ("RNN", "Recurrent Neural Network"),
  "lstm": ("LSTM", "Long Short Term Memory"),
  "mha": ("MHA", "Multi-Head Attention"),
  "mla": ("MLA", "Multi-Head Latent Attention"),
  "gqa": ("GQA", "Group Query Attention"),
  "mqa": ("MQA", "Multi-Query Attention"),
  "cuda": ("CUDA", "Compute Unified Device Architecture"),
  "opencl": ("OpenCL", "Open Compute Library"),
  "llada": ("LLaDA", "Large Language Diffusion with Masking"),
  "rag": ("RAG", "Retrieval Augmented Generation"),
  "cag": ("CAG", "Cache Augmented Generation"),
  "ann": ("ANN", "Artificial Neural Network"),
  "alice": ("ALICE", "Artificial Linguistic Internet Computer Entity"),
  "ner": ("NER", "Named Entity Recognition"),
  "mcp": ("MCP", "Model Context Protocol"),
  "lru": ("LRU", "Linear Recurrent Unit"),
  "aicef": ("AiCEF", "AI-assisted Cyber Exercise Content generation Framework"),
  "vae": ("VAE", "Variational Autoencoders"),
  "gan": ("GAN", "Generative Adversarial Networks"),
  "cpu": ("CPU", "Central Processing Unit"),
  "gpu": ("GPU", "Graphics Processing Unit"),
  "gpgpu": ("GPGPU", "General-purpose computing on graphics processing units"),
  "npu": ("NPU", "Neural Processing Unit"),
  "ram": ("RAM", "Random Access Memory"),
  "vram": ("VRAM", "Video Random Access Memory"),
  "hbm": ("HBM", "High Bandwidth Memory"),
  "api": ("API", "Application Programming Interface"),
  "ctf": ("CTF", "Capture The Flag"),
  "koth": ("KoTH", "King of The Hill"),
  "vm": ("VM", "Virtual Machine"),
  "irc": ("IRC", "Internet Relay Chat"),
  "dep": ("DEP", "Data Execution Prevention"),
  "aslr": ("ASLR", "Address Space Layout Randomisation"),
  "rop": ("ROP", "Return Oriented Programming"),
  "sql": ("SQL", "Structured Query Language"),
  "sqli": ("SQLi", "Structured Query Language injection"),
  "apg": ("APG", "Automated Problem Generation"),
  "iac": ("IaC", "Infrastructure as Code")
)

// Function to display full form with short form in parentheses (clickable)
#let acrfull(key) = {
  if key in acronyms {
    let (short, full) = acronyms.at(key)
    // Create a link that references the glossary section label
    link(
      <glossary-section>,
      text(fill: blue, [#full (#short)])
    )
  } else {
    text[Unknown acronym: #key]
  }
}

// Function to display short form only (clickable)
#let acrshort(key) = {
  if key in acronyms {
    let (short, full) = acronyms.at(key)
    // Create a link that references the glossary section label
    link(
      <glossary-section>,
      text(fill: blue, [#short])
    )
  } else {
    text[Unknown acronym: #key]
  }
}

// Function to display full form only (clickable)
#let acrlong(key) = {
  if key in acronyms {
    let (short, full) = acronyms.at(key)
    // Create a link that references the glossary section label
    link(
      <glossary-section>,
      text(fill: blue, [#full])
    )
  } else {
    text[Unknown acronym: #key]
  }
}

// Alias for consistency with previous version
#let acronym = acrfull

// Function to display full form without hyperlinks (clean version)
#let acrfull-plain(key) = {
  if key in acronyms {
    let (short, full) = acronyms.at(key)
    text[#full (#short)]
  } else {
    text[Unknown acronym: #key]
  }
}

// Function to display short form without hyperlinks (clean version)
#let acrshort-plain(key) = {
  if key in acronyms {
    let (short, full) = acronyms.at(key)
    text[#short]
  } else {
    text[Unknown acronym: #key]
  }
}

// Function to display long form without hyperlinks (clean version)
#let acrlong-plain(key) = {
  if key in acronyms {
    let (short, full) = acronyms.at(key)
    text[#full]
  } else {
    text[Unknown acronym: #key]
  }
}

// Plain alias for consistency with previous version (no hyperlinks)
#let acronym-plain = acrfull-plain

// Function to generate complete glossary with proper label anchor
#let printglossary() = {
  // Create the glossary section with a label for linking
  [
    = Acronyms <glossary-section>

    #for key in acronyms.keys().sorted() {
      let (short, full) = acronyms.at(key)
      par[#text(weight: "bold")[#short:] #full]
    }
  ]
}

// Alternative: Print glossary in two columns for better space utilization
#let printcompactglossary() = {
  // Create the glossary section with a label for linking
  [
    = Acronyms <glossary-section>

    // Display in two columns
    #let keys = acronyms.keys().sorted()
    #let mid = calc.ceil(keys.len() / 2)

    #columns(2)[
      #for i in range(mid) {
        let key = keys.at(i)
        let (short, full) = acronyms.at(key)
        par[#text(weight: "bold")[#short:] #full]
      }
    ][
      #for i in range(mid, keys.len()) {
        let key = keys.at(i)
        let (short, full) = acronyms.at(key)
        par[#text(weight: "bold")[#short:] #full]
      }
    ]
  ]
}

// Function to generate glossary without any hyperlinks or anchors (plain version)
#let printplainglossary() = {
  heading(level: 1)[Acronyms]

  for key in acronyms.keys().sorted() {
    let (short, full) = acronyms.at(key)
    par[#text(weight: "bold")[#short:] #full]
  }
}
