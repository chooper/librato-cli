# librato-cli

[![Build Status](https://travis-ci.org/chooper/librato-cli.png?branch=master)](https://travis-ci.org/chooper/librato-cli)

**Work in progress: Nothing here actually works yet!**

Librato-CLI is a package to add a `librato` tool to your command line
for the purpose of fetching and displaying metrics stored in Librato.

## Installation

(gem not yet available)

```bash
$ gem install librato-cli
```

## Usage

```bash
$ LIBRATO_API_KEY=...   # protip:
$ LIBRATO_EMAIL=...     #         set these in your ~/.bashrc
$ librato ls-metrics <glob>
```

