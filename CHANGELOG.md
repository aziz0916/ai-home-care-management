# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

### Added

- FlutterFlow mobile application source
- NocoBase and PostgreSQL Docker environment
- n8n workflow for Gemini summaries and LINE incident alerts
- Mailpit local email testing service
- Cloudflare Quick Tunnel for NocoBase development access
- Loading, empty, error and retry UI states
- Responsive layout verification at 320 px width

### Security

- Removed exported n8n pinned data and internal identifiers
- Replaced the Flutter hard-coded tunnel URL with `NOCOBASE_BASE_URL`
- Kept credentials and local secrets outside version control
