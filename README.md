## users table
add_index :users, :name

| name | pass  | email  |
| :------------- | :------------- | :------------- |
| null: flase    | null: flase    | null: flase, unique: true     |


## groups table
| name |
| :------------- |
| null: flase    |

## members table
add_index :members, [:user_id, group_id]

| user_id | group_id  |
| :------------- | :------------- |
| null: flase    | null: flase    |

## messages table
add_index :members, [:user_id]
add_index :members, [:group_id]

| user_id | group_id  | body  | image_id  |
| :------------- | :------------- | :------------- | :------------- |
| null: flase    | null: flase    | null: flase    | null: flase    |

## images table
| url |
| :------------- |
| null: flase    |
