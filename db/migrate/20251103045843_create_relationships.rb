class CreateRelationships < ActiveRecord::Migration[8.0]
  def change
    create_table :relationships do |t|
      t.integer :follower_id, null: false
      t.integer :following_id, null: false

      t.timestamps
    end

    # インデックスを追加して検索を高速化
    add_index :relationships, :follower_id
    add_index :relationships, :following_id
    add_index :relationships, [ :follower_id, :following_id ], unique: true # 重複フォロー防止

    # 外部キー制約 (FK) を追加 (データ整合性のため)
    # (userモデルが先に作られている前提)
    add_foreign_key :relationships, :users, column: :follower_id
    add_foreign_key :relationships, :users, column: :following_id
  end
end
