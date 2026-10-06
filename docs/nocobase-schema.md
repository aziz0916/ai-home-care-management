# NocoBase Schema

本文件記錄 MVP 所需的核心 Collections。欄位名稱須與 Flutter App 及 n8n 工作流程一致。

## Clients (`clients`)

| Field | Type | Required | Notes |
| --- | --- | --- | --- |
| `full_name` | Single line text | Yes | 虛構個案姓名 |

## Service Records (`service_records`)

| Field | Type | Required | Notes |
| --- | --- | --- | --- |
| `client` | Many-to-one → `clients` | Yes | 所屬個案 |
| `service_date` | Date only | Yes | 服務日期 |
| `service_type` | Single line text | Yes | 服務類型 |
| `service_minutes` | Integer | Yes | 必須大於 0 |
| `notes` | Long text | No | 服務內容與備註 |
| `fall` | Checkbox / Boolean | Yes | 預設 `false` |
| `abnormal_description` | Long text | No | 無異常可留空 |
| `ai_summary` | Long text | No | 由 n8n 回寫 |
| `alert_sent` | Checkbox / Boolean | Yes | 預設 `false` |

## Automation access

建立僅供 n8n 使用的帳號及角色，例如 `n8n_automation`，並只授權登入、讀取服務紀錄，以及更新 `ai_summary` 和 `alert_sent`。

不要在工作流程 JSON 或 Repository 中保存此帳號的密碼或登入 Token。
