# README

#テーブル設計

##usersテーブル
| Column              | Type     | Options            | 説明             |
| ------------------- | -------- | ------------------ | -------------- |
| id                  | bigint   | PK, AUTO INCREMENT | ユーザーID         |
| name                | string   | NOT NULL           | 名前             |
| email               | string   | NOT NULL, UNIQUE   | メールアドレス（ログイン用） |
| encrypted\_password | string   | NOT NULL           | パスワード          |
| is\_admin           | boolean  | default: false     | 管理者フラグ         |
| created\_at         | datetime | NOT NULL           | 作成日時           |
| updated\_at         | datetime | NOT NULL           | 更新日時           |

##studentsテーブル
| Column      | Type     | Options            | 説明                  |
| ----------- | -------- | ------------------ | ------------------- |
| id          | bigint   | PK, AUTO INCREMENT | 生徒ID                |
| user\_id    | bigint   | FK, NOT NULL       | 保護者ユーザーID（users.id） |
| name        | string   | NOT NULL           | 生徒の名前               |
| created\_at | datetime | NOT NULL           | 作成日時                |
| updated\_at | datetime | NOT NULL           | 更新日時                |

##ticketsテーブル
| Column          | Type     | Options            | 説明                |
| --------------- | -------- | ------------------ | ----------------- |
| id              | bigint   | PK, AUTO INCREMENT | チケット利用ID          |
| student\_id     | bigint   | FK, NOT NULL       | 生徒ID（students.id） |
| used\_count     | integer  | NOT NULL           | 使用枚数              |
| granted\_points | integer  | NOT NULL           | 付与ポイント            |
| created\_at     | datetime | NOT NULL           | 作成日時              |

##pointsテーブル
| Column         | Type     | Options            | 説明                  |
| -------------- | -------- | ------------------ | ------------------- |
| id             | bigint   | PK, AUTO INCREMENT | ポイント履歴ID            |
| student\_id    | bigint   | FK, NOT NULL       | 生徒ID                |
| change\_amount | integer  | NOT NULL           | 増減ポイント（+付与 / -消費）   |
| reason         | string   | NULL               | 理由（例: チケット利用, 商品交換） |
| created\_at    | datetime | NOT NULL           | 発生日                 |

##productsテーブル
| Column           | Type     | Options              | 説明     |
| ---------------- | -------- | -------------------- | ------ |
| id               | bigint   | PK, AUTO INCREMENT   | 商品ID   |
| name             | string   | NOT NULL             | 商品名    |
| required\_points | integer  | NOT NULL             | 必要ポイント |
| stock            | integer  | NOT NULL, default: 0 | 在庫数    |
| created\_at      | datetime | NOT NULL             | 作成日時   |

##exchangesテーブル
| Column      | Type     | Options            | 説明                                    |
| ----------- | -------- | ------------------ | ---------------------------------       |
| id          | bigint   | PK, AUTO INCREMENT | 交換申請ID                              |
| student\_id | bigint   | FK, NOT NULL       | 生徒ID                                  |
| product\_id | bigint   | FK, NOT NULL       | 商品ID                              |
| status      | string   | default: "pending" | 申請状況（pending, approved, rejected） |
| created\_at | datetime | NOT NULL           | 申請日時                              |
| updated\_at | datetime | NOT NULL           | 更新日時                              |





### Association