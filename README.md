# clictl Toolbox Example

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Use Template](https://img.shields.io/badge/Use_Template-blue?logo=github)](https://github.com/clictl/toolbox-example/generate)

A working example of a [clictl](https://clictl.dev) toolbox repository. Use this as a template for creating and publishing your own tools.

## Quick Start

1. Use this repo as a template on GitHub
2. Add `CLICTL_API_KEY` to your repo secrets (Settings > Secrets > Actions)
3. Add tool specs under `toolbox/`
4. Push. The GitHub Action syncs your tools automatically.

## Folder Structure

```
toolbox/                              # All tool specs live here
  .clictl.yaml                        # Toolbox config (namespace, branches)
  echo/
    echo.yaml                         # REST API spec
    0.9.yaml                          # Pinned older version
  example-docs/
    example-docs.yaml                 # Website scraping spec
  example-mcp/
    example-mcp.yaml                  # MCP server spec
  example-skill/
    example-skill.yaml                # Skill spec
  hello-world/
    hello-world.yaml                  # REST API spec
.github/workflows/sync-to-clictl.yml  # CI sync on push
```

**Key rules:**
- Specs live under `toolbox/{tool-name}/{tool-name}.yaml`
- Each tool gets its own directory
- Version pins are numbered files (e.g., `0.9.yaml`) alongside the main spec
- No letter-prefix subdirectories needed (the official toolbox uses them for scale, but your toolbox doesn't need to)

## Included Examples

| Tool | Protocol | Description |
|------|----------|-------------|
| echo | http | HTTP echo service for testing |
| example-docs | website | Example documentation site scraping |
| example-mcp | mcp | Weather data MCP server |
| example-skill | skill | Release notes generator with filesystem isolation |
| hello-world | http | Greeting API via httpbin |

## Adding a Tool

Create a spec at `toolbox/{name}/{name}.yaml`:

```yaml
spec: "1.0"
name: my-api
protocol: http
description: My custom API tool
version: "1.0"
category: data
tags: [api, custom]

server:
  url: https://api.example.com

auth:
  env: MY_API_KEY
  header: "Authorization: Bearer ${MY_API_KEY}"

actions:
  - name: get-data
    description: Fetch data from the API
    path: /data
    params:
      - name: query
        type: string
        required: true
```

Or scaffold one with the CLI:

```bash
clictl init my-api
```

## Syncing

### Automatic (CI)

The included GitHub Action runs `clictl toolbox sync` on every push to `main` that changes files in `toolbox/`.

### Manual

```bash
clictl toolbox sync
clictl toolbox sync --dry-run    # preview without pushing
```

## Configuration

`toolbox/.clictl.yaml` configures sync behavior. Place it inside the `toolbox/` folder alongside your specs:

```yaml
# namespace: "mycompany"   # optional publisher namespace
branches:
  - main
```

The workspace is determined by your API key (`CLICTL_API_KEY`), not the config file. The CLI auto-discovers specs in the same directory as `.clictl.yaml`.

## Links

- [Official Toolbox](https://github.com/clictl/toolbox) - 223+ curated tool specs
- [Spec Format](https://clictl.dev/spec) - Full spec reference
- [clictl.dev](https://clictl.dev) - Website

A [Soap Bucket LLC](https://www.soapbucket.org) project.
