# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## About

`string_proc` is a Ruby gem that monkey-patches `String#to_proc`, enabling method chain calls on enumerable elements using `&` shorthand (e.g., `%i[one two].map(&'to_s.capitalize')`). The separator between methods defaults to `'.'` and is configurable via `String.proc_separator=`.

This is intentionally non-idiomatic Ruby, designed for REPL exploration and debugging — not production use.

## Commands

- **Run all checks (default):** `bundle exec rake` (runs specs then RuboCop)
- **Run tests only:** `bundle exec rspec`
- **Run a single test file:** `bundle exec rspec spec/string_proc_spec.rb`
- **Run a single test by line:** `bundle exec rspec spec/string_proc_spec.rb:23`
- **Lint:** `bundle exec rubocop`
- **Lint with autofix:** `bundle exec rubocop -A`
- **Coverage report:** `bundle exec rake coverage`

## Architecture

Single-file gem: all library code lives in `lib/string_proc.rb` (reopens `String` class). Tests are in `spec/string_proc_spec.rb`. RuboCop is configured with `rubocop-performance`, `rubocop-rake`, and `rubocop-rspec` plugins.

## Conventions

- All Ruby files use `# frozen_string_literal: true`
- RuboCop `NewCops: enable` — all new cops are opted into automatically
