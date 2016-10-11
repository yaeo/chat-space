## users table
add_index :users, :name

has_many :messages    
has_many :members  
has_many :groups, through: :members

| name | password  | email  |
| :------------- | :------------- | :------------- |
| null: flase    | null: flase    | null: flase, unique: true     |


## groups table
has_many :members  
has_many :users, through: :members

| name |
| :------------- |
| null: flase    |

## members table
add_index :members, [:user_id, group_id]

belongs_to :user  
belongs_to :group

| user_id | group_id  |
| :------------- | :------------- |
| null: flase    | null: flase    |

## messages table
add_index :members, [:user_id]  
add_index :members, [:group_id]  

belongs_to :user  
belongs_to :group  

| user_id | group_id  | body  | image_url  |
| :------------- | :------------- | :------------- | :------------- |
| null: flase    | null: flase    | null: flase    |    file_url    |
