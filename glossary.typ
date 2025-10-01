// Acronym definitions for the document
// Simple approach without state management

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

// Function to display full form with short form in parentheses
#let acrfull(key) = {
  if key in acronyms {
    let (short, full) = acronyms.at(key)
    text[#full (#short)]
  } else {
    text[Unknown acronym: #key]
  }
}

// Function to display short form only
#let acrshort(key) = {
  if key in acronyms {
    let (short, full) = acronyms.at(key)
    text[#short]
  } else {
    text[Unknown acronym: #key]
  }
}

// Function to display full form only
#let acrlong(key) = {
  if key in acronyms {
    let (short, full) = acronyms.at(key)
    text[#full]
  } else {
    text[Unknown acronym: #key]
  }
}

// Function to generate complete glossary of all defined acronyms
#let printglossary() = {
  heading(level: 1)[Acronyms]
  for key in acronyms.keys().sorted() {
    let (short, full) = acronyms.at(key)
    par[#short: #full]
  }
}

// Alias for consistency with previous version
#let acronym = acrfull
