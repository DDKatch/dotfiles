---
description: Build a navigable knowledge graph from the current project or a given path. Usage: /graphify [path|url] [flags]
agent: general
---

The user invoked: /graphify $ARGUMENTS

Run the graphify pipeline on the current directory or the path/URL they provided. Use the `graphify` skill instructions (loaded via the `graphify` skill) to:

1. Determine the target path or URL from `$ARGUMENTS`. If none is given, use the current working directory `.`.
2. Execute the full graphify pipeline:
   - Step 1: Ensure `graphify` Python package is installed and resolve the interpreter.
   - Step 2: Detect files in the target path and summarize the corpus.
   - Step 2.5: Transcribe any video/audio files if present.
   - Step 3: Extract entities and relationships (AST for code, semantic for docs/images/papers).
   - Step 4: Build the graph, cluster it, analyze it, and write `graphify-out/graph.json` and `graphify-out/GRAPH_REPORT.md`.
   - Step 4.5: Run the graph health check diagnostic.
   - Step 5: Label communities and regenerate the report.
   - Step 6: Generate HTML visualization (and Obsidian vault only if `--obsidian` is requested).
   - Step 9: Save manifest, update cost tracker, clean up, and report.
3. Honor any flags passed in `$ARGUMENTS` such as `--mode deep`, `--update`, `--directed`, `--no-viz`, `--obsidian`, `--wiki`, `--neo4j`, `--svg`, `--graphml`, `--mcp`, `--watch`, etc.
4. After the pipeline finishes, report the outputs located in `graphify-out/` and paste the **God Nodes**, **Surprising Connections**, and **Suggested Questions** sections from `GRAPH_REPORT.md`.
5. Offer to explore the graph by running `/graphify query` on the most interesting suggested question.

Do not ask the user for an API key. If `GEMINI_API_KEY` or `GOOGLE_API_KEY` is not set, proceed using the host agent for semantic extraction and print the tip once.
